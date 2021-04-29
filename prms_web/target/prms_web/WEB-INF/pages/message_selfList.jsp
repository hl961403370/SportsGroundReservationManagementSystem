<%@ page import="com.hl.prms.global.Contant" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 个人留言列表 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel  heading-border">
                <div class="panel-menu">
                    <div class="row">
                        <div class="hidden-xs hidden-sm col-md-3">

                        </div>
                        <div class="col-xs-12 col-md-9 text-right">

                        </div>
                    </div>
                </div>
                <div class="panel-body pn">
                    <table id="message-table" class="table admin-form theme-warning tc-checkbox-1">
                        <thead>
                        <tr class="">
                            <th class="hidden-xs" style="text-align: center">内容</th>
                            <th class="hidden-xs" style="text-align: center">创建时间</th>
                            <th class="hidden-xs" style="text-align: center">状况</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="message">
                            <tr class="message-unread">
                                <td style="text-align: center">${message.comment}</td>
                                <td style="text-align: center"><spring:eval expression="message.createTime"/></td>
                                <c:if test="${message.mstatus == 1}">
                                    <td style="text-align: center">${Contant.MessageUnread}</td>
                                </c:if>
                                <c:if test="${message.mstatus == 0}">
                                    <td style="text-align: center">${Contant.MessageRead}</td>
                                </c:if>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="bottom.jsp"/>