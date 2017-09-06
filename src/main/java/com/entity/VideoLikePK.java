package com.entity;

import java.io.Serializable;

/**
 * Created by zc on 2016/12/20.
 */
public class VideoLikePK implements Serializable {
    private String userId;
    private String videoId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getVideoId() {
        return videoId;
    }

    public void setVideoId(String videoId) {
        this.videoId = videoId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        VideoLikePK that = (VideoLikePK) o;

        if (userId != null ? !userId.equals(that.userId) : that.userId != null) return false;
        if (videoId != null ? !videoId.equals(that.videoId) : that.videoId != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = userId != null ? userId.hashCode() : 0;
        result = 31 * result + (videoId != null ? videoId.hashCode() : 0);
        return result;
    }
}
