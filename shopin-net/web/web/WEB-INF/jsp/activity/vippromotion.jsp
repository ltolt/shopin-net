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
<script src="${localjs}/mousemove.js"></script>
</head>

<body>
<div id="container">
	<div class="in pr">
			<div class="bos mt oz onSale promotion" style="width:1000;height:160">
			<a target="_blank">
				<img src="${ftpimages}${flashPromotion.promotionBpict}" style="width:1000;height:210">
			</a>
			<div class="saleTime"><strong>${flashPromotion.promotionDesc}</strong>
				<div id="remainTime"></div>
			</div>
		<script language="javascript">
			function _fresh() {
				var end = '${flashPromotion.promotionEndTime}';
				var endtime = new Date(end);//定义结束时间 
				var nowtime = new Date();
				var leftsecond = parseInt((endtime.getTime() - nowtime.getTime()) / 1000)-3600*14;
				__d = parseInt(leftsecond / 3600 / 24);
				__h = parseInt((leftsecond / 3600) % 24);
				__m = parseInt((leftsecond / 60) % 60);
				__s = parseInt(leftsecond % 60);
				var c = new Date();
				var q = ((c.getMilliseconds()) % 10);
				var id = "";
				document.getElementById("remainTime").innerHTML = "<span>"
						+"还剩"
						+ "<span>"
						+ __d
						+ "</span>"
						+ "天"
						+ "<span>"
						+ __h
						+ "</span>"
						+ "小时"
						+ "<span>"
						+ __m
						+ "</span>"
						+ "分"
						+ "<span>"
						+ __s
						+ "</span>" + "秒"
						+ "结束"
						+ "</span>";
				if (leftsecond <= 0) {
					document.getElementById("remainTime").innerHTML = "活动已结束";//结束后的状态
					clearInterval(sh);
				}
			}
			_fresh();
			var sh;
			sh = setInterval(_fresh, 100);
		</script>
		</div>
		<c:forEach var="column" items="${flashColumns}" varStatus="status">
			<div class="column">
				${column.template}
			</div>
		</c:forEach>
	</div>
	
</div>
<script type="text/javascript">
//跳转搜索页转码，解决IE乱码问题
function searchKeyWordNewWindow(keyword) {
	var forword = "${searchDomain }/search.html?keyword=" + encodeURI(keyword);
	window.open(forword, "_blank");
}
function searchKeyWord(keyword) {
	var forword = "${searchDomain }/search.html?keyword=" + encodeURI(keyword);
	window.open(forword);
}
</script>
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
		if($(this).hasClass("cur")){$(this).toggleClass("descend")}else{true};
		$(this).addClass("cur").siblings().removeClass("cur");
	});
$(function(){
	$(".MagicZoom").hover(function(){
		$(this).addClass("curr");
		},function(){
			$(this).removeClass("curr");
			});
	});
</script>
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

