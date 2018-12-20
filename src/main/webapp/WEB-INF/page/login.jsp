<%--
  Created by IntelliJ IDEA.
  User: yhsk
  Date: 2017/7/31
  Time: 17:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/page/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/skin_/login.css" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/verificationCode/css/jigsaw.css" />

    <script type="text/javascript" src="${ctxStatic}/verificationCode/js/jigsaw.js"></script>
</head>
<body>
<div id="container">
    <div id="bd">
        <div id="main">
            <div class="login-box">
                <div id="logo"></div>
                <h1>榕江365助学基金会</h1>
                <h2>捐资助学是善举，兴学育人是美德！</h2>
                <form id="loginForm" action="${rootPath}/login" method="post">
                    <c:set var="validMsg" value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
                    <span style="position: absolute; top: 190px; left: 212px;color: red;" id="msgLable">${validMsg == 'Bad credentials'?'用户名或密码输入错误':(not empty validMsg?validMsg:msg)}</span>
                    <div class="input username" id="username">
                        <label for="userName">用户名</label>
                        <span></span>
                        <input type="text" class="required" id="userName" name="username" />
                        <span class="asterisk">用户名不能为空</span>
                    </div>
                    <div class="input psw" id="psw">
                        <label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                        <span></span>
                        <input type="password" class="required" id="password"  name="password" />
                        <span class="asterisk">密码不能为空</span>
                    </div>
                    <div class="codeContainer">
                        <div id="captcha" style="position: relative"></div>
                        <div id="codeMsg"></div>
                        <input type="hidden" id="validCode"/>
                    </div>
                    <div id="btn" class="loginButton">
                        <input type="button" class="button" id="loginBtn" value="登录"/>
                        <a href="${rootPath}/user/toRegeditUser" style="margin-left: 15px;">注册用户？</a>
                    </div>
                </form>
            </div>
        </div>
        <%--<div id="ft">CopyRight&nbsp;2018&nbsp;&nbsp;版权所有&nbsp;&nbsp;More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a> &nbsp;&nbsp;</div>--%>
    </div>
</div>
</body>
<script type="text/javascript">
    var height = $(window).height() > 445 ? $(window).height() : 445;
    $("#container").height(height);
    var bdheight = ($(window).height() - $('#bd').height()) / 2 - 20;
    $('#bd').css('padding-top', bdheight);
    $(window).resize(function(e) {
        var height = $(window).height() > 445 ? $(window).height() : 445;
        $("#container").height(height);
        var bdheight = ($(window).height() - $('#bd').height()) / 2 - 20;
        $('#bd').css('padding-top', bdheight);
    });
    $('select').select();

    jigsaw.init(document.getElementById('captcha'),
        function () {
            document.getElementById('codeMsg').innerHTML = '验证成功';
            $("#validCode").val("1");
        }, function() {
            document.getElementById('codeMsg').innerHTML = '验证失败';
            $("#validCode").val("");
        }
    );

    $('#loginBtn').click(function(e) {
        var flag = true;
        $.each($(".required"), function(){
            if (!$(this).val()) {
                flag = false;
                $(this).next().css("display", "block");
            } else {
                $(this).next().css("display", "none");
            }
        });

        if (!flag) {
            return;
        } else {
            if ($("#validCode").val() == "1") {
                $("#loginForm").submit();
            } else {
                $("#msgLable").text("请完善右侧验证码")
            }
        }
    });
</script>
</html>
