<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>大牌春鞋,裸价出清,品牌女鞋,品牌男鞋,名牌女鞋,名牌男鞋,浅口单鞋,休闲鞋,细高跟鞋,坡跟鞋,平底鞋,公主鞋,摇摇鞋,豆豆鞋,松糕鞋,商务休闲男鞋,正装男鞋</title>
<style>
img { vertical-align:middle}
.mt { margin-top:10px}
.invain { height:13px; line-height:13px; font-size:0; visibility:hidden; overflow:hidden; clear:both}
.majorSuit { background:#c0370e url(http://images.shopin.net/images/ad/2013xiechuqing/majorsuitBg.jpg) no-repeat 0 0}
.MSInner { padding:0 10px}
.MSBox { float:left; width:445px; padding:0 10px; background:url(http://images.shopin.net/images/ad/2013xiechuqing/bg-ry.png) repeat-y}
.MSWrap { padding:20px 0 0; text-align:center; background:#fef0db url(http://images.shopin.net/images/ad/2013xiechuqing/majorsuitbg.png) repeat-x 0 0}
.MSWrap p { margin-top:8px}
.MSWrap ul { background:url(http://images.shopin.net/images/ad/2013xiechuqing/majorsuitbgb.png) repeat-x 0 bottom}
.MSWrap li { position:relative; float:left; width:128px; height:88px; margin:15px 0 12px 12px; _display:inline; border:2px solid}
.MSWrap li img { width:128px; height:88px}
.MSWrap li span { position:absolute; left:0; bottom:0; width:100%; height:22px; line-height:22px; overflow:hidden; background:#828282; color:#fff}
.MSLady li { border-color:#ff6fc4}
.MSMan li { border-color:#4b77ec}
/*box*/
.box { padding:20px; margin-bottom:10px; background:#781206}
/*限时快抢专场*/
.limit { border:1px solid #ffe04f; border-top:none}
/*倒计时*/
.countdown { height:40px; text-align:center; font:normal 18px/40px 'microsoft yahei'; background:url(http://images.shopin.net/images/ad/2013xiechuqing/cd-bg.png) repeat-x; color:#ff8f81}
.countdown img { margin:0 10px 4px 0}
/*product list*/
.prolist li { position:relative; float:left; width:202px; height:256px; margin-left:11px; _display:inline; text-align:center;}
.prolist li img { width:200px; height:200px; border:1px solid #eee}
.prolist li i { position:absolute; left:7px; top:10px; width:57px; height:60px; padding:36px 0 0 28px; text-align:left; font:600 24px/34px 'microsoft yahei'; background:url(http://images.shopin.net/images/ad/2013xiechuqing/superscript.png)}
.prolist .proinfo { height:54px; padding:0 5px; background:url(http://images.shopin.net/images/ad/2013xiechuqing/probg.png)}
.prolist .proinfo h3 { height:26px; line-height:26px; overflow:hidden; text-align:center; font-weight:normal}
.prolist .proinfo del, .prolist .proinfo strong { width:50%; display:inline-block; *display:inline; *zoom:1}
.prolist .proinfo del { text-align:left}
.prolist .proinfo strong { text-align:right}
.prolist .proinfo em { color:#ff2a02}
.prolist .proinfo del, .prolist .proinfo strong, .prolist .proinfo h3, .prolist .proinfo h3 a, .prolist li i { color:#470800}
.prolist li a:hover { text-decoration:underline; color:#f60}
/*滚动*/
.scrollArea{ width:908px; height:255px; padding:20px 0; clear:both; position:relative; border-top:1px solid #ff7f07}
.scrollList { position:relative; float:left; width:862px; height:255px; margin:0 23px; overflow:hidden;}
.scrollArea ul { position:absolute;}
.scrollArea li a:hover img { border:1px solid #ff7f07}
.prev, .next { position:absolute; top:85px; width:23px; height:122px; cursor:pointer;}
.prev { left:0; background:url(http://images.shopin.net/images/ad/2013xiechuqing/btn.png) 0 0}
.next { right:0; background:url(http://images.shopin.net/images/ad/2013xiechuqing/btn.png) 0 -123px}
/*热卖*/
.hotSale { *padding-bottom:15px; margin-top:16px; background:#fff}
.hotSale h2 { height:58px; text-align:center; position:relative; font-weight:normal; border-top:1px solid #dbdada}
.hotSale h2 a { position:absolute; right:10px; top:10px; color:#fff}
.HSLady h2 { background:url(http://images.shopin.net/images/ad/2013xiechuqing/t3-bg.png) repeat-x 0 0}
.HSMan h2 { background:url(http://images.shopin.net/images/ad/2013xiechuqing/t4-bg.png) repeat-x 0 0}
.hotSale .prolist { padding:0 10px; overflow:hidden}
.hotSale .prolist ul { margin-left:-27px; *zoom:1}
.hotSale .prolist li { width:200px; margin:0 0 15px 27px}
.hotSale .prolist li img { width:200px; height:200px}
.hotSale .proinfo{ background:#737373;}
.HSLady li { border:1px solid #ff86a0}
.hotSale .proinfo del, .hotSale .proinfo h3, .hotSale .proinfo h3 a { overflow:hidden; vertical-align:middle; color:#fff}
.hotSale .proinfo del, .hotSale .proinfo strong { *float:left;}
.hotSale .proinfo del { width:45%; *margin-top:5px}
.hotSale .proinfo strong { width:55%; font-weight:normal;}
.hotSale .proinfo em { font:600 20px/20px 'microsoft yahei';}
.HSLady .proinfo strong { color:#ffa3b6}
.HSLady .proinfo em { color:#ffd4de}
.HSMan li { border:1px solid #5bb8ff}
.HSMan .proinfo strong { color:#8dceff}
.HSMan .proinfo em { color:#bbe2ff}
/*subnav*/
.atySubnav { position:absolute; right:-11px; z-index:99; width:111px; height:182px; background:url(http://images.shopin.net/images/ad/2013xiechuqing/subnav.png) no-repeat; top:50%; margin-top:-165px; _margin-top:expression(document.documentElement.scrollTop+10)px; left:50%; margin-left:485px}
.atySubnav ul { padding:16px 10px 0}
.atySubnav ul li { text-indent:-999em; overflow:hidden}
.atySubnav ul li a { outline:none; display:block; line-height:26px; margin-bottom:3px; zoom:1}
.atySubnav ul li.gotop { line-height:26px}
</style>
<script>
$(function() {
	var len = $("#focus ul li").length; //获取焦点图个数
	var sWidth = $("#focus li").width() + 11; //获取焦点图的宽度（显示面积）
	var index = 0;
	var picTimer;
	
	//以下代码添加数字按钮和按钮后的半透明条，还有上一页、下一页两个按钮
	var btn = "<div class='prev'></div><div class='next'></div>";
	$("#focus").append(btn);

	//上一页按钮
	$("#focus .prev").click(function() {
		index -= 4;
		if(index == -4) {index = len - 4;}
		showPics(index);
	});

	//下一页按钮
	$("#focus .next").click(function() {
		index += 4;
		if(index == len) {index = 0;}
		showPics(index);
	});

	//本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
	$("#focus ul").css("width",sWidth * (len));
	
	//鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
	$("#focus").hover(function() {
		clearInterval(picTimer);
	},function() {
		picTimer = setInterval(function() {
			showPics(index);
			index += 4;
			if(index == len) {index = 0;}
		},5000); //此5000代表自动播放的间隔，单位：毫秒
	}).trigger("mouseleave");
	
	//显示图片函数，根据接收的index值显示相应的内容
	function showPics(index) { //普通切换
		var nowLeft = -index*sWidth; //根据index值计算ul元素的left值
		$("#focus ul").stop(true,false).animate({"left":nowLeft},500); //通过animate()调整ul元素滚动到计算出的position
	}

	var $len = $("#focus1 li").length; //获取焦点图个数
	var $sWidth = $("#focus1 li").width() + 11; //获取焦点图的宽度（显示面积）
	var $index = 0;
	var $picTimer;
	
	//以下代码添加数字按钮和按钮后的半透明条，还有上一页、下一页两个按钮
	var $btn = "<div class='prevNext prev'></div><div class='prevNext next'></div>";
	$("#focus1").append($btn);

	//上一页按钮
	$("#focus1 .prev").click(function() {
		$index -= 4;
		if($index == -4) {$index = $len - 4;}
		$showPics($index);
	});

	//下一页按钮
	$("#focus1 .next").click(function() {
		$index += 4;
		if($index == $len) {$index = 0;}
		$showPics($index);
	});

	//本例为左右滚动，即所有li元素都是在同一排向左浮动，所以这里需要计算出外围ul元素的宽度
	$("#focus1 ul").css("width",$sWidth * ($len));
	
	//鼠标滑上焦点图时停止自动播放，滑出时开始自动播放
	$("#focus1").hover(function() {
		clearInterval($picTimer);
	},function() {
		$picTimer = setInterval(function() {
			$showPics($index);
			$index += 4;
			if($index == $len) {$index = 0;}
		},5000); //此5000代表自动播放的间隔，单位：毫秒
	}).trigger("mouseleave");
	
	//显示图片函数，根据接收的$index值显示相应的内容
	function $showPics($index) { //普通切换
		var $nowLeft = -$index*$sWidth; //根据$index值计算ul元素的left值
		$("#focus1 ul").stop(true,false).animate({"left":$nowLeft},500); //通过animate()调整ul元素滚动到计算出的position
	}
});
</script>
<!--[if IE 6]>
<script type="text/javascript" src="http://images.shopin.net/js/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript"> 
DD_belatedPNG.fix('.png,.MSBox,.prolist li i');
</script> 
<![endif]-->
</head>

<body>
<div id="page">
<img class="mt" src="http://images.shopin.net/images/ad/2013xiechuqing/top1.jpg" width="950" height="203"><img src="http://images.shopin.net/images/ad/2013xiechuqing/top2.jpg" width="950" height="203">
<img id="a" src="http://images.shopin.net/images/ad/2013xiechuqing/t1.jpg">
<div class="majorSuit">
	<div class="MSInner clear zc">
		<div class="MSBox MSLady">
			<div class="MSWrap">
				<p><a href="http://www.shopin.net/promotion/6832.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiechuqing/shose-lady-1.jpg" width="425" height="102"></a></p>
				<p><a href="http://www.shopin.net/promotion/6833.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiechuqing/shose-lady-2.jpg" width="425" height="102"></a></p>
				<p><a href="http://www.shopin.net/promotion/6547.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiechuqing/shose-lady-3.jpg" width="425" height="102"></a></p>
				<ul>
<li><a href="http://www.shopin.net/list-882-1469------0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/882_2.jpg"><span>2折起</span></a></li>
<li><a href="http://www.shopin.net/list-249-1469---1-399--0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/249_2.jpg"><span>￥199-￥399</span></a></li>
<li><a href="http://www.shopin.net/list-256-1469-0.05-0.49----0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/256_2.jpg"><span>2-4折</span></a></li>
<li><a href="http://www.shopin.net/list-237-1379-0.05-0.4----0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/237_2.jpg"><span>4折封</span></a></li>
<li><a href="http://www.shopin.net/list-1357-1469------0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1357_2.jpg"><span>2折起</span></a></li>
<li><a href="http://www.shopin.net/list-246-1469-0.05-0.4----0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/246_2.jpg"><span>2-4折</span></a></li>
<li><a href="http://www.shopin.net/shoes/brand/list-2135-1469-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/2135_2.jpg"><span>3折封</span></a></li>
<li><a href="http://www.shopin.net/promotion/5604.html" target="_blank"><img src="http://images.shopin.net/images//brand/242_2.jpg"><span>2-4折</span></a></li>
<li><a href="http://www.shopin.net/list-364-1379------0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/364_2.jpg"><span>3折起</span></a></li>
<li><a href="http://www.shopin.net/list-366-1379------0-1-/1.html" target="_blank"><img src="http://images.shopin.net/images//brand/366_2.jpg"><span>2折起</span></a></li>
<li><a href="http://www.shopin.net/list-226-1469---1-199--0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/226_2.jpg"><span>￥99-￥199</span></a></li>
<li><a href="http://www.shopin.net/list-304-1469------0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/304_2.jpg"><span>4折封</span></a></li>
				</ul>
			</div>
		</div>
		<div class="MSBox MSMan">
			<div class="MSWrap">
				<p><a href="http://www.shopin.net/promotion/6256.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiechuqing/shose-man-1.jpg" width="425" height="102"></a></p>
				<p><a href="http://www.shopin.net/promotion/6610.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiechuqing/shose-man-2.jpg" width="425" height="102"></a></p>
				<p><a href="http://www.shopin.net/promotion/6246.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiechuqing/shose-man-3.jpg" width="425" height="102"></a></p>
				<ul>
<li><a href="http://www.shopin.net/list-293-1382------0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/293_2.jpg"><span>2折起</span></a></li>
<li><a href="http://www.shopin.net/shoes/brand/list-223-1067---128-299---1.html" target="_blank"><img src="http://images.shopin.net/images/brand/223_2.jpg"><span>￥128-￥299</span></a></li>
<li><a href="http://www.shopin.net/promotion/7023.html" target="_blank"><img src="http://images.shopin.net/images/brand/325_2.jpg"><span>4折封</span></a></li>
<li><a href="http://www.shopin.net/list-229-1540-0.05-0.3----0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/229_2.jpg"><span>3折封</span></a></li>
<li><a href="http://www.shopin.net/list-1999-1382-0.05-0.3----0-1-/1.html" target="_blank"><img src="http://images.shopin.net/images//brand/1999_2.jpg"><span>￥99-￥299</span></a></li>
<li><a href="http://www.shopin.net/shoes/brand/list-1489-1540-0.05-0.4-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1489_2.jpg"><span>4折封</span></a></li>
<li><a href="http://www.shopin.net/list-317-1067------0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/317_2.jpg"><span>3折起</span></a></li>
<li><a href="http://www.shopin.net/list-771-1067------0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/771_2.jpg"><span>2折起</span></a></li>
<li><a href="http://www.shopin.net/list-1548-1382-0.05-0.49----0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1548_2.jpg"><span>4折封</span></a></li>
<li><a href="http://www.shopin.net/list-1439-1382-0.05-0.4----0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1439_2.jpg"><span>1-4折</span></a></li>
<li><a href="http://www.shopin.net/list-2304-1067------0-1-/1.html" target="_blank"><img src="http://images.shopin.net/images//brand/2304_2.jpg"><span>2-4折</span></a></li>
<li><a href="http://www.shopin.net/list-1093-1382-0.05-0.4----0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1093_2.jpg"><span>4折封</span></a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<img src="http://images.shopin.net/images/ad/2013xiechuqing/b1.png" width="950" height="28">
<div id="b" class="box">
	<img src="http://images.shopin.net/images/ad/2013xiechuqing/t2.jpg" width="910" height="40">
	<div class="limit">
		<div id="remainTime" class="countdown">
		<script language="javascript">  
		function _fresh(){  
		 var endtime=new Date("2013/04/07,23:59:59");//定义结束时间
		 var nowtime = new Date();  
		 var leftsecond=parseInt((endtime.getTime()-nowtime.getTime())/1000);  
		 __d=parseInt(leftsecond/3600/24);  
		 __h=parseInt((leftsecond/3600)%24);  
		 __m=parseInt((leftsecond/60)%60);  
		 __s=parseInt(leftsecond%60);  
		var c=new Date();
		var q=((c.getMilliseconds())%10);
		 document.getElementById("remainTime").innerHTML="<img src='http://images.shopin.net/images/ad/2013xiechuqing/clock.jpg' width='28' height='28' align='middle'>"+"活动时间倒计时："+"<span>"+__d+"</span>"+"天"+"<span>"+__h+"</span>"+"小时"+"<span>"+__m+"</span>"+"分"+"<span>"+__s+"</span>"+"秒";  
		 if(leftsecond<=0){  
			document.getElementById("star_modular").style.display="none";//结束后的状态
		 clearInterval(sh);  
		 }  
		}  
		_fresh()  
		var sh;  
		sh=setInterval(_fresh,100);  
		</script>
		</div>
<div id="focus" class="scrollArea">
	<div class="scrollList">
	<ul class="prolist">
<li><a href="http://www.shopin.net/product/1669219.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/05/12/Pic1669219_122782_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1669219.html" target="_blank">鳄鱼恤时尚水台浅口鞋</a></h3><del>市场价：598元</del><strong>抢购价：<em>99</em>元</strong></div><i>99</i></li>
<li><a href="http://www.shopin.net/product/2215067.html" target="_blank"><img src="http://images.shopin.net/images/63/2013/03/04/Pic2215067_182233_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2215067.html" target="_blank">Josiny甜美蝴蝶花饰单鞋</a></h3><del>市场价：499元</del><strong>抢购价：<em>169</em>元</strong></div><i>169</i></li>
<li><a href="http://www.shopin.net/product/1106718.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/04/25/Pic1106718_11130_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1106718.html" target="_blank">千佰莉靓丽花饰坡跟浅口鞋</a></h3><del>市场价：569元</del><strong>抢购价：<em>99</em>元</strong></div><i>99</i></li>
<li><a href="http://www.shopin.net/product/1647275.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/11/Pic1647275_11116_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1647275.html" target="_blank">红蜻蜓镶钻时装鞋</a></h3><del>市场价：759元</del><strong>抢购价：<em>127</em>元</strong></div><i>127</i></li>
<li><a href="http://www.shopin.net/product/1697658.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/03/19/Pic1697658_97522_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1697658.html" target="_blank">卡美多碎钻装饰平底单鞋</a></h3><del>市场价：798元</del><strong>抢购价：<em>199</em>元</strong></div><i>199</i></li>
<li><a href="http://www.shopin.net/product/1629306.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/02/14/Pic1629306_11101_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1629306.html" target="_blank">红蜻蜓米色蝴蝶花饰单鞋</a></h3><del>市场价：779元</del><strong>抢购价：<em>159</em>元</strong></div><i>159</i></li>
<li><a href="http://www.shopin.net/product/2202996.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/02/05/Pic2202996_11009_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2202996.html" target="_blank">古莎西优雅细跟职场单鞋</a></h3><del>市场价：799元</del><strong>抢购价：<em>299</em>元</strong></div><i>299</i></li>
<li><a href="http://www.shopin.net/product/2157451.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/12/14/Pic2157451_182219_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2157451.html" target="_blank">Josiny坡跟蝴蝶装饰系带单鞋</a></h3><del>市场价：499元</del><strong>抢购价：<em>100</em>元</strong></div><i>100</i></li>
	</ul>
	</div>
	</div>

<div id="focus1" class="scrollArea">
	<div class="scrollList">
	<ul class="prolist">
<li><a href="http://www.shopin.net/product/1760508.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/04/19/Pic1760508_11394_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1760508.html" target="_blank">红蜻蜓商务男鞋</a></h3><del>市场价：699元</del><strong>抢购价：<em>179</em>元</strong></div><i>179</i></li>
<li><a href="http://www.shopin.net/product/1205719.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/07/05/Pic1205719_82210_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1205719.html" target="_blank">柏图仕商务休闲男鞋</a></h3><del>市场价：938元</del><strong>抢购价：<em>188</em>元</strong></div><i>188</i></li>
<li><a href="http://www.shopin.net/product/1275219.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/05/21/Pic1275219_11516_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1275219.html" target="_blank">卡丹路真皮三接头牛津鞋</a></h3><del>市场价：998元</del><strong>抢购价：<em>188</em>元</strong></div><i>188</i></li>
<li><a href="http://www.shopin.net/product/655557.html" target="_blank"><img src="http://images.shopin.net/images/60/2010/09/02/Pic655557_70203_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/655557.html" target="_blank">CARTELO绑带款商务正装鞋</a></h3><del>市场价：960元</del><strong>抢购价：<em>192</em>元</strong></div><i>192</i></li>
<li><a href="http://www.shopin.net/product/1576561.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/12/23/Pic1576561_11797_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1576561.html" target="_blank">老船长系带牛皮休闲鞋</a></h3><del>市场价：638元</del><strong>抢购价：<em>158</em>元</strong></div><i>158</i></li>
<li><a href="http://www.shopin.net/product/1356908.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/08/17/Pic1356908_90831_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1356908.html" target="_blank">哥雷夫商务男鞋</a></h3><del>市场价：998元</del><strong>抢购价：<em>299</em>元</strong></div><i>299</i></li>
<li><a href="http://www.shopin.net/product/1545403.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/11/29/Pic1545403_136861_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1545403.html" target="_blank">柏图仕牛皮休闲男鞋</a></h3><del>市场价：938元</del><strong>抢购价：<em>356</em>元</strong></div><i>356</i></li>
<li><a href="http://www.shopin.net/product/745590.html" target="_blank"><img src="http://images.shopin.net/images/61/2010/09/30/Pic745590_11443_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/745590.html" target="_blank">思姆商务休闲男鞋</a></h3><del>市场价：698元</del><strong>抢购价：<em>255</em>元</strong></div><i>255</i></li>
	</ul>
	</div>
	</div>
	</div>
	<div id="c" class="hotSale HSLady">
		<h2><img src="http://images.shopin.net/images/ad/2013xiechuqing/t3.png"><a href="http://www.shopin.net/list--1469---1-199--0--/3.html" target="_blank">更多&gt;</a></h2>
		<div class="prolist clear zc">
			<ul>
<li><a href="http://www.shopin.net/product/1784679.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/04/28/Pic1784679_9258_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1784679.html" target="_blank">卡曼尼鱼嘴花饰浅口鞋</a></h3><del>市场价：590元</del><strong>抢购价：<em>99</em>元</strong></div><i>99</i></li>
<li><a href="http://www.shopin.net/product/1052820.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/03/09/Pic1052820_11031_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1052820.html" target="_blank">古莎西潮流豆豆鞋</a></h3><del>市场价：498元</del><strong>抢购价：<em>69</em>元</strong></div><i>69</i></li>
<li><a href="http://www.shopin.net/product/2012916.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/08/31/Pic2012916_182212_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2012916.html" target="_blank">Josiny俏皮蝴蝶花饰浅口鞋</a></h3><del>市场价：469元</del><strong>抢购价：<em>159</em>元</strong></div><i>159</i></li>
<li><a href="http://www.shopin.net/product/1107030.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/04/08/Pic1107030_108097_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1107030.html" target="_blank">BOOSARR时尚鱼嘴鞋</a></h3><del>市场价：758元</del><strong>抢购价：<em>63</em>元</strong></div><i>63</i></li>
<li><a href="http://www.shopin.net/product/1602658.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/01/18/Pic1602658_11158_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1602658.html" target="_blank">千佰莉简约真皮浅口鞋</a></h3><del>市场价：628元</del><strong>抢购价：<em>126</em>元</strong></div><i>126</i></li>
<li><a href="http://www.shopin.net/product/1107208.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/05/13/Pic1107208_108097_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1107208.html" target="_blank">BOOSARR靓丽浅口单鞋</a></h3><del>市场价：658元</del><strong>抢购价：<em>63</em>元</strong></div><i>63</i></li>
<li><a href="http://www.shopin.net/product/2107196.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/12/03/Pic2107196_13349_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/2107196.html" target="_blank">天美意潮流拼接浅口单鞋</a></h3><del>市场价：699元</del><strong>抢购价：<em>199</em>元</strong></div><i>199</i></li>
<li><a href="http://www.shopin.net/product/1665403.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/26/Pic1665403_219451_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1665403.html" target="_blank">古莎西时尚浅口单鞋</a></h3><del>市场价：598元</del><strong>抢购价：<em>99</em>元</strong></div><i>99</i></li>
			</ul>
		</div>
	</div>
	<div class="hotSale HSMan">
		<h2><img src="http://images.shopin.net/images/ad/2013xiechuqing/t4.png"><a href="http://www.shopin.net/shoes/list--1540---100-299----.html" target="_blank">更多&gt;</a></h2>
		<div class="prolist clear zc">
			<ul>
<li><a href="http://www.shopin.net/product/624645.html" target="_blank"><img src="http://images.shopin.net/images/58/2010/08/20/Pic624645_11516_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/624645.html" target="_blank">卡丹路牛皮商务休闲男鞋</a></h3><del>市场价：838元</del><strong>抢购价：<em>188</em>元</strong></div><i>188</i></li>
<li><a href="http://www.shopin.net/product/1973398.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/08/08/Pic1973398_152334_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1973398.html" target="_blank">奥康牛皮绑带商务男鞋</a></h3><del>市场价：829元</del><strong>抢购价：<em>188</em>元</strong></div><i>188</i></li>
<li><a href="http://www.shopin.net/product/1497301.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/10/28/Pic1497301_152334_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1497301.html" target="_blank">奥康商务正装鞋</a></h3><del>市场价：499元</del><strong>抢购价：<em>99</em>元</strong></div><i>99</i></li>
<li><a href="http://www.shopin.net/product/1940980.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/07/11/Pic1940980_11394_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1940980.html" target="_blank">红蜻蜓商务休闲男鞋</a></h3><del>市场价：579元</del><strong>抢购价：<em>179</em>元</strong></div><i>179</i></li>
<li><a href="http://www.shopin.net/product/1612138.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/02/01/Pic1612138_124433_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1612138.html" target="_blank">柏图仕牛皮生活休闲男鞋</a></h3><del>市场价：980元</del><strong>抢购价：<em>196</em>元</strong></div><i>196</i></li>
<li><a href="http://www.shopin.net/product/1829741.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/08/01/Pic1829741_192663_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1829741.html" target="_blank">CAT舒适休闲男鞋</a></h3><del>市场价：798元</del><strong>抢购价：<em>299</em>元</strong></div><i>299</i></li>
<li><a href="http://www.shopin.net/product/319569.html" target="_blank"><img src="http://images.shopin.net/images/60/2010/06/29/Pic319569_56225_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/319569.html" target="_blank">CAMEL男士休闲鞋</a></h3><del>市场价：798元</del><strong>抢购价：<em>283</em>元</strong></div><i>283</i></li>
<li><a href="http://www.shopin.net/product/1342987.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/08/08/Pic1342987_90845_0.resize_to.200x200.jpg"></a><div class="proinfo"><h3><a href="http://www.shopin.net/product/1342987.html" target="_blank">哥雷夫古铜色休闲男鞋</a></h3><del>市场价：868元</del><strong>抢购价：<em>259</em>元</strong></div><i>259</i></li>
			</ul>
		</div>
	</div>
	<div class="invain"></div>
	<img id="d" src="http://images.shopin.net/images/ad/2013xiechuqing/ol-l.jpg" width="429" height="410" border="0" usemap="#Map"><img src="http://images.shopin.net/images/ad/2013xiechuqing/ol-r.jpg" width="481" height="410" border="0" usemap="#Map2">
	<map name="Map2">
			<area shape="rect" coords="3,199,117,314" href="http://www.shopin.net/shoes/list--1469-0.05-0.3-1-99----/3.html" target="_blank">
			<area shape="rect" coords="136,216,243,274" href="http://www.shopin.net/shoes/list--1469-0.05-0.3-1-99----/3.html" target="_blank">
			<area shape="rect" coords="100,113,434,184" href="http://www.shopin.net/list--1112------0--2/2.html" target="_blank">
			<area shape="poly" coords="317,208,195,345,208,393,268,398,330,374,359,241,354,211" href="http://www.shopin.net/shoes/list--1469-0.05-0.3-1-199----/7.html" target="_blank">
			<area shape="rect" coords="363,245,471,302" href=" http://www.shopin.net/shoes/list--1469-0.05-0.3-1-199----/8.html" target="_blank">
			<area shape="rect" coords="11,338,138,393" href="http://www.shopin.net/handbags/list--1103--------/8.html" target="_blank">
	</map>
	<img src="http://images.shopin.net/images/ad/2013xiechuqing/ol-b.jpg" width="910" height="130" border="0" usemap="#Map3">
	<map name="Map3">
			<area shape="rect" coords="20,9,228,111" href="http://www.shopin.net/promotion/6965.html" target="_blank">
			<area shape="rect" coords="240,9,447,111" href="http://www.shopin.net/promotion/6997.html" target="_blank">
			<area shape="rect" coords="461,9,668,111" href="http://www.shopin.net/promotion/6977.html" target="_blank">
			<area shape="rect" coords="681,9,888,111" href="http://www.shopin.net/promotion/6783.html" target="_blank">
	</map>
	<map name="Map">
			<area shape="rect" coords="207,89,311,334" href="http://www.shopin.net/lady/list--1269-0.05-0.4------/9.html" target="_blank">
			<area shape="rect" coords="318,123,413,203" href="http://www.shopin.net/lady/list--1269-0.05-0.4------/4.html" target="_blank">
			<area shape="rect" coords="323,276,424,406" href="http://www.shopin.net/list--1103-0.2-0.4-99-499--1--/12.html" target="_blank">
	</map>
	<div class="invain"></div>
	<img src="http://images.shopin.net/images/ad/2013xiechuqing/ls-t.jpg" width="910" height="238" border="0" usemap="#Map4">
	<map name="Map4">
			<area shape="rect" coords="37,91,177,238" href="http://www.shopin.net/lady/list--1647-0.1-0.4------/6.html" target="_blank">
			<area shape="rect" coords="177,92,294,179" href="http://www.shopin.net/lady/list--1647-0.1-0.4------/6.html" target="_blank">
			<area shape="rect" coords="326,102,569,177" href="http://www.shopin.net/list--1631-0.05-0.4-50-199--1--/2.html" target="_blank">
			<area shape="rect" coords="236,183,428,238" href="http://www.shopin.net/list--1103------0--/16.html" target="_blank">
			<area shape="rect" coords="449,178,669,238" href="http://www.shopin.net/shoes/list--1631-0.05-0.4------/5.html" target="_blank">
	</map>
	<img src="http://images.shopin.net/images/ad/2013xiechuqing/ls-b.jpg" width="910" height="166" border="0" usemap="#Map5">
	<map name="Map5">
			<area shape="rect" coords="196,0,323,160" href="http://www.shopin.net/list--1103------0--/16.html" target="_blank">
			<area shape="rect" coords="33,0,177,166" href="http://www.shopin.net/lady/list--1647-0.1-0.4------/6.html" target="_blank">
			<area shape="rect" coords="387,10,533,130" href=" http://www.shopin.net/list--1112------0--/9.html" target="_blank">
	</map>
	<img src="http://images.shopin.net/images/ad/2013xiechuqing/ls-f.jpg" width="910" height="134" border="0" usemap="#Map6">
	<map name="Map6">
			<area shape="rect" coords="23,8,231,111" href="http://www.shopin.net/promotion/4547.html" target="_blank">
			<area shape="rect" coords="245,11,447,114" href="http://www.shopin.net/promotion/6950.html" target="_blank">
			<area shape="rect" coords="464,8,672,112" href="http://www.shopin.net/promotion/6999.html" target="_blank">
			<area shape="rect" coords="682,13,888,111" href="http://www.shopin.net/promotion/6820.html" target="_blank">
	</map>
</div>
</div>
<div id="atySubnav" class="atySubnav png">
	<ul>
    <li><a href="#a" title="大牌出清集中营">大牌出清集中营</a></li>
    <li><a href="#b" title="限时快抢专场">限时快抢专场</a></li>
    <li><a href="#c" title="经典名鞋TOP">经典名鞋TOP</a></li>
    <li><a href="#d" title="百变女王">百变女王</a></li>
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
 $("#atySubnav").smartFloat();
 $(function(){
	 var scWidth = $(window).width();
	 if (scWidth < 1024){
				$("#atySubnav").hide();
		 }else{
			 return false;
			 };
	 $(".subnav-close").click(function(){
		 $("#atySubnav").hide();
		 })
	 })
</script>
</body>
</html>
