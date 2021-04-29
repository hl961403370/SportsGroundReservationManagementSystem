package com.hl.prms.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Reserve {
    //预约编号
    private int rid;
    //用户编号
    private int uid;
    //场地编号
    private int pid;
    //预约时间
    private int rtime;
    //预约几号场地
    private int rnumber;
    //预约日期
    private String rdate;
    //创建时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date createTime;
    //上一次修改时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date lastEditTime;
    //预约状态
    private int rstatus;
    //预约金额
    private double rmoney;
    //用户对象
    private User user;
    //场地对象
    private Place place;

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getRtime() {
        return rtime;
    }

    public void setRtime(int rtime) {
        this.rtime = rtime;
    }

    public int getRnumber() {
        return rnumber;
    }

    public void setRnumber(int rnumber) {
        this.rnumber = rnumber;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLastEditTime() {
        return lastEditTime;
    }

    public void setLastEditTime(Date lastEditTime) {
        this.lastEditTime = lastEditTime;
    }

    public int getRstatus() {
        return rstatus;
    }

    public void setRstatus(int rstatus) {
        this.rstatus = rstatus;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Place getPlace() {
        return place;
    }

    public void setPlace(Place place) {
        this.place = place;
    }

    public String getRdate() {
        return rdate;
    }

    public void setRdate(String rdate) {
        this.rdate = rdate;
    }

    public double getRmoney() {
        return rmoney;
    }

    public void setRmoney(double rmoney) {
        this.rmoney = rmoney;
    }

    @Override
    public String toString() {
        return "Reserve{" +
                "rid=" + rid +
                ", uid=" + uid +
                ", pid=" + pid +
                ", rtime=" + rtime +
                ", rnumber=" + rnumber +
                ", rdate='" + rdate + '\'' +
                ", createTime=" + createTime +
                ", lastEditTime=" + lastEditTime +
                ", rstatus=" + rstatus +
                ", rmoney=" + rmoney +
                ", user=" + user +
                ", place=" + place +
                '}';
    }
}
