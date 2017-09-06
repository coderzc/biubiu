package com.entity;

import java.sql.Timestamp;

/**
 * Created by zc on 2016/12/20.
 */
public class VideoFavlist {

    private VideoFavlistPK favId;
    private Timestamp favTime;

    private Videos fav_video;//被收藏的视频

    private Users  fav_user;//收藏视频的用户

    public Videos getFav_video() {
        return fav_video;
    }

    public void setFav_video(Videos fav_video) {
        this.fav_video = fav_video;
    }

    public Users getFav_user() {
        return fav_user;
    }

    public void setFav_user(Users fav_user) {
        this.fav_user = fav_user;
    }

    public VideoFavlistPK getFavId() {
        return favId;
    }

    public void setFavId(VideoFavlistPK favId) {
        this.favId = favId;
    }

    public Timestamp getFavTime() {
        return favTime;
    }


    public void setFavTime(Timestamp favTime) {
        this.favTime = favTime;
    }

}
