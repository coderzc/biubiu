package com.action;

import com.entity.Barrages;
import com.opensymphony.xwork2.ModelDriven;
import com.service.BarrageService;
import org.apache.struts2.ServletActionContext;

/**
 * Created by zc on 2016/12/18.
 */
public class BarragesAction extends JsonActionSupport implements ModelDriven<Barrages>,ServiceSupport {

    public Barrages barrage = new Barrages();


    //插入弹幕
    public String insert_Barr() {

        String parameter = ServletActionContext.getRequest().getParameter("barrage_video.videoId");

        System.out.println(parameter);

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
