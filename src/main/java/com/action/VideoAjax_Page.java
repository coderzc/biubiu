package com.action;

import com.entity.Videos;
import com.utils.Json_format;
import net.sf.json.JSONObject;

/**
 * Created by zc on 2016/12/24.
 */
public class VideoAjax_Page extends Page_AjaxAction<Videos> implements ServiceSupport {

    //所有视频分页查新
    public String all() {
        if (super.page_volatile_before()) {
            pageModel = VIDEO_SERVICE.findByPager(pageModel.getPageNo(), pageModel.getPageSize());
            if (super.page_volatile_after()) {
                    resp_json.put("pageModel", JSONObject.fromObject(pageModel, new Json_format("video")));
                    success = true;
            }
        } else {
            success = false;
        }
        put_issuccess();
        return SUCCESS;
    }


    //根据视频类型分页查询
    public String classify() {

        String videoType = request.getParameter("videoType");

        if (super.page_volatile_before()) {
            pageModel = VIDEO_SERVICE.classify(pageModel, videoType);
            if (super.page_volatile_after()) {
                resp_json.put("pageModel", JSONObject.fromObject(pageModel, new Json_format("video")));
                success = true;
            }
        } else {
            success = false;
        }
        put_issuccess();
        return SUCCESS;
    }



    //搜索关键字分页查询
    public String soso() {

        String keyword = request.getParameter("keyword");
        if (super.page_volatile_before()) {
            pageModel = VIDEO_SERVICE.soso(pageModel, keyword);
            if (super.page_volatile_after()) {
                String userId = pageModel.getDatas().get(0).getUp_user().getUserId();

                resp_json.put("pageModel", JSONObject.fromObject(pageModel, new Json_format("video")));

                success = true;
            }
        } else {
            success = false;
        }
        put_issuccess();
        return SUCCESS;
    }
}
