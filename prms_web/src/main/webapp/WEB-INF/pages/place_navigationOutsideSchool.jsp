<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 校外导航 </h2>
            <p class="lead"></p>
        </div>
        <div id='allmap'></div>
    </div>
</section>
<script>
    var map = new BMapGL.Map("allmap");
    map.enableScrollWheelZoom();
    map.centerAndZoom(new BMapGL.Point(121.273253,30.174351), 12);
    var walking = new BMapGL.WalkingRoute(map, {renderOptions:{map: map, autoViewport: true}});
    walking.search('余姚北', '宁波大学科学技术学院');
</script>
<jsp:include page="bottom.jsp"/>