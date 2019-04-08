<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/page/include/common.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/skin_/form.css" />
<title>${title}-字典管理</title>
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
            <form id="dictForm" method="post" action-url="${rootPath}/dict/saveDict">
            <div class="subfild-content base-info">
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>字典名称</label>
                	<div class="kv-item-content">
                        <input type="hidden" id="id" name="id" value="${dict.id}"/>
                    	<input type="text" placeholder="字典名称" value="${dict.dictName}" class="required" id="dictName" name="dictName" maxlength="30" />
                    </div>
                    <span class="kv-item-tip">字典名称</span>
                </div>
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>字典标识</label>
                	<div class="kv-item-content">
                    	<input type="text" placeholder="字典标识" value="${dict.dictType}" id="dictType" name="dictType" class="required" />
                    </div>
                    <span class="kv-item-tip">代表字典的唯一表示，用于获取该字典列表</span>
                </div>
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>字典索引</label>
                	<div class="kv-item-content">
                    	<input type="text" placeholder="字典索引" value="${dict.dictIndex}" id="dictIndex" name="dictIndex" class="required" />
                    </div>
                    <span class="kv-item-tip">代表字典类型的唯一表示，用于获取该字典类型</span>
                </div>
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>字典描述</label>
                	<div class="kv-item-content">
                    	<input type="text" placeholder="字典描述" value="${dict.dictValue}" id="dictValue" name="dictValue" class="required" />
                    </div>
                    <span class="kv-item-tip">索引对应的值</span>
                </div>
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>是否显示</label>
                	<div class="kv-item-content">
                        <select name="visibled" class="required">
                            <option value="">--是否显示--</option>
                            <option value="false" <c:if test="${dict.visibled == false}">selected="selected"</c:if>>否</option>
                            <option value="true" <c:if test="${dict.visibled == true}">selected="selected"</c:if>>是</option>
                        </select>
                    </div>
                    <span class="kv-item-tip">是否显示</span>
                </div>
            	<div class="kv-item ue-clear">
                	<label>备注</label>
                	<div class="kv-item-content">
                    	<input type="text" placeholder="备注" value="${dict.dictDescription}" id="dictDescription" name="dictDescription"/>
                    </div>
                    <span class="kv-item-tip">备注</span>
                </div>
            </div>
            <div class="buttons">
                <input class="button" type="button" id="submitBtn" value="提交" />
            </div>
            </form>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">
	$('select').select();
	$(function() {
	    $("#submitBtn").on("click", function(){
            submitForm('dictForm');
        });
    })

    /**
     * 提交表单
     * @param formId
     * @returns {boolean}
     */
    submitForm = function(formId) {
        if(!notNULL($(".required"))) {
            return false;
        }
        var actionUtl = $("#" + formId).attr("action-url");
        $.ajax({
            type: "POST",
            dataType: "json",
            url: actionUtl,
            contentType: "application/json;charset=UTF-8",
            data: getFormJsonData($("#" + formId)),
            success: function (result) {
                alert(result.message);
                if (result.success) {
                    location.href = rootPath + '/dict/list';
                }
            },
            error : function() {
                alert("异常！");
            }
        });
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
</script>
</html>
