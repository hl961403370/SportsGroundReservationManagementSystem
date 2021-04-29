package com.hl.prms.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Message {
    //编号
    private int mid;
    //用户编号
    private int uid;
    //创建时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date createTime;
    //内容
    private String comment;
    //状态 0已读 1未读
    private int mstatus;
    //用户对象
    private User user;

    public int getMid() {
        return mid;
    }

    public void setMid(int mid) {
        this.mid = mid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getMstatus() {
        return mstatus;
    }

    public void setMstatus(int mstatus) {
        this.mstatus = mstatus;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Message{" +
                "mid=" + mid +
                ", uid=" + uid +
                ", createTime=" + createTime +
                ", comment='" + comment + '\'' +
                ", mstatus=" + mstatus +
                ", user=" + user +
                '}';
    }
}
