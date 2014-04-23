<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>上品折扣官方购物网站-万款名牌100%正品,1-6折天天低价,1小时抢购!实体店供货,10天退换,全国送货上门!-www.shopin.net</title>
    <link rel="stylesheet" href="${css}/channels.css"/>
    <link rel="stylesheet" href="${css}/freetab.css"/>
    <link rel="stylesheet" href="${css}/slideshow.css"/>
    <link rel="stylesheet" href="${css}/template.css"/>
    <link rel="stylesheet" href="${css}/gomall.css" type="text/css"/>
</head>
<body>
<div id="offpage">
	<div class="offtab"><c:if test="${page=='current'}">正在限时抢购</c:if><c:if test="${page=='future'}">即将推出的活动</c:if><c:if test="${page=='past'}">已经结束的活动</c:if>-${channelname.displayName}频道</div>
    <div class="fnav">
    <span class="bignav"><c:if test="${page=='current'}"><c:forEach var="channel" items="${channels}" varStatus="status" end="8"><c:if test="${status.index!=0}"> | </c:if><a href="${ctx}/promotions/${channel.name}.html">${channel.displayName}</a></c:forEach></c:if><c:if test="${page=='future'}"><c:forEach var="channel" items="${channels}" varStatus="status" end="8"><c:if test="${status.index!=0}"> | </c:if><a href="${ctx}/promotions/${channel.name}/future.html">${channel.displayName}</a></c:forEach></c:if><c:if test="${page=='past'}"><c:forEach var="channel" items="${channels}" varStatus="status" end="8"><c:if test="${status.index!=0}"> | </c:if><a href="${ctx}/promotions/${channel.name}/past.html">${channel.displayName}</a></c:forEach></c:if></span>
    <span class="smallnav">[ <a href="${ctx}/promotions/${channelname.name}/future.html">即将推出的活动</a> | <a href="${ctx}/promotions/${channelname.name}.html">正在进行的活动</a> | <a href="${ctx}/promotions/${channelname.name}/past.html">已经结束的活动</a> ]</span>
    </div>
</div>
<c:forEach var="act" items="${promotions}" varStatus="status">
<div class="offbody">
    <div class="offbody0408">
        <div class="offtop0408">
            <span class="time">活动时间： <fmt:formatDate pattern="yyyy.MM.dd" value="${act.promotionBeginTime}" type="date"/>-<fmt:formatDate pattern="MM.dd" value="${act.promotionEndTime}" type="date"/></span>
        </div>
        <ul>
            <li>
                <c:if test="${page=='current'}"><a href="${ctx}${act.promotionLink}" target="_blank"><img src="${images}${act.promotionBpict}" border="0" style="margin-top:5px;"/></a></c:if>
                <c:if test="${page=='future'}"><a href="${ctx}${act.promotionLink}" target="_blank"><img src="${images}${act.promotionBpict}" border="0" style="margin-top:5px;"/></a></c:if>
                <c:if test="${page=='past'}"><img src="${images}${act.promotionBpict}" border="0" style="filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);margin-top:5px;"/></c:if> 
            </li>
        </ul>
    </div>
</div>
</c:forEach>
</body>
</html>