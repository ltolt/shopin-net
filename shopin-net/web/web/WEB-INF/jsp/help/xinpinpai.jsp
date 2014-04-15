<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>上品折扣大牌登陆,新品牌进驻,2012新品牌首度登陆榜单,vans,卡特,暇布士,都彭,E-WORLD,全场2折起,每周五更新</title>
<link href="http://images.shopin.net/images/ad/xinpinpai/xinpinpai.css" rel="stylesheet" type="text/css">
<script type="text/javascript"> 
$(function(){
	var sw = 0;
	$(".out-box .num a").mouseover(function(){
		sw = $(".num a").index(this);
		myShow(sw);
	});
	function myShow(i){
		$(".out-box .num a").eq(i).addClass("cur").siblings("a").removeClass("cur");
		$(".out-box ul li").eq(i).stop(true,true).fadeIn(500).siblings("li").fadeOut(500);
	}
	//滑入停止动画，滑出开始动画
	$(".out-box").hover(function(){
		if(myTime){
		   clearInterval(myTime);
		}
	},function(){
		myTime = setInterval(function(){
		  myShow(sw)
		  sw++;
		  if(sw==6){sw=0;}
		} , 3000);
	});
	//自动开始
	var myTime = setInterval(function(){
	   myShow(sw)
	   sw++;
	   if(sw==6){sw=0;}
	} , 3000);
	$(".brand-list li").hover(function(){
		$(this).addClass("hover");
		},function(){
			$(this).removeClass("hover").end();
			})
})
</script>
</head>

<body>
<div class="wrap mt mb">
  <div class="miantitle">
    <h1><img src="http://images.shopin.net/images/ad/xinpinpai/maintitle.gif" alt="2012新品牌首度登陆榜单"></h1>
  </div>
  <div class="subtitle week">本周新品牌｜每周二更新</div>
  <div class="zt-fcous">
    <div class="out-box">
      <ul>
<li style="display:block;"><a href="http://www.shopin.net/lady/brand/list-2557-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/130423/f1.jpg" /></a></li>			
<li><a href="http://www.shopin.net/list-2031-1067------0-1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/130423/f3.jpg" /></a></li>		
<li><a href="http://www.shopin.net/list-2142-1596------0-1-/1.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/130423/f4.jpg" /></a></li>		
<li><a href="http://www.shopin.net/children/brands/2578.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/130423/f5.jpg" /></a></li>		
<li><a href="http://www.shopin.net/list-2580-1068------0-1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/130423/f6.jpg" /></a></li>		
      </ul>
      <div class="focus-nav">
        <div class="num">
<a class="cur"><img src="http://images.shopin.net/images/brand/2557_2.jpg" width="68" height="43" /><span><h3>优雅婉约 气质演绎</h3><em>连衣裙 短T 2-4折</em></span></a>
<a><img src="http://images.shopin.net/images//brand/2031_2.jpg" width="68" height="43" /><span><h3>时尚奢华 美鞋发布</h3><em>￥120-￥299</em></span></a>
<a><img src="http://images.shopin.net/images//brand/2142_2.jpg" width="68" height="43" /><span><h3>休闲时尚板鞋</h3><em>全场5-7.5折</em></span></a>
<a><img src="http://images.shopin.net/images/brand/2578_2.jpg" width="68" height="43" /><span><h3>缤纷夏品 清凉时尚</h3><em>短T 短裤 3-6折</em></span></a>
<a><img src="http://images.shopin.net/images//brand/2580_2.jpg" width="68" height="43" /><span><h3>欧式奢华 性感诱惑</h3><em>性感文胸 ￥79起</em></span></a>
        </div>
        <div class="text"><a></a><a></a><a></a><a></a><a></a></div>
      </div>
    </div>
  </div>
  <div class="subtitle month mt">本月新品牌｜每周二更新</div>
  <div class="brand-list">
    <ul>
<li>
<a href="http://www.shopin.net/list-363-1067------0-1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/130423/B1.jpg" /></a>
<div class="titlebar"></div>
<div class="titlebox">
<span class="brand-logo"><img src="http://images.shopin.net/images//brand/363_2.jpg" width="68" height="43" ></span><span class="brand-sale">￥99起</span><span class="brand-text">女鞋</span></div>
</li>
<li>
<a href="http://www.shopin.net/list-323-1540------0-1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/130423/B2.jpg" /></a>
<div class="titlebar"></div>
<div class="titlebox"><span class="brand-logo"><img src="http://images.shopin.net/images//brand/323_2.jpg" width="68" height="43" ></span><span class="brand-sale">3折起</span><span class="brand-text">男鞋</span></div>
</li>
<li>
<a href="http://www.shopin.net/lady/brand/list-2537-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/130423/B3.jpg" /></a>
<div class="titlebar"></div>
<div class="titlebox"><span class="brand-logo"><img src="http://images.shopin.net/images/brand/2537_2.jpg" width="68" height="43" ></span><span class="brand-sale">2-5折</span><span class="brand-text">女装</span></div>
</li>
<li>
<a href="http://www.shopin.net/lady/brands/2526.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/130423/B4.jpg" /></a>
<div class="titlebar"></div>
<div class="titlebox"><span class="brand-logo"><img src="http://images.shopin.net/images/brand/2526_2.jpg" width="68" height="43" ></span><span class="brand-sale">3折蜂抢</span><span class="brand-text">女装</span></div>
</li>
<li>
<a href="http://www.shopin.net/list-806-1069------0-1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/130423/B5.jpg" /></a>
<div class="titlebar"></div>
<div class="titlebox"><span class="brand-logo"><img src="http://images.shopin.net/images//brand/806_2.jpg" width="68" height="43" ></span><span class="brand-sale">4.5折</span><span class="brand-text">配饰</span></div>
</li>
<li>
<a href="http://www.shopin.net/handbags/brands/2509.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/130423/B6.jpg" /></a>
<div class="titlebar"></div>
<div class="titlebox"><span class="brand-logo"><img src="http://images.shopin.net/images/brand/2509_2.jpg" width="68" height="43" ></span><span class="brand-sale">新品半价</span><span class="brand-text">箱包</span></div>
</li>
    </ul>
  </div>
  <div class="cl"></div>
</div>
</body>
</html>