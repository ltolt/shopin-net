<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<jsp:include page="/common/meta.jsp"/> 
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>八店一网,千款万件冬物出清,羊绒,羽绒,靴子,保暖,一降到底,明星单品全场2折封,新年贺岁档,送亲友佳品,2011.1.24-29 仅6天！</title>
<link href="http://images.shopin.net/css/reset.css" rel="stylesheet" type="text/css" />
<link href="http://images.shopin.net/css/dongzhuangzj.css" rel="stylesheet" type="text/css" />
</head>
<body id="nianhuo">
<div class="fs_box">
<div id="top_banner"><img src="http://images.shopin.net/images/ad/finalSale/topbanner_1.jpg" alt="上品折扣大拜年－年货劲折享不停" /><img src="http://images.shopin.net/images/ad/finalSale/topbanner_2.jpg" alt="上品折扣大拜年－年货劲折享不停" /><img src="http://images.shopin.net/images/ad/finalSale/topbanner_3.jpg" alt="上品折扣大拜年－年货劲折享不停" /> </div>
<div class="w950 ad" style="background:#fff"><img src="http://images.shopin.net/images/ad/finalSale/ad_01.jpg" alt="如何找到直降商品" border="0" class="box_ad" /></div>
<div class="w950 bgcef pb10">
  <h2 class="tit_list"><img src="http://images.shopin.net/images/ad/finalSale/tit_list01.gif" alt="八店一网冬物出清，一降到底！" /></h2>
  <div class="warp01">
  <a href="http://www.shopin.net/promotion/3943.html" target="_blank"><img src="http://images.shopin.net/images/ad/finalSale/ad_02.jpg" alt="" border="0" /></a>
    <map name="Map" id="Map">
      <area shape="rect" coords="10,7,231,206" href="http://www.shopin.net/promotion/4180.html" target="_blank" />
      <area shape="rect" coords="240,6,464,204" href="http://www.shopin.net/promotion/4182.html" target="_blank" />
      <area shape="rect" coords="471,7,694,204" href="http://www.shopin.net/promotion/4178.html" target="_blank" />
      <area shape="rect" coords="701,9,926,206" href="http://www.shopin.net/promotion/4179.html" target="_blank" />
    </map>
    <map name="Map2" id="Map2">
      <area shape="rect" coords="702,6,923,202" href="http://www.shopin.net/promotion/4183.html" target="_blank" />
      <area shape="rect" coords="470,4,695,202" href="http://www.shopin.net/promotion/4114.html" target="_blank" />
      <area shape="rect" coords="241,6,463,202" href="http://www.shopin.net/promotion/4083.html" target="_blank" />
      <area shape="rect" coords="8,6,231,202" href="http://www.shopin.net/promotion/4079.html" target="_blank" />
    </map>
	<map name="Map3" id="Map3">
      <area shape="rect" coords="12,5,232,201" href="http://www.shopin.net/promotion/4162.html" target="_blank" />
      <area shape="rect" coords="241,4,462,200" href="http://www.shopin.net/promotion/3672.html" target="_blank" />
      <area shape="rect" coords="472,6,693,204" href="http://www.shopin.net/promotion/3654.html" target="_blank" />
      <area shape="rect" coords="703,6,928,205" href="http://www.shopin.net/promotion/4175.html" target="_blank" />
    </map>
    <map name="Map4" id="Map4">
      <area shape="rect" coords="8,7,233,204" href="http://www.shopin.net/promotion/4102.html" target="_blank" />
      <area shape="rect" coords="243,6,462,202" href="http://www.shopin.net/promotion/4184.html" target="_blank" />
      <area shape="rect" coords="473,6,696,203" href="http://www.shopin.net/promotion/3951.html" target="_blank" />
      <area shape="rect" coords="702,6,924,204" href="http://www.shopin.net/promotion/3796.html" target="_blank" />
    </map>
	<img src="http://images.shopin.net/images/ad/finalSale/brand_top.jpg" alt="" border="0" usemap="#Map" />
	<img src="http://images.shopin.net/images/ad/finalSale/brand_middle.jpg" alt="" border="0" usemap="#Map2" />
	<img src="http://images.shopin.net/images/ad/finalSale/brand_bottom.jpg" alt="" border="0" usemap="#Map3" />
	<img src="http://images.shopin.net/images/ad/finalSale/brand_bottom1.jpg" alt="" border="0" usemap="#Map4" />
  </div>
</div>
<div class="w950 bgcef pb10">
  <h2 class="tit_list"><img src="http://images.shopin.net/images/ad/finalSale/tit_list02.gif" alt="网络独享明星单品 2折封顶！ 24小时更新！" /></h2>
  <div class="dz_warp clear">
  <h2><p><a href="http://www.shopin.net/list--1720.html" target="_blank">更多&gt;&gt;</a></p><span>羊绒</span></h2>
  
  <ul class="clear">
   <c:forEach var="product" items="${finalSale1}" varStatus="status">
    <li>
      <a target="_blank" href="${ctx}/product/${product.sid}.html">
        <img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}">${product.productName}
      </a>
      <p><del>${product.proPrice.originalPrice}</del>￥${product.proPrice.promotionPrice}</p>
      <div class="zhekou">${product.proPrice.offValue} </div>
    </li>
     </c:forEach>
  
  </ul>
  
  <ul class="clear">
   <c:forEach var="product" items="${finalSale2}" varStatus="status">
    <li>
      <a target="_blank" href="${ctx}/product/${product.sid}.html">
        <img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}">${product.productName}
      </a>
      <p><del>${product.proPrice.originalPrice}</del>￥${product.proPrice.promotionPrice}</p>
      <div class="zhekou">${product.proPrice.offValue} </div>
    </li>
     </c:forEach>
  
  </ul>
  
  <h2><p><a href="http://www.shopin.net/list--1824.html" target="_blank">更多&gt;&gt;</a></p><span>靴子</span></h2>
  <ul class="clear">
   <c:forEach var="product" items="${finalSale3}" varStatus="status">
	 <li>
      <a target="_blank" href="${ctx}/product/${product.sid}.html">
        <img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}">${product.productName}
      </a>
      <p><del>${product.proPrice.originalPrice}</del>￥${product.proPrice.promotionPrice}</p>
      <div class="zhekou">${product.proPrice.offValue} </div>
    </li>
    </c:forEach>
  </ul>
 <ul class="clear">
   <c:forEach var="product" items="${finalSale4}" varStatus="status">
	 <li>
      <a target="_blank" href="${ctx}/product/${product.sid}.html">
        <img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}">${product.productName}
      </a>
      <p><del>${product.proPrice.originalPrice}</del>￥${product.proPrice.promotionPrice}</p>
      <div class="zhekou">${product.proPrice.offValue} </div>
    </li>
    </c:forEach>
  </ul>
  <h2><p><a href="http://www.shopin.net/list--1740.html" target="_blank">更多&gt;&gt;</a></p><span>羽绒</span></h2>
  
  <ul class="clear">  
	<c:forEach var="product" items="${finalSale5}" varStatus="status">
	 <li>
      <a target="_blank" href="${ctx}/product/${product.sid}.html">
        <img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}">${product.productName}
      </a>
      <p><del>${product.proPrice.originalPrice}</del>￥${product.proPrice.promotionPrice}</p>
      <div class="zhekou">${product.proPrice.offValue} </div>
    </li>
    </c:forEach>
    </ul>
<ul class="clear">  
	<c:forEach var="product" items="${finalSale6}" varStatus="status">
	 <li>
      <a target="_blank" href="${ctx}/product/${product.sid}.html">
        <img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}">${product.productName}
      </a>
      <p><del>${product.proPrice.originalPrice}</del>￥${product.proPrice.promotionPrice}</p>
      <div class="zhekou">${product.proPrice.offValue} </div>
    </li>
    </c:forEach>
    </ul>
  <h2><p><a href="http://www.shopin.net/underwear/list--1087--------.html" target="_blank">更多&gt;&gt;</a></p><span>保暖内衣</span></h2>
  <ul class="clear">
	<c:forEach var="product" items="${finalSale7}" varStatus="status">
	 <li>
      <a target="_blank" href="${ctx}/product/${product.sid}.html">
        <img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}">${product.productName}
      </a>
      <p><del>${product.proPrice.originalPrice}</del>￥${product.proPrice.promotionPrice}</p>
      <div class="zhekou">${product.proPrice.offValue} </div>
    </li>
    </c:forEach>
  </ul>
  <ul class="clear">
	<c:forEach var="product" items="${finalSale8}" varStatus="status">
	 <li>
      <a target="_blank" href="${ctx}/product/${product.sid}.html">
        <img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}">${product.productName}
      </a>
      <p><del>${product.proPrice.originalPrice}</del>￥${product.proPrice.promotionPrice}</p>
      <div class="zhekou">${product.proPrice.offValue} </div>
    </li>
    </c:forEach>
  </ul>
  
    <div class="w830 pt25">
      <dl class="fs_logolist fl">
        <dt><img src="http://images.shopin.net/images/ad/finalSale/tit_logo1.gif" alt="羊绒品牌" /></dt>
        <dd><a href="http://www.shopin.net/list-1409-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/finalSale/logo1.gif" border="0" /></a><a href="http://www.shopin.net/list-1410-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/finalSale/logo2.gif" /></a><a href="http://www.shopin.net/list-303-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/finalSale/logo3.gif" /></a><a href="http://www.shopin.net/list-291-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/finalSale/logo4.gif" /></a></dd>
      </dl>
      <dl class="fs_logolist fr">
        <dt><img src="http://images.shopin.net/images/ad/finalSale/tit_logo2.gif" alt="靴子品牌" /></dt>
        <dd><a href="http://www.shopin.net/list-319-1067-------1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/finalSale/logo5.gif" /></a><a href="http://www.shopin.net/list-293-1067-------1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/finalSale/logo6.gif" /></a><a href="http://www.shopin.net/list-1357-1067-------1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/finalSale/logo7.gif" /></a><a href="http://www.shopin.net/list-237-1067-------1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/finalSale/logo8.gif" /></a></dd>
      </dl>
      <dl class="fs_logolist fl">
        <dt><img src="http://images.shopin.net/images/ad/finalSale/tit_logo3.gif" alt="羽绒品牌" /></dt>
        <dd><a href="http://www.shopin.net/list-1411-1740-------1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/finalSale/logo9.gif" /></a><a href="http://www.shopin.net/list-1413-1740-------1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/finalSale/logo10.gif" /></a><a href="http://www.shopin.net/list-1492-1740-------1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/finalSale/logo11.gif" /></a><a href="http://www.shopin.net/brands/1881.html" target="_blank"><img src="http://images.shopin.net/images/ad/finalSale/logo12.gif" /></a></dd>
      </dl>
      <dl class="fs_logolist fr">
        <dt><img src="http://images.shopin.net/images/ad/finalSale/tit_logo4.gif" alt="保暖品牌" /></dt>
        <dd><a href="http://www.shopin.net/underwear/brands/1475.html" target="_blank"><img src="http://images.shopin.net/images/ad/finalSale/logo13.gif" /></a><a href="http://www.shopin.net/underwear/brands/1476.html" target="_blank"><img src="http://images.shopin.net/images/ad/finalSale/logo14.gif" /></a><a href="http://www.shopin.net/underwear/brands/1488.html" target="_blank"><img src="http://images.shopin.net/images/ad/finalSale/logo15.gif" /></a><a href="http://www.shopin.net/underwear/brands/174.html" target="_blank"><img src="http://images.shopin.net/images/ad/finalSale/logo16.gif" /></a></dd>
      </dl>
    </div>
  </div>
</div>
<div class="w950 pb10">
  <a href="http://www.shopin.net/promotion/4169.html" target="_blank"><img src="http://images.shopin.net/images//promotions/201201181526261.jpg" /></a>
  <p class="go_home"><a href="http://www.shopin.net/">返回首页&gt;&gt;</a></p>
</div>
</div>
<style type="text/css">
.fs_box { position:relative; width:950px; background:#fff; margin:0 auto;}
#ibacktop { width:21px; height:75px; cursor:pointer; position:absolute;}
</style>
<script type="text/javascript">
$(function(){
$(document.body).append("<div id='ibacktop'><img src='http://images.shopin.net/images/totop.gif' width='21' height='75' /></div>");
var rollThis = function(){
	var poTop = $(document).scrollTop() + $(window).height() - 100 + "px";
	var poLeft = $(".fs_box").offset();
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
</body>
</html>
