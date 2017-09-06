package com.utils;

import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import java.util.Date;

/**
 * Created by zc on 2016/12/24.
 *  设置特殊列的json序列化规则
 */
public class Json_format extends JsonConfig {

    public Json_format(String clazz) {
        super();
        this.registerJsonValueProcessor(Date.class, new JsonDateValueProcessor());

        if ("video".equals(clazz)) {
            this.setJsonPropertyFilter(new PropertyFilter() {
                public boolean apply(Object source, String name, Object value) {
                    if (name.equals("video_favSet") || name.equals("video_likeSet")  || name.equals("video_barrageSet")
                            ||name.equals("uploadSet")||name.equals("user_barrageSet")
                            ||name.equals("user_likeSet")||name.equals("user_favSet")) {
                        return true;
                    } else {

                        return false;
                    }
                }
            });
        } else if ("barrage".equals(clazz)) {
            this.setJsonPropertyFilter(new PropertyFilter() {
                public boolean apply(Object source, String name, Object value) {
                    if (name.equals("barrage_video") || name.equals("barr_user")) {
                        return true;
                    } else {
                        return false;
                    }
                }
            });
        }


    }
}
