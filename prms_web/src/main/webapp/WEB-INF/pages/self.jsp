<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="pd" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 个人信息</h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <div class="panel-body bg-light">
                    <div class="section-divider mt20 mb40">
                        <span> 基本信息 </span>
                    </div>
                    <div class="section row">
                        <div class="col-md-2">用户名</div>
                        <div class="col-md-4">${sessionScope.user.userName}</div>
                        <div class="col-md-2">姓名</div>
                        <div class="col-md-4">${sessionScope.user.name}</div>
                    </div>
                    <div class="section row">
                        <div class="col-md-2">性别</div>
                        <div class="col-md-4">${sessionScope.user.sex}</div>
                        <div class="col-md-2">手机</div>
                        <div class="col-md-4">${sessionScope.user.phoneNumber}</div>
                    </div>
                    <div class="section row">
                        <div class="col-md-2">身份</div>
                        <div class="col-md-4">
                            <pd:choose>
                                <pd:when test="${sessionScope.user.identity == 3}">
                                    管理员
                                </pd:when>
                                <pd:when test="${sessionScope.user.identity == 2}">
                                    学生
                                </pd:when>
                                <pd:when test="${sessionScope.user.identity == 1}">
                                    居民
                                </pd:when>
                            </pd:choose>
                        </div>
                        <div class="col-md-2">等级</div>
                        <div class="col-md-4">VIP${sessionScope.user.vip}</div>
                    </div>
                    <div class="section row">
                        <div class="col-md-2">头像</div>
                        <div id="big"  class="col-md-2"><img src="${sessionScope.user.profileImg}" class="img-responsive"></div>
                    </div>
                    <div class="panel-footer text-right">
                        <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>


