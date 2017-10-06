package com.web_socket;

import com.entity.Users;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

/**
 * Created by zc on 2016/12/7.
 */

@ServerEndpoint(value = "/websocket/live/{roomId}", configurator = GetHttpSessionConfigurator.class)
public class LiveWebSocket {
    private LiveRoom liveRoom;
    private Session session;
    private HttpSession httpSession;

    @OnOpen
    public void onOpen(@PathParam(value = "roomId") Integer roomId, Session session, EndpointConfig config) {
        httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        Users user_login = (Users) httpSession.getAttribute("user");
        this.session = session;
        liveRoom = LiveRoom.getRoom(roomId);//获取直播间对象
        if (liveRoom.isIs_lived()) {
            System.out.println("！！！主播已开启直播");
            liveRoom.inRoom(session, user_login);
            send_onlinlist();//发送在线人数
            System.out.println("有新连接加入！当前在线人数为" + liveRoom.getOnlineCount());
        } else {
            System.out.println("主播未开启直播！！！");
        }

    }

    @OnClose
    public void OnClose(@PathParam(value = "roomId") Integer roomId, Session session) {
        Users user_login = (Users) httpSession.getAttribute("user");
        if(liveRoom!=null){
            liveRoom.outRoom(session, user_login);//离开房间
            send_onlinlist();//发送在线人数
            liveRoom.getSessions().remove(session); // 从连接池中删除
            System.out.println("有一连接关闭！当前在线人数为" + liveRoom.getOnlineCount());
            //主播离开房间自动触发关闭房间事件
            if (liveRoom.getLiverSession() != null && session.getId().equals(liveRoom.getLiverSession().getId())) {
                live_close();
            }
        }

    }

    @OnMessage
    public void onMessage(@PathParam(value = "roomId") Integer roomId, String message, Session session) {
        System.out.println("来自客户端的消息:" + message);
        String to_session_id = (String) JSONObject.fromObject(message).get("session_id");
        Session to_session =null ;
        if(to_session_id!=null){
             to_session=liveRoom.getSessions().get(to_session_id);
        }

        Users user_login = (Users) httpSession.getAttribute("user");
        String type = (String) JSONObject.fromObject(message).get("type");
        String grop = (String) JSONObject.fromObject(message).get("group");


        if("rtc".equals(grop)){
            switch (type) {
                case "start_live"://主播启动直播
                    LiveRoom.openRoom(user_login, roomId, session);
                    liveRoom = LiveRoom.getRoom(roomId);//重置主播liveRomm对象
                    liveRoom.inRoom(session, user_login);
                    send_onlinlist();//发送在线人数
                    break;
                case "offer"://观众发起offer信令(发起加入房间请求)
                    if (liveRoom.isIs_lived()) {
                        message = get_addsessionid_json(message);//加上观众session_id
                        sendMessage_To(message, liveRoom.getLiverSession());//把观众的信令发给主播
                    }
                    break;
                case "answer"://主播应答信令(主播统一加入房间)
                    if (to_session_id != null) {
                        sendMessage_To(message, to_session);
                    }
                    break;
                case "ice_candidate":
                    if (liveRoom.getLiverSession() != null) {//加强判断没有也可
                        if (liveRoom.getLiverSession().getId().equals((session.getId()))) {//主播发送的
                            System.out.println(to_session_id);
                            if (to_session != null) {
                                sendMessage_To(message, to_session);
                            }
                        } else {//发给主播的
//                        System.out.println(session.getId() + "-------" + liverSession.getId());
                            String msg = get_addsessionid_json(message);//加上观众session_id
                            sendMessage_To(msg, liveRoom.getLiverSession());
                        }
                    }
                    break;
                case "live_close"://主播退出或关闭直播
                    live_close();
                    break;
                default:
                    System.out.println("state UNKONW");
                    break;
            }
        }else {

            if (JSONObject.fromObject(message).get("state") != null) {//解析状态码
                int state = (int) JSONObject.fromObject(message).get("state");

                switch (state) {
                    case 0://用户手动登陆
                        Users user = (Users) httpSession.getAttribute("user");
                        Set<Session> socketusergroup = new CopyOnWriteArraySet<Session>();
                        socketusergroup.add(session);
                        liveRoom.getSocketsToUserMap().put(user.getUserId(), socketusergroup); // 加入set中
                        liveRoom.getId_map_name().put(user.getUserId(), user.getUserName());//加入id_name 映射
                        System.out.println("标签数:" + socketusergroup.size());
                        send_onlinlist();//发送在线人数
                        break;
                    case 1://群发弹幕
                        qunfa(message,true);//群发弹幕
                        break;
                    case 2://用户下线
                        user_login = (Users) httpSession.getAttribute("user");
                        String logout_id = user_login.getUserId();
                        if (liveRoom.getSocketsToUserMap().containsKey(logout_id)) {
                            liveRoom.getId_map_name().remove(logout_id);
                            liveRoom.getSocketsToUserMap().remove(logout_id);

                            send_onlinlist();//发送在线人数(要先发在线人数再移除logout_id)
                        }
                        //主播连接下线强制关闭直播间
                        if (liveRoom.getLiverSession() != null && session.getId().equals(liveRoom.getLiverSession().getId())) {
                            live_close();
                        }
                        break;
                    default:
                        System.out.println("state UNKONW");
                        break;
                }
            }
        }

    }

    @OnError
    public void onError(@PathParam(value = "roomId") Integer roomId, Session session, Throwable error) {
        System.out.println("发生错误");
        try {
            session.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    //给指定seesion发送消息
    public void sendMessage_To(String message, Session session) {
        try {
            if (session != null && session.isOpen()) {
                session.getBasicRemote().sendText(message);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //向本连接返回消息
    public void sendBackMessage(String message) {
        try {
            this.session.getAsyncRemote().sendText(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 群发消息
    public void qunfa(String message,boolean isIncludeLiverSession) {
        Iterator<String> iterator = liveRoom.getSessions().keySet().iterator();
        while (iterator.hasNext()) {
            Session session = liveRoom.getSessions().get(iterator.next());
            if (session.isOpen()) {
                session.getAsyncRemote().sendText(message);
            }
        }

        //给主播补发
//        if(isIncludeLiverSession){
//            liveRoom.getLiverSession().getAsyncRemote().sendText(message);
//        }
    }


    //加上观众的session_id
    public String get_addsessionid_json(String rtc_json) {
        JSONObject jsonObject = JSONObject.fromObject(rtc_json);
        jsonObject.put("session_id", session.getId());
        return jsonObject.toString();
    }

    //关闭直播
    public void live_close() {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("group", "rtc");
        jsonObject.put("type", "bye");
        qunfa(jsonObject.toString(),false);//群发主播退出信息
        liveRoom.closeRoom();
        liveRoom = null;
    }

    //判断是否登陆
    public boolean islogin() {
        Users user_login = (Users) httpSession.getAttribute("user");
        return user_login != null;
    }

    //发送在线人数列表
    public void send_onlinlist() {
        JSONObject send_onlinlist = new JSONObject();
        send_onlinlist.element("onlinenum", liveRoom.getOnlineCount());

        ArrayList<String> name_list = new ArrayList<>();
        name_list.addAll(liveRoom.getId_map_name().values());

        send_onlinlist.put("onlinelist", JSONArray.fromObject(name_list));
        System.out.println("onlinlist:" + send_onlinlist);
        qunfa(send_onlinlist.toString(),true);
    }
}
