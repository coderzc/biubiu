package com.action;


import com.entity.Users;
import com.opensymphony.xwork2.ModelDriven;

import org.apache.struts2.ServletActionContext;

/**
 * Created by zc on 2016/12/18.
 */
public class LoginAction extends JsonActionSupport implements ModelDriven<Users> ,ServiceSupport {

    public Users user = new Users();//表单模型

    //登录验证
    public String login() {

        String username = null;//返回的user_name
        String user_id = null;//返回的user_id
        boolean is_logined = false;//是否已经登录

        //正式提交登录
        Users user_return = USER_SERVICE.loginservice(user);

        username = user_return.getUserName();//返回用户姓名
        if (user_return != null) {//登录是否成功
            if (true) {//重复登录检验

                request.getSession().setAttribute("user", user_return);//将登陆信息加入session中

                success = true;
                user_id = user_return.getUserId();//返回用户id
            } else {
                success = false;
                is_logined = true;
            }
        } else {
            success = false;
        }

        //拼接成生成json字符串
        resp_json.put("username", username);
        resp_json.put("islogined", is_logined);
        resp_json.put("user_id", user_id);
        resp_json.put("userPicPath",user_return.getUserPicPath());
        resp_json.put("roomId",user_return.getRoomId());
        put_issuccess();

        return SUCCESS;
    }


    //用户存在检验(手机/用户名)
    public String exist_user() throws Exception {
        String user_pre = ServletActionContext.getRequest().getParameter("user_pre");
        if (user_pre != null) {
            if (USER_SERVICE.exit_userId(user_pre) || USER_SERVICE.exit_userName(user_pre)) {
                success = true;
            } else {
                success = false;
            }
            put_issuccess();
        }
        return SUCCESS;
    }


    //用户id(手机号)存在检验
    public String exist_user_id() throws Exception {
        String user_id_pre = ServletActionContext.getRequest().getParameter("user_id_pre");


        System.out.println(user_id_pre);
        if (user_id_pre != null) {

            if (USER_SERVICE.exit_userId(user_id_pre)) {
                success = true;
            } else {
                success = false;
            }
            put_issuccess();
        }
        return SUCCESS;
    }


    //用户名字存在检验
    public String exist_username() throws Exception {
        String user_name_pre = ServletActionContext.getRequest().getParameter("user_name_pre");
        if (user_name_pre != null) {

            if (USER_SERVICE.exit_userName(user_name_pre)) {
                success = true;
            } else {
                success = false;
            }
            put_issuccess();
        }
        return SUCCESS;
    }

    @Override
    public Users getModel() {
        return user;
    }
}
