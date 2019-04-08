<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/page/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/skin_/table.css" />
    <title>${title}-助学申请</title>
</head>

<body>
<div id="container">
    <div id="hd"></div>
    <div id="bd">
        <div id="main">
            <div class="search-box ue-clear">
                <div class="search-area">
                    <div class="kv-item ue-clear">
                        <label style="height: 30px!important;">审批情况:</label>
                        <div class="kv-item-content">
                            <input type="text" placeholder="审批情况"  id="lastStep" maxlength="30" style="height: 30px!important;width: 300px!important;"/>
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
                        <%--<c:if test="${}">--%>
                        <a href="javascript:void(0);" action-url="${rootPath}/funding/editApplication" class="add" id="addApplyBtn">
                            <i class="icon"></i>
                            <span class="text">添加</span>
                        </a>
                        <%--</c:if>--%>
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
                                        <th name="name" width="8%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">姓名</span></div>
                                        </th>
                                        <th width="3%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">性别</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="8%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">联系电话</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="10%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">学校名称</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="8%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">班级</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="8%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">申请时间</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="5%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">当前节点</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="30%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">已完成内容</span><span class="ui-table-drag"></span></div>
                                        </th>
                                        <th width="5%">
                                            <div class="ui-table-th"><span class="ui-table-thTitle">下一节点</span><span class="ui-table-drag"></span></div>
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
    var canApply = "${canApply}";
    var cannotMsg = "${cannotMsg}";
    $('select').select();
    getDataList("", 0, pageSize.pageSize15);
    $('.pagination').pagination($("#totalCount").val(),{
        callback: function(currentPage){
            getDataList("", currentPage, pageSize.pageSize15);
        },
        display_msg: false
    });
    $(".ui-table-panel").scroll($(".__tablescroll"));

    $(function(){
        $("#addApplyBtn").on("click", function() {
            if (canApply == "false") {
                alert(cannotMsg);
                return;
            }
            location.href = $(this).attr("action-url");
        });
    })

    /**
     * 设置列表数据
     * @param seachText
     * @param currentPage
     * @param pageSize
     */
    function getDataList(seachText, currentPage, pageSize) {
        $.ajax({
            url: rootPath + "/funding/getApplicationListData",
            data: {username: seachText, currentPage: currentPage, pageSize: pageSize},
            type: "post",
            dataType: "json",
            success: function(result) {
                if (result && result.success) {
                    var datas = result.data;
                    var html = "";
                    for(var i=0;i < datas.length;i++) {
                        var editBtnLable = "查看", currentStep = "提出申请", nextStep = "资格审查";
                        if (datas[i].lastStep == 1) {editBtnLable = '资格审查'; currentStep = "资格审查"; nextStep = "线下核实";}
                        else if (datas[i].lastStep == 2) {editBtnLable = '线下核实'; currentStep = "线下核实"; nextStep = "理事会审批";}
                        else if (datas[i].lastStep == 3) {editBtnLable = '理事会审批'; currentStep = "理事会审批"; nextStep = "账号确认";}
                        else if (datas[i].lastStep == 4) {editBtnLable = '账号确认'; currentStep = "账号确认"; nextStep = "财务出款";}
                        else if (datas[i].lastStep == 5) {editBtnLable = '财务出款'; currentStep = "财务出款"; nextStep = "上传回执";}
                        else if (datas[i].lastStep == 6) {editBtnLable = '上传回执'; currentStep = "上传回执"; nextStep = "已完成";}
                        else if (datas[i].lastStep == 7) {editBtnLable = '已完成'; currentStep = "已完成"; nextStep = "已完成";}

                        html += "<tr>\n" +
                                   " <td>\n<div class=\"ui-table-td\"><input type=\"checkbox\" value='" + datas[i].id + "'></div>\n</td>\n" +
                                   " <td>\n<div class=\"ui-table-td\">" + (currentPage * pageSize + 1 + i) + "</div>\n</td>\n" +
                                   " <td>\n<div class=\"ui-table-td\">"+datas[i].student.name+"</div>\n</td>\n" +
                                   " <td>\n<div class=\"ui-table-td\">"+(datas[i].student.sex == 1?'男':'女')+"</div>\n</td>\n" +
                                   " <td>\n<div class=\"ui-table-td\">"+datas[i].student.phoneNumber+"</div>\n</td>\n" +
                                   " <td>\n<div class=\"ui-table-td\">"+datas[i].student.currentSchool.schoolName+"</div>\n</td>\n" +
                                   " <td>\n<div class=\"ui-table-td\">"+datas[i].student.currentSchool.schoolClass+"</div>\n</td>\n" +
                                   " <td>\n<div class=\"ui-table-td\">"+datas[i].applyDate+"</div>\n</td>\n" +
                                   " <td>\n<div class=\"ui-table-td\">"+currentStep+"</div>\n</td>\n";
                        if (datas[i].lastStep == 1) {
                            html +=" <td>\n<div class=\"ui-table-td\"></div>\n</td>\n";
                        } else if (datas[i].lastStep == 2) {
                            html +=" <td>\n<div class=\"ui-table-td\">" +
                                "【1.资格审查】 审查人：" + datas[i].checker + " | 审查结果：" + datas[i].checkResult + " | 审查时间：" + datas[i].checkSdate + " ～ " + datas[i].checkSdate + "</div>\n</td>\n";
                        } else if (datas[i].lastStep == 3) {
                            html +=" <td>\n<div class=\"ui-table-td\">" +
                                "【1.资格审查】 审查人：" + datas[i].checker + " | 审查结果：" + datas[i].checkResult + " | 审查时间：" + datas[i].checkSdate + " ～ " + datas[i].checkSdate +
                                "<br/>【2.线下核实】 核实人：" + datas[i].offlineVerifier + " | 核实结果：" + datas[i].offlineVerifyResult + " | 核实时间：" + datas[i].offlineVerifySdate + " ～ " + datas[i].offlineVerifyEdate +
                                "</div>\n</td>\n";
                        } else if (datas[i].lastStep == 4) {
                            html +=" <td>\n<div class=\"ui-table-td\">" +
                                "【1.资格审查】 审查人：" + datas[i].checker + " | 审查结果：" + datas[i].checkResult + " | 审查时间：" + datas[i].checkSdate + " ～ " + datas[i].checkSdate +
                                "<br/>【2.线下核实】 核实人：" + datas[i].offlineVerifier + " | 核实结果：" + datas[i].offlineVerifyResult + " | 核实时间：" + datas[i].offlineVerifySdate + " ～ " + datas[i].offlineVerifyEdate +
                                "<br/>【3.理事审批】 审批人：" + datas[i].approver + " | 审批结果：" + datas[i].approveResult + " | 审批时间：" + datas[i].approveDate +
                                "</div>\n</td>\n";
                        } else if (datas[i].lastStep == 5) {
                            html +=" <td>\n<div class=\"ui-table-td\">" +
                                "【1.资格审查】 审查人：" + datas[i].checker + " | 审查结果：" + datas[i].checkResult + " | 审查时间：" + datas[i].checkSdate + " ～ " + datas[i].checkSdate +
                                "<br/>【2.线下核实】 核实人：" + datas[i].offlineVerifier + " | 核实结果：" + datas[i].offlineVerifyResult + " | 核实时间：" + datas[i].offlineVerifySdate + " ～ " + datas[i].offlineVerifyEdate +
                                "<br/>【3.理事审批】 审批人：" + datas[i].approver + " | 审批结果：" + datas[i].approveResult + " | 审批时间：" + datas[i].approveDate +
                                "<br/>【4.确认账号】 开户行：" + datas[i].bankName + " | 户名：" + datas[i].bankUsername + " | 账号：" + datas[i].bankNo +
                                "</div>\n</td>\n";
                        } else if (datas[i].lastStep == 6) {
                            html +=" <td>\n<div class=\"ui-table-td\">" +
                                "【1.资格审查】 审查人：" + datas[i].checker + " | 审查结果：" + datas[i].checkResult + " | 审查时间：" + datas[i].checkSdate + " ～ " + datas[i].checkSdate +
                                "<br/>【2.线下核实】 核实人：" + datas[i].offlineVerifier + " | 核实结果：" + datas[i].offlineVerifyResult + " | 核实时间：" + datas[i].offlineVerifySdate + " ～ " + datas[i].offlineVerifyEdate +
                                "<br/>【3.理事审批】 审批人：" + datas[i].approver + " | 审批结果：" + datas[i].approveResult + " | 审批时间：" + datas[i].approveDate +
                                "<br/>【4.确认账号】 开户行：" + datas[i].bankName + " | 户名：" + datas[i].bankUsername + " | 账号：" + datas[i].bankNo +
                                "<br/>【5.财务出款】 金  额：" + datas[i].grantMoney + " | 放款时间：" + datas[i].grantDate + " | 会计：" + datas[i].grantAccountant + " | 出纳：" + datas[i].grantCashier +
                                "</div>\n</td>\n";
                        } else if (datas[i].lastStep == 7) {
                            html +=" <td>\n<div class=\"ui-table-td\">" +
                                "【1.资格审查】 审查人：" + datas[i].checker + " | 审查结果：" + datas[i].checkResult + " | 审查时间：" + datas[i].checkSdate + " ～ " + datas[i].checkSdate +
                                "<br/>【2.线下核实】 核实人：" + datas[i].offlineVerifier + " | 核实结果：" + datas[i].offlineVerifyResult + " | 核实时间：" + datas[i].offlineVerifySdate + " ～ " + datas[i].offlineVerifyEdate +
                                "<br/>【3.理事审批】 审批人：" + datas[i].approver + " | 审批结果：" + datas[i].approveResult + " | 审批时间：" + datas[i].approveDate +
                                "<br/>【4.确认账号】 开户行：" + datas[i].bankName + " | 户名：" + datas[i].bankUsername + " | 账号：" + datas[i].bankNo +
                                "<br/>【5.财务出款】 金  额：" + datas[i].grantMoney + " | 放款时间：" + datas[i].grantDate + " | 会计：" + datas[i].grantAccountant + " | 出纳：" + datas[i].grantCashier +
                                "<br/>【6.上传回执】 回执时间：" + datas[i].receiptDate + " | 备注：" + datas[i].receiptRemarks + "</div>\n</td>\n";
                        }
                        html += " <td>\n<div class=\"ui-table-td\">"+nextStep+"</div>\n</td>\n"+
                                " <td align='center'>\n" +
                                "   <div class=\"ui-table-td\">" +
                                "       <a href=\"${rootPath}/funding/applicationInfo?id="+ datas[i].id +"\">查看</a>&nbsp;" +
                                <sec:authorize access="hasRole('ROLE_SUPER_ADMIN')">
                                "       <a href=\"${rootPath}/funding/editData?id="+ datas[i].id +"\">" + editBtnLable + "</a>&nbsp;" +
                                "       <a href=\"javascript:void(0);\" onclick=\"javascript:deleteData(" + datas[i].id + ")\">删除</a>" +
                                </sec:authorize>
                                " </div>\n</td>\n</tr>";
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
            title: '删除申请流程',
            content: '确认删除该申请流程吗？',
            boxWidth: "300px",
            type: 'green',
            icon: 'glyphicon glyphicon-question-sign',
            buttons: {
                ok: {
                    text: '确认',
                    btnClass: 'btn-primary',
                    action: function() {
                        $.ajax({
                            url: "${rootPath}/funding/deleteApplication",
                            data: {id: _id},
                            type: "post",
                            success: function(result) {
                                if (result && result.success) {
                                    $.alert({title: "删除申请流程", content: "删除成功", boxWidth: "300px"});
                                    location.reload(true);
                                } else {
                                    $.alert({title: "删除申请流程", content: "删除失败", boxWidth: "300px"});
                                }
                            }, error: function(error) {
                                $.alert({title: "删除申请流程", content: "请求失败", boxWidth: "300px"});
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
