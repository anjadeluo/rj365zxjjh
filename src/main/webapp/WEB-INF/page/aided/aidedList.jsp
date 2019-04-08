<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/page/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/skin_/table.css" />
    <title>${title}-助学信息</title>
</head>

<body>
<div id="container">
    <div id="hd"></div>
    <div id="bd">
        <div id="main">
            <div class="search-box ue-clear">
                <div class="search-area">
                    <div class="kv-item ue-clear">
                        <label style="height: 30px!important;">学生姓名:</label>
                        <div class="kv-item-content">
                            <input type="text" placeholder="学生姓名"  id="name" maxlength="30" style="height: 30px!important;width: 300px!important;"/>
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
                        <a href="${rootPath}/aided/editData" class="add">
                            <i class="icon"></i>
                            <span class="text">添加</span>
                        </a>
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
                                        <th name="id" width="5%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">序号</span></div>
                                        </th>
                                        <th name="name" width="8%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">受助人姓名</span></div>
                                        </th>
                                        <th name="name" width="5%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">性别</span></div>
                                        </th>
                                        <th width="8%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">联系电话</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="8%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">微信号</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="8%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">学校信息</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="8%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">受助金额（元）</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="8%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">受助时间</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="8%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">经手人姓名</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="12%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">通讯地址</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="10%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">备注</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="10%" align="center">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">操作</span><span class="ui-table-drag"></span></div>
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
            url: rootPath + "/aided/getListData",
            data: {username: seachText, currentPage: currentPage, pageSize: pageSize},
            type: "post",
            dataType: "json",
            success: function(result) {
                if (result && result.success) {
                    var aideds = result.data;
                    var html = "";
                    for(var i=0;i < aideds.length;i++) {
                        html += "<tr>\n" +
                            "        <td>\n<div class=\"ui-table-td\"><input type=\"checkbox\" value='" + aideds[i].id + "'></div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">" + (currentPage * pageSize + 1 + i) + "</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+aideds[i].aidedPersonName+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+(aideds[i].sex == 1?'男':'女')+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+aideds[i].phone+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+aideds[i].weixin+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+aideds[i].schoolInfo+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+aideds[i].money+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+aideds[i].aidedDate.replace(" 00:00:00", "")+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+aideds[i].brokerage+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+aideds[i].address+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+aideds[i].remarks+"</div>\n</td>\n" +
                            "        <td align='center'>\n" +
                            "           <div class=\"ui-table-td\">" +
                            <sec:authorize access="hasRole('ROLE_SUPER_ADMIN')">
                            "              <a href=\"${rootPath}/aided/editData?id="+ aideds[i].id +"\">修改</a>&nbsp;" +
                            "              <a href=\"javascript:void(0);\" onclick=\"javascript:deleteData(" + aideds[i].id + ")\">删除</a>" +
                            </sec:authorize>
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
     * 删除信息
     * @param _id
     */
    function deleteData(_id) {
        $.confirm({
            title: '删除受助信息',
            content: '确认删除该受助信息吗？',
            boxWidth: "300px",
            type: 'green',
            icon: 'glyphicon glyphicon-question-sign',
            buttons: {
                ok: {
                    text: '确认',
                    btnClass: 'btn-primary',
                    action: function() {
                        $.ajax({
                            url: "${rootPath}/aided/delete",
                            data: {id: _id},
                            type: "post",
                            success: function(result) {
                                if (result && result.success) {
                                    $.alert({title: "删除受助信息", content: "删除成功", boxWidth: "300px"});
                                    location.reload(true);
                                } else {
                                    $.alert({title: "删除受助信息", content: "删除失败", boxWidth: "300px"});
                                }
                            }, error: function(error) {
                                $.alert({title: "删除受助信息", content: "请求失败", boxWidth: "300px"});
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
