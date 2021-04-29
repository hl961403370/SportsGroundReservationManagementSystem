<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 入门与使用 </h2>
            <p class="lead"></p>
        </div>
        <div class="col-md-6">
            <a  href="#" class="aShow"><h2> 最佳实践 </h2></a>
        </div>
        <div class="col-md-6">
            <a  href="#" class="bShow"><h2> 快速入门 </h2></a>
        </div>
        <div>
            <div  class="a"  style="display:none">
                <img src="/upload/录像99.gif" class="img-responsive">
            </div>
            <div  class="b"  style="display:none">
                <img src="/upload/录像101.gif" class="img-responsive">
            </div>
        </div>
    </div>
</section>
<script>
    $(document).ready(function(e) {
        $(".aShow").click(function(e) {
            $(".a").toggle();
            var flag=$(".b").is(":hidden");
            if (flag == false){
                $(".b").toggle();
            }
        })
    });
    $(document).ready(function(e) {
        $(".bShow").click(function(e) {
            $(".b").toggle();
            var flag=$(".a").is(":hidden");
            if (flag == false){
                $(".a").toggle();
            }
        });
    });
</script>
<jsp:include page="bottom.jsp"/>