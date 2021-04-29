<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="top.jsp"/>

<section id="content" class="table-layout animated fadeIn">
    <div class="tray tray-center">
        <div class="content-header">
            <h2> 预约统计 </h2>
            <p class="lead"></p>
        </div>
        <div class="col-md-6">
            <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
            <div id="statisticReserve" style="width: 600px;height:400px;"></div>
        </div>
        <div class="col-md-6">
            <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
            <div id="statisticReserve1" style="width: 600px;height:400px;"></div>
        </div>
    </div>
</section>
<script type="text/javascript">
    function showChart(){
        $.ajax({
            url:"/statistic/getReserve",
            type:"get",
            dataType:"json",
            success : function(json){
                console.log(json.dateList);
                console.log(json.numList);
                console.log(json.seriesList);

                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('statisticReserve'));

                // 指定图表的配置项和数据
                var option = {
                    title : {
                        text : '预约数量分析统计'
                    },
                    tooltip : {},
                    legend : {
                        data : [ '预约量' ]
                    },
                    xAxis : {
                        data : json.dateList
                    },
                    yAxis : {},
                    series : [ {
                        name : '数量',
                        type : 'bar',
                        data : json.numList
                    } ]
                };

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
                // 基于准备好的dom，初始化echarts实例
                var myChart1 = echarts.init(document.getElementById('statisticReserve1'));

                option1 = {
                    title : {
                        text : '近段时间预约状况',
                        left: 'center'
                    },
                    tooltip: {
                        trigger: 'item'
                    },
                    legend: {
                        top: '6%',
                        left: 'center'
                    },
                    series: [
                        {
                            name: '数量',
                            type: 'pie',
                            radius: ['40%', '70%'],
                            avoidLabelOverlap: false,
                            itemStyle: {
                                borderRadius: 10,
                                borderColor: '#fff',
                                borderWidth: 2
                            },
                            label: {
                                show: false,
                                position: 'center'
                            },
                            emphasis: {
                                label: {
                                    show: true,
                                    fontSize: '40',
                                    fontWeight: 'bold'
                                }
                            },
                            labelLine: {
                                show: false
                            },
                            data: json.seriesList,
                        }
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChart1.setOption(option1);
            }
        })
    }
    window.setInterval("showChart()",1000);
</script>
<jsp:include page="bottom.jsp"/>