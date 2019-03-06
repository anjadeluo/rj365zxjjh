<%--
  Created by IntelliJ IDEA.
  User: yhsk
  Date: 2017/7/31
  Time: 18:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/WEB-INF/page/include/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.css" />
    <link rel="stylesheet" href="${ctxStatic}/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="${ctxStatic}/css/skin_/nav.css" />
    <title>${title}</title>
</head>

<body>
<div id="container">
    <div id="bd">
        <div class="sidebar">
            <div class="sidebar-bg"></div>
            <i class="sidebar-hide"></i>
            <ul class="nav">
                <sec:authorize access="isAuthenticated()">
                <li class="nav-li current">
                    <a href="javascript:;" class="ue-clear"><i class="nav-ivon"></i><span class="nav-text">通用管理</span></a>
                    <ul class="subnav">
                        <li class="subnav-li current" href="${rootPath}/index" data-id="1"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">首页</span></a></li>
                        <li class="subnav-li" href="${rootPath}/student/studentInfo"  data-id="02"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">个人信息</span></a></li>
                        <li class="subnav-li" href="table.html"  data-id="03"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">我的日志</span></a></li>
                        <li class="subnav-li" href="table.html" data-id="04"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">通知公告</span></a></li>
                        <li class="subnav-li" href="table.html" data-id="05"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">新闻资讯</span></a></li>
                    </ul>
                </li>
                </sec:authorize>
                <sec:authorize access="hasAnyAuthority('sys:funding', 'ROLE_SUPER_ADMIN')">
                <li class="nav-li">
                    <a href="javascript:;" class="ue-clear"><i class="nav-ivon"></i><span class="nav-text">助学管理</span></a>
                    <ul class="subnav">
                    <sec:authorize access="hasAnyAuthority('sys:funding:application', 'ROLE_SUPER_ADMIN')">
                        <li class="subnav-li" href="${rootPath}/funding/application" data-id="11"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">助学申请</span></a></li>
                    </sec:authorize>
                    <sec:authorize access="hasAnyAuthority('sys:funding:donation', 'ROLE_SUPER_ADMIN')">
                        <li class="subnav-li" href="${rootPath}/funding/donation" data-id="12"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">爱心捐赠</span></a></li>
                    </sec:authorize>
                    <sec:authorize access="hasAnyAuthority('sys:funding:approve', 'ROLE_SUPER_ADMIN')">
                        <li class="subnav-li" href="${rootPath}/funding/approve" data-id="13"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">审批管理</span></a></li>
                    </sec:authorize>
                    </ul>
                </li>
                </sec:authorize>
                <sec:authorize access="hasAuthority('sys:schedule')">
                <li class="nav-li">
                    <a href="javascript:;" class="ue-clear"><i class="nav-ivon"></i><span class="nav-text">工作安排</span></a>
                    <ul class="subnav">
                    <sec:authorize access="hasAuthority('sys:schedule')">
                        <li class="subnav-li" href="table.html"  data-id="21"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">工作计划</span></a></li>
                    </sec:authorize>
                    <sec:authorize access="hasAuthority('sys:schedule')">
                        <li class="subnav-li" data-id="22"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">安排管理1</span></a></li>
                    </sec:authorize>
                    <sec:authorize access="hasAuthority('sys:schedule')">
                        <li class="subnav-li" data-id="23"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">类型选择1</span></a></li>
                    </sec:authorize>
                    </ul>
                </li>
                </sec:authorize>
                <sec:authorize access="hasAnyAuthority('sys:manager', 'ROLE_SUPER_ADMIN')">
                <li class="nav-li last-nav-li">
                    <a href="javascript:;" class="ue-clear"><i class="nav-ivon"></i><span class="nav-text">系统管理</span></a>
                    <ul class="subnav">
                    <sec:authorize access="hasAnyAuthority('sys:manager:user', 'ROLE_SUPER_ADMIN')">
                        <li class="subnav-li" data-id="31" href="${rootPath}/user/list"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">用户管理</span></a></li>
                    </sec:authorize>
                    <sec:authorize access="hasAnyAuthority('sys:manager:role', 'ROLE_SUPER_ADMIN')">
                        <li class="subnav-li" data-id="32" href="${rootPath}/role/list"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">角色管理</span></a></li>
                    </sec:authorize>
                    <sec:authorize access="hasAnyAuthority('sys:manager:menu', 'ROLE_SUPER_ADMIN')">
                        <li class="subnav-li" data-id="33" href="${rootPath}/menu/list"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">菜单管理</span></a></li>
                    </sec:authorize>
                    <sec:authorize access="hasAnyAuthority('sys:manager:dict', 'ROLE_SUPER_ADMIN')">
                        <li class="subnav-li" data-id="34" href="${rootPath}/dict/list"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">字典管理</span></a></li>
                    </sec:authorize>
                    </ul>
                </li>
                </sec:authorize>
            </ul>
        </div>
        <div class="main">
            <div class="title">
                <i class="sidebar-show"></i>
                <ul class="tab ue-clear">

                </ul>
                <i class="tab-more"></i>
                <i class="tab-close"></i>
            </div>
            <div class="content">
            </div>
        </div>
    </div>
</div>

<div class="more-bab-list">
    <ul></ul>
    <div class="opt-panel-ml"></div>
    <div class="opt-panel-mr"></div>
    <div class="opt-panel-bc"></div>
    <div class="opt-panel-br"></div>
    <div class="opt-panel-bl"></div>
</div>
</body>
<script type="text/javascript" src="${ctxStatic}/js/nav.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/Menu.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript">
    var menu = new Menu({
        defaultSelect: $('.nav').find('li[data-id="1"]')
    });

    $(document).click(function(e) {
        if(!$(e.target).is('.tab-more')){
            $('.tab-more').removeClass('active');
            $('.more-bab-list').hide();
        }
    });
</script>
</html>
