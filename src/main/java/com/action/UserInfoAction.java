package com.action;

import com.entity.Users;
import com.opensymphony.xwork2.ModelDriven;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by zc on 2016/12/26.
 */
public class UserInfoAction extends JsonActionSupport implements ModelDriven<Users>, ServiceSupport {

    Users user_info = new Users();


    //进入userinfo修改页面
    public String setting() {
        //去session中拿吧
        return SUCCESS;
    }


    //修改用户信息
    public String uinfo() {

        Users users = USER_SERVICE.get(user_info.getUserId());
        if (users != null) {
            users.setUserGender(user_info.getUserGender());
            users.setUserEmail(user_info.getUserEmail());


            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
            Date date=java.sql.Date.valueOf(sdf.format(user_info.getUserBirthday()));
            users.setUserBirthday(date);


            if (USER_SERVICE.update(users)) {
                //改变session中的user

                request.getSession().setAttribute("user", users);

                success = true;
            } else {
                success = false;
            }
        } else {
            success = false;
        }


        put_issuccess();
        return SUCCESS;
    }


    @Override
    public Users getModel() {
        return user_info;
    }
}
