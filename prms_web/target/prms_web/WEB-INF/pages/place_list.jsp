<%@ page import="com.hl.prms.global.Contant" %>
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
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-trash" onclick="delall()"></i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <i class="fa fa-plus" onclick="javascript:window.location.href='/place/to_add';"></i>
                                </button>
                                <input type="button" id="btn1" value="全选" onclick="checkInterest()">
                                <input type="button"  value="反选" onclick="checkInterest1()">
                            </div>
                        </div>
                        <div class="col-xs-12 col-md-9 text-right">
                            <div class="btn-group">
                                <button type="button" class="btn btn-default light">
                                    <%-- 首页 --%>
                                    <i class="fa fa-angle-double-left"
                                       onclick="javascript:window.location.href='/place/list?page=1&siez=2';">
                                    </i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <%-- 上一页 --%>
                                    <i class="fa fa-chevron-left"
                                       onclick="javascript:window.location.href='/place/list?page=${ps.pageNum -1}&siez=2';">
                                    </i>
                                </button>
                                <button class="btn btn-default light">
                                    <%-- 页数 --%>
                                    <span>${ps.pageNum}/${ps.pages}</span>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <%-- 下一页 --%>
                                    <i class="fa fa-chevron-right"
                                       onclick="javascript:window.location.href='/place/list?page=${ps.pageNum +1}&siez=2';">
                                    </i>
                                </button>
                                <button type="button" class="btn btn-default light">
                                    <%-- 尾页 --%>
                                    <i class="fa fa-angle-double-right"
                                       onclick="javascript:window.location.href='/place/list?page=${ps.pages}&siez=2';">
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
                            <th class="text-center hidden-xs">Select</th>
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
                            <th class="hidden-xs">创建时间</th>
                            <th class="hidden-xs">上一次修改时间</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${list}" var="place">
                            <tr class="message-unread">
                                <td class="hidden-xs">
                                    <label class="option block mn">
                                        <input type="checkbox" name="mobileos" value="${place.pid}">
                                        <span class="checkbox mn"></span>
                                    </label>
                                </td>
                                <td>${place.pid}</td>
                                <td>${place.pname}</td>
                                <td>${place.ptype}</td>
                                <td><img src=${place.pprofileImg} class="img-responsive"></td>
                                <td>${place.plocation}</td>
                                <td>${place.pnumber}</td>
                                <td>${place.parea}平方米</td>
                                <c:if test="${place.pstatus==1}">
                                    <td>${ Contant.PlaceOpen }</td>
                                </c:if>
                                <c:if test="${place.pstatus==0}">
                                    <td>${ Contant.PlaceClose }</td>
                                </c:if>
                                <td>${place.pintroduce}</td>
                                <td>${place.pprice}元/小时</td>
                                <td><spring:eval expression="place.createTime"/></td>
                                <td><spring:eval expression="place.lastEditTime"/></td>
                                <td>
                                    <a href="/place/to_update?pid=${place.pid}">编辑</a>
                                    <a href="/place/remove?pid=${place.pid}">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</section>
<script>
    var flag=true;
    //全选或全不选
    function checkInterest(){
        var interest=document.getElementsByName("mobileos");
        for(i=0;i<interest.length;i++){
            interest[i].checked=flag;
        }
        if(flag){
            document.getElementById("btn1").value="全不选";
        }else{
            document.getElementById("btn1").value="全选";
        }
        flag=!flag;//开关变量
    }

    //反选
    function checkInterest1(){
        var interest=document.getElementsByName("mobileos");
        for(i=0;i<interest.length;i++){
            interest[i].checked=!interest[i].checked;
            console.log(interest[i].value);
        }
    }

    //批量删除
    function delall(){
        alert("确定删除吗？")
        var checkId=[];//定义空数组
        if ($("input[type='checkbox']:checked").length >0){
            $("input[type='checkbox']:checked").each(function (i){
                checkId[i]=$(this).val();
            })
            javascript:window.location.href='/place/removeAll?checkId='+checkId;
        }else{
            alert("请选择你要删除的信息")
        }
    }

</script>
<jsp:include page="bottom.jsp"/>