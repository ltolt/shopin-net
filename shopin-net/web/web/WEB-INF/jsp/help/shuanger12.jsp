<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<meta charset="utf-8">
<title>“双12”震撼第二波开售,18款超值商品底价回馈,全场￥40起,全网抄底,会员好礼狂送,2012.12.12-12.13</title>
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
.tc { text-align:center}
.box { padding-bottom:10px; margin:10px auto; background:#c11920}
/*count down*/
.countdown { width:500px; height:60px;  overflow:hidden;  margin:0 auto; font:800 28px/60px 'microsoft yahei'; background:url(http://images.shopin.net/images/ad/tuan12/clock.gif) no-repeat 0 center; color:#fff;background-position: left 15px; padding: 0 0 0 50px; }
.countdown span { font:800 28px/60px 'microsoft yahei'; color:#ff0}
/*preproduct*/
.preproduct ul { margin-left:11px}
.preproduct li { float:left; width:223px; height:292px; padding:1px 4px 9px 5px; margin-bottom:5px; background:url(http://images.shopin.net/images/ad/tuan12/probox.png)}
.preproduct h3 { height:26px; line-height:26px; overflow:hidden; padding:0 6px; background:#57676f; color:#fff;}
.preproduct h3 a, .preproduct h3 a:hover { margin-left:5px; font-weight:normal; color:#fff;}
.preproduct .proprice { float:left; line-height:16px; padding:6px 0 0; margin-left:10px; font-size:14px; font-weight:800; _display:inline; color:#fff}
.preproduct .proprice del { display:block; font-size:12px; font-weight:normal; color:#aaa}
.preproduct .proinfo { height:45px; margin:0 1px; background:#c11920}
.preproduct .btn-pre { float:right; width:81px; height:22px; margin:11px 10px 0 0; overflow:hidden; text-indent:-999em;}
.preproduct .pre-book { background:url(http://images.shopin.net/images/ad/tuan12/book.png)}
.preproduct .pre-load { background:url(http://images.shopin.net/images/ad/tuan12/load.png)}
.preproduct .pre-buy { background:url(http://images.shopin.net/images/ad/tuan12/buy.png)}
.preproduct .pre-none { background:url(http://images.shopin.net/images/ad/tuan12/none.png)}
.preproduct .pre-end { background:url(http://images.shopin.net/images/ad/tuan12/end.png)}
/*product list*/
.prolist { width:100%; margin-bottom:5px; zoom:1}
.prolist ul { margin-left:2px}
.prolist li { float:left; _display:inline; width:182px; margin:20px 0 0 6px; text-align:center; position:relative}
.prolist li a:hover ,.prolist li a:hover h3{ color:#f60}
.prolist li img { width:180px; height:180px; border:1px solid #e2e2e2}
.prolist li h3 { height:20px; overflow:hidden; line-height:20px; font-weight:normal; color:#fff}
.prolist li del { color:#fff}
.prolist li em { margin-left:10px; font-size:14px; font-weight:bold; color:#f9ec85}
.prolist .starprice { line-height:20px; text-align:center; overflow:hidden; font-weight:bold; color:#f15930;}
.prolist .save { width:110px; height:20px; margin:3px auto 0; text-align:center; font-weight:bold; background:#f25930; color:#fff601}
/*salelist*/
.salelist li { float:left; _display:inline; width:227px; height:199px; margin:10px 0 0 8px;}
</style>
<script>
$(function(){
	$(".pre-book").click(function(){
		$.ajax({
			type:"POST",
			url:"count.php?t="+Math.random(),
			data:"num="+$(this).val(),
			success:function(msg){
				$(".preproduct i").val(msg+"人");
				}
				});
				return false;
				});
});
</script>
</head>

<body>
	<div class="box"><img src="http://images.shopin.net/images/ad/tuan12/top1.jpg" width="950" height="240"><img src="http://images.shopin.net/images/ad/tuan12/top2.png" width="950" height="240">
		<a href="http://www.shopin.net/help/tuan12.html" target="_blank"><img style="border:10px solid #fff; border-width:10px 0" src="http://images.shopin.net/images/ad/tuan12/ad.jpg" width="950" height="80" border="0"></a>
		<div class="tc"><img src="http://images.shopin.net/images/ad/tuan12/t.png" width="926" height="65"></div>
		<div id="remainTime" class="countdown">
      <script language="javascript" type="text/javascript">
			function _fresh(){
			var endtime=new Date("2012/12/13,23:59:59");//定义结束时间
			var nowtime = new Date();
			var leftsecond=parseInt((endtime.getTime()-nowtime.getTime())/1000);
			__d=parseInt(leftsecond/3600/24);
			__h=parseInt((leftsecond/3600)%24);
			__m=parseInt((leftsecond/60)%60);
			__s=parseInt(leftsecond%60);
			var c=new Date();
			var q=((c.getMilliseconds())%10);
			document.getElementById("remainTime").innerHTML="抢购倒计时："+"<span>"+__d+"</span>"+"天&nbsp;"+"<span>"+__h+"</span>"+"小时&nbsp;"+"<span>"+__m+"</span>"+"分&nbsp;"+"<span>"+__s+"</span>"+"秒&nbsp;";
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
		<div class="preproduct clear zm">
			<ul>
<li><h3>[接吻猫]<a href="http://www.shopin.net/product/2150651.html" target="_blank">Kiss Cat时尚兔毛靴子</a></h3><a href="http://www.shopin.net/product/2150651.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/12/05/Pic2150651_13816_0.resize_to.220x220.jpg" width="220" height="220"></a><div class="proinfo"><p class="proprice"><del>市场价：￥1180</del>活动价：￥269</p><a href="http://www.shopin.net/product/2150651.html" target="_blank" class="btn-pre pre-buy">马上预订</a></div></li>
<li><h3>[金利来]<a href="http://www.shopin.net/product/2152551.html" target="_blank">金利来绅士牛皮鞋</a></h3><a href="http://www.shopin.net/product/2152551.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/12/07/Pic2152551_8480_0.resize_to.220x220.jpg" width="220" height="220"></a><div class="proinfo"><p class="proprice"><del>市场价：￥1280</del>活动价：￥369</p><a href="http://www.shopin.net/product/2152551.html" target="_blank" class="btn-pre pre-buy">马上预订</a></div></li>
<li><h3>[沙驰]<a href="http://www.shopin.net/product/2149875.html" target="_blank">沙驰男士真皮鞋</a></h3><a href="http://www.shopin.net/product/2149875.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/12/05/Pic2149875_11342_0.resize_to.220x220.jpg" width="220" height="220"></a><div class="proinfo"><p class="proprice"><del>市场价：￥1180</del>活动价：￥319</p><a href="http://www.shopin.net/product/2149875.html" target="_blank" class="btn-pre pre-buy">马上预订</a></div></li>
<li><h3>[鄂尔多斯]<a href="http://www.shopin.net/product/2149826.html" target="_blank">鄂尔多斯100%羊绒围巾</a></h3><a href="http://www.shopin.net/product/2149826.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/12/07/Pic2149826_7377_0.resize_to.220x220.jpg" width="220" height="220"></a><div class="proinfo"><p class="proprice"><del>市场价：￥796</del>活动价：￥199</p><a href="http://www.shopin.net/product/2149826.html" target="_blank" class="btn-pre pre-buy">马上预订</a></div></li>
<li><h3>[雅鹿]<a href="http://www.shopin.net/product/1479462.html" target="_blank">雅鹿男款羽绒服</a></h3><a href="http://www.shopin.net/product/1479462.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/12/07/Pic1479462_149654_0.resize_to.220x220.jpg" width="220" height="220"></a><div class="proinfo"><p class="proprice"><del>市场价：￥1179</del>活动价：￥280</p><a href="http://www.shopin.net/product/1479462.html" target="_blank" class="btn-pre pre-buy">马上预订</a></div></li>
<li><h3>[雅鹿]<a href="http://www.shopin.net/product/813811.html" target="_blank">雅鹿女士长款毛领羽绒服</a></h3><a href="http://www.shopin.net/product/813811.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/12/07/Pic813811_87776_0.resize_to.220x220.jpg" width="220" height="220"></a><div class="proinfo"><p class="proprice"><del>市场价：￥1899</del>活动价：￥299</p><a href="http://www.shopin.net/product/813811.html" target="_blank" class="btn-pre pre-buy">马上预订</a></div></li>
<li><h3>[雅鹿]<a href="http://www.shopin.net/product/863161.html" target="_blank">雅鹿男士短款羽绒服</a></h3><a href="http://www.shopin.net/product/863161.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/08/02/Pic863161_132929_0.resize_to.220x220.jpg" width="220" height="220"></a><div class="proinfo"><p class="proprice"><del>市场价：￥1119</del>活动价：￥280</p><a href="http://www.shopin.net/product/863161.html" target="_blank" class="btn-pre pre-buy">马上预订</a></div></li>
<li><h3>[Elle]<a href="http://www.shopin.net/product/1677935.html" target="_blank">ELLE光面性感文胸</a></h3><a href="http://www.shopin.net/product/1677935.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/04/24/Pic1677935_8260_0.resize_to.220x220.jpg" width="220" height="220"></a><div class="proinfo"><p class="proprice"><del>市场价：￥288</del>活动价：￥115</p><a href="http://www.shopin.net/product/1677935.html" target="_blank" class="btn-pre pre-buy">马上预订</a></div></li>
<li><h3>[Elle]<a href="http://www.shopin.net/product/1592943.html" target="_blank">ELLE蕾丝蝴蝶结底裤</a></h3><a href="http://www.shopin.net/product/1592943.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/12/04/Pic1592943_8260_0.resize_to.220x220.jpg" width="220" height="220"></a><div class="proinfo"><p class="proprice"><del>市场价：￥99</del>活动价：￥40</p><a href="http://www.shopin.net/product/1592943.html" target="_blank" class="btn-pre pre-buy">马上预订</a></div></li>
<li><h3>[Elle]<a href="http://www.shopin.net/product/1306621.html" target="_blank">ELLE蕾丝网面文胸</a></h3><a href="http://www.shopin.net/product/1306621.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/08/03/Pic1306621_8145_0.resize_to.220x220.jpg" width="220" height="220"></a><div class="proinfo"><p class="proprice"><del>市场价：￥338</del>活动价：￥90</p><a href="http://www.shopin.net/product/1306621.html" target="_blank" class="btn-pre pre-buy">马上预订</a></div></li>
<li><h3>[Elle]<a href="http://www.shopin.net/product/1176244.html" target="_blank">ELLE蕾丝网底裤</a></h3><a href="http://www.shopin.net/product/1176244.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/12/04/Pic1176244_8145_0.resize_to.220x220.jpg" width="220" height="220"></a><div class="proinfo"><p class="proprice"><del>市场价：￥118</del>活动价：￥45</p><a href="http://www.shopin.net/product/1176244.html" target="_blank" class="btn-pre pre-buy">马上预订</a></div></li>
<li><h3>[OURSHINE]<a href="http://www.shopin.net/product/1910060.html" target="_blank">奥羽尚时尚长款羽绒服</a></h3><a href="http://www.shopin.net/product/1910060.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/06/19/Pic1910060_187273_0.resize_to.220x220.jpg" width="220" height="220"></a><div class="proinfo"><p class="proprice"><del>市场价：￥788</del>活动价：￥299</p><a href="http://www.shopin.net/product/1910060.html" target="_blank" class="btn-pre pre-buy">马上预订</a></div></li>
<li><h3>[KELIYA]<a>克利雅V领镶钻羊绒衫</a></h3><a><img src="http://images.shopin.net/images/68/2012/09/13/Pic2030217_77600_0.resize_to.220x220.jpg" width="220" height="220"></a><div class="proinfo"><p class="proprice"><del>市场价：￥1980</del>活动价：￥199</p><a class="btn-pre pre-none">已售馨</a></div></li>
<!--li><h3>[KELIYA]<a href="http://www.shopin.net/product/2030217.html" target="_blank">克利雅V领镶钻羊绒衫</a></h3><a href="http://www.shopin.net/product/2030217.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/13/Pic2030217_77600_0.resize_to.220x220.jpg" width="220" height="220"></a><div class="proinfo"><p class="proprice"><del>市场价：￥1980</del>活动价：￥199</p><a href="http://www.shopin.net/product/2030217.html" target="_blank" class="btn-pre pre-buy">马上预订</a></div></li-->
<li><h3>[洋宾燕]<a href="http://www.shopin.net/product/2045034.html" target="_blank">洋宾燕男款V领羊绒衫</a></h3><a href="http://www.shopin.net/product/2045034.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/21/Pic2045034_201191_0.resize_to.220x220.jpg" width="220" height="220"></a><div class="proinfo"><p class="proprice"><del>市场价：￥1298</del>活动价：￥139</p><a href="http://www.shopin.net/product/2045034.html" target="_blank" class="btn-pre pre-buy">马上预订</a></div></li>
<li><h3>[WAYONLY]<a href="http://www.shopin.net/product/2124559.html" target="_blank">WAYONLY貉子毛领棉服</a></h3><a href="http://www.shopin.net/product/2124559.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/21/Pic2124559_161797_0.resize_to.220x220.jpg" width="220" height="220"></a><div class="proinfo"><p class="proprice"><del>市场价：￥1399</del>活动价：￥236</p><a href="http://www.shopin.net/product/2124559.html" target="_blank" class="btn-pre pre-buy">马上预订</a></div></li>
<li><h3>[飘莱]<a href="http://www.shopin.net/product/2134382.html" target="_blank">飘莱貉子毛领长款羽绒服</a></h3><a href="http://www.shopin.net/product/2134382.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/21/Pic2134382_211094_0.resize_to.220x220.jpg" width="220" height="220"></a><div class="proinfo"><p class="proprice"><del>市场价：￥880</del>活动价：￥349</p><a href="http://www.shopin.net/product/2134382.html" target="_blank" class="btn-pre pre-buy">马上预订</a></div></li>
<li><h3>[RBCA]<a href="http://www.shopin.net/product/2073007.html" target="_blank">RBCA羊毛呢大衣</a></h3><a href="http://www.shopin.net/product/2073007.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic2073007_184085_0.resize_to.220x220.jpg" width="220" height="220"></a><div class="proinfo"><p class="proprice"><del>市场价：￥1398</del>活动价：￥98</p><a href="http://www.shopin.net/product/2073007.html" target="_blank" class="btn-pre pre-buy">马上预订</a></div></li>
<li><h3>[Kazelaze]<a href="http://www.shopin.net/product/2092712.html" target="_blank">Kazelaze獭兔毛领羽绒服</a></h3><a href="http://www.shopin.net/product/2092712.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/07/Pic2092712_151160_0.resize_to.220x220.jpg" width="220" height="220"></a><div class="proinfo"><p class="proprice"><del>市场价：￥2480</del>活动价：￥299</p><a href="http://www.shopin.net/product/2092712.html" target="_blank" class="btn-pre pre-buy">马上预订</a></div></li>
			</ul>
		</div>
		<div class="mt tc"><img src="http://images.shopin.net/images/ad/tuan12/t2.png" width="926" height="65" usemap="#Map">
			<map name="Map">
				<area shape="rect" coords="752,22,880,48" href="http://www.shopin.net/promotion/6516.html" target="_blank">
			</map>
		</div>
		<div class="prolist">
			<ul>
<li><a href="http://www.shopin.net/product/799969.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/08/03/Pic799969_86150_0.resize_to.180x180.jpg" /><h3>波司登中长款女式羽绒服</h3></a><del>￥1058</del><em>活动价：￥428</em></li>
<li><a href="http://www.shopin.net/product/1479462.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/10/27/Pic1479462_149654_0.resize_to.180x180.jpg" /><h3>雅鹿短款男士羽绒服</h3></a><del>￥1179</del><em>活动价：￥369</em></li>
<li><a href="http://www.shopin.net/product/2084970.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/24/Pic2084970_83760_0.resize_to.180x180.jpg" /><h3>尼特维尔时尚女式羊毛衫</h3></a><del>￥672</del><em>活动价：￥117</em></li>
<li><a href="http://www.shopin.net/product/1517886.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/11/17/Pic1517886_9385_0.resize_to.180x180.jpg" /><h3>卡曼尼牛皮时尚短靴</h3></a><del>￥1390</del><em>活动价：￥201</em></li>
<li><a href="http://www.shopin.net/product/2136637.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/11/23/Pic2136637_159983_0.resize_to.180x180.jpg" /><h3>哥仑步男士户外鞋</h3></a><del>￥799</del><em>活动价：￥391</em></li>
<li><a href="http://www.shopin.net/product/2123586.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/29/Pic2123586_211179_0.resize_to.180x180.jpg" /><h3>戎立特一字领山羊绒衫</h3></a><del>￥930</del><em>活动价：￥227</em></li>
<li><a href="http://www.shopin.net/product/2045252.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/21/Pic2045252_201193_0.resize_to.180x180.jpg" /><h3>洋宾燕男款圆领暗格羊绒衫</h3></a><del>￥1288</del><em>活动价：￥209</em></li>
<li><a href="http://www.shopin.net/product/1910035.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/06/19/Pic1910035_187288_0.resize_to.180x180.jpg" /><h3>OURSHINE长款白鸭绒羽绒服</h3></a><del>￥878</del><em>活动价：￥199</em></li>
<li><a href="http://images.shopin.net/images//63/2012/10/29/Pic2106211_9645_0_1.jpg" target="_blank"><img src="http://images.shopin.net/images/63/2012/10/29/Pic2106211_9645_0.resize_to.180x180.jpg" /><h3>卡曼尼2012新款牛皮短靴</h3></a><del>￥1390</del><em>活动价：￥556</em></li>
<li><a href="http://www.shopin.net/product/2130075.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/19/Pic2130075_211964_0.resize_to.180x180.jpg" /><h3>IUGGIRL兔毛牛皮中筒雪地靴</h3></a><del>￥778</del><em>活动价：￥273</em></li>
			</ul>
			<div class="mt tc"><a href="http://www.shopin.net/promotion/6507.html" target="_blank"><img src="http://images.shopin.net/images/ad/tuan12/promotion.jpg" width="922" height="171"></a></div>
		</div>
		<div class="mt tc"><img src="http://images.shopin.net/images/ad/shuang12/img1.jpg" width="950" height="178"></div>
		<div class="mt tc"><a href="http://www.shopin.net/help/shuang12.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang12/yt-01.jpg" width="950" height="150"></a></div>
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