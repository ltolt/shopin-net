<%--
  Description:Shoes (鞋)
  User: 
  Date: 2013-10-9
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<meta charset="utf-8">
<title>${channel.displayName}-上品折扣网shopin.net- 商场名牌1-3折限量秒杀,正品保障,网上购物!服装品牌,名品折扣,名牌打折,团购价!上品折扣官方购物网站</title>
<link href="${localcss}/reset.css" rel="stylesheet" type="text/css">
<link href="${localcss}/layout.css" rel="stylesheet" type="text/css">
<link href="${localcss}/master.css" rel="stylesheet" type="text/css">	
</head>

<body>
<div id="slideBox">
		<div class="in">
			<div id="slide">
				<ul>
					<c:forEach var="p" items="${promotions}">
						<li><a href="${p.promotionLink}" target="_blank"><img
								src="${ftpimages}/${p.promotionSpict}" height="313" width="790"
								alt="${p.promotionTitle}"></a></li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

<!-- 开始需要写模板 -->
<div id="container">
		<div class="in">								
		<!-- 动态变化的 -->
		<c:forEach var="column" items="${columns}" varStatus="status">
			<div class="column">
				${column.template}
			</div>
		</c:forEach>
	</div>
</div>


</body>
</html>
