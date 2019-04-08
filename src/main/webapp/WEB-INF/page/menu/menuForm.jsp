<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/page/include/common.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/skin_/form.css" />
<title>${title}-菜单管理</title>
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
                    <label>父级菜单</label>
                    <div class="kv-item-content">
                        <c:set var="allMenu" value="${fns:getMenuList()}"/>
                        <select id="pid" class="required" placeholder="父级菜单">
                            <option value="">--父级菜单--</option>
                            <c:forEach items="${allMenu}" var="menu1">
                                <option value="${menu1.id}" <c:if test="${menu1.id == menu.pid}">selected="selected"</c:if>>${menu1.name}</option>
                                <%--<input type="hidden" id="level${menu1.id}" value="${menu1.level}"/>--%>
                            </c:forEach>
                        </select>
                        <c:forEach items="${allMenu}" var="menu2">
                            <input type="hidden" id="level${menu2.id}" value="${menu2.level}"/>
                        </c:forEach>
                        <input type="hidden" id="level" value="${menu.level}"/>
                        <input type="hidden" id="id" value="${menu.id}"/>
                    </div>
                    <span class="kv-item-tip">父级菜单</span>
                </div>
                <div class="kv-item ue-clear">
                    <label>菜单类型</label>
                    <div class="kv-item-content">
                        <select id="menuType" class="required" placeholder="菜单类型">
                            <option value="">--菜单类型--</option>
                            <c:forEach items="${fns:getDictByType('dict_menu_type')}" var="dict">
                                <option value="${dict.dictIndex}" <c:if test="${dict.dictIndex == menu.menuType}">selected="selected"</c:if>>${dict.dictValue}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <span class="kv-item-tip">菜单类型</span>
                </div>
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>菜单名称</label>
                	<div class="kv-item-content">
                    	<input type="text" placeholder="菜单名称" class="required" id="name" value="${menu.name}" maxlength="30" />
                    </div>
                    <span class="kv-item-tip">菜单名限制在30个字符</span>
                </div>
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>权限标识</label>
                	<div class="kv-item-content">
                    	<input type="text" placeholder="权限标识" class="required" value="${menu.authority}" id="authority"/>
                    </div>
                    <span class="kv-item-tip">例如系统管理-菜单管理：sys:manager:menu</span>
                </div>
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>菜单描述</label>
                	<div class="kv-item-content">
                    	<input type="text" placeholder="菜单描述" id="description" value="${menu.description}"/>
                    </div>
                    <span class="kv-item-tip">描述菜单作用</span>
                </div>
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>访问路径</label>
                	<div class="kv-item-content">
                    	<input type="text" placeholder="访问路径" id="url" value="${menu.url}"/>
                    </div>
                    <span class="kv-item-tip">访问路径</span>
                </div>
            	<div class="kv-item ue-clear">
                	<label>请求方法</label>
                	<div class="kv-item-content">
                        <select id="method" class="required">
                            <option value="">--请求方法--</option>
                            <option value="POST" <c:if test="${menu.method == 'POST'}">SELECTED="selected"</c:if>>POST</option>
                            <option value="GET" <c:if test="${menu.method == 'GET'}">SELECTED="selected"</c:if>>GET</option>
                        </select>
                    </div>
                    <span class="kv-item-tip">请求方法</span>
                </div>
                <div class="kv-item ue-clear">
                    <label>是否可见:</label>
                    <div class="kv-item-content">
                        <select id="visible" class="required">
                            <option value="">--是否可见--</option>
                            <option value="0" <c:if test="${menu.visible == '0'}">SELECTED="selected"</c:if>>不可见</option>
                            <option value="1" <c:if test="${menu.visible == '1'}">SELECTED="selected"</c:if>>可见</option>
                        </select>
                    </div>
                    <span class="kv-item-tip">是否可见</span>
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

    /*var treeSetting = {
        isSimpleData : true,              //数据是否采用简单 Array 格式，默认false
        treeNodeKey : "id",               //在isSimpleData格式下，当前节点id属性
        treeNodeParentKey : "pid",        //在isSimpleData格式下，当前节点的父节点id属性
        showLine : true,                  //是否显示节点间的连线
        checkable : true                  //每个节点上是否显示 CheckBox
    };*/


	$(function() {
	    $("#submitBtn").on("click", function(){
            saveMenu();
        });

	    $("#pid").on("change", function() {
	        var pid = $(this).val();
	        $("#level").val(Number($("#level" + pid).val()) + 1);
        })
        // getMenuTree();
    })

    /*function getMenuTree() {
        $.ajax({
            url: rootPath + "/menu/getListData",
            type: "post",
            dataType: "json",
            success: function(result) {
                if (result && result.success) {
                    var menus = result.data;
                    $.fn.zTree.init($("#menuTree"), treeSetting, menus);
                    // var zTree = $("#menuTree").zTree(treeSetting, menus).init();
                } else {
                    $.alert({content: "暂无菜单数据"})
                }
            }, error: function(error) {
                $.alert({content: "获取菜单请求失败"});
            }
        })
    }*/

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

    function saveMenu() {
	    //非空验证
        if (!notNULL($(".required"))) {
            return;
        }

        var jsonStr = {id: $("#id").val(), name: $('#name').val(), authority: $("#authority").val(), description: $('#description').val(),
                        url: $('#url').val(), pid: $('#pid').val(), method: $('#method').val(),
                        menuType: $('#menuType').val(), visible: $('#visible').val(), level: Number($("#level").val()) + 1};

        $.ajax({
            url: "${rootPath}/menu/saveMenu",
            type: "post",
            dataType: "json",
            data: jsonStr,
            success: function(data) {
                $.alert({title: "保存菜单", content: data.message, boxWidth: "300px"});
                if (data.success) {
                    location.href = rootPath + "/menu/list";
                }
            }, error: function(){
                $.alert({title: "保存菜单", content: "请求错误", boxWidth: "300px"});
            }
        })
    }
</script>
</html>
