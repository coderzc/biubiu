package com.action;

import com.entity.Users;
import com.utils.CreateId;
import com.web_socket.LiveRoom;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class LiveAction extends ActionSupport implements ServiceSupport {
    LiveRoom liveRoom;
    boolean is_liver;
    Users user_my;
    String myRoomId = "-1";

    public LiveRoom getLiveRoom() {
        return liveRoom;
    }

    public void setLiveRoom(LiveRoom liveRoom) {
        this.liveRoom = liveRoom;
    }

    public boolean isIs_liver() {
        return is_liver;
    }

    public void setIs_liver(boolean is_liver) {
        this.is_liver = is_liver;
    }

    public String getMyRoomId() {
        return myRoomId;
    }

    @Override
    public String execute() throws Exception {
        user_my=((Users) ServletActionContext.getRequest().getSession().getAttribute("user"));
        String room_id0 = ServletActionContext.getRequest().getParameter("roomId");
        if (room_id0 == null || room_id0.length() <= 0) {//房间号错误
            return "404";
        }

        if (user_my != null) {
            myRoomId = CreateId.getNumZero(user_my.getRoomId());
        }
        Integer room_id;
        try {
            room_id = Integer.valueOf(room_id0);

            if (room_id.equals(0)) {
                return "my";
            }
            if (room_id.equals(-1)) {
                return "login";
            }
            Users user_login = (Users) ServletActionContext.getRequest().getSession().getAttribute("user");

            liveRoom = LiveRoom.getRoom(room_id);
            if (liveRoom == null) {//没有该房间
                return "404";
            }

            is_liver = LiveRoom.isLiver(room_id, user_login);

            return SUCCESS;

        } catch (NumberFormatException e) {
            return "404";
        }
    }

}
