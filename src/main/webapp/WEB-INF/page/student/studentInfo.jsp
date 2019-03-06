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
    <form id="formpersonal" method="post" action="${rootPath}/student/saveStudent">
        <div class="form">
            <h3>基本信息</h3>
            <div class="item">
                <span class="label"><span class="red">*</span>姓名：</span>
                <div class="fl">
                    <input type="hidden" id="id" name="id" tabindex="0" />
                    <input type="text" id="name" name="name" class="text required" tabindex="1" />
                    <label id="name_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="name_error"></div>
                </div>

                <span class="label"><span class="red">*</span>身份证号：</span>
                <div class="fl">
                    <input type="text" id="idCardNumber" name="idCardNumber" class="text required" tabindex="2"/>
                    <label id="idCardNumber_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="idCardNumber_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>性别：</span>
                <div class="fl">
                    <select rel="select" id="sex" name="sex" class="select required" tabindex="3">
                        <option value="1" selected="selected">男</option>
                        <option value="2" >女</option>
                        <option value="3" >其他</option>
                    </select>
                    <label id="sex_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="sex_error"></label>
                </div>
                <span class="label">身份证有效日期起始：</span>
                <div class="fl">
                    <input type="text" id="idCardStartDate" name="idCardStartDate" disabled="disabled" class="text" tabindex="4"/>
                    <label id="idCardStartDate_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="idCardStartDate_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label">年龄：</span>
                <div class="fl">
                    <input type="text" id="age" name="age" class="text" tabindex="5"/>
                    <label id="age_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="age_error"></div>
                </div>
                <span class="label">身份证有效日期结束：</span>
                <div class="fl">
                    <input type="text" id="idCardEndDate" name="idCardEndDate" disabled="disabled" class="text" tabindex="6"/>
                    <label id="idCardEndDate_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="idCardEndDate_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>籍贯：</span>
                <div class="fl">
                    <input type="text" id="nativePlace" name="nativePlace" class="text required" tabindex="7" />
                    <label id="nativePlace_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="nativePlace_error"></div>
                </div>
                <span class="label"><span class="red">*</span>民族：</span>
                <div class="fl">
                    <select rel="select" id="nation" name="nation" class="select required" tabindex="8">
                        <option value="" selected="selected">--请选择--</option>
                        <option value="01" >汉族</option>
                        <option value="12" >侗族</option>
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
                        <option value="" selected="selected">--请选择--</option>
                        <option value="1" >城镇户口</option>
                        <option value="2" >农村户口</option>
                    </select>
                    <label id="announceType_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="announceType_error"></label>
                </div>
                <span class="label">邮政编码：</span>
                <div class="fl">
                    <input type="text" id="mailNumber" name="mailNumber" class="text" tabindex="10" />
                    <label id="mailNumber_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="mailNumber_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label">户口所在地：</span>
                <div class="fl">
                    <input type="text" id="announceAddress" name="announceAddress" class="longtext" tabindex="11" />
                    <label id="announceAddress_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="announceAddress_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>联系电话：</span>
                <div class="fl">
                    <input type="text" id="phoneNumber" name="phoneNumber" class="text required" tabindex="12" />
                    <label id="phoneNumber_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="phoneNumber_error"></div>
                </div>
                <span class="label">微信号：</span>
                <div class="fl">
                    <input type="text" id="weixinNumber" name="weixinNumber" class="text" tabindex="13" />
                    <label id="weixinNumber_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="weixinNumber_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label">QQ：</span>
                <div class="fl">
                    <input type="text" id="qqNumber" name="qqNumber" class="text" tabindex="14" />
                    <label id="qqNumber_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="qqNumber_error"></div>
                </div>
                <span class="label">电子邮箱：</span>
                <div class="fl">
                    <input type="text" id="email" name="email" class="text" tabindex="15" />
                    <label id="email_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="email_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>通讯地址：</span>
                <div class="fl">
                    <input type="text" id="relatAddress" name="relatAddress" class="longtext required" tabindex="16" />
                    <label id="relatAddress_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="relatAddress_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label">家庭住址：</span>
                <div class="fl">
                    <input type="text" id="homeAddress" name="homeAddress" class="longtext" tabindex="17" />
                    <label id="homeAddress_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="homeAddress_error"></div>
                </div>
            </div><!--item end-->


            <h3>监护人信息</h3>
            <div class="item">
                <span class="label"><span class="red">*</span>姓名：</span>
                <div class="fl">
                    <input type="hidden" id="studentGuardian_id" name="studentGuardianList[0].id" class="text" tabindex="18"/>
                    <input type="text" id="studentGuardian_name" name="studentGuardianList[0].name" class="text required" tabindex="19"/>
                    <label id="studentGuardian_name_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentGuardian_name_error"></label>
                </div>
                <span class="label"><span class="red">*</span>与本人关系：</span>
                <div class="fl">
                    <input type="text" id="studentGuardian_relation" name="studentGuardianList[0].relation" class="text required" tabindex="20"/>
                    <label id="studentGuardian_relation_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentGuardian_relation_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>身份证号：</span>
                <div class="fl">
                    <input type="text" id="studentGuardian_idCardNumber" name="studentGuardianList[0].idCardNumber" class="text required" tabindex="21"/>
                    <label id="studentGuardian_idCardNumber_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentGuardian_idCardNumber_error"></div>
                </div>
                <span class="label">年龄：</span>
                <div class="fl">
                    <input type="text" id="studentGuardian_age" name="studentGuardianList[0].age" class="text" tabindex="22"/>
                    <label id="studentGuardian_age_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentGuardian_age_error"></div>
                </div>
            </div><!--item end-->
            <div class="item">
                <span class="label"><span class="red">*</span>联系电话：</span>
                <div class="fl">
                    <input type="text" id="studentGuardian_phoneNumber" name="studentGuardianList[0].phoneNumber" class="text required" tabindex="23" />
                    <label id="studentGuardian_phoneNumber_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentGuardian_phoneNumber_error"></div>
                </div>
                <span class="label">微信号：</span>
                <div class="fl">
                    <input type="text" id="studentGuardian_weixinNumber" name="studentGuardianList[0].weixinNumber" class="text" tabindex="24" />
                    <label id="studentGuardian_weixinNumber_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentGuardian_weixinNumber_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label">QQ：</span>
                <div class="fl">
                    <input type="text" id="studentGuardian_qqNumber" name="studentGuardianList[0].qqNumber" class="text" tabindex="25" />
                    <label id="studentGuardian_qqNumber_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentGuardian_qqNumber_error"></div>
                </div>
                <span class="label">电子邮箱：</span>
                <div class="fl">
                    <input type="text" id="studentGuardian_email" name="studentGuardianList[0].email" class="text" tabindex="26" />
                    <label id="studentGuardian_email_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentGuardian_email_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>工作单位：</span>
                <div class="fl">
                    <input type="text" id="studentGuardian_workspace" name="studentGuardianList[0].workspace" class="text required" tabindex="27" />
                    <label id="studentGuardian_workspace_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentGuardian_workspace_error"></div>
                </div>
                <span class="label"><span class="red">*</span>通讯地址：</span>
                <div class="fl">
                    <input type="text" id="studentGuardian_relatAddress" name="studentGuardianList[0].relatAddress" class="text required" tabindex="28" />
                    <label id="studentGuardian_relatAddress_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentGuardian_relatAddress_error"></div>
                </div>
            </div><!--item end-->

            <h3>就学信息</h3>
            <div class="item">
                <span class="label"><span class="red">*</span>学校名称：</span>
                <div class="fl">
                    <input type="hidden" id="studentSchoolInfo_id" name="studentSchoolInfoList[0].id" tabindex="11"/>
                    <input type="text" id="studentSchoolInfo_schoolName" name="studentSchoolInfoList[0].schoolName" class="text required" tabindex="29"/>
                    <label id="studentSchoolInfo_schoolName_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentSchoolInfo_schoolName_error"></label>
                </div>
                <span class="label">学院名称：</span>
                <div class="fl">
                    <input type="text" id="studentSchoolInfo_collegeName" name="studentSchoolInfoList[0].collegeName" class="text" tabindex="30"/>
                    <label id="studentSchoolInfo_collegeName_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentSchoolInfo_collegeName_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>年级：</span>
                <div class="fl">
                    <select rel="select" id="studentSchoolInfo_grade" name="studentSchoolInfoList[0].grade" class="select required" tabindex="31">
                        <option value="" selected="selected">--请选择--</option>
                        <option value="1" >一年级</option>
                        <option value="2" >二年级</option>
                    </select>
                    <label id="studentSchoolInfo_grade_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentSchoolInfo_grade_error"></label>
                </div>
                <span class="label">学科类别：</span>
                <div class="fl">
                    <input type="text" id="studentSchoolInfo_academicClass" name="studentSchoolInfoList[0].academicClass" class="text" tabindex="32" />
                    <label id="studentSchoolInfo_academicClass_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentSchoolInfo_academicClass_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>班级：</span>
                <div class="fl">
                    <input type="text" id="studentSchoolInfo_schoolClass" name="studentSchoolInfoList[0].schoolClass" class="text required" tabindex="33" />
                    <label id="studentSchoolInfo_schoolClass_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentSchoolInfo_schoolClass_error"></label>
                </div>
                <span class="label"><span class="red">*</span>学号：</span>
                <div class="fl">
                    <input type="text" id="studentSchoolInfo_number" name="studentSchoolInfoList[0].number" class="text required" tabindex="34" />
                    <label id="studentSchoolInfo_number_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentSchoolInfo_number_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>班主任姓名：</span>
                <div class="fl">
                    <input type="text" id="studentSchoolInfo_classTeacherName" name="studentSchoolInfoList[0].classTeacherName" class="text required" tabindex="35" />
                    <label id="studentSchoolInfo_classTeacherName_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentSchoolInfo_classTeacherName_error"></label>
                </div>
                <span class="label"><span class="red">*</span>班主任性别：</span>
                <div class="fl">
                    <select rel="select" id="studentSchoolInfo_classTeacherSex" name="studentSchoolInfoList[0].classTeacherSex" class="select required" tabindex="36">
                        <option value="1" selected="selected">男</option>
                        <option value="2" >女</option>
                        <option value="3" >其他</option>
                    </select>
                    <label id="studentSchoolInfo_classTeacherSex_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentSchoolInfo_classTeacherSex_error"></label>
                </div>
            </div><!--item end-->
            <div class="item">
                <span class="label"><span class="red">*</span>联系电话：</span>
                <div class="fl">
                    <input type="text" id="studentSchoolInfo_classTeacherPhone" name="studentSchoolInfoList[0].classTeacherPhone" class="text required" tabindex="37" />
                    <label id="studentSchoolInfo_classTeacherPhone_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentSchoolInfo_classTeacherPhone_error"></div>
                </div>
                <span class="label">微信号：</span>
                <div class="fl">
                    <input type="text" id="studentSchoolInfo_classTeacherWeixin" name="studentSchoolInfoList[0].classTeacherWeixin" class="text" tabindex="38" />
                    <label id="studentSchoolInfo_classTeacherWeixin_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentSchoolInfo_classTeacherWeixin_error"></div>
                </div>
            </div><!--item end-->
            <div class="item">
                <span class="label"><span class="red">*</span>通讯地址：</span>
                <div class="fl">
                    <input type="text" id="studentSchoolInfo_schoolAddress" name="studentSchoolInfoList[0].schoolAddress" class="longtext required" tabindex="39" />
                    <label id="studentSchoolInfo_schoolAddress_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="studentSchoolInfo_schoolAddress_error"></div>
                </div>
            </div><!--item end-->

            <h3>银行账户信息</h3>
            <div class="item">
                <span class="label"><span class="red">*</span>银行名称：</span>
                <div class="fl">
                    <input type="hidden" id="studentBankInfo_id" name="studentBankInfo.id" tabindex="40"/>
                    <input type="text" id="studentBankInfo_bankName" name="studentBankInfo.bankName" class="text required" tabindex="41"/>
                    <label id="studentBankInfo_bankName_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentBankInfo_bankName_error"></label>
                </div>
                <span class="label"><span class="red">*</span>卡号：</span>
                <div class="fl">
                    <input type="text" id="studentBankInfo_bankCardId" name="studentBankInfo.bankCardId" class="text required" tabindex="42"/>
                    <label id="studentBankInfo_bankCardId_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentBankInfo_bankCardId_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>开户人姓名：</span>
                <div class="fl">
                    <input type="text" id="studentBankInfo_bankUserName" name="studentBankInfo.bankUserName" class="text required" tabindex="43"/>
                    <label id="studentBankInfo_bankUserName_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentBankInfo_bankUserName_error"></label>
                </div>
                <span class="label">备注：</span>
                <div class="fl">
                    <input type="text" id="studentBankInfo_description" name="studentBankInfo.description" class="text" tabindex="44"/>
                    <label id="studentBankInfo_description_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="studentBankInfo_description_error"></label>
                </div>
            </div><!--item end-->

            <div class="item" style="margin-left: 45%!important;">
                <input type="button" class="yellow_button" id="registsubmit" value="提交" tabindex="45" />
            </div><!--item end-->

        </div>
    </form>
</div><!--formbox end-->
<%--<script type="text/javascript" src="${ctxStatic}/funding/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/funding/js/Validate.js"></script>
<script type="text/javascript" src="${ctxStatic}/funding/js/Validate.form.js"></script>--%>
</body>
<script>
    $(function() {
        $("#registsubmit").on("click", function() {
            if(!checkNull()) {
                return false;
            }
            $("#formpersonal").submit();
        })
    });

    checkNull = function() {
        var flag = true;
        $(".required").each(function(){
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
</script>
</html>
