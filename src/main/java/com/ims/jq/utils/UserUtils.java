package com.ims.jq.utils;

import com.ims.jq.interceptor.AuthorityInterceptor;
import com.ims.jq.interceptor.User;

public class UserUtils {
    public static User getUser(){
        return new User();
    }
    public static User get(String id){
        User user = new User();
        user.setId("1");
        user.setName("管理员");
        user.setLoginName("admin");
        return  user;
    }
}
