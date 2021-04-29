<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 系统介绍 </h2>
            <p class="lead"></p>
        </div>
        <div class="col-md-4">
            <a  href="#" class="aShow"><h2> 系统简介 </h2></a>
            <p class="lead">
            </p>
            <div class="a">
                <br>
                <h2>为了提高使用效率和操作的准确性，同时为了节省更多的有限资源，因此开发了这个基于Web的开放式在线运动场预约管理系统。远程预约是一种全新的网络租用的方式，通过互联网突破了空间和时间的限制，实现了便捷的预约和管理功能。通过设计这样的系统，检索迅速、查找方便、可靠性高、存储量大、保密性好、寿命长、成本低等，我们可以实现了预约管理的系统化、规范化和自动化，这样不仅减少了管理工作量，还提高了管理效率，降低了管理成本。</h2>
            </div>
        </div>
        <div class="col-md-4">
            <a  href="#" class="bShow"><h2> 预约指南 </h2></a>
            <p class="lead">
            </p>
            <div class="b" style="display:none">
                <br>
                <h2>(1)点击导航栏的查看场地</h2>
                <h2>(2)翻阅自己需要预约的场地</h2>
                <h2>(3)点击右侧预约</h2>
                <h2>(4)选择需要的预约时间</h2>
                <h2>(5)点击下方预约</h2>
                <h2>(6)选择支付或者不支付</h2>
                <h2>若不能理解步骤，可前往帮助文档中的入门与使用，有专业视频解说</h2>
            </div>
        </div>
        <div class="col-md-4">
            <a  href="#" class="cShow"><h2> 词汇表 </h2></a>
            <p class="lead">
            </p>
            <div class="c" style="display:none">
                <br>
                <h3>居民： 校外用户</h3>
                <h3>学生： 校内学生</h3>
                <h3>管理员：管理人员</h3>
                <h3>已读： 该留言已审阅</h3>
                <h3>未读： 该留言未审阅</h3>
                <h3>未付款：该预约未支付</h3>
                <h3>已付款：该预约已支付</h3>
                <h3>已取消：该预约已取消</h3>
                <h3>已完成：该预约已完成</h3>
                <h3>已有课：该时间段已有预约</h3>
                <h3>已预约：该时间段已有预约</h3>
                <h3>开馆： 场地开放</h3>
                <h3>闭馆： 场地关闭</h3>
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
            var flag2=$(".c").is(":hidden");
            if (flag2 == false){
                $(".c").toggle();
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
            var flag2=$(".c").is(":hidden");
            if (flag2 == false){
                $(".c").toggle();
            }
        });
    });
    $(document).ready(function(e) {
        $(".cShow").click(function(e) {
            $(".c").toggle();
            var flag=$(".b").is(":hidden");
            if (flag == false){
                $(".b").toggle();
            }
            var flag2=$(".a").is(":hidden");
            if (flag2 == false){
                $(".a").toggle();
            }
        });
    });
</script>
<jsp:include page="bottom.jsp"/>