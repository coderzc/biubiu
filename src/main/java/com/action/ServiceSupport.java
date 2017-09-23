package com.action;

import com.service.BarrageService;
import com.service.UserService;
import com.service.VideoService;

/**
 * Created by zc on 2016/12/20.
 */
public interface ServiceSupport {
    UserService USER_SERVICE = new UserService();
    BarrageService BARRAGE_SERVICE = new BarrageService();
    VideoService VIDEO_SERVICE = new VideoService();
}
