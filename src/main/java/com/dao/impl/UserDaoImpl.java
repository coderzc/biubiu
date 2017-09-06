package com.dao.impl;

import com.dao.UserDao;
import com.entity.Users;

import java.util.List;

/**
 * Created by zc on 2016/12/15.
 */

public class UserDaoImpl extends BaseDaoImpl<Users> implements UserDao {
    public UserDaoImpl() {
        super();
    }

    @Override
    public boolean exist_user(String user_param, int type) {
        String hql = null;
        if (type == 1) {//根据用户ID
            hql = " from Users u where u.userId=?";
        } else if (type == 2) {//根据用户名
            hql = " from Users u where u.userName=?";
        }

        List<Users> list = super.findList(hql, user_param);

        return (list != null && !list.isEmpty());
    }





}
