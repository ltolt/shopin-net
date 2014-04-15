<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>2012末日暴走价,冬装全场3折起,,淘跑鞋,adidas，NIKE,大牌,经典运动鞋199元爆抢,网络独享,大牌内购会独家爆抢,2012.12.13至12.19</title>
<style>
img { vertical-align:top}
.cl{clear:both}
.clear:after { height:0; clear:both; content:"."; visibility:hidden; display:block;}
.zm{zoom:1}
.mt { margin-top:10px}
.tc { text-align:center}
#header, .backgroundffffff { width:950px; margin:0 auto}
#page { width:auto; position:static;}
.box { width:950px; margin:10px auto; background:#670001}
.wrap { padding:10px 23px }
h2.hd{ height:53px; padding:0 30px; text-align:center; font:600 32px/50px 'microsoft yahei','黑体'; background:#9c0002; color:#eff1e8;}
h2.hd a.more { float:right; margin:20px 0 0 0; _display:inline; font-weight:bold; font-size:18px; line-height:18px;}
h2.hd a,h2.hd a:hover { color:#fff;}
/*count down*/
.countdown { height:60px; overflow:hidden; text-align:center; font:800 28px/60px 'microsoft yahei'; color:#fff;background-position: left 15px; padding: 0 0 0 50px; }
.countdown span { font:800 28px/60px 'microsoft yahei'; color:#ff0}
/*prolist*/
.salelist, .prolist, .zt-fcous { margin-bottom:15px; overflow:hidden;}
.prolist ul { margin-left:-5px; zoom:1}
.prolist li { float:left; width:222px; margin:10px 0 0 5px; _display:inline; text-align:center; color:#fff}
.prolist li h3 { height:30px; line-height:36px; overflow:hidden; font-weight:normal; color:#fff;}
.prolist li a:hover, .prolist li a:hover h3 { color:#ff0}
.prolist li em { margin-left:10px; font-size:14px; font-weight:600; color:#ff0}
.prolist li p { line-height:18px; padding:4px 0; font-weight:600; color:#ff0}
/*salelist*/
.salelist ul { margin-left:-11px; zoom:1}
.salelist li { float:left; width:446px; margin:11px 0 0 11px; _display:inline}
/*fcous*/
.zt-fcous{width:100%;height:489px;overflow:hidden;position:relative}
.out-box{width:100%;height:489px;display:table;}
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
	<img src="http://images.shopin.net/images/ad/mori/top1.jpg" width="950" height="280"><img src="http://images.shopin.net/images/ad/mori/top2.jpg" width="950" height="280">
	<div class="wrap">
		<h2 class="hd">淘·跑鞋　大牌经典运动鞋一口价！</h2>
		<div id="remainTime" class="countdown">
      <script language="javascript" type="text/javascript">
        function _fresh(){
        var endtime=new Date("2012/12/19,23:59:59");//定义结束时间
        var nowtime = new Date();
        var leftsecond=parseInt((endtime.getTime()-nowtime.getTime())/1000);
        __d=parseInt(leftsecond/3600/24);
        __h=parseInt((leftsecond/3600)%24);
        __m=parseInt((leftsecond/60)%60);
        __s=parseInt(leftsecond%60);
        var c=new Date();
        var q=((c.getMilliseconds())%10);
        document.getElementById("remainTime").innerHTML="剩余："+__d+"天&nbsp;"+__h+"小时&nbsp;"+__m+"分&nbsp;"+__s+"秒&nbsp;";
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
		<div class="prolist clear zm">
			<ul>
				<li><a href="http://www.shopin.net/product/2158227.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/img01.jpg" width="220" height="220"><h3>NIKE阿甘男士文化鞋</h3></a><del>￥699</del><em><a href="http://www.shopin.net/product/2158227.html" target="_blank"><img src="http://images.shopin.net/images/ad/tuan12/buy.png"></a></em></li>
				<li><a href="http://www.shopin.net/product/1793132.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/img02.jpg" width="220" height="220"><h3>adidas男士轻便训练鞋</h3></a><del>￥580</del><em><a href="http://www.shopin.net/product/1793132.html" target="_blank"><img src="http://images.shopin.net/images/ad/tuan12/buy.png"></a></em></li>
				<li><a href="http://www.shopin.net/product/1978008.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/img03.jpg" width="220" height="220"><h3>adidas男士缓震训练鞋</h3></a><del>￥580</del><em><a href="http://www.shopin.net/product/1978008.html" target="_blank"><img src="http://images.shopin.net/images/ad/tuan12/buy.png"></a></em></li>
				<li><a href="http://www.shopin.net/product/1978028.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/img04.jpg" width="220" height="220"><h3>adidas男士多功能室内鞋</h3></a><del>￥580</del><em><a href="http://www.shopin.net/product/1978028.html" target="_blank"><img src="http://images.shopin.net/images/ad/tuan12/buy.png"></a></em></li>
				<li><a href="http://www.shopin.net/product/2146045.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/img05.jpg" width="220" height="220"><h3>adidas男士清风系列跑鞋</h3></a><del>￥480</del><em><a href="http://www.shopin.net/product/2146045.html" target="_blank"><img src="http://images.shopin.net/images/ad/tuan12/buy.png"></a></em></li>
				<li><a href="http://www.shopin.net/product/1815008.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/img06.jpg" width="220" height="220"><h3>adidas男士休闲运动鞋</h3></a><del>￥460</del><em><a href="http://www.shopin.net/product/1815008.html" target="_blank"><img src="http://images.shopin.net/images/ad/tuan12/buy.png"></a></em></li>
				<li><a href="http://www.shopin.net/product/1760401.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/img07.jpg" width="220" height="220"><h3>adidas男士清风系列跑鞋</h3></a><del>￥780</del><em><a href="http://www.shopin.net/product/1760401.html" target="_blank"><img src="http://images.shopin.net/images/ad/tuan12/buy.png"></a></em></li>
			</ul>
		</div>
		<h2 class="hd"><a class="more" href="http://www.shopin.net/channel/brandstores.html" target="_blank">更多&gt;&gt;</a>末日暴走　大牌冬装3折疯抢</h2>
		<div class="salelist clear zm">
			<ul>
				<li><a href="http://www.shopin.net/promotion/6313.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/sale-01.jpg" width="446" height="147"></a></li>
				<li><a href="http://www.shopin.net/promotion/6456.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/sale-02.jpg" width="446" height="147"></a></li>
				<li><a href="http://www.shopin.net/promotion/6160.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/sale-03.jpg" width="446" height="147"></a></li>
				<li><a href="http://www.shopin.net/promotion/6148.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/sale-04.jpg" width="446" height="147"></a></li>
				<li><a href="http://www.shopin.net/promotion/6545.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/sale-05.jpg" width="446" height="147"></a></li>
				<li><a href="http://www.shopin.net/promotion/6245.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/sale-06.jpg" width="446" height="147"></a></li>
				<li><a href="http://www.shopin.net/promotion/4960.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/sale-07.jpg" width="446" height="147"></a></li>
				<li><a href="http://www.shopin.net/promotion/5918.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/sale-08.jpg" width="446" height="147"></a></li>
				<li><a href="http://www.shopin.net/promotion/5050.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/sale-09.jpg" width="446" height="147"></a></li>
				<li><a href="http://www.shopin.net/promotion/5992.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/sale-10.jpg" width="446" height="147"></a></li>
				<li><a href="http://www.shopin.net/promotion/6339.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/sale-11.jpg" width="446" height="147"></a></li>
				<li><a href="http://www.shopin.net/promotion/6254.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/sale-12.jpg" width="446" height="147"></a></li>
			</ul>
		</div>
		<h2 class="hd"><a class="more" href="http://www.shopin.net/list---0.05-0.3------.html" target="_blank">更多&gt;&gt;</a>末日暴走　万款冬装3折疯抢</h2>
		<div class="zt-fcous mt">
			<div class="out-box">
				<ul>
					<li style="display:block;"><a href="http://www.shopin.net/list--1740-0.05-0.3----0-1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/f1.jpg" /></a></li>		
					<li><a href="http://www.shopin.net/list--1720-0.05-0.3-----1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/f2.jpg" /></a></li>		
					<li><a href="http://www.shopin.net/shoes/list--1827-0.05-0.3------.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/f3.jpg" /></a></li>		
					<li><a href="http://www.shopin.net/underwear/list--1884--------.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/f4.jpg" /></a></li>		
					<li><a href="http://www.shopin.net/outdoor/list--1303-0.05-0.3------.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/f5.jpg" /></a></li>		
					<li><a href="http://www.shopin.net/outdoor/list--1327-0.05-0.3------.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/f6.jpg" /></a></li>		
					<li><a href="http://www.shopin.net/shoes/list--1463-0.05-0.3------.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/f7.jpg" /></a></li>		
				</ul>
				<div class="focus-nav">
					<div class="num">
						<a class="cur"><span><h3>情侣羽绒 约&quot;惠&quot;专场</h3><em>男女款羽绒服 低至2折</em></span></a>
						<a><span><h3>年终大促 末日保暖狂欢</h3><em>时尚羊毛/羊绒衫 3折封</em></span></a>
						<a><span><h3>高挑长靴 秀出美腿曲线</h3><em>全场 3折封</em></span></a>
						<a><span><h3>情侣冬日保暖必备</h3><em>男女保暖套装￥65起</em></span></a>
						<a><span><h3>时尚保暖 源自专业</h3><em>三合一冲锋衣 低至1.8折</em></span></a>
						<a><span><h3>专业技术 出游必备</h3><em>登山鞋 徒步鞋 3折封</em></span></a>
						<a><span><h3>时尚男人 靴色风采</h3><em>冬靴 3折封</em></span></a>
					</div>
					<div class="text"><a></a><a></a><a></a><a></a><a></a><a></a><a></a></div>
				</div>
			</div>
		</div>
		<p><a href="http://www.shopin.net/help/signup.html" target="_blank"><img src="http://images.shopin.net/images/ad/mori/ad1.jpg"></a></p>
	</div>
</div>
</body>
</html>