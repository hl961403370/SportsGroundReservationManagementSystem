<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hl.prms.global.Contant" %>
<%@ taglib prefix="pd" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>


<!-- Mirrored from admindesigns.com/demos/absolute/1.1/admin_forms-validation.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 06 Aug 2015 02:56:15 GMT -->
<head>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge">
    <title> 运动场预约管理系统 </title>

    <link rel="stylesheet" type="text/css" href="/assets/skin/default_skin/css/theme.css">
    <link rel="stylesheet" type="text/css" href="/assets/admin-tools/admin-forms/css/admin-forms.css">
    <link rel="shortcut icon" href="/assets/img/favicon.ico">
    <script src="/vendor/jquery/jquery-1.11.1.min.js"></script>
    <script src="/vendor/echarts/echarts.min.js"></script>
    <script src="/vendor/jquery/jquery_ui/jquery-ui.min.js"></script>
    <script src="/assets/admin-tools/admin-forms/js/jquery.validate.min.js"></script>
    <script src="/assets/admin-tools/admin-forms/js/additional-methods.min.js"></script>
    <script src="/assets/admin-tools/admin-forms/js/jquery-ui-datepicker.min.js"></script>
    <script src="/assets/js/utility/utility.js"></script>
    <script src="/assets/js/demo/demo.js"></script>
    <script src="/assets/js/main.js"></script>
    <style>
        #container {
            overflow: hidden;
            width: 100%;
            height: 100%;
            margin: 0;
            font-family: "微软雅黑";
        }
        #allmap{
            width: 100%;
            height: 100%
        }
    </style>
    <script src="//api.map.baidu.com/api?type=webgl&v=1.0&ak=cO7kmF5jbRBbPLwHBhhvxKauPSdbFVM5"></script>
</head>

<body class="admin-validation-page" data-spy="scroll" data-target="#nav-spy" data-offset="200">
<div id="main">
    <header class="navbar navbar-fixed-top navbar-shadow">
        <div class="navbar-branding">
            <a class="navbar-brand" href="/index">
                <b>运动场预约管理系统</b>
            </a>
            <span id="toggle_sidemenu_l" class="ad ad-lines"></span>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown-footer">
                <a href="/self" class="dropdown-toggle fw600 p15">
                    <img src=${sessionScope.user.profileImg} alt="avatar" class="mw30 br64">
                    <span class="hidden-xs pl15"> ${sessionScope.user.name} </span>
                </a>
            </li>
            <li class="dropdown-footer">
                <a href="/quit" class="">
                    <span class="fa fa-power-off pr5"></span> 退出 </a>
            </li>
        </ul>
    </header>
    <aside id="sidebar_left" class="nano nano-light affix">
        <div class="sidebar-left-content nano-content">
            <header class="sidebar-header">
                <div class="sidebar-widget author-widget">
                    <div class="media">
                        <a class="media-left" href="#">
                            <img src=${sessionScope.user.profileImg} class="img-responsive">
                        </a>
                        <div class="media-body">
                            <div class="media-author">${sessionScope.user.name}--VIP${sessionScope.user.vip}</div>
                            <div class="media-author">
                                <pd:choose>
                                    <pd:when test="${sessionScope.user.identity == 3}">
                                        ${Contant.UserAdministrators}
                                    </pd:when>
                                    <pd:when test="${sessionScope.user.identity == 2}">
                                        ${Contant.UserInSchool}
                                    </pd:when>
                                    <pd:when test="${sessionScope.user.identity == 1}">
                                        ${Contant.UserOutsideSchool}
                                    </pd:when>
                                </pd:choose>
                            </div>
                            <div class="media-links">
                                <a href="/quit">退出登录</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sidebar-widget search-widget hidden">
                    <div class="input-group">
                        <span class="input-group-addon">
                            <i class="fa fa-search"></i>
                        </span>
                        <input type="text" id="sidebar-search" class="form-control" placeholder="Search...">
                    </div>
                </div>
            </header>
            <ul class="nav sidebar-menu">
                <pd:if test="${sessionScope.user.identity != 3}">
                    <li class="sidebar-label pt20">预约场地</li>
                    <li>
                        <a href="/place/showAll">
                            <span class="glyphicon glyphicon-book"></span>
                            <span class="sidebar-title">查看场地</span>
                            <span class="sidebar-title-tray">
                    <span class="label label-xs bg-primary">New</span>
                  </span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="/place/to_map">
                            <span class="glyphicon glyphicon-home"></span>
                            <span class="sidebar-title">校内地图</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="/place/to_navigation">
                            <span class="glyphicon glyphicon-home"></span>
                            <span class="sidebar-title">校外导航</span>
                        </a>
                    </li>
                    <li>
                        <a href="/reserve/listSelf?uid=${user.id}">
                            <span class="glyphicon glyphicon-book"></span>
                            <span class="sidebar-title">个人预约</span>
                            <span class="sidebar-title-tray">
                <span class="label label-xs bg-primary">New</span>
              </span>
                        </a>
                    </li>
                </pd:if>
                <li class="sidebar-label pt20">个人功能</li>
                <li class="active">
                    <a href="/self">
                        <span class="glyphicon glyphicon-home"></span>
                        <span class="sidebar-title">个人信息</span>
                    </a>
                </li>
                <li class="active">
                    <a href="/user/to_update?id=${user.id}">
                        <span class="glyphicon glyphicon-home"></span>
                        <span class="sidebar-title">修改信息</span>
                    </a>
                </li>
                <li>
                    <a href="/to_change_password">
                        <span class="fa fa-calendar"></span>
                        <span class="sidebar-title">修改密码</span>
                    </a>
                </li>
                <pd:if test="${sessionScope.user.identity != 3}">
                    <li class="sidebar-label pt20">留言功能</li>
                    <li>
                        <a href="/message/to_selfAdd">
                            <span class="fa fa-calendar"></span>
                            <span class="sidebar-title">站长留言</span>
                        </a>
                    </li>
                    <li>
                        <a href="/message/selfList">
                            <span class="fa fa-calendar"></span>
                            <span class="sidebar-title">个人留言</span>
                        </a>
                    </li>
                </pd:if>
                <li class="sidebar-label pt20">帮助功能</li>
                <li>
                    <a class="accordion-toggle" href="#">
                        <span class="fa fa-columns"></span>
                        <span class="sidebar-title">帮助文档</span>
                        <span class="caret"></span>
                    </a>
                    <ul class="nav sub-nav">
                        <li>
                            <a href="/help/systemIntroduction">
                                <span class="glyphicon glyphicon-calendar"></span> 系统介绍 </a>
                        </li>
                        <li class="active">
                            <a href="/help/introductionAndUse">
                                <span class="glyphicon glyphicon-check"></span> 入门与使用 </a>
                        </li>
                        <li class="active">
                            <a href="/help/commonProblem">
                                <span class="glyphicon glyphicon-check"></span> 常见问题 </a>
                        </li>
                    </ul>
                </li>
                <pd:if test="${sessionScope.user.identity == 3}">
                    <li class="sidebar-label pt15">日常维护</li>
                    <li>
                        <a class="accordion-toggle" href="#">
                            <span class="glyphicon glyphicon-check"></span>
                            <span class="sidebar-title">场地管理</span>
                            <span class="caret"></span>
                        </a>
                        <ul class="nav sub-nav">
                            <li>
                                <a href="/place/list">
                                    <span class="glyphicon glyphicon-calendar"></span> 所有场地 </a>
                            </li>
                            <li class="active">
                                <a href="/place/to_add">
                                    <span class="glyphicon glyphicon-check"></span> 添加场地 </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="accordion-toggle" href="#">
                            <span class="fa fa-columns"></span>
                            <span class="sidebar-title">用户管理</span>
                            <span class="caret"></span>
                        </a>
                        <ul class="nav sub-nav">
                            <li>
                                <a href="/user/list">
                                    <span class="glyphicon glyphicon-calendar"></span> 所有用户 </a>
                            </li>
                            <li class="active">
                                <a href="/user/to_add">
                                    <span class="glyphicon glyphicon-check"></span> 添加用户 </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="accordion-toggle" href="#">
                            <span class="fa fa-columns"></span>
                            <span class="sidebar-title">预约管理</span>
                            <span class="caret"></span>
                        </a>
                        <ul class="nav sub-nav">
                            <li>
                                <a href="/reserve/list">
                                    <span class="glyphicon glyphicon-calendar"></span> 所有预约 </a>
                            </li>
                            <li>
                                <a href="/user/to_excel">
                                    <span class="glyphicon glyphicon-calendar"></span> 导入课表 </a>
                            </li>
                            <%--<li class="active">
                                <a href="/reserve/to_add">
                                    <span class="glyphicon glyphicon-check"></span> 添加预约 </a>
                            </li>--%>
                            <li class="active">
                                <a href="/reserve/refresh">
                                    <span class="glyphicon glyphicon-check"></span> 更新状态 </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="accordion-toggle" href="#">
                            <span class="fa fa-columns"></span>
                            <span class="sidebar-title">留言管理</span>
                            <span class="caret"></span>
                        </a>
                        <ul class="nav sub-nav">
                            <li>
                                <a href="/message/list">
                                    <span class="glyphicon glyphicon-calendar"></span> 所有留言 </a>
                            </li>
                            <li class="active">
                                <a href="/message/read?status=1">
                                    <span class="glyphicon glyphicon-check"></span> 未读留言 </a>
                            </li>
                            <li class="active">
                                <a href="/message/read?status=0">
                                    <span class="glyphicon glyphicon-check"></span> 已读留言 </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a class="accordion-toggle" href="#">
                            <span class="fa fa-columns"></span>
                            <span class="sidebar-title">统计信息</span>
                            <span class="caret"></span>
                        </a>
                        <ul class="nav sub-nav">
                            <li>
                                <a href="/statistic/user">
                                    <span class="glyphicon glyphicon-calendar"></span> 用户统计 </a>
                            </li>
                            <li class="active">
                                <a href="/statistic/reserve">
                                    <span class="glyphicon glyphicon-check"></span> 预约统计 </a>
                            </li>
                            <li class="active">
                                <a href="/statistic/place">
                                    <span class="glyphicon glyphicon-check"></span> 场地统计 </a>
                            </li>
                            <li class="active">
                                <a href="/statistic/money">
                                    <span class="glyphicon glyphicon-check"></span> 金额统计 </a>
                            </li>
                        </ul>
                    </li>
                </pd:if>
            </ul>
            <div class="sidebar-toggle-mini">
                <a href="#">
                    <span class="fa fa-sign-out"></span>
                </a>
            </div>
        </div>
    </aside>
    <section id="content_wrapper">