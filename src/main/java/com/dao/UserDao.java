package com.dao;


import com.entity.Users;

/**
 * Created by zc on 2016/12/15.
 */
public interface UserDao extends BaseDao<Users> {

    //(根据类型判断)用户是否存在
    public boolean exist_user(String user_param, int type);


}
