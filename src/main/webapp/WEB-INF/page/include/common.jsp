<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="rootPath" value="${pageContext.request.contextPath}${fns:getRootPath()}"/>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"/>
<c:set var="publicStatic" value="${pageContext.request.contextPath}/public"/>
<c:set var="title" value="${fns:getConfig('productName')}"/>
<title>${fns:getConfig('productName')}</title>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/style.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/WdatePicker.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/jquery.grid.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/jquery-confirm.min.css" />
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/jquery.dialog.css"/>
<link rel="stylesheet" type="text/css" href="${ctxStatic}/css/zTreeStyle/zTreeStyle.css"/>

<script type="text/javascript" src="${ctxStatic}/js/jquery.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/global.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery.select.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/core.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery.pagination.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/WdatePicker.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery-confirm.min.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery.dialog.js"></script>
<script type="text/javascript" src="${ctxStatic}/js/jquery.ztree.core-3.5.js"></script>
<%--<link rel="icon" href="${ctxStatic}/images/yhlogo.png">--%>
<script>var rootPath = "${rootPath}", ctx = "${ctx}", ctxStatic = "${ctxStatic}", publicStatic = "${publicStatic}";</script>