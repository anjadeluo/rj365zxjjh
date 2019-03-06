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
    <form id="formpersonal" method="post" onsubmit="return false;">
        <div class="form">
            <h3>基本信息</h3>
            <div class="item">
                <span class="label"><span class="red">*</span>姓名：</span>
                <div class="fl">
                    <input type="text" id="username" name="username" class="text" tabindex="1" />
                    <label id="username_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="username_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>身份证号：</span>
                <div class="fl">
                    <input type="text" id="idCard" name="idCard" class="text" tabindex="2"/>
                    <label id="idCard_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="idCard_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>身份证有效日期起始：</span>
                <div class="fl">
                    <input type="text" id="idCardStartDate" name="idCardStartDate" class="text" tabindex="3"/>
                    <label id="idCardStartDate_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="idCardStartDate_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>身份证有效日期结束：</span>
                <div class="fl">
                    <input type="text" id="idCardEndDate" name="idCardEndDate" class="text" tabindex="4"/>
                    <label id="idCardEndDate_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <div id="idCardEndDate_error"></div>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label">性别：</span>
                <div class="fl">
                    <select rel="select" id="sex" name="sex" class="select" tabindex="5">
                        <option value="1" selected="selected">男</option>
                        <option value="2" >女</option>
                        <option value="3" >其他</option>
                    </select>
                    <label id="sex_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="sex_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label">民族：</span>
                <div class="fl">
                    <select rel="select" id="nation" name="nation" class="select" tabindex="6">
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
                <span class="label">户口性质：</span>
                <div class="fl">
                    <select rel="select" id="announceType" name="announceType" class="select" tabindex="6">
                        <option value="" selected="selected">--请选择--</option>
                        <option value="1" >城镇户口</option>
                        <option value="2" >农村户口</option>
                    </select>
                    <label id="announceType_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="announceType_error"></label>
                </div>
            </div><!--item end-->


            <h3>家庭信息</h3>
            <div class="item">
                <span class="label"><span class="red">*</span>联系人姓名：</span>
                <div class="fl">
                    <input type="text" id="realname" name="realname" class="text" tabindex="7"/>
                    <label id="realname_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="realname_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>所在部门：</span>
                <div class="fl">
                    <select rel="select" id="department" name="department" tabindex="8">
                        <option value="-1"  >请选择</option>
                        <option value="1"  >办公室</option>
                        <option value="2"  >市场部</option>
                        <option value="3"  >采购部</option>
                        <option value="4"  >技术部</option>
                        <option value="5"  >人力资源</option>
                        <option value="6"  >其他</option>
                    </select>
                    <label id="department_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="department_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>固定电话：</span>
                <div class="fl">
                    <input type="text" id="tel" name="tel" class="text" value="" tabindex="9" />
                    <label id="tel_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="tel_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>手机：</span>
                <div class="fl">
                    <input type="text" id="mobile" name="mobile" class="text" value="" tabindex="10" />
                    <label id="mobile_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="mobile_error"></label>
                </div>
            </div><!--item end-->

            <h3>联系人信息</h3>
            <div class="item">
                <span class="label"><span class="red">*</span>联系人姓名：</span>
                <div class="fl">
                    <input type="text" id="realname" name="realname" class="text" tabindex="7"/>
                    <label id="realname_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="realname_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>所在部门：</span>
                <div class="fl">
                    <select rel="select" id="department" name="department" tabindex="8">
                        <option value="-1"  >请选择</option>
                        <option value="1"  >办公室</option>
                        <option value="2"  >市场部</option>
                        <option value="3"  >采购部</option>
                        <option value="4"  >技术部</option>
                        <option value="5"  >人力资源</option>
                        <option value="6"  >其他</option>
                    </select>
                    <label id="department_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="department_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>固定电话：</span>
                <div class="fl">
                    <input type="text" id="tel" name="tel" class="text" value="" tabindex="9" />
                    <label id="tel_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="tel_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>手机：</span>
                <div class="fl">
                    <input type="text" id="mobile" name="mobile" class="text" value="" tabindex="10" />
                    <label id="mobile_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="mobile_error"></label>
                </div>
            </div><!--item end-->

            <h3>公司信息</h3>
            <div class="item">
                <span class="label"><span class="red">*</span>公司名称：</span>
                <div class="fl">
                    <input type="text" id="companyname" name="companyname" class="text" tabindex="11"/>
                    <label id="companyname_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="companyname_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>公司地址：</span>
                <div class="fl">
                    <input type="text" id="companyaddr" name="companyaddr" class="text" tabindex="12" />
                    <label id="companyaddr_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="companyaddr_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>购买类型/用途：</span>
                <div class="fl">
                    <input id="purpose1" tabindex="13" class="checkbox" name="purposetype" runant="server" type="checkbox" value="1" />
                    <label class="pad" for="purpose1">IT设备</label>
                    <input id="purpose2" tabindex="13" class="checkbox" name="purposetype" runant="server" type="checkbox" value="2" />
                    <label class="pad" for="purpose2">数码通讯</label>
                    <input id="purpose3" tabindex="13" class="checkbox" name="purposetype" runant="server" type="checkbox" value="3" />
                    <label class="pad" for="purpose3">办公用品耗材</label>
                    <input id="purpose4" tabindex="13" class="checkbox" name="purposetype" runant="server" type="checkbox" value="4" />
                    <label class="pad" for="purpose4">大家电</label>
                    <input id="purpose5" tabindex="13" class="checkbox" name="purposetype" runant="server" type="checkbox" value="5" />
                    <label class="pad" for="purpose5">项目合作-政府采购</label>
                    <input id="purpose6" tabindex="13" class="checkbox" name="purposetype" runant="server" type="checkbox" value="6" />
                    <label class="pad" for="purpose6">礼品</label>
                    <input id="purpose" type="hidden" value="" />
                    <label id="purpose_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="purpose_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label"><span class="red">*</span>公司网址：</span>
                <div class="fl">
                    <input type="text" id="companysite" name="companysite" class="text" tabindex="14"/>
                    <label id="companysite_succeed" class="blank"></label>
                    <span class="clear"></span>
                    <label id="companysite_error"></label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label">&nbsp;</span>
                <div class="fl">
                    <input type="checkbox" name="protocol" id="protocol" tabindex="7" /><label for="protocol">网站用户注册协议</label>
                </div>
            </div><!--item end-->

            <div class="item">
                <span class="label">&nbsp;</span>
                <input type="button" class="yellow_button disabled" id="registsubmit" value="提交注册信息" tabindex="8" disabled="disabled" />
            </div><!--item end-->

        </div>
    </form>
</div><!--formbox end-->
<script type="text/javascript" src="${ctxStatic}/funding/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/funding/js/Validate.js"></script>
<script type="text/javascript" src="${ctxStatic}/funding/js/Validate.form.js"></script>
</body>
</html>
