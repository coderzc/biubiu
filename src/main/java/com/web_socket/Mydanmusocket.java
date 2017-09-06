package com.web_socket;


import com.entity.Users;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArraySet;

//该注解用来指定一个URI，客户端可以通过这个URI来连接到WebSocket。类似Servlet的注解mapping。无需在web.xml中配置。
@ServerEndpoint(value = "/danmusocket", configurator = GetHttpSessionConfigurator.class)
public class Mydanmusocket {
    //获取id/name 映射表
//    public static HashMap<String, String> user_id_name = UsersDao.getuser_name_all();

    // 静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
    private static int onlineCount = 0;
    // concurrent包的线程安全存储所有连接包括无登陆游客
    private static CopyOnWriteArraySet<Mydanmusocket> websockets = new CopyOnWriteArraySet<>();
    // 用来存放每个客户端组，其中Key可以为用户标识
    private static Map<String, Set<Mydanmusocket>> webSocketMap = new ConcurrentHashMap<>();

    //在线用户列表 id_name 映射
    private static Map<String, String> id_map_name = new ConcurrentHashMap<>();

    // 与某个客户端的连接会话，需要通过它来给客户端发送数据
    private Session session;
    private EndpointConfig config;
    private boolean islogin = false;//是否为登录状态

    private static ServletContext application;

    /**
     * 连接建立成功调用的方法
     *
     * @param session 可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(Session session, EndpointConfig config) {
        this.session = session;
        this.config = config;

        HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        application = httpSession.getServletContext();
//        System.out.println(application);

        Users user = (Users) httpSession.getAttribute("user");
        if (user != null) {//session 不为空认为该标签为自动登录 ？？？？？？
            Set<Mydanmusocket> socketusergroup;
            if (webSocketMap.containsKey(user.getUserId())) {//该用户已经在该直播的在线列表中
                socketusergroup = webSocketMap.get(user.getUserId());
            } else {//该用户没有在该直播的在线列表中
                socketusergroup = new HashSet<Mydanmusocket>();
                id_map_name.put(user.getUserId(), user.getUserName());//加入id_name 映射
                addOnlineCount(); // 在线数加1
            }

            //将本socket实例加入到该用户端组(更新webSocketMap)
            socketusergroup.add(this);
            webSocketMap.put(user.getUserId(), socketusergroup); // 加入set中

            islogin = true;//修正登录标识
        } else {// 游客(无登陆状态)
            addOnlineCount(); // 在线数加1
        }

        websockets.add(this);
        send_onlinlist();

        System.out.println("有新连接加入！当前在线人数为" + getOnlineCount());
    }


    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        HttpSession httpSession = (HttpSession) this.config.getUserProperties().get(HttpSession.class.getName());
        Users user = (Users) httpSession.getAttribute("user");
        if (user != null && islogin) {// 登录状态
            Set<Mydanmusocket> es = webSocketMap.get(user.getUserId());
            System.out.println(es.size());

            es.remove(this);
            if (es.size() == 0) {// 关闭最后一个标签强制登出或刷新最后一个标签
                webSocketMap.remove(user.getUserId());
                id_map_name.remove(user.getUserId());//将该用户移除id_name 映射
                subOnlineCount(); // 在线数减1
                System.out.println("标签结束" + getOnlineCount());
                send_onlinlist();//发送在线人数

//                httpSession.invalidate();先不失效

            }
        } else {//游客模式
            subOnlineCount(); // 在线数减1
            send_onlinlist();//发送在线人数
        }
        websockets.remove(this); // 从连接池中删除
        System.out.println("有一连接关闭！当前在线人数为" + getOnlineCount());
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 解析客户端发送过来的消息
     * @param session 可选的参数
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("来自客户端的消息:" + message);
        Boolean user_online = (Boolean) JSONObject.fromObject(message).get("user_online");

        if (user_online != null && user_online) {//首次手动登录修改为登录状态（由游客变为登录）
            HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
            Users user = (Users) httpSession.getAttribute("user");

            Set<Mydanmusocket> socketusergroup;
            socketusergroup = new HashSet<Mydanmusocket>();
            socketusergroup.add(this);
            webSocketMap.put(user.getUserId(), socketusergroup); // 加入set中
            id_map_name.put(user.getUserId(), user.getUserName());//加入id_name 映射
            System.out.println("标签数:" + socketusergroup.size());
            islogin = true;
            send_onlinlist();//发送在线人数
        } else {
            if (JSONObject.fromObject(message).get("state") != null) {//解析状态码
                int state = (int) JSONObject.fromObject(message).get("state");
                switch (state) {
                    case 1:
                        System.out.println("qunfa");
                        qunfa(message);//群发弹幕
                        break;
                    case 2:
                        System.out.println("普通用户下线");
                        String logout_id = (String) JSONObject.fromObject(message).get("logout_id");
                        if (webSocketMap.containsKey(logout_id)) {
                            id_map_name.remove(logout_id);
                            webSocketMap.remove(logout_id);
                            islogin=false;

                            send_onlinlist();//发送在线人数(要先发在线人数再移除logout_id)
                        }
                        break;
                    default:
                        System.out.println("state UNKONW");
                        break;
                }
            }
        }
    }


    // 群发消息
    public void qunfa(String message) {
        for (Mydanmusocket mydanmusocket : websockets) {
            if (mydanmusocket.session.isOpen()) {
                mydanmusocket.session.getAsyncRemote().sendText(message);
            }
        }
    }


    /**
     * 发生错误时调用
     *
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error) {
        System.out.println("发生错误");
        error.printStackTrace();
    }

    /**
     * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
     *
     * @param message
     * @throws IOException
     */
    public void sendMessage(String message) throws IOException {
        this.session.getAsyncRemote().sendText(this.session.getId());
        // this.session.getAsyncRemote().sendText(message);
    }


    public void send_onlinlist() {//发送在线人数列表
        JSONObject send_onlinlist = new JSONObject();
        send_onlinlist.element("onlinenum", getOnlineCount());

        Iterator<String> iterator = id_map_name.keySet().iterator();

        ArrayList<String> name_list = new ArrayList<>();
        name_list.addAll(id_map_name.values());

        send_onlinlist.put("onlinelist", JSONArray.fromObject(name_list));
        System.out.println("onlinlist:" + send_onlinlist);
        qunfa(send_onlinlist.toString());

    }


    //   public void sende_to(String user, String message) {//发消息给指定用户
//        HashSet<Mydanmusocket> usergroupset = webSocketMap.get(user);
//        if (usergroupset != null && !usergroupset.isEmpty()) {
//            for (Mydanmusocket mydanmusocket : usergroupset) {
//                if (mydanmusocket.session.isOpen()) {
//                    try {
//                        mydanmusocket.session.getAsyncRemote().sendText(message);
//                    } catch (IOException e) {
//                        e.printStackTrace();
//                    }
//                } else {
//                    System.out.println("a用户的" + session.getId() + "号连接关闭");
//                }
//            }
//        } else {
//            System.out.println("a用户不在线");
//        }
//    }

    public static synchronized int getOnlineCount() {
        System.out.println(application.getAttribute("onlineCount"));
        return onlineCount;
    }

    public static synchronized void addOnlineCount() {
        application.setAttribute("onlineCount", (int) application.getAttribute("onlineCount") + 1);
        Mydanmusocket.onlineCount++;
    }

    public static synchronized void subOnlineCount() {
        application.setAttribute("onlineCount", (int) application.getAttribute("onlineCount") - 1);
        Mydanmusocket.onlineCount--;
    }

    public static Map<String, Set<Mydanmusocket>> getWebSocketMap() {
        return webSocketMap;
    }

}
