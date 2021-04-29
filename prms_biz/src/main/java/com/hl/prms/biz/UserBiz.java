package com.hl.prms.biz;

import com.hl.prms.entity.User;

import java.util.List;

public interface UserBiz {
    void add(User user);
    void edit(User user);
    void remove(String userId);
    User get(String userId);
    List<User> getAll(int page,int size);
    User getByUserName(String userName);
    List<User> getUserList();
}
