package com.hl.prms.entity;

import org.springframework.format.annotation.DateTimeFormat;
import java.util.Date;

public class Place {
    //编号
    private String pid;
    //场地名称
    private String pname;
    //地址
    private String plocation;
    //场地图片
    private String pprofileImg;
    //场地数量
    private  int pnumber;
    //场地面积
    private String parea;
    //创建时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date createTime;
    //上一次修改时间
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm")
    private Date lastEditTime;
    //场地状态
    private int pstatus;
    //场地介绍
    private String pintroduce;
    //场地种类
    private String ptype;
    //场地价格
    private String pprice;

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPlocation() {
        return plocation;
    }

    public void setPlocation(String plocation) {
        this.plocation = plocation;
    }

    public String getPprofileImg() {
        return pprofileImg;
    }

    public void setPprofileImg(String pprofileImg) {
        this.pprofileImg = pprofileImg;
    }

    public int getPnumber() {
        return pnumber;
    }

    public void setPnumber(int pnumber) {
        this.pnumber = pnumber;
    }

    public String getParea() {
        return parea;
    }

    public void setParea(String parea) {
        this.parea = parea;
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

    public int getPstatus() {
        return pstatus;
    }

    public void setPstatus(int pstatus) {
        this.pstatus = pstatus;
    }

    public String getPintroduce() {
        return pintroduce;
    }

    public void setPintroduce(String pintroduce) {
        this.pintroduce = pintroduce;
    }

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype;
    }

    public String getPprice() {
        return pprice;
    }

    public void setPprice(String pprice) {
        this.pprice = pprice;
    }

    @Override
    public String toString() {
        return "Place{" +
                "pid='" + pid + '\'' +
                ", pname='" + pname + '\'' +
                ", plocation='" + plocation + '\'' +
                ", pprofileImg='" + pprofileImg + '\'' +
                ", pnumber=" + pnumber +
                ", parea='" + parea + '\'' +
                ", createTime=" + createTime +
                ", lastEditTime=" + lastEditTime +
                ", pstatus=" + pstatus +
                ", pintroduce='" + pintroduce + '\'' +
                ", ptype='" + ptype + '\'' +
                ", pprice='" + pprice + '\'' +
                '}';
    }
}
