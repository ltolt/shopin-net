<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>男人换装季,男人节,男人装备,省钱,全场半价,satchi,雅戈尔,九牧王,帕古茨,衬衫,polo衫,裤子,皮鞋,腰带,万款2012新品折上直降10%,2012.8.1-8.14</title>
<link href="http://images.shopin.net/images/ad/nanrenjie/nanrenjie.css" rel="stylesheet">
<script type="text/javascript" src="http://images.shopin.net/js/jquery/jquery132min.js"></script>
<script type="text/javascript">
/*首页广告效果*/
$(function(){
   var len  = $(".num > li").length;
	 var index = 0;
	 var adTimer;
	 $(".num li").mouseover(function(){
		index  =   $(".num li").index(this);
		showImg(index);
	 }).eq(0).mouseover();
	 //滑入 停止动画，滑出开始动画.
	 $('.ad').hover(function(){
			 clearInterval(adTimer);
		 },function(){
			 adTimer = setInterval(function(){
			    showImg(index)
				index++;
				if(index==len){index=0;}
			  } , 4000);
	 }).trigger("mouseleave");
})
// 通过控制top ，来显示不同的幻灯片
function showImg(index){
    var adHeight = $(".zt_focus .ad").height();
		$(".slider").stop(true,false).animate({top : -adHeight*index},500);
		$(".num li").removeClass("on")
			.eq(index).addClass("on");
}
$(function(){
   var len1  = $(".num1 > li").length;
	 //var sw = 0;
	 var adTimer1;
	 $(".num1 li").mouseover(function(){
		index  =   $(".num1 li").index(this);
		showImg1(index);
	 }).eq(0).mouseover();
	 //滑入 停止动画，滑出开始动画.
	 $('.ad1').hover(function(){
			 clearInterval(adTimer1);
		 },function(){
			 adTimer1 = setInterval(function(){
			    showImg1(index)
				index++;
				if(index==len1){index=0;}
			  } , 4000);
	 }).trigger("mouseleave");
})
// 通过控制top ，来显示不同的幻灯片
function showImg1(index){
    var adHeight = $(".zt_focus1 .ad1").height();
		$(".slider1").stop(true,false).animate({top : -adHeight*index},500);
		$(".num1 li").removeClass("on")
			.eq(index).addClass("on");
}
</script>
<!--[if lte IE 6]>
<script type="text/javascript" src="http://images.shopin.net/images/ad/summer1/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript"> 
DD_belatedPNG.fix('.png,.cornermark');
</script> 
<![endif]-->
</head>

<body>
<img class="mt" src="http://images.shopin.net/images/ad/nanrenjie/tb1.jpg" width="950" height="240">
<img src="http://images.shopin.net/images/ad/nanrenjie/tb2.jpg" width="950" height="240" usemap="#Map">
<map name="Map">
	<area shape="rect" coords="842,180,930,203" href="#alipay">
	<area shape="rect" coords="842,206,929,229" href="http://www.shopin.net/help/erweima.html" target="_blank">
</map>
<div id="a" class="underway fl">
	<img src="http://images.shopin.net/images/ad/nanrenjie/t1.png" width="712" height="56" alt="今日大牌">
	<div class="bd">
		<div class="zt_focus">
			<div class="ad">
				<ul class="slider">
					<li><a href="http://www.shopin.net/promotion/4997.html" target="_blank"><img src="http://images.shopin.net/images/ad/nanrenjie/f1-802.jpg" width="704" height="367" /></a></li>
					<li><a href="http://www.shopin.net/promotion/5162.html" target="_blank"><img src="http://images.shopin.net/images/ad/nanrenjie/f2-802.jpg" width="704" height="367" /></a></li>
					<li><a href="http://www.shopin.net/promotion/5660.html" target="_blank"><img src="http://images.shopin.net/images/ad/nanrenjie/f3-802.jpg" width="704" height="367" /></a></li>
				</ul>
				<ul class="num" >
					<li>1</li>
					<li>2</li>
					<li>3</li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="next fr">
	<img src="http://images.shopin.net/images/ad/nanrenjie/t2.png" width="238" height="56" alt="明日预告"><ul>
		<li><img src="http://images.shopin.net/images/ad/nanrenjie/n1-802.jpg" width="230" height="118"></li>
		<li><img src="http://images.shopin.net/images/ad/nanrenjie/n2-802.jpg" width="230" height="118"></li>
		<li><img src="http://images.shopin.net/images/ad/nanrenjie/n3-802.jpg" width="230" height="118"></li>
	</ul>
</div>
<div class="cl line"></div>
<img id="b" src="http://images.shopin.net/images/ad/nanrenjie/t3.png" width="950" height="51" alt="正在进行活动 不断更新中......">
<ul class="previous clear zc">
<li><a href="http://www.shopin.net/promotion/5540.html" target="_blank"><img src="http://images.shopin.net/images/ad/nanrenjie/p1-802.jpg" width="310" height="150" alt="EVE de UOMO（logo）精品男装1.1折起"></a></li>
<li><a href="http://www.shopin.net/promotion/5332.html" target="_blank"><img src="http://images.shopin.net/images/ad/nanrenjie/p2-802.jpg" width="310" height="150" alt="十大商场男装出清 低至1折"></a></li>
<li><a href="http://www.shopin.net/promotion/5658.html" target="_blank"><img src="http://images.shopin.net/images/ad/nanrenjie/p3-802.jpg" width="310" height="150" alt="衬衫+长裤 超值 ￥120起"></a></li>
</ul>
<div class="line"></div>
<div id="c" class="shirt wrap clear zc">
<div class="thd"><h2><a href="http://www.shopin.net/man/list--1150--------.html" target="_blank">衬衫更多</a></h2></div>
<div class="bd">
<a class="fl" href="http://www.shopin.net/promotion/5661.html" target="_blank"><img src="http://images.shopin.net/images/ad/nanrenjie/img1.jpg" width="345" height="437"></a>
<ul class="prolist">
<li><a href="http://www.shopin.net/product/1653306.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/02/23/Pic1653306_134815_0_1.jpg" /><h3>帕古茨专柜正品衬衣26121008-J-11</h3></a><del>￥1680</del><em>￥132</em><span class="cornermark">活动价<strong>￥118</strong></span></li>
<li><a href="http://www.shopin.net/product/1281654.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/06/29/Pic1281654_60393_0_1.jpg" /><h3>雅戈尔专柜正品条纹衬衣YLA224SXC1017-22</h3></a><del>￥320</del><em>￥167</em><span class="cornermark">活动价<strong>￥150</strong></span></li>
<li><a href="http://www.shopin.net/product/1945537.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/07/17/Pic1945537_88689_0_1.jpg" /><h3>沙驰专柜正品纯色衬衣827312008</h3></a><del>￥1480</del><em>￥300</em><span class="cornermark">活动价<strong>￥222</strong></span></li>
<li><a href="http://www.shopin.net/product/1712345.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/04/17/Pic1712345_16669_0_1.jpg" /><h3>BOSSSUNWEN专柜正品纯色衬衣BSDC09113P1</h3></a><del>￥1580</del><em>￥344</em><span class="cornermark">活动价<strong>￥310</strong></span></li>
<li><a href="http://www.shopin.net/product/1851567.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/06/07/Pic1851567_88683_0_1.jpg" /><h3>沙驰专柜正品2011衬衣817112059</h3></a><del>￥1860</del><em>￥350</em><span class="cornermark">活动价<strong>￥279</strong></span></li>
<li><a href="http://www.shopin.net/product/1158270.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/07/04/Pic1158270_15568_0_1.jpg" /><h3>洛萨里奥专柜正品衬衣RH10-1069</h3></a><del>￥1290</del><em>￥358</em><span class="cornermark">活动价<strong>￥298</strong></span></li>
<li><a href="http://www.shopin.net/product/263174.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/07/10/Pic263174_17117_0_1.jpg" /><h3>柒专柜正品衬衫71T5A07</h3></a><del>￥509</del><em>￥151</em><span class="cornermark">活动价<strong>￥136</strong></span></li>
<li><a href="http://www.shopin.net/product/1737274.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/04/11/Pic1737274_18398_0_1.jpg" /><h3>奥古利奥专柜正品衬衣DCS12-0001</h3></a><del>￥880</del><em>￥360</em><span class="cornermark">活动价<strong>￥292</strong></span></li>
</ul>
</div>
<div class="fd"></div>
</div>
<div class="polo-shirt wrap clear zc">
<div class="hd"><h2><a href="http://www.shopin.net/man/list--1058--------.html" target="_blank">polo衫更多</a></h2></div>
<div class="bd">
<a class="fl" href="http://www.shopin.net/promotion/5662.html" target="_blank"><img src="http://images.shopin.net/images/ad/nanrenjie/img2.jpg" width="345" height="437"></a>
<ul class="prolist">
<li><a href="http://www.shopin.net/product/1653341.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/02/23/Pic1653341_134807_0_1.jpg" /><h3>帕古茨12年正品polo衫26121015-J-01</h3></a><del>￥1680</del><em>￥132</em><span class="cornermark">活动价<strong>￥118</strong></span></li>
<li><a href="http://www.shopin.net/product/1787511.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/04/28/Pic1787511_18398_0_1.jpg" /><h3>奥古利奥2012年正品polo衫DTX12-0032</h3></a><del>￥1180</del><em>￥162</em><span class="cornermark">活动价<strong>￥146</strong></span></li>
<li><a href="http://www.shopin.net/product/1929528.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/07/02/Pic1929528_53817_0_1.jpg" /><h3>柒专柜正品polo衫71T5575</h3></a><del>￥509</del><em>￥255</em><span class="cornermark">活动价<strong>￥230</strong></span></li>
<li><a href="http://www.shopin.net/product/1945453.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/07/28/Pic1945453_117431_0_1.jpg" /><h3>沙驰专柜正品套头衫84630229</h3></a><del>￥1980</del><em>￥330</em><span class="cornermark">活动价<strong>￥297</strong></span></li>
<li><a href="http://www.shopin.net/product/1155400.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/07/20/Pic1155400_18251_0_1.jpg" /><h3>罗蒙专柜正品男款纯棉polo衫6T01998</h3></a><del>￥458</del><em>￥120</em><span class="cornermark">活动价<strong>￥108</strong></span></li>
<li><a href="http://www.shopin.net/product/1192574.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/05/27/Pic1192574_91139_0_1.jpg" /><h3>吉诺里兹专柜正品加棉polo衫M610-6512</h3></a><del>￥1180</del><em>￥200</em><span class="cornermark">活动价<strong>￥180</strong></span></li>
<li><a href="http://www.shopin.net/product/407388.html" target="_blank"><img src="http://images.shopin.net/images/58/2010/06/26/Pic407388_63388_0_1.jpg" /><h3>圣吉卡丹专柜正品纯棉polo衫ST10A7230-19</h3></a><del>￥580</del><em>￥232</em><span class="cornermark">活动价<strong>￥150</strong></span></li>
<li><a href="http://www.shopin.net/product/1929538.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/07/02/Pic1929538_73785_0_1.jpg" /><h3>柒专柜正品polo衫71T5A26</h3></a><del>￥689</del><em>￥345</em><span class="cornermark">活动价<strong>￥311</strong></span></li>
</ul>
</div>
<div class="fd"></div>
</div>
<div class="pants wrap clear zc">
<div class="hd"><h2><a href="http://www.shopin.net/man/list--1181--------.html" target="_blank">裤子更多</a></h2></div>
<div class="bd">
<a class="fl" href="http://www.shopin.net/promotion/5663.html" target="_blank"><img src="http://images.shopin.net/images/ad/nanrenjie/img3.jpg" width="345" height="437"></a>
<ul class="prolist">
<li><a href="http://www.shopin.net/product/1746522.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/04/26/Pic1746522_174162_0_1.jpg" /><h3>雅戈尔专柜正品西装裤YK2015HX316-21C</h3></a><del>￥480</del><em>￥167</em><span class="cornermark">活动价<strong>￥150</strong></span></li>
<li><a href="http://www.shopin.net/product/833618.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/02/15/Pic833618_90009_0_1.jpg" /><h3>杰奎普瑞专柜羊毛西裤JB43052</h3></a><del>￥700</del><em>￥111</em><span class="cornermark">活动价<strong>￥100</strong></span></li>
<li><a href="http://www.shopin.net/product/1235369.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/06/10/Pic1235369_14626_0_1.jpg" /><h3>九牧王专柜正品西裤JAC1273916</h3></a><del>￥479</del><em>￥206</em><span class="cornermark">活动价<strong>￥185</strong></span></li>
<li><a href="http://www.shopin.net/product/1058843.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/04/01/Pic1058843_91139_0_1.jpg" /><h3>吉诺里兹专柜正品纯棉长裤M912-2509</h3></a><del>￥898</del><em>￥111</em><span class="cornermark">活动价<strong>￥100</strong></span></li>
<li><a href="http://www.shopin.net/product/1186450.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/06/01/Pic1186450_106808_0_1.jpg" /><h3>普顿专柜正品男款西裤BH11-16</h3></a><del>￥421</del><em>￥83</em><span class="cornermark">活动价<strong>￥75</strong></span></li>
<li><a href="http://www.shopin.net/product/48556.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/06/17/Pic48556_17112_0_1.jpg" /><h3>柒专柜正品男款羊毛长裤78B7183</h3></a><del>￥506</del><em>￥110</em><span class="cornermark">活动价<strong>￥99</strong></span></li>
<li><a href="http://www.shopin.net/product/1109971.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/05/26/Pic1109971_17390_0_1.jpg" /><h3>虎都专柜正品西裤SFAW1192D</h3></a><del>￥651</del><em>￥206</em><span class="cornermark">活动价<strong>￥185</strong></span></li>
<li><a href="http://www.shopin.net/product/310181.html" target="_blank"><img src="http://images.shopin.net/images/58/2010/08/05/Pic310181_14444_0_1.jpg" /><h3>颐尊专柜正品男款长裤PC01706</h3></a><del>￥460</del><em>￥167</em><span class="cornermark">活动价<strong>￥150</strong></span></li>
</ul>
</div>
<div class="fd"></div>
</div>
<div class="leather-shoes wrap clear zc">
<div class="hd"><h2><a href="http://www.shopin.net/shoes/list--1382--------.html" target="_blank">皮鞋更多</a></h2></div>
<div class="bd">
<a class="fl" href="http://www.shopin.net/promotion/5654.html" target="_blank"><img src="http://images.shopin.net/images/ad/nanrenjie/img4.jpg" width="345" height="437"></a>
<ul class="prolist">
<li><a href="http://www.shopin.net/product/943765.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/02/24/Pic943765_12176_0_1.jpg" /><h3>骆驼牌头层牛皮正装鞋</h3></a><del>￥838</del><em>￥358</em><span class="cornermark">活动价<strong>￥322</strong></span></li>
<li><a href="http://www.shopin.net/product/1830421.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/05/23/Pic1830421_8480_0_1.jpg" /><h3>金利来浅棕冲孔透气单鞋</h3></a><del>￥890</del><em>￥401</em><span class="cornermark">活动价<strong>￥361</strong></span></li>
<li><a href="http://www.shopin.net/product/1314334.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/07/20/Pic1314334_12518_0_1.jpg" /><h3>宾度黑色牛皮男鞋</h3></a><del>￥1055</del><em>￥319</em><span class="cornermark">活动价<strong>￥298</strong></span></li>
<li><a href="http://www.shopin.net/product/1752223.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/04/22/Pic1752223_46914_0_1.jpg" /><h3>欢腾头层牛皮休闲鞋</h3></a><del>￥998</del><em>￥499</em><span class="cornermark">活动价<strong>￥449</strong></span></li>
<li><a href="http://www.shopin.net/product/1487304.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/11/29/Pic1487304_14101_0_1.jpg" /><h3>梦特娇牛皮压纹鞋</h3></a><del>￥798</del><em>￥443</em><span class="cornermark">活动价<strong>￥399</strong></span></li>
<li><a href="http://www.shopin.net/product/1539144.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/03/06/Pic1539144_15375_0_1.jpg" /><h3>莱尔斯丹啡色男装皮鞋</h3></a><del>￥1798</del><em>￥554</em><span class="cornermark">活动价<strong>￥499</strong></span></li>
<li><a href="http://www.shopin.net/product/1790281.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/05/03/Pic1790281_145820_0_1.jpg" /><h3>梅尔代格高档男装皮鞋</h3></a><del>￥3680</del><em>￥1211</em><span class="cornermark">活动价<strong>￥1090</strong></span></li>
<li><a href="http://www.shopin.net/product/1959135.html" target="_blank"><img src="http://images.shopin.net/images//58/2012/07/27//Pic1959135_13714_0_1.jpg" /><h3>天美意休闲男鞋</h3></a><del>￥799</del><em>￥554</em><span class="cornermark">活动价<strong>￥499</strong></span></li>
</ul>
</div>
<div class="fd"></div>
</div>
<div class="sport wrap clear zc">
<div class="hd"><h2><a href="http://www.shopin.net/sports/list--1529--------.html" target="_blank">运动户外T恤更多</a></h2></div>
<div class="bd">
<a class="fl" href="http://www.shopin.net/promotion/5653.html" target="_blank"><img src="http://images.shopin.net/images/ad/nanrenjie/img5.jpg" width="345" height="437"></a>
<ul class="prolist">
<li><a href="http://www.shopin.net/product/1236633.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/05/30/Pic1236633_43350_0_1.jpg" /><h3>NIKE男式短袖POLO衫</h3></a><del>￥299</del><em>￥194</em><span class="cornermark">活动价<strong>￥150</strong></span></li>
<li><a href="http://www.shopin.net/product/267257.html" target="_blank"><img src="http://images.shopin.net/images/61/2010/05/19/Pic267257_48014_0_1.jpg" /><h3>adidas男款T恤</h3></a><del>￥198</del><em>￥186</em><span class="cornermark">活动价<strong>￥168</strong></span></li>
<li><a href="http://www.shopin.net/product/1270080.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/06/28/Pic1270080_48654_0_1.jpg" /><h3>CONVERSE男式短袖T恤</h3></a><del>￥238</del><em>￥184</em><span class="cornermark">活动价<strong>￥166</strong></span></li>
<li><a href="http://www.shopin.net/product/1655523.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/02/24/Pic1655523_48438_0_1.jpg" /><h3>KAPPA男式休闲T恤</h3></a><del>￥238</del><em>￥149</em><span class="cornermark">活动价<strong>￥149</strong></span></li>
<li><a href="http://www.shopin.net/product/1672335.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/03/13/Pic1672335_93831_0_1.jpg" /><h3>FILA男式短袖POLO衫</h3></a><del>￥349</del><em>￥174</em><span class="cornermark">活动价<strong>￥139</strong></span></li>
<li><a href="http://www.shopin.net/product/1699030.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/04/01/Pic1699030_47576_0_1.jpg" /><h3>PONY男式短袖T恤</h3></a><del>￥197</del><em>￥98</em><span class="cornermark">活动价<strong>￥88</strong></span></li>
<li><a href="http://www.shopin.net/product/1758828.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/04/19/Pic1758828_27781_0_1.jpg" /><h3>BLACK YAK男式户外T恤</h3></a><del>￥198</del><em>￥110</em><span class="cornermark">活动价<strong>￥99</strong></span></li>
<li><a href="http://www.shopin.net/product/1735092.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/04/08/Pic1735092_27615_0_1.jpg" /><h3>Kolumb迪基利男式短袖T恤</h3></a><del>￥169</del><em>￥118</em><span class="cornermark">活动价<strong>￥85</strong></span></li>
</ul>
</div>
<div class="fd"></div>
</div>
<div class="sports-shoes wrap clear zc">
<div class="hd"><h2><a href="http://www.shopin.net/sports/list--1810--------.html" target="_blank">运动鞋更多</a></h2></div>
<div class="bd">
<a class="fl" href="http://www.shopin.net/promotion/5655.html" target="_blank"><img src="http://images.shopin.net/images/ad/nanrenjie/img6.jpg" width="345" height="437"></a>
<ul class="prolist">
<li><a href="http://www.shopin.net/product/1433788.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/10/26/Pic1433788_43363_0_1.jpg" /><h3>NIKE男式透气跑步鞋</h3></a><del>￥769</del><em>￥384</em><span class="cornermark">活动价<strong>￥346</strong></span></li>
<li><a href="http://www.shopin.net/product/1550302.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/12/14/Pic1550302_48014_0_1.jpg" /><h3>ADIDAS男式舒适运动鞋</h3></a><del>￥529</del><em>￥346</em><span class="cornermark">活动价<strong>￥312</strong></span></li>
<li><a href="http://www.shopin.net/product/1751309.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/04/26/Pic1751309_27102_0_1.jpg" /><h3>KAPPA男式运动鞋</h3></a><del>￥398</del><em>￥264</em><span class="cornermark">活动价<strong>￥238</strong></span></li>
<li><a href="http://www.shopin.net/product/711933.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/08/24/Pic711933_48654_0_1.jpg" /><h3>CONVERSE中性胶鞋</h3></a><del>￥299</del><em>￥262</em><span class="cornermark">活动价<strong>￥236</strong></span></li>
<li><a href="http://www.shopin.net/product/1736555.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/04/10/Pic1736555_47576_0_1.jpg" /><h3>PONY中性低帮帆布鞋</h3></a><del>￥329</del><em>￥256</em><span class="cornermark">活动价<strong>￥230</strong></span></li>
<li><a href="http://www.shopin.net/product/1815934.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/07/27/Pic1815934_99638_0_1.jpg" /><h3>VANS男式运动鞋</h3></a><del>￥425</del><em>￥331</em><span class="cornermark">活动价<strong>￥298</strong></span></li>
<li><a href="http://www.shopin.net/product/1171949.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/04/28/Pic1171949_27905_0_1.jpg" /><h3>布来亚克中性徒步鞋</h3></a><del>￥628</del><em>￥419</em><span class="cornermark">活动价<strong>￥377</strong></span></li>
<li><a href="http://www.shopin.net/product/1259952.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/07/06/Pic1259952_129564_0_1.jpg" /><h3>诺诗兰男式溯溪鞋</h3></a><del>￥598</del><em>￥331</em><span class="cornermark">活动价<strong>￥298</strong></span></li>
</ul>
</div>
<div class="fd"></div>
</div>
<div class="leather wrap clear zc">
<div class="hd"><h2><a href="http://www.shopin.net/handbags/list--1103--------.html" target="_blank">皮具更多</a></h2></div>
<div class="bd">
<a class="fl" href="http://www.shopin.net/promotion/5652.html" target="_blank"><img src="http://images.shopin.net/images/ad/nanrenjie/img7.jpg" width="345" height="437"></a>
<ul class="prolist">
<li><a href="http://www.shopin.net/product/79299.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/04/20/Pic79299_159246_0_1.jpg" /><h3>BOSSSUNWEN啡色背包</h3></a><del>￥1118</del><em>￥446</em><span class="cornermark">活动价<strong>￥396</strong></span></li>
<li><a href="http://www.shopin.net/product/763249.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/08/18/Pic763249_19320_0_1.jpg" /><h3>LOUIECATTON真皮格纹斜挎包</h3></a><del>￥929</del><em>￥410</em><span class="cornermark">活动价<strong>￥369</strong></span></li>
<li><a href="http://www.shopin.net/product/1434123.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/12/08/Pic1434123_19423_0_1.jpg" /><h3>POLO真皮手提公文包</h3></a><del>￥2598</del><em>￥686</em><span class="cornermark">活动价<strong>￥618</strong></span></li>
<li><a href="http://www.shopin.net/product/1242991.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/06/29/Pic1242991_50018_0_1.jpg" /><h3>DECODE中性电脑包</h3></a><del>￥399</del><em>￥188</em><span class="cornermark">活动价<strong>￥170</strong></span></li>
<li><a href="http://www.shopin.net/product/1681923.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/03/08/Pic1681923_19276_0_1.jpg" /><h3>林宝坚尼真皮长款钱夹</h3></a><del>￥567</del><em>￥251</em><span class="cornermark">活动价<strong>￥226</strong></span></li>
<li><a href="http://www.shopin.net/product/1011171.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/06/03/Pic1011171_18648_0_1.jpg" /><h3>皮尔卡丹头层牛皮短款钱夹</h3></a><del>￥368</del><em>￥232</em><span class="cornermark">活动价<strong>￥209</strong></span></li>
<li><a href="http://www.shopin.net/product/1145878.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/07/18/Pic1145878_15686_0_1.jpg" /><h3>GOLF真皮压纹腰带</h3></a><del>￥418</del><em>￥221</em><span class="cornermark">活动价<strong>￥199</strong></span></li>
<li><a href="http://www.shopin.net/product/1934616.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/07/04/Pic1934616_19435_0_1.jpg" /><h3>花花公子真皮腰带</h3></a><del>￥318</del><em>￥158</em><span class="cornermark">活动价<strong>￥143</strong></span></li>
</ul>
</div>
<div class="fd"></div>
</div>
<div class="underwear wrap clear zc">
<div class="hd"><h2><a href="http://www.shopin.net/underwear/list--1078--------.html" target="_blank">内衣更多</a></h2></div>
<div class="bd">
<a class="fl" href="http://www.shopin.net/promotion/5513.html" target="_blank"><img src="http://images.shopin.net/images/ad/nanrenjie/img8.jpg" width="345" height="437"></a>
<ul class="prolist">
<li><a href="http://www.shopin.net/product/1268153.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/03/19/Pic1268153_169441_0_1.jpg" /><h3>棉花共和国纯棉印花三角裤</h3></a><del>￥78</del><em>￥43</em><span class="cornermark">活动价<strong>￥39</strong></span></li>
<li><a href="http://www.shopin.net/product/1938213.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/07/11/Pic1938213_186686_0_1.jpg" /><h3>金利来男士纯色平角裤</h3></a><del>￥120</del><em>￥48</em><span class="cornermark">活动价<strong>￥43</strong></span></li>
<li><a href="http://www.shopin.net/product/1149935.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/05/27/Pic1149935_6778_0_1.jpg" /><h3>秋鹿家居服纯棉印花套装</h3></a><del>￥398</del><em>￥97</em><span class="cornermark">活动价<strong>￥87</strong></span></li>
<li><a href="http://www.shopin.net/product/1215790.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/12/07/Pic1215790_119074_0_1.jpg" /><h3>ADABELLE纯棉粉蓝家居服</h3></a><del>￥378</del><em>￥129</em><span class="cornermark">活动价<strong>￥116</strong></span></li>
<li><a href="http://www.shopin.net/product/1762901.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/04/25/Pic1762901_84367_0_1.jpg" /><h3>柔可佳100%纯棉图案睡衣</h3></a><del>￥378</del><em>￥189</em><span class="cornermark">活动价<strong>￥170</strong></span></li>
<li><a href="http://www.shopin.net/product/276756.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/07/18/Pic276756_102165_0_1.jpg" /><h3>us polo assn纯色弹力平底裤</h3></a><del>￥58</del><em>￥30</em><span class="cornermark">活动价<strong>￥27</strong></span></li>
<li><a href="http://www.shopin.net/product/231588.html" target="_blank"><img src="http://images.shopin.net/images/58/2010/07/19/Pic231588_982_0_1.jpg" /><h3>安德露男士条纹沙滩短裤</h3></a><del>￥68</del><em>￥31</em><span class="cornermark">活动价<strong>￥28</strong></span></li>
<li><a href="http://www.shopin.net/product/1931066.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/07/04/Pic1931066_146478_0_1.jpg" /><h3>皮尔卡丹男士弹力平口裤</h3></a><del>￥165</del><em>￥89</em><span class="cornermark">活动价<strong>￥80</strong></span></li>
</ul>
</div>
<div class="fd"></div>
</div>
<div class="line"></div>
<img id="d" src="http://images.shopin.net/images/ad/nanrenjie/t5.png" width="950" height="51" alt="超值秋装大抢1.6折起">
<div class="summer">
<div class="zt_focus1">
  <div class="ad1">
    <ul class="slider1">
      <li><a href="http://www.shopin.net/promotion/5172.html" target="_blank"><img src="http://images.shopin.net/images/ad/nanrenjie/s1.jpg" width="942" height="199" alt="小西服+连衣裙 秋装超值抢 4折封" /></a></li>
      <li><a href="http://www.shopin.net/promotion/5666.html" target="_blank"><img src="http://images.shopin.net/images/ad/nanrenjie/s2.jpg" width="942" height="199" alt="品牌童装 秋季抢先购长T 长裤 外套2折起" /></a></li>
      <li><a href="http://www.shopin.net/promotion/5667.html" target="_blank"><img src="http://images.shopin.net/images/ad/nanrenjie/s3.jpg" width="942" height="199" alt="百丽旗下 超值秋鞋大抢单鞋 船鞋 裸靴 1.6折起" /></a></li>
      <li><a href="http://www.shopin.net/promotion/5670.html" target="_blank"><img src="http://images.shopin.net/images/ad/nanrenjie/s4.jpg" width="942" height="199" alt="男人节 秋装尝鲜 外套&针织衫&羊绒衫 3折封顶" /></a></li>
      <li><a href="http://www.shopin.net/promotion/5270.html" target="_blank"><img src="http://images.shopin.net/images/ad/nanrenjie/s5.jpg" width="942" height="199" alt="国际名品 秋季装备抢先促风衣 户外裤 户外鞋低至1.9折" /></a></li>
    </ul>
    <ul class="num1" >
      <li>1</li>
      <li>2</li>
      <li>3</li>
      <li>4</li>
      <li>5</li>
    </ul>
  </div>
</div>
</div>
<img id="alipay" class="mb" src="http://images.shopin.net/images/ad/nanrenjie/alipay.jpg" width="950" height="326" alt="支付宝活动规则">
<div id="summer_subnav" class="summer_subnav png">
  <ul>
    <li><a href="#a" title="今日大牌">今日大牌</a></li>
    <li><a href="#b" title="大牌男装疯抢">大牌男装疯抢</a></li>
    <li><a href="#c" title="2012新款直降">2012新款直降</a></li>
    <li><a href="#d" title="超值秋装">超值秋装</a></li>
    <li><a href="http://www.shopin.net/channel-man.html" title="更多男装品牌">更多男装品牌</a></li>
    <li class="gotop" style="*margin-top:9px;_margin-top:19px"><a href="#top" title="回顶部">回顶部</a></li>
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
</script>
</body>
</html>