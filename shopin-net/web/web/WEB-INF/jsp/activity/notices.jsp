<%--
  Description: 公告页
  Author:kongm 
  Date: 2013-10-14
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<jsp:include page="/common/meta.jsp" />
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<title>网站公告-上品折扣官方网站,100%正品,1-6折天天低价,1小时抢购!实体店供货,10天退换,全国送货上门!-www.shopin.net</title>
<link href="${localcss}/reset.css" rel="stylesheet" type="text/css">
<link href="${localcss}/layout.css" rel="stylesheet" type="text/css">
<link href="${localcss}/cart.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="in oz">
		<div class="breadCrumbs">
			当前位置：<a href="index.html" target="_blank">首页</a> > <a href=""
				target="_blank"><c:if test="${type == '1' }">网站公告</c:if><c:if test="${type == '0' }">打折预报</c:if></a>
		</div>
	</div>
	<div id="container" class="in oz shopin">
		<div class="leftmenu">
			<div class="leftbox">
				<dl>
					<dt>公告</dt>
					<dd <c:if test="${type == '1' }">class="fb"</c:if>>
						<a href="${ctx }/notices/1.html">网站公告</a>
					</dd>
					<dd <c:if test="${type == '0' }">class="fb"</c:if>>
						<a href="${ctx }/notices/0.html">打折预报</a>
					</dd>
				</dl>
			</div>
		</div>
		<div class="rightlist helplist">
			<h2><c:if test="${type == '1' }">网站公告</c:if><c:if test="${type == '0' }">打折预报</c:if></h2>
			<div class="helpCon notice-list">
				<ul>
					<c:forEach var="notice" items="${notices }" varStatus="status">
						<li><span class="txt-gray fr">${fn:substring(notice.noticesTime,
								0,10)}</span><c:choose><c:when test="${not empty notice.link }"><a href='${notice.link }' target="_blank"></c:when><c:otherwise><a href='${ctx }/notice/${notice.sid}.html' target="_blank"></c:otherwise></c:choose>${notice.title }</a></li>
					</c:forEach>
				</ul>
				<div class="page clear oz">
				  ${page }
				</div>
			</div>
		</div>
	</div>
</body>
</html>