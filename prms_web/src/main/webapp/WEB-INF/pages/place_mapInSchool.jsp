<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 校内地图 </h2>
            <p class="lead"></p>
        </div>
        <div id="container"></div>
    </div>
</section>
<script>
    var map = new BMapGL.Map('container'); // 创建Map实例
    map.centerAndZoom(new BMapGL.Point(121.302975, 30.191213), 17); // 初始化地图,设置中心点坐标和地图级别
    map.enableScrollWheelZoom(true); // 开启鼠标滚轮缩放
</script>
<jsp:include page="bottom.jsp"/>