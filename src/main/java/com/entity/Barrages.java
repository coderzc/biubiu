package com.entity;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by zc on 2016/12/20.
 */
public class Barrages {
    private String barrageId;
    private Date barrageCreateTime;
    private Float videoTimePrint;
    private Integer barrageSpeed;
    private String barrageContent;
    private String barrageColor;
    private Integer barrageFontSize;


    private Videos barrage_video;//弹幕所属视频
    private Users barr_user;//弹幕所属用户

    public Videos getBarrage_video() {
        return barrage_video;
    }

    public void setBarrage_video(Videos barrage_video) {
        this.barrage_video = barrage_video;
    }

    public Users getBarr_user() {
        return barr_user;
    }

    public void setBarr_user(Users barr_user) {
        this.barr_user = barr_user;
    }

    public String getBarrageId() {
        return barrageId;
    }

    public void setBarrageId(String barrageId) {
        this.barrageId = barrageId;
    }

    public Date getBarrageCreateTime() {
        return barrageCreateTime;
    }

    public void setBarrageCreateTime(Date barrageCreateTime) {
        this.barrageCreateTime = barrageCreateTime;
    }

    public Float getVideoTimePrint() {
        return videoTimePrint;
    }

    public void setVideoTimePrint(Float videoTimePrint) {
        this.videoTimePrint = videoTimePrint;
    }

    public Integer getBarrageSpeed() {
        return barrageSpeed;
    }

    public void setBarrageSpeed(Integer barrageSpeed) {
        this.barrageSpeed = barrageSpeed;
    }

    public String getBarrageContent() {
        return barrageContent;
    }

    public void setBarrageContent(String barrageContent) {
        this.barrageContent = barrageContent;
    }

    public String getBarrageColor() {
        return barrageColor;
    }

    public void setBarrageColor(String barrageColor) {
        this.barrageColor = barrageColor;
    }

    public Integer getBarrageFontSize() {
        return barrageFontSize;
    }

    public void setBarrageFontSize(Integer barrageFontSize) {
        this.barrageFontSize = barrageFontSize;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Barrages barrages = (Barrages) o;

        if (barrageId != null ? !barrageId.equals(barrages.barrageId) : barrages.barrageId != null) return false;
        if (barrageCreateTime != null ? !barrageCreateTime.equals(barrages.barrageCreateTime) : barrages.barrageCreateTime != null)
            return false;
        if (videoTimePrint != null ? !videoTimePrint.equals(barrages.videoTimePrint) : barrages.videoTimePrint != null)
            return false;
        if (barrageSpeed != null ? !barrageSpeed.equals(barrages.barrageSpeed) : barrages.barrageSpeed != null)
            return false;
        if (barrageContent != null ? !barrageContent.equals(barrages.barrageContent) : barrages.barrageContent != null)
            return false;
        if (barrageColor != null ? !barrageColor.equals(barrages.barrageColor) : barrages.barrageColor != null)
            return false;
        if (barrageFontSize != null ? !barrageFontSize.equals(barrages.barrageFontSize) : barrages.barrageFontSize != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = barrageId != null ? barrageId.hashCode() : 0;
        result = 31 * result + (barrageCreateTime != null ? barrageCreateTime.hashCode() : 0);
        result = 31 * result + (videoTimePrint != null ? videoTimePrint.hashCode() : 0);
        result = 31 * result + (barrageSpeed != null ? barrageSpeed.hashCode() : 0);
        result = 31 * result + (barrageContent != null ? barrageContent.hashCode() : 0);
        result = 31 * result + (barrageColor != null ? barrageColor.hashCode() : 0);
        result = 31 * result + (barrageFontSize != null ? barrageFontSize.hashCode() : 0);
        return result;
    }
}
