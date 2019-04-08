<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/page/include/common.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/skin_/form.css" />
<title>${title}-助学管理</title>
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
            <form id="aidedForm" method="post" action-url="${rootPath}/aided/save">
            <div class="subfild-content base-info">
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>受助人姓名</label>
                	<div class="kv-item-content">
                        <input type="hidden" value="${aided.id}" id="id" name="id">
                    	<input type="text" value="${aided.aidedPersonName}" placeholder="受助人姓名" class="required" name="aidedPersonName" maxlength="30" />
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                <div class="kv-item ue-clear">
                    <label><span class="impInfo">*</span>性别</label>
                    <div class="kv-item-content">
                        <select name="sex" class="required">
                            <option value="">--性别--</option>
                            <c:forEach items="${fns:getDictByType('dict_sex')}" var="dict">
                                <option value="${dict.dictIndex}" <c:if test='${dict.dictIndex == aided.sex}'>selected="selected"</c:if>>${dict.dictValue}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                <div class="kv-item ue-clear">
                    <label>联系电话</label>
                    <div class="kv-item-content">
                        <input type="text" value="${aided.phone}" placeholder="联系电话" name="phone" class="required"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                <div class="kv-item ue-clear">
                    <label>微信</label>
                    <div class="kv-item-content">
                        <input type="text" value="${aided.weixin}" placeholder="微信" name="weixin"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
                <div class="kv-item ue-clear">
                    <label>学校信息</label>
                    <div class="kv-item-content">
                        <input type="text" value="${aided.schoolInfo}" placeholder="学校信息" name="schoolInfo" />
                    </div>
                    <span class="kv-item-tip">学校名称 + 年级 + 班级</span>
                </div>
                <div class="kv-item ue-clear">
                    <label>通讯地址</label>
                    <div class="kv-item-content">
                        <input type="text" value="${aided.address}" placeholder="通讯地址" name="address" />
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>受助金额</label>
                	<div class="kv-item-content">
                    	<input type="text" value="${aided.money}" placeholder="捐款金额" name="money" class="required" />
                    </div>
                    <span class="kv-item-tip">（单位：元）</span>
                </div>
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>受助时间</label>
                	<div class="kv-item-content">
                        <input type="text" id="aidedDate" name="aidedDate" readonly="readonly" placeholder="捐款时间"
                               value="<fmt:formatDate value='${aided.aidedDate}' type='both' pattern='yyyy-MM-dd'/>"
                               onclick="WdatePicker({dateFmt:'yyyy-MM-dd'});" autocomplete="off" class="Wdate required"/>
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>经手人姓名</label>
                	<div class="kv-item-content">
                    	<input type="text" value="${aided.brokerage}" placeholder="经手人姓名" name="brokerage" class="required" />
                    </div>
                    <span class="kv-item-tip"></span>
                </div>
            	<div class="kv-item ue-clear">
                	<label><c:if test="${not empty aided.id}"><span class="impInfo">*</span></c:if>备注</label>
                	<div class="kv-item-content">
                        <input type="text" value="${aided.remarks}" placeholder="备注" name="remarks" <c:if test="${not empty aided.id}">class="required"</c:if> />
                    </div>
                    <span class="kv-item-tip">修改时必填</span>
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
            submitForm("aidedForm");
        });
    })

    function notNULL(obj) {
        var flag = true;
        $.each(obj, function() {
            var _that = $(this);
            if (!_that.val()) {
                _that.parent().next().text("*" + _that.prop("placeholder") + "不能为空").css("color", "red").end();
                // _that.focus();
                flag = false;
            } else {
                _that.parent().next().text("√").css("color", "blue").css("font-weight", "bold");
            }
        });
        return flag;
    }

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
                alert(result.msg);
                if (result.success) {
                    location.href = rootPath + '/aided/list';
                }
            },
            error : function() {
                alert("异常！");
            }
        });
    }
</script>
</html>
