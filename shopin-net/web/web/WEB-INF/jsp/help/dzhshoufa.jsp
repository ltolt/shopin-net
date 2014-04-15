<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>店庆前发售,百大商场名牌,万款冬装重磅出击,第二季终极保暖系列,鹿王,雪莲,莱尔斯丹,红蜻蜓,奥羽尚,羊绒衫,羽绒服,保暖内衣,靴子,针织衫,3-7折,2012.10.18-10.24 </title>
<style>
/*reset*/
.mt{margin-top:10px}
img{ vertical-align:bottom}
/*main*/
.wrap{margin:10px 0;background:#982d1b url(http://images.shopin.net/images/ad/dongzhuangsf/body.png) repeat-y}
.sp-hd{height:64px;background: url(http://images.shopin.net/images/ad/dzhshoufa/divh2.jpg)}
.wrap .sp-hd a{float:right;margin:-35px 10px 0 0; color:#ffc267}
.wrap .sp-hd h3 {position:relative;width:429px; height:64px; line-height:64px; overflow:hidden; margin:0 auto; text-align:center; font:600 36px/64px '方正大黑简体','microsoft yahei'; color:#ffc165}
.wrap .sp-hd h3 img {position:absolute;left:0;top:2px;width:429px; height:62px; background-image:url(http://images.shopin.net/images/ad/dzhshoufa/link.jpg);background-repeat:no-repeat}
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
.prolist ul {margin-left:-19px; zoom:1;}
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
.salelist li {float:left; margin-bottom:6px; _display:inline; _zoom:1;}
.two-col,.three-col { *margin-bottom:6px; _margin-bottom:auto}
.two-col:after ,.three-col:after { height:0; clear:both; content:"."; visibility:hidden; display:block;}
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
    <img src="http://images.shopin.net/images/ad/dzhshoufa/topimg.jpg"align="top"><img src="http://images.shopin.net/images/ad/dzhshoufa/topimg2.jpg" align="top"><img src="http://images.shopin.net/images/ad/dzhshoufa/topimg3.jpg" align="top">
  	<div class="sp-hd"><h3 class="new-winter"><img src="http://images.shopin.net/images/ad/dongzhuangsf/space.gif">2012初冬新品</h3><a href="http://www.shopin.net/list---0.4-0.8------.html" target="_blank">更多&gt;&gt;</a></div>
    <div class="prolist mt">
      <ul>
<li><a href="	http://www.shopin.net/product/2070804.html	" target="_blank"><img src="	http://images.shopin.net/images/68/2012/10/08/Pic2070804_85101_0_1.jpg" /><h3>蒙丹米尔圆领提花羊绒衫	</h3></a><del>￥	960	</del><em>￥	480	</em></li>
<li><a href="	http://www.shopin.net/product/1430744.html	" target="_blank"><img src="	http://images.shopin.net/images//60/2011/09/22//Pic1430744_144648_0_1.jpg" /><h3>CARRUN镶钻纯色V领羊绒衫	</h3></a><del>￥	1080	</del><em>￥	598	</em></li>
<li><a href="	http://www.shopin.net/product/1909960.html	" target="_blank"><img src="	http://images.shopin.net/images/68/2012/06/19/Pic1909960_187275_0_1.jpg" /><h3>OURSHINE短款连帽白鸭绒羽绒服	</h3></a><del>￥	568	</del><em>￥	258	</em></li>
<li><a href="	http://www.shopin.net/product/1538725.html	" target="_blank"><img src="	http://images.shopin.net/images/61/2011/12/06/Pic1538725_149226_0_1.jpg" /><h3>MODO GAGA面包领收腰长款羽绒服	</h3></a><del>￥	868	</del><em>￥	347	</em></li>
<li><a href="	http://www.shopin.net/product/1443143.html	" target="_blank"><img src="	http://images.shopin.net/images/60/2011/11/08/Pic1443143_92183_0_1.jpg" /><h3>谷子狐狸毛领双排扣绵羊皮皮衣	</h3></a><del>￥	7690	</del><em>￥	3076	</em></li>
<li><a href="	http://www.shopin.net/product/2058081.html	" target="_blank"><img src="	http://images.shopin.net/images/60/2012/10/12/Pic2058081_82508_0_1.jpg" /><h3>诗迪奥葳貉子毛领白鸭绒皮衣	</h3></a><del>￥	10860	</del><em>￥	4380	</em></li>
<li><a href="	http://www.shopin.net/product/2063691.html	" target="_blank"><img src="	http://images.shopin.net/images/63/2012/10/09/Pic2063691_11101_0_1.jpg" /><h3>红蜻蜓头层牛皮兔毛短靴	</h3></a><del>￥	939	</del><em>￥	488	</em></li>
<li><a href="	http://www.shopin.net/product/2001773.html	" target="_blank"><img src="	http://images.shopin.net/images/61/2012/09/04/Pic2001773_37230_0_1.jpg" /><h3>百思图浅棕打蜡牛皮马丁女靴	</h3></a><del>￥	969	</del><em>￥	598	</em></li>
<li><a href="	http://www.shopin.net/product/1434776.html	" target="_blank"><img src="	http://images.shopin.net/images/60/2011/11/11/Pic1434776_154606_0_1.jpg" /><h3>诺诗兰菲尼亚斯男式三合一冲锋衣	</h3></a><del>￥	1380	</del><em>￥	689	</em></li>
<li><a href="	http://www.shopin.net/product/1324657.html	" target="_blank"><img src="	http://images.shopin.net/images/66/2011/07/27/Pic1324657_27908_0_1.jpg" /><h3>布来亚克女式三合一冲锋衣	</h3></a><del>￥	1980	</del><em>￥	799	</em></li>
<li><a href="	http://www.shopin.net/product/2023655.html	" target="_blank"><img src="	http://images.shopin.net/images//66/2012/10/15//Pic2023655_65197_0_1.jpg" /><h3>美特斯邦威男款棉外套	</h3></a><del>￥	599	</del><em>￥	359	</em></li>
<li><a href="	http://www.shopin.net/product/2044561.html	" target="_blank"><img src="	http://images.shopin.net/images//61/2012/09/25//Pic2044561_190400_0_1.jpg" /><h3>Buyinuosi百搭女款棉服	</h3></a><del>￥	689	</del><em>￥	419	</em></li>

      </ul>
    </div>
    <img src="http://images.shopin.net/images/ad/dongzhuangsf/line.png">
  	<div class="sp-hd"><h3 class="new-woman"><img src="http://images.shopin.net/images/ad/dongzhuangsf/space.gif">羊绒 羽绒 皮衣</h3><a href="http://www.shopin.net/list--1720.html" target="_blank">更多&gt;&gt;</a></div>
    <div class="salelist mt">
    	<ul class="three-col">
      	<li><a href="http://www.shopin.net/promotion/5800.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/pl/1.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/6080.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/pl/2.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/4081.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/pl/3.jpg"></a></li>
      </ul>
    	<ul class="two-col">
<li><a href="	http://www.shopin.net/promotion/6160.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/2.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/6148.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/3.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/6055.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/4.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/5969.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/1.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/5819.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/5.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/5799.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/6.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/5492.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/7.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/6153.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/8.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/6118.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/9.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/3739.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/10.jpg"></a></li>


      </ul>
    </div>
    <ul class="brand-logo-list mt">
<li><a href="	http://www.shopin.net/brands/2402.html" target="_blank"><img src="	http://images.shopin.net/images//brand/2402_2.jpg">	2折起	</a></li>
<li><a href="	http://www.shopin.net/brands/1387.html" target="_blank"><img src="	http://images.shopin.net/images//brand/1387_2.jpg">	3-5折	</a></li>
<li><a href="	http://www.shopin.net/brands/1309.html" target="_blank"><img src="	http://images.shopin.net/images/brand/1309_2.jpg">	3-5折	</a></li>
<li><a href="	http://www.shopin.net/brands/1881.html" target="_blank"><img src="	http://images.shopin.net/images//brand/1881_2.jpg">	2折起	</a></li>
<li><a href="	http://www.shopin.net/brands/1584.html" target="_blank"><img src="	http://images.shopin.net/images//brand/1584_2.jpg">	2-5折	</a></li>
<li><a href="	http://www.shopin.net/man/brands/220.html" target="_blank"><img src="	http://images.shopin.net/images//brand/220_2.jpg">	3折起	</a></li>
<li><a href="	http://www.shopin.net/casual/brand/list-293-1753.html" target="_blank"><img src="	http://images.shopin.net/images//brand/293_2.jpg">	3-5折	</a></li>

    </ul>
    <img src="http://images.shopin.net/images/ad/dongzhuangsf/line.png">
  	<div class="sp-hd"><h3 class="new-man"><img src="http://images.shopin.net/images/ad/dongzhuangsf/space.gif">长靴4折起</h3><a href="http://www.shopin.net/list--1824.html" target="_blank">更多&gt;&gt;</a></div>
    <div class="salelist mt">
    	<ul class="three-col">
      	<li><a href="http://www.shopin.net/promotion/6095.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/pl/4.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/6123.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/pl/5.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/6147.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/pl/6.jpg"></a></li>
      </ul>
    	<ul class="two-col">
      	<li><a href="	http://www.shopin.net/promotion/6024.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/11.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/6048.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/12.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/5916.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/13.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/4943.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/14.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/6052.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/15.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/6151.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/16.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/6150.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/17.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/6103.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/18.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/6154.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/19.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/6152.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/20.jpg"></a></li>

      </ul>
    </div>
    <ul class="brand-logo-list mt">
<li><a href=" http://www.shopin.net/shoes/brands/247.html" target="_blank"><img src="	http://images.shopin.net/images/brand/247_2.jpg">	3-6折	</a></li>
<li><a href="	http://www.shopin.net/shoes/brands/249.html" target="_blank"><img src="	http://images.shopin.net/images/brand/249_2.jpg">	3-6折	</a></li>
<li><a href="	http://www.shopin.net/shoes/brands/242.html" target="_blank"><img src="	http://images.shopin.net/images/brand/242_2.jpg">	2-5折	</a></li>
<li><a href="	http://www.shopin.net/shoes/brands/230.html" target="_blank"><img src="	http://images.shopin.net/images/brand/230_2.jpg">	2-5折	</a></li>
<li><a href="	http://www.shopin.net/shoes/brands/184.html" target="_blank"><img src="	http://images.shopin.net/images/brand/184_2.jpg">	2-5折	</a></li>
<li><a href="	http://www.shopin.net/shoes/brands/220.html" target="_blank"><img src="	http://images.shopin.net/images/brand/220_2.jpg">	3-6折	</a></li>
<li><a href="	http://www.shopin.net/shoes/brands/291.html" target="_blank"><img src="	http://images.shopin.net/images/brand/291_2.jpg">	3-6折	</a></li>

    </ul>
    <img src="http://images.shopin.net/images/ad/dongzhuangsf/line.png">
  	<div class="sp-hd"><h3 class="new-children"><img src="http://images.shopin.net/images/ad/dongzhuangsf/space.gif">保暖内衣 冲锋衣 棉服</h3><a href="http://www.shopin.net/channel-outdoor.html" target="_blank">更多&gt;&gt;</a></div>
    <div class="salelist mt">
    	<ul class="three-col">
      	<li><a href="http://www.shopin.net/promotion/6028.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/pl/7.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/6075.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/pl/8.jpg"></a></li>
      	<li><a href="http://www.shopin.net/promotion/6155.html" target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/pl/9.jpg"></a></li>
      </ul>
    	<ul class="two-col">
<li><a href="	http://www.shopin.net/promotion/3973.html"target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/21.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/4088.html"target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/22.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/4018.html"target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/23.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/2015.html"target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/24.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/4960.html"target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/25.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/5051.html"target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/26.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/6161.html"target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/27.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/1928.html"target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/28.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/6156.html"target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/29.jpg"></a></li>
<li><a href="	http://www.shopin.net/promotion/6149.html"target="_blank"><img src="http://images.shopin.net/images/ad/dzhshoufa/sl/30.jpg"></a></li>

      </ul>
    </div>
    <ul class="brand-logo-list mt">
<li><a href="	http://www.shopin.net/list-1488--0.1-0.5----0-1-.html" target="_blank"><img src="	http://images.shopin.net/images/brand/1488_2.jpg">	3-5折	</a></li>
<li><a href="	http://www.shopin.net/brands/1444.html" target="_blank"><img src="	http://images.shopin.net/images/brand/1444_2.jpg">	3-5折	</a></li>
<li><a href="	http://www.shopin.net/brands/174.html" target="_blank"><img src="	http://images.shopin.net/images//brand/174_2.jpg">	5折封	</a></li>
<li><a href="	http://www.shopin.net/underwear/list-65-1068--------.html" target="_blank"><img src="	http://images.shopin.net/images//brand/65_2.jpg">	3-5折	</a></li>
<li><a href="	http://www.shopin.net/list-289-1234------0-1-.html" target="_blank"><img src="	http://images.shopin.net/images//brand/289_2.jpg">	3-5折	</a></li>
<li><a href="	http://www.shopin.net/outdoor/brand/list-1941-1066-0.1-0.8-----1.html" target="_blank"><img src="	http://images.shopin.net/images/brand/1941_2.jpg">	5-8折	</a></li>
<li><a href="	http://www.shopin.net/outdoor/brand/list-591-1066-0.1-0.7-----1.html" target="_blank"><img src="	http://images.shopin.net/images/brand/591_2.jpg">	3-7折	</a></li>

    </ul>
    <img src="http://images.shopin.net/images/ad/dongzhuangsf/line.png">
  	<div class="sp-hd"><h3 class="new-seckill"><img src="http://images.shopin.net/images/ad/dongzhuangsf/space.gif">初冬装超值秒杀专区</h3><a href="" target="_blank">更多&gt;&gt;</a></div>
    <div class="prolist">
    	<ul>
<li><a href="	http://www.shopin.net/product/2045135.html" target="_blank"><img src="	http://images.shopin.net/images/63/2012/10/11/Pic2045135_101629_0_1.jpg"/><h3>	KELIYA亮钻装饰V领羊绒衫	</h3></a><del>￥	1980	</del><em>￥	299	</em></li>
<li><a href="	http://www.shopin.net/product/1333718.html" target="_blank"><img src="	http://images.shopin.net/images/68/2012/10/09/Pic1333718_132530_0_1.jpg"/>	<h3>	Kazelaze时尚双排扣系带羽绒	</h3></a><del>￥	2880	</del><em>￥	399	</em></li>
<li><a href="	http://www.shopin.net/product/1534547.html" target="_blank"><img src="	http://images.shopin.net/images/58/2011/11/29/Pic1534547_132774_0_1.jpg"/>	<h3>	奥豹狐狸毛装饰渐变色皮衣	</h3></a><del>￥	8350	</del><em>￥	1380	</em></li>
<li><a href="	http://www.shopin.net/product/734512.html" target="_blank"><img src="	http://images.shopin.net/images/68/2011/11/18/Pic734512_152062_0_1.jpg"/>	<h3>	菲尔图黑灰牛绒皮毛一体高筒靴	</h3></a><del>￥	1780	</del><em>￥	333	</em></li>
<li><a href="	http://www.shopin.net/product/869032.html" target="_blank"><img src="	http://images.shopin.net/images/66/2011/07/20/Pic869032_114450_0_1.jpg"/>		<h3>	凯图TRV女式三合一冲锋衣	</h3></a><del>￥	1558	</del><em>￥	299	</em></li>
<li><a href="	http://www.shopin.net/product/1500665.html" target="_blank"><img src="	http://images.shopin.net/images/58/2011/11/03/Pic1500665_117419_0_1.jpg"/>		<h3>	WRC男士时尚棉外套	</h3></a><del>￥	980	</del><em>￥	196	</em></li>

      </ul>
    </div>    
  	<h4 class="newbrand"><a href="http://www.shopin.net/help/xinpinpai.html" target="_blank">更多&gt;&gt;</a></h4>
    <div class="zt-fcous">
		<div class="out-box">
			<ul>
					<li style="display:block;"><a href="http://www.shopin.net/promotion/6143.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/f1-1016.jpg"></a></li>
					<li><a href="http://www.shopin.net/promotion/6157.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/f2-1016.jpg"></a></li>
					<li><a href="http://www.shopin.net/promotion/6158.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/f3-1016.jpg"></a></li>
					<li><a href="http://www.shopin.net/promotion/6072.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/f4-1016.jpg"></a></li>
					<li><a href="http://www.shopin.net/promotion/6146.html" target="_blank"><img src="http://images.shopin.net/images/ad/xinpinpai/f5-1016.jpg"></a></li>
				</ul>
			<div class="focus-nav">
				<div class="num">
          <a class="cur"><img src="http://images.shopin.net/images/ad/xinpinpai/l1-1016.jpg" width="68" height="43"><span><h3>美国大牌服饰出清</h3><em>1-4.1折</em></span></a>
          <a><img src="http://images.shopin.net/images/ad/xinpinpai/l2-1016.jpg" width="68" height="43"><span><h3>意大利都彭皮鞋</h3><em>全场3-6折</em></span></a>
          <a><img src="http://images.shopin.net/images/ad/xinpinpai/l3-1016.jpg" width="68" height="43"><span><h3>优雅含蓄 真我个性</h3><em>秋冬新款6折</em></span></a>
          <a><img src="http://images.shopin.net/images/ad/xinpinpai/l4-1016.jpg" width="68" height="43"><span><h3>新款围巾 抢鲜入手</h3><em>全场2-5折</em></span></a>
          <a><img src="http://images.shopin.net/images/ad/xinpinpai/l5-1016.jpg" width="68" height="43"><span><h3>炫彩新品 快乐秋冬</h3><em>全场5折封</em></span></a>
				</div>
				<div class="text"><a></a><a></a><a></a><a></a><a></a></div>
			</div>
			</div>
	</div>
  </div>
<!--div id="summer_subnav" class="summer_subnav png">
  <a class="subnav-close" href="javascript:void(0);" title="关闭">关闭</a>
	<ul>
    <li><a href="#a" title="2012初冬新品">2012初冬新品</a></li>
		<li><a href="#a" title="女士冬装">女士冬装</a></li>
		<li><a href="#b" title="男士冬装">男士冬装</a></li>
		<li><a href="#c" title="儿童冬装">儿童冬装</a></li>
		<li><a href="#d" title="限量秒杀区">限量秒杀区</a></li>
		<li><a href="#e" title="本周新品牌">本周新品牌</a></li>
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
</script-->
</body>
</html>