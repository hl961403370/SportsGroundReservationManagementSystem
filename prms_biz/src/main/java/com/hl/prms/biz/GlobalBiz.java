package com.hl.prms.biz;

import com.hl.prms.entity.User;

public interface GlobalBiz {

    User login(String username,String password);
    void changePassword(User user);
}
