<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/page/include/common.jsp"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/funding/css/application.css" />
<title>${title}-用户管理</title>
</head>
<body>
<div id="formbox">
    <div class="form">
        <form id="studentForm" method="post" action-url="${rootPath}/student/saveStudent">
            <h3>基本信息
                <c:if test="${student.username == username}">
                    <span><button type="button" class="editBtn" id="studentEditBtn" onclick="editForm('studentForm')" style="float: right; width: 50px; height: 30px;">编辑</button></span>
                </c:if>
            </h3>
            <div class="item">
                <span class="label"><span class="red">*</span>姓名：</span>
                <div class="fl">
                    <%--<input type="hidden" id="id" name="strId" value="${student.id}" tabindex="0" />--%>
                    <input type="text" id="name" name="name" class="text required" value="${student.name}" tabindex="1" />
                    <label id="name_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="name_error"></div>
                </div>

                <span class="label"><span class="red">*</span>身份证号：</span>
                <div class="fl">
                    <input type="text" id="idCardNumber" name="idCardNumber" class="text required" value="${student.idCardNumber}" tabindex="2"/>
                    <label id="idCardNumber_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="idCardNumber_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>性别：</span>
                <div class="fl">
                    <select rel="select" id="sex" name="sex" class="select required" tabindex="3">
                        <option value="">--请选择--</option>
                        <c:forEach items="${fns:getDictByType('dict_sex')}" var="dict" varStatus="vs">
                            <option value="${dict.dictIndex}" <c:if test='${dict.dictIndex == student.sex}'>selected="selected"</c:if>>${dict.dictValue}</option>
                        </c:forEach>
                    </select>
                    <label id="sex_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="sex_error"></label>
                </div>
                <span class="label"><span class="red">*</span>身份证有效日期起始：</span>
                <div class="fl">
                    <input type="text" id="idCardStartDate" name="idCardStartDate" readonly="readonly"
                           value="<fmt:formatDate value='${student.idCardStartDate}' type='both' pattern='yyyy-MM-dd'/>"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'idCardEndDate\')}'});" autocomplete="off" class="text Wdate" tabindex="4"/>
                    <label id="idCardStartDate_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="idCardStartDate_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label">年龄：</span>
                <div class="fl">
                    <input type="text" id="age" name="age" class="text" value="${student.age}" tabindex="5"/>
                    <label id="age_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="age_error"></div>
                </div>
                <span class="label">身份证有效日期结束：</span>
                <div class="fl">
                    <input type="text" id="idCardEndDate" name="idCardEndDate" readonly="readonly"
                           value="<fmt:formatDate value='${student.idCardEndDate}' type='both' pattern='yyyy-MM-dd'/>"
                           onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'idCardStartDate\')}'})" autocomplete="off" class="text Wdate" tabindex="6"/>
                    <label id="idCardEndDate_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="idCardEndDate_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>籍贯：</span>
                <div class="fl">
                    <input type="text" id="nativePlace" name="nativePlace" class="text required" value="${student.nativePlace}" tabindex="7" />
                    <label id="nativePlace_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="nativePlace_error"></div>
                </div>
                <span class="label"><span class="red">*</span>民族：</span>
                <div class="fl">
                    <select rel="select" id="nation" name="nation" class="select required" tabindex="8">
                        <option value="">--请选择--</option>
                        <c:forEach items="${fns:getDictByType('dict_nation')}" var="dict" varStatus="vs">
                            <option value="${dict.dictIndex}" <c:if test='${dict.dictIndex == student.nation}'>selected="selected"</c:if>>${dict.dictValue}</option>
                        </c:forEach>
                    </select>
                    <label id="nation_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="nation_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>户口性质：</span>
                <div class="fl">
                    <select rel="select" id="announceType" name="announceType" class="select required" tabindex="9">
                        <option value="">--请选择--</option>
                        <c:forEach items="${fns:getDictByType('dict_announceType')}" var="dict" varStatus="vs">
                            <option value="${dict.dictIndex}" <c:if test='${dict.dictIndex == student.announceType}'>selected="selected"</c:if>>${dict.dictValue}</option>
                        </c:forEach>
                    </select>
                    <label id="announceType_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="announceType_error"></label>
                </div>
                <span class="label">邮政编码：</span>
                <div class="fl">
                    <input type="text" id="mailNumber" name="mailNumber" class="text" value="${student.mailNumber}" tabindex="10" />
                    <label id="mailNumber_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="mailNumber_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label">户口所在地：</span>
                <div class="fl">
                    <input type="text" id="announceAddress" name="announceAddress" class="longtext" value="${student.announceAddress}" tabindex="11" />
                    <label id="announceAddress_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="announceAddress_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>联系电话：</span>
                <div class="fl">
                    <input type="text" id="phoneNumber" name="phoneNumber" class="text required" value="${student.phoneNumber}" tabindex="12" />
                    <label id="phoneNumber_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="phoneNumber_error"></div>
                </div>
                <span class="label">微信号：</span>
                <div class="fl">
                    <input type="text" id="weixinNumber" name="weixinNumber" class="text" value="${student.weixinNumber}" tabindex="13" />
                    <label id="weixinNumber_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="weixinNumber_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label">QQ：</span>
                <div class="fl">
                    <input type="text" id="qqNumber" name="qqNumber" class="text" value="${student.qqNumber}" tabindex="14" />
                    <label id="qqNumber_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="qqNumber_error"></div>
                </div>
                <span class="label">电子邮箱：</span>
                <div class="fl">
                    <input type="text" id="email" name="email" class="text" value="${student.email}" tabindex="15" />
                    <label id="email_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="email_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>通讯地址：</span>
                <div class="fl">
                    <input type="text" id="relatAddress" name="relatAddress" class="longtext required" value="${student.relatAddress}" tabindex="16" />
                    <label id="relatAddress_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="relatAddress_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label">家庭住址：</span>
                <div class="fl">
                    <input type="text" id="homeAddress" name="homeAddress" class="longtext" value="${student.homeAddress}" tabindex="17" />
                    <label id="homeAddress_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="homeAddress_error"></div>
                </div>
            </div><!--item end-->

            <div class="item" style="margin-left: 45%!important;">
                <input type="button" class="yellow_button" id="studentSubmitBtn" onclick="submitForm('studentForm')" value="提交" tabindex="45" />
                <input type="button" class="yellow_button" id="studentCancelBtn" onclick="cancelForm('studentForm')" value="取消" style="background: #ccc!important; margin-left: 10px;"/>
            </div><!--item end-->
        </form>
        <h3>监护人信息
            <c:if test="${student.username == username}">
                <span><button type="button" class="editBtn" id="addGuardian" onclick="editGuardians('')" style="float: right; width: 50px; height: 30px;">添加</button></span>
            </c:if>
        </h3>
        <div class="grid ui-table ui-table-nowrap ui-table-fixed-checkbox ui-table-fixed-opt" style="margin-top: -20px;margin-bottom: 30px;">
            <div class="ui-table-panel __panel">
                <div class="ui-table-tbody ui-scroll-webkit" id="GuardianTable" style="height: 80px;">
                    <div class="__tbodyMain ui-table-main" style="display: block; width: 100%; right: 170px; left: 0px;">
                        <table style="margin-left: 0px; width: 100%;margin-top: 0px;">
                            <thead>
                            <tr>
                                <th name="id" width="3%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">序号</span></div>
                                </th>
                                <th name="name" width="8%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">姓名</span></div>
                                </th>
                                <th width="5%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">年龄</span></div>
                                </th>
                                <th width="10%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">与本人关系</span><span class="ui-table-drag"></span></div>
                                </th>
                                <th width="12%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">身份证号</span><span class="ui-table-drag"></span></div>
                                </th>
                                <th width="8%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">联系电话</span><span class="ui-table-drag"></span></div>
                                </th>
                                <th width="8%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">微信号</span><span class="ui-table-drag"></span></div>
                                </th>
                                <th width="8%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">QQ号</span><span class="ui-table-drag"></span></div>
                                </th>
                                <th width="10%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">电子邮箱</span><span class="ui-table-drag"></span></div>
                                </th>
                                <th width="20%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">通讯地址</span><span class="ui-table-drag"></span></div>
                                </th>
                                <th width="8%" align="center">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">操作</span><span class="ui-table-drag"></span></div>
                                </th>
                            </tr>
                            </thead>
                            <tbody class="__data" id="GuardianTableBody">
                            <tr>
                                <td colspan="11" align="center" valign="center" style="height: 40px!important;"><span style="margin-left: 45%;margin-top: 20px;">暂无数据</span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <form id="studentGuardianForm" method="post" action-url="${rootPath}/student/saveStudentGuardian" style="display: none;">
            <div class="item">
                <span class="label"><span class="red">*</span>姓名：</span>
                <div class="fl">
                    <input type="hidden" id="studentGuardian_id" name="strId" class="text"/>
                    <input type="hidden" id="studentGuardian_studentId" name="studentId" class="text"/>
                    <input type="text" id="studentGuardian_name" name="name" class="text required"/>
                    <label id="studentGuardian_name_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentGuardian_name_error"></label>
                </div>
                <span class="label"><span class="red">*</span>与本人关系：</span>
                <div class="fl">
                    <input type="text" id="studentGuardian_relation" name="relation" class="text required"/>
                    <label id="studentGuardian_relation_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentGuardian_relation_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>身份证号：</span>
                <div class="fl">
                    <input type="text" id="studentGuardian_idCardNumber" name="idCardNumber" class="text required"/>
                    <label id="studentGuardian_idCardNumber_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentGuardian_idCardNumber_error"></div>
                </div>
                <span class="label">年龄：</span>
                <div class="fl">
                    <input type="text" id="studentGuardian_age" name="age" class="text"/>
                    <label id="studentGuardian_age_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentGuardian_age_error"></div>
                </div>
            </div><!--item end-->
            <div class="item">
                <span class="label"><span class="red">*</span>联系电话：</span>
                <div class="fl">
                    <input type="text" id="studentGuardian_phoneNumber" name="phoneNumber" class="text required"/>
                    <label id="studentGuardian_phoneNumber_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentGuardian_phoneNumber_error"></div>
                </div>
                <span class="label">微信号：</span>
                <div class="fl">
                    <input type="text" id="studentGuardian_weixinNumber" name="weixinNumber" class="text"/>
                    <label id="studentGuardian_weixinNumber_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentGuardian_weixinNumber_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label">QQ：</span>
                <div class="fl">
                    <input type="text" id="studentGuardian_qqNumber" name="qqNumber" class="text"/>
                    <label id="studentGuardian_qqNumber_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentGuardian_qqNumber_error"></div>
                </div>
                <span class="label">电子邮箱：</span>
                <div class="fl">
                    <input type="text" id="studentGuardian_email" name="email" class="text"/>
                    <label id="studentGuardian_email_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentGuardian_email_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>工作单位：</span>
                <div class="fl">
                    <input type="text" id="studentGuardian_workspace" name="workspace" class="text required"/>
                    <label id="studentGuardian_workspace_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentGuardian_workspace_error"></div>
                </div>
                <span class="label"><span class="red">*</span>通讯地址：</span>
                <div class="fl">
                    <input type="text" id="studentGuardian_relatAddress" name="relatAddress" class="text required"/>
                    <label id="studentGuardian_relatAddress_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentGuardian_relatAddress_error"></div>
                </div>
            </div><!--item end-->
            <div class="item" style="margin-left: 45%!important;">
                <input type="button" class="yellow_button" id="studentGuardianSubmitBtn" onclick="submitForm('studentGuardianForm')" value="提交" tabindex="45" />
                <input type="button" class="yellow_button" id="studentGuardianCancelBtn" onclick="cancelForm('studentGuardianForm')" value="取消" style="background: #ccc!important; margin-left: 10px;"/>
            </div><!--item end-->
        </form>
        <h3>就学信息
            <c:if test="${student.username == username}">
                <span><button type="button" class="editBtn" id="addSchoolInfo" onclick="editSchoolInfo('')" style="float: right; width: 50px; height: 30px;">添加</button></span>
            </c:if>
        </h3>
        <div class="grid ui-table ui-table-nowrap ui-table-fixed-checkbox ui-table-fixed-opt" style="margin-top: -20px;margin-bottom: 30px;">
            <div class="ui-table-panel __panel">
                <div class="ui-table-tbody ui-scroll-webkit" id="SchoolTable" style="height: 80px;">
                    <div class="__tbodyMain ui-table-main" style="display: block; width: 100%; right: 170px; left: 0px;">
                        <table style="margin-left: 0px; width: 100%;margin-top: 0px;">
                            <thead>
                            <tr>
                                <th name="id" width="3%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">序号</span></div>
                                </th>
                                <th name="name" width="10%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">学校名称</span></div>
                                </th>
                                <th width="10%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">学院名称</span></div>
                                </th>
                                <th width="10%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">学科类别</span><span class="ui-table-drag"></span></div>
                                </th>
                                <th width="5%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">年级</span><span class="ui-table-drag"></span></div>
                                </th>
                                <th width="5%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">班级</span><span class="ui-table-drag"></span></div>
                                </th>
                                <th width="3%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">是否在读</span><span class="ui-table-drag"></span></div>
                                </th>
                                <th width="9%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">班主任姓名(性别)</span><span class="ui-table-drag"></span></div>
                                </th>
                                <th width="9%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">班主任联系电话</span><span class="ui-table-drag"></span></div>
                                </th>
                                <th width="9%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">班主任微信号</span><span class="ui-table-drag"></span></div>
                                </th>
                                <th width="20%">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">学校地址</span><span class="ui-table-drag"></span></div>
                                </th>
                                <th width="7%" align="center">
                                    <div class="ui-table-th"><span class="ui-table-thTitle">操作</span><span class="ui-table-drag"></span></div>
                                </th>
                            </tr>
                            </thead>
                            <tbody class="__data" id="SchoolTableBody">
                            <tr>
                                <td colspan="11" align="center" valign="center" style="height: 40px!important;"><span style="margin-left: 45%;margin-top: 20px;">暂无数据</span></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <form id="studentSchoolForm" method="post" action-url="${rootPath}/student/saveStudentSchool" style="display: none;">
            <div class="item">
                <span class="label"><span class="red">*</span>学校名称：</span>
                <div class="fl">
                    <input type="hidden" id="studentSchoolInfo_id" name="strId"/>
                    <input type="hidden" id="studentSchoolInfo_studentId" name="studentId"/>
                    <input type="text" id="studentSchoolInfo_schoolName" name="schoolName" class="text required"/>
                    <label id="studentSchoolInfo_schoolName_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentSchoolInfo_schoolName_error"></label>
                </div>
                <span class="label">学院名称：</span>
                <div class="fl">
                    <input type="text" id="studentSchoolInfo_collegeName" name="collegeName" class="text"/>
                    <label id="studentSchoolInfo_collegeName_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentSchoolInfo_collegeName_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>年级：</span>
                <div class="fl">
                    <select rel="select" id="studentSchoolInfo_grade" name="grade" class="select required" tabindex="31">
                        <option value="">--请选择--</option>
                        <c:forEach items="${fns:getDictByType('dict_grade')}" var="dict" varStatus="vs">
                            <option value="${dict.dictIndex}">${dict.dictValue}</option>
                        </c:forEach>
                    </select>
                    <label id="studentSchoolInfo_grade_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentSchoolInfo_grade_error"></label>
                </div>
                <span class="label">学科类别：</span>
                <div class="fl">
                    <input type="text" id="studentSchoolInfo_academicClass" name="academicClass" class="text"/>
                    <label id="studentSchoolInfo_academicClass_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentSchoolInfo_academicClass_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>班级：</span>
                <div class="fl">
                    <input type="text" id="studentSchoolInfo_schoolClass" name="schoolClass" class="text required"/>
                    <label id="studentSchoolInfo_schoolClass_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentSchoolInfo_schoolClass_error"></label>
                </div>
                <span class="label"><span class="red">*</span>是否在读：</span>
                <div class="fl">
                    <select rel="select" id="studentSchoolInfo_currentFlag" name="currentFlag" class="select required" tabindex="36">
                        <option value="">--请选择--</option>
                        <option value="0">否</option>
                        <option value="1">是</option>
                    </select>
                    <label id="studentSchoolInfo_currentFlag_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentSchoolInfo_currentFlag_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>班主任姓名：</span>
                <div class="fl">
                    <input type="text" id="studentSchoolInfo_classTeacherName" name="classTeacherName" class="text required"/>
                    <label id="studentSchoolInfo_classTeacherName_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentSchoolInfo_classTeacherName_error"></label>
                </div>
                <span class="label"><span class="red">*</span>班主任性别：</span>
                <div class="fl">
                    <select rel="select" id="studentSchoolInfo_classTeacherSex" name="classTeacherSex" class="select required" tabindex="36">
                        <option value="">--请选择--</option>
                        <c:forEach items="${fns:getDictByType('dict_sex')}" var="dict" varStatus="vs">
                            <option value="${dict.dictIndex}" >${dict.dictValue}</option>
                        </c:forEach>
                    </select>
                    <label id="studentSchoolInfo_classTeacherSex_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentSchoolInfo_classTeacherSex_error"></label>
                </div>
            </div><!--item end-->
            <div class="item">
                <span class="label"><span class="red">*</span>联系电话：</span>
                <div class="fl">
                    <input type="text" id="studentSchoolInfo_classTeacherPhone" name="classTeacherPhone" class="text required"/>
                    <label id="studentSchoolInfo_classTeacherPhone_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentSchoolInfo_classTeacherPhone_error"></div>
                </div>
                <span class="label">微信号：</span>
                <div class="fl">
                    <input type="text" id="studentSchoolInfo_classTeacherWeixin" name="classTeacherWeixin" class="text"/>
                    <label id="studentSchoolInfo_classTeacherWeixin_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentSchoolInfo_classTeacherWeixin_error"></div>
                </div>
            </div><!--item end-->
            <div class="item">
                <span class="label"><span class="red">*</span>通讯地址：</span>
                <div class="fl">
                    <input type="text" id="studentSchoolInfo_schoolAddress" name="schoolAddress" class="longtext required"/>
                    <label id="studentSchoolInfo_schoolAddress_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentSchoolInfo_schoolAddress_error"></div>
                </div>
            </div><!--item end-->

            <div class="item" style="margin-left: 45%!important;">
                <input type="button" class="yellow_button" id="studentSchoolSubmitBtn" onclick="submitForm('studentSchoolForm')" value="提交" tabindex="45" />
                <input type="button" class="yellow_button" id="studentSchoolCancelBtn" onclick="cancelForm('studentSchoolForm')" value="取消" style="background: #ccc!important; margin-left: 10px;"/>
            </div>
        </form>
        <form id="studentBankForm" method="post" action-url="${rootPath}/student/saveStudentBank">
            <h3>银行账户信息
                <c:if test="${student.username == username}">
                    <span><button type="button" class="editBtn" id="studentBankEditBtn" onclick="editForm('studentBankForm')" style="float: right; width: 50px; height: 30px;">编辑</button></span>
                </c:if>
            </h3>
            <div class="item">
                <span class="label"><span class="red">*</span>银行名称：</span>
                <div class="fl">
                    <input type="hidden" id="studentBankInfo_id" name="strId" value="${studentBankInfo.id}" tabindex="40"/>
                    <input type="hidden" id="studentBankInfo_studentId" name="studentId" value="${student.id}" tabindex="40"/>
                    <input type="text" id="studentBankInfo_bankName" name="bankName" class="text required" value="${studentBankInfo.bankName}" tabindex="41"/>
                    <label id="studentBankInfo_bankName_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentBankInfo_bankName_error"></label>
                </div>
                <span class="label"><span class="red">*</span>卡号：</span>
                <div class="fl">
                    <input type="text" id="studentBankInfo_bankCardId" name="bankCardId" class="text required" value="${studentBankInfo.bankCardId}" tabindex="42"/>
                    <label id="studentBankInfo_bankCardId_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentBankInfo_bankCardId_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>开户人姓名：</span>
                <div class="fl">
                    <input type="text" id="studentBankInfo_bankUserName" name="bankUserName" class="text required" value="${studentBankInfo.bankUserName}" tabindex="43"/>
                    <label id="studentBankInfo_bankUserName_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentBankInfo_bankUserName_error"></label>
                </div>
                <span class="label">备注：</span>
                <div class="fl">
                    <input type="text" id="studentBankInfo_description" name="description" class="text" value="${studentBankInfo.description}" tabindex="44"/>
                    <label id="studentBankInfo_description_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentBankInfo_description_error"></label>
                </div>
            </div><!--item end-->

            <div class="item" style="margin-left: 45%!important;">
                <input type="button" class="yellow_button" id="studentBankSubmitBtn" onclick="submitForm('studentBankForm')" value="提交" tabindex="45" />
                <input type="button" class="yellow_button" id="studentBankCancelBtn" onclick="cancelForm('studentBankForm')" value="取消" style="background: #ccc!important; margin-left: 10px;"/>
            </div><!--item end-->
        </form>
    </div>
</div><!--formbox end-->
</body>
<script>
    var studentId = "${student.id}";
    var bankId = "${studentBankInfo.id}";
    var schoolSessionList = [];
    var guardinsSessionList = [];
    $(function () {
        if (studentId) {
            $("#studentForm input").attr("disabled","disabled");
            $("#studentForm select").attr("disabled","disabled");
            $("#studentSubmitBtn,#studentCancelBtn").css("display", "none");
        }
        if (bankId) {
            $("#studentBankForm input").attr("disabled","disabled");
            $("#studentBankForm select").attr("disabled","disabled");
            $("#studentBankSubmitBtn,#studentBankCancelBtn").css("display", "none");
        }

        getGuardianList(studentId);
        getSchoolList(studentId);
    })

    /**
     * 取消操作
     * @param formId
     */
    cancelForm = function(formId) {
        if (formId == 'studentSchoolForm') {
            $("#studentSchoolForm")[0].reset();
            $("#studentSchoolForm").css("display", "none");
        } else if (formId == 'studentGuardianForm'){
            $("#studentGuardianForm")[0].reset();
            $("#studentGuardianForm").css("display", "none");
        } else if (formId == 'studentForm') {
            $("#studentForm")[0].reset();
            $("#studentForm input").attr("disabled","disabled");
            $("#studentForm select").attr("disabled","disabled");
            $("#studentSubmitBtn,#studentCancelBtn").css("display", "none");
            $("#" + formId + " .editBtn").removeAttr("disabled");
        } else if (formId == "studentBankForm") {
            $("#studentBankForm")[0].reset();
            $("#studentBankForm input").attr("disabled","disabled");
            $("#studentBankForm select").attr("disabled","disabled");
            $("#studentBankSubmitBtn,#studentBankCancelBtn").css("display", "none");
            $("#" + formId + " .editBtn").removeAttr("disabled");
        }
    }

    /**
     * 提交表单
     * @param formId
     * @returns {boolean}
     */
    submitForm = function(formId) {
        if(!checkNull(formId)) {
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
                if (result.success) {
                    if (formId == 'studentSchoolForm') {
                        $("#studentSchoolForm")[0].reset();
                        $("#studentSchoolForm").css("display", "none");
                        getSchoolList(studentId);
                    } else if (formId == 'studentGuardianForm'){
                        $("#studentGuardianForm")[0].reset();
                        $("#studentGuardianForm").css("display", "none");
                        getGuardianList(studentId);
                    } else if (formId == 'studentForm') {
                        $("#studentForm input").attr("disabled","disabled");
                        $("#studentForm select").attr("disabled","disabled");
                        $("#studentSubmitBtn,#studentCancelBtn").css("display", "none");
                        $("#" + formId + " .editBtn").removeAttr("disabled");
                    } else if (formId == "studentBankForm") {
                        $("#studentBankForm input").attr("disabled","disabled");
                        $("#studentBankForm select").attr("disabled","disabled");
                        $("#studentBankSubmitBtn,#studentBankCancelBtn").css("display", "none");
                        $("#" + formId + " .editBtn").removeAttr("disabled");
                    }
                    // location.reload(true);
                }
                alert(result.msg);
            },
            error : function() {
                alert("异常！");
            }
        });
    }

    /**
     * 非空验证
     * @param formId
     * @returns {boolean}
     */
    checkNull = function(formId) {
        var flag = true;
        $("#" + formId + " .required").each(function(){
            var _that = $(this);
            if (_that.val() == "") {
                flag = false;
                var textVal = _that.parent().prev().text();
                textVal = textVal.replace("：", "").replace("*", "×");
                $("#" + _that.prop("id") + "_error").text(textVal + "不能为空").css("color", "red");
            } else {
                $("#" + _that.prop("id") + "_error").text("").css("display", "none");
            }
        })

        return flag;
    }

    /**
     * 编辑操作
     * @param formId
     */
    editForm = function(formId) {
        $("#" + formId + " input,select").removeAttr("disabled");
        $("#" + formId + " .editBtn").attr("disabled","disabled");
        if (formId == "studentBankForm") {
            $("#studentBankSubmitBtn,#studentBankCancelBtn").css("display", "block");
        } else if (formId == 'studentForm') {
            $("#studentSubmitBtn,#studentCancelBtn").css("display", "block");
        }
    }

    /**
     * 获取表单序列数据
     * @param $form
     * @returns {{}}
     */
    getFormData = function($form) {
        var unindexed_array = $form.serializeArray();
        var indexed_array = {};

        $.map(unindexed_array, function (n, i) {
            indexed_array[n['name']] = n['value'];
        });
        return indexed_array;
    }

    /**
     * 获取学生就学信息
     * @param studentId
     */
    getSchoolList = function(studentId) {
        if (!studentId) {
            return false;
        }
        $.ajax({
            url: rootPath + "/student/getSchoolListData",
            data: {studentId: studentId},
            type: "post",
            dataType: "json",
            success: function(result) {
                if (result && result.success) {
                    var schools = result.data;
                    schoolSessionList = result.data;
                    var html = "";

                    for(var i=0;i < schools.length;i++) {
                        html += "<tr>\n" +
                            "        <td>\n<div class=\"ui-table-td\">" + (1 + i) + "</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+schools[i].schoolName+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+schools[i].collegeName+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+schools[i].academicClass+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+schools[i].grade+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+schools[i].schoolClass+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+(schools[i].currentFlag == '1'?'是':'否')+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+schools[i].classTeacherName + "（" + (schools[i].classTeacherSex == '1'?"男":"女") +"）</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+schools[i].classTeacherPhone+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+schools[i].classTeacherWeixin+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+schools[i].schoolAddress+"</div>\n</td>\n" +
                            "        <td align='center'>\n" +
                            "           <div class=\"ui-table-td\">" +
                                <c:if test="${student.username == username}">
                            "              <a href=\"javascript:void(0);\" onclick='editSchoolInfo(\"" + i + "\")'>编辑</a>&nbsp;&nbsp;" +
                            "              <a href=\"javascript:void(0);\" onclick='deleteItem(\"" + schools[i].id + "\", \"SchoolInfo\")'>删除</a>&nbsp;" +
                                </c:if>
                            "           </div>\n" +
                            "        </td>\n" +
                            "     </tr>";
                    }

                    if (html) {
                        $("#SchoolTable").css("height", (40 * schools.length+35) + "px");
                        $("#SchoolTableBody").empty().append(html);
                    }
                }
            }
        })
    }

    /**
     * 获取监护人信息
     * @param studentId
     */
    getGuardianList = function(studentId) {
        if (!studentId) {
            return false;
        }
        $.ajax({
            url: rootPath + "/student/getGuardianListData",
            data: {studentId: studentId},
            type: "post",
            dataType: "json",
            success: function(result) {
                if (result && result.success) {
                    var guardians = result.data;
                    guardinsSessionList = result.data;
                    var html = "";

                    for(var i=0;i < guardians.length;i++) {
                        html += "<tr>\n" +
                            "        <td>\n<div class=\"ui-table-td\">" + (1 + i) + "</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+guardians[i].name+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+guardians[i].age+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+guardians[i].relation+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+guardians[i].idCardNumber+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+guardians[i].phoneNumber+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+guardians[i].weixinNumber+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+guardians[i].qqNumber+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+guardians[i].email+"</div>\n</td>\n" +
                            "        <td>\n<div class=\"ui-table-td\">"+guardians[i].relatAddress+"</div>\n</td>\n" +
                            "        <td align='center'>\n" +
                            "           <div class=\"ui-table-td\">" +
                            <c:if test="${student.username == username}">
                            "              <a href=\"javascript:void(0);\" onclick='editGuardians(\"" + i + "\")'>编辑</a>&nbsp;" +
                            "              <a href=\"javascript:void(0);\" onclick='deleteItem(\"" + guardians[i].id + "\", \"Guardians\")'>删除</a>&nbsp;" +
                            </c:if>
                            "           </div>\n" +
                            "        </td>\n" +
                            "     </tr>";
                    }

                    if (html) {
                        $("#GuardianTable").css("height", (40 * guardians.length+35) + "px");
                        $("#GuardianTableBody").empty().append(html);
                    }
                }
            }
        })
    }

    /**
     * 编辑就学信息
     * @param index
     */
    editSchoolInfo = function(index) {
        $("#studentSchoolForm").css("display", "block");
        $("#studentSchoolForm")[0].reset();
        $("#studentSchoolInfo_studentId").val(studentId);
        if (index == "") {
            return;
        }
        var school = schoolSessionList[Number(index)];
        $("#studentSchoolInfo_id").val(school.id);
        $("#studentSchoolInfo_schoolName").val(school.schoolName);
        $("#studentSchoolInfo_collegeName").val(school.collegeName);
        $("#studentSchoolInfo_grade").val(school.grade);
        $("#studentSchoolInfo_academicClass").val(school.academicClass);
        $("#studentSchoolInfo_schoolClass").val(school.schoolClass);
        $("#studentSchoolInfo_classTeacherName").val(school.classTeacherName);
        $("#studentSchoolInfo_classTeacherSex").val(school.classTeacherSex);
        $("#studentSchoolInfo_currentFlag").val(school.currentFlag);
        $("#studentSchoolInfo_classTeacherPhone").val(school.classTeacherPhone);
        $("#studentSchoolInfo_classTeacherWeixin").val(school.classTeacherWeixin);
        $("#studentSchoolInfo_schoolAddress").val(school.schoolAddress);
    }

    /**
     * 编辑监护人信息
     * @param index
     */
    editGuardians = function(index) {
        $("#studentGuardianForm").css("display", "block");
        $("#studentGuardianForm")[0].reset();
        $("#studentGuardian_studentId").val(studentId);
        if (index == "") {
            return;
        }
        var guardian = guardinsSessionList[Number(index)];
        $("#studentGuardian_id").val(guardian.id);
        $("#studentGuardian_name").val(guardian.name);
        $("#studentGuardian_relation").val(guardian.relation);
        $("#studentGuardian_idCardNumber").val(guardian.idCardNumber);
        $("#studentGuardian_age").val(guardian.age);
        $("#studentGuardian_phoneNumber").val(guardian.phoneNumber);
        $("#studentGuardian_weixinNumber").val(guardian.weixinNumber);
        $("#studentGuardian_qqNumber").val(guardian.qqNumber);
        $("#studentGuardian_email").val(guardian.email);
        $("#studentGuardian_workspace").val(guardian.workspace);
        $("#studentGuardian_relatAddress").val(guardian.relatAddress);
    }

    /**
     * 删除操作
     * @param id
     * @param itemType
     */
    deleteItem = function(id, itemType) {
        if (confirm("确定要删除吗？") == true) {
            $.ajax({
                url: rootPath + "/student/deleteItem",
                data: {id: id, itemType: itemType},
                type: "post",
                dataType: "json",
                success: function (result) {
                    if (result && result.success) {
                        if (itemType == 'SchoolInfo') {
                            getSchoolList(studentId);
                        } else if (itemType == 'Guardians') {
                            getGuardianList(studentId);
                        }
                    }
                }
            });
        }
    }
</script>
</html>
