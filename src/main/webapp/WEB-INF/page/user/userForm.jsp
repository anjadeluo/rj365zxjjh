<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/page/include/common.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/skin_/form.css" />
<title>${title}-用户管理</title>
</head>

<body>
<div id="container">
	<div id="hd">
    </div>
    <div id="bd">
    	<div id="main">
            <div class="subfild buttons" style="height: 35px!important; margin-bottom: 10px!important;">
                <input class="backbutton" type="button" onclick="javascript:history.go(-1);" value="返回" />
            </div>
            <div class="subfild-content base-info">
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>用户名</label>
                	<div class="kv-item-content">
                        <input type="hidden" value="${user.id}" id="id">
                    	<input type="text" value="${user.username}" placeholder="用户名" onchange="javascript:usernameValid($(this))" class="required" name="username" maxlength="30" />
                    </div>
                    <span class="kv-item-tip">用户名限制在30个字符</span>
                </div>
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>密码</label>
                	<div class="kv-item-content">
                        <input id="oldPassword" type="hidden" value="${user.password}"/>
                    	<input type="password" value="${user.password}" placeholder="密码" class="required" name="password" id="password" onchange="javascript:passwordValid()"/>
                    </div>
                    <span class="kv-item-tip">须同时包含数字、字母和特殊字符</span>
                </div>
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>确认密码</label>
                	<div class="kv-item-content">
                    	<input type="password" value="${user.password}" placeholder="确认密码" class="required" id="confirmPwd" onchange="javascript:passwordValid()" />
                    </div>
                    <span class="kv-item-tip">与密码一致</span>
                </div>
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>昵称</label>
                	<div class="kv-item-content">
                    	<input type="text" value="${user.nickname}" placeholder="昵称" name="nickname" class="required" />
                    </div>
                    <span class="kv-item-tip">用户昵称</span>
                </div>
            	<div class="kv-item ue-clear">
                	<label>联系电话</label>
                	<div class="kv-item-content">
                    	<input type="text" value="${user.telephone}" placeholder="联系电话" name="telephone"/>
                    </div>
                    <span class="kv-item-tip">联系电话</span>
                </div>
            	<div class="kv-item ue-clear">
                	<label>电子邮箱</label>
                	<div class="kv-item-content">
                    	<input type="text" value="${user.email}" placeholder="电子邮箱" name="email" />
                    </div>
                    <span class="kv-item-tip">电子邮箱</span>
                </div>
                <sec:authorize access="hasRole('ROLE_SUPER_ADMIN')">
                <div class="kv-item ue-clear">
                    <label>用户角色:</label>
                    <div class="kv-item-content">
                        <select name="role.id">
                            <option value="">--用户角色--</option>
                            <c:forEach items="${fns:getRoleList()}" var="role">
                                <option value="${role.id}" <c:if test='${role.name == user.role.name}'>selected="selected"</c:if>>${role.description}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <span class="kv-item-tip">用户角色</span>
                </div>
                </sec:authorize>
            </div>
            <div class="buttons">
                <input class="button" type="button" id="submitBtn" value="提交" />
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">
	$('select').select();
	$(function() {
	    $("#submitBtn").on("click", function(){
            registUser();
        });
    })

    /**
     * 用户名存在验证
     * @param obj
     */
    function usernameValid(obj) {
        var flag = true;
        if (obj.val()) {
            $.ajax({
                url: "${rootPath}/user/getByUsername",
                data: {username: obj.val()},
                dataType: "json",
                type: "post",
                async:false,
                success: function(data) {
                    if (data.success) {
                        obj.parent().next().text("*" + obj.prop("placeholder") + "已经存在").css("color", "red").end().focus();
                        flag = false;
                    } else {
                        if (data.message == null || data.message.indexOf("exception") == -1) {
                            obj.parent().next().text("√").css("color", "blue").css("font-weight", "bold");
                            flag = true;
                        } else {
                            obj.parent().next().text("× " + data.message).css("color", "red").end().focus();
                            flag = false;
                        }
                    }
                }, error: function() {
                    flag = false;
                    $.alert({title: "注册用户", content: "请求错误", boxWidth: "300px"});
                }
            })
        }
        return flag;
    }

    function notNULL(obj) {
        var flag = true;
        $.each(obj, function() {
            var _that = $(this);
            if (!_that.val()) {
                _that.parent().next().text("*" + _that.prop("placeholder") + "不能为空").css("color", "red").end().focus();
                flag = false;
            } else {
                _that.parent().next().text("√").css("color", "blue").css("font-weight", "bold");
            }
        });
        return flag;
    }

    function registUser() {
	    //非空验证
        if (!notNULL($(".required"))) {
            return;
        }
        //用户名存在验证
        if (!usernameValid($('[name="username"]'))) {
            return;
        }
        //验证密码
        if(!passwordValid()){
            return;
        }

        var changePwd = false;
        if ($("#id").val() && $("#oldPassword").val() != $("#password")) {
            changePwd = true;
        }

        var jsonStr = {id: $("#id").val(), username: $('[name="username"]').val(), password: $("#password").val(),
                        nickname: $('[name="nickname"]').val(), telephone: $('[name="telephone"]').val(),
                        email: $('[name="email"]').val(), roleId: $('[name="role.id"]').val(),
                        changePwd: changePwd};

        console.info(jsonStr);
        $.ajax({
            url: "${rootPath}/user/regeditUser",
            type: "post",
            dataType: "json",
            data: jsonStr,
            success: function(data) {
                if (data.success) {
                    $.alert({title: "注册用户", content: "注册成功", boxWidth: "300px"});
                } else {
                    $.alert({title: "注册用户", content: data.message, boxWidth: "300px"});
                }
            }, error: function(){
                $.alert({title: "注册用户", content: "请求错误", boxWidth: "300px"});
            }
        })
    }

    function passwordValid() {
        var reg = "^^(?![a-zA-z]+$)(?!\\d+$)(?![!@#$%^&*_-]+$)(?![a-zA-z\\d]+$)(?![a-zA-z!@#$%^&*_-]+$)(?![\\d!@#$%^&*_-]+$)[a-zA-Z\\d!@#$%^&*_-]+$";
        if ($("#password").val().match(reg)) {
            $("#password").parent().next().text("√").css("color", "blue").css("font-weight", "bold");
        } else {
            $("#password").parent().next().text("*密码复杂度不够（须同时包含数字、字母和特殊字符）").css("color", "red");
            $("#password").focus();
            return false;
        }
        if ($("#password").val() && $("#confirmPwd").val() && ($("#password").val() != $("#confirmPwd").val())) {
            $("#confirmPwd").parent().next().text("*密码输入不一致").css("color", "red");
            $("#confirmPwd").focus();
            return false;
        }
        return true;
    }
</script>
</html>
