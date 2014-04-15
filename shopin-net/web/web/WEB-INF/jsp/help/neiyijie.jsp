<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta charset="utf-8">
<title>上品内衣节,春“芯”荡漾,内衣盛宴3-7折,古今,欧迪芬,ELLE,红袖,秋水伊人,Tata,莱尔斯丹,红蜻蜓,内衣,女装,女鞋,配饰,皮具,春季新品,6折抢鲜购</title>
<link type="text/css" rel="stylesheet" href="css.css">
<style>
img { vertical-align:top }
/*fcous*/
.zt-fcous {
 width:950px;
 height:513px;
 margin-top:10px;
 overflow:hidden;
 position:relative
}
.out-box {
 width:950px;
 height:513px;
 display:table;
}
.focus-nav {
 display:table-cell;
 vertical-align:middle;
 position:relative;
*position:absolute;
 right:0;
*top:50%;
 z-index:5;
 pointer-events:none;
}
.focus-nav .num, .focus-nav .text {
 width:215px;
 float:right;
 position:relative;
*position:relative;
*top:-50%;
 right:0;
}
.num {
 z-index:7;
 pointer-events:auto
}
.num a {
 width:200px;
 height:43px;
 display:block;
 padding:10px 5px 10px 10px;
 margin:2px 0;
 cursor:pointer;
 text-decoration:none;
 zoom:1;
 overflow:hidden
}
.num a.cur {
 background:#fe4504;
 color:#fff;
}
.num a img {
 float:left;
 margin-right:6px;
}
.num a h3 {
 line-height:22px;
 height:22px;
 overflow:hidden
}
.num a em {
 color:#ea5221;
 font-size:14px;
 font-weight:600;
 font-family:'microsoft yahei', 'arial', 'simsun'
}
.num a.cur em { color:#fff }
.text { z-index:6 }
.text a {
 width:215px;
 height:63px;
 display:block;
 text-align:center;
 margin:2px 0;
 cursor:pointer;
 background:#fff;
 filter:Alpha(opacity=70);
 -moz-opacity:.7;
 opacity:.7;
}
.focus-nav .text { margin-right:-215px }
.zt-fcous ul {
 width:950px;
 height:513px;
 position:absolute;
 z-index:1;
}
.zt-fcous ul li {
 width:950px;
 height:513px;
 display:none;
}
body {
 margin: 0;
 padding: 0;
 color: #000000;
 font-size: 12px;
 font-family: arial, 宋体;
}
h1, h2, h3, h4, ul, ol, li, p {
 margin: 0;
 padding: 0;
 list-style: none;
}
img { border: 0; }
a:link, a:visited {
 color: #000;
 text-decoration: none;
}
a:hover, a:active {
 color: #ff0000;
 text-decoration: underline;
 text-shadow: 0 0 1px #757575;
}
.m38network, .m38newshow {
 display:inline-block;
 width:934px;
 border:1px solid #E95376;
 margin:10px 7px;
}
.m38network-mr {
 padding:10px 0 10px 10px;
 width:924px;
 display:inline-block
}
.m38network-div {
 float:left;
 margin:0 9px 0 0; 
 text-align: center;
 line-height:24px;
 width:222px;
 overflow:hidden
}
.m38network-div a { display:inline-block }
.m38network-div img {
 border:1px solid #E0E0E0;
 height:220px;
 width:220px;
}
.m38newshow-top {
 background:#E95376;
 margin:4px;
 width:926px;
 overflow:hidden;
 display:inline-block;
 padding:10px 0
}
.m38newshow-top-l {
 width:374px;
 float:left;
 margin:0px 17px 0px 11px;
 height:255px;
 display:inline
}
.m38newshow-top-l-img {
 width:374px;
 height:255px
}
.m38newshow-top-r {
 width:514px;
 float:left;
 display:inline;
}
.m38newshow-top-r-t {
 display:inline-block;
 width: 514px;
 margin:0 0 20px 0
}
.m38newshow-top-r-mr {
 width:128px;
 float:left;
 text-align:center;
 margin:0 60px 0 0
}
.m38newshow-top-r-mr p {
 line-height: 24px;
 color:#FFFFFF
}
.m38newshow-top-r-mr strong {
 color:#FCFF00;
 margin:0 5px
}
.m38newshow-down {
 width:auto;
 margin:4px;
 overflow:hidden;
 padding:0 0 10px 0
}
.m38newshow-down a p {
 height:20px;
 overflow:hidden;
 color:#fff;
  }
.divp {
 display:inline-block;
 text-align:left;
 width:200px;
 padding:0 10px;
 line-height:30px;
}
.m38newshow-lis-r {
 float:right;
 background: url(http://images.shopin.net/images/ad/neiyijie/back.jpg) left top no-repeat;
 width:50px;
 height:32px;
 padding:0 0 0 38px;
 color:#FDFC01;
 font-size:28px;
 line-height:28px;
 text-align:right
}
.prolist { overflow:hidden}
.prolist ul { margin-left:-2px; zoom:1}
.prolist ul li { width:220px;
 border:4px solid #E95376;
 background:#E95376;
 text-align:center;
 line-height:20px;
 color:#FFF;
 font-family:"微软雅黑";
 font-size:14px;
 float:left;
 margin:0 4px 0 0
}



.m38newshow-list .mr-r-0 { margin-right:0 }
.mr-r-0 { margin-right:0 }
.mr-b-0 { margin-bottom:0 }
</style>
<script src="http://images.shopin.net/js/jquery.lazyload.mini.js"></script>
<script>
$(function(){
 $(".box img").lazyload({ 
	placeholder : "http://images.shopin.net/images/loading_58_58.gif",
	threshold : 200,
	effect : "fadeIn"
 }); 
});
</script>
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
<!--[if lte IE 6]>
<script type="text/javascript" src="http://images.shopin.net/images/ad/summer1/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript"> 
DD_belatedPNG.fix('.png');
</script> 
<![endif]-->
</head>

<body>
<div class="m38body" style="width:950px; margin:0 auto">
		<div class="topimg"><img src="http://images.shopin.net/images/ad/neiyijie/top_01.jpg" /><img src="http://images.shopin.net/images/ad/neiyijie/top_02.jpg" /></div>
		<!--topimg-->
		<div class="logo-list"> <img src="http://images.shopin.net/images/ad/neiyijie/logo_01.jpg" /> </div>
		<!--logo-list-->
		<div class="new-img-h2"> <img src="http://images.shopin.net/images/ad/neiyijie/h21.jpg" /> </div>
		<!--new-img-h2-->
		<div class="new-img-mr">
				<div class="zt-fcous">
						<div class="out-box">
								<ul>
										<li style="display:block;"><a href="http://www.shopin.net/promotion/6755.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/f1-1.jpg" /></a></li>
                                        <li><a href="http://www.shopin.net/promotion/5223.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/f2-01.jpg" /></a></li>
										<li><a href="http://www.shopin.net/promotion/6046.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/f3-01.jpg" /></a></li>
										<li><a href="http://www.shopin.net/promotion/5789.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/f4-1.jpg" /></a></li>
										<li><a href="http://www.shopin.net/promotion/4941.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/f5-01.jpg" /></a></li>
										<li><a href="http://www.shopin.net/promotion/4457.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/f6-01.jpg" /></a></li>
								</ul>
								<div class="focus-nav">
										<div class="num"> <a class="cur"><img src="http://images.shopin.net/images//brand/831_2.jpg" width="68" height="43" /><span>
												<h3>安莉芳旗下品牌</h3>
												<em>文胸￥80起</em></span></a> <a><img src="http://images.shopin.net/images/brand/74_2.jpg" width="68" height="43" /><span>
                                                <h3>香港名牌 体会关爱</h3>
												<em>蕾丝｜刺绣 3-5折</em></span></a> <a><img src="http://images.shopin.net/images/brand/2111_2.jpg" width="68" height="43" /><span>
												<h3>萌系内衣 甜美性感</h3>
												<em>文胸内裤 百元精选</em></span></a> <a><img src="http://images.shopin.net/images/brand/166_2.jpg" width="68" height="43" /><span>
												<h3>完美修身 一穿就变</h3>
												<em>塑身系列 3折起</em></span></a> <a><img src="http://images.shopin.net/images/brand/856_2.jpg" width="68" height="43" /><span>
												<h3>浪漫女人季春款发布</h3>
												<em>文胸 底裤 3-5折</em></span></a> <a><img src="http://images.shopin.net/images/brand/1344_2.jpg" width="68" height="43" /><span>
												<h3>永恒美丽 瑰丽耀眼</h3>
												<em>文胸 底裤 2-6折</em></span></a> </div>
										<div class="text"><a></a><a></a><a></a><a></a><a></a><a></a></div>
								</div>
						</div>
				</div>
		</div>
        <div class="ad"><a href="http://www.shopin.net/help/sangfulann.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/ad-sangfulan.jpg" /></a></div>
		<!--new-img-mr-->
		<div class="m38network"  >
				<div class="m38network-h2"> <img src="http://images.shopin.net/images/ad/neiyijie/h22.jpg" /> </div>
				<!--m38network-h2-->
				<div class="m38network-mr">
						<div class="m38network-div"> <a href="http://www.shopin.net/product/1349116.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/1-1WD031.jpg" /></a><a href="http://www.shopin.net/product/1110925.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/1-1BX054.jpg" /></a><p><a href="http://www.shopin.net/product/1349116.html" target="_blank">ELLE春之印花3/4杯聚拢文胸</a></p><P><span>原价：￥338</span> <span>现价：￥68</span></P>
						</div>
						<div class="m38network-div"> <a href="http://www.shopin.net/product/1946368.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/3-1.jpg" /></a><a href="http://www.shopin.net/product/2211775.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/3-2.jpg" /></a>
								<p><a href="http://www.shopin.net/product/1946368.html" target="_blank">桑扶兰新款蕾丝调整型中厚款</a></p>
								<P><span>原价：￥198</span> <span>现价：￥99</span></P>
						</div>
						<div class="m38network-div"> <a href="http://www.shopin.net/product/184759.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/5-1.jpg" /></a><a href="http://www.shopin.net/product/184745.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/5-2.jpg" /></a>
								<p><a href="http://www.shopin.net/product/184759.html" target="_blank">MAND.YAMAN蓝色精致刺绣网状蕾丝文胸</a></p>
								<P><span>原价：￥389</span> <span>现价：￥34</span></P>
						</div>
						<div class="m38network-div"> <a href="http://www.shopin.net/product/2198678.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/6-1.jpg" /></a><a href="http://www.shopin.net/product/2196715.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/6-2.jpg" /></a>
								<p><a href="http://www.shopin.net/product/2198678.html" target="_blank">popling甜美桃心印花文胸</a></p>
								<P><span>原价：￥148</span> <span>现价：￥30</span></P>
						</div>
						<div class="m38network-div"> <a href="http://www.shopin.net/product/2154927.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/1-1.jpg" /></a><a href="http://www.shopin.net/product/2154957.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/1-2.jpg" /></a>
								<p><a href="http://www.shopin.net/product/2154927.html" target="_blank">仙子宜岱炫彩3/4按摩立体模杯集中型文胸</a></p>
								<P><span>原价：￥298</span> <span>现价：￥59</span></P>
						</div>
						<div class="m38network-div"> <a href="http://www.shopin.net/product/2154914.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/2-1.jpg" /></a><a href="http://www.shopin.net/product/2154898.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/2-2.jpg" /></a>
								<p><a href="http://www.shopin.net/product/2154914.html" target="_blank">仙子宜岱优雅3/4杯两片式按摩立体文胸</a></p>
								<P><span>原价：￥308</span> <span>现价：￥69</span></P>
						</div>
						<div class="m38network-div"> <a href="http://www.shopin.net/product/1671567.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/7-1.jpg" /></a><a href="http://www.shopin.net/product/1671601.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/7-02.jpg" /></a>
								<p><a href="http://www.shopin.net/product/1671567.html" target="_blank">KASERLING蕾丝印花甜美文胸</a></p>
								<P><span>原价：￥298</span> <span>现价：￥59</span></P>
						</div>
						<div class="m38network-div"> <a href="http://www.shopin.net/product/1915686.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/8-01.jpg" /></a><a href="http://www.shopin.net/product/2211787.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/8-02.jpg" /></a>
								<p><a href="http://www.shopin.net/product/1915686.html" target="_blank">桑扶兰新品聚拢花边厚垫文胸</a></p>
								<P><span>原价：￥198</span> <span>现价：￥99</span></P>
						</div>
				</div>
				<!--m38network-mr--> 
		</div>
        <div style="clear:both"></div>
		<!--m38network-->
		<div class="m38newshow">
				<div class="m38newshow-h2"><img src="http://images.shopin.net/images/ad/neiyijie/h23.jpg" /></div>
				<div class="m38newshow-top">
						<div class="m38newshow-top-l"> <a href="http://www.shopin.net/promotion/6936.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/top1-1.jpg" /></a> </div>
						<!--m38newshow-top-l-->
						<div class="m38newshow-top-r">
								<div class="m38newshow-top-r-t">
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/5714.html" target="_blank"><img src="http://images.shopin.net/images/brand/1472_2.jpg" /></a>
												<p>职场系列春装<strong>3折抢</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/5262.html" target="_blank"><img src="http://images.shopin.net/images/brand/1297_2.jpg" /></a>
												<p>纯棉线衫 外套<strong>3-6折</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr mr-r-0"> <a href="http://www.shopin.net/promotion/6684.html" target="_blank"><img src="http://images.shopin.net/images//brand/2415_2.jpg" /></a>
												<p>针织衫 连衣裙<strong>2折起</strong></p>
										</div>
										<!--m38newshow-top-r-mr--> 
										
								</div>
								<!--m38newshow-top-r-t-->
								<div class="m38newshow-top-r-t mr-b-0">
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/5388.html" target="_blank"><img src="http://images.shopin.net/images/brand/52_2.jpg" /></a>
												<p>小西服 连衣裙<strong>3-5折</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/5142.html" target="_blank"><img src="http://images.shopin.net/images/brand/1000_2.jpg" /></a>
												<p>夹克 连衣裙<strong>3-5折</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr mr-r-0"> <a href="http://www.shopin.net/promotion/4533.html" target="_blank"><img src="http://images.shopin.net/images/brand/111_2.jpg" /></a>
												<p>帽衫 仔裤<strong>新款半价</strong></p>
										</div>
										<!--m38newshow-top-r-mr--> 
								</div>
								<!--m38newshow-top-r-t--> 
						</div>
						<!--m38newshow-top-r--> 
						
				</div>
				<!--m38newshow-top-->
				<div class="m38newshow-down prolist">
					<ul>
						<li><a target="_blank" href="http://www.shopin.net/product/2185405.html "><img src="http://images.shopin.net/images/58/2013/01/17/Pic2185405_35689_0.resize_to.220x220.jpg "><p>三COLOUR春季气质淑女荷叶边外套</p></a><P class="divp"><span class="m38newshow-lis-r">350</span><span>原价￥779</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/2163722.html "><img src="http://images.shopin.net/images/60/2012/12/31/Pic2163722_1304_0.resize_to.220x220.jpg "><p>秋水伊人复古雪纺印花连衣裙</p></a><P class="divp"><span class="m38newshow-lis-r">246</span><span>原价￥648</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1804227.html "><img src="http://images.shopin.net/images/68/2012/05/08/Pic1804227_123130_0.resize_to.220x220.jpg "><p>huayin甜美波点蝴蝶结雪纺衫</p></a><P class="divp"><span class="m38newshow-lis-r">228</span><span>原价￥980</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/2169471.html "><img src="http://images.shopin.net/images/58/2012/12/31/Pic2169471_110467_0.resize_to.220x220.jpg "><p>JUST MODE彼得潘领珍珠点缀毛衫</p></a><P class="divp"><span class="m38newshow-lis-r">237</span><span>原价￥679</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/2025348.html "><img src="http://images.shopin.net/images/68/2012/09/17/Pic2025348_3416_0.resize_to.220x220.jpg "><p>HOPE SHOW百搭双排扣收腰风衣</p></a><P class="divp"><span class="m38newshow-lis-r">239</span><span>原价￥799</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1636932.html "><img src="http://images.shopin.net/images/68/2012/04/13/Pic1636932_48668_0.resize_to.220x220.jpg "><p>veilond春季新款斗篷宫廷风衬衫</p></a><P class="divp"><span class="m38newshow-lis-r">275</span><span>原价￥788</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/2055724.html "><img src="http://images.shopin.net/images/68/2013/01/25/Pic2055724_203081_0.resize_to.220x220.jpg "><p>nazely100%羊毛纯色百搭开衫</p></a><P class="divp"><span class="m38newshow-lis-r">356</span><span>原价￥1780</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1720709.html "><img src="http://images.shopin.net/images/61/2012/09/04/Pic1720709_63463_0.resize_to.220x220.jpg "><p>阿尤舒适纯棉牛仔长裤</p></a><P class="divp"><span class="m38newshow-lis-r">180</span><span>原价￥569</span></P></li>
					</ul>
				</div>
				<!--m38newshow-down--> 
                
				<div class="m38newshow-top">
						<div class="m38newshow-top-l"> <a href="http://www.shopin.net/promotion/6954.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/top2-1.jpg" /></a> </div>
						<!--m38newshow-top-l-->
						<div class="m38newshow-top-r">
								<div class="m38newshow-top-r-t">
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/6827.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/logo-senda2.jpg" /></a>
												<p>浅口单鞋<strong>3-5折</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/6962.html" target="_blank"><img src="http://images.shopin.net/images/brand/285_2.jpg" /></a>
												<p>单鞋 凉鞋<strong>3-6折</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr mr-r-0"> <a href="http://www.shopin.net/promotion/6963.html" target="_blank"><img src="http://images.shopin.net/images/brand/545_2.jpg" /></a>
												<p>公主|娃娃鞋<strong>新款6折</strong></p>
										</div>
										<!--m38newshow-top-r-mr--> 
										
								</div>
								<!--m38newshow-top-r-t-->
								<div class="m38newshow-top-r-t mr-b-0">
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/6151.html" target="_blank"><img src="http://images.shopin.net/images/brand/185_2.jpg" /></a>
												<p>浅口单鞋<strong>3折起</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/4667.html" target="_blank"><img src="http://images.shopin.net/images/brand/230_2.jpg" /></a>
												<p>美鞋大集合 单鞋<strong>半价</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr mr-r-0"> <a href="http://www.shopin.net/promotion/5604.html" target="_blank"><img src="http://images.shopin.net/images/brand/242_2.jpg" /></a>
												<p>舒适 健康 单鞋<strong>3-6折</strong></p>
										</div>
										<!--m38newshow-top-r-mr--> 
								</div>
								<!--m38newshow-top-r-t--> 
						</div>
						<!--m38newshow-top-r--> 
						
				</div>
				<!--m38newshow-top-->
				<div class="m38newshow-down prolist">
					<ul>
<li><a target="_blank" href="http://www.shopin.net/product/1103252.html "><img src="http://images.shopin.net/images/61/2011/09/27/Pic1103252_113835_0.resize_to.220x220.jpg "><p>捷希优雅浅口单鞋</p></a><P class="divp"><span class="m38newshow-lis-r">199</span><span>原价￥828</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1810747.html "><img src="http://images.shopin.net/images/68/2012/05/21/Pic1810747_97522_0.resize_to.220x220.jpg "><p>卡美多咖色小牛皮浅口鞋</p></a><P class="divp"><span class="m38newshow-lis-r">199</span><span>原价￥798</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1814692.html "><img src="http://images.shopin.net/images/63/2012/06/18/Pic1814692_182257_0.resize_to.220x220.jpg "><p>Josiny优雅杏色浅口鞋</p></a><P class="divp"><span class="m38newshow-lis-r">93</span><span>原价￥469</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1760612.html "><img src="http://images.shopin.net/images/66/2013/01/30/Pic1760612_9067_0.resize_to.220x220.jpg "><p>卡曼尼牛皮蛇纹浅口鞋</p></a><P class="divp"><span class="m38newshow-lis-r">128</span><span>原价￥720</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1833049.html "><img src="http://images.shopin.net/images/61/2012/08/27/Pic1833049_197037_0.resize_to.220x220.jpg "><p>BELLE深蓝羊皮鱼嘴鞋</p></a><P class="divp"><span class="m38newshow-lis-r">369</span><span>原价￥738</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1914743.html "><img src="http://images.shopin.net/images/66/2012/07/06/Pic1914743_15375_0.resize_to.220x220.jpg "><p>莱尔斯丹时尚鱼嘴鞋</p></a><P class="divp"><span class="m38newshow-lis-r">299</span><span>原价￥858</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1808630.html "><img src="http://images.shopin.net/images/60/2012/05/17/Pic1808630_119930_0.resize_to.220x220.jpg "><p>百思图靓丽桔色鱼嘴鞋</p></a><P class="divp"><span class="m38newshow-lis-r">238</span><span>原价￥859</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1453135.html "><img src="http://images.shopin.net/images/58/2013/02/28/Pic1453135_123927_0.resize_to.220x220.jpg "><p>MISS SIXTY金色羊皮高跟鱼嘴鞋</p></a><P class="divp"><span class="m38newshow-lis-r">249</span><span>原价￥1799</span></P></li>
					</ul>
				</div>
				<!--m38newshow-down-->
                <div class="m38newshow-top">
						<div class="m38newshow-top-l"> <a href="http://www.shopin.net/promotion/6783.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/top3-1.jpg" /></a> </div>
						<!--m38newshow-top-l-->
						<div class="m38newshow-top-r">
								<div class="m38newshow-top-r-t">
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/6168.html" target="_blank"><img src="http://images.shopin.net/images/brand/1183_2.jpg" /></a>
												<p>优雅气质大小包<strong>3-5折</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/4053.html" target="_blank"><img src="http://images.shopin.net/images//brand/470_2.jpg" /></a>
												<p>绚丽手袋<strong>￥129起</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr mr-r-0"> <a href="http://www.shopin.net/promotion/6069.html" target="_blank"><img src="http://images.shopin.net/images//brand/2249_2.jpg" /></a>
												<p>真皮包<strong>￥198起</strong></p>
										</div>
										<!--m38newshow-top-r-mr--> 
										
								</div>
								<!--m38newshow-top-r-t-->
								<div class="m38newshow-top-r-t mr-b-0">
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/6816.html" target="_blank"><img src="http://images.shopin.net/images//brand/443_2.jpg" /></a>
												<p>单肩|手提包<strong>新品5折</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/3608.html" target="_blank"><img src="http://images.shopin.net/images/brand/1348_2.jpg" /></a>
												<p>简约风尚包<strong>立省千元</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr mr-r-0"> <a href="http://www.shopin.net/promotion/6952.html" target="_blank"><img src="http://images.shopin.net/images/brand/1227_2.jpg" /></a>
												<p>春款休闲包 钱包<strong>4折</strong></p>
										</div>
										<!--m38newshow-top-r-mr--> 
								</div>
								<!--m38newshow-top-r-t--> 
						</div>
						<!--m38newshow-top-r--> 
						
				</div>
				<!--m38newshow-top-->
				<div class="m38newshow-down prolist">
					<ul>
<li><a target="_blank" href="http://www.shopin.net/product/2144338.html "><img src="http://images.shopin.net/images/61/2012/12/06/Pic2144338_99821_0.resize_to.220x220.jpg "><p>PUCCA炫色手提斜挎两用包</p></a><P class="divp"><span class="m38newshow-lis-r">144</span><span>原价￥289</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1816468.html "><img src="http://images.shopin.net/images/60/2012/05/21/Pic1816468_94701_0.resize_to.220x220.jpg "><p> 丹奴比奥时尚菱格链条包</p></a><P class="divp"><span class="m38newshow-lis-r">299</span><span>原价￥915</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/2045740.html "><img src="http://images.shopin.net/images/60/2012/09/29/Pic2045740_97300_0.resize_to.220x220.jpg "><p>仙美时OL通勤手提包</p></a><P class="divp"><span class="m38newshow-lis-r">349</span><span>原价￥1468</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/2180837.html "><img src="http://images.shopin.net/images/58/2013/01/17/Pic2180837_31976_0.resize_to.220x220.jpg "><p>艾狄米娜大容量手提包</p></a><P class="divp"><span class="m38newshow-lis-r">454</span><span>原价￥1136</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/2188537.html "><img src="http://images.shopin.net/images/61/2013/01/25/Pic2188537_18470_0.resize_to.220x220.jpg "><p>LAFITE炫丽复古真皮包</p></a><P class="divp"><span class="m38newshow-lis-r">419</span><span>原价￥1049</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1525990.html "><img src="http://images.shopin.net/images/58/2011/11/16/Pic1525990_19687_0.resize_to.220x220.jpg "><p>F8派菱格链条单肩包</p></a><P class="divp"><span class="m38newshow-lis-r">237</span><span>原价￥498</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/2175299.html "><img src="http://images.shopin.net/images/60/2013/01/08/Pic2175299_15721_0.resize_to.220x220.jpg "><p>GOLF名媛气质真皮美包</p></a><P class="divp"><span class="m38newshow-lis-r">499</span><span>原价￥1438</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1680436.html "><img src="http://images.shopin.net/images/58/2012/03/07/Pic1680436_18242_0.resize_to.220x220.jpg "><p>KSTYLE拼色链条休闲包</p></a><P class="divp"><span class="m38newshow-lis-r">259</span><span>原价￥518</span></P></li>
					</ul>
				</div>
				<!--m38newshow-down--> 
				<div class="m38newshow-top">
						<div class="m38newshow-top-l"> <a href="http://www.shopin.net/promotion/4344.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/top4-1.jpg" /></a> </div>
						<!--m38newshow-top-l-->
						<div class="m38newshow-top-r">
								<div class="m38newshow-top-r-t">
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/6137.html" target="_blank"><img src="http://images.shopin.net/images//brand/1095_2.jpg" /></a>
												<p>丝巾 时尚帽<strong>￥35起</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/4947.html" target="_blank"><img src="http://images.shopin.net/images//brand/822_2.jpg" /></a>
												<p>名品太阳镜<strong>新品3折</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr mr-r-0"> <a href="http://www.shopin.net/promotion/6928.html" target="_blank"><img src="http://images.shopin.net/images//brand/586_2.jpg" /></a>
												<p>名品真皮腰带<strong>￥49抢</strong></p>
										</div>
										<!--m38newshow-top-r-mr--> 
										
								</div>
								<!--m38newshow-top-r-t-->
								<div class="m38newshow-top-r-t mr-b-0">
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/6926.html" target="_blank"><img src="http://images.shopin.net/images//brand/833_2.jpg" /></a>
												<p>领带<strong>全场￥50起</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/6927.html" target="_blank"><img src="http://images.shopin.net/images//brand/816_2.jpg" /></a>
												<p>百搭帽<strong>秒杀价￥10起</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
								</div>
								<!--m38newshow-top-r-t--> 
						</div>
						<!--m38newshow-top-r--> 
						
				</div>
				<!--m38newshow-top-->
				<div class="m38newshow-down prolist">
					<ul>
<li><a target="_blank" href="http://www.shopin.net/product/1559869.html "><img src="http://images.shopin.net/images/61/2011/12/12/Pic1559869_70436_0.resize_to.220x220.jpg "><p>黑田蝴蝶结装饰盆帽</p></a><P class="divp"><span class="m38newshow-lis-r">91</span><span>原价￥388</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1665966.html "><img src="http://images.shopin.net/images/61/2012/06/11/Pic1665966_124420_0.resize_to.220x220.jpg "><p>ARCTICFOX时尚撞色大沿帽</p></a><P class="divp"><span class="m38newshow-lis-r">112</span><span>原价￥188</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1985734.html "><img src="http://images.shopin.net/images/61/2012/08/21/Pic1985734_59672_0.resize_to.220x220.jpg "><p>黑田100%桑蚕丝炫彩丝巾</p></a><P class="divp"><span class="m38newshow-lis-r">195</span><span>原价￥488</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/2009847.html "><img src="http://images.shopin.net/images/63/2012/10/22/Pic2009847_197478_0.resize_to.220x220.jpg "><p>特莱玟100%桑蚕丝OL方巾</p></a><P class="divp"><span class="m38newshow-lis-r">195</span><span>原价￥699</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1827841.html "><img src="http://images.shopin.net/images/61/2012/12/06/Pic1827841_55822_0.resize_to.220x220.jpg "><p>黑田大粗框蛤蟆型遮阳镜</p></a><P class="divp"><span class="m38newshow-lis-r">128</span><span>原价￥488</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1830837.html "><img src="http://images.shopin.net/images/61/2013/01/07/Pic1830837_82961_0.resize_to.220x220.jpg "><p>Actionfox拼色粗框眼镜</p></a><P class="divp"><span class="m38newshow-lis-r">49</span><span>原价￥498</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1954956.html "><img src="http://images.shopin.net/images/58/2012/10/15/Pic1954956_17205_0.resize_to.220x220.jpg "><p>康尼心形针扣型牛皮腰带</p></a><P class="divp"><span class="m38newshow-lis-r">118</span><span>原价￥238</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/2205781.html "><img src="http://images.shopin.net/images/63/2013/02/08/Pic2205781_85966_0.resize_to.220x220.jpg "><p>梦特娇红运滑扣腰带</p></a><P class="divp"><span class="m38newshow-lis-r">106</span><span>原价￥178</span></P></li>
					</ul>
				</div>
				<!--m38newshow-down--> 
		</div>
		<!--m38newshow--> 
</div>
<!--m38body-->

</body>
</html>
