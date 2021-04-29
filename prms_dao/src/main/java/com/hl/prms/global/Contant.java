package com.hl.prms.global;

import java.util.ArrayList;
import java.util.List;

//数据字典
public class Contant {

    //身份  校外校内管理员
    public static final String UserOutsideSchool = "居民";
    public static final String UserInSchool = "学生";
    public static final String UserAdministrators = "管理员";
    //消息审阅情况  已读未读
    public static final String MessageRead = "已读";
    public static final String MessageUnread = "未读";

    //预约状态 未付款已付款已取消已完成已有课
    public static final String ReserveUnpaid = "未付款";
    public static final String ReservePaid = "已付款";
    public static final String ReserveCancelled = "已取消";
    public static final String ReserveCompleted = "已完成";
    public static final String ReserveCourse = "已有课";

    //预约表状态 已预约
    public static final String ReserveFinish = "已预约";

    //场地状态 开馆 闭馆
    public static final String PlaceOpen = "开馆";
    public static final String PlaceClose = "闭馆";
}
