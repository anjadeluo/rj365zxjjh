<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/page/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.css" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/skin_/table.css" />
    <title>${title}-角色管理</title>
</head>

<body>
<div id="container">
    <div id="hd"></div>
    <div id="bd">
        <div id="main">
            <div class="search-box ue-clear">
                <div class="search-area">
                    <div class="kv-item ue-clear">
                        <label style="height: 30px!important;">角色名称:</label>
                        <div class="kv-item-content">
                            <input type="text" placeholder="角色名称"  id="name" maxlength="30" style="height: 30px!important;width: 300px!important;"/>
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
                        <a href="${rootPath}/role/edit" class="add">
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
                                <table style="margin-left: 0px; width: 100%;margin-top: 0px;">
                                    <thead>
                                    <tr>
                                        <th name="checkbox" width="5%">
                                            <div class="ui-table-th"><input type="checkbox"></div>
                                        </th>
                                        <th name="id" width="5%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">序号</span></div>
                                        </th>
                                        <th name="name" width="15%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">角色名称</span></div>
                                        </th>
                                        <th width="15%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">描述</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="10%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">用户数量</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="10%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">权限数量</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="20%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">创建时间</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="20%" align="center">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">操作</span><span class="ui-table-drag"></span></div>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody class="__data" id="tableBody" style="height: 100%;">
                                    <tr>
                                        <td colspan="8" align="center" valign="center" style="height: 90px!important;"><span style="margin-left: 45%;margin-top: 20px;">暂无数据</span></td>
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
    getRoleList(0, 10);
    $('.pagination').pagination($("#totalCount").val(),{
        callback: function(currentPage){
            getRoleList(currentPage, 10);
        },
        display_msg: false
    });

    $(".ui-table-panel").scroll($(".__tablescroll"));

    /**
     * 设置列表数据
     * @param currentPage
     * @param pageSize
     */
    function getRoleList(currentPage, pageSize) {
        $.ajax({
            url: rootPath + "/role/getListData",
            data: {currentPage: currentPage, pageSize: pageSize},
            type: "post",
            dataType: "json",
            success: function(result) {
                if (result && result.success) {
                    var roles = result.data;
                    var html = "";

                    for(var i=0;i < roles.length;i++) {
                        html += "<tr>\n" +
                            "        <td>\n<div class=\"ui-table-td\"><input type=\"checkbox\" value='" + roles[i].id + "'></div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">" + (currentPage * pageSize + 1 + i) + "</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+roles[i].name+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+roles[i].description+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+roles[i].userCount+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+roles[i].menuCount+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+roles[i].createDate+"</div>\n</td>\n" +
                            "        <td align='center'>\n" +
                            "           <div class=\"ui-table-td\">" +
                            "              <sec:authorize access='hasRole(\"ROLE_SUPER_ADMIN\")'>"+
                            "              <a href= \"${rootPath}/role/edit?id=" + roles[i].id +"\">编辑</a>&nbsp;" +
                            "              <a href=\"javascript:void(0);\" onclick= \"javascript:deleteRole(" + roles[i].id +")\">删除</a>&nbsp;" +
                            "              <a href=\"javascript:void(0);\" url= \"${rootPath}/role/setPermission?id=" + roles[i].id +"\">权限管理</a>&nbsp;" +
                            "              <a href=\"javascript:void(0);\" url= \"${rootPath}/role/setUser?id=" + roles[i].id + "\">用户管理</a>" +
                            "              </sec:authorize>" +
                            "           </div>\n" +
                            "        </td>\n" +
                            "     </tr>";
                    }

                    if (html) {
                        $("#tableBody").empty().append(html);
                    }
                }
            }
        })
    }

    /**
     * 删除角色信息
     * @param userid
     */
    function deleteRole(roleId) {
        $.confirm({
            title: '删除角色',
            content: '确认删除该角色吗？',
            boxWidth: "300px",
            type: 'green',
            icon: 'glyphicon glyphicon-question-sign',
            buttons: {
                ok: {
                    text: '确认',
                    btnClass: 'btn-primary',
                    action: function() {
                        $.ajax({
                            url: "${rootPath}/role/delete",
                            data: {roleId: roleId},
                            type: "post",
                            success: function(result) {
                                if (result && result.success) {
                                    $.alert({title: "删除角色", content: "删除成功", boxWidth: "300px"});
                                    location.reload(true);
                                } else {
                                    $.alert({title: "删除角色", content: "删除失败", boxWidth: "300px"});
                                }
                            }, error: function(error) {
                                $.alert({title: "删除角色", content: "请求失败", boxWidth: "300px"});
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
