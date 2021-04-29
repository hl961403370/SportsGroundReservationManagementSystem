<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 场地统计 </h2>
            <p class="lead"></p>
        </div>
        <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
        <div id="statisticPlace" style="width: 600px;height:400px;"></div>
    </div>
</section>
<script type="text/javascript">
    function showChart(){
        $.ajax({
            url:"/statistic/getPlace",
            type:"get",
            dataType:"json",
            success : function(json){
                console.log(json.seriesList);


                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('statisticPlace'));

                // 指定图表的配置项和数据
                option = {
                    title: {
                        text: '场地使用次数统计',
                        left: 'center'
                    },
                    tooltip: {
                        trigger: 'item'
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                    },
                    series: [
                        {
                            name: '场地次数',
                            type: 'pie',
                            radius: '50%',
                            data: json.seriesList,
                            emphasis: {
                                itemStyle: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }
                    ]
                };

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            }
        })
    }
    window.setInterval("showChart()",1000);
</script>
<jsp:include page="bottom.jsp"/>