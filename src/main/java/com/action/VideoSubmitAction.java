package com.action;

import com.entity.Videos;
import com.opensymphony.xwork2.ModelDriven;

/**
 * Created by zc on 2016/12/27.
 */
public class VideoSubmitAction extends JsonActionSupport implements ModelDriven <Videos>,ServiceSupport {

public Videos video=new Videos();

    @Override
    public String execute() throws Exception {

        if(VIDEO_SERVICE.save(video)){

//            String videoId = video.getVideoId();
//            System.out.println(videoId);

            resp_json.put("videoId",video.getVideoId());
            resp_json.put("videoTitle",video.getVideoTitle());
            success=true;
        }else {
            success=false;
        }


        put_issuccess();
        return SUCCESS;
    }

    @Override
    public Videos getModel() {
        return video;
    }
}
