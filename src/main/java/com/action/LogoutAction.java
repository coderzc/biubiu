package com.action;


import com.entity.Users;

/**
 * Created by zc on 2016/12/18.
 */
public class LogoutAction extends JsonActionSupport {

    public String logout(){
        String logout_id=request.getParameter("logout_id");

        Users user = (Users) request.getSession().getAttribute("user");

        if(user!=null&&user.getUserId().equals(logout_id)){//可以下线
            request.getSession().removeAttribute("user");

            success=true;
        }
        else {
            success=false;
        }

        put_issuccess();

        return SUCCESS;
    }
}
