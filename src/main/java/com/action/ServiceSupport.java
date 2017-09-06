package com.action;

import com.service.BarrageService;
import com.service.UserService;
import com.service.VideoService;

/**
 * Created by zc on 2016/12/20.
 */
public interface ServiceSupport {
    public UserService USER_SERVICE = new UserService();
    public BarrageService BARRAGE_SERVICE = new BarrageService();
    public VideoService VIDEO_SERVICE = new VideoService();
}
