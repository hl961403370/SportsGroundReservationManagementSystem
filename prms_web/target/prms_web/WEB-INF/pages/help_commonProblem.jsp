<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 常见问题 </h2>
            <p class="lead"></p>
        </div>
        <div class="col-md-6">
            <div>
                <a  href="#" class="aShow"><h2> 问题一 如何修改密码？ </h2></a>
            </div>
            <div>
                <a href="#" class="bShow"><h2> 问题二 如何预约场地？ </h2></a>
            </div>
            <div>
                <a href="#" class="cShow"><h2> 问题三 如何升级vip？  </h2></a>
            </div>
        </div>
        <div class="col-md-6">
            <div  class="a"  style="display:none">
                <h2>(1)点击导航栏的修改密码</h2>
                <h2>(2)填入原始密码、新密码、重复密码</h2>
                <h2>(3)点击修改</h2>
                <h2>(4)下次登录即可使用新密码</h2>
            </div>
            <div  class="b"  style="display:none">
                <h2>(1)点击导航栏的查看场地</h2>
                <h2>(2)翻阅自己需要预约的场地</h2>
                <h2>(3)点击右侧预约</h2>
                <h2>(4)选择需要的预约时间</h2>
                <h2>(5)点击下方预约</h2>
                <h2>(6)选择支付或者不支付</h2>
            </div>
            <div  class="c"  style="display:none">
                <h2>(1)点击导航栏的个人预约</h2>
                <h2>(2)查看消费总额</h2>
                <h2>(3)消费规则</h2>
                <h2>&nbsp&nbsp&nbsp1.消费总金额达到500元即可达到vip1</h2>
                <h2>&nbsp&nbsp&nbsp2.消费总金额达到1000元即可达到vip2</h2>
                <h2>(4)给管理员留言或者到场地时与管理员交互</h2>
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