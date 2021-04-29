<%@ taglib prefix="pd" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 个人信息修改 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <form name="editForm"  method="post" action="/user/update" id="dmin-form" enctype="multipart/form-data">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 基本信息 </span>
                        </div>
                        <div class="section row">
                            <input type="hidden" name="id" id="id" value="${user.id}"/>
                            <div class="col-md-6">
                                <h3>用户名</h3>
                                <label for="userName" class="field prepend-icon">
                                    <input type="text" name="userName" id="username" class="gui-input" placeholder="用户名..." value="${user.userName}" readonly="true"/>
                                    <label for="userName" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <h3>姓名</h3>
                                <label for="name" class="field prepend-icon">
                                    <input type="text" name="name"  id="name" class="gui-input" placeholder="姓名..." value="${user.name}"/>
                                    <label for="name" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                        </div>
                        <div class="section">
                            <h3>性别</h3>
                            <label class="field prepend-icon">
                                <input type="radio" name="sex" value="男" <pd:if test="${user.sex == '男'}">checked="checked"</pd:if>>男
                                <input type="radio" name="sex" value="女" <pd:if test="${user.sex == '女'}">checked="checked"</pd:if>>女
                            </label>
                        </div>
                        <div class="section">
                            <h3>头像</h3>
                            <label for="profileImg" class="field prepend-icon">
                                <input name="profileImg" id="profileImg"  class="file-loading"
                                       type="file" multiple accept=".jpg,.jpeg,.png"
                                       data-show-preview="true" >
                                <img src=${user.profileImg} class="img-responsive">
                                <input name="img" type="hidden" value="${user.profileImg}">
                            </label>
                        </div>
                        <div class="section">
                            <h3>电话</h3>
                            <label for="phoneNumber" class="field prepend-icon">
                                <input type="text" name="phoneNumber"  id="phoneNumber" class="gui-input" value="${user.phoneNumber}" placeholder="电话..."/>
                                <label for="phoneNumber" class="field-icon">
                                    <i class="fa fa-lock"></i>
                                </label>
                            </label>
                        </div>
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