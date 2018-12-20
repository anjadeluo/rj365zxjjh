<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/page/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/skin_/table.css" />
    <title>${title}-用户管理</title>
</head>

<body>
<div id="container">
    <div id="hd"></div>
    <div id="bd">
        <div id="main">
            <div class="search-box ue-clear">
                <div class="search-area">
                    <div class="kv-item ue-clear">
                        <label style="height: 30px!important;">用户名:</label>
                        <div class="kv-item-content">
                            <input type="text" placeholder="用户名"  id="name" maxlength="30" style="height: 30px!important;width: 300px!important;"/>
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
                        <a href="${rootPath}/user/edit" class="add">
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
                                        <th name="checkbox" width="3%">
                                            <div class="ui-table-th"><input type="checkbox"></div>
                                        </th>
                                        <th name="id" width="3%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">序号</span></div>
                                        </th>
                                        <th name="name" width="10%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">用户名</span></div>
                                        </th>
                                        <th width="10%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">昵称</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="10%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">电话</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="10%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">邮箱</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="4%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">是否可用</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="10%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">创建时间</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="10%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">最后登录时间</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="10%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">用户角色</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="20%" align="center">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">操作</span><span class="ui-table-drag"></span></div>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody class="__data" id="tableBody" style="height: 100%;">
                                    <tr>
                                        <td colspan="11" align="center" valign="center" style="height: 90px!important;"><span style="margin-left: 45%;margin-top: 20px;">暂无数据</span></td>
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
    getUserList("", 0, 20);
    $('.pagination').pagination($("#totalCount").val(),{
        callback: function(currentPage){
            getUserList("", currentPage, 20);
        },
        display_msg: false
    });

    $(".ui-table-panel").scroll($(".__tablescroll"));

    /**
     * 设置列表数据
     * @param seachText
     * @param currentPage
     * @param pageSize
     */
    function getUserList(seachText, currentPage, pageSize) {
        $.ajax({
            url: rootPath + "/user/getListData",
            data: {username: seachText, currentPage: currentPage, pageSize: pageSize},
            type: "post",
            dataType: "json",
            success: function(result) {
                if (result && result.success) {
                    var users = result.data;
                    var html = "";

                    for(var i=0;i < users.length;i++) {
                        html += "<tr>\n" +
                            "        <td>\n<div class=\"ui-table-td\"><input type=\"checkbox\" value='" + users[i].id + "'></div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">" + (currentPage * pageSize + 1 + i) + "</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+users[i].username+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+users[i].nickname+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+users[i].telephone+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+users[i].email+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+(users[i].enabled?"活动":"禁用")+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+users[i].createDate+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+users[i].lastLoginAt+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+(users[i].role != null?users[i].role.description:"")+"</div>\n</td>\n" +
                            "        <td align='center'>\n" +
                            "           <div class=\"ui-table-td\">" +
                            "              <a href=\"${rootPath}/user/info?id="+ users[i].id + "\">查看</a>&nbsp;" +
                            "              <a href=\"${rootPath}/user/resetPwd?id="+ users[i].id +"\">重置密码</a>&nbsp;" +
                            "              <sec:authorize access='hasRole(\"ROLE_SUPER_ADMIN\")'>"+
                            "              <a href=\"${rootPath}/user/edit?username="+ users[i].username +"\">编辑</a>&nbsp;" +
                            "              <a href=\"javascript:void(0);\" url= \"${rootPath}/user/setRole?id="+ users[i].id +"\">角色管理</a>&nbsp;" +
                            "              <a href=\"javascript:void(0);\" onclick=\"javascript:forbiddenUser(" + users[i].id + ","+users[i].enabled+")\">"+(users[i].enabled?"禁用":"启用")+"</a>" +
                            "              <a href=\"javascript:void(0);\" onclick=\"javascript:deleteUser(" + users[i].id + ")\">删除</a>" +
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
     * 删除用户信息
     * @param userid
     */
    function deleteUser(userid) {
        $.confirm({
            title: '删除用户',
            content: '确认删除该用户吗？',
            boxWidth: "300px",
            type: 'green',
            icon: 'glyphicon glyphicon-question-sign',
            buttons: {
                ok: {
                    text: '确认',
                    btnClass: 'btn-primary',
                    action: function() {
                        $.ajax({
                            url: "${rootPath}/user/delete",
                            data: {userId: userid},
                            type: "post",
                            success: function(result) {
                                if (result && result.success) {
                                    $.alert({title: "删除用户", content: "删除成功", boxWidth: "300px"});
                                    location.reload(true);
                                } else {
                                    $.alert({title: "删除用户", content: "删除失败", boxWidth: "300px"});
                                }
                            }, error: function(error) {
                                $.alert({title: "删除用户", content: "请求失败", boxWidth: "300px"});
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

    /**
     * 禁用用户
     * @param userid
     */
    function forbiddenUser(userid, enabled) {
        var name = enabled?"禁用":"启用";
        $.confirm({
            title: name + '用户',
            content: '确认' + name + '该用户吗？',
            boxWidth: "300px",
            type: 'green',
            icon: 'glyphicon glyphicon-question-sign',
            buttons: {
                ok: {
                    text: '确认',
                    btnClass: 'btn-primary',
                    action: function() {
                        $.ajax({
                            url: "${rootPath}/user/forbiddenUser",
                            data: {userId: userid},
                            type: "post",
                            success: function(result) {
                                if (result && result.success) {
                                    $.alert({title: name + "用户", content: name + "成功", boxWidth: "300px"});
                                    location.reload(true);
                                } else {
                                    $.alert({title: name + "用户", content: name + "失败", boxWidth: "300px"});
                                }
                            }, error: function(error) {
                                $.alert({title: name + "用户", content: "请求失败", boxWidth: "300px"});
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
