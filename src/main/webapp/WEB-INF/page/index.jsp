<%--
  Created by IntelliJ IDEA.
  User: yhsk
  Date: 2017/7/31
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/page/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/skin_/index.css" />
    <script type="text/javascript" src="${ctxStatic}/js/jquery.js"></script>
    <script type="text/javascript" src="${ctxStatic}/js/global.js"></script>
    <script type="text/javascript" src="${ctxStatic}/js/jquery-ui-1.9.2.custom.min.js"></script>
    <title>${title}-首页</title>
    <style>
        canvas{left:20px!important; top: 15px!important;}
    </style>
</head>
<body>
<div id="container">
    <div id="hd">
    </div>
    <div id="bd">
        <div id="main">
            <ul class="content-list">
                <li class="content-item system">
                    <h2 class="content-hd">
                    	<span class="opt">
                        	<span class="refresh" title="刷新" area-id="contributorAndAided"></span>
                            <span class="report" title="导出"></span>
                        </span>
                        <span class="title">捐资情况（资金流动对比图）</span>
                    </h2>
                    <div class="content-bd" id="contributorAndAided" data-url="${rootPath}/funding/getLineData">
                    </div>
                </li>
                <li class="content-item dothings">
                    <h2 class="content-hd">
                    	<span class="opt">
                        	<span class="refresh" title="刷新" area-id="contributorInfo"></span>
                            <span class="report" title="导出"></span>
                        </span>
                        <span class="title">募资信息</span>
                    </h2>
                    <div class="content-bd">
                        <ul class="content-list things" id="contributorInfo" data-url="${rootPath}/contributor/getListData" onload="getAreaData('contributorInfo')">
                        </ul>
                    </div>
                </li>

                <%--<li class="content-item news">
                    <h2 class="content-hd">
                    	<span class="opt">
                        	<span class="refresh" title="刷新"></span>
                            <!--<span class="setting" title="设置"></span>-->
                            <span class="report" title="导出"></span>
                            <!--<span class="close" title="关闭"></span>-->
                        </span>
                        <span class="title">新闻资讯</span>
                    </h2>
                    <div class="content-bd">
                        <ul class="content-list things">
                            <li class="content-list-item">
                                <i class="icon"></i>
                                <a href="javascript:;">2018/10/1 | 倡议成立“365助学基金会”</a>
                            </li>
                            <li class="content-list-item">
                                <i class="icon"></i>
                                <a href="javascript:;">2018/10/10 | 成立“365助学基金会”理事会</a>
                            </li>
                            <li class="content-list-item">
                                <i class="icon"></i>
                                <a href="javascript:;">2018/10/10 | 制定基金会工作计划</a>
                            </li>
                            <li class="content-list-item">
                                <i class="icon"></i>
                                <a href="javascript:;">2018/10/10 | 制定基金会章程</a>
                            </li>
                            <li class="content-list-item">
                                <i class="icon"></i>
                                <a href="javascript:;">2018/10/20 | 召开理事会会议</a>
                            </li>
                        </ul>
                    </div>
                </li>--%>
                <%--<li class="content-item system">
                    <h2 class="content-hd">
                    	<span class="opt">
                        	<span class="refresh" title="刷新"></span>
                            <span class="report" title="导出"></span>
                        </span>
                        <span class="title">受助学生统计</span>
                    </h2>
                    <div class="content-bd">
                        <img src="${ctxStatic}/img/skin_/pic2.png" height="100%" width="100%" />
                    </div>
                </li>--%>

                <li class="content-item richeng">
                    <h2 class="content-hd">
                    	<span class="opt">
                        	<span class="refresh" title="刷新"  area-id="aidedInfo"></span>
                            <span class="report" title="导出"></span>
                        </span>
                        <span class="title">助学信息</span>
                    </h2>
                    <div class="content-bd">
                        <ul class="content-list things" id="aidedInfo" data-url="${rootPath}/aided/getListData" onload="getAreaData('aidedInfo')">
                        </ul>
                    </div>
                </li>

                <%--<li class="content-item news">
                    <h2 class="content-hd">
                    	<span class="opt">
                        	<span class="refresh" title="刷新"></span>
                            <!--<span class="setting" title="设置"></span>-->
                            <span class="report" title="导出"></span>
                            <!--<span class="close" title="关闭"></span>-->
                        </span>
                        <span class="title">我的消息</span>
                    </h2>
                    <div class="content-bd">
                        <ul class="content-list things">
                            <li class="content-list-item">
                                <i class="icon"></i>
                                <a href="javascript:;">2018/10/1 | 倡议成立“365助学基金会”</a>
                            </li>
                            <li class="content-list-item">
                                <i class="icon"></i>
                                <a href="javascript:;">2018/10/10 | 成立“365助学基金会”理事会</a>
                            </li>
                            <li class="content-list-item">
                                <i class="icon"></i>
                                <a href="javascript:;">2018/10/10 | 制定基金会工作计划</a>
                            </li>
                            <li class="content-list-item">
                                <i class="icon"></i>
                                <a href="javascript:;">2018/10/10 | 制定基金会章程</a>
                            </li>
                            <li class="content-list-item">
                                <i class="icon"></i>
                                <a href="javascript:;">2018/10/20 | 召开理事会会议</a>
                            </li>
                        </ul>
                    </div>
                </li>--%>
            </ul>
        </div>
    </div>
</div>
</body>

<script type="text/javascript" src="${ctxStatic}/common/echarts/echarts.js"></script>
<script type="text/javascript">
    var minwidth = 282;
    resizeWidth();
    $(top.window).resize(function(e) {
        resizeWidth();
    });
    $(function() {
        $( ".content-list" ).sortable({
            revert: true,
            handle:'h2'
        });
        $(".refresh").on("click", function() {
            getAreaData($(this).attr("area-id"));
        })

        $(".content-list .things").each(function(){
            getAreaData($(this).prop("id"));
        });

        loadEchartData('contributorAndAided', {});
    });

    getAreaData = function (areaId) {
        if (areaId == 'contributorAndAided') {
            loadEchartData('contributorAndAided', {});
            return;
        }

        var dataUrl = $("#" + areaId).attr("data-url");
        $.ajax({
            url: dataUrl,
            type: "post",
            dataType: "json",
            success: function(result) {
                if (result && result.success) {
                    var data = result.data;
                    var html = "";
                    if (areaId == 'contributorInfo') {
                        html = trans2ContributorArea(data);
                    } else if (areaId == 'aidedInfo') {
                        html = trans2AidedArea(data);
                    }

                    if (html) {
                        $("#" + areaId).empty().append(html);
                    }
                }
            }
        })
    }

    trans2ContributorArea = function(data) {
        var html = "";
        for(var i=0;i < data.length;i++) {
            html += "<li class=\"content-list-item\">\n<i class=\"icon\"></i>\n" +
                "    <a href=\"javascript:;\">"+ data[i].contributorDate.replace(" 00:00:00", "") +
                "&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;收到【<span style='color: #0000FF;'>" + data[i].name +"</span>】爱心款【<span style='color: red;'>" +
                data[i].money + "</span>】元&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;经手人：<span style='color: #0000FF;'>"+
                data[i].brokerage +"</span></a>\n</li>";
        }
        return html;
    }
    trans2AidedArea = function(data) {
        var html = "";
        for(var i=0;i < data.length;i++) {
            html += "<li class=\"content-list-item\">\n<i class=\"icon\"></i>\n" +
                "    <a href=\"javascript:;\">"+ data[i].aidedDate.replace(" 00:00:00", "") +
                "&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;给予【<span style='color: #0000FF;'>" + data[i].aidedPersonName +"</span>】捐助爱心款【<span style='color: red;'>" +
                data[i].money + "</span>】元&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;经手人：<span style='color: #0000FF;'>"+
                data[i].brokerage +"</span></a>\n</li>";
        }
        return html;
    }

    loadEchartData = function(areaId, param){
        var _url = $("#" + areaId).attr("data-url");
        var myEchart = echarts.init(document.getElementById(areaId));
        myEchart.showLoading({text : "正在努力加载数据..."});
        $.ajax({
            url: _url, dataType:'json', type:'get', data:param,
            success:function(data){
                if (data.success) {
                    if (areaId == "contributorAndAided") {
                        myEchart.setOption(getLineOption(data.data.xAxisData, data.data.seriesData), true);
                        $(window).resize(myEchart.resize);
                        myEchart.hideLoading();
                    }
                } else {
                    myEchart.setOption({
                        title: {text: data.msg, x: 'center', y: 'center'}
                    }, true);
                    myEchart.hideLoading();
                }
            },error: function () {
                for (var i=0;i<chartsOne.length; i++){
                    myEchart.setOption({
                        title: {text: "暂无数据", x: 'center', y: 'center'}
                    }, true);
                    myEchart.hideLoading();
                }
            }
        })
    }

    getLineOption = function(xAxisData, seriesData){
        var option = {
            legend: {
                data:['募集资金','捐出资金']
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    boundaryGap : false,
                    data : xAxisData
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    axisLabel : {
                        formatter: '{value} 元'
                    }
                }
            ],
            series : [
                {
                    name:'募集资金',
                    type:'line',
                    data:seriesData[0],
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    }
                },
                {
                    name:'捐出资金',
                    type:'line',
                    data:seriesData[1],
                    markPoint : {
                        data : [
                            {type : 'max', name: '最大值'},
                            {type : 'min', name: '最小值'}
                        ]
                    }
                }
            ]
        };

        return option;
    }

    function resizeWidth (){
        if($('#main').width() / 3 < minwidth){
            $('.content-item').width(($('#main').width() / 2) - 15);
        }else{
            $('.content-item').width(($('#main').width() / 3) - 15);
        }
    }
</script>
</html>
