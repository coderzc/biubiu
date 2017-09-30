package com.action;

import com.entity.Barrages;
import com.entity.Users;
import com.opensymphony.xwork2.ModelDriven;

/**
 * Created by zc on 2016/12/18.
 */
public class BarragesAction extends JsonActionSupport implements ModelDriven<Barrages>, ServiceSupport {

    public Barrages barrage = new Barrages();


    //插入弹幕
    public String insert_Barr() {
        Users user_login = ((Users) request.getSession().getAttribute("user"));
        barrage.setBarr_user(user_login);

        if (BARRAGE_SERVICE.save(barrage)) {
            success = true;
        } else {
            success = false;
        }

        put_issuccess();

        return SUCCESS;
    }


    @Override
    public Barrages getModel() {
        return barrage;
    }
}
