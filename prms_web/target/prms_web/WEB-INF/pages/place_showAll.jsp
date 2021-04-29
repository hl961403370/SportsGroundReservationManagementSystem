<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 场地列表 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel  heading-border">
                <div class="panel-menu">
                    <div class="row">
                        <div class="hidden-xs hidden-sm col-md-3">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-refresh" onclick="javascript:window.location.reload();"></i>
                                </button>
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-9 text-right">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default light">
                                    <%-- 首页 --%>
                                    <i class="fa fa-angle-double-left"
                                       onclick="javascript:window.location.href='/place/showAll?page=1&siez=2';">
                                    </i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <%-- 上一页 --%>
                                    <i class="fa fa-chevron-left"
                                       onclick="javascript:window.location.href='/place/showAll?page=${ps.pageNum -1}&siez=2';">
                                    </i>
                                </button>
                                <button class="btn btn-default light">
                                    <%-- 页数 --%>
                                    <span>${ps.pageNum}/${ps.pages}</span>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <%-- 下一页 --%>
                                    <i class="fa fa-chevron-right"
                                       onclick="javascript:window.location.href='/place/showAll?page=${ps.pageNum +1}&siez=2';">
                                    </i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <%-- 尾页 --%>
                                    <i class="fa fa-angle-double-right"
                                       onclick="javascript:window.location.href='/place/showAll?page=${ps.pages}&siez=2';">
                                    </i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel-body pn">
                    <table id="message-table" class="table admin-form theme-warning tc-checkbox-1">
                        <thead>
                        <tr class="">
                            <th class="hidden-xs">编号</th>
                            <th class="hidden-xs">名称</th>
                            <th class="hidden-xs">种类</th>
                            <th class="hidden-xs">图片</th>
                            <th class="hidden-xs">地址</th>
                            <th class="hidden-xs">数量</th>
                            <th class="hidden-xs">面积</th>
                            <th class="hidden-xs">状况</th>
                            <th class="hidden-xs">介绍</th>
                            <th class="hidden-xs">价格</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="place">
                            <c:if test="${place.pstatus == 0}">
                                <tr class="message-unread" id="place-unable">
                                    <td>${place.pid}</td>
                                    <td>${place.pname}</td>
                                    <td>${place.ptype}</td>
                                    <td><img src=${place.pprofileImg} class="img-responsive"></td>
                                    <td>${place.plocation}</td>
                                    <td>${place.pnumber}</td>
                                    <td>${place.parea}平方米</td>
                                    <td>闭馆</td>
                                    <td>${place.pintroduce}</td>
                                    <td>${place.pprice}元/小时</td>
                                    <td>

                                    </td>
                                </tr>
                            </c:if>
                            <c:if test="${ place.pstatus == 1}">
                                <tr class="message-unread">
                                    <td>${place.pid}</td>
                                    <td>${place.pname}</td>
                                    <td>${place.ptype}</td>
                                    <td><img src=${place.pprofileImg} class="img-responsive"></td>
                                    <td>${place.plocation}</td>
                                    <td>${place.pnumber}</td>
                                    <td>${place.parea}平方米</td>
                                    <td>开馆</td>
                                    <td>${place.pintroduce}</td>
                                    <td>${place.pprice}元/小时</td>
                                    <td>
                                        <a href="/reserve/interface?num=0&pid=${place.pid}">预约</a>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
</script>
<style>
    #place-unable>td{
        background-color: lightgrey;
    }
</style>
<jsp:include page="bottom.jsp"/>