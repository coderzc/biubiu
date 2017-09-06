package com.web_socket;

import net.sf.json.JSONObject;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by zc on 2016/12/7.
 */

@ServerEndpoint(value = "/myrtc", configurator = GetHttpSessionConfigurator.class)
public class Webrtc_socket {
    private static Session host_session;//主播session
    //观众发起请求的观众
    private static Map<String, Session> sessions = new ConcurrentHashMap<>();

    private static ServletContext application;
    private Session session;


    @OnOpen
    public void onOpen(Session session, EndpointConfig config) {

        HttpSession httpSession = (HttpSession) config.getUserProperties().get(HttpSession.class.getName());
        application = httpSession.getServletContext();
        this.session = session;

        if ((Boolean) application.getAttribute("islived")) {
            System.out.println("！！！主播已开启直播");
        } else {
            System.out.println("主播未开启直播！！！");
        }


    }

    @OnClose
    public void OnClose(Session session) {
        if (host_session != null) {
            if (session.getId().equals(host_session.getId())) {
                System.out.println(session.getId());
                host_close();
            }
        }

        sessions.remove(session.getId());
    }

    @OnMessage
    public void onMessage(String message, Session session) {
        String session_id = (String) JSONObject.fromObject(message).get("session_id");
        String style = (String) JSONObject.fromObject(message).get("style");

        switch (style) {//主播启动直播
            case "ishost_start"://主播启动直播
                System.out.println("启动了！！！");
                host_session = session;
                application.setAttribute("islived", true);
                break;
            case "offer"://观众发起offer信令
                sessions.put(session.getId(), session);//把当前会话对象加入观众集合
                if ((Boolean) application.getAttribute("islived")) {
                    message = get_addsessionid_json(message);//加上观众session_id
                    sendMessage_To(message, host_session);
                }
                break;
            case "answer"://主播应答信令
                if (session_id != null) {
                    sendMessage_To(message, sessions.get(session_id));
                }
                break;
            case "ice_candidate":
                if (host_session != null) {//加强判断没有也可
                    if (host_session.getId().equals((session.getId()))) {//主播发送的
                        System.out.println(session_id);
                        if (session_id != null) {
                            sendMessage_To(message, sessions.get(session_id));
                        }
                    } else {//发给主播的

//                        System.out.println(session.getId() + "-------" + host_session.getId());
                        String msg = get_addsessionid_json(message);//加上观众session_id
                        sendMessage_To(msg, host_session);
                    }
                }
                break;
            case "host_close"://主播退出或关闭直播
                host_close();
                break;

        }


    }

    @OnError
    public void onError(Session session, Throwable error) {
        System.out.println("发生错误");
        error.printStackTrace();
    }

    public void sendMessage_To(String message, Session sess) {
        try {
//            sess.getAsyncRemote().sendText(message);
            if (sess != null && sess.isOpen()) {
                sess.getBasicRemote().sendText(message);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        // this.session.getAsyncRemote().sendText(message);
    }

    public void sendMessage(String message) {
        try {
            this.session.getAsyncRemote().sendText(message);
        } catch (Exception e) {
            e.printStackTrace();
        }
        // this.session.getAsyncRemote().sendText(message);
    }

    // 群发消息
    public void qunfa(String message) {
        Iterator<String> iterator = sessions.keySet().iterator();
        while (iterator.hasNext()) {
            Session session = sessions.get(iterator.next());
            if (session.isOpen()) {
                session.getAsyncRemote().sendText(message);
            }
        }
    }

    //加上观众的session_id
    public String get_addsessionid_json(String rtc_json) {
        JSONObject jsonObject = JSONObject.fromObject(rtc_json);
        jsonObject.put("session_id", session.getId());
        return jsonObject.toString();
    }


    public void host_close() {
        host_session = null;//主播退出
        application.setAttribute("islived", false);//关闭直播(标志)
        System.out.println("主播走了。。。");

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("style", "bye");
        qunfa(jsonObject.toString());//群发主播退出信息
    }
}
