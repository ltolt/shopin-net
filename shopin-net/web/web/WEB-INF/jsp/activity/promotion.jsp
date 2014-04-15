<%--
  Created by Eclipse.
  User: jingpeng
  Date: 2013-8-7
  Time: 11:04
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<meta charset="utf-8">
<title>上品折扣网 - 实体店应季正品保障，全网底价折扣特卖</title>
<link href="${localcss}/reset.css" rel="stylesheet" type="text/css">
<link href="${localcss}/layout.css" rel="stylesheet" type="text/css">
<link href="${localcss}/master.css" rel="stylesheet" type="text/css">
</head>

<body>

<div id="container">
	<div class="in">
		<c:if test="${!empty promotion.promotionBpict}">
			<div class="mt20"><img src="${ftpimages}${promotion.promotionBpict}" width="1000"></div>
		</c:if>
		<div class="countdown clear oz">
						<ul class="fl">
								<li id="miaoTime"></li>
						</ul>
						<script language="javascript">  
							function _fresh(){  
							 var end = '${promotion.promotionEndTime}';
							 var endtime=new Date(end);//定义结束时间
							 var nowtime = new Date();  
							 var leftsecond=parseInt((endtime.getTime()-nowtime.getTime())/1000)-3600*14;  
							 __d=parseInt(leftsecond/3600/24);  
							 __h=parseInt((leftsecond/3600)%24);  
							 __m=parseInt((leftsecond/60)%60);  
							 __s=parseInt(leftsecond%60);  
							var c=new Date();
							var q=((c.getMilliseconds())%10);
							 document.getElementById("miaoTime").innerHTML="还剩："+"<span>"+__d+"</span>"+"天"+"<span>"+__h+"</span>"+"小时"+"<span>"+__m+"</span>"+"分"+"<span>"+__s+"</span>"+"秒";  
							if(leftsecond<=0){  
								 document.getElementById("miaoTime").innerHTML="还剩："+"<span>0</span>"+"天"+"<span>0</span>"+"小时"+"<span>0</span>"+"分"+"<span>0</span>"+"秒";//结束后的状态
								 clearInterval(sh);  
							 }  
							}  
							_fresh();  
							var sh;  
							sh=setInterval(_fresh,100);  
						</script>
						<ul class="fr">
								<li><span>${promotion.promotionDesc}</span></li>
						</ul>
				</div>
		<c:forEach var="column" items="${columns}" varStatus="status">
			${column.template}
		</c:forEach>
	</div>
</div>
<script>
$(".sort dd").click(function(){
	$(this).addClass("cur").siblings().removeClass("cur");
	var curIndex = $(this).parent().find("dd").index(this);
	$(this).closest(".column").find(".item").css("display","none");
	$(this).closest(".column").find(".item").eq(curIndex).show();
});
$(".sort dd, .range dd").hover(function(){
		$(this).addClass("over");
	},function(){
		$(this).removeClass("over");
	});
var range = $(".range dd");
	range.click(function(){
		if($(this).hasClass("cur")){$(this).toggleClass("descend");}else{true;};
		$(this).addClass("cur").siblings().removeClass("cur");
	});
</script>
<!--[if IE 6]>
<script type="text/javascript" src="DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript"> 
DD_belatedPNG.fix('.png');
</script> 
<![endif]-->
</body>
</html>
