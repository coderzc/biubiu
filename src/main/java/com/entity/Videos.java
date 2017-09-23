package com.entity;

import com.utils.PropertiesUtil;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by zc on 2016/12/20.
 */
public class Videos {
    private String videoId;
    private String videoTitle;
    private String videoPath;
    private String videoCoverPath;
    private Integer videoWatchCount;
    private String videoType;
    private String isDiy;
    private Date videoUploadTime;

    private Users up_user;//视频所有者

    private Set<Barrages> video_barrageSet=new HashSet<>();//视频弹幕集合
    private Set<VideoFavlist> video_favSet =new HashSet<>();//收藏该视频列表
    private Set<VideoLike> video_likeSet =new HashSet<>();//给该视频点赞列表

    public Set<Barrages> getVideo_barrageSet() {
        return video_barrageSet;
    }

    public void setVideo_barrageSet(Set<Barrages> video_barrageSet) {
        this.video_barrageSet = video_barrageSet;
    }

    public Set<VideoLike> getVideo_likeSet() {
        return video_likeSet;
    }

    public void setVideo_likeSet(Set<VideoLike> video_likeSet) {
        this.video_likeSet = video_likeSet;
    }

    public Set<VideoFavlist> getVideo_favSet() {
        return video_favSet;
    }

    public void setVideo_favSet(Set<VideoFavlist> video_favSet) {
        this.video_favSet = video_favSet;
    }

    public Users getUp_user() {
        return up_user;
    }

    public void setUp_user(Users up_user) {
        this.up_user = up_user;
    }

    public String getVideoId() {
        return videoId;
    }

    public void setVideoId(String videoId) {
        this.videoId = videoId;
    }

    public String getVideoTitle() {
        return videoTitle;
    }

    public void setVideoTitle(String videoTitle) {
        this.videoTitle = videoTitle;
    }

    public String getVideoPath() {
        return PropertiesUtil.getProperty("cos.server.http.prefix") + this.videoPath;
    }

    public void setVideoPath(String videoPath) {
        this.videoPath = videoPath;
    }

    public String getVideoCoverPath() {
        return PropertiesUtil.getProperty("cos.server.http.prefix") + this.videoCoverPath;
    }

    public void setVideoCoverPath(String videoCoverPath) {
        this.videoCoverPath = videoCoverPath;
    }

    public Integer getVideoWatchCount() {
        return videoWatchCount;
    }

    public void setVideoWatchCount(Integer videoWatchCount) {
        this.videoWatchCount = videoWatchCount;
    }

    public String getVideoType() {
        return videoType;
    }

    public void setVideoType(String videoType) {
        this.videoType = videoType;
    }

    public String getIsDiy() {
        return isDiy;
    }

    public void setIsDiy(String isDiy) {
        this.isDiy = isDiy;
    }

    public Date getVideoUploadTime() {
        return videoUploadTime;
    }

    public void setVideoUploadTime(Date videoUploadTime) {
        this.videoUploadTime = videoUploadTime;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Videos videos = (Videos) o;

        if (videoId != null ? !videoId.equals(videos.videoId) : videos.videoId != null) return false;
        if (videoTitle != null ? !videoTitle.equals(videos.videoTitle) : videos.videoTitle != null) return false;
        if (videoPath != null ? !videoPath.equals(videos.videoPath) : videos.videoPath != null) return false;
        if (videoCoverPath != null ? !videoCoverPath.equals(videos.videoCoverPath) : videos.videoCoverPath != null)
            return false;
        if (videoWatchCount != null ? !videoWatchCount.equals(videos.videoWatchCount) : videos.videoWatchCount != null)
            return false;
        if (videoType != null ? !videoType.equals(videos.videoType) : videos.videoType != null) return false;
        if (isDiy != null ? !isDiy.equals(videos.isDiy) : videos.isDiy != null) return false;
        if (videoUploadTime != null ? !videoUploadTime.equals(videos.videoUploadTime) : videos.videoUploadTime != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = videoId != null ? videoId.hashCode() : 0;
        result = 31 * result + (videoTitle != null ? videoTitle.hashCode() : 0);
        result = 31 * result + (videoPath != null ? videoPath.hashCode() : 0);
        result = 31 * result + (videoCoverPath != null ? videoCoverPath.hashCode() : 0);
        result = 31 * result + (videoWatchCount != null ? videoWatchCount.hashCode() : 0);
        result = 31 * result + (videoType != null ? videoType.hashCode() : 0);
        result = 31 * result + (isDiy != null ? isDiy.hashCode() : 0);
        result = 31 * result + (videoUploadTime != null ? videoUploadTime.hashCode() : 0);
        return result;
    }
}
