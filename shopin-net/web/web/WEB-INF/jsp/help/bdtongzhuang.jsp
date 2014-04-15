<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>商场品牌童装，水孩儿/菲格咪妮/OSHKOSH B’gosh/巴布豆/常春藤/迪士尼/昱璐/法米尼等价格区间:150元封</title>
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
<style>
img { vertical-align: top; border: none }
.clear:after { height: 0; clear: both; content: "."; visibility: hidden; display: block; }
.zm { zoom: 1 }
.box { margin: 10px 0; background: #f4e8dc }
/*box*/
h2.hd { height: 48px; text-align: center; font: 600 28px/48px 'microsoft yahei', '黑体'; color: #fff; position: relative; background: #9a3f66 }
.slist { float: right; width: 694px; margin: 10px 0 0 -78px; *zoom:1
}
.area-ad { float: left }
.area-ad a { float: left; width: 245px }
.slist li { float: left; width: 341px; margin: 6px 6px 0 0 }
/*fcous*/
.zt-fcous { width: 950px; height: 513px; overflow: hidden; position: relative; border-top: 10px solid #e71f46 }
.out-box { width: 950px; height: 513px; display: table; }
.focus-nav { display: table-cell; vertical-align: middle; position: relative; *position:absolute;
right: 0; *top:50%;
z-index: 5; pointer-events: none; }
.focus-nav .num, .focus-nav .text { width: 215px; float: right; position: relative; *position:relative;
*top:-50%;
right: 0; }
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
/*product list*/
.prolist { overflow: hidden; margin: 15px 0 0 0; zoom: 1 }
.prolist li { float: left; _display: inline; width: 132px; margin: 0 0 12px 22px; text-align: center; position: relative }
.prolist li a:hover, .prolist li a:hover h3 { color: #f60 }
.prolist li img { width: 130px; height: 130px; border: 1px solid #e2e2e2 }
.prolist li h3 { height: 20px; overflow: hidden; line-height: 20px; font-weight: normal; color: #000 }
.prolist li del { color: #676767 }
.prolist li em { margin-left: 10px; font-size: 14px; font-weight: bold; color: #fd3400 }
.prolist .starprice { line-height: 20px; text-align: center; overflow: hidden; font-weight: bold; color: #f15930; }
.prolist .save { width: 110px; height: 20px; margin: 3px auto 0; text-align: center; font-weight: bold; background: #f25930; color: #fff601 }
.prolist .cornermark { position: absolute; right: 5px; top: 5px; width: 54px; height: 54px; line-height: 20px; overflow: hidden; font-weight: 600; color: #ff0; background: url(http://images.shopin.net/images/ad/ganen1113/cornermark.png) }
.prolist .cornermark s { display: block; height: 12px; line-height: 12px; padding-top: 13px; text-decoration: none; }
/*brnad list*/
.blist { margin: 20px 0 0 1px }
.blist li { float: left; _display: inline; width: 130px; margin-left: 24px; text-align: center; line-height: 28px; font-weight: bold }
.blist li a { color: #000 }
.blist li img { display: block; width: 128px; height: 88px }
</style>
</head>

<body>
  <div class="box"> <img src="http://images.shopin.net/images/ad/bdtongzhuang/top-ad1.jpg"><img src="http://images.shopin.net/images/ad/bdtongzhuang/top-ad2.jpg"><img src="http://images.shopin.net/images/ad/bdtongzhuang/top-ad3.jpg">
    <div class="zt-fcous">
      <div class="out-box">
        <ul>
          <li style="display:block;"><a href="http://www.shopin.net/promotion/6342.html" target="_blank"><img src="http://images.shopin.net/images/ad/bdtongzhuang/f1.jpg"></a></li>
          <li><a href="http://www.shopin.net/promotion/6120.html" target="_blank"><img src="http://images.shopin.net/images/ad/bdtongzhuang/f2.jpg"></a></li>
          <li><a href="http://www.shopin.net/children/list--1141--------/1.html" target="_blank"><img src="http://images.shopin.net/images/ad/bdtongzhuang/f3.jpg"></a></li>
          <li><a href="http://www.shopin.net/children/list--1134-0.05-0.3------.html" target="_blank"><img src="http://images.shopin.net/images/ad/bdtongzhuang/f4.jpg"></a></li>
          <li><a href="http://www.shopin.net/promotion/6411.html" target="_blank"><img src="http://images.shopin.net/images/ad/bdtongzhuang/f5.jpg"></a></li>
        </ul>
        <div class="focus-nav">
          <div class="num"><a class="cur"><span>
            <h3>劲爆羽绒 特惠抢先</h3>
            <em>新款半价</em></span></a><a><span>
            <h3>保暖鞋履 HOLD住寒冬</h3>
            <em>3折起</em></span></a><a><span>
            <h3>纯棉内衣精品大促</h3>
            <em>3-6折</em></span></a><a><span>
            <h3>魅力长裤 休闲百搭</h3>
            <em>3折封</em></span></a><a><span>
            <h3>舒适毛衫 温暖一冬</h3>
            <em>5折封</em></span></a></div>
          <div class="text"><a></a><a></a><a></a><a></a><a></a></div>
        </div>
      </div>
    </div>
    <img src="http://images.shopin.net/images/ad/bdtongzhuang/t1.png">
    <ul class="prolist">
<li><a href="http://www.shopin.net/product/1806181.html" target="_blank"><img src="http://images.shopin.net/images//60/2012/06/14//Pic1806181_6074_0_1.jpg" /><h3>迪士尼卡通蝴蝶结装饰纯棉圆边帽</h3></a><del>￥70</del><em>￥42</em></li>
<li><a href="http://www.shopin.net/product/1810704.html" target="_blank"><img src="http://images.shopin.net/images//58/2012/07/09//Pic1810704_132499_0_1.jpg" /><h3>Barbie女童最爱卡通斜挎包</h3></a><del>￥180</del><em>￥108</em></li>
<li><a href="http://www.shopin.net/product/2126674.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/11/13//Pic2126674_193502_0_1.jpg" /><h3>小猪班纳圆领彩条羊毛衫</h3></a><del>￥269</del><em>￥134</em></li>
<li><a href="http://www.shopin.net/product/1952703.html" target="_blank"><img src="http://images.shopin.net/images//60/2012/07/24//Pic1952703_113984_0_1.jpg" /><h3>水孩儿女童圆领雪花装饰针织衫</h3></a><del>￥269</del><em>￥107</em></li>
<li><a href="http://www.shopin.net/product/2054287.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/09/29/Pic2054287_75264_0_1.jpg" /><h3>OSHKOSH B'gosh女童纯色花边连帽衫</h3></a><del>￥288</del><em>￥144</em></li>
<li><a href="http://www.shopin.net/product/1410334.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/03/21/Pic1410334_103539_0_1.jpg" /><h3>昱璐女童休闲条纹针织外套</h3></a><del>￥199</del><em>￥94</em></li>
<li><a href="http://www.shopin.net/product/1463467.html" target="_blank"><img src="http://images.shopin.net/images//60/2011/10/12//Pic1463467_1402_0_1.jpg" /><h3>艾艾屋毛领带帽军扣装饰棉服</h3></a><del>￥359</del><em>￥99</em></li>
<li><a href="http://www.shopin.net/product/1495305.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/10/27/Pic1495305_152213_0_1.jpg" /><h3>迪士尼亮面毛毛领时尚棉服</h3></a><del>￥269</del><em>￥134</em></li>
<li><a href="http://www.shopin.net/product/1595137.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/09/28/Pic1595137_161204_0_1.jpg" /><h3>汪小荷中国红毛领绣花装饰羽绒服</h3></a><del>￥599</del><em>￥149</em></li>
<li><a href="http://www.shopin.net/product/929929.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/08/28/Pic929929_99793_0_1.jpg" /><h3>韦氏女童长款亮面收腰鸭绒羽绒服</h3></a><del>￥538</del><em>￥150</em></li>
<li><a href="http://www.shopin.net/product/2118702.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/11/07//Pic2118702_210660_0_1.jpg" /><h3>永高人女童加绒雪地靴</h3></a><del>￥350</del><em>￥98</em></li>
<li><a href="http://www.shopin.net/product/2081077.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/10/17//Pic2081077_28602_0_1.jpg" /><h3>ABCKIDS女童亮面加绒小棉靴</h3></a><del>￥250</del><em>￥150</em></li>
    </ul>
    <h2 class="hd">宝宝羽绒/棉衣单品</h2>
    <ul class="prolist">
<li><a href="http://www.shopin.net/product/1978701.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/08/11/Pic1978701_114005_0_1.jpg" /><h3>水孩儿专柜正品2012外套UD1123</h3></a><del>￥259</del><em>￥103</em></li>
<li><a href="http://www.shopin.net/product/2075371.html" target="_blank"><img src="http://images.shopin.net/images//58/2012/10/12//Pic2075371_205165_0_1.jpg" /><h3>小猪班纳短款连帽棉服</h3></a><del>￥299</del><em>￥149</em></li>
<li><a href="http://www.shopin.net/product/1508216.html" target="_blank"><img src="http://images.shopin.net/images//58/2011/11/03//Pic1508216_104652_0_1.jpg" /><h3>空中天使女童亮面拉链棉服</h3></a><del>￥359</del><em>￥124</em></li>
<li><a href="http://www.shopin.net/product/2647.html" target="_blank"><img src="http://images.shopin.net/images/58/2010/08/26/Pic2647_1464_0_1.jpg" /><h3>艾艾屋专柜正品2011外套WND03</h3></a><del>￥359</del><em>￥107</em></li>
<li><a href="http://www.shopin.net/product/1593541.html" target="_blank"><img src="http://images.shopin.net/images//58/2012/09/28//Pic1593541_160224_0_1.jpg" /><h3>汪小荷传统民族风格棉服</h3></a><del>￥299</del><em>￥149</em></li>
<li><a href="http://www.shopin.net/product/1418365.html" target="_blank"><img src="http://images.shopin.net/images//60/2011/09/16//Pic1418365_93127_0_1.jpg" /><h3>常春藤女童翻领系扣棉服</h3></a><del>￥528</del><em>￥132</em></li>
<li><a href="http://www.shopin.net/product/725624.html" target="_blank"><img src="http://images.shopin.net/images//60/2011/10/10//Pic725624_54973_0_1.jpg" /><h3>昱璐长款纯色鸭绒羽绒服</h3></a><del>￥589</del><em>￥139</em></li>
<li><a href="http://www.shopin.net/product/1976818.html" target="_blank"><img src="http://images.shopin.net/images//58/2012/08/11//Pic1976818_182704_0_1.jpg" /><h3>小猪班纳时尚亮面羽绒马甲</h3></a><del>￥299</del><em>￥149</em></li>
<li><a href="http://www.shopin.net/product/720367.html" target="_blank"><img src="http://images.shopin.net/images//60/2010/12/08//Pic720367_78083_0_1.jpg" /><h3>韦氏保暖羽绒外套</h3></a><del>￥179</del><em>￥79</em></li>
<li><a href="http://www.shopin.net/product/2109186.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/11/01//Pic2109186_204920_0_1.jpg" /><h3>麻希玛柔英伦风斜插兜棉服</h3></a><del>￥279</del><em>￥84</em></li>
<li><a href="http://www.shopin.net/product/1445316.html" target="_blank"><img src="http://images.shopin.net/images//60/2011/09/29//Pic1445316_114024_0_1.jpg" /><h3>水孩儿男童格连帽棉服</h3></a><del>￥359</del><em>￥107</em></li>
<li><a href="http://www.shopin.net/product/809470.html" target="_blank"><img src="http://images.shopin.net/images//58/2010/11/25//Pic809470_5011_0_1.jpg" /><h3>巴布豆卡通印花拉链棉服</h3></a><del>￥398</del><em>￥119</em></li>
<li><a href="http://www.shopin.net/product/2039094.html" target="_blank"><img src="http://images.shopin.net/images//60/2012/09/19//Pic2039094_200363_0_1.jpg" /><h3>小猪班纳男童缩口斜纹格棉服</h3></a><del>￥269</del><em>￥134</em></li>
<li><a href="http://www.shopin.net/product/2062585.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/09/30//Pic2062585_114915_0_1.jpg" /><h3>迪士尼男童内加绒卡通棉袄</h3></a><del>￥328</del><em>￥131</em></li>
<li><a href="http://www.shopin.net/product/722021.html" target="_blank"><img src="http://images.shopin.net/images//60/2010/09/19//Pic722021_251_0_1.jpg" /><h3>小汽车男童混色卡通连帽棉服</h3></a><del>￥399</del><em>￥135</em></li>
<li><a href="http://www.shopin.net/product/975383.html" target="_blank"><img src="http://images.shopin.net/images//60/2012/11/01//Pic975383_132451_0_1.jpg" /><h3>韦氏长款鸭绒羽绒服</h3></a><del>￥489</del><em>￥150</em></li>
<li><a href="http://www.shopin.net/product/1483293.html" target="_blank"><img src="http://images.shopin.net/images//66/2011/11/03//Pic1483293_54973_0_1.jpg" /><h3>昱璐短款绒毛领羽绒服</h3></a><del>￥429</del><em>￥139</em></li>
<li><a href="http://www.shopin.net/product/2005236.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/09/24//Pic2005236_93331_0_1.jpg" /><h3>大力水手休闲系扣翻领羽绒外套</h3></a><del>￥430</del><em>￥129</em></li>
    </ul>
    <h2 class="hd">宝宝冬鞋单品</h2>
    <ul class="prolist">
<li><a href="http://www.shopin.net/product/1958241.html" target="_blank"><img src="http://images.shopin.net/images//58/2012/07/27//Pic1958241_116579_0_1.jpg" /><h3>小叮当时尚女童闪钻装饰皮靴</h3></a><del>￥298</del><em>￥149</em></li>
<li><a href="http://www.shopin.net/product/2112485.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/11/02//Pic2112485_48504_0_1.jpg" /><h3>史努比女童粉色远点棉靴</h3></a><del>￥148</del><em>￥74</em></li>
<li><a href="http://www.shopin.net/product/2118744.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/11/06//Pic2118744_210660_0_1.jpg" /><h3>永高人女童加绒翻毛雪地靴</h3></a><del>￥238</del><em>￥78</em></li>
<li><a href="http://www.shopin.net/product/1420886.html" target="_blank"><img src="http://images.shopin.net/images//58/2011/11/16//Pic1420886_154679_0_1.jpg" /><h3>ABCKIDS女童高筒加棉棉靴</h3></a><del>￥368</del><em>￥138</em></li>
<li><a href="http://www.shopin.net/product/1528163.html" target="_blank"><img src="http://images.shopin.net/images//58/2011/11/17//Pic1528163_2318_0_1.jpg" /><h3>DorDor House女童牛皮中筒靴</h3></a><del>￥538</del><em>￥190</em></li>
<li><a href="http://www.shopin.net/product/2113943.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/11/02/Pic2113943_28602_0_1.jpg" /><h3>ABCKIDS女童时尚亮面翻毛棉鞋</h3></a><del>￥248</del><em>￥149</em></li>
<li><a href="http://www.shopin.net/product/2118749.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/11/12//Pic2118749_211283_0_1.jpg" /><h3>永高人男款时尚运动单鞋</h3></a><del>￥192</del><em>￥77</em></li>
<li><a href="http://www.shopin.net/product/1367472.html" target="_blank"><img src="http://images.shopin.net/images//66/2011/09/05//Pic1367472_114865_0_1.jpg" /><h3>李宁时尚男童运动单鞋</h3></a><del>￥249</del><em>￥142</em></li>
<li><a href="http://www.shopin.net/product/1496537.html" target="_blank"><img src="http://images.shopin.net/images//58/2011/10/27//Pic1496537_2792_0_1.jpg" /><h3>史努比卡通印花系带篮球鞋</h3></a><del>￥398</del><em>￥120</em></li>
<li><a href="http://www.shopin.net/product/2112475.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/11/02//Pic2112475_150356_0_1.jpg" /><h3>史努比卡通帆布休闲小棉鞋</h3></a><del>￥148</del><em>￥74</em></li>
<li><a href="http://www.shopin.net/product/7248.html" target="_blank"><img src="http://images.shopin.net/images//58/2010/10/12//Pic7248_3163_0_1.jpg" /><h3>JEEP男童复古系带棉靴</h3></a><del>￥298</del><em>￥120</em></li>
<li><a href="http://www.shopin.net/product/1484354.html" target="_blank"><img src="http://images.shopin.net/images//58/2011/10/25//Pic1484354_28662_0_1.jpg" /><h3>ABCKIDS男童纯色牛皮短靴</h3></a><del>￥386</del><em>￥119</em></li>
    </ul>
    <h2 class="hd">宝宝卫衣  针织单品</h2>
    <ul class="prolist">
<li><a href="http://www.shopin.net/product/575696.html" target="_blank"><img src="http://images.shopin.net/images//60/2010/08/12//Pic575696_1815_0_1.jpg" /><h3>法米尼圆领卡通小熊刺绣羊毛衫</h3></a><del>￥298</del><em>￥89</em></li>
<li><a href="http://www.shopin.net/product/1631052.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/09/17//Pic1631052_198971_0_1.jpg" /><h3>大力水手翻领卡通图案针织衫</h3></a><del>￥199</del><em>￥60</em></li>
<li><a href="http://www.shopin.net/product/641563.html" target="_blank"><img src="http://images.shopin.net/images//58/2010/08/27//Pic641563_197_0_1.jpg" /><h3>菲格咪妮圆领草莓花边毛衫</h3></a><del>￥338</del><em>￥118</em></li>
<li><a href="http://www.shopin.net/product/2012128.html" target="_blank"><img src="http://images.shopin.net/images//60/2012/08/30//Pic2012128_193380_0_1.jpg" /><h3>空中天使高领纯色打底毛衫</h3></a><del>￥299</del><em>￥148</em></li>
<li><a href="http://www.shopin.net/product/2040785.html" target="_blank"><img src="http://images.shopin.net/images//60/2012/10/10//Pic2040785_6192_0_1.jpg" /><h3>巴布豆半高领彩条纹羊毛衫</h3></a><del>￥368</del><em>￥128</em></li>
<li><a href="http://www.shopin.net/product/960757.html" target="_blank"><img src="http://images.shopin.net/images//66/2011/11/23//Pic960757_103539_0_1.jpg" /><h3>昱璐女童系扣连帽针织衫</h3></a><del>￥299</del><em>￥119</em></li>
<li><a href="http://www.shopin.net/product/1317109.html" target="_blank"><img src="http://images.shopin.net/images//58/2011/07/21//Pic1317109_87687_0_1.jpg" /><h3>常春藤圆领条纹羊毛衫</h3></a><del>￥348</del><em>￥87</em></li>
<li><a href="http://www.shopin.net/product/1633226.html" target="_blank"><img src="http://images.shopin.net/images//60/2012/03/04//Pic1633226_163751_0_1.jpg" /><h3>迪士尼衬衫领成熟针织衫</h3></a><del>￥219</del><em>￥110</em></li>
<li><a href="http://www.shopin.net/product/2011545.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/09/01//Pic2011545_5121_0_1.jpg" /><h3>巴布豆圆领卡通羊毛衫</h3></a><del>￥348</del><em>￥139</em></li>
<li><a href="http://www.shopin.net/product/778905.html" target="_blank"><img src="http://images.shopin.net/images//60/2010/11/24//Pic778905_1518_0_1.jpg" /><h3>艾艾屋菱格衬衫领V领毛衫</h3></a><del>￥256</del><em>￥106</em></li>
<li><a href="http://www.shopin.net/product/1521948.html" target="_blank"><img src="http://images.shopin.net/images//60/2011/11/14//Pic1521948_855_0_1.jpg" /><h3>空中天使圆领条纹针织衫</h3></a><del>￥219</del><em>￥75</em></li>
<li><a href="http://www.shopin.net/product/2039836.html" target="_blank"><img src="http://images.shopin.net/images//58/2012/10/02//Pic2039836_201727_0_1.jpg" /><h3>水孩儿侧开口小怪物彩条针织衫</h3></a><del>￥249</del><em>￥124</em></li>
    </ul>
    <ul class="blist">
<li><a href="http://www.shopin.net/children/brands/10.html" target="_blank"><img src="http://images.shopin.net/images/brand/10_2.jpg" alt="昱璐">昱璐</a></li>
<li><a href="http://www.shopin.net/children/brands/262.html" target="_blank"><img src="http://images.shopin.net/images/brand/262_2.jpg" alt="迪士尼">迪士尼</a></li>
<li><a href="http://www.shopin.net/children/brands/46.html" target="_blank"><img src="http://images.shopin.net/images/brand/46_2.jpg" alt="巴布豆">巴布豆</a></li>
<li><a href="http://www.shopin.net/children/brands/1540.html" target="_blank"><img src="http://images.shopin.net/images/brand/1540_2.jpg" alt="常春藤">常春藤</a></li>
<li><a href="http://www.shopin.net/children/brands/48.html" target="_blank"><img src="http://images.shopin.net/images/brand/48_2.jpg" alt="菲格咪妮">菲格咪妮</a></li>
<li><a href="http://www.shopin.net/children/brands/1770.html" target="_blank"><img src="http://images.shopin.net/images/brand/1770_2.jpg" alt="水孩儿">水孩儿</a></li>
    </ul>
  </div>
</body>
</html>
