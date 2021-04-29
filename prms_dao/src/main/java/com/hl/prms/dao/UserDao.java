package com.hl.prms.dao;

import com.hl.prms.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userDao")
public interface UserDao {
    void insert(User user);
    void update(User user);
    void delete(String userId);
    User select(String userId);
    User selectByUserName(String username);
    List<User> selectAll();
}
