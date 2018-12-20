<%--
  Created by IntelliJ IDEA.
  User: yhsk
  Date: 2017/7/31
  Time: 17:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/page/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="${ctxStatic}/common/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${ctxStatic}/css/login.css" />
</head>
<body>
<div class="header">
    <img src="${ctxStatic}/images/logo@2x.png"/>
    云和时空大数据管理平台
</div>

<div class="main">
    <div class="left">
        <!--上方三图-->
        <div class="topimg">
            <div class="topimg1"></div>
            <div class="topimg2"></div>
            <div class="topimg3" ></div>
        </div>
        <!--上方线条圆圈-->
        <div class="topline">
            <div>
                <div class="circles">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
                <div class="lines line1"></div>
            </div>
            <div>
                <div class="circles">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
                <div class="lines"></div>
            </div>
            <div>
                <div class="circles">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
                <div class="lines"></div>
            </div>
        </div>

        <!--中间进程-->
        <div class="centerProcess">
            <div class="circle"></div>
            <div class="line"><div class="bar"></div></div>
            <div class="process">1</div>
            <div class="line"><div class="bar"></div></div><div class="process">2</div>
            <div class="line"><div class="bar"></div></div><div class="process">3</div>
            <div class="line"><div class="bar"></div></div><div class="process">4</div>
            <div class="line"><div class="bar"></div></div><div class="process">5</div>
            <div class="line"><div class="bar"></div></div><div class="process">6</div>
            <div class="line"><div class="bar"></div></div>
            <div class="circle"></div>
        </div>

        <!--下方线条圆圈-->
        <div class="bottomline">
            <div>
                <div class="btlines line1"></div>
                <div class="btcircles">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
            <div>
                <div class="btlines"></div>
                <div class="btcircles">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
            <div>
                <div class="btlines"></div>
                <div class="btcircles">
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </div>
        </div>
        <!--下方三图-->
        <div class="bottmimg">
            <div class="bottmimg1"></div>
            <div class="bottmimg2"></div>
            <div class="bottmimg3" ></div>
        </div>

    </div>
    <div class="right">
        <form class="loginform" id="registForm" action="${rootPath}/user/regist" method="post">
            <h2>大数据管理系统</h2>

            <div class="form-group username" style="margin-bottom: 5%;">
                <input type="text" id="loginname" name="loginname" class="form-control user" placeholder="用户名"/>
                <img src="${ctxStatic}/images/user@2x.png"/>
            </div>

            <div class="form-group password" style="margin-bottom: 5%;">
                <input type="password" id="password" name="password" class="form-control pwd" placeholder="密码"/>
                <img src="${ctxStatic}/images/pwd@2x.png"/>
            </div>

            <div class="form-group" style="margin-bottom:5%;">
                <select name="tissue.id" id="tissueId" class="form-control tissue">
                    <option value="">--请选择组织/机构--</option>
                    <%--<c:forEach items="${fns:getAllTissue()}" var="tissue">--%>
                        <%--<option value="${tissue.id}">${tissue.name}</option>--%>
                    <%--</c:forEach>--%>
                </select>
            </div>
            <div class="form-group" style="margin-bottom:9%;">
                <select name="department.id" id="departmentId" class="form-control department">
                    <option value="">--请选择部门--</option>
                </select>
                <p class="tip" style="margin-top:10px;color: red;">${msg}</p>
            </div>

            <div class="form-group" style="overflow: hidden;margin-bottom: 5%;height: auto!important;padding-left:3%;">
                <div class="agree_box" style="float:left">
                    <input type="checkbox" class="agree" id="agreeBox" style="cursor: pointer;"/>
                    <label for="agreeBox" style="color:#fff;font-weight: normal;">同意平台服务条款</label>
                </div>
                <div style="float:right;" class="forget">
                    <a href="${rootPath}/user/login"><span style="color: #07fd2a">用户登录</span></a>
                </div>
            </div>
            <div class="form-group">
                <input class="btn login_btn" id="registBtn" type="button" value="注册"/>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="${ctxStatic}/js/login.js"></script>
</body>
</html>
