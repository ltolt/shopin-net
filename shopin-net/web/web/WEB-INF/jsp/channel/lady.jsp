<%--
  Description:Lady List(女装)
  User: Peter Wei
  Date: 2010-1-8
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head><title>${channel.displayName}-上品折扣网shopin.net- 商场名牌1-3折限量秒杀,正品保障,网上购物!服装品牌,名品折扣,名牌打折,团购价!上品折扣官方购物网站</title>

	<link href="${localcss}/reset.css" rel="stylesheet" type="text/css">
	<link href="${localcss}/layout.css" rel="stylesheet" type="text/css">
	<link href="${localcss}/master.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="container">
	<div class="in">
		<c:forEach var="column" items="${columns}" varStatus="status">
			${column.template}
		</c:forEach>
	</div>
</div>
<!--[if IE 6]>
<script src="http://images.shopin.net/s/js/DD_belatedPNG_0.0.8a-min.js"></script> 
<script type="text/javascript"> 
DD_belatedPNG.fix('.png');
</script> 
<![endif]-->
</body>
</html>
