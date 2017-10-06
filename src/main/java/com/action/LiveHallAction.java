package com.action;

import com.opensymphony.xwork2.ActionSupport;
import com.web_socket.LiveRoom;

import java.util.List;

public class LiveHallAction extends ActionSupport{
    private List roomList;

    public List getRoomList() {
        return roomList;
    }

    public void setRoomList(List roomList) {
        this.roomList = roomList;
    }

    @Override
    public String execute() throws Exception {
        roomList=LiveRoom.getRoomsList();
        return SUCCESS;
    }
}
