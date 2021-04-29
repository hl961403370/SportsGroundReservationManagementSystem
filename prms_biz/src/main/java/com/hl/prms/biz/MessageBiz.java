package com.hl.prms.biz;

import com.hl.prms.entity.Message;

import java.util.List;

public interface MessageBiz {
    void add(Message message);
    void remove(String mid);
    Message get(String mid);
    List<Message> getStatus(String status,int page,int size);
    void edit(String mid);
    List<Message> getAll(int page,int size);
    List<Message> getList();
    List<Message> getSelfList(String uid);
}
