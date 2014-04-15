<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>百大商场名牌,万款冬装重磅出击,第一季初冬时尚系列,JIMANNO,HOPE SHOW,千百度,水孩儿羊毛大衣,衬衫,靴子,针织衫,2-7折,2012.10.11-10.17</title>
<style>
/*reset*/
.mt{margin-top:10px}
img{ vertical-align:bottom}
/*main*/
.wrap{margin:10px 0;background:#982d1b url(http://images.shopin.net/images/ad/dongzhuangsf/body.png) repeat-y}
.sp-hd{height:64px;background:url(http://images.shopin.net/images/ad/dongzhuangsf/title-bg.png)}
.wrap .sp-hd a{float:right;margin:-35px 10px 0 0; color:#ffc267}
.wrap .sp-hd h3 {position:relative;width:295px; height:64px; line-height:64px; overflow:hidden; margin:0 auto; text-align:center; font:600 36px/64px '方正大黑简体','microsoft yahei'; color:#ffc165}
.wrap .sp-hd h3 img {position:absolute;left:0;top:2px;width:295px; height:62px; background-image:url(http://images.shopin.net/images/ad/dongzhuangsf/title-font.png);background-repeat:no-repeat}
.new-winter img { background-position: 0 0}
.new-woman img { background-position: 0 -62px}
.new-man img { background-position: 0 -124px}
.new-children img { background-position: 0 -186px}
.new-seckill img { background-position: 0 -248px}
/*fcous*/
.zt-fcous{width:950px;height:513px;overflow:hidden;position:relative}
.out-box{width:950px;height:513px;display:table;}
.focus-nav{display:table-cell;vertical-align:middle;position:relative;*position:absolute;right:0;*top:50%;z-index:5; pointer-events:none;}
.focus-nav .num,.focus-nav .text{width:215px;float:right;position:relative;*position:relative;*top:-50%;right:0;}
.num{z-index:7; pointer-events:auto}
.num a{width:200px;height:43px;display:block;padding:10px 5px 10px 10px;margin:2px 0;cursor:pointer;text-decoration:none;zoom:1;overflow:hidden}
.num a.cur{ background:#fe4504;color:#fff;}
.num a img{float:left;margin-right:6px;}
.num a h3{line-height:22px;height:22px;overflow:hidden}
.num a em{color:#ea5221;font-size:14px;font-weight:600;font-family:'microsoft yahei','arial','simsun'}
.num a.cur em{color:#fff}
.text{z-index:6}
.text a{width:215px;height:63px;display:block;text-align:center;margin:2px 0;cursor:pointer;background:#fff;filter:Alpha(opacity=70);-moz-opacity:.7;opacity:.7;}
.focus-nav .text { margin-right:-215px}
.zt-fcous ul{width:950px; height:513px; position:absolute; z-index:1;}
.zt-fcous ul li{width:950px; height:513px; display:none;}
/*product list*/
.prolist { width:100%; margin-bottom:5px; overflow:hidden; zoom:1;}
.prolist ul {margin-left:-19px}
.prolist li { float:left; _display:inline; width:132px; margin:5px 0 0 28px; text-align:center; position:relative}
.prolist li a:hover ,.prolist li a:hover h3{ color:#f60}
.prolist li img { width:130px; height:130px; border:1px solid #e2e2e2}
.prolist li h3 { height:20px; overflow:hidden; line-height:20px; font-weight:normal; color:#fff}
.prolist li del { color:#ffd0c7}
.prolist li em { margin-left:10px; font-size:14px; font-weight:bold; color:#93d2fe}
.prolist .starprice { line-height:20px; text-align:center; overflow:hidden; font-weight:bold; color:#f15930;}
.prolist .save { width:110px; height:20px; margin:3px auto 0; text-align:center; font-weight:bold; background:#f25930; color:#fff601}
.prolist .cornermark { position:absolute; right:0; top:0; width:49px; height:49px; line-height:49px; overflow:hidden; font-weight:600; color:#fff; background:url(http://images.shopin.net/images/ad/jinqiu1/mark.png)}
/*brand list*/
.brand-logo-list ul { margin:5px 0 0 -5px; zoom:1}
.brand-logo-list li { float:left; width:128px; margin:0 0 10px 7px; _display:inline; text-align:center; line-height:24px}
.brand-logo-list li a { color:#fff}
.brand-logo-list li img { display:block; width:126px; height:86px; border:1px solid #eee}
/*sale list*/
.salelist li{float:left; margin-bottom:6px}
.two-col li { width:467px; height:176px; margin-left:6px; background:#fff}
.three-col li { width:309px; height:184px; margin-left:6px; background:#fff}
/*newbrand*/
.newbrand { height:64px; background:url(http://images.shopin.net/images/ad/dongzhuangsf/newbrand.png)}
.newbrand a { float:right; margin:35px 10px 0 0; font-weight:normal; color:#fff;}
/*subnav*/
.summer_subnav { position:absolute; right:-11px; /*top:0px;*/ z-index:99; width:104px; height:379px; background:url(http://images.shopin.net/images/ad/dongzhuangsf/subnav.png) no-repeat; top:50%; margin-top:-165px; _margin-top:expression(document.documentElement.scrollTop+10)px; left:50%; margin-left:382px}
.subnav-close { float:right; width:16px; height:16px; margin:5px 5px 0 0; text-indent:-999em}
.summer_subnav ul { margin-top:56px}
.summer_subnav ul li { height:24px; line-height:24px; margin-bottom:2px; text-indent:-999em; overflow:hidden}
.summer_subnav ul li a { display:block; line-height:24px; zoom:1}
.summer_subnav ul li.gotop { margin-top:22px}
</style>
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
	<div class="wrap">
    <img src="http://images.shopin.net/images/ad/dongzhuangsf/top-ad1.jpg" align="top"><img src="http://images.shopin.net/images/ad/dongzhuangsf/top-ad2.jpg" align="top">
  	<div id="a" class="sp-hd"><h3 class="new-winter"><img src="http://images.shopin.net/images/ad/dongzhuangsf/space.gif">2012初冬新品</h3><a href="http://www.shopin.net/list---0.5-0.8------.html" target="_blank">更多&gt;&gt;</a></div>
    <div class="prolist mt">
      <ul>
<li><a href="http://www.shopin.net/product/1592514.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/10/03/Pic1592514_1252_0_1.jpg" /><h3>秋水伊人黑白相间拼色大衣</h3></a><del>￥1038</del><em>￥519</em></li>
<li><a href="http://www.shopin.net/product/1608818.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/01/21/Pic1608818_49354_0_1.jpg" /><h3>三COLOUR时尚驼色羊毛大衣</h3></a><del>￥1649</del><em>￥742</em></li>
<li><a href="http://www.shopin.net/product/1536340.html" target="_blank"><img src="http://images.shopin.net/images//63/2012/07/20//Pic1536340_76813_0_1.jpg" /><h3>无色无味粉色彩条纯棉针织衫</h3></a><del>￥468</del><em>￥240</em></li>
<li><a href="http://www.shopin.net/product/2053577.html" target="_blank"><img src="http://images.shopin.net/images//60/2012/09/27//Pic2053577_202987_0_1.jpg" /><h3>ME FOREVER时尚印花针织开衫</h3></a><del>￥459</del><em>￥275</em></li>
<li><a href="http://www.shopin.net/product/2063691.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/10/09/Pic2063691_11101_0_1.jpg" /><h3>红蜻蜓头层牛皮兔毛系带短靴</h3></a><del>￥939</del><em>￥488</em></li>
<li><a href="http://www.shopin.net/product/1606685.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/07/17/Pic1606685_161983_0_1.jpg" /><h3>捷希牛皮兔毛粗跟短靴</h3></a><del>￥1098</del><em>￥598</em></li>
<li><a href="http://www.shopin.net/product/2053884.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/09/26//Pic2053884_82110_0_1.jpg" /><h3>丽织纺男士舒柔保暖套装</h3></a><del>￥468</del><em>￥280</em></li>
<li><a href="http://www.shopin.net/product/2051421.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/09/27//Pic2051421_202340_0_1.jpg" /><h3>纤丝鸟羊毛倍暖绒套装</h3></a><del>￥398</del><em>￥238</em></li>
<li><a href="http://www.shopin.net/product/2043155.html" target="_blank"><img src="http://images.shopin.net/images//63/2012/09/27//Pic2043155_90017_0_1.jpg" /><h3>杰奎普瑞新款95%羊毛大衣</h3></a><del>￥2980</del><em>￥1788</em></li>
<li><a href="http://www.shopin.net/product/1497288.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/12/16/Pic1497288_12656_0_1.jpg" /><h3>暇步士深棕牛皮商务休闲男鞋</h3></a><del>￥1398</del><em>￥699</em></li>
<li><a href="http://www.shopin.net/product/2046065.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/09/24//Pic2046065_201729_0_1.jpg" /><h3>水孩儿圆领条纹毛衫</h3></a><del>￥289</del><em>￥172</em></li>
<li><a href="http://www.shopin.net/product/2065864.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/10/02//Pic2065864_81688_0_1.jpg" /><h3>ABCKIDS时尚保暖运动鞋</h3></a><del>￥347</del><em>￥208</em></li>
      </ul>
    </div>
    <img src="http://images.shopin.net/images/ad/dongzhuangsf/line.png">
  	<div id="b" class="sp-hd"><h3 class="new-woman"><img src="http://images.shopin.net/images/ad/dongzhuangsf/space.gif">女人初冬换装</h3><a href="http://www.shopin.net/channel-lady.html" target="_blank">更多&gt;&gt;</a></div>
    <div class="salelist mt">
    	<ul class="three-col">
      	<li><a href="http://www.shopin.net/promotion/5990.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/w1-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/6124.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/w2-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/6123.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/w3-1010.jpg"></a></li>
      </ul>
    	<ul class="two-col">
      	<li><a href="http://www.shopin.net/promotion/5703.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sw1-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/3462.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sw2-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/5756.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sw3-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/6036.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sw4-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/5285.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sw5-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/5965.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sw6-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/4943.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sw7-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/6052.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sw8-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/6015.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sw9-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/5819.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sw10-1010.jpg"></a></li>
      </ul>
    </div>
    <ul class="brand-logo-list mt">
<li><a href="http://www.shopin.net/lady/brand/list-289-1046-------1.html " target="_blank"><img src="http://images.shopin.net/images/brand/289_2.jpg">3-7折</a></li>
<li><a href="http://www.shopin.net/lady/brand/list-1047-1046-------1.html " target="_blank"><img src="http://images.shopin.net/images//brand/1047_2.jpg">2-5折</a></li>
<li><a href="http://www.shopin.net/lady/brand/list-55-1046-------1.html " target="_blank"><img src="http://images.shopin.net/images/brand/55_2.jpg">2-5折</a></li>
<li><a href="http://www.shopin.net/brands/1874.html" target="_blank"><img src="http://images.shopin.net/images//brand/1874_2.jpg">3折蜂抢</a></li>
<li><a href="http://www.shopin.net/lady/brand/list-1789-1046-------1.html " target="_blank"><img src="http://images.shopin.net/images/brand/1789_2.jpg">2-4折</a></li>
<li><a href="http://www.shopin.net/shoes/brand/list-319-1824.html " target="_blank"><img src="http://images.shopin.net/images/brand/319_2.jpg">2-5折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/1603.html " target="_blank"><img src="http://images.shopin.net/images/brand/1603_2.jpg">2-5折</a></li>
    </ul>
    <img src="http://images.shopin.net/images/ad/dongzhuangsf/line.png">
  	<div id="c" class="sp-hd"><h3 class="new-man"><img src="http://images.shopin.net/images/ad/dongzhuangsf/space.gif">男人初冬换装</h3><a href="http://www.shopin.net/channel-man.html" target="_blank">更多&gt;&gt;</a></div>
    <div class="salelist mt">
    	<ul class="three-col">
      	<li><a href="http://www.shopin.net/promotion/6122.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/m1-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/4063.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/m2-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/6100.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/m3-1010.jpg"></a></li>
      </ul>
    	<ul class="two-col">
      	<li><a href="http://www.shopin.net/promotion/5826.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sm1-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/5204.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sm2-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/5935.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sm3-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/5995.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sm4-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/5985.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sm5-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/5888.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sm6-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/6055.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sm7-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/5162.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sm8-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/5950.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sm9-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/5656.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sm10-1010.jpg"></a></li>
      </ul>
    </div>
    <ul class="brand-logo-list mt">
<li><a href="http://www.shopin.net/brands/412.html " target="_blank"><img src="http://images.shopin.net/images//brand/412_2.jpg">2-5折</a></li>
<li><a href="http://www.shopin.net/man/brand/list-220-1047-------1.html " target="_blank"><img src="http://images.shopin.net/images//brand/220_2.jpg">2-4折</a></li>
<li><a href="http://www.shopin.net/man/brands/452.html" target="_blank"><img src="http://images.shopin.net/images//brand/452_2.jpg">3-5折</a></li>
<li><a href="http://www.shopin.net/man/brands/2011.html " target="_blank"><img src="http://images.shopin.net/images//brand/2011_2.jpg">2-5折</a></li>
<li><a href="http://www.shopin.net/man/brands/426.html" target="_blank"><img src="http://images.shopin.net/images//brand/426_2.jpg">2-5折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/291.html " target="_blank"><img src="http://images.shopin.net/images/brand/291_2.jpg">3-6折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/122.html " target="_blank"><img src="http://images.shopin.net/images/brand/122_2.jpg">3-6折</a></li>
    </ul>
    <img src="http://images.shopin.net/images/ad/dongzhuangsf/line.png">
  	<div id="d" class="sp-hd"><h3 class="new-children"><img src="http://images.shopin.net/images/ad/dongzhuangsf/space.gif">孩子初冬换装</h3><a href="http://www.shopin.net/channel-children.html" target="_blank">更多&gt;&gt;</a></div>
    <div class="salelist mt">
    	<ul class="three-col">
      	<li><a href="http://www.shopin.net/promotion/6010.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/c1-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/6121.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/c2-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/6120.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/c3-1010.jpg"></a></li>
      </ul>
    	<ul class="two-col">
      	<li><a href="http://www.shopin.net/promotion/5788.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sc1-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/6117.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sc2-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/5886.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sc3-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/6070.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sc4-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/5907.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sc5-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/6000.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sc6-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/5835.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sc7-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/5838.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sc8-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/6067.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sc9-1010.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/5373.html" target="_blank"><img src="http://images.shopin.net/images/ad/dongzhuangsf/sc10-1010.jpg"></a></li>
      </ul>
    </div>
    <ul class="brand-logo-list mt">
<li><a href="http://www.shopin.net/children/brands/46.html " target="_blank"><img src="http://images.shopin.net/images/brand/46_2.jpg">3-6折</a></li>
<li><a href="http://www.shopin.net/children/brands/262.html " target="_blank"><img src="http://images.shopin.net/images/brand/262_2.jpg">6折封</a></li>
<li><a href="http://www.shopin.net/brands/57.html " target="_blank"><img src="http://images.shopin.net/images/brand/57_2.jpg">4折起</a></li>
<li><a href="http://www.shopin.net/children/brands/10.html " target="_blank"><img src="http://images.shopin.net/images/brand/10_2.jpg">1-5折</a></li>
<li><a href="http://www.shopin.net/children/brand/list-1531/6.html " target="_blank"><img src="http://images.shopin.net/images/brand/1531_2.jpg">新品5折</a></li>
<li><a href="http://www.shopin.net/children/brands/919.html " target="_blank"><img src="http://images.shopin.net/images/brand/919_2.jpg">5-8折</a></li>
<li><a href="http://www.shopin.net/children/brands/48.html " target="_blank"><img src="http://images.shopin.net/images/brand/48_2.jpg">3-5折</a></li>
    </ul>
    <img src="http://images.shopin.net/images/ad/dongzhuangsf/line.png">
  	<div id="e" class="sp-hd"><h3 class="new-seckill"><img src="http://images.shopin.net/images/ad/dongzhuangsf/space.gif">初冬装超值秒杀专区</h3><a href="http://www.shopin.net/list---0.05-0.3------.html" target="_blank">更多&gt;&gt;</a></div>
    <div class="prolist">
    	<ul>
<li><a href="http://www.shopin.net/product/1453264.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/10/08/Pic1453264_99836_0_1.jpg" /><h3>HOPE SHOW狐狸毛领羊毛大衣</h3></a><del>￥1499</del><em>￥299</em></li>
<li><a href="http://www.shopin.net/product/1581791.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/06/30/Pic1581791_136332_0_1.jpg" /><h3>JIMANNO民族异域风情开衫</h3></a><del>￥4299</del><em>￥570</em></li>
<li><a href="http://www.shopin.net/product/1516603.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/13/Pic1516603_154100_0_1.jpg" /><h3>爱尔爱司时尚羊毛大衣</h3></a><del>￥1590</del><em>￥379</em></li>
<li><a href="http://www.shopin.net/product/1461078.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/10/09/Pic1461078_11135_0_1.jpg" /><h3>红蜻蜓深棕色头层牛皮长靴</h3></a><del>￥939</del><em>￥299</em></li>
<li><a href="http://www.shopin.net/product/2064402.html" target="_blank"><img src="http://images.shopin.net/images//58/2012/10/03//Pic2064402_160213_0_1.jpg" /><h3>汪小荷 纯色收腰羊毛大衣</h3></a><del>￥315</del><em>￥89</em></li>
<li><a href="http://www.shopin.net/product/1507693.html" target="_blank"><img src="http://images.shopin.net/images//58/2011/11/03//Pic1507693_48504_0_1.jpg" /><h3>史努比炫彩卡通运动鞋</h3></a><del>￥398</del><em>￥120</em></li>
      </ul>
    </div>    
  	<h4 id="f" class="newbrand"><a href="http://www.shopin.net/help/xinpinpai.html" target="_blank">更多&gt;&gt;</a></h4>
    <div class="zt-fcous">
		<div class="out-box">
			<ul>
					<li style="display:block;"><a href="http://www.shopin.net/promotion/6086.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/f1-109.jpg"></a></li>
					<li><a href="http://www.shopin.net/promotion/6113.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/f2-109.jpg"></a></li>
					<li><a href="http://www.shopin.net/promotion/6114.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/f3-109.jpg"></a></li>
					<li><a href="http://www.shopin.net/promotion/6110.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/f4-109.jpg"></a></li>
					<li><a href="http://www.shopin.net/promotion/6111.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/f5-109.jpg"></a></li>
				</ul>
			<div class="focus-nav">
				<div class="num">
                    <a class="cur"><img src="http://images.shopin.net/images/ad/xinpinpai/l1-109.jpg"><span><h3>简单生活 舒适出行</h3><em>1-6折起</em></span></a>
                    <a><img src="http://images.shopin.net/images/ad/xinpinpai/l2-109.jpg"><span><h3>意大利名品鞋履</h3><em>低至3折</em></span></a>
                    <a><img src="http://images.shopin.net/images/ad/xinpinpai/l3-109.jpg"><span><h3>源自英国 时髦英伦风</h3><em>2-5折</em></span></a>
                    <a><img src="http://images.shopin.net/images/ad/xinpinpai/l4-109.jpg"><span><h3>优雅干练 高贵内敛</h3><em>3-5折</em></span></a>
                    <a><img src="http://images.shopin.net/images/ad/xinpinpai/l5-109.jpg"><span><h3>精致典雅 成熟浪漫</h3><em>秋冬装4折封</em></span></a>
                </div>
				<div class="text"><a></a><a></a><a></a><a></a><a></a></div>
			</div>
			</div>
	</div>
  </div>
<div id="summer_subnav" class="summer_subnav png">
  <a class="subnav-close" href="javascript:void(0);" title="关闭">关闭</a>
	<ul>
    <li><a href="#a" title="2012初冬新品">2012初冬新品</a></li>
		<li><a href="#b" title="女士冬装">女士冬装</a></li>
		<li><a href="#c" title="男士冬装">男士冬装</a></li>
		<li><a href="#d" title="儿童冬装">儿童冬装</a></li>
		<li><a href="#e" title="限量秒杀区">限量秒杀区</a></li>
		<li><a href="#f" title="本周新品牌">本周新品牌</a></li>
		<li><a href="http://www.shopin.net/channel/brandstores.html" title="更多品牌" target="_blank">更多品牌</a></li>
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
		 })
	 })
</script>
</body>
</html>