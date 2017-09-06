package com.Interceptor;

import com.entity.Users;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

/**
 * Created by zc on 2016/12/19.
 */
public class Check_islogined extends AbstractInterceptor {

    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession();

        Users user = (Users) session.getAttribute("user");
        if (user != null) {//已经登陆
            return actionInvocation.invoke();
        } else {
            return "login";//返回登录
        }

    }
}
