
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>${channel.displayName} - 实体店应季正品保障，全网底价折扣特卖</title>
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
<div id="container">
		<div class="in">
		<c:forEach var="column" items="${columns}" varStatus="status">
			${column.template}
		</c:forEach>
		</div>
</div>
<script>
$(".tWeixin").hover(function(){
		$(".tCode").show();
		},function(){
  $(".tCode").hide();
});
</script> 
<!--[if IE 6]>
<script src="http://images.shopin.net/s/js/DD_belatedPNG_0.0.8a-min.js"></script> 
<script type="text/javascript"> 
DD_belatedPNG.fix('.png');
</script> 
<![endif]-->
</body>
</html>
