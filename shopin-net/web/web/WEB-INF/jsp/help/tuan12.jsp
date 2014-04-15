<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>“双12”预售阶梯团,越团越划算,C2B定制,打破价格底线,鹿王,鄂尔多斯,雅鹿,金利来,沙驰,2-4折爆款再打折,全网抄底,会员好礼狂送,2012.12.6-12.13</title>
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
<!--[if lte IE 6]>
<script src="http://images.shopin.net/images/ad/summer1/DD_belatedPNG_0.0.8a-min.js"></script>
<script> 
DD_belatedPNG.fix('.png,.cornermark');
</script> 
<![endif]-->
<style>
img { vertical-align:top}
.cl{clear:both}
.clear:after { height:0; clear:both; content:"."; visibility:hidden; display:block;}
.zm{zoom:1}
.mt { margin-top:10px}
.mt2 { margin:0 0 10px 0}
.tc { text-align:center}
.box { padding-bottom:10px; margin:10px auto; background:#c11920}
/*count down*/
.countdown { width:500px; height:60px;  overflow:hidden;  margin:0 auto; font:800 28px/60px 'microsoft yahei'; background:url(http://images.shopin.net/images/ad/tuan12/clock.gif) no-repeat 0 center; color:#fff;background-position: left 15px; padding: 0 0 0 50px; }
.countdown span { font:800 28px/60px 'microsoft yahei'; color:#ff0}
/*preproduct*/
.preproduct ul { margin-left:11px}
.preproduct li { float:left; width:223px; height:351px; padding:1px 4px 9px 5px; margin-bottom:5px; background:url(http://images.shopin.net/images/ad/tuan12/prebox-c2.png)}
.preproduct h3 { height:26px; line-height:26px; overflow:hidden; padding-left:99px;}
.preproduct h3 a, .preproduct h3 a:hover { font-weight:normal; color:#fff; text-decoration:none}
.preproduct .proprice { height:26px; line-height:22px; overflow:hidden; margin-top:54px; font-weight:800; color:#57676f}
.preproduct .proprice span { display:inline-block; _display:inline; zoom:1; width:33%; text-align:center;}
.preproduct .proprice span.cheap { color:#c11920}
.preproduct .proinfo { margin-top:; height:30px; line-height:30px; overflow:hidden; color:#57676f}
.preproduct .proinfo span { float:right; width:50%; color:#000}
.preproduct .proinfo span em { font-weight:600; color:#c11920}
.preproduct .btn-pre { float:right; width:81px; height:22px; margin:11px 10px 0 0; overflow:hidden; text-indent:-999em;}
.preproduct .pre-end { background:url(http://images.shopin.net/images/ad/tuan12/book.png)}
.preproduct .pre-load { background:url(http://images.shopin.net/images/ad/tuan12/load.png)}
.preproduct .pre-none { background:url(http://images.shopin.net/images/ad/tuan12/none.png)}
.preproduct .pre-end { background:url(http://images.shopin.net/images/ad/tuan12/end.png)}
/*product list*/
.prolist { width:100%; margin-bottom:5px; zoom:1}
.prolist ul { margin-left:2px}
.prolist li { float:left; _display:inline; width:182px; margin:20px 0 0 6px; text-align:center; position:relative}
.prolist li a:hover ,.prolist li a:hover h3{ color:#fff}
.prolist li img { width:180px; height:180px; border:1px solid #e2e2e2}
.prolist li h3 { height:20px; overflow:hidden; line-height:20px; font-weight:normal; color:#fff}
.prolist li del { color:#fff}
.prolist li em { margin-left:10px; font-size:14px; font-weight:bold; color:#f9ec85}
.prolist .starprice { line-height:20px; text-align:center; overflow:hidden; font-weight:bold; color:#f15930;}
.prolist .save { width:110px; height:20px; margin:3px auto 0; text-align:center; font-weight:bold; background:#f25930; color:#fff601}
/*salelist*/
.salelist li { float:left; _display:inline; width:227px; height:199px; margin:10px 0 0 8px;}
</style>
</head>

<body>
<div class="box">
<img src="http://images.shopin.net/images/ad/tuan12/top-ad1.jpg" width="950" height="240"><img src="http://images.shopin.net/images/ad/tuan12/top-ad3.png" width="950" height="240" usemap="#Map2">
<map name="Map2">
		<area shape="rect" coords="682,13,907,208" href="#a">
		<area shape="rect" coords="538,190,675,231" href="http://www.shopin.net/myshopin/preorders.html" target="_blank">
</map>
	<div class="tc"><img src="http://images.shopin.net/images/ad/tuan12/img1.png" width="761" height="97"></div>
	<div class="mt tc"><img class="mt" src="http://images.shopin.net/images/ad/tuan12/t1.png" width="926" height="65"></div>
	<div id="remainTime" class="countdown">
		<script language="javascript" type="text/javascript">
			function _fresh(){
			var endtime=new Date("2012/12/11,23:59:59");//定义结束时间
			var nowtime = new Date();
			var leftsecond=parseInt((endtime.getTime()-nowtime.getTime())/1000);
			__d=parseInt(leftsecond/3600/24);
			__h=parseInt((leftsecond/3600)%24);
			__m=parseInt((leftsecond/60)%60);
			__s=parseInt(leftsecond%60);
			var c=new Date();
			var q=((c.getMilliseconds())%10);
			document.getElementById("remainTime").innerHTML="结束倒计时："+"<span>"+__d+"</span>"+"天&nbsp;"+"<span>"+__h+"</span>"+"小时&nbsp;"+"<span>"+__m+"</span>"+"分&nbsp;"+"<span>"+__s+"</span>"+"秒&nbsp;";
			if(leftsecond<=0){
			document.getElementById("remainTime").innerHTML="活动已结束";//结束后的状态
			clearInterval(sh);
			}
			}
			_fresh()
			var sh;
			sh=setInterval(_fresh,100);
		</script>
	</div>
	<div id="preproduct" class="preproduct clear zm">
		<ul>
<li><h3><a>鹿王女款V领羊绒衫</a></h3><a><img src="http://images.shopin.net/images/ad/tuan12/pre-01.jpg" width="222" height="170"></a><p class="proprice"><span>￥433</span><span>￥367</span><span class="cheap">￥299</span></p><p class="proinfo tc"><span>现已有<em>60人</em>预定</span>市场价：1480</p><a class="btn-pre pre-end">已结束</a></li>
<li><h3><a>鹿王男款圆领羊绒衫</a></h3><a><img src="http://images.shopin.net/images/ad/tuan12/pre-02.jpg" width="222" height="170"></a><p class="proprice"><span>￥663</span><span>￥567</span><span class="cheap">￥469</span></p><p class="proinfo tc"><span>现已有<em>55人</em>预定</span>市场价：1680</p><a class="btn-pre pre-end">已结束</a></li>
<li><h3><a>春竹女款印花100%羊绒衫</a></h3><a><img src="http://images.shopin.net/images/ad/tuan12/pre-03.jpg" width="222" height="170"></a><p class="proprice"><span>￥589</span><span>￥539</span><span class="cheap">￥499</span></p><p class="proinfo tc"><span>现已有<em>60人</em>预定</span>市场价：1880</p><a class="btn-pre pre-end">已结束</a></li>
<li><h3><a>鄂尔多斯混绒围巾</a></h3><a><img src="http://images.shopin.net/images/ad/tuan12/pre-09.jpg" width="222" height="170"></a><p class="proprice"><span>￥75</span><span>￥52</span><span class="cheap">￥29</span></p><p class="proinfo tc"><span>现已有<em>54人</em>预定</span>市场价：196</p><a class="btn-pre pre-end">已售馨</a></li>
<li><h3><a>MAND.YAMAN性感文胸</a></h3><a><img src="http://images.shopin.net/images/ad/tuan12/pre-05.jpg" width="222" height="170"></a><p class="proprice"><span>￥50</span><span>￥40</span><span class="cheap">￥30</span></p><p class="proinfo tc"><span>现已有<em>53人</em>预定</span>市场价：238</p><a class="btn-pre pre-end">已结束</a></li>
<li><h3><a>MAND.YAMAN性感底裤</a></h3><a><img src="http://images.shopin.net/images/ad/tuan12/pre-06.jpg" width="222" height="170"></a><p class="proprice"><span>￥14</span><span>￥13</span><span class="cheap">￥12</span></p><p class="proinfo tc"><span>现已有<em>63人</em>预定</span>市场价：49</p><a class="btn-pre pre-end">已结束</a></li>
<li><h3><a>米兰雅曼蕾丝刺绣印花文胸</a></h3><a><img src="http://images.shopin.net/images/ad/tuan12/pre-07.jpg" width="222" height="170"></a><p class="proprice"><span>￥73</span><span>￥58</span><span class="cheap">￥44</span></p><p class="proinfo tc"><span>现已有<em>58人</em>预定</span>市场价：398</p><a class="btn-pre pre-end">已结束</a></li>
<li><h3><a>米兰雅曼性感蕾丝刺绣底裤</a></h3><a><img src="http://images.shopin.net/images/ad/tuan12/pre-08.jpg" width="222" height="170"></a><p class="proprice"><span>￥40</span><span>￥32</span><span class="cheap">￥24</span></p><p class="proinfo tc"><span>现已有<em>55人</em>预定</span>市场价：158</p><a class="btn-pre pre-end">已结束</a></li>
<li><h3><a>沙驰男款牛皮系带皮鞋</a></h3><a><img src="http://images.shopin.net/images/ad/tuan12/pre-04.jpg" width="222" height="170"></a><p class="proprice"><span>￥479</span><span>￥399</span><span class="cheap">￥319</span></p><p class="proinfo tc"><span>现已有<em>58人</em>预定</span>市场价：1180</p><a class="btn-pre pre-end">已结束</a></li>
<li><h3><a>鄂尔多斯100%山羊绒手套</a></h3><a><img src="http://images.shopin.net/images/ad/tuan12/pre-10.jpg" width="222" height="170"></a><p class="proprice"><span>￥45</span><span>￥32</span><span class="cheap">￥19</span></p><p class="proinfo tc"><span>现已有<em>55人</em>预定</span>市场价：116</p><a class="btn-pre pre-end">已结束</a></li>
<li><h3><a>雅鹿男士短款羽绒服</a></h3><a><img src="http://images.shopin.net/images/ad/tuan12/pre-20.jpg" width="222" height="170"></a><p class="proprice"><span>￥506</span><span>￥413</span><span class="cheap">￥319</span></p><p class="proinfo tc"><span>现已有<em>58人</em>预定</span>市场价：1429</p><a class="btn-pre pre-end">已结束</a></li>
<li><h3><a>雅鹿90%鸭绒长款羽绒服</a></h3><a><img src="http://images.shopin.net/images/ad/tuan12/pre-19.jpg" width="222" height="170"></a><p class="proprice"><span>￥689</span><span>￥579</span><span class="cheap">￥470</span></p><p class="proinfo tc"><span>现已有<em>58人</em>预定</span>市场价：1929</p><a class="btn-pre pre-end">已结束</a></li>
<li><h3><a>金利来真皮商务男鞋</a></h3><a><img src="http://images.shopin.net/images/ad/tuan12/pre-16.jpg" width="222" height="170"></a><p class="proprice"><span>￥635</span><span>￥502</span><span class="cheap">￥369</span></p><p class="proinfo tc"><span>现已有<em>59人</em>预定</span>市场价：1280</p><a class="btn-pre pre-end">已结束</a></li>
<li><h3><a>曼黛玛莲2012新款文胸</a></h3><a><img src="http://images.shopin.net/images/ad/tuan12/pre-12.jpg" width="222" height="170"></a><p class="proprice"><span>￥132</span><span>￥106</span><span class="cheap">￥79</span></p><p class="proinfo tc"><span>现已有<em>51人</em>预定</span>市场价：298</p><a class="btn-pre pre-end">已结束</a></li>
<li><h3><a>曼黛玛莲蕾丝性感底裤</a></h3><a><img src="http://images.shopin.net/images/ad/tuan12/pre-13.jpg" width="222" height="170"></a><p class="proprice"><span>￥32</span><span>￥26</span><span class="cheap">￥19</span></p><p class="proinfo tc"><span>现已有<em>52人</em>预定</span>市场价：88</p><a class="btn-pre pre-end">已结束</a></li>
<li><h3><a>雅鹿保暖羽绒裤</a></h3><a><img src="http://images.shopin.net/images/ad/tuan12/pre-17.jpg" width="222" height="170"></a><p class="proprice"><span>￥212</span><span>￥185</span><span class="cheap">￥159</span></p><p class="proinfo tc"><span>现已有<em>54人</em>预定</span>市场价：469</p><a class="btn-pre pre-end">已结束</a></li>
<li><h3><a>曼黛玛莲经典底裤</a></h3><a><img src="http://images.shopin.net/images/ad/tuan12/pre-15.jpg" width="222" height="170"></a><p class="proprice"><span>￥32</span><span>￥26</span><span class="cheap">￥19</span></p><p class="proinfo tc"><span>现已有<em>52人</em>预定</span>市场价：88</p><a class="btn-pre pre-end">已结束</a></li>
<li><h3><a>曼黛玛莲经典聚拢文胸</a></h3><a><img src="http://images.shopin.net/images/ad/tuan12/pre-14.jpg" width="222" height="170"></a><p class="proprice"><span>￥132</span><span>￥106</span><span class="cheap">￥79</span></p><p class="proinfo tc"><span>现已有<em>51人</em>预定</span>市场价：298</p><a class="btn-pre pre-end">已结束</a></li>
		</ul>
	</div>
	<div class="mt tc"><img class="mt" src="http://images.shopin.net/images/ad/tuan12/t3.png" width="755" height="29"></div>
	<div class="salelist clear zm">
		<ul>
	<li><a href="http://www.shopin.net/promotion/6381.html" target="_blank"><img src="http://images.shopin.net/images/ad/tuan12/act-01.jpg"></a></li>
	<li><a href="http://www.shopin.net/promotion/6284.html" target="_blank"><img src="http://images.shopin.net/images/ad/tuan12/act-02.jpg"></a></li>
	<li><a href="http://www.shopin.net/promotion/3973.html" target="_blank"><img src="http://images.shopin.net/images/ad/tuan12/act-03.jpg"></a></li>
	<li><a href="http://www.shopin.net/promotion/4571.html" target="_blank"><img src="http://images.shopin.net/images/ad/tuan12/act-04.jpg"></a></li>
	<li><a href="http://www.shopin.net/promotion/6490.html" target="_blank"><img src="http://images.shopin.net/images/ad/tuan12/act-05.jpg"></a></li>
	<li><a href="http://www.shopin.net/promotion/6486.html" target="_blank"><img src="http://images.shopin.net/images/ad/tuan12/act-06.jpg"></a></li>
	<li><a href="http://www.shopin.net/promotion/5918.html" target="_blank"><img src="http://images.shopin.net/images/ad/tuan12/act-07.jpg"></a></li>
	<li><a href="http://www.shopin.net/promotion/6067.html" target="_blank"><img src="http://images.shopin.net/images/ad/tuan12/act-08.jpg"></a></li>
		</ul>
	</div>
</div>
</body>
</html>