<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/page/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/skin_/table.css" />
    <title>${title}-操作日志</title>
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
                            <input type="text" placeholder="用户名"  id="username" maxlength="30" style="height: 30px!important;width: 300px!important;"/>
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
                        <%--<a href="${rootPath}/contributor/editData" class="add">
                            <i class="icon"></i>
                            <span class="text">添加</span>
                        </a>--%>
                        <%--<a href="javascript:;" class="delete">
                            <i class="icon"></i>
                            <span class="text">删除</span>
                        </a>--%>
                        <%--<a href="javascript:;" class="statistics">
                            <i class="icon"></i>
                            <span class="text">统计</span>
                        </a>--%>
                    </span>
                </div>

                <div class="grid ui-table ui-table-nowrap ui-table-fixed-checkbox ui-table-fixed-opt">
                    <div class="ui-table-panel __panel">
                        <div class="ui-table-tbody ui-scroll-webkit" style="height: 680px;">
                            <div class="__tbodyMain ui-table-main" style="display: block; width: 100%; right: 170px; left: 0px;">
                                <table style="margin-left: 0px; width: 100%;margin-top: 0px;">
                                    <thead>
                                    <tr>
                                        <th name="checkbox" width="2%">
                                            <div class="ui-table-th"><input type="checkbox"></div>
                                        </th>
                                        <th name="id" width="3%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">序号</span></div>
                                        </th>
                                        <th name="name" width="5%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">用户名</span></div>
                                        </th>
                                        <th width="5%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">操作类型</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="10%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">日志标题</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="5%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">日志类型</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="5%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">用户IP地址</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="10%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">操作的URL</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="5%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">操作方法</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="10%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">提交的数据</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="30%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">异常信息</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="10%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">操作时间</span><span class="ui-table-drag"></span></div>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody class="__data" id="tableBody" style="height: 100%;">
                                    <tr>
                                        <td colspan="13" align="center" valign="center" style="height: 90px!important;"><span style="margin-left: 45%;margin-top: 20px;">暂无数据</span></td>
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
    getDataList("", 0, 20);
    $('.pagination').pagination($("#totalCount").val(),{
        callback: function(currentPage){
            getDataList("", currentPage, 20);
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
    function getDataList(seachText, currentPage, pageSize) {
        $.ajax({
            url: rootPath + "/log/getListData",
            data: {username: seachText, currentPage: currentPage, pageSize: pageSize},
            type: "post",
            dataType: "json",
            success: function(result) {
                if (result && result.success) {
                    var logs = result.data;
                    var html = "";
                    for(var i=0;i < logs.length;i++) {
                        html += "<tr>\n" +
                            "        <td>\n<div class=\"ui-table-td\"><input type=\"checkbox\" value='" + logs[i].id + "'></div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">" + (currentPage * pageSize + 1 + i) + "</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+logs[i].username+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+(logs[i].operateType == 0?'登录':logs[i].operateType == 1?'查询':logs[i].operateType == 2?'变更':'删除')+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+logs[i].title+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+logs[i].type+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+logs[i].remoteAddr+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+logs[i].requestUri+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+logs[i].method+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+logs[i].params+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+logs[i].exception+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+logs[i].operateTime+"</div>\n</td>\n" +
                            "     </tr>";
                    }

                    if (html) {
                        $("#tableBody").empty().append(html);
                    }
                }
            }
        })
    }

</script>
</html>
