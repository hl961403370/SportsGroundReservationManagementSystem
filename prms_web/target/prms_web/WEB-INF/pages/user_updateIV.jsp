<%@ taglib prefix="pd" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 修改用户身份权限 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <form name="editForm"  method="post" action="/user/updateIV" id="dmin-form">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 基本信息 </span>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <h3>用户身份</h3>
                                <label for="identity" class="field prepend-icon">
                                    <input type="text" name="identity" id="identity" class="gui-input" placeholder="用户身份..." value="${user.identity}"/>
                                    <label for="identity" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <h3>用户等级</h3>
                                <label for="vip" class="field prepend-icon">
                                    <input type="text" name="vip" id="vip" class="gui-input" placeholder="用户等级..." value="${user.vip}"/>
                                    <label for="vip" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                        </div>
                        <input type="hidden" name="id" id="id" value="${user.id}"/>
                        <input type="hidden" name="name" id="name" value="${user.name}"/>
                        <input type="hidden" name="sex" id="sex" value="${user.sex}"/>
                        <input type="hidden" name="passWord" id="passWord" value="${user.passWord}"/>
                        <input type="hidden" name="profileImg" id="profileImg" value="${user.profileImg}"/>
                        <input type="hidden" name="phoneNumber" id="phoneNumber" value="${user.phoneNumber}"/>
                        <div class="panel-footer text-right">
                            <button type="submit" class="button"> 保存 </button>
                            <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>