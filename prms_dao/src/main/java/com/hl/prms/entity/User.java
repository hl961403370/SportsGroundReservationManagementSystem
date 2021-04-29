package com.hl.prms.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class User {
    //编号
    private int id;
    //姓名
    private String name;
    //性别
    private String sex;
    //用户名
    private String userName;
    //密码
    private String passWord;
    //头像
    private String profileImg;
    //手机
    private String phoneNumber;
    //创建时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date createTime;
    //上一次修改时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date lastEditTime;
    //身份 1校外 2校内 3管理员
    private int identity;
    //等级 0普通 1vip1 2vip2
    private int vip;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getProfileImg() {
        return profileImg;
    }

    public void setProfileImg(String profileImg) {
        this.profileImg = profileImg;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
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

    public int getIdentity() {
        return identity;
    }

    public void setIdentity(int identity) {
        this.identity = identity;
    }

    public int getVip() {
        return vip;
    }

    public void setVip(int vip) {
        this.vip = vip;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", sex='" + sex + '\'' +
                ", userName='" + userName + '\'' +
                ", passWord='" + passWord + '\'' +
                ", profileImg='" + profileImg + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", createTime=" + createTime +
                ", lastEditTime=" + lastEditTime +
                ", identity=" + identity +
                ", vip=" + vip +
                '}';
    }
}
