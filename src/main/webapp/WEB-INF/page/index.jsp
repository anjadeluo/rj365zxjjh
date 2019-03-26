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
                        	<span class="refresh" title="刷新"></span>
                            <!--<span class="setting" title="设置"></span>-->
                            <span class="report" title="导出"></span>
                            <!--<span class="close" title="关闭"></span>-->
                        </span>
                        <span class="title">捐资情况</span>
                    </h2>
                    <div class="content-bd">
                        <img src="${ctxStatic}/img/skin_/pic1.png" height="100%" width="100%" />
                    </div>
                </li>
                <li class="content-item dothings">
                    <h2 class="content-hd">
                    	<span class="opt">
                        	<span class="refresh" title="刷新"></span>
                            <!--<span class="setting" title="设置"></span>-->
                            <span class="report" title="导出"></span>
                            <!--<span class="close" title="关闭"></span>-->
                        </span>
                        <span class="title">捐款信息</span>
                    </h2>
                    <div class="content-bd">
                        <ul class="content-list things">
                            <li class="content-list-item">
                                <i class="icon"></i>
                                <a href="javascript:;">号召同学们积极捐款</a>
                            </li>
                            <li class="content-list-item">
                                <i class="icon"></i>
                                <a href="javascript:;">调研贫困学生</a>
                            </li>
                            <li class="content-list-item">
                                <i class="icon"></i>
                                <a href="javascript:;">完成网站建设</a>
                            </li>
                            <li class="content-list-item">
                                <i class="icon"></i>
                                <a href="javascript:;">制定基金会章程</a>
                            </li>
                            <li class="content-list-item">
                                <i class="icon"></i>
                                <a href="javascript:;">准备基金会注册材料</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="content-item richeng">
                    <h2 class="content-hd">
                    	<span class="opt">
                        	<span class="refresh" title="刷新"></span>
                            <!--<span class="setting" title="设置"></span>-->
                            <span class="report" title="导出"></span>
                            <!--<span class="close" title="关闭"></span>-->
                        </span>
                        <span class="title">助学信息</span>
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
                </li>

                <li class="content-item system">
                    <h2 class="content-hd">
                    	<span class="opt">
                        	<span class="refresh" title="刷新"></span>
                            <!--<span class="setting" title="设置"></span>-->
                            <span class="report" title="导出"></span>
                            <!--<span class="close" title="关闭"></span>-->
                        </span>
                        <span class="title">受助学生统计</span>
                    </h2>
                    <div class="content-bd">
                        <img src="${ctxStatic}/img/skin_/pic2.png" height="100%" width="100%" />
                    </div>
                </li>

                <li class="content-item news">
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
                </li>

                <li class="content-item news">
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
                </li>
            </ul>
        </div>
    </div>
</div>
</body>

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

    });

    function resizeWidth (){
        if($('#main').width() / 3 < minwidth){
            $('.content-item').width(($('#main').width() / 2) - 15);
        }else{
            $('.content-item').width(($('#main').width() / 3) - 15);
        }

    }
</script>
</html>
