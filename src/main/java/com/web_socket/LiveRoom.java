package com.web_socket;

import com.entity.Users;
import com.service.UserService;
import com.utils.CreateId;
import com.utils.PropertiesUtil;

import javax.websocket.Session;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

//直播间类
public class LiveRoom {
    //正在直播的房间映射表<romId,liveRoom>
    private static Map<Integer, LiveRoom> roomOpenMap = new ConcurrentHashMap<>();

    private String roomId;//直播间号
    private String liverName;//主播名字
    private String liverAvatar;//主播头像
    private boolean is_lived = false;//正在直播？ 应该把它设计成线程安全的。

    // 在线人数。应该把它设计成线程安全的。
    private int onlineCount = 0;
    //在线用户列表 id_name 映射
    private Map<String, String> id_map_name = new ConcurrentHashMap<>();
    //主播session(真正的视频提供者的标签页面)  应该把它设计成线程安全的。
    private Session liverSession;
    //房间内所有连接(没有视频提供者session)
    private Map<String, Session> sessions = new ConcurrentHashMap<>();
    // 用来存放每个客户端组，其中Key可以为用户标识 把相同用户不同session合并
    private Map<String, Set<Session>> SocketsToUserMap = new ConcurrentHashMap<>();

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getLiverName() {
        return liverName;
    }

    public void setLiverName(String liverName) {
        this.liverName = liverName;
    }

    public String getLiverAvatar() {
        return liverAvatar;
    }

    public void setLiverAvatar(String liverAvatar) {
        this.liverAvatar = liverAvatar;
    }

    public LiveRoom(Users liver) {
        this.roomId = CreateId.getNumZero(liver.getRoomId());
        this.liverName = liver.getUserName();
        this.liverAvatar = PropertiesUtil.getProperty("cos.server.http.prefix") + liver.getUserPicPath();
    }


    //判断一个房间是否已经被打开
    public static Boolean isOpenRoom(Integer roomId) {
        if (roomId == null || roomId <= 0) return false;
        return LiveRoom.roomOpenMap.containsKey(roomId);
    }

    //由房间号获取房间对象无论它是否已经打开
    public static LiveRoom getRoom(Integer roomId) {
        if (isOpenRoom(roomId)) {
            return LiveRoom.roomOpenMap.get(roomId);
        } else {
            if (roomId <= 0) {
                return null;
            }
            UserService userService = new UserService();
            Users liver = userService.getUserbyRoomId(roomId);//获取主播信息
            if (liver == null) {//房间不存在
                return null;
            }
            return new LiveRoom(liver);
        }

    }


    //验证房间所有者
    public static boolean isLiver(Integer roomId, Users user) {
        return (user != null && user.getRoomId().equals(roomId));
    }

    //激活房间(仅仅为力线程安全)
    private synchronized void activateRoom() {
        this.is_lived = true;
    }

    //由主播打开一个房间直播
    //把它加到roomOpenMap中
    //已经存在则启动失败
    public static Boolean openRoom(Users liver, Integer roomId, Session session) {
        if (!liver.getRoomId().equals(roomId)) {
            return false;
        }//房间与主播不符

        if (!isOpenRoom(roomId)) {
            LiveRoom liveRoom = new LiveRoom(liver);
            liveRoom.activateRoom();
            LiveRoom.roomOpenMap.put(roomId, liveRoom);
            liveRoom.setLiverSession(session);//设置将该连接设为主播
            return true;
        } else {
            return false;
        }
    }

    //关闭直播(房间)
    public synchronized LiveRoom closeRoom() {
        this.is_lived = false;
        this.is_lived = false;//关闭直播(标志)
        roomOpenMap.remove(this.roomId);
        System.out.println(roomId + "房间关闭");
        return this;
    }

    //获取直播状态
    public synchronized boolean isIs_lived() {
        return is_lived;
    }


    //进入房间
    public void inRoom(Session session, Users user_login) {
        if (user_login != null) {//已经登陆
            Set<Session> socketusergroup;
            if (this.getSocketsToUserMap().containsKey(user_login.getUserId())) {//该用户已经在该直播的在线列表中
                socketusergroup = this.getSocketsToUserMap().get(user_login.getUserId());
            } else {//该用户没有在该直播的在线列表中
                socketusergroup = new CopyOnWriteArraySet<Session>();
                this.getId_map_name().put(user_login.getUserId(), user_login.getUserName());//加入id_name 映射
                this.addOnlineCount(); // 在线数加1
            }

            //将本socket实例加入到该用户端组(更新SocketsToUserMap)
            socketusergroup.add(session);
            this.getSocketsToUserMap().put(user_login.getUserId(), socketusergroup); // 加入set中

        } else {// 游客(无登陆状态)
            this.addOnlineCount(); // 在线数加1
        }

        this.getSessions().put(session.getId(), session);//加入房间列表
    }

    //离开房间
    public void outRoom(Session session, Users user_login) {
        if (user_login != null) {// 登录状态
            Set<Session> socketusergroup = this.getSocketsToUserMap().get(user_login.getUserId());
            if(socketusergroup!=null)socketusergroup.remove(session);
            if (socketusergroup != null && socketusergroup.size() == 0) {// 关闭最后一个标签强制登出或刷新最后一个标签
                this.getSocketsToUserMap().remove(user_login.getUserId());
                id_map_name.remove(user_login.getUserId());//将该用户移除id_name 映射
                subOnlineCount(); // 在线数减1
                //              httpSession.invalidate();先不失效
            }
        } else {//游客模式
            subOnlineCount(); // 在线数减1
        }
    }


    public synchronized void addOnlineCount() {
        this.onlineCount++;
    }

    public synchronized void subOnlineCount() {
        this.onlineCount--;
    }


    public synchronized int getOnlineCount() {
        return onlineCount;
    }

    public Map<String, String> getId_map_name() {
        return id_map_name;
    }

    public synchronized Session getLiverSession() {
        return liverSession;
    }

    public synchronized void setLiverSession(Session liverSession) {
        this.liverSession = liverSession;
    }

    public Map<String, Session> getSessions() {
        return sessions;
    }

    public Map<String, Set<Session>> getSocketsToUserMap() {
        return SocketsToUserMap;
    }
}
