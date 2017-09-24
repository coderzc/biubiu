package com.action;

import com.entity.Barrages;
import com.entity.Videos;
import com.opensymphony.xwork2.ActionSupport;
import com.utils.Json_format;
import com.utils.PropertiesUtil;
import net.sf.json.JSONArray;
import org.apache.struts2.ServletActionContext;

import java.util.List;

/**
 * Created by zc on 2016/12/18.
 */
public class DemandAction extends ActionSupport implements ServiceSupport {

    private Videos video_info;
    private  JSONArray barrage_jsonArray;

    public Videos getVideo_info() {
        return video_info;
    }

    public void setVideo_info(Videos video_info) {
        this.video_info = video_info;
    }

    public JSONArray getBarrage_jsonArray() {
        return barrage_jsonArray;
    }

    public void setBarrage_jsonArray(JSONArray barrage_jsonArray) {
        this.barrage_jsonArray = barrage_jsonArray;
    }

    @Override
    public String execute() throws Exception {

        String video_id = ServletActionContext.getRequest().getParameter("video_id");

        //返回videos和Set<barrages>
       video_info = VIDEO_SERVICE.getVideo_info(video_id);

        if (video_info != null) {

            if (VIDEO_SERVICE.addWatchCount(video_info)) {
                System.out.println("视频观看次数增加成功!");
            }

            video_info.setVideoPath(PropertiesUtil.getProperty("cos.server.http.prefix") + video_info.getVideoPath());
            video_info.setVideoCoverPath(PropertiesUtil.getProperty("cos.server.http.prefix") + video_info.getVideoCoverPath());


//            System.out.println(video_info.getVideoPath());
            List<Barrages> barrage_list = BARRAGE_SERVICE.queryByVideo(video_id);

            //拼接成json
            if (barrage_list != null && !barrage_list.isEmpty()) {

                barrage_jsonArray = JSONArray.fromObject(barrage_list, new Json_format("barrage"));
            } else {
                barrage_jsonArray=new JSONArray();
                System.out.println("我空了");
            }

            return SUCCESS;

        } else {
            return "404";
        }
    }
}
