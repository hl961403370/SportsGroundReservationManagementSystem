<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="top.jsp"/>
<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 编辑预约 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel heading-border">
                <form:form action="/reserve/update" modelAttribute="reserve" id="admin-form" name="addForm">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 基本信息 </span>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <h3>预约编号</h3>
                                <label for="rid" class="field prepend-icon">
                                    <form:input path="rid" cssClass="gui-input" placeholder="编号..." readonly="true"/>
                                    <label for="rid" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                            <div class="col-md-6">
                                <h3>用户编号</h3>
                                <label for="uid" class="field prepend-icon">
                                    <form:input path="uid" cssClass="gui-input" placeholder="用户编号..." />
                                    <label for="uid" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>
                        </div>
                        <div class="section">
                            <h3>场地编号</h3>
                            <label for="pid" class="field prepend-icon">
                                <form:input path="pid" cssClass="gui-input" placeholder="场地编号..."/>
                                <label for="pid" class="field-icon">
                                    <i class="fa fa-user"></i>
                                </label>
                            </label>
                        </div>
                        <div class="section">
                            <h3>预约时间</h3>
                            <label for="rdate" class="field prepend-icon">
                                <form:input path="rdate" cssClass="gui-input" placeholder="预约时间..."/>
                                <label for="rdate" class="field-icon">
                                    <i class="fa fa-lock"></i>
                                </label>
                            </label>
                        </div>
                        <div class="section">
                            <h3>预约时间段</h3>
                            <label for="rtime" class="field prepend-icon">
                                <form:input path="rtime" cssClass="gui-input" placeholder="预约时间段..."/>
                                <label for="rtime" class="field-icon">
                                    <i class="fa fa-lock"></i>
                                </label>
                            </label>
                        </div>
                        <div class="section">
                            <h3>场地号</h3>
                            <label for="rnumber" class="field prepend-icon">
                                <form:input path="rnumber" cssClass="gui-input" placeholder="场地号..."/>
                                <label for="rnumber" class="field-icon">
                                    <i class="fa fa-lock"></i>
                                </label>
                            </label>
                        </div>
                        <div class="section">
                            <h3>预约状态</h3>
                            <label for="rstatus" class="field prepend-icon">
                                <form:input path="rstatus" cssClass="gui-input" placeholder="预约状态..."/>
                                <label for="rstatus" class="field-icon">
                                    <i class="fa fa-lock"></i>
                                </label>
                            </label>
                        </div>
                        <div class="section">
                            <h3>预约金额</h3>
                            <label for="rmoney" class="field prepend-icon">
                                <form:input path="rmoney" cssClass="gui-input" placeholder="预约金额..." readonly="true"/>
                                <label for="rmoney" class="field-icon">
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