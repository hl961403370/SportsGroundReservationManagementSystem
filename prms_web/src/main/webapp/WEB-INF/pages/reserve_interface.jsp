<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.hl.prms.global.Contant" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 预约时间表 </h2>
            <p class="lead"></p>
        </div>
        <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
            <div class="panel  heading-border">
                <div class="admin-form theme-primary mw1000 center-block">
                    <div class="reserve-date-box" id="reserve-date-box">
                        <%for(int i = 0; i <7; i ++){
                            Date date =new Date(System.currentTimeMillis()+i*24*60*60*1000);
                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                            SimpleDateFormat weekFormat = new SimpleDateFormat("E");
                            String dateStr = dateFormat.format(date);
                            String weekNum = weekFormat.format(date);
                            int num = (int)request.getAttribute("num");
                            if(i==num){
                        %>
                        <div class="reserve-date reserve-date-checked" id="div<%=i%>" onclick="checkWeekNum(this.id)">
                            <div><%=weekNum%></div>
                            <div><%=dateStr%></div>
                        </div>
                        <%
                            }else{
                        %>
                        <div class="reserve-date" id="div<%=i%>" onclick="checkWeekNum(this.id)">
                            <div><%=weekNum%></div>
                            <div><%=dateStr%></div>
                        </div>
                        <%
                            }
                        }
                        %>
                    </div>
                </div>
                <div class="reserve-area-box">
                    <table>
                        <tr>
                            <th>时间</th>
                            <c:forEach begin="1" end="${reservePlace.pnumber}" step="1" var="i">
                                <th>${reservePlace.pname}${i}</th>
                            </c:forEach>
                        </tr>
                        <c:forEach items="${reserveList}" var="placeReserve" varStatus="s">
                            <tr>
                                <th>${hour+s.index+1}:00</th>
                                <c:forEach items="${placeReserve}" var="reserve" varStatus="d">
                                    <c:if test="${reserve>0}">
                                        <td class="reserve-usable" id="${hour+s.index+1}-${reservePlace.pid}-${d.index+1}-${num}" onclick="checkReserve(this.id)">￥${reserve}</td>
                                    </c:if>
                                    <c:if test="${reserve==-1}">
                                        <td class="reserve-unusable">${Contant.ReserveFinish}</td>
                                    </c:if>
                                    <c:if test="${reserve==-2}">
                                        <td class="reserve-unusable">${Contant.ReserveCourse}</td>
                                    </c:if>
                                </c:forEach>
                            </tr>
                        </c:forEach>
                    </table>
                    <div class="reserve-button-box"><button class="reserve-button" onclick="submitReserve()">预约</button></div>
                </div>
            </div>
        </div>
        <div id="reserve-title-day" class="reserve-title-day">
        </div>

    </div>
</section>
<script>
    $("#div0").css("background-color","#38adfd");
    $("#reserve-date-box>div").css("background-color","transparent");
    $(".reserve-date-checked").css("background-color","#38adfd");
    //预约区域列表
    var checkedList = [];
    //预约总金额
    var totalMoney = 0;
    function checkWeekNum(id){
        var num = id.slice(3);
        var pid = ${reservePlace.pid};
        javascript:window.location.href='/reserve/interface?num='+num+'&pid='+pid;
    }
    //预约区域点击事件
    function checkReserve(id){
        var index = checkedList.indexOf(id);
        //判断预约数组中是否含有该区域id
        if(index>-1){
            //有该区域，将该区域id从数组中删除并恢复该区域颜色
            checkedList.splice(index,1);
            $("#"+id).css("background-color","lightgreen");
            var moneyStr = $("#"+id).text();
            totalMoney = totalMoney - parseInt(moneyStr.substring(1))
        }else {
            //无该区域，将该区域id加入数组，并改变该区域颜色
            if(checkedList.length<2){
                checkedList.push(id);
                $("#"+id).css("background-color","lightblue");
                var moneyStr = $("#"+id).text();
                totalMoney = totalMoney + parseInt(moneyStr.substring(1))
            }else {
                alert("最多只可以预约两场哟")
            }
        }
    }
    //提交预约
    function submitReserve(){
        if(checkedList.length>0){
            var result = confirm("确定预约了吗");
            if(result){
                var vip = <c:out value='${sessionScope.user.vip}'/>
                var identity = <c:out value='${sessionScope.user.identity}'/>
                if(vip == 1){
                    totalMoney = totalMoney*0.9
                }
                if(vip == 2){
                    totalMoney = totalMoney*0.8
                }
                if(identity == 2 ){
                    totalMoney = totalMoney*0.5
                }
                var payNow = confirm("您需要支付￥"+totalMoney+",是否现在支付");
                var rstatus = 0;
                if(payNow){
                    rstatus = 1;
                }
                var insertNum = 0;
                var uid = <c:out value='${sessionScope.user.id}'/>
                checkedList.forEach(function (value) {
                    var strList = value.split("-");
                    var rtime = strList[0];
                    var pid = strList[1];
                    var rnumber = strList[2];
                    var today = new Date();
                    var year = today.getFullYear();
                    var month = today.getMonth()+1;
                    var day = today.getDate()+parseInt(strList[3]);
                    var rdate = year+"-"+month+"-"+day;
                    if(month<10){
                        rdate = year+"-0"+month+"-"+day;
                    }
                    if(day<10){
                        rdate = year +"-"+ month +"-0"+ day;
                    }
                    if(month<10&&day<10){
                        rdate = year +"-0"+ month +"-0"+ day;
                    }
                    // javascript:window.location.href='/reserve/add?uid='+uid+'&rtime='+rtime+'&pid='+pid+'&rnumber='+rnumber+'&rdate='+rdate+'&rstatus='+rstatus;
                    $.get('/reserve/addNoJump?uid='+uid+'&rtime='+rtime+'&pid='+pid+'&rnumber='+rnumber+'&rdate='+rdate+'&rstatus='+rstatus+'&rmoney='+totalMoney/checkedList.length,{});
                })
                    setTimeout(function (){
                        javascript:window.location.href='/reserve/listSelf?uid='+${sessionScope.user.id};
                    },500);
            }
        }else {
            alert("请选择你要预约的场次")
        }
    }

    function skip() {

    }
</script>
<style>
    /* 预约日期 */
    .reserve-date{
        font-weight:bold;
        width: 12.5%;
        float: left;
        text-align:center;
        margin-top: 10px;
        padding-top: 10px;
        padding-bottom: 10px;
        background-color: transparent;
    }

    /* 预约日期 鼠标悬浮*/
    .reserve-date:hover{
        color: #00d5ea;
        cursor:pointer
    }

    .reserve-unusable{
        background-color: grey;
        color: white;
    }
    .reserve-usable{
        background-color: lightgreen;
        color: white;
    }
    .reserve-usable:hover{
        color: #00d5ea;
        cursor:pointer
    }
    table{
        margin-top: 85px;
        margin-left: 20px;
        margin-bottom: 20px;
        border:  1px solid lightgrey;
    }
    th{
        width: 100px;
        height: 30px;
        text-align:center;
        border:  1px solid lightgrey;
    }
    td{
        width: 100px;
        height: 30px;
        text-align:center;
        border:  1px solid lightgrey;
    }

    .reserve-button-box{
        margin-top: 20px;
        margin-bottom: 20px;
        text-align: center;
    }

    .reserve-button{
        width: 100px;
        height: 40px;
        background-color: lightblue;
        border: none;
        border-radius: 5px;
    }
</style>
<jsp:include page="bottom.jsp"/>