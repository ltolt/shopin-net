<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>2011年终抄底,300个品牌,4万款商品,折上9折,8大名品专场,会员年终回馈,仅5天,12.14-18</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<base target="_blank" />
<style type="text/css">
	.hd_nav { position:relative; width:950px; background:#eff0e8; margin:0 auto;}
	.hd_nav a { text-decoration:none;}
	.hd_nav img { border:none;}
	.hd_nav ul { list-style:none; padding:0; margin:0;}
	.hd_nav ul li { width:130px; float:left;}
	.hd_nav ul h1,.hd_nav ul p { padding:0; margin:0; text-align:center; font-size:12px; height:24px; line-height:24px; overflow:hidden; color:#333333; font-weight:normal;}
	.hd_nav ul a:hover h1 { color:#f15930}
	.hd_nav ul p b { color:#f15930; font-size:14px;}
	#ibacktop { width:21px; height:75px; cursor:pointer; position:absolute;}
	
	.fsdanpinlist {
	border:2px solid #c00405;
	border-top:none;
	background:#eff0e8;
	padding:20px;
}
	.hd_nav .fsdanpinlist ul li { width:132px; float:left; height:220px; padding:0 9px;}
	.hd_nav .fsdanpinlist ul li p span { text-decoration:line-through;}
	.hd_nav .fsdanpinlist ul a:hover h1 { color:#f15930;}
	
	.hd_catblock {
	border:2px solid #c00405;
	border-top:none;
	padding:0 1px;
	width:944px;
}
	.hd_catlist {
	width:471px;
	float:left;
	overflow:hidden;
	padding-top: 1px;
	padding-right: 0;
	padding-bottom: 1px;
	padding-left: 0;
}
	.hd_catlist li {padding:12px 10px;}
	.hd_title { height:25px; margin-left:1px; margin-right:1px; }
	.hd_title .fleft { display:block; float:left; width:150px;font-family:"宋体"; text-indent:10px; font-size:12px; font-weight:bold; line-height:24px; text-align:left; color:#374251;}
	.hd_title .fleft a{font-family:"宋体";  text-indent:10px; font-size:12px; font-weight:bold; line-height:24px; text-align:left; color:#374251;}
	.hd_title .fright {
	display:block;
	float:right;
	width:170px;
	text-align:right;
	padding-right:10px;
}
	.hd_title .fright a {font-size:12px; font-weight:bold; color:#56676f; line-height:24px; }
	.hd_cat_pp { margin-left:10px; margin-right:10px; background:#b1d9d8; padding:15px; height:62px; width:430px;}
	.hd_nav .hd_cat_pp ul li { width:90px; padding:0 5px; overflow:hidden; float:left;}
	.hd_cat_pp img { width:90px; height:62px;}
	.diabtn {
	cursor:pointer;
	margin-left:110px;
	margin-top:490px;
	width:220px;
	height:50px;
}
	.diabtn1 {
	cursor:pointer;
	margin-left:110px;
	margin-top:490px;
	width:220px;
	height:50px;
}

	.showcover { background:#f15930; opacity:0.5; filter:alpha(opacity=50); position:absolute; top:0; left:0; width:100%; z-index:10; display:none; }
	.showdiag { background:#f0f1e9;width:362px; height:238px; position:absolute; z-index:100; border-radius:24px; -moz-border-radius:24px; -webkit-border-radius:24px; background:url(http://images.shopin.net/images/ad/cd/sdbg.gif)\9; background-color:none\9; display:none; overflow:hidden;}
	.showdiaginfo { padding:30px; position:relative;}
	.showdiaginfo div {height:36px;}
	.showdiag label { width:60px; text-align:right; font-size:12px; color:#595f5b; line-height:22px; display:block; float:left;}
	.showdiag .textcss { border:none; background:url(http://images.shopin.net/images/ad/cd/inputbg.jpg) no-repeat; width:206px; height:16px; line-height:16px; padding:3px; display:block; float:left;}
	.showdiag p { font-size:12px; line-height:24px;color:#595f5b; margin:0;}
	.submitbtn { border:none; background:url(http://images.shopin.net/images/ad/cd/submit.gif); width:118px; height:45px; cursor:pointer;}
	.closebtn{ cursor:pointer;}
	.showdiaginfo div.diagclose { background:#666; color:#fff; width:16px; height:16px; line-height:16px; position:absolute; right:10px; top:10px; font-family:"Lucida Sans Unicode", "Lucida Grande", sans-serif; font-weight:bold; text-align:center; cursor:pointer;}
</style>
<script type="text/javascript" src="http://images.shopin.net/js/jquery/jquery132min.js"></script>
<script type="text/javascript" src="http://images.shopin.net/js/lazyload.js"></script>
<script type="text/javascript">
$(document).ready(function(){
$(".hd_nav img").lazyload({
          placeholder : "http://images.shopin.net/images/ad/lazyblank.gif",        
          effect : "fadeIn"
});
});
</script>
</head>

<body>
<div class="hd_nav">
	<div style="height:435px; overflow:hidden;"><img src="http://images.shopin.net/images/ad/dd/01.jpg" width="950" height="435" border="0" usemap="#Map5" />
      <map name="Map5" id="Map5">
        <area shape="poly" coords="584,72" href="#" />
      </map>
</div>
  <div><img src="http://images.shopin.net/images/ad/dd/02.jpg" width="950" height="34" border="0" id="shownav1" /></div>
  <div><img src="http://images.shopin.net/images/ad/dd/03.jpg" width="950" height="137" /></div>
  <div><img src="http://images.shopin.net/images/ad/dd/04.jpg" width="950" height="42" id="shownav2" /></div>
  <div></div>
    
<div class="hd_catblock">
    	<!--雪莲-->
<div class="hd_catlist">
        	<div class="hd_title">
            	<div class="fleft">雪莲羊绒</div>
              <div class="fright"><a href="#">还剩10天12小时23分46秒</a></div>
            </div>
            <div ><a href="http://www.shopin.net/promotion/3981.html" target="_blank"><img src="http://images.shopin.net/images/ad/dd/06.jpg" width="470" height="214" border="0" ></a>
              <div style="clear:both"></div>
            </div>
      <div style="clear:both"></div>
        </div>
        <!--红蜻蜓-->
<div class="hd_catlist">
        	<div class="hd_title">
            	<div class="fleft">红蜻蜓</div>
              <div class="fright"><a href="#">还剩10天12小时23分46秒</a></div>
            </div>
            <ul>
              <a href="http://www.shopin.net/promotion/3672.html" target="_blank"><img src="http://images.shopin.net/images/ad/dd/07.jpg" height="214" width="470"  border="0"></a>
              <div style="clear:both"></div>
            </ul>
            <div style="clear:both"></div>
        </div>
        <!--羽绒-->
<div class="hd_catlist">
        	<div class="hd_title">
            	<div class="fleft">雅鹿 MODO GAGA</div>
              <div class="fright"><a href="#">还剩10天12小时23分46秒</a></div>
            </div>
            <ul>
              <a href="http://www.shopin.net/promotion/3982.html" target="_blank"><img src="http://images.shopin.net/images/ad/dd/08.jpg" width="470" height="214" border="0"></a>
              <div style="clear:both"></div>
            </ul>
            <div style="clear:both"></div>
    </div>
        <!--纳纹-->
<div class="hd_catlist">
        	<div class="hd_title">
            	<div class="fleft">纳纹</div>
              <div class="fright"><a href="#">还剩10天12小时23分46秒</a></div>
            </div>
            <ul>
              <a href="http://www.shopin.net/promotion/3153.html" target="_blank"><img src="http://images.shopin.net/images/ad/dd/09.jpg"  border="0"></a>
              <div style="clear:both"></div>
            </ul>
            <div style="clear:both"></div>
        </div>
        <!--李宁-->
<div class="hd_catlist">
        	<div class="hd_title">
            	<div class="fleft">李宁</div>
              <div class="fright"><a href="#">还剩10天12小时23分46秒</a></div>
            </div>
            <ul>
              <a href="http://www.shopin.net/promotion/3711.html" target="_blank"><img src="http://images.shopin.net/images/ad/dd/10.jpg" width="470" border="0" ></a>
              <div style="clear:both"></div>
            </ul>
            <div style="clear:both"></div>
        </div>
        <!--探路者-->
<div class="hd_catlist">
        	<div class="hd_title">
            	<div class="fleft">探路者</div>
              <div class="fright"><a href="#">还剩10天12小时23分46秒</a></div>
            </div>
            <ul>
              <a href="http://www.shopin.net/promotion/3181.html" target="_blank"><img src="http://images.shopin.net/images/ad/dd/11.jpg" border="0" ></a>
              <div style="clear:both"></div>
            </ul>
            <div style="clear:both"></div>
        </div>
        <!--吉诺-->
<div class="hd_catlist">
        	<div class="hd_title">
            	<div class="fleft">吉诺里兹</div>
              <div class="fright"><a href="#">还剩10天12小时23分46秒</a></div>
            </div>
            <ul>
              <a href="http://www.shopin.net/promotion/3980.html" target="_blank"><img src="http://images.shopin.net/images/ad/dd/12.jpg" width="470" border="0" ></a>
              <div style="clear:both"></div>
            </ul>
            <div style="clear:both"></div>
        </div>
        <!--策乐-->
<div class="hd_catlist">
        	<div class="hd_title">
            	<div class="fleft">CELE</div>
              <div class="fright"><a href="#">还剩10天12小时23分46秒</a></div>
            </div>
            <ul>
              <a href="http://www.shopin.net/promotion/3654.html" target="_blank"><img src="http://images.shopin.net/images/ad/dd/13.jpg" border="0" ></a>
              <div style="clear:both"></div>
            </ul>
            <div style="clear:both"></div>
        </div>
<div style="clear:both"></div>
<div><img src="http://images.shopin.net/images/ad/dd/14.jpg" width="939" height="103" /></div>

  </div>

	<div><img src="http://images.shopin.net/images/ad/dd/15.jpg" width="950" height="47" id="shownav4" /></div>
<div class="fsdanpinlist">
    	<ul>

      <c:forEach var="product" items="${finalSale1}" varStatus="status">
        	<li>
            	<a href="${ctx}/product/${product.sid}.html"><img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}" width="130" height="130"/></a>
                    <h1>【商品名称】${product.productName}</h1>
                    <p><span>￥${product.proPrice.originalPrice}</span> <b>￥${product.proPrice.promotionPrice}</b></p>                   
                 <div align="center">
                    <a href="${ctx}/product/${product.sid}.html"><img src="http://images.shopin.net/images/ad/cd/cd_30.jpg" width="91" height="26" /></a>
                </div>
            </li>
			</c:forEach>
			 <c:forEach var="product" items="${finalSale2}" varStatus="status">
        	<li>
            	<a href="${ctx}/product/${product.sid}.html"><img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}" width="130" height="130"/></a>
                    <h1>【商品名称】${product.productName}</h1>
                    <p><span>￥${product.proPrice.originalPrice}</span> <b>￥${product.proPrice.promotionPrice}</b></p>                   
                 <div align="center">
                    <a href="${ctx}/product/${product.sid}.html"><img src="http://images.shopin.net/images/ad/cd/cd_30.jpg" width="91" height="26" /></a>
                </div>
            </li>
            </c:forEach>
			 <c:forEach var="product" items="${finalSale3}" varStatus="status">
        	<li>
            	<a href="${ctx}/product/${product.sid}.html"><img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}" width="130" height="130"/></a>
                    <h1>【商品名称】${product.productName}</h1>
                    <p><span>￥${product.proPrice.originalPrice}</span> <b>￥${product.proPrice.promotionPrice}</b></p>                   
                 <div align="center">
                    <a href="${ctx}/product/${product.sid}.html"><img src="http://images.shopin.net/images/ad/cd/cd_30.jpg" width="91" height="26" /></a>
                </div>
            </li>
            </c:forEach>

			 <c:forEach var="product" items="${finalSale4}" varStatus="status">
        	 <li>
                <a href="${ctx}/product/${product.sid}.html"><img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}" width="130" height="130"/></a>
                    <h1>【商品名称】${product.productName}</h1>
                    <p><span>￥${product.proPrice.originalPrice}</span> <b>￥${product.proPrice.promotionPrice}</b></p>                   
                 <div align="center">
                    <a href="${ctx}/product/${product.sid}.html"><img src="http://images.shopin.net/images/ad/cd/cd_30.jpg" width="91" height="26" /></a>
                </div>
            </li>
            </c:forEach> 


            <div style="clear:both"></div>
        </ul>
        <div style="clear:both"></div>
    </div>
    <div style="margin-top:10px; overflow:hidden;"><img src="http://images.shopin.net/images/ad/dd/17.jpg" border="0" usemap="#Map" width:950px; height:775px; />
<map name="Map" id="Map"><area shape="rect" coords="100,489,329,542" href="#" /><area shape="rect" coords="120,46,343,85" href="http://www.shopin.net/notice/1212.html" target="_blank" />
</map>
  </div>
</div>

<div class="showcover"></div>
<div class="showdiag">
	
    <div class="showdiaginfo">
    	<div class="diagclose">X</div>
        <div><label>姓名：</label> <input type="text" name="userName" id="userName" class="textcss"/></div>
        <div><label>手机号码：</label> <input type="text" name="handPhone" id="handPhone" class="textcss"/></div>
        <div><label>注册邮箱：</label> <input type="text" name="email" id="email" class="textcss"/></div>
        <div><label>订单号：</label> <input type="text" name="address" id="address" class="textcss"/></div>
        <div align="center"><input type="submit" class="submitbtn" value=""/></div>
</div>
</div>



</body>
</html>

