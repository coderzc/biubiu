package com.entity;



import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by zc on 2016/12/20.
 */
public class Users {
    private String userId;
    private String userName;
    private String userPassword;
    private String userEmail;
    private String userGender;
    private Date userBirthday;
    private String userPicPath;
    private Integer roomId;

    private Set<Videos> uploadSet = new HashSet<>();//用户上传视频列表
    private Set<Barrages> user_barrageSet=new HashSet<>();//该用户所发的弹幕集合
    private Set<VideoLike> user_likeSet = new HashSet<>();//用户点赞列表
    private Set<VideoFavlist> user_favSet = new HashSet<>();//用户收藏列表


    public Set<Barrages> getUser_barrageSet() {
        return user_barrageSet;
    }

    public void setUser_barrageSet(Set<Barrages> user_barrageSet) {
        this.user_barrageSet = user_barrageSet;
    }

    public Set<VideoLike> getUser_likeSet() {
        return user_likeSet;
    }

    public void setUser_likeSet(Set<VideoLike> user_likeSet) {
        this.user_likeSet = user_likeSet;
    }

    public Set<VideoFavlist> getUser_favSet() {
        return user_favSet;
    }

    public void setUser_favSet(Set<VideoFavlist> user_favSet) {
        this.user_favSet = user_favSet;
    }

    public Set<Videos> getUploadSet() {
        return uploadSet;
    }

    public void setUploadSet(Set<Videos> uploadSet) {
        this.uploadSet = uploadSet;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserGender() {
        return userGender;
    }

    public void setUserGender(String userGender) {
        this.userGender = userGender;
    }

    public Date getUserBirthday() {
        return userBirthday;
    }

    public void setUserBirthday(Date userBirthday) {
        this.userBirthday = userBirthday;
    }

    public String getUserPicPath() {

        return this.userPicPath;
    }

    public void setUserPicPath(String userPicPath) {
        this.userPicPath = userPicPath;
    }

    public Integer getRoomId() {
        return roomId;
    }

    public void setRoomId(Integer roomId) {
        this.roomId = roomId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Users users = (Users) o;

        if (userId != null ? !userId.equals(users.userId) : users.userId != null) return false;
        if (userName != null ? !userName.equals(users.userName) : users.userName != null) return false;
        if (userPassword != null ? !userPassword.equals(users.userPassword) : users.userPassword != null) return false;
        if (userEmail != null ? !userEmail.equals(users.userEmail) : users.userEmail != null) return false;
        if (userGender != null ? !userGender.equals(users.userGender) : users.userGender != null) return false;
        if (userBirthday != null ? !userBirthday.equals(users.userBirthday) : users.userBirthday != null) return false;
        if (userPicPath != null ? !userPicPath.equals(users.userPicPath) : users.userPicPath != null) return false;
        return roomId != null ? roomId.equals(users.roomId) : users.roomId == null;
    }

    @Override
    public int hashCode() {
        int result = userId != null ? userId.hashCode() : 0;
        result = 31 * result + (userName != null ? userName.hashCode() : 0);
        result = 31 * result + (userPassword != null ? userPassword.hashCode() : 0);
        result = 31 * result + (userEmail != null ? userEmail.hashCode() : 0);
        result = 31 * result + (userGender != null ? userGender.hashCode() : 0);
        result = 31 * result + (userBirthday != null ? userBirthday.hashCode() : 0);
        result = 31 * result + (userPicPath != null ? userPicPath.hashCode() : 0);
        result = 31 * result + (roomId != null ? roomId.hashCode() : 0);
        return result;
    }
}
