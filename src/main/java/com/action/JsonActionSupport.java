package com.action;

import com.opensymphony.xwork2.ActionSupport;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by zc on 2016/12/18.
 */
public abstract class JsonActionSupport extends ActionSupport {

    HttpServletRequest request = ServletActionContext.getRequest();
    HttpServletResponse response = ServletActionContext.getResponse();
    ServletContext appliaction = ServletActionContext.getServletContext();

    //ajax 返回的json对象
    protected JSONObject resp_json = new JSONObject();

    //ajax 返回结果是否成功 默认false
    protected boolean success = false;
    //失败返回信息
    protected String error_msg;


    public JSONObject getResp_json() {
        return resp_json;
    }

    public void setResp_json(JSONObject resp_json) {
        this.resp_json = resp_json;
    }

    //加入是否成功标识
    protected void put_issuccess() {
        resp_json.put("success", success);
    }

    //加入错误信息
    protected void put_errormsg() {
        resp_json.put("error_msg", error_msg);
    }
}
