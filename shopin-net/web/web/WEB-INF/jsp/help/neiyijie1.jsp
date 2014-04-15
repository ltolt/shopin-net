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
<div class="m38body" style="width:950px;margin:0 auto">
		<div class="topimg"> <a href=" " target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/top1.jpg" /><img src="http://images.shopin.net/images/ad/neiyijie/top2.jpg" /></a> </div>
		<!--topimg-->
		<div class="logo-list"> <img src="http://images.shopin.net/images/ad/neiyijie/logo.jpg" /> </div>
		<!--logo-list-->
		<div class="new-img-h2"> <img src="http://images.shopin.net/images/ad/neiyijie/h21.jpg" /> </div>
		<!--new-img-h2-->
		<div class="new-img-mr">
				<div class="zt-fcous">
						<div class="out-box">
								<ul>
										<li style="display:block;"><a href="http://www.shopin.net/help/sangfulann.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/f0.jpg" /></a></li>
                                        <li><a href="http://www.shopin.net/promotion/5069.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/f1.jpg" /></a></li>
										<li><a href="http://www.shopin.net/promotion/5644.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/f02.jpg" /></a></li>
										<li><a href="http://www.shopin.net/promotion/5050.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/f3.jpg" /></a></li>
										<li><a href="http://www.shopin.net/promotion/5059.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/f4.jpg" /></a></li>
										<li><a href="http://www.shopin.net/promotion/6551.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/f5.jpg" /></a></li>
								</ul>
								<div class="focus-nav">
										<div class="num"> <a class="cur"><img src="http://images.shopin.net/images//brand/69_2.jpg" width="68" height="43" /><span>
												<h3>女人节 你最有礼</h3>
												<em>最低1.4折</em></span></a> <a><img src="http://images.shopin.net/images/brand/165_2.jpg" width="68" height="43" /><span>
                                                <h3>自信魅力 优雅绽放</h3>
												<em>文胸 底裤 5折起</em></span></a> <a><img src="http://images.shopin.net/images/brand/72_2.jpg" width="68" height="43" /><span>
												<h3>春色盎然 曼妙曲线</h3>
												<em>文胸 底裤 3-7折</em></span></a> <a><img src="http://images.shopin.net/images/brand/285_2.jpg" width="68" height="43" /><span>
												<h3>法式工艺 春款抢鲜</h3>
												<em>波点|蕾丝 3-7折</em></span></a> <a><img src="http://images.shopin.net/images/brand/752_2.jpg" width="68" height="43" /><span>
												<h3>傲人曲线 性感迷人</h3>
												<em>调整型内衣 2-5折</em></span></a> <a><img src="http://images.shopin.net/images/brand/2379_2.jpg" width="68" height="43" /><span>
												<h3>高雅精致 品味奢华</h3>
												<em>文胸底裤 百元蜂抢</em></span></a> </div>
										<div class="text"><a></a><a></a><a></a><a></a><a></a><a></a></div>
								</div>
						</div>
				</div>
		</div>
		<!--new-img-mr-->
		<div class="m38network"  >
				<div class="m38network-h2"> <img src="http://images.shopin.net/images/ad/neiyijie/h22.jpg" /> </div>
				<!--m38network-h2-->
				<div class="m38network-mr">
						<div class="m38network-div"> <a href="http://www.shopin.net/product/1349116.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/1-1WD031.jpg" /></a><a href="http://www.shopin.net/product/1110925.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/1-1BX054.jpg" /></a>
								<p><a href="">ELLE春之印花3/4杯聚拢文胸</a></p>
								<P><span>原价：￥338</span> <span>现价：￥68</span></P>
						</div>
						<div class="m38network-div"> <a href="http://www.shopin.net/product/2211736.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/2-AW218.jpg" /></a><a href="http://www.shopin.net/product/2211801.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/2-CW1181.jpg" /></a>
								<p><a href="">桑扶兰聚拢上托高侧比深V性感透气文胸</a></p>
								<P><span>原价：￥208</span> <span>现价：￥89</span></P>
						</div>
						<div class="m38network-div"> <a href="http://www.shopin.net/product/2156517.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/3-AW123.jpg" /></a><a href="http://www.shopin.net/product/2211813.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/3-CW123.jpg" /></a>
								<p><a href="">桑扶兰春季新款大红豹纹文胸</a></p>
								<P><span>原价：￥298</span> <span>现价：￥99</span></P>
						</div>
						<div class="m38network-div mr-r-0"> <a href="http://www.shopin.net/product/2211697.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/4-AW112.jpg" /></a><a href="http://www.shopin.net/product/2211783.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/4-CW1121.jpg" /></a>
								<p><a href="">桑扶兰薄款奢华蕾丝深V侧收上托文胸</a></p>
								<P><span>原价：￥268</span> <span>现价：￥129</span></P>
						</div>
						<div class="m38network-div"> <a href="http://www.shopin.net/product/2211752.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/5-AW321.jpg" /></a><a href="http://www.shopin.net/product/2211823.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/5-CW321.jpg" /></a>
								<p><a href="">桑扶兰3/4杯性感豹纹蕾丝文胸</a></p>
								<P><span>原价：￥278</span> <span>现价：￥89</span></P>
						</div>
						<div class="m38network-div"> <a href="http://www.shopin.net/product/184828.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/6-0705A.jpg" /></a><a href="http://www.shopin.net/product/184819.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/6-0705B.jpg" /></a>
								<p><a href="">MAND.YAMAN红色精致刺绣侧收聚拢文胸</a></p>
								<P><span>原价：￥389</span> <span>现价：￥38</span></P>
						</div>
						<div class="m38network-div"> <a href="http://www.shopin.net/product/185829.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/7-0703A.jpg" /></a><a href="http://www.shopin.net/product/184809.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/7-0703B.jpg" /></a>
								<p><a href="">MAND.YAMAN春季3/4杯花朵刺绣文胸</a></p>
								<P><span>原价：￥389</span> <span>现价：￥38</span></P>
						</div>
						<div class="m38network-div mr-r-0"> <a href="http://www.shopin.net/product/185369.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/8-0702A.jpg" /></a><a href="http://www.shopin.net/product/185389.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/8-0703A.jpg" /></a>
								<p><a href="">MAND.YAMAN 3/4杯精致刺绣聚拢文胸</a></p>
								<P><span>原价：￥389</span> <span>现价：￥38</span></P>
						</div>
				</div>
				<!--m38network-mr--> 
		</div>
        <div style="clear:both"></div>
		<!--m38network-->
		<div class="m38newshow">
				<div class="m38newshow-h2"><img src="http://images.shopin.net/images/ad/neiyijie/h23.jpg" /></div>
				<div class="m38newshow-top">
						<div class="m38newshow-top-l"> <a href="http://www.shopin.net/promotion/6916.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/top01.jpg" /></a> </div>
						<!--m38newshow-top-l-->
						<div class="m38newshow-top-r">
								<div class="m38newshow-top-r-t">
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/5703.html" target="_blank"><img src="http://images.shopin.net/images//brand/1671_2.jpg" /></a>
												<p>小西服 衬衫<strong>3-5折</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/5873.html" target="_blank"><img src="http://images.shopin.net/images/brand/107_2.jpg" /></a>
												<p>唐装外套 旗袍<strong>3折起</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr mr-r-0"> <a href="http://www.shopin.net/promotion/5329.html" target="_blank"><img src="http://images.shopin.net/images//brand/289_2.jpg" /></a>
												<p>小西服 裙装<strong>新款5折</strong></p>
										</div>
										<!--m38newshow-top-r-mr--> 
										
								</div>
								<!--m38newshow-top-r-t-->
								<div class="m38newshow-top-r-t mr-b-0">
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/6459.html" target="_blank"><img src="http://images.shopin.net/images/brand/112_2.jpg" /></a>
												<p>风衣 针织衫<strong>￥99起</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/6036.html" target="_blank"><img src="http://images.shopin.net/images/brand/59_2.jpg" /></a>
												<p>小外套 连衣裙<strong>新款4折</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr mr-r-0"> <a href="http://www.shopin.net/promotion/5965.html" target="_blank"><img src="http://images.shopin.net/images/brand/1818_2.jpg" /></a>
												<p>外套 衬衫<strong>2-5折</strong></p>
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
						<li><a target="_blank" href="http://www.shopin.net/product/2018333.html "><img src="http://images.shopin.net/images/61/2012/09/17/Pic2018333_48684_0.resize_to.220x220.jpg "><p>veilond时尚拼接一粒扣小西服</p></a><P class="divp"><span class="m38newshow-lis-r">370</span><span>原价￥1058</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/2194176.html "><img src="http://images.shopin.net/images/60/2013/01/29/Pic2194176_3416_0.resize_to.220x220.jpg "><p>HOPE SHOW经典驼色个性拉链风衣</p></a><P class="divp"><span class="m38newshow-lis-r">387</span><span>原价￥969</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1378731.html"><img src="http://images.shopin.net/images/68/2012/04/13/Pic1378731_1275_0.resize_to.220x220.jpg"><p>秋水伊人雪纺碎花连衣裙</p></a><P class="divp"><span class="m38newshow-lis-r">211</span><span>原价￥556</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1536340.html "><img src="http://images.shopin.net/images/63/2012/07/20/Pic1536340_76813_0.resize_to.220x220.jpg "><p>无色无味纯棉彩条针织衫</p></a><P class="divp"><span class="m38newshow-lis-r">240</span><span>原价￥468</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1825659.html "><img src="http://images.shopin.net/images/68/2013/02/26/Pic1825659_177266_0.resize_to.220x220.jpg"><p>Painoly气质碎花蝴蝶结衬衫</p></a><P class="divp"><span class="m38newshow-lis-r">430</span><span>原价￥860</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1752879.html "><img src="http://images.shopin.net/images/68/2012/04/17/Pic1752879_174664_0.resize_to.220x220.jpg "><p>B.SIQI西瓜红精致镶钻小西服</p></a><P class="divp"><span class="m38newshow-lis-r">447</span><span>原价￥1490</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1325854.html"><img src="http://images.shopin.net/images/68/2012/04/12/Pic1325854_81053_0.resize_to.220x220.jpg"><p>圣三利气质印花蝴蝶结连衣裙</p></a><P class="divp"><span class="m38newshow-lis-r">285</span><span>原价￥1780</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/2163341.html "><img src="http://images.shopin.net/images/68/2012/12/25/Pic2163341_77350_0.resize_to.220x220.jpg "><p>木真了桑蚕丝民族风刺绣外套</p></a><P class="divp"><span class="m38newshow-lis-r">319</span><span>原价￥798</span></P></li>
					</ul>
				</div>
				<!--m38newshow-down--> 
                
				<div class="m38newshow-top">
						<div class="m38newshow-top-l"> <a href="http://www.shopin.net/promotion/4234.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/top02.jpg" /></a> </div>
						<!--m38newshow-top-l-->
						<div class="m38newshow-top-r">
								<div class="m38newshow-top-r-t">
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/4720.html" target="_blank"><img src="http://images.shopin.net/images/brand/249_2.jpg" /></a>
												<p>春款单鞋<strong>3-5折</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/6833.html" target="_blank"><img src="http://images.shopin.net/images/brand/247_2.jpg" /></a>
												<p>初春女鞋<strong>新款6折</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr mr-r-0"> <a href="http://www.shopin.net/promotion/6832.html" target="_blank"><img src="http://images.shopin.net/images/brand/969_2.jpg" /></a>
												<p>大牌气场<strong>单鞋￥135↑</strong></p>
										</div>
										<!--m38newshow-top-r-mr--> 
										
								</div>
								<!--m38newshow-top-r-t-->
								<div class="m38newshow-top-r-t mr-b-0">
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/4208.html" target="_blank"><img src="http://images.shopin.net/images/brand/237_2.jpg" /></a>
												<p>深口鞋 浅口鞋<strong>半价购</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/6547.html" target="_blank"><img src="http://images.shopin.net/images/brand/319_2.jpg" /></a>
												<p>单鞋丨凉鞋<strong>￥89起</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr mr-r-0"> <a href="http://www.shopin.net/promotion/6843.html" target="_blank"><img src="http://images.shopin.net/images/brand/2135_2.jpg" /></a>
												<p>俏皮女鞋<strong>￥109↑</strong></p>
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
<li><a target="_blank" href="http://www.shopin.net/product/2192470.html"><img src="http://images.shopin.net/images/68/2013/02/07/Pic2192470_201446_0.resize_to.220x220.jpg"><p>芬妮丝牛皮尖头单鞋</p></a><P class="divp"><span class="m38newshow-lis-r">198</span><span>原价￥980</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/2122898.html "><img src="http://images.shopin.net/images/68/2012/11/19/Pic2122898_15375_0.resize_to.220x220.jpg "><p>莱尔斯丹反羊绒坡跟鞋</p></a><P class="divp"><span class="m38newshow-lis-r">319</span><span>原价￥1198</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1376057.html "><img src="http://images.shopin.net/images/58/2011/08/24/Pic1376057_8590_0.resize_to.220x220.jpg "><p>卡曼尼细跟羊皮单鞋</p></a><P class="divp"><span class="m38newshow-lis-r">158</span><span>原价￥790</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/2201726.html "><img src="http://images.shopin.net/images/63/2013/02/07/Pic2201726_186182_0.resize_to.220x220.jpg "><p>Josiny时尚亮片单鞋</p></a><P class="divp"><span class="m38newshow-lis-r">159</span><span>原价￥399</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/2109636.html"><img src="http://images.shopin.net/images/60/2012/10/29/Pic2109636_13349_0.resize_to.220x220.jpg "><p>天美意坡跟浅口单鞋</p></a><P class="divp"><span class="m38newshow-lis-r">199</span><span>原价￥739</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1470496.html"><img src="http://images.shopin.net/images/61/2012/08/14/Pic1470496_47038_0.resize_to.220x220.jpg"><p>康莉蛇纹时尚公主鞋</p></a><P class="divp"><span class="m38newshow-lis-r">180</span><span>原价￥599</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/2011077.html "><img src="http://images.shopin.net/images/58/2012/08/30/Pic2011077_47017_0.resize_to.220x220.jpg "><p>康莉优雅裸色浅口鞋</p></a><P class="divp"><span class="m38newshow-lis-r">120</span><span>原价￥699</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/2061902.html "><img src="http://images.shopin.net/images/60/2012/10/02/Pic2061902_13291_0.resize_to.220x220.jpg "><p>TATA水台底浅口鞋</p></a><P class="divp"><span class="m38newshow-lis-r">239</span><span>原价￥769</span></P></li>
					</ul>
				</div>
				<!--m38newshow-down-->
                <div class="m38newshow-top">
						<div class="m38newshow-top-l"> <a href="http://www.shopin.net/promotion/2228.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/top03.jpg" /></a> </div>
						<!--m38newshow-top-l-->
						<div class="m38newshow-top-r">
								<div class="m38newshow-top-r-t">
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/6066.html" target="_blank"><img src="http://images.shopin.net/images/brand/472_2.jpg" /></a>
												<p>实用大包<strong>2-4折</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/6243.html" target="_blank"><img src="http://images.shopin.net/images//brand/486_2.jpg" /></a>
												<p>时尚休闲包<strong>3-5折</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr mr-r-0"> <a href="http://www.shopin.net/promotion/5691.html" target="_blank"><img src="http://images.shopin.net/images//brand/788_2.jpg" /></a>
												<p>卡通手提包<strong>3折起</strong></p>
										</div>
										<!--m38newshow-top-r-mr--> 
										
								</div>
								<!--m38newshow-top-r-t-->
								<div class="m38newshow-top-r-t mr-b-0">
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/6290.html" target="_blank"><img src="http://images.shopin.net/images//brand/475_2.jpg" /></a>
												<p>彩色链条包<strong>新品半价</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr"> <a href="http://www.shopin.net/promotion/4421.html" target="_blank"><img src="http://images.shopin.net/images/brand/203_2.jpg" /></a>
												<p>手袋新品<strong>￥170↑</strong></p>
										</div>
										<!--m38newshow-top-r-mr-->
										<div class="m38newshow-top-r-mr mr-r-0"> <a href="http://www.shopin.net/promotion/6071.html" target="_blank"><img src="http://images.shopin.net/images/brand/785_2.jpg" /></a>
												<p>韩版钱包<strong>全场￥59起</strong></p>
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
<li><a target="_blank" href="http://www.shopin.net/product/2113491.html "><img src="http://images.shopin.net/images/61/2012/11/12/Pic2113491_33241_0.resize_to.220x220.jpg "><p>PUCCA手提の斜挎格纹两用包</p></a><P class="divp"><span class="m38newshow-lis-r">149</span><span>原价￥299</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/2142937.html "><img src="http://images.shopin.net/images/63/2013/01/18/Pic2142937_18470_0.resize_to.220x220.jpg "><p>LAFITE时尚靓丽真皮包</p></a><P class="divp"><span class="m38newshow-lis-r">179</span><span>原价￥899</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1284973.html "><img src="http://images.shopin.net/images/58/2011/06/29/Pic1284973_19687_0.resize_to.220x220.jpg "><p>F8派巧克力色休闲包</p></a><P class="divp"><span class="m38newshow-lis-r">222</span><span>原价￥438</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1564015.html "><img src="http://images.shopin.net/images/66/2011/12/14/Pic1564015_15708_0.resize_to.220x220.jpg "><p>GOLF蝴蝶结单肩牛皮包</p></a><P class="divp"><span class="m38newshow-lis-r">339</span><span>原价￥1556</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1664004.html"><img src="http://images.shopin.net/images/58/2012/03/01/Pic1664004_18270_0.resize_to.220x220.jpg"><p>KSTYLE新款蛇纹手提包</p></a><P class="divp"><span class="m38newshow-lis-r">249</span><span>原价￥498</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1224600.html "><img src="http://images.shopin.net/images/58/2011/07/18/Pic1224600_124219_0.resize_to.220x220.jpg "><p>丹奴比奥米白色镂空拼色包</p></a><P class="divp"><span class="m38newshow-lis-r">254</span><span>原价￥565</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1945325.html "><img src="http://images.shopin.net/images/58/2012/07/18/Pic1945325_30848_0.resize_to.220x220.jpg "><p>艾狄米娜手提の斜挎两用大包</p></a><P class="divp"><span class="m38newshow-lis-r">434</span><span>原价￥1086</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/2190830.html "><img src="http://images.shopin.net/images/61/2013/01/24/Pic2190830_33193_0.resize_to.220x220.jpg "><p>OLIVE OYL黑白圆点手提包</p></a><P class="divp"><span class="m38newshow-lis-r">202</span><span>原价￥288</span></P></li>
					</ul>
				</div>
				<!--m38newshow-down--> 
				<div class="m38newshow-top">
						<div class="m38newshow-top-l"> <a href="http://www.shopin.net/promotion/4344.html" target="_blank"><img src="http://images.shopin.net/images/ad/neiyijie/top04.jpg" /></a> </div>
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
<li><a target="_blank" href="http://www.shopin.net/product/2009848.html "><img src="http://images.shopin.net/images/63/2012/10/22/Pic2009848_197479_0.resize_to.220x220.jpg "><p>特莱玟100%桑蚕印花丝巾</p></a><P class="divp"><span class="m38newshow-lis-r">195</span><span>原价￥699</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/2149841.html "><img src="http://images.shopin.net/images/61/2012/12/04/Pic2149841_179631_0.resize_to.220x220.jpg "><p>黑田100%桑蚕丝巾繁花似锦款</p></a><P class="divp"><span class="m38newshow-lis-r">198</span><span>原价￥588</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1643735.html "><img src="http://images.shopin.net/images/61/2012/05/23/Pic1643735_55835_0.resize_to.220x220.jpg "><p>黑田时尚优雅太阳镜</p></a><P class="divp"><span class="m38newshow-lis-r">128</span><span>原价￥338</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1316860.html "><img src="http://images.shopin.net/images/60/2012/06/28/Pic1316860_33683_0.resize_to.220x220.jpg "><p>OYEA渐变色大框遮阳镜</p></a><P class="divp"><span class="m38newshow-lis-r">283</span><span>原价￥498</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1549504.html "><img src="http://images.shopin.net/images/66/2011/12/06/Pic1549504_19416_0.resize_to.220x220.jpg "><p>POLO女款真皮腰带</p></a><P class="divp"><span class="m38newshow-lis-r">50</span><span>原价￥198</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1286513.html "><img src="http://images.shopin.net/images/66/2011/07/04/Pic1286513_15686_0.resize_to.220x220.jpg "><p>GOLF滑扣弄自动腰带</p></a><P class="divp"><span class="m38newshow-lis-r">85</span><span>原价￥178</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1016925.html "><img src="http://images.shopin.net/images/61/2011/03/03/Pic1016925_78039_0.resize_to.220x220.jpg "><p>ARCTICFOX春款时尚盆帽</p></a><P class="divp"><span class="m38newshow-lis-r">38</span><span>原价￥128</span></P></li>
<li><a target="_blank" href="http://www.shopin.net/product/1705057.html "><img src="http://images.shopin.net/images/61/2012/05/25/Pic1705057_47576_0.resize_to.220x220.jpg "><p>PONY帅气棒球帽</p></a><P class="divp"><span class="m38newshow-lis-r">44</span><span>原价￥99</span></P></li>
					</ul>
				</div>
				<!--m38newshow-down--> 
		</div>
		<!--m38newshow--> 
</div>
<!--m38body-->

</body>
</html>
