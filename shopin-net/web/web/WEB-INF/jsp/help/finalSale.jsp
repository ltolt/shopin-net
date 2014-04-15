<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>百大品牌,四季商品全年最惠,春装抢鲜上,夏装反季热销,冬装最后出清,女装,男装,鞋,包,运动户外,休闲,毛纺,内衣,童装,全场3折封顶,2012.1.31-2.12</title>
<link href="http://images.shopin.net/css/reset.css" rel="stylesheet" type="text/css" />
<link href="http://images.shopin.net/css/reset.css" rel="stylesheet" type="text/css" />
<link href="http://images.shopin.net/css/siji.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="page_wrapper">
<img src="http://images.shopin.net/images/ad/siji/topbanner_1.png" alt="百大品牌四季商品春装抢鲜上－3折封顶－GO!" />
<img src="http://images.shopin.net/images/ad/siji/topbanner_2.png" alt="百大品牌四季商品春装抢鲜上－3折封顶－GO!" />
<img src="http://images.shopin.net/images/ad/siji/topbanner_3.png" alt="百大品牌四季商品春装抢鲜上－3折封顶－GO!" />
<img class="bd4_blue" src="http://images.shopin.net/images/ad/siji/find_discount.png" />
<div class="wrap mb10 bd4_blue">
<a href="http://www.shopin.net/promotion/4235.html" target="_blank"><img src="http://images.shopin.net/images/ad/siji/spring_autumn.png" /></a>
<ul class="product_list clear">

<c:forEach var="product" items="${finalSale1}" varStatus="status">
<li> <a target="_blank" href="${ctx}/product/${product.sid}.html">
        <img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}"><span>${product.productName}</span></a>
<p><del>${product.proPrice.originalPrice}</del>￥${product.proPrice.promotionPrice}</p>
<em>${product.proPrice.offValue}</em>
</li>
 </c:forEach>
</ul>
<ul class="product_list clear">
<c:forEach var="product" items="${finalSale2}" varStatus="status">
<li> <a target="_blank" href="${ctx}/product/${product.sid}.html">
        <img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}"><span>${product.productName}</span></a>
<p><del>${product.proPrice.originalPrice}</del>￥${product.proPrice.promotionPrice}</p>
<em>${product.proPrice.offValue}</em>
</li>
 </c:forEach>
</ul>
<ul class="product_list clear">
<c:forEach var="product" items="${finalSale3}" varStatus="status">
<li> <a target="_blank" href="${ctx}/product/${product.sid}.html">
        <img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}"><span>${product.productName}</span></a>
<p><del>${product.proPrice.originalPrice}</del>￥${product.proPrice.promotionPrice}</p>
<em>${product.proPrice.offValue}</em>
</li>
 </c:forEach>
</ul>
<ul class="product_list clear">
<c:forEach var="product" items="${finalSale4}" varStatus="status">
<li> <a target="_blank" href="${ctx}/product/${product.sid}.html">
        <img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}"><span>${product.productName}</span></a>
<p><del>${product.proPrice.originalPrice}</del>￥${product.proPrice.promotionPrice}</p>
<em>${product.proPrice.offValue}</em>
</li>
 </c:forEach>
</ul>
<p class="t_a_r"><a href="http://www.shopin.net/lady/list--1343--------.html">更多&gt;&gt;</a></p>
</div>
<div class="wrap mb10 bd4_blue">
<a href="http://www.shopin.net/promotion/4236.html" target="_blank"><img src="http://images.shopin.net/images/ad/siji/summer.png" /></a>
<ul class="product_list clear">

<c:forEach var="product" items="${finalSale5}" varStatus="status">
<li> <a target="_blank" href="${ctx}/product/${product.sid}.html">
        <img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}"><span>${product.productName}</span></a>
<p><del>${product.proPrice.originalPrice}</del>￥${product.proPrice.promotionPrice}</p>
<em>${product.proPrice.offValue}</em>
</li>
 </c:forEach>
</ul>
<ul class="product_list clear">

<c:forEach var="product" items="${finalSale6}" varStatus="status">
<li> <a target="_blank" href="${ctx}/product/${product.sid}.html">
        <img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}"><span>${product.productName}</span></a>
<p><del>${product.proPrice.originalPrice}</del>￥${product.proPrice.promotionPrice}</p>
<em>${product.proPrice.offValue}</em>
</li>
 </c:forEach>
</ul>
<p class="t_a_r"><a href="http://www.shopin.net/lady/list--1647--------.html">更多&gt;&gt;</a></p>
</div>
<div class="wrap mb10 bd4_blue">
<a href="http://www.shopin.net/promotion/4238.html" target="_blank"><img src="http://images.shopin.net/images/ad/siji/winter.png" /></a>
<ul class="product_list clear">

<c:forEach var="product" items="${finalSale7}" varStatus="status">
<li> <a target="_blank" href="${ctx}/product/${product.sid}.html">
        <img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}"><span>${product.productName}</span></a>
<p><del>${product.proPrice.originalPrice}</del>￥${product.proPrice.promotionPrice}</p>
<em>${product.proPrice.offValue}</em>
</li>
 </c:forEach>
</ul>
<ul class="product_list clear">

<c:forEach var="product" items="${finalSale8}" varStatus="status">
<li> <a target="_blank" href="${ctx}/product/${product.sid}.html">
        <img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}"><span>${product.productName}</span></a>
<p><del>${product.proPrice.originalPrice}</del>￥${product.proPrice.promotionPrice}</p>
<em>${product.proPrice.offValue}</em>
</li>
 </c:forEach>
</ul>
<p class="t_a_r"><a href="http://www.shopin.net/list--1740.html">更多&gt;&gt;</a></p>
</div>
<div class="wrap mb10 bd4_blue">
<div class="subside t_a_c"><img src="http://images.shopin.net/images/ad/siji/pic_1.png" alt="百大品牌 四季商品全年最惠价蜂抢会 3折封顶！" /></div>
<dl class="brand_item clear">
<dt><img src="http://images.shopin.net/images/ad/siji/nz.png" alt="女装" /><a href="http://www.shopin.net/channel-lady.html" target="_blank">更多&gt;&gt;</a></dt>
<dd><a href="http://www.shopin.net/lady/brand/list-289-1046-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/289_2.jpg" alt="皮尔卡丹" />皮尔卡丹</a></dd>
<dd><a href="http://www.shopin.net/lady/brand/list-1047-1046-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1047_2.jpg" alt="圣三利" />圣三利</a></dd> 
<dd><a href="http://www.shopin.net/list-1000--0.05-0.3-----1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1000_2.jpg" alt="Veilond" />Veilond</a></dd>
<dd><a href="http://www.shopin.net/lady/brand/list-153-1046-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/153_2.jpg" alt="纳纹" />纳纹</a></dd>
<dd><a href="http://www.shopin.net/lady/brand/list-112-1046-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/112_2.jpg" alt="红袖" />红袖</a></dd>
<dd><a href="http://www.shopin.net/lady/brands/111.html" target="_blank"><img src="http://images.shopin.net/images/brand/111_2.jpg" alt="Et Boite" />Et Boite</a></dd>
</dl>
<dl class="brand_item clear">
<dt><img src="http://images.shopin.net/images/ad/siji/lz.png" alt="男装" /><a href="http://www.shopin.net/channel-man.html" target="_blank">更多&gt;&gt;</a></dt>
<dd><a href="http://www.shopin.net/man/brand/list-452-1047-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/452_2.jpg" alt="罗蒙" />罗蒙</a></dd> 
<dd><a href="http://www.shopin.net/brand/list-426--0.05-0.31-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/426_2.jpg" alt="ROMASTER" />ROMASTER</a></dd> 
<dd><a href="http://www.shopin.net/brand/list-291-1047-0.05-0.31-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/291_2.jpg" alt="GOLDLION" />GOLDLION</a></dd> 
<dd><a href="http://www.shopin.net/brand/list-764--0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/764_2.jpg" alt="吉诺里兹" />吉诺里兹</a></dd> 
<dd><a href="http://www.shopin.net/brand/list-465--0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/465_2.jpg" alt="尼诺里拉" />尼诺里拉</a></dd> 
<dd><a href="http://www.shopin.net/man/brand/list-412-1047-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/412_2.jpg" alt="PAGUCI" />PAGUCI</a></dd> 
</dl>
<dl class="brand_item clear">
<dt><img src="http://images.shopin.net/images/ad/siji/xb.png" alt="鞋包" /><a href="http://www.shopin.net/channel-shoes.html" target="_blank">更多&gt;&gt;</a></dt>
<dd><a href="http://www.shopin.net/shoes/brand/list-256-1067-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/256_2.jpg" alt="莱尔斯丹" />莱尔斯丹</a></dd>  
<dd><a href="http://www.shopin.net/shoes/brand/list-1357-1067-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1357_2.jpg" alt="MISS SIXTY" />MISS SIXTY</a></dd>   
<dd><a href="http://www.shopin.net/shoes/brand/list-319-1067-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/319_2.jpg" alt="红蜻蜓" />红蜻蜓</a></dd>  
<dd><a href="http://www.shopin.net/handbags/brand/list-489-1069-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/489_2.jpg" alt="保兰德" />保兰德</a></dd> 
<dd><a href="http://www.shopin.net/handbags/brand/list-192-1069-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/192_2.jpg" alt="GOLF" />GOLF</a></dd>  
<dd><a href="http://www.shopin.net/handbags/brand/list-586-1069-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/586_2.jpg" alt="POLO" />POLO</a></dd>  
</dl>
<dl class="brand_item clear">
<dt><img src="http://images.shopin.net/images/ad/siji/ydhw.png" alt="运动户外" /><a href="http://www.shopin.net/channel-sports.html" target="_blank">更多&gt;&gt;</a></dt>
<dd><a href="http://www.shopin.net/sports/list-757-1446-0.05-0.3------.html" target="_blank"><img src="http://images.shopin.net/images//brand/757_2.jpg" alt="REEBOK" />REEBOK</a></dd>
<dd><a href="http://www.shopin.net/sports/brands/538.html" target="_blank"><img src="http://images.shopin.net/images/brand/538_2.jpg" alt="PUMA" />PUMA</a></dd>
<dd><a href="http://www.shopin.net/sports/list-592-1446-0.05-0.3------.html" target="_blank"><img src="http://images.shopin.net/images//brand/592_2.jpg" alt="kappa" />kappa</a></dd>
<dd><a href="http://www.shopin.net/brands/591.html" target="_blank"><img src="http://images.shopin.net/images/brand/591_2.jpg" alt="探路者" />探路者</a></dd> 
<dd><a href="http://www.shopin.net/brands/1616.html" target="_blank"><img src="http://images.shopin.net/images/brand/1616_2.jpg" alt="Jack Wolfskin" />Jack Wolfskin</a></dd>
<dd><a href="http://www.shopin.net/brands/602.html" target="_blank"><img src="http://images.shopin.net/images/brand/602_2.jpg" alt="BLACKYAK" />BLACKYAK</a></dd> 
</dl>
<dl class="brand_item clear">
<dt><img src="http://images.shopin.net/images/ad/siji/xx.png" alt="休闲" /><a href="http://www.shopin.net/channel-casual.html" target="_blank">更多&gt;&gt;</a></dt>
<dd><a href="http://www.shopin.net/casual/brands/499.html" target="_blank"><img src="http://images.shopin.net/images/brand/499_2.jpg" alt="罗宾汉" />罗宾汉</a></dd>
<dd><a href="http://www.shopin.net/casual/brands/501.html" target="_blank"><img src="http://images.shopin.net/images/brand/501_2.jpg" alt="佐丹奴" />佐丹奴</a></dd>
<dd><a href="http://www.shopin.net/casual/brands/1386.html" target="_blank"><img src="http://images.shopin.net/images/brand/1386_2.jpg" alt="TEXWOOD" />TEXWOOD</a></dd>
<dd><a href="http://www.shopin.net/casual/brands/865.html" target="_blank"><img src="http://images.shopin.net/images/brand/865_2.jpg" alt="TONY WEAR" />TONY WEAR</a></dd>
<dd><a href="http://www.shopin.net/casual/brands/505.html" target="_blank"><img src="http://images.shopin.net/images/brand/505_2.jpg" alt="卡斯彼龙" />卡斯彼龙</a></dd>
<dd><a href="http://www.shopin.net/casual/brands/506.html" target="_blank"><img src="http://images.shopin.net/images/brand/506_2.jpg" alt="比利" />比利</a></dd>
</dl>
<dl class="brand_item clear">
<dt><img src="http://images.shopin.net/images/ad/siji/ny.png" alt="内衣" /><a href="http://www.shopin.net/channel-underwear.html" target="_blank">更多&gt;&gt;</a></dt>
<dd><a href="http://www.shopin.net/underwear/brand/list-856-1068-0.05-0.3-----1/1.html" target="_blank"><img src="http://images.shopin.net/images/brand/856_2.jpg" alt="博尼" />博尼</a></dd>
<dd><a href="http://www.shopin.net/underwear/brand/list-752-1068-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/752_2.jpg" alt="MAND.YAMAN" />MAND.YAMAN</a></dd>
<dd><a href="http://www.shopin.net/underwear/brand/list-69-1068-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/69_2.jpg" alt="桑扶兰" />桑扶兰</a></dd>
<dd><a href="http://www.shopin.net/underwear/brand/list-74-1068-0.05-0.3-----1/1.html" target="_blank"><img src="http://images.shopin.net/images/brand/74_2.jpg" alt="体会" />体会</a></dd>
<dd><a href="http://www.shopin.net/underwear/brand/list-1356-1068-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1356_2.jpg" alt="芬蝶" />芬蝶</a></dd>	
<dd><a href="http://www.shopin.net/underwear/brand/list-1487-1068-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1487_2.jpg" alt="兰朵" />兰朵</a></dd>	
</dl>
<dl class="brand_item clear">
<dt><img src="http://images.shopin.net/images/ad/siji/mf.png" alt="毛纺" /><a href="http://www.shopin.net/list--1720.html" target="_blank">更多&gt;&gt;</a></dt>
<dd><a href="http://www.shopin.net/list-1409-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1409_2.jpg" alt="雪莲" />雪莲</a></dd>
<dd><a href="http://www.shopin.net/list-1410-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1410_2.jpg" alt="鹿王" />鹿王</a></dd>
<dd><a href="http://www.shopin.net/list-303-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/303_2.jpg" alt="鄂尔多斯" />鄂尔多斯</a></dd>
<dd><a href="http://www.shopin.net/list-291-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/291_2.jpg" alt="金利来" />金利来</a></dd>
<dd><a href="http://www.shopin.net/list-1309-1720-0.05-0.3-----1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1309_2.jpg" alt="蒙丹米尔" />蒙丹米尔</a></dd>
<dd><a href="http://www.shopin.net/list-1511-1720-0.05-0.3-----1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1511_2.jpg" alt="依彩绒" />依彩绒</a></dd>
</dl>
<dl class="brand_item clear">
<dt><img src="http://images.shopin.net/images/ad/siji/tz.png" alt="童装" /><a href="http://www.shopin.net/channel-children.html" target="_blank">更多&gt;&gt;</a></dt>
<dd><a href="http://www.shopin.net/children/brand/list-48-1070-0.05-0.3-----1.html " target="_blank"><img src="http://images.shopin.net/images/brand/48_2.jpg" alt="菲格咪妮" />菲格咪妮</a></dd>
<dd><a href="http://www.shopin.net/children/brand/list-1540-1070-0.05-0.3-----1/1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1540_2.jpg" alt="常春藤" />常春藤</a></dd>
<dd><a href="http://www.shopin.net/children/brand/list-46-1070-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/46_2.jpg" alt="巴布豆" />巴布豆</a></dd>
<dd><a href="http://www.shopin.net/children/brand/list-42-1070-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/42_2.jpg" alt="奥克汤姆" />奥克汤姆</a></dd>
<dd><a href="http://www.shopin.net/children/brand/list-10-1070-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/10_2.jpg" alt="昱璐" />昱璐</a></dd>
<dd><a href="http://www.shopin.net/children/brand/list-99-1070-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/99_2.jpg" alt="空中天使" />空中天使</a></dd>
</dl>
</div>
<style type="text/css">
.page_wrapper { position:relative; width:950px; background:#fff; margin:0 auto;}
#ibacktop { width:21px; height:75px; cursor:pointer; position:absolute;}
</style>
<script type="text/javascript">
$(function(){
$(document.body).append("<div id='ibacktop'><img src='http://images.shopin.net/images/totop.gif' width='21' height='75' /></div>");
var rollThis = function(){
	var poTop = $(document).scrollTop() + $(window).height() - 100 + "px";
	var poLeft = $(".page_wrapper").offset();
	var poLeft = poLeft.left + 960 + "px";
	$("#ibacktop").css({top:poTop,left:poLeft})
	}
	
$(window).resize(function(){
	rollThis();
	});
$(window).scroll(function(){
	rollThis();
	});
rollThis();
$("#ibacktop").click(function(){
	$('body,html').animate({scrollTop:0},1000);
	return false;
});
})
</script>
</div>
</body>
</html>