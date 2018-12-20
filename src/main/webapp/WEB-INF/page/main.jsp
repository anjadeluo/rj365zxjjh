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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=emulateIE7"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/skin_/main.css"/>
    <title>榕江365助学基金会管理系统</title>
</head>
<body>
<div id="container">
    <div id="hd">
        <div class="hd-top" style="margin-top: -6px;">
            <!--<h1 class="logo">榕江365助学基金会管理系统</h1>-->
            <h1 class="logo">榕江365助学基金会管理系统</h1>
            <div class="user-info">
                <a href="javascript:;" class="user-avatar"><span><i class="info-num">2</i></span></a>
                <span class="user-name">${user.username}${not empty user.nickname?"(**".concat(user.nickname.substring(user.nickname.length()-1)).concat(")"):""}</span>
            </div>
            <div class="setting ue-clear">
                <ul class="setting-main ue-clear">
                    <li><a href="javascript:;">个人信息</a></li>
                    <li><a href="javascript:;">修改密码</a></li>
                    <li style="width: 38px !important;"><a href="javascript:;">帮助</a></li>
                    <li style="width: 38px !important;"><a href="javascript:;" class="close-btn exit"></a></li>
                </ul>
            </div>
        </div>
    </div>
    <div id="bd">
        <iframe width="100%" height="100%" id="mainIframe" src="${rootPath}/menu" frameborder="0"></iframe>
    </div>

    <div id="ft" class="ue-clear">
        <div class="ft1 ue-clear">
            <i class="ft-icon1"></i>
            <span>榕江365助学基金会管理系统</span>
        </div>
        <div class="ft2 ue-clear">
            <span>anjadeluo</span>
            <em>V1.0 2018</em>
            <i class="ft-icon2"></i>
        </div>
    </div>
</div>

<div class="exitDialog">
    <div class="content">
        <div class="ui-dialog-icon"></div>
        <div class="ui-dialog-text">
            <p class="dialog-content">你确定要退出系统？</p>
            <p class="tips">如果是请点击“确定”，否则点“取消”</p>

            <div class="buttons">
                <input type="button" class="button long2 ok" value="确定"/>
                <input type="button" class="button long2 normal" value="取消"/>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript" src="${ctxStatic}/js/core.js"></script>
<script type="text/javascript">

    //页面大小自适应
    $("#bd").height($(window).height() - $("#hd").outerHeight() - 26);
    $(window).resize(function (e) {
        $("#bd").height($(window).height() - $("#hd").outerHeight() - 26);
    });

    //退出登录操作 --开始
    $('.exitDialog').Dialog({
        title: '提示信息',
        autoOpen: false,
        width: 400,
        height: 200
    });
    $('.exit').click(function () {
        $('.exitDialog').Dialog('open');
    });
    $('.exitDialog input[type=button]').click(function (e) {
        $('.exitDialog').Dialog('close');
        if ($(this).hasClass('ok')) {
            window.location.href = ctx + "/logout";
        }
    });
    //退出登录操作 --结束

    (function () {
        var totalWidth = 0, current = 1;

        $.each($('.nav').find('li'), function () {
            totalWidth += $(this).outerWidth();
        });

        $('.nav').width(totalWidth);

        function currentLeft() {
            return -(current - 1) * 93;
        }

        $('.nav-btn a').click(function (e) {
            var tempWidth = totalWidth - ( Math.abs($('.nav').css('left').split('p')[0]) + $('.nav-wrap').width() );
            if ($(this).hasClass('nav-prev-btn')) {
                if (parseInt($('.nav').css('left').split('p')[0]) < 0) {
                    current--;
                    Math.abs($('.nav').css('left').split('p')[0]) > 93 ? $('.nav').animate({'left': currentLeft()}, 200) : $('.nav').animate({'left': 0}, 200);
                }
            } else {

                if (tempWidth > 0) {

                    current++;
                    tempWidth > 93 ? $('.nav').animate({'left': currentLeft()}, 200) : $('.nav').animate({'left': $('.nav').css('left').split('p')[0] - tempWidth}, 200);
                }
            }
        });
    })();
</script>
</html>
