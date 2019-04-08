<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/page/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/skin_/table.css" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/treeTable/jquery.treetable.min.css" />
    <%--<link rel="stylesheet" type="text/css" href="${ctxStatic}/treeTable/jquery.admin.treeTable.css" />--%>
    <script type="text/javascript" src="${ctxStatic}/treeTable/jquery.treetable.min.js"></script>
    <%--<script type="text/javascript" src="${ctxStatic}/treeTable/jquery.admin.treeTable.js"></script>--%>
    <title>${title}-菜单管理</title>
</head>

<body>
<div id="container">
    <div id="hd"></div>
    <div id="bd">
        <div id="main">
            <div class="search-box ue-clear">
                <div class="search-area">
                    <div class="kv-item ue-clear">
                        <label style="height: 30px!important;">菜单名:</label>
                        <div class="kv-item-content">
                            <input type="text" placeholder="菜单名"  id="name" maxlength="30" style="height: 30px!important;width: 300px!important;"/>
                        </div>
                    </div>
                </div>
                <div class="search-button">
                    <input class="button" type="button" value="搜索"/>
                </div>
            </div>
            <input type="hidden" id="totalCount" value="${totalCount}"/>
            <div class="table">
                <div class="opt ue-clear">
                    <span class="pagination sortarea"></span>
                    <span class="optarea">
                        <a href="${rootPath}/menu/edit" class="add">
                            <i class="icon"></i>
                            <span class="text">添加</span>
                        </a>
                        <a href="javascript:;" class="delete">
                            <i class="icon"></i>
                            <span class="text">删除</span>
                        </a>

                        <a href="javascript:;" class="statistics">
                            <i class="icon"></i>
                            <span class="text">统计</span>
                        </a>

                        <a href="javascript:;" class="config">
                            <i class="icon"></i>
                            <span class="text">配置</span>
                        </a>
                    </span>
                </div>

                <%--<div class="grid">--%>
                <div class="grid ui-table ui-table-nowrap ui-table-fixed-checkbox ui-table-fixed-opt">
                    <div class="ui-table-panel __panel">
                        <div class="ui-table-tbody ui-scroll-webkit" style="height: 680px;">
                            <div class="__tbodyMain ui-table-main" style="display: block; width: 100%; right: 170px; left: 0px;">
                                <table id="treeTable" style="margin-left: 0px; width: 100%;margin-top: 0px;">
                                    <thead>
                                    <tr>
                                        <th width="20%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">菜单名</span></div>
                                        </th>
                                        <th width="15%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">菜单描述</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="10%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">权限标识</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="25%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">访问路径</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="5%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">请求方法</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="5%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">菜单类型</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="20%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">操作</span><span class="ui-table-drag"></span></div>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody class="__data" id="tableBody" style="height: 100%;">
                                    <tr>
                                        <td colspan="7" align="center" valign="center" style="height: 90px!important;"><span style="margin-left: 45%;margin-top: 20px;">暂无数据</span></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div style="visibility: hidden;"></div>
                </div>
                <%--</div>--%>

                <%--<div class="pagination"></div>--%>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $('select').select();
    getMenuList(0);

    /**
     * 设置列表数据
     * @param seachText
     * @param currentPage
     * @param pageSize
     */
    function getMenuList(currentPage) {
        $.ajax({
            url: rootPath + "/menu/getListData",
            data: {currentPage: currentPage},
            type: "post",
            dataType: "json",
            success: function(result) {
                if (result && result.success) {
                    var menus = result.data;
                    var html = "";

                    for(var i=0;i < menus.length;i++) {
                        var menuType = menus[i].menuType == "1"?"功能菜单":"业务菜单";
                        html += "<tr data-tt-id=\""+ menus[i].id +"\" data-tt-parent-id=\""+ menus[i].pid +"\">\n" +
                            "        <td>\n<span class=\"ui-table-td\" style='cursor:pointer;'>"+menus[i].name+"</span>\n</td>\n" +
                            "        <td>\n<span class=\"ui-table-td\">"+menus[i].description+"</span>\n</td>\n" +
                            "        <td>\n<span class=\"ui-table-td\">"+menus[i].authority+"</span>\n</td>\n" +
                            "        <td>\n<span class=\"ui-table-td\">"+menus[i].url+"</span>\n</td>\n" +
                            "        <td>\n<span class=\"ui-table-td\">"+menus[i].method+"</span>\n</td>\n" +
                            "        <td>\n<span class=\"ui-table-td\">"+ menuType +"</span>\n</td>\n" +
                            "        <td align='center'>\n" +
                            "           <span class=\"ui-table-td\">" +
                            "              <sec:authorize access='hasRole(\"ROLE_SUPER_ADMIN\")'>"+
                            "              <a href= \"${rootPath}/menu/edit?id="+ menus[i].id +"\">编辑</a>&nbsp;" +
                            "              <a href=\"javascript:void(0);\" onclick=\"javascript:deleteMenu(" + menus[i].id + ")\">删除</a>" +
                            "              </sec:authorize>" +
                            "           </span>\n" +
                            "        </td>\n" +
                            "     </tr>";
                    }

                    if (html) {
                        $("#tableBody").empty().append(html);
                        $("#treeTable").treetable({
                            // theme: 'vsStyle',
                            expandable: true, //初始折叠
                            // isPadding:true,
                            clickableNodeNames:true,//点击节点名称也打开子节点.
                            indenter : 30//每个分支缩进的像素数。
                        });
                    }
                }
            }
        })
    }

    /**
     * 删除菜单信息
     * @param menuId
     */
    function deleteMenu(menuId) {
        $.confirm({
            title: '删除菜单',
            content: '确认删除该菜单吗？',
            boxWidth: "300px",
            type: 'green',
            icon: 'glyphicon glyphicon-question-sign',
            buttons: {
                ok: {
                    text: '确认',
                    btnClass: 'btn-primary',
                    action: function() {
                        $.ajax({
                            url: "${rootPath}/menu/delete",
                            data: {menuId: menuId},
                            type: "post",
                            success: function(result) {
                                if (result && result.success) {
                                    $.alert({title: "删除菜单", content: "删除成功", boxWidth: "300px"});
                                    location.reload(true);
                                } else {
                                    $.alert({title: "删除菜单", content: "删除失败", boxWidth: "300px"});
                                }
                            }, error: function(error) {
                                $.alert({title: "删除菜单", content: "请求失败", boxWidth: "300px"});
                            }
                        })
                    }
                },
                cancel: {
                    text: '取消',
                    btnClass: 'btn-primary'
                }
            }
        });
    }
</script>
</html>
