<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>双12提前开启,121212,不2价,波司登,雅鹿,雪莲,NIKE,TATA,秋水伊人全场冬品4折封,2件组织销售更实惠,一口价商品￥58起,会员签到有礼,C2B独家定制价,打破价格底线,2012.11.27-12.12</title>
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
		});
});
</script>
<!--[if lte IE 6]>
<script src="http://images.shopin.net/images/ad/summer1/DD_belatedPNG_0.0.8a-min.js"></script>
<script> 
DD_belatedPNG.fix('.png,.cornermark');
</script> 
<![endif]-->
<style>
img { vertical-align: top; border: none }
.mt { margin-top: 10px }
.mb { margin-bottom:10px}
.clear:after { height: 0; clear: both; content: "."; visibility: hidden; display: block; }
.zm { zoom: 1 }
.box { margin: 10px 0; background: #901f68 }
/*fcous*/
.zt-fcous { width: 950px; height: 513px; overflow: hidden; position: relative; border-bottom: 6px solid #3e0034 }
.out-box { width: 950px; height: 513px; display: table; }
.focus-nav { display: table-cell; vertical-align: middle; position: relative; *position:absolute;
right: 0; *top:50%;
z-index: 5; pointer-events: none; }
.focus-nav .num, .focus-nav .text { width: 215px; float: right; position: relative; *position:relative; *top:-50%; right: 0; }
.num { z-index: 7; pointer-events: auto }
.num a { width: 200px; height: 43px; display: block; padding: 10px 5px 10px 10px; margin: 2px 0; cursor: pointer; text-decoration: none; zoom: 1; overflow: hidden }
.num a.cur { background: #fe4504; color: #fff; }
.num a img { float: left; margin-right: 6px; }
.num a h3 { line-height: 22px; height: 22px; overflow: hidden }
.num a em { color: #ea5221; font-size: 14px; font-weight: 600; font-family: 'microsoft yahei', 'arial', 'simsun' }
.num a.cur em { color: #fff }
.text { z-index: 6 }
.text a { width: 215px; height: 63px; display: block; text-align: center; margin: 2px 0; cursor: pointer; background: #fff; filter: Alpha(opacity=70); -moz-opacity: .7; opacity: .7; }
.focus-nav .text { margin-right: -215px }
.zt-fcous ul { width: 950px; height: 513px; position: absolute; z-index: 1; }
.zt-fcous ul li { width: 950px; height: 513px; display: none; }
/*box*/
.wrap { padding: 0 7px }
.hd { position:relative}
.hd a { position: absolute; right: 10px; top: 15px; color: #fff }
/*brnad list*/
.blist { margin: 20px 0 0 1px }
.blist li { float: left; _display: inline; width: 130px; margin-left: 5px; text-align: center; line-height: 28px; font-weight: bold }
.blist li a { color: #fff }
.blist li img { display: block; width: 128px; height: 88px }
/*全新style*/
/*product list*/
.prolist { overflow: hidden; zoom:1; +padding-bottom:10px; _padding-bottom:0}
.prolist li { float: left; _display: inline; width: 132px; margin: 0 0 10px 25px; position: relative }
.prolist li a:hover, .prolist li a:hover h3 { color: #f60 }
.prolist li a img { border: 1px solid #e2e2e2 }
.prolist li h3 { height: 20px; line-height: 20px; overflow: hidden; font-weight: normal; }
.prolist li h3 a { color:#5d004e}
.prolist li del { color: #676767 }
.prolist li em { margin-left: 10px; font-weight: bold; color: #fc3400 }
.prolist .proinfo { text-align:center}
.prolist .starprice { line-height: 20px; text-align: center; overflow: hidden; font-weight: bold; color: #f15930; }
.prolist .save { width: 110px; height: 20px; margin: 3px auto 0; text-align: center; font-weight: bold; background: #f25930; color: #fff601 }
.prolist .cornermark { position: absolute; right: 10px; top: 10px; width: 96px; height: 96px; overflow: hidden; font:normal 800 32px '方正大黑简体', '黑体','microsoft yahei',arial; text-align:center; color: #fff948; background: url(http://images.shopin.net/images/ad/shuang12/mark.png) }
.prolist .cornermark i { display:block; height:46px; overflow:hidden; font:normal 600 17px/68px 'microsoft yahei',simhei,arial}
.prolist .cornermark sup {font:normal 600 20px  '方正大黑简体', '黑体','microsoft yahei',arial;;}
/*style list*/
.pblist ul { margin-left:-15px; zoom:1}
.pblist li { width: 300px; zoom: 1; margin-left:15px; border: 1px solid #42002b }
.pblist li a img { border: none; vertical-align: middle }
.pblist li h3 { height: 24px; line-height: 24px; margin:3px 0; font-size: 14px }
.pblist li h3 a {color: #fff}
.pblist li em { font-size:13px; text-decoration:line-through}
.pblist li h3, .pblist li del, .pblist li em { color: #fff }
.pblist .proinfo { padding:0 8px; text-align:left}
.pblist .btn-buy { float: right; margin: -3px 0 7px; zoom: 1; }
.pblist .btn-buy img { vertical-align:baseline;}
/*一口价*/
.bd { overflow:hidden; zoom:1; padding:0 6px; border:1px solid #ee4e15; background:#fff9da}
.bdiv { margin-left:-26px; overflow:hidden; zoom:1}
.proarea { width:447px; float:left; margin-left:26px; _display:inline; overflow:hidden; zoom:1}
.proarea .hd { height:24px; padding:0 5px; margin:10px 0; border-bottom:1px dashed #ee4e15}
.proarea .hd img { vertical-align:middle}
.proarea .hd a { top:5px; color:#ee4e15}
.proarea .prolist { _display:inline; margin-left:-25px;}
/*subnav*/
.summer_subnav { position:absolute; right:-11px; /*top:0px;*/ z-index:99; width:104px; height:348px; background:url(http://images.shopin.net/images/ad/shuang12/subnav.png) no-repeat; top:50%; margin-top:-165px; _margin-top:expression(document.documentElement.scrollTop+10)px; left:50%; margin-left:475px}
/*.subnav-close { float:right; width:16px; height:16px; margin:5px 5px 0 0; text-indent:-999em}*/
.summer_subnav ul { margin-top:54px}
.summer_subnav ul li { margin-bottom:2px; text-indent:-999em; overflow:hidden}
.summer_subnav ul li a { outline:none; display:block; line-height:26px; zoom:1}
.summer_subnav ul li.subnav_inner { padding:2px 0 5px}
.summer_subnav ul li.subnav_inner a { width:85px; line-height:22px; margin:0 auto}
.summer_subnav ul li.gotop { margin-top:7px}

</style>
</head>

<body>
	<div class="box">
		<img src="http://images.shopin.net/images/ad/shuang12/top-ad1.jpg" width="950" height="205" alt="双12提前开启 不2价 4折封顶 全民疯抢"><img src="http://images.shopin.net/images/ad/shuang12/top-ad2.jpg" width="950" height="205" alt="双12提前开启 不2价 4折封顶 全民疯抢"><img src="http://images.shopin.net/images/ad/shuang12/top-ad3.jpg" alt="双12提前开启 不2价 4折封顶 全民疯抢" width="950" height="205" usemap="#Map">
		<map name="Map">
				<area shape="rect" coords="443,1,620,126" href="#j">
				<area shape="rect" coords="630,9,746,104" href="#b">
				<area shape="rect" coords="300,13,421,117" href="#c">
				<area shape="rect" coords="182,39,295,104" href="#i">
		</map>
		<h2 class="mt"><a href="http://www.shopin.net/help/tuan12.html" target="_blank"><img src="http://images.shopin.net/images/ad/tuan12/tuanentr.jpg"></a></h2>
		<img id="a" src="http://images.shopin.net/images/ad/shuang12/t1.png" width="950" height="76" alt="大牌不2价 超值疯抢">
		<div class="zt-fcous">
			<div class="out-box">
				<ul>
					<li style="display:block;"><a href="sseyurong.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/f1.jpg" width="950" height="513"></a></li>
					<li><a href="sseyangrong.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/f2.jpg" width="950" height="513"></a></li>
					<li><a href="sseneiyi.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/f3.jpg" width="950" height="513"></a></li>
					<li><a href="ssexie.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/f4.jpg" width="950" height="513"></a></li>
					<li><a href="ssenvzhang.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/f5.jpg" width="950" height="513"></a></li>
					<li><a href="ssehuwai.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/f6.jpg" width="950" height="513"></a></li>
					<li><a href="ssenanzhang.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/f7.jpg" width="950" height="513"></a></li>
				</ul>
				<div class="focus-nav">
					<div class="num">
						<a class="cur"><img src="http://images.shopin.net/images/ad/shuang12/pl01.jpg" width="68" height="43"><span><h3>超值羽绒服惠聚专场</h3><em>4折封顶</em></span></a>
						<a><img src="http://images.shopin.net/images/ad/shuang12/pl02.jpg" width="68" height="43"><span><h3>100%高品质纯绒 更保暖 男女羊绒衫</h3><em>4折封顶</em></span></a>
						<a><img src="http://images.shopin.net/images/ad/shuang12/pl03.jpg" width="68" height="43"><span><h3>性感文胸&amp;保暖套装 劲爆回馈</h3><em>4折封顶</em></span></a>
						<a><img src="http://images.shopin.net/images/ad/shuang12/pl04.jpg" width="68" height="43"><span><h3>暖冬美靴 劲折不二价</h3><em>4折封顶</em></span></a>
						<a><img src="http://images.shopin.net/images/ad/shuang12/pl05.jpg" width="68" height="43"><span><h3>庆双12 潮流冬装劲折</h3><em>4折封顶</em></span></a>
						<a><img src="http://images.shopin.net/images/ad/shuang12/pl06.jpg" width="68" height="43"><span><h3>专业防风雪户外装</h3><em>4折封顶</em></span></a>
						<a><img src="http://images.shopin.net/images/ad/shuang12/pl07.jpg" width="68" height="43"><span><h3>超性价男装 实惠齐享</h3><em>4折封顶</em></span></a>
					</div>
					<div class="text"><a></a><a></a><a></a><a></a><a></a><a></a><a></a></div>
				</div>
			</div>
		</div>
		<img id="b" src="http://images.shopin.net/images/ad/shuang12/t2.png" width="950" height="76" alt="全新style 打包购物更超值">
		<div class="wrap">
			<h2 class="hd mb"><img src="http://images.shopin.net/images/ad/shuang12/st1.png" width="936" height="40" alt="保暖套装"><a href="http://www.shopin.net/promotion/6463.html" target="_blank">更多&gt;&gt;</a></h2>
			<div class="prolist pblist">
				<ul>
<li><a href="http://www.shopin.net/product/2139297.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/11/27/Pic2139297_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139297.html" target="_blank"></a>纤丝鸟女士粉色菱形格纹保暖套装2件打包组合</h3><a class="btn-buy" href="http://www.shopin.net/product/2139297.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥676</del><em>上品价:￥296</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>208</span></div></li>
<li><a href="http://www.shopin.net/product/2139288.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/11/27/Pic2139288_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139288.html" target="_blank"></a>暖倍儿圆领红色保暖套装2件打包组合</h3><a class="btn-buy" href="http://www.shopin.net/product/2139288.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥856</del><em>上品价:￥428</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>198</span></div></li>
<li><a href="http://www.shopin.net/product/2139287.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/11/27/Pic2139287_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139287.html" target="_blank">暖倍儿竹炭金丝绒套装2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139287.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥856</del><em>上品价:￥428</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>198</span></div></li>
<li><a href="http://www.shopin.net/product/2139238.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/11/27/Pic2139238_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139238.html" target="_blank"></a>纤丝鸟彩纹暖舒绒保暖套装2件打包组合</h3><a class="btn-buy" href="http://www.shopin.net/product/2139238.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥676</del><em>上品价:￥296</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>208</span></div></li>
<li><a href="http://www.shopin.net/product/2139291.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/11/27/Pic2139291_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139291.html" target="_blank">纤丝鸟蓝粉红菱形纹套装2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139291.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥676</del><em>上品价:￥296</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>208</span></div></li>
<li><a href="http://www.shopin.net/product/2139298.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/11/27/Pic2139298_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139298.html" target="_blank"></a>纤丝鸟紫红彩纹暖舒绒保暖套装2件打包组合</h3><a class="btn-buy" href="http://www.shopin.net/product/2139298.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥676</del><em>上品价:￥296</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>208</span></div></li>
<li><a href="http://www.shopin.net/product/2139310.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/11/27/Pic2139310_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139310.html" target="_blank"></a>纤丝鸟蓝色彩纹暖舒绒保暖套装2件打包组合</h3><a class="btn-buy" href="http://www.shopin.net/product/2139310.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥676</del><em>上品价:￥296</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>208</span></div></li>
<li><a href="http://www.shopin.net/product/2139194.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/11/26/Pic2139194_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139194.html" target="_blank">纤丝鸟男款灰色保暖套装2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139194.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥676</del><em>上品价:￥296</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>208</span></div></li>
<li><a href="http://www.shopin.net/product/2139198.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/26/Pic2139198_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139198.html" target="_blank"></a>纤丝鸟男士藏蓝优棉暖舒绒套装2件打包组合</h3><a class="btn-buy" href="http://www.shopin.net/product/2139198.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥596</del><em>上品价:￥198</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>158</span></div></li>

<li><a href="http://www.shopin.net/product/2139238.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/11/27/Pic2139238_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139238.html" target="_blank">纤丝鸟男款保暖内衣蓝色套装2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139238.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥676</del><em>上品价:￥296</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>208</span></div></li>
<li><a href="http://www.shopin.net/product/2139474.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/27/Pic2139474_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139474.html" target="_blank">丽织纺男款灰色保暖套装2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139474.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥876</del><em>上品价:￥256</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>194</span></div></li>
<li><a href="http://www.shopin.net/product/2139221.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/27/Pic2139221_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139221.html" target="_blank">纤丝鸟男士灰红色保暖套装2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139221.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥596</del><em>上品价:￥198</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>158</span></div></li>
				</ul>
			</div>
			<h2 class="hd mb"><img src="http://images.shopin.net/images/ad/shuang12/st2.png" width="936" height="40" alt="女裤"><a href="http://www.shopin.net/promotion/6464.html" target="_blank">更多&gt;&gt;</a></h2>
			<div class="prolist pblist">
				<ul>
<li><a href="http://www.shopin.net/product/2149609.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/12/03/Pic2149609_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2149609.html" target="_blank"></a>朗利来绿咖啡色女士休闲长裤2件打包组合</h3><a class="btn-buy" href="http://www.shopin.net/product/2149609.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥568</del><em>上品价:￥256</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>138</span></div></li>

<li><a href="http://www.shopin.net/product/2139349.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/27/Pic2139349_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139349.html" target="_blank">亨夫时尚黑色女士长裤2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139349.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥936</del><em>上品价:￥276</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>188</span></div></li>
<li><a href="http://www.shopin.net/product/2139525.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/27/Pic2139525_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139525.html" target="_blank"></a>蓝茜婷绿色女士修身长裤2件打包组合</h3><a class="btn-buy" href="http://www.shopin.net/product/2139525.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥1196</del><em>上品价:￥276</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>188</span></div></li>
<li><a href="http://www.shopin.net/product/2139338.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/26/Pic2139338_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139338.html" target="_blank"></a>三合众黑军绿女士修身长裤2件打包组合</h3><a class="btn-buy" href="http://www.shopin.net/product/2139338.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥1136</del><em>上品价:￥336</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>188</span></div></li>

<li><a href="http://www.shopin.net/product/2139341.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/26/Pic2139341_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139341.html" target="_blank">三和众军绿枣红女士修身长裤2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139341.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥1136</del><em>上品价:￥336</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>188</span></div></li>
<li><a href="http://www.shopin.net/product/2139531.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/26/Pic2139531_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139531.html" target="_blank"></a>朗利来黑色女士长裤2件打包组合</h3><a class="btn-buy" href="http://www.shopin.net/product/2139531.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥1196</del><em>上品价:￥330</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>138</span></div></li>

<li><a href="http://www.shopin.net/product/2139307.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/26/Pic2139307_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139307.html" target="_blank">亨夫女士蓝色牛仔裤2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139307.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥936</del><em>上品价:￥276</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>188</span></div></li>
<li><a href="http://www.shopin.net/product/2149599.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/12/03/Pic2149599_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2149599.html" target="_blank"></a>朗利来卡其色女士长裤2件打包组合</h3><a class="btn-buy" href="http://www.shopin.net/product/2149599.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥568</del><em>上品价:￥256</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>138</span></div></li>

<li><a href="http://www.shopin.net/product/2149608.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/12/03/Pic2149608_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2149608.html" target="_blank"></a>朗利来卡其咖啡色女士长裤2件打包组合</h3><a class="btn-buy" href="http://www.shopin.net/product/2149608.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥568</del><em>上品价:￥256</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>138</span></div></li>

<li><a href="http://www.shopin.net/product/2139351.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/26/Pic2139351_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139351.html" target="_blank">亨夫咖啡色女士长裤2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139351.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥936</del><em>上品价:￥276</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>188</span></div></li>
<li><a href="http://www.shopin.net/product/2139429.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/27/Pic2139429_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139429.html" target="_blank">亨夫黑咖啡色女士长裤2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139429.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥936</del><em>上品价:￥276</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>188</span></div></li>
<li><a href="http://www.shopin.net/product/2139534.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/27/Pic2139534_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139534.html" target="_blank">蓝茜婷女士花饰黑色长裤2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139534.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥1276</del><em>上品价:￥276</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>188</span></div></li>
				</ul>
			</div>
			<h2 class="hd mb"><img src="http://images.shopin.net/images/ad/shuang12/st3.png" width="936" height="40" alt="男士衬衫"><a href="http://www.shopin.net/promotion/6458.html" target="_blank">更多&gt;&gt;</a></h2>
			<div class="prolist pblist">
				<ul>
<li><a href="http://www.shopin.net/product/2139575.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/11/26/Pic2139575_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139575.html" target="_blank">Sagbatore男款100%纯棉长袖衬衫2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139575.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥960</del><em>上品价:￥478</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>298</span></div></li>
<li><a href="http://www.shopin.net/product/2139303.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/11/26/Pic2139303_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139303.html" target="_blank">ORMA男款100%纯棉长袖衬衫2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139303.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥796</del><em>上品价:￥390</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>298</span></div></li>
<li><a href="http://www.shopin.net/product/2139304.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/11/26/Pic2139304_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139304.html" target="_blank">ORMA男款100%纯棉长袖衬衫2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139304.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥960</del><em>上品价:￥470</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>299</span></div></li>
<li><a href="http://www.shopin.net/product/2139558.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/11/26/Pic2139558_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139558.html" target="_blank">ORMA男款100%纯棉长袖衬衫2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139558.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥796</del><em>上品价:￥390</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>298</span></div></li>
<li><a href="http://www.shopin.net/product/2139378.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/11/26/Pic2139378_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139378.html" target="_blank">ORMA男款100%纯棉长袖衬衫2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139378.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥796</del><em>上品价:￥390</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>298</span></div></li>
<li><a href="http://www.shopin.net/product/2139347.html	" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/27/Pic2139347_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139347.html	" target="_blank">绅士男士纯色长袖衬衫2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139347.html	" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥1090</del><em>上品价:￥436</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>299</span></div></li>
				</ul>
			</div>
			<h2 class="hd mb"><img src="http://images.shopin.net/images/ad/shuang12/st4.png" width="936" height="40" alt="打底裤"><a href="http://www.shopin.net/promotion/6465.html" target="_blank">更多&gt;&gt;</a></h2>
			<div class="prolist pblist">
				<ul>
<li><a href="http://www.shopin.net/product/2139538.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/26/Pic2139538_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139538.html" target="_blank">寓美黑色加厚打底裤2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139538.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥656</del><em>上品价:￥276</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>198</span></div></li>
<li><a href="http://www.shopin.net/product/2139566.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/11/26/Pic2139566_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139566.html" target="_blank">波司登条纹保暖打底裤2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139566.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥396</del><em>上品价:￥138</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>98</span></div></li>
<li><a href="http://www.shopin.net/product/2139249.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/11/27/Pic2139249_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139249.html" target="_blank">厚木黑色提花保暖裤2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139249.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥796</del><em>上品价:￥200</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>180</span></div></li>
<li><a href="http://www.shopin.net/product/2139526.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/26/Pic2139526_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139526.html" target="_blank">丽织纺黑色离子竹炭保暖裤2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139526.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥558</del><em>上品价:￥168</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>118</span></div></li>
<li><a href="http://www.shopin.net/product/2143539.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/11/27/Pic2143539_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2143539.html" target="_blank">北极绒黑灰拉绒九分裤2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2143539.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥336</del><em>上品价:￥70</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>56</span></div></li>
<li><a href="http://www.shopin.net/product/2143538.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/11/27/Pic2143538_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2143538.html" target="_blank">北极绒时尚拉绒保暖裤2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2143538.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥336</del><em>上品价:￥70</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>56</span></div></li>
<li><a href="http://www.shopin.net/product/2139571.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/11/26/Pic2139571_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139571.html" target="_blank">华姿伊牛仔双层保暖裤2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139571.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥736</del><em>上品价:￥408</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>286</span></div></li>
<li><a href="http://www.shopin.net/product/2139572.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/11/26/Pic2139572_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139572.html" target="_blank">华姿伊拉绒九分打底裤2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139572.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥596</del><em>上品价:￥416</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>292</span></div></li>
<li><a href="http://www.shopin.net/product/2139539.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/26/Pic2139539_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139539.html" target="_blank">丽织纺加厚竹炭保暖裤2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139539.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥396</del><em>上品价:￥150</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>106</span></div></li>
				</ul>
			</div>
			<h2 class="hd mb"><img src="http://images.shopin.net/images/ad/shuang12/st5.png" width="936" height="40" alt="内裤"><a href="http://www.shopin.net/promotion/6466.html" target="_blank">更多&gt;&gt;</a></h2>
			<div class="prolist pblist">
				<ul>
<li><a href="http://www.shopin.net/product/2139478.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/11/26/Pic2139478_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139478.html" target="_blank"></a>ELLE橘色蕾丝网面内裤2件打包组合橘</h3><a class="btn-buy" href="http://www.shopin.net/product/2139478.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥196</del><em>上品价:￥88</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>62</span></div></li>
<li><a href="http://www.shopin.net/product/2139500.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/11/26/Pic2139500_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139500.html" target="_blank">ELLE橘米蕾丝网面内裤2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139500.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥196</del><em>上品价:￥88</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>62</span></div></li>
<li><a href="http://www.shopin.net/product/2139535.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/27/Pic2139535_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139535.html" target="_blank">世王黑红女士内裤2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139535.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥120</del><em>上品价:￥60</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>42</span></div></li>
<li><a href="http://www.shopin.net/product/2139479.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/11/26/Pic2139479_212838_0.resize_to.3040x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139479.html" target="_blank"></a>ELLE米色蕾丝网面内裤2件打包组合橘</h3><a class="btn-buy" href="http://www.shopin.net/product/2139479.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥196</del><em>上品价:￥88</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>62</span></div></li>
<li><a href="http://www.shopin.net/product/2139555.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/11/28/Pic2139555_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139555.html" target="_blank">体会时尚红色刺绣内裤2件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139555.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥236</del><em>上品价:￥60</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>42</span></div></li>
<li><a href="http://www.shopin.net/product/2139560.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/11/26/Pic2139560_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139560.html" target="_blank"></a>皮尔卡丹蓝色格纹平角内裤2件打包组合</h3><a class="btn-buy" href="http://www.shopin.net/product/2139560.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥258</del><em>上品价:￥116</em><span class="cornermark"><i>2件打包价</i><sup>￥</sup>59</span></div></li>

				</ul>
			</div>
			<h2 class="hd mb"><img src="http://images.shopin.net/images/ad/shuang12/st6.png" width="936" height="40" alt="棉袜"><a href="http://www.shopin.net/promotion/6467.html" target="_blank">更多&gt;&gt;</a></h2>
			<div class="prolist pblist">
				<ul>
<li><a href="http://www.shopin.net/product/2139277.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/11/28/Pic2139277_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139277.html" target="_blank">富熙方格男棉袜3件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139277.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥126</del><em>上品价:￥63</em><span class="cornermark"><i>3件打包价</i><sup>￥</sup>45</span></div></li>

<li><a href="http://www.shopin.net/product/2139415.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/27/Pic2139415_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139415.html" target="_blank"></a>寓美100%纯棉绅士袜3件打包组合</h3><a class="btn-buy" href="http://www.shopin.net/product/2139415.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥174</del><em>上品价:￥84</em><span class="cornermark"><i>3件打包价</i><sup>￥</sup>57</span></div></li>

<li><a href="http://www.shopin.net/product/2139323.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/27/Pic2139323_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139323.html" target="_blank">寓美纯棉绅士袜3件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139323.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥174</del><em>上品价:￥84</em><span class="cornermark"><i>3件打包价</i><sup>￥</sup>57</span></div></li>
<li><a href="http://www.shopin.net/product/2139316.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/27/Pic2139316_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139316.html" target="_blank">寓美超细毛圈男士棉袜3件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139316.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥174</del><em>上品价:￥87</em><span class="cornermark"><i>3件打包价</i><sup>￥</sup>60</span></div></li>
<li><a href="http://www.shopin.net/product/2139364.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/11/27/Pic2139364_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139364.html" target="_blank">富熙宽罗口男棉袜3件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139364.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥78</del><em>上品价:￥39</em><span class="cornermark"><i>3件打包价</i><sup>￥</sup>27</span></div></li>
<li><a href="http://www.shopin.net/product/2139319.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/27/Pic2139319_212838_0.resize_to.300x300.jpg" width="300" height="300"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2139319.html" target="_blank">寓美黑灰超细毛圈男袜3件打包组合</a></h3><a class="btn-buy" href="http://www.shopin.net/product/2139319.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/btn-buy.png"></a><del>原价:￥174</del><em>上品价:￥87</em><span class="cornermark"><i>3件打包价</i><sup>￥</sup>60</span></div></li>
				</ul>
			</div>
		</div>
		<img id="c" src="http://images.shopin.net/images/ad/shuang12/t3.png" width="950" height="76" alt="超值爆款单品 一口价">
		<div class="wrap">
			<h2 id="d" class="hd mt"><img src="http://images.shopin.net/images/ad/shuang12/pt1.png" width="936" height="40" alt="￥58一口价专区"><a href="http://www.shopin.net/list-----55-58---.html" target="_blank">更多&gt;&gt;</a></h2>
			<div class="bd">
				<div class="bdiv">
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/ny.gif" width="45" height="18" alt="内衣"><a href="http://www.shopin.net/underwear/list-----50-58---.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/217022.html" target="_blank"><img src="http://images.shopin.net/images/58/2010/05/22/Pic217022_1136_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/217022.html" target="_blank">体会刺绣花边光面文胸</a></h3><del>￥278</del><em>￥58</em></div></li>
<li><a href="http://www.shopin.net/product/645175.html" target="_blank"><img src="http://images.shopin.net/images//60/2011/10/17//Pic645175_28930_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/645175.html" target="_blank">MAND.YAMAN男士舒适保暖内衣</a></h3><del>￥399</del><em>￥58</em></div></li>
<li><a href="http://www.shopin.net/product/2083152.html" target="_blank"><img src="http://images.shopin.net/images//60/2012/10/18//Pic2083152_148216_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2083152.html" target="_blank">plandoo彩丝竹炭秀腿裤</a></h3><del>￥198</del><em>￥58</em></div></li>
						</ul>
					</div>
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/tz.gif" width="45" height="18" alt="童装"><a href="http://www.shopin.net/list--1070---50-58--0--/1.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/458.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/10/23/Pic458_54973_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/458.html" target="_blank">昱璐圆领提花羊毛衫</a></h3><del>￥199</del><em>￥58</em></div></li>
<li><a href="http://www.shopin.net/product/1370556.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/08/23/Pic1370556_1627_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1370556.html" target="_blank">艾艾屋男童套头衫</a></h3><del>￥145</del><em>￥58</em></div></li>
<li><a href="http://www.shopin.net/product/1375594.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/08/24/Pic1375594_110256_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1375594.html" target="_blank">ABCKIDS男款纯棉T恤</a></h3><del>￥146</del><em>￥58</em></div></li>
						</ul>
					</div>
				</div>
			</div>
			<h2 id="e" class="hd mt"><img src="http://images.shopin.net/images/ad/shuang12/pt2.png" width="936" height="40" alt="￥88一口价专区"><a href="http://www.shopin.net/list-----87-88---.html" target="_blank">更多&gt;&gt;</a></h2>
			<div class="bd">
				<div class="bdiv">
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/yms.gif" width="63" height="18" alt="羊毛衫"><a href="http://www.shopin.net/list--1720---78-88.5---1-.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/2018624.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/05/Pic2018624_198257_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2018624.html" target="_blank">KELIYA细条纹男款羊毛衫</a></h3><del>￥758</del><em>￥88</em></div></li>
<li><a href="http://www.shopin.net/product/2040185.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/09/20/Pic2040185_200469_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2040185.html" target="_blank">埃迪瑪时尚盆领女衫</a></h3><del>￥268</del><em>￥88</em></div></li>
<li><a href="http://www.shopin.net/product/2058093.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/09/27/Pic2058093_200463_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2058093.html" target="_blank">埃迪瑪樽领女衫</a></h3><del>￥268</del><em>￥88</em></div></li>
						</ul>
					</div>
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/ny.gif" width="45" height="18" alt="内衣"><a href="http://www.shopin.net/underwear/list-----80-88---.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/184559.html" target="_blank"><img src="http://images.shopin.net/images//60/2010/11/10//Pic184559_28934_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/184559.html" target="_blank">MAND.YAMAN蕾丝网面聚拢文胸</a></h3><del>￥398</del><em>￥88</em></div></li>
<li><a href="http://www.shopin.net/product/1374012.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/06/08//Pic1374012_99463_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1374012.html" target="_blank">SWEAR蝴蝶结蕾丝可拆卸插垫文胸</a></h3><del>￥298</del><em>￥88</em></div></li>
<li><a href="http://www.shopin.net/product/1009666.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/11/23//Pic1009666_92750_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1009666.html" target="_blank">北极绒时尚提花蕾丝V领套装</a></h3><del>￥398</del><em>￥88</em></div></li>
						</ul>
					</div>
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/nvz.gif" width="46" height="18" alt="女装"><a href="http://www.shopin.net/lady/list-----80-88---/1.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/1666182.html" target="_blank"><img src="http://images.shopin.net/images//68/2012/07/27//Pic1666182_123088_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1666182.html" target="_blank">huayin时尚串珠短款夹克</a></h3><del>￥980</del><em>￥88</em></div></li>
<li><a href="http://www.shopin.net/product/2019578.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/11/12//Pic2019578_201042_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2019578.html" target="_blank">萨拉迪恩时尚印花长款衬衫</a></h3><del>￥580</del><em>￥88</em></div></li>
<li><a href="http://www.shopin.net/product/1938760.html" target="_blank"><img src="http://images.shopin.net/images//68/2012/07/21//Pic1938760_73249_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1938760.html" target="_blank">HOPE SHOW印花拼接拉链装饰连衣裙</a></h3><del>￥589</del><em>￥88</em></div></li>
						</ul>
					</div>
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/nz.gif" width="45" height="18" alt="男装"><a href="http://www.shopin.net/man/list-----1-88---.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/638447.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/01/11/Pic638447_15311_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/638447.html" target="_blank">蒙漫侬羊毛长裤</a></h3><del>￥620</del><em>￥88</em></div></li>
<li><a href="http://www.shopin.net/product/1630431.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/02/15/Pic1630431_18398_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1630431.html" target="_blank">奥古利奥100%纯棉衬衫</a></h3><del>￥980</del><em>￥88</em></div></li>
<li><a href="http://www.shopin.net/product/638426.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/04/11/Pic638426_15311_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/638426.html" target="_blank">蒙漫侬羊毛西裤</a></h3><del>￥650</del><em>￥88</em></div></li>
						</ul>
					</div>
				</div>
			</div>
			<h2 id="f" class="hd mt"><img src="http://images.shopin.net/images/ad/shuang12/pt3.png" width="936" height="40" alt="￥188一口价专区"><a href="http://www.shopin.net/list-----187-188---.html" target="_blank">更多&gt;&gt;</a></h2>
			<div class="bd">
				<div class="bdiv">
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/yrf.gif" width="63" height="18" alt="羽绒服"><a href="http://www.shopin.net/list--1740---0-188---1-.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/873463.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/08/02/Pic873463_94729_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/873463.html" target="_blank">MODO GAGA长款带帽羽绒服</a></h3><del>￥968</del><em>￥188</em></div></li>
<li><a href="http://www.shopin.net/product/1985425.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/08/24/Pic1985425_89320_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1985425.html" target="_blank">JUST MODE时尚蕾丝花边短款羽绒</a></h3><del>￥1099</del><em>￥188</em></div></li>
<li><a href="http://www.shopin.net/product/1335757.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/29/Pic1335757_152886_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1335757.html" target="_blank">花花公子豹纹貉子毛领连帽短羽绒</a></h3><del>￥632</del><em>￥188</em></div></li>
						</ul>
					</div>
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/yrsyms.gif" width="120"  height="18" alt="羊绒衫/羊毛衫"><a href="http://www.shopin.net/list--1720---89-188.5---1-/1.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/2051611.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/09/Pic2051611_146404_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2051611.html" target="_blank">蒙派性感V领羊绒衫</a></h3><del>￥1099</del><em>￥188</em></div></li>
<li><a href="http://www.shopin.net/product/2081479.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic2081479_201177_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2081479.html" target="_blank">洋宾燕精品羊毛女衫</a></h3><del>￥866</del><em>￥188</em></div></li>
<li><a href="http://www.shopin.net/product/1590206.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/01/05/Pic1590206_77531_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1590206.html" target="_blank">KELIYA镶钻超细羊毛衫</a></h3><del>￥798</del><em>￥188</em></div></li>
						</ul>
					</div>
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/nvz.gif" width="46" height="18" alt="女装"><a href="http://www.shopin.net/lady/list-----180-188---.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/1463550.html" target="_blank"><img src="http://images.shopin.net/images//61/2011/10/09//Pic1463550_4433_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1463550.html" target="_blank">法文箱子雪花波点连帽羽绒</a></h3><del>￥1080</del><em>￥188</em></div></li>
<li><a href="http://www.shopin.net/product/1384817.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/08/31/Pic1384817_119505_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1384817.html" target="_blank">ST.NORAH喇叭袖翻领羊毛大衣</a></h3><del>￥1380</del><em>￥188</em></div></li>
<li><a href="http://www.shopin.net/product/2040874.html" target="_blank"><img src="http://images.shopin.net/images//58/2012/09/24//Pic2040874_190400_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2040874.html" target="_blank">Buyinuosi彩条纹纯棉针织开衫</a></h3><del>￥639</del><em>￥188</em></div></li>
						</ul>
					</div>
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/xz.gif" width="45" height="18" alt="靴子"><a href="http://www.shopin.net/list--1824---180-188--0--.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/2093265.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/11/07/Pic2093265_8590_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2093265.html" target="_blank">卡曼尼坡跟短靴</a></h3><del>￥1080</del><em>￥188</em></div></li>
<li><a href="http://www.shopin.net/product/1486036.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/11/07/Pic1486036_15375_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1486036.html" target="_blank">莱尔斯丹时尚绑带女靴</a></h3><del>￥1698</del><em>￥188</em></div></li>
<li><a href="http://www.shopin.net/product/2145097.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/30/Pic2145097_182215_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2145097.html" target="_blank">Josiny舒适百搭短靴</a></h3><del>￥469</del><em>￥188</em></div></li>
						</ul>
					</div>
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/nz.gif" width="45" height="18" alt="男装"><a href="http://www.shopin.net/list--1047---1-188--1--.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/1333338.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/08/04/Pic1333338_91139_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1333338.html" target="_blank">吉诺里兹100%羊毛衫</a></h3><del>￥1380</del><em>￥188</em></div></li>
<li><a href="http://www.shopin.net/product/1049882.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/03/07/Pic1049882_30486_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1049882.html" target="_blank">欧罗仕达时尚羊毛马甲</a></h3><del>￥890</del><em>￥188</em></div></li>
<li><a href="http://www.shopin.net/product/2070124.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/03/Pic2070124_134811_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2070124.html" target="_blank">帕古茨圆领羊毛衫</a></h3><del>￥2360</del><em>￥188</em></div></li>
						</ul>
					</div>
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/ydx.gif" width="63" height="18" alt="运动鞋"><a href="http://www.shopin.net/sports/list--1594-0.05-0.4-89-188.5----.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/2119056.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/11/07/Pic2119056_210717_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2119056.html" target="_blank">361°时尚板鞋</a></h3><del>￥299</del><em>￥188</em></div></li>
<li><a href="http://www.shopin.net/product/1730856.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/04/08/Pic1730856_32097_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1730856.html" target="_blank">安踏运动休闲鞋</a></h3><del>￥269</del><em>￥188</em></div></li>
<li><a href="http://www.shopin.net/product/2049883.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/10/Pic2049883_32097_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2049883.html" target="_blank">安踏时尚板鞋</a></h3><del>￥269</del><em>￥188</em></div></li>
						</ul>
					</div>
				</div>
			</div>
			<h2 id="g" class="hd mt"><img src="http://images.shopin.net/images/ad/shuang12/pt4.png" width="936" height="40" alt="￥288一口价专区"><a href="http://www.shopin.net/list-----287-288---.html" target="_blank">更多&gt;&gt;</a></h2>
			<div class="bd">
				<div class="bdiv">
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/yrs.gif" width="63" height="18" alt="羊绒衫"><a href="http://www.shopin.net/list--1720---189-288.5---1-/1.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/1484516.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/09/19/Pic1484516_200579_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1484516.html" target="_blank">金利来圆领羊毛衫</a></h3><del>￥998</del><em>￥288</em></div></li>
<li><a href="http://www.shopin.net/product/701448.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/11/22/Pic701448_76146_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/701448.html" target="_blank">鹿王纯色半高领女衫</a></h3><del>￥1330</del><em>￥288</em></div></li>
<li><a href="http://www.shopin.net/product/2077513.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/11/13/Pic2077513_200615_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2077513.html" target="_blank">扬帆时尚女款羊毛衫</a></h3><del>￥980</del><em>￥288</em></div></li>
						</ul>
					</div>
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/nvyrf.gif" width="136" height="18" alt="女士长款羽绒服"><a href="http://www.shopin.net/list--1742---100-288---1-.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/2092594.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/07/Pic2092594_133470_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2092594.html" target="_blank">咔姿莱长款獭兔毛领羽绒服</a></h3><del>￥2880</del><em>￥288</em></div></li>
<li><a href="http://www.shopin.net/product/2009584.html" target="_blank"><img src="http://images.shopin.net/images//68/2012/08/29/Pic2009584_130870_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2009584.html" target="_blank">衣香丽影狐狸毛领长款羽绒</a></h3><del>￥959</del><em>￥288</em></div></li>
<li><a href="http://www.shopin.net/product/2021286.html" target="_blank"><img src="http://images.shopin.net/images//63/2012/09/10//Pic2021286_165628_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2021286.html" target="_blank">LOOIES貉子毛皮长款羽绒</a></h3><del>￥1890</del><em>￥288</em></div></li>
						</ul>
					</div>
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/cx.gif" width="47" height="18" alt="长靴"><a href="http://www.shopin.net/list--1824---280-288--0--/2.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/1460081.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/10/10/Pic1460081_58129_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1460081.html" target="_blank">FURUSI牛皮中筒靴</a></h3><del>￥998</del><em>￥288</em></div></li>
<li><a href="http://www.shopin.net/product/2060279.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/02/Pic2060279_182617_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2060279.html" target="_blank">炫姿兔毛时尚女靴</a></h3><del>￥758</del><em>￥288</em></div></li>
<li><a href="http://www.shopin.net/product/2122501.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/11/09/Pic2122501_182216_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2122501.html" target="_blank">Josiny粗跟中筒靴</a></h3><del>￥599</del><em>￥288</em></div></li>
						</ul>
					</div>
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/nyrf.gif" width="99" height="18" alt="男款羽绒服"><a href="http://www.shopin.net/man/list--1165---200-288----.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/2067377.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/09/Pic2067377_15534_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2067377.html" target="_blank">洛萨里奥立领商务休闲棉服</a></h3><del>￥1290</del><em>￥288</em></div></li>
<li><a href="http://www.shopin.net/product/1499551.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/11/01/Pic1499551_48654_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1499551.html" target="_blank">CONVERSE黑色运动休闲棉服</a></h3><del>￥579</del><em>￥288</em></div></li>
<li><a href="http://www.shopin.net/product/1597069.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/02/08/Pic1597069_26866_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1597069.html" target="_blank">Kappa运动系列连帽棉服</a></h3><del>￥738</del><em>￥288</em></div></li>
						</ul>
					</div>
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/zry.gif" width="63" height="18" alt="抓绒衣"><a href="http://www.shopin.net/outdoor/list--1308---280-288----.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/1995622.html" target="_blank"><img src="http://images.shopin.net/images//61/2012/10/03//Pic1995622_196039_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1995622.html" target="_blank">乐飞叶男款内搭抓绒衣</a></h3><del>￥480</del><em>￥288</em></div></li>
<li><a href="http://www.shopin.net/product/1996084.html" target="_blank"><img src="http://images.shopin.net/images//58/2012/08/24//Pic1996084_196017_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1996084.html" target="_blank">乐飞叶女款内搭抓绒衣</a></h3><del>￥480</del><em>￥288</em></div></li>
<li><a href="http://www.shopin.net/product/1995623.html" target="_blank"><img src="http://images.shopin.net/images//61/2012/10/03//Pic1995623_196040_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1995623.html" target="_blank">乐飞叶内搭抓绒衣</a></h3><del>￥480</del><em>￥288</em></div></li>
						</ul>
					</div>
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/nx.gif" width="45" height="18" alt="男鞋"><a href="http://www.shopin.net/list--1382---280-288--0--/4.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/1730641.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/04/11/Pic1730641_152334_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1730641.html" target="_blank">奥康真皮牛皮单鞋</a></h3><del>￥1199</del><em>￥288</em></div></li>
<li><a href="http://www.shopin.net/product/1795065.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/05/10/Pic1795065_130457_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1795065.html" target="_blank">camel active休闲男鞋</a></h3><del>￥800</del><em>￥288</em></div></li>
<li><a href="http://www.shopin.net/product/1566050.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/12/15/Pic1566050_46954_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1566050.html" target="_blank">HANG TEN户外男鞋</a></h3><del>￥988</del><em>￥288</em></div></li>
						</ul>
					</div>
				</div>
			</div>
			<h2 id="h" class="hd mt"><img src="http://images.shopin.net/images/ad/shuang12/pt5.png" width="936" height="40" alt="￥388一口价专区"><a href="http://www.shopin.net/list-----387-388---.html" target="_blank">更多&gt;&gt;</a></h2>
			<div class="bd">
				<div class="bdiv">
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/yrs.gif" width="63" height="18" alt="羊绒衫"><a href="http://www.shopin.net/list--1720---289-388.5---1-/1.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/2050852.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/25/Pic2050852_201913_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2050852.html" target="_blank">戎立特烫钻圆领羊绒衫</a></h3><del>￥1110</del><em>￥388</em></div></li>
<li><a href="http://www.shopin.net/product/2070565.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/30/Pic2070565_83516_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2070565.html" target="_blank">宾缘时尚碎花混绒衫</a></h3><del>￥1780</del><em>￥388</em></div></li>
<li><a href="http://www.shopin.net/product/2050925.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/26/Pic2050925_201915_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2050925.html" target="_blank">戎立特樽领靓丽羊绒衫</a></h3><del>￥1119</del><em>￥388</em></div></li>
						</ul>
					</div>
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/nvyrf.gif" width="136" height="18" alt="女士长款羽绒服"><a href="http://www.shopin.net/list--1740---300-388---1-.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/1490025.html" target="_blank"><img src="http://images.shopin.net/images//58/2011/12/07//Pic1490025_133470_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1490025.html" target="_blank">Kazelaze纽扣装饰连帽长款羽绒</a></h3><del>￥1880</del><em>￥388</em></div></li>
<li><a href="http://www.shopin.net/product/2122810.html" target="_blank"><img src="http://images.shopin.net/images//60/2012/11/14//Pic2122810_3351_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2122810.html" target="_blank">HOPE SHOW90%白鸭绒长款羽绒</a></h3><del>￥1379</del><em>￥388</em></div></li>
<li><a href="http://www.shopin.net/product/872371.html" target="_blank"><img src="http://images.shopin.net/images//58/2011/10/22//Pic872371_35532_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/872371.html" target="_blank">三COLOUR兔毛领收腰长款羽绒</a></h3><del>￥1349</del><em>￥388</em></div></li>
						</ul>
					</div>
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/cx.gif" width="47" height="18" alt="长靴"><a href="http://www.shopin.net/list--1824---300-388--0--/19.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/1432355.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/09/23/Pic1432355_56328_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1432355.html" target="_blank">特丽雅牛皮长靴</a></h3><del>￥998</del><em>￥388</em></div></li>
<li><a href="http://www.shopin.net/product/2041961.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/09/20/Pic2041961_11123_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2041961.html" target="_blank">红蜻蜓真皮长靴</a></h3><del>￥1259</del><em>￥388</em></div></li>
<li><a href="http://www.shopin.net/product/2051105.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/09/25/Pic2051105_11112_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2051105.html" target="_blank">千佰莉百搭女靴</a></h3><del>￥1148</del><em>￥388</em></div></li>
						</ul>
					</div>
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/cfy.gif" width="65" height="18" alt="冲锋衣"><a href="http://www.shopin.net/list--1295---380-388--0--.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/769202.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/11/22/Pic769202_86075_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/769202.html" target="_blank">PURELAND男款三合一冲锋衣</a></h3><del>￥980</del><em>￥388</em></div></li>
<li><a href="http://www.shopin.net/product/745150.html" target="_blank"><img src="http://images.shopin.net/images/61/2010/10/29/Pic745150_81258_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/745150.html" target="_blank">PURELAND女款三合一冲锋衣</a></h3><del>￥980</del><em>￥388</em></div></li>
<li><a href="http://www.shopin.net/product/2131316.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/19/Pic2131316_141727_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2131316.html" target="_blank">圣弗莱女士冲锋衣</a></h3><del>￥829</del><em>￥388</em></div></li>
						</ul>
					</div>
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/nyrf.gif" width="99" height="18" alt="男款羽绒服"><a href="http://www.shopin.net/list--1743---200-388---1-.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/1507106.html" target="_blank"><img src="http://images.shopin.net/images//66/2011/11/02//Pic1507106_32097_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1507106.html" target="_blank">安踏运动系列亮面羽绒服</a></h3><del>￥799</del><em>￥388</em></div></li>
<li><a href="http://www.shopin.net/product/1549463.html" target="_blank"><img src="http://images.shopin.net/images//60/2011/12/28//Pic1549463_15146_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1549463.html" target="_blank">乔丹时尚拼色连帽388</a></h3><del>￥869</del><em>￥388</em></div></li>
<li><a href="http://www.shopin.net/product/1528416.html" target="_blank"><img src="http://images.shopin.net/images//60/2012/09/26//Pic1528416_25320_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1528416.html" target="_blank">思凯乐男士超轻羽绒服</a></h3><del>￥798</del><em>￥388</em></div></li>
						</ul>
					</div>
					<div class="proarea">
						<h3 class="hd"><img src="http://images.shopin.net/images/ad/shuang12/nx.gif" width="45" height="18" alt="男鞋"><a href="http://www.shopin.net/list--1382---300-388--0--/42.html" target="_blank">更多&gt;&gt;</a></h3>
						<ul class="prolist">
<li><a href="http://www.shopin.net/product/2134179.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/11/22/Pic2134179_8217_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2134179.html" target="_blank">策乐牛皮男士冬靴</a></h3><del>￥1368</del><em>￥388</em></div></li>
<li><a href="http://www.shopin.net/product/1534591.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/11/28/Pic1534591_82403_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1534591.html" target="_blank">柏图仕牛皮男士休闲鞋</a></h3><del>￥1098</del><em>￥388</em></div></li>
<li><a href="http://www.shopin.net/product/1474479.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/10/24/Pic1474479_7915_0_1.jpg" width="130" height="130"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1474479.html" target="_blank">圣大保罗牛皮男士棉靴</a></h3><del>￥1178</del><em>￥388</em></div></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<a href="http://www.shopin.net/help/signup.html" target="_blank"><img id="i" class="mt" src="http://images.shopin.net/images/ad/shuang12/img1.jpg"></a>
		<a href="http://www.shopin.net/help/tuan12.html" target="_blank" ><img id="j" class="mt mb" src="http://images.shopin.net/images/ad/shuang12/img2.jpg" width="950" height="227" alt="双12 阶梯价定制"></a></div>
<div id="summer_subnav" class="summer_subnav png">
  <!--a class="subnav-close" href="javascript:void(0);" title="关闭">关闭</a-->
	<ul>
    <li><a href="#a" title="大牌4折封">大牌4折封</a></li>
    <li><a href="#b" title="2件打包专区">2件打包专区</a></li>
		<li class="subnav_inner"><a href="#c" title="一口价爆款">一口价爆款</a>
			<a href="#d" title="￥58专区">￥58专区</a>
			<a href="#e" title="￥88专区">￥88专区</a>
			<a href="#f" title="￥188专区">￥188专区</a>
			<a href="#g" title="￥288专区">￥288专区</a>
			<a href="#h" title="￥388专区">￥388专区</a>
		</li>
    <li><a href="#i" title="会员签到送礼">会员签到送礼</a></li>
    <li><a href="#j" title="预售阶梯团">预售阶梯团</a></li>
		<li class="gotop"><a href="#top" title="回顶部">回顶部</a></li>
  </ul>
</div>
<script>
$.fn.smartFloat = function() {
    var position = function(element) {
         var top = element.position().top, pos = element.css("position");
         $(window).scroll(function() {
             var scrolls = $(this).scrollTop(), clientHeight = document.documentElement.clientHeight, eleHeight = element.height();
                 if (window.XMLHttpRequest) {
                     element.css({
                         position: "fixed",
                         top: '50%'      
                     });
                 }else {
                     element.css({
                         top: scrolls+clientHeight-clientHeight/2 //ie垂直居中
                     });
                 }
         });
     };
     return $(this).each(function() {
         position($(this));
     });
 };
 $("#summer_subnav").smartFloat();
 $(function(){
	 $(".subnav-close").click(function(){
		 $("#summer_subnav").hide();
		 });
	 })
</script>
</body>
</html>
