package com.action;

import com.entity.Users;
import com.opensymphony.xwork2.ModelDriven;

/**
 * Created by zc on 2016/12/25.
 */
public class RegisterAction extends JsonActionSupport implements ModelDriven<Users>,
        ServiceSupport {

    public Users user = new Users();//表单模型

    @Override
    public String execute() throws Exception {


        if (USER_SERVICE.save(user)) {
            success = true;
        } else {
            success = false;
        }
        
        resp_json.put("username", user.getUserName());
        put_issuccess();
        return SUCCESS;
    }

    @Override
    public Users getModel() {
        return user;
    }
}
