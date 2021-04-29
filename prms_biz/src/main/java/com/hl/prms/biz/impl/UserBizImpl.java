package com.hl.prms.biz.impl;

import com.github.pagehelper.PageHelper;
import com.hl.prms.biz.UserBiz;
import com.hl.prms.dao.UserDao;
import com.hl.prms.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service("userBiz")
public class UserBizImpl implements UserBiz {


    @Resource(name = "userDao")
    private UserDao userDao;

    public List<User> getUserList() {
        return userDao.selectAll();
    }

    public void add(User user) {
        user.setCreateTime(new Date());
        user.setLastEditTime(new Date());
        String black ="";
        System.out.println(user.getPassWord());
        if(black.equals(user.getPassWord())){
            user.setPassWord("000000");
        }
        userDao.insert(user);
    }

    public void edit(User user) {
        user.setLastEditTime(new Date());
        userDao.update(user);
    }

    public void remove(String userId) {
        userDao.delete(userId);
    }

    public User get(String userId) {
        return userDao.select(userId);
    }

    public List<User> getAll(int page,int size) {
        PageHelper.startPage(page,size);
        return userDao.selectAll();
    }

    public User getByUserName(String userName) {
        return userDao.selectByUserName(userName);
    }
}
