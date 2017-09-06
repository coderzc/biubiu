package com.Interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import org.apache.struts2.ServletActionContext;

/**
 * Created by zc on 2016/12/18.
 */
public class Check_videoId extends AbstractInterceptor {
    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        String video_id = ServletActionContext.getRequest().getParameter("video_id");
        if (video_id == null) {
           return "re_video";
        }
        return  actionInvocation.invoke();
    }
}
