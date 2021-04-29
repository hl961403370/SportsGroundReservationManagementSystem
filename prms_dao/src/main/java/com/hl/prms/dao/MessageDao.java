package com.hl.prms.dao;

import com.hl.prms.entity.Message;
import com.hl.prms.entity.Place;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("messageDao")
public interface MessageDao {
    void insert(Message message);
    void delete(String mid);
    Message select(String mid);
    List<Message> selectAllByStatus(String status);
    void update(String mid);
    List<Message> selectAll();
    List<Message> selectList(String uid);
}
