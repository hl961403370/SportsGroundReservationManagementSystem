<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 金额统计 </h2>
            <p class="lead"></p>
        </div>
        <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
        <div id="statisticMoney" style="width: 600px;height:400px;"></div>
    </div>
</section>
<script type="text/javascript">
    function showChart(){
        $.ajax({
            url:"/statistic/getMoney",
            type:"get",
            dataType:"json",
            success : function(json){
                console.log(json.dateList);
                console.log(json.numList);


                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('statisticMoney'));

                // 指定图表的配置项和数据
                var option = {
                    title : {
                        text : '金额统计分析统计'
                    },
                    tooltip : {},
                    legend : {
                        data : [ '日期' ]
                    },
                    xAxis : {
                        data : json.dateList
                    },
                    yAxis : {},
                    series : [ {
                        name : '日营业额',
                        type : 'bar',
                        data : json.numList
                    } ]
                };

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            }
        })
        }
     window.setInterval("showChart()",1000);
</script>
<jsp:include page="bottom.jsp"/>