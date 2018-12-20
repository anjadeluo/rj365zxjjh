<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/page/include/common.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/skin_/form.css" />
<title>${title}-角色管理</title>
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
                	<label><span class="impInfo">*</span>角色名称</label>
                	<div class="kv-item-content">
                        <input type="hidden" id="id" value="${role.id}"/>
                    	<input type="text" placeholder="角色名称" value="${role.name}" onchange="javascript:rolenameValid($(this))" class="required" id="name" maxlength="30" />
                    </div>
                    <span class="kv-item-tip">角色名称限制在30个字符</span>
                </div>
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>角色描述</label>
                	<div class="kv-item-content">
                    	<input type="text" placeholder="角色描述" value="${role.description}" id="description" class="required" />
                    </div>
                    <span class="kv-item-tip">角色描述</span>
                </div>
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
            saveRole();
        });
    })

    /**
     * 用户名存在验证
     * @param obj
     */
    function rolenameValid(obj) {
        var flag = true;
        if (obj.val()) {
            $.ajax({
                url: "${rootPath}/role/getByRolename",
                data: {name: obj.val()},
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
                    alert("请求错误");
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

    function saveRole() {
	    //非空验证
        if (!notNULL($(".required"))) {
            return;
        }
        //用户名存在验证
        if (!rolenameValid($("#name"))) {
            return;
        }

        $.ajax({
            url: "${rootPath}/role/saveRole",
            type: "post",
            dataType: "json",
            data: {id: $("#id").val(), name: $("#name").val(), description: $("#description").val()},
            success: function(data) {
                if (data.success) {
                    $.alert({title: "添加角色", content: "保存成功", boxWidth: "300px"});
                } else {
                    $.alert({title: "添加角色", content: data.message, boxWidth: "300px"});
                }
            }, error: function(){
                $.alert({title: "添加角色", content: "请求错误", boxWidth: "300px"});
            }
        })
    }
</script>
</html>
