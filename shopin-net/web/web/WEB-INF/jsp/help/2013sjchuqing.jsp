<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML>
<html lang="en-US">
<head>
<meta charset="utf-8">
<title>四季商品劲折出清,均价风暴,teemix,无色无味,捷希,李宁,ELLE,靴子,凉鞋,羽绒服,风衣,连衣裙,全场1-3折,2.18-2.27</title>
<style>

img {vertical-align:top}
.mt { margin-top:10px}
h2.hd{ height:38px; padding:8px 0 0 20px; margin-top:10px; overflow:hidden; text-align:left; font:600 26px/32px 'microsoft yahei','黑体'; color:#fff; background:#E94709}
h2.hd{ position:relative; height:38px; overflow:hidden; text-align:left;font:600 26px/32px 'microsoft yahei','黑体'; color:#fff; background:#E94709;}
h2.hd a.more { position:absolute; right:30px; top:20px; font:600 12px/20px 'simsun';color:#000}
.box {margin:10px auto}
/*product list*/
.prolist { margin:10px 0 0; overflow:hidden; zoom:1;}
.prolist li { float:left; _display:inline; width:132px; margin:0 0 10px 23px; text-align:center; position:relative}
.prolist li a:hover ,.prolist li a:hover h3{ color:#f60}
.prolist li img { width:130px; height:130px; border:1px solid #e2e2e2}
.prolist li h3 { height:20px; overflow:hidden; line-height:20px; font-weight:normal; color:#333}
.prolist li del { color:#676767}
.prolist li em { margin-left:10px; font-size:14px; font-weight:bold; color:#fc3400}
/*fcous*/
.zt-fcous{width:950px;height:513px;margin-top:10px;overflow:hidden;position:relative}
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
/*brand list*/
.brand-list li{float:left;width:228px;position:relative;margin:10px 0 0 7px ;_display:inline;cursor:pointer}
/*sprad*/
#sprad{ display:none; width:300px; height:220px; position:fixed; _position:absolute; bottom:0px; right:10px; z-index: 999; _bottom:auto; _width: 300px; _position: absolute;  _top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop, 10)||0)-(parseInt(this.currentStyle.marginBottom, 10)||0)));}
#sprad .spclose { float:right}
/*product list*/
.prolistred-top img { width:220px; height:220px;}
.prolistred { display:inline-block}
.prolistred-top{ text-align:center}
.prolistred li { float:left; _display:inline; overflow:hidden; zoom:1; width:220px; margin:20px 0 0 8px; text-align:center; position:relative; border:1px solid #E94709}
.prolistred li a:hover ,.prolistred li a:hover h3{ color:#000}
.prolistred li h3 { height:20px; overflow:hidden; line-height:20px; font:600 14px/26px 'microsoft yahei'; color:#000}
.prolistred li a:hover, .prolistred li a:hover h3 { color:#000}
.prolistred li del { line-height:24px; font-weight:600; color:#000}
.prolistred .proinfo { height:49px; padding:10px 0 0 20px; text-align:left; overflow:hidden; white-space:nowrap; background:url(http://images.shopin.net/images/ad/baonuan/logobg.png)}
.prolistred .proinfo img { width:77px; height:42px; margin:0 20px 0 0; vertical-align:middle}
.prolistred .proinfo a { display:block; font:600 24px/42px 'microsoft yahei'; color:#ff9}
.prolistred .proinfo a:hover { text-decoration:none}
.prolistred .cornermark { position: absolute; right: 5px; top: 5px; width: 71px; height:71px; overflow: hidden; text-align:center; font:800 18px/71px 'microsoft yahei'; color: #ff0; background: url(http://images.shopin.net/images/ad/2012shengdan/cornermark.png);}
/*prolistred*/
.prolistred-mr { width:234px; border:1px solid #E94709; float:left; margin:5px 2px 10px 0;}
.prolistred-down{ background:#E94709; display: inline-block; width:234px; height:65px;}
.prolistred-down-l img { width:80px; height:55px; margin:5px 5px;}
.prolistred-down-l { float:left; height:57px; line-height:57px;}
.prolistred-down-r { font:宋体; font-size:12px; line-height:24px; color:#fff; _display:inline; float:left; height:52px; width:140px; padding-top:10px; text-decoration:none; text-align:center;}
.prolistred-down-r p{ margin:0}
.prolistred-top img{ margin:0 auto;}
.c-fff000{ color:#fff000; font-size:16px; padding-left:10px;}
.marg-r-0{ margin-right:0}
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
</head>

<body>
<div class="box">
	<img src="http://images.shopin.net/images/ad/2013sjchuqing/top01.jpg"><img src="http://images.shopin.net/images/ad/2013sjchuqing/top02.jpg"><img src="http://images.shopin.net/images/ad/2013sjchuqing/bannner01.jpg">
  <div class="zt-fcous">
    <div class="out-box">
      <ul>
<li style="display:block;"><a href="http://www.shopin.net/promotion/6338.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013sjchuqing/f1.jpg" /></a></li>		
<li><a href="http://www.shopin.net/promotion/4406.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013sjchuqing/f2.jpg" /></a></li>		
<li><a href="http://www.shopin.net/promotion/5975.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013sjchuqing/f3.jpg" /></a></li>		
<li><a href="http://www.shopin.net/promotion/6727.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013sjchuqing/f4.jpg" /></a></li>
<li><a href="http://www.shopin.net/promotion/6548.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013sjchuqing/f5.jpg" /></a></li>		
<li><a href="http://www.shopin.net/promotion/5936.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013sjchuqing/f6.jpg" /></a></li>
<li><a href="http://www.shopin.net/promotion/6436.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013sjchuqing/f7.jpg" /></a></li>
      </ul>
      <div class="focus-nav">
        <div class="num">
<a class="cur"><img src="http://images.shopin.net/images/brand/247_2.jpg" width="68" height="43" /><span><h3>四季美鞋出清专场</h3><em>靴子 单鞋
 1-3折</em></span></a>
<a><img src="http://images.shopin.net/images/brand/1297_2.jpg" width="68" height="43" /><span><h3>纯天然舒适面料 超值四季装</h3><em>针织衫 休闲 1-3折</em></span></a>
<a><img src="http://images.shopin.net/images/brand/236_2.jpg" width="68" height="43" /><span><h3>意大利优雅女鞋出清</h3><em>靴子 凉鞋 1-3折</em></span></a>
<a><img src="http://images.shopin.net/images/brand/537_2.jpg" width="68" height="43" /><span><h3>春装惠集 换季超值购</h3><em>运动裤 2.7折起</em></span></a>
<a><img src="http://images.shopin.net/images/brand/1422_2.jpg" width="68" height="43" /><span><h3>羊毛衫 混绒衫 底价出清</h3><em>直降30% ￥49起</em></span></a>
<a><img src="http://images.shopin.net/images/brand/452_2.jpg" width="68" height="43" /><span><h3>职场/新婚 超值专场</h3><em>西服 衬衫 1-3折</em></span></a>
<a><img src="http://images.shopin.net/images/brand/285_2.jpg" width="68" height="43" /><span><h3>时尚气质童装 超值专场</h3><em>裙子 短裤 1-3折</em></span></a>
        </div>
        <div class="text"><a></a><a></a><a></a><a></a><a></a><a></a><a></a></div>
      </div>
    </div>
  </div>
  
<div class="sales">
	<h2 class="hd"><a class="more" href="http://www.shopin.net/lady/list---0.05-0.3-----.html" target="_blank">更多&gt;&gt;</a>春秋装出清区<span style=" margin:0 0 0 20px; font-size:12px; color:#FFF; font:宋体; font-weight:100"><a href="http://www.shopin.net/list--1269---1-199---1-.html" target="_blank" style=" text-decoration:none; color:#FFF">甜美连衣裙精选</a> <a href="http://www.shopin.net/shoes/list--1379--------.html" target="_blank" style=" text-decoration:none; color:#FFF">时尚女鞋精选</a> <a href="http://www.shopin.net/list--1231------0-1-.html" target="_blank" style=" text-decoration:none; color:#FFF">白领换季百搭</a> <a href="http://www.shopin.net/outdoor/list---0.05-0.3-----.html" target="_blank" style=" text-decoration:none; color:#FFF">户外新品抢鲜</a></span></h2>
    <a href="http://www.shopin.net/promotion/6882.html" target="_blank"><img src="http://images.shopin.net/images//promotions/201302171717161.jpg"></a>
</div>

<div class="prolistred">

    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1464779.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/02/22/Pic1464779_123079_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/1818_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>huayin淑女百搭连衣裙</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥780</del><strong class="c-fff000">￥80</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/742912.html" target="_blank"><img src="http://images.shopin.net/images/68/2011/12/23/Pic742912_7196_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/153_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>纳纹羊毛拼接可爱连衣裙</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥596</del><strong class="c-fff000">￥99</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/2197035.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/02/01/Pic2197035_218940_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/2528_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>娜妍气质性感纯色连衣裙</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥799</del><strong class="c-fff000">￥138</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr marg-r-0">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1739135.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/04/08/Pic1739135_161797_0.resize_to.220x220.jpg "></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/2391_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>WAYONLY甜美条纹连衣裙</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥599</del><strong class="c-fff000">￥46</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
</div>

    <a href="http://www.shopin.net/promotion/6655.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013sjchuqing/img003.jpg"></a>

<div class="prolistred">

    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/2158471.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/12/18/Pic2158471_37189_0.resize_to.220x220.jpg "></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/969_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>百思图职场百搭拼色单鞋</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥839</del><strong class="c-fff000">￥198</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/2067079.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/02/Pic2067079_13338_0.resize_to.220x220.jpg "></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/249_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>BELLE深口通勤高跟鞋</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥899</del><strong class="c-fff000">￥299</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/2078309.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/16/Pic2078309_13298_0.resize_to.220x220.jpg "></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/249_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>TATA新款尖头细跟女单鞋</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥769</del><strong class="c-fff000">￥239</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr marg-r-0">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1998076.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/08/28/Pic1998076_197019_0.resize_to.220x220.jpg "></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/882_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>BELLE浅咖色牛皮女鞋</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥798</del><strong class="c-fff000">￥239</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
</div>

    <a href="http://www.shopin.net/promotion/6886.html" target="_blank"><img src="http://images.shopin.net/images//promotions/201302171719021.jpg"></a>

<div class="prolistred">

    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/84440.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/04/12/Pic84440_24093_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/408_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>IVRESSE气质抽绳长款风衣</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥1280</del><strong class="c-fff000">￥100</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/2018504.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/15/Pic2018504_177911_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/2226_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>RBCA长款收腰翻领风衣</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥899</del><strong class="c-fff000">￥250</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1711563.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/05/11/Pic1711563_18274_0.resize_to.220x220.jpg "></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/472_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>KSTYLE手提斜挎两用美包</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥998</del><strong class="c-fff000">￥299</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr marg-r-0">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1985746.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/08/21/Pic1985746_70437_0.resize_to.220x220.jpg "></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/1095_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>黑田粉紫色淡雅丝巾</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥288</del><strong class="c-fff000">￥144</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
</div>

    <a href="http://www.shopin.net/promotion/6883.html" target="_blank"><img src="http://images.shopin.net/images//promotions/201302171750101.jpg"></a>

<div class="prolistred">

    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1177660.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013sjchuqing/img001.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/592_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>kappa女式针织帽衫</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥438</del><strong class="c-fff000">￥131</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/2186744.html" target="_blank"><img src="http://images.shopin.net/images/66/2013/01/17/Pic2186744_20581_0.resize_to.220x220.jpg "></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/1038_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>Levi's男款网络直供仔裤</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥799</del><strong class="c-fff000">￥399</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/2150063.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/12/26/Pic2150063_47576_0.resize_to.220x220.jpg "></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/921_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>PONY男式板鞋</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥599</del><strong class="c-fff000">￥179</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr marg-r-0">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1329063.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/05/23/Pic1329063_109775_0.resize_to.220x220.jpg "></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/1739_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>SWISSWIN双肩电脑背包</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥798</del><strong class="c-fff000">￥238</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
</div>

    <a href="http://www.shopin.net/promotion/5125.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013sjchuqing/img004.jpg"></a>

<div class="prolistred">

    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1479114.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/10/21/Pic1479114_135683_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/1895_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>圣弗莱时尚女士冲锋衣</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥948</del><strong class="c-fff000">￥189</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1958751.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/07/30/Pic1958751_192325_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/2264_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>Topland男士薄抓绒衣</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥768</del><strong class="c-fff000">￥230</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/2081250.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/25/Pic2081250_181973_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/2264_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>Topland轻便登山鞋</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥858</del><strong class="c-fff000">￥214</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr marg-r-0">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/2015483.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/11/02/Pic2015483_109775_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/1739_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>SWISSWIN双肩户外包</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥665</del><strong class="c-fff000">￥198</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
</div>

<div class="sales">
	<h2 class="hd"><a class="more" href="http://www.shopin.net/lady/list---0.05-0.3-----.html" target="_blank">更多&gt;&gt;</a>夏装出清区<span style=" margin:0 0 0 20px; font-size:12px; color:#FFF; font:宋体; font-weight:100"><a href="http://www.shopin.net/list--1269---78-9999--0--.html" target="_blank" style=" text-decoration:none; color:#FFF">时尚连衣裙</a> <a href="http://www.shopin.net/man/list--1058--------.html" target="_blank" style=" text-decoration:none; color:#FFF">POLO衫</a> <a href="http://www.shopin.net/sports/list--1573--------.html" target="_blank" style=" text-decoration:none; color:#FFF">泳装</a></span></h2>
    <a href="http://www.shopin.net/promotion/4487.html" target="_blank"><img src="http://images.shopin.net/images//promotions/201302171710181.jpg"></a>
</div>

<div class="prolistred">
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1746438.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/04/17/Pic1746438_104920_0.resize_to.220x220.jpg "></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/1671_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>B.SIQI黑白复古连衣裙</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥1190</del><strong class="c-fff000">￥261</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1993005.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/08/22/Pic1993005_709_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/50_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>百图甜美碎花收腰连衣裙</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥559</del><strong class="c-fff000">￥167</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/279090.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013sjchuqing/img002.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/187_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>菲尔图复古流苏细跟凉鞋</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥588</del><strong class="c-fff000">￥99</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr marg-r-0">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1170956.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/05/03/Pic1170956_29173_0.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/185_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>卡曼尼时尚镂空百搭凉鞋</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥690</del><strong class="c-fff000">￥99</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
</div>
    <a href="http://www.shopin.net/promotion/6885.html" target="_blank"><img src="http://images.shopin.net/images//promotions/201302181001071.jpg"></a>
</div>

<div class="prolistred">
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/251352.html" target="_blank"><img src="http://images.shopin.net/images/58/2010/06/12/Pic251352_15566_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/138_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>洛萨里奥条纹POLO衫</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥590</del><strong class="c-fff000">￥90</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1782510.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/05/08/Pic1782510_16412_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/434_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>大卫山时尚POLO衫</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥980</del><strong class="c-fff000">￥142</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1791196.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/05/10/Pic1791196_134825_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/412_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>帕古茨纯棉休闲长裤</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥1280</del><strong class="c-fff000">￥190</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr marg-r-0">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1498961.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/10/31/Pic1498961_14626_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/361_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>九牧王纯棉休闲长裤</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥725</del><strong class="c-fff000">￥198</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
</div>
    <a href="http://www.shopin.net/promotion/6888.html" target="_blank"><img src="http://images.shopin.net/images//promotions/201302180959481.jpg"></a>


<div class="prolistred">
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1848717.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/06/06/Pic1848717_22207_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/616_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>PAYA女款连体泳装</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥358</del><strong class="c-fff000">￥59</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1096684.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/04/16/Pic1096684_25776_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/1964_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>hosa女款性感分体泳装</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥420</del><strong class="c-fff000">￥99</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1800418.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/05/22/Pic1800418_116113_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/1773_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>蝶姿男款泳裤</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥148</del><strong class="c-fff000">￥59</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr marg-r-0">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1834258.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/06/01/Pic1834258_176439_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/1181_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>竞浪儿童连体泳装</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥368</del><strong class="c-fff000">￥139</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
</div>

<div class="sales">
	<h2 class="hd"><a class="more" href="http://www.shopin.net/list--1740-0.1-0.3-----1-.html" target="_blank">更多&gt;&gt;</a>冬装出清区<span style=" margin:0 0 0 20px; font-size:12px; color:#FFF; font:宋体; font-weight:100"><a href="http://www.shopin.net/list--1740-0.05-0.3-----1-.html" target="_blank" style=" text-decoration:none; color:#FFF">超值羽绒出清</a> <a href="http://www.shopin.net/list--1720-0.05-0.3-----1-.html" target="_blank" style=" text-decoration:none; color:#FFF">炫彩羊毛/羊绒衫聚惠</a></span></h2>
    <a href="http://www.shopin.net/promotion/6887.html" target="_blank"><img src="http://images.shopin.net/images//promotions/201302180945551.jpg"></a>
</div>

<div class="prolistred">
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/886978.html" target="_blank"><img src="http://images.shopin.net/images/61/2013/01/31/Pic886978_72523_0.resize_to.640x640.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/1386_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>TEXWOOD短款无帽羽绒服</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥1199</del><strong class="c-fff000">￥299</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/2138731.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/27/Pic2138731_194377_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/2040_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>聊黛部儿短款连帽羽绒服</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥2754</del><strong class="c-fff000">￥303</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1534843.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/11/23/Pic1534843_131135_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/1865_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>玛卡西尼短款毛领羽绒服</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥899</del><strong class="c-fff000">￥269</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr marg-r-0">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/2137638.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/28/Pic2137638_134904_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/412_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>帕古茨气质短款羽绒服</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥3760</del><strong class="c-fff000">￥940</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
</div>
    <a href="http://www.shopin.net/promotion/6166.html" target="_blank"><img src="http://images.shopin.net/images//promotions/201302180944031.jpg"></a>


<div class="prolistred">
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/1363512.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/08/18/Pic1363512_11107_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/319_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>红蜻蜓细跟时尚裸靴</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥599</del><strong class="c-fff000">￥162</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/2035773.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/09/17/Pic2035773_15374_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/255_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>CNE亮片装饰牛皮短靴</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥1299</del><strong class="c-fff000">￥299</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/2113796.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/11/26/Pic2113796_173240_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/1198_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>KUUKI高贵兔毛短靴</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥1189</del><strong class="c-fff000">￥299</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->
    <div class="prolistred-mr marg-r-0">
         <div class="prolistred-top">
              <a href="http://www.shopin.net/product/755631.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/10/21/Pic755631_82501_0.resize_to.220x220.jpg"></a>
         </div><!--prolistred-top-->
<div class="prolistred-down">
              <div class="prolistred-down-l"><a href=""><img src="http://images.shopin.net/images//brand/187_2.jpg"></a></div>
              <div class="prolistred-down-r">
              		<p>菲尔图细跟异域风情短靴</p>
                    <p style="margin:0 auto; text-align:center;"><del>￥1180</del><strong class="c-fff000">￥263</strong></p>
              </div>
         </div><!--prolistred-down-->
    </div><!--prolistred-mr-->

</div>
<!--右下角广告
<div id="sprad"><a class="spclose" href="javascript:void(0);">关闭</a><a href="http://www.egou.com/club/qiandao/qiandao.htm?id=1420" target="_blank"><img src="http://images.shopin.net/images/ad/ygqd/popbox.jpg" width="300" height="200"></a></div>
<script>
$(function(){
	setTimeout(function(){
			$("#sprad").slideDown();
	},7000)
	$("#sprad a").click(function(){
		$("#sprad").hide();
	});
});
</script>-->
<!--右下角广告-->
</body>
</html>