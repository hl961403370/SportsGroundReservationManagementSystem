<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 添加留言 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <form:form action="/message/add" modelAttribute="message" id="admin-form" name="addForm">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 基本信息 </span>
                        </div>
                        <div class="section row">
                            <h3>用户编号</h3>
                            <label for="user.id" class="field prepend-icon">
                                <form:input path="user.id" cssClass="gui-input" placeholder="编号..."/>
                                <label for="user.id" class="field-icon">
                                    <i class="fa fa-user"></i>
                                </label>
                            </label>
                        </div>
                        <div class="section">
                            <h3>留言内容</h3>
                            <label for="comment" class="field prepend-icon">
                                <form:input path="comment" cssClass="gui-input" placeholder="内容..."/>
                                <label for="comment" class="field-icon">
                                    <i class="fa fa-lock"></i>
                                </label>
                            </label>
                        </div>
                        <div class="panel-footer text-right">
                            <button type="submit" class="button"> 保存 </button>
                            <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回 </button>
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="bottom.jsp"/>