package com.hl.prms.biz.impl;

import com.github.pagehelper.PageHelper;
import com.hl.prms.biz.MessageBiz;
import com.hl.prms.dao.MessageDao;
import com.hl.prms.entity.Message;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

@Service("messageBiz")
public class MessageBizImpl implements MessageBiz {

    @Resource(name = "messageDao")
    private MessageDao messageDao;

    public void add(Message message) {
        message.setCreateTime(new Date());
        messageDao.insert(message);
    }

    public void remove(String mid) {
        messageDao.delete(mid);
    }

    public Message get(String mid) {
        return messageDao.select(mid);
    }

    public List<Message> getStatus(String status,int page,int size) {
        PageHelper.startPage(page,size);
        return messageDao.selectAllByStatus(status);
    }

    public void edit(String mid) {
        messageDao.update(mid);
    }

    public List<Message> getAll(int page,int size) {
        PageHelper.startPage(page,size);
        return messageDao.selectAll();
    }

    public List<Message> getList() {
        return messageDao.selectAll();
    }

    public List<Message> getSelfList(String uid) {
        return messageDao.selectList(uid);
    }
}
