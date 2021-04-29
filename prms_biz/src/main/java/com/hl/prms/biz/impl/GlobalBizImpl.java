package com.hl.prms.biz.impl;

import com.hl.prms.biz.GlobalBiz;
import com.hl.prms.dao.UserDao;
import com.hl.prms.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("globalBiz")
public class GlobalBizImpl implements GlobalBiz {

    @Resource(name = "userDao")
    private UserDao userDao;

    public User login(String username, String password) {
        User user = userDao.selectByUserName(username);
        if(user!=null&&user.getPassWord().equals(password)){
            return user;
        }
        return null;
    }

    public void changePassword(User user) {
        userDao.update(user);
    }
}
