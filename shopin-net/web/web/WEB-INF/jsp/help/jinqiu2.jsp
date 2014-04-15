<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>9月金秋抢货月,亿元让利,第二季,天美意,Tata,圣诺兰,女装,男装,童装,户外,4折封顶,72小时劲爆开抢,2012.9.1-9.3,仅3天</title>
<link href="http://images.shopin.net/images/ad/jinqiu1/jinqiu.css" rel="stylesheet" type="text/css">
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
<img class="mt" src="http://images.shopin.net/images/ad/jinqiu1/top-ad1.jpg"><img src="http://images.shopin.net/images/ad/jinqiu1/top-ad2.jpg">
<div class="box">
	<div id="a" class="ct-title lady">
  	<h2>女装/女鞋<img src="http://images.shopin.net/images/ad/jinqiu1/point.gif"></h2>
    <div id="remainTime" class="countdown">
			<script language="javascript">
        function _fresh(){
        var endtime=new Date("2012/09/03,23:59:59");//定义结束时间
        var nowtime = new Date();
        var leftsecond=parseInt((endtime.getTime()-nowtime.getTime())/1000);
        __d=parseInt(leftsecond/3600/24);
        __h=parseInt((leftsecond/3600)%24);
        __m=parseInt((leftsecond/60)%60);
        __s=parseInt(leftsecond%60);
        var c=new Date();
        var q=((c.getMilliseconds())%10);
        document.getElementById("remainTime").innerHTML="剩余："+"<span>"+__d+"</span>"+"天"+"<span>"+__h+"</span>"+"小时"+"<span>"+__m+"</span>"+"分"+"<span>"+__s+"</span>"+"秒";
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
  </div>
  <div class="zt-fcous mt">
    <div class="out-box">
      <ul>
<li style="display:block"><a href="http://www.shopin.net/promotion/3462.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-1-f1-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/4979.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-1-f2-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/4846.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-1-f3-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5643.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-1-f4-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5443.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-1-f5-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/4790.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-1-f6-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5889.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-1-f7-0831.jpg"></a></li>
      </ul>
      <div class="focus-nav">
        <div class="num">
          <a class="cur"><img src="http://images.shopin.net/images/ad/jinqiu1/area-1-l1-0831.jpg"><span><h3>职场系列 金秋抢货</h3><em>3折封</em></span></a>
          <a><img src="http://images.shopin.net/images/ad/jinqiu1/area-1-l2-0831.jpg"><span><h3>意大利女装 秋装聚惠</h3><em>4折封</em></span></a>
          <a><img src="http://images.shopin.net/images/ad/jinqiu1/area-1-l3-0831.jpg"><span><h3>浪漫秋装 新品特惠</h3><em>4折封</em></span></a>
          <a><img src="http://images.shopin.net/images/ad/jinqiu1/area-1-l4-0831.jpg"><span><h3>精品特卖惠</h3><em>￥150起</em></span></a>
          <a><img src="http://images.shopin.net/images/ad/jinqiu1/area-1-l5-0831.jpg"><span><h3>大牌秋鞋抢先购</h3><em>4折封</em></span></a>
          <a><img src="http://images.shopin.net/images/ad/jinqiu1/area-1-l6-0831.jpg"><span><h3>十足美丽 绽放金秋</h3><em>1-4折</em></span></a>
          <a><img src="http://images.shopin.net/images/ad/jinqiu1/area-1-l7-0831.jpg"><span><h3>品味与时尚完美演绎</h3><em>￥89起</em></span></a>
        </div>
        <div class="text"><a></a><a></a><a></a><a></a><a></a><a></a><a></a></div>
      </div>
    </div>
  </div>
  <div class="brandlist">
  	<ul>
    	<li class="li-first"><img src="http://images.shopin.net/images/ad/jinqiu1/bt1.jpg"></li>
<li><a href="http://www.shopin.net/lady/brands/1671.html" target="_blank"><img src="http://images.shopin.net/images//brand/1671_2.jpg">4折封</a></li>
<li><a href="http://www.shopin.net/lady/brands/55.html" target="_blank"><img src="http://images.shopin.net/images//brand/55_2.jpg">3折封</a></li>
<li><a href="http://www.shopin.net/lady/brands/2269.html" target="_blank"><img src="http://images.shopin.net/images//brand/2269_2.jpg">1.5折起</a></li>
<li><a href="http://www.shopin.net/lady/brands/112.html" target="_blank"><img src="http://images.shopin.net/images/brand/112_2.jpg">2-4折</a></li>
<li><a href="http://www.shopin.net/lady/brands/1789.html" target="_blank"><img src="http://images.shopin.net/images//brand/1789_2.jpg">4折封</a></li>
<li><a href="http://www.shopin.net/lady/brand/list-50-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/50_2.jpg">3折封</a></li>
    	<li class="li-first"><img src="http://images.shopin.net/images/ad/jinqiu1/bt2.jpg"></li>
<li><a href="http://www.shopin.net/shoes/brands/249.html" target="_blank"><img src="http://images.shopin.net/images/brand/249_2.jpg">2-4折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/969.html" target="_blank"><img src="http://images.shopin.net/images/brand/969_2.jpg">1.8折起</a></li>
<li><a href="http://www.shopin.net/shoes/brands/319.html" target="_blank"><img src="http://images.shopin.net/images/brand/319_2.jpg">1-4折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/187.html" target="_blank"><img src="http://images.shopin.net/images/brand/187_2.jpg">1-4折</a></li>
<li><a href="http://www.shopin.net/brands/2135.html" target="_blank"><img src="http://images.shopin.net/images/brand/2135_2.jpg">2折起</a></li>
<li><a href="http://www.shopin.net/shoes/brands/545.html" target="_blank"><img src="http://images.shopin.net/images/brand/545_2.jpg">4折封</a></li>
    </ul>
  </div>
  <div id="b" class="ct-title man mt">
  	<h2>男装/男鞋<img src="http://images.shopin.net/images/ad/jinqiu1/point.gif"></h2>
    <div id="remainTime1" class="countdown">
			<script language="javascript">
        function _fresh(){
        var endtime=new Date("2012/09/03,23:59:59");//定义结束时间
        var nowtime = new Date();
        var leftsecond=parseInt((endtime.getTime()-nowtime.getTime())/1000);
        __d=parseInt(leftsecond/3600/24);
        __h=parseInt((leftsecond/3600)%24);
        __m=parseInt((leftsecond/60)%60);
        __s=parseInt(leftsecond%60);
        var c=new Date();
        var q=((c.getMilliseconds())%10);
        document.getElementById("remainTime1").innerHTML="剩余："+"<span>"+__d+"</span>"+"天"+"<span>"+__h+"</span>"+"小时"+"<span>"+__m+"</span>"+"分"+"<span>"+__s+"</span>"+"秒";
        if(leftsecond<=0){
        document.getElementById("remainTime1").innerHTML="活动已结束";//结束后的状态
        clearInterval(sh);
        }
        }
        _fresh()
        var sh;
        sh=setInterval(_fresh,100);
      </script>
    </div>
  </div>
  <div class="zt-fcous mt">
    <div class="out-box">
      <ul>
<li style="display:block"><a href="http://www.shopin.net/promotion/5891.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-2-f1-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5893.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-2-f2-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5875.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-2-f3-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5845.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-2-f4-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5407.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-2-f5-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5656.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-2-f6-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5687.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-2-f7-0831.jpg"></a></li>
      </ul>
      <div class="focus-nav">
        <div class="num">
<a class="cur"><img src="http://images.shopin.net/images/ad/jinqiu1/area-2-l1-0831.jpg"><span><h3>央视男装 折扣专场</h3><em>4折封顶</em></span></a>
<a><img src="http://images.shopin.net/images/ad/jinqiu1/area-2-l2-0831.jpg"><span><h3>儒雅男装 底价大促</h3><em>￥92起</em></span></a>
<a><img src="http://images.shopin.net/images/ad/jinqiu1/area-2-l3-0831.jpg"><span><h3>意式男装 秋装聚惠</h3><em>4折封顶</em></span></a>
<a><img src="http://images.shopin.net/images/ad/jinqiu1/area-2-l4-0831.jpg"><span><h3>秋季单品超值购</h3><em>3折封顶</em></span></a>
<a><img src="http://images.shopin.net/images/ad/jinqiu1/area-2-l5-0831.jpg"><span><h3>品质男鞋 舒适优选</h3><em>￥151起</em></span></a>
<a><img src="http://images.shopin.net/images/ad/jinqiu1/area-2-l6-0831.jpg"><span><h3>透气舒适 男鞋精选</h3><em>￥168起</em></span></a>
<a><img src="http://images.shopin.net/images/ad/jinqiu1/area-2-l7-0831.jpg"><span><h3>秋季男鞋超值疯抢</h3><em>￥138起</em></span></a>
</div>
        <div class="text"><a></a><a></a><a></a><a></a><a></a><a></a><a></a></div>
      </div>
    </div>
  </div>
  <div class="brandlist">
  	<ul>
    	<li class="li-first"><img src="http://images.shopin.net/images/ad/jinqiu1/bt3.jpg"></li>
<li><a href="http://www.shopin.net/man/brand/list-764-1047-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/764_2.jpg">3折封</a></li>
<li><a href="http://www.shopin.net/man/brand/list-1765-1047-0.05-0.4-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1765_2.jpg">4折封</a></li>
<li><a href="http://www.shopin.net/man/brand/list-452-1048-0.05-0.4-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/452_2.jpg">4折封</a></li>
<li><a href="http://www.shopin.net/man/brand/list-2011-1047-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/2011_2.jpg">3折封</a></li>
<li><a href="http://www.shopin.net/man/brand/list-463-1047-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/463_2.jpg">3折封</a></li>
<li><a href="http://www.shopin.net/man/brand/list-361-1047-0.05-0.4-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/361_2.jpg">4折封</a></li>
    	<li class="li-first"><img src="http://images.shopin.net/images/ad/jinqiu1/bt4.jpg"></li>
<li><a href="http://www.shopin.net/shoes/brand/list-293-1382-0.05-0.49-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/293_2.jpg">2-4折</a></li>
<li><a href="http://www.shopin.net/shoes/brand/list-220-1067-0.05-0.49-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/220_2.jpg">2-4折</a></li>
<li><a href="http://www.shopin.net/shoes/brand/list-256-1382-0.05-0.49-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/256_2.jpg">3-4折</a></li>
<li><a href="http://www.shopin.net/shoes/brand/list-319-1382-0.05-0.49-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/319_2.jpg">2-4折</a></li>
<li><a href="http://www.shopin.net/shoes/brand/list-223-1067-0.05-0.49-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/223_2.jpg">2-4折</a></li>
<li><a href="http://www.shopin.net/shoes/brand/list-184-1382-0.05-0.49-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/184_2.jpg">1.9-4折</a></li>
    </ul>
  </div>
  <div id="c" class="ct-title child mt">
  	<h2>童装<img src="http://images.shopin.net/images/ad/jinqiu1/point.gif"></h2>
    <div id="remainTime2" class="countdown">
			<script language="javascript">
        function _fresh(){
        var endtime=new Date("2012/09/03,23:59:59");//定义结束时间
        var nowtime = new Date();
        var leftsecond=parseInt((endtime.getTime()-nowtime.getTime())/1000);
        __d=parseInt(leftsecond/3600/24);
        __h=parseInt((leftsecond/3600)%24);
        __m=parseInt((leftsecond/60)%60);
        __s=parseInt(leftsecond%60);
        var c=new Date();
        var q=((c.getMilliseconds())%10);
        document.getElementById("remainTime2").innerHTML="剩余："+"<span>"+__d+"</span>"+"天"+"<span>"+__h+"</span>"+"小时"+"<span>"+__m+"</span>"+"分"+"<span>"+__s+"</span>"+"秒";
        if(leftsecond<=0){
        document.getElementById("remainTime2").innerHTML="活动已结束";//结束后的状态
        clearInterval(sh);
        }
        }
        _fresh()
        var sh;
        sh=setInterval(_fresh,100);
      </script>
    </div>
  </div>
  <div class="zt-fcous mt">
    <div class="out-box">
      <ul>
<li style="display:block"><a href="http://www.shopin.net/promotion/5101.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-3-f1-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5730.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-3-f2-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5783.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-3-f3-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5886.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-3-f4-0831.jpg"></a></li>
      </ul>
      <div class="focus-nav">
        <div class="num">
<a class="cur"><img src="http://images.shopin.net/images/ad/jinqiu1/area-3-l1-0831.jpg"><span><h3>个性童年 挑战无限</h3><em>低至2折</em></span></a>
<a><img src="http://images.shopin.net/images/ad/jinqiu1/area-3-l2-0831.jpg"><span><h3>宝贝秋装抢先换</h3><em>4折封</em></span></a>
<a><img src="http://images.shopin.net/images/ad/jinqiu1/area-3-l3-0831.jpg"><span><h3>炫彩女童 完美变身</h3><em>2折起</em></span></a>
<a><img src="http://images.shopin.net/images/ad/jinqiu1/area-3-l4-0831.jpg"><span><h3>运动鞋服 玩转童年</h3><em>￥70起</em></span></a>
        </div>
        <div class="text"><a></a><a></a><a></a><a></a></div>
      </div>
    </div>
  </div>
  <div class="brandlist">
  	<ul>
    	<li class="li-first"><img src="http://images.shopin.net/images/ad/jinqiu1/bt5.jpg"></li>
<li><a href="http://www.shopin.net/children/brand/list-42-1070-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/42_2.jpg">4折封</a></li>
<li><a href="http://www.shopin.net/children/brand/list-287/3.html" target="_blank"><img src="http://images.shopin.net/images/brand/287_2.jpg">全场3折</a></li>
<li><a href="http://www.shopin.net/children/brand/list-48/8.html" target="_blank"><img src="http://images.shopin.net/images/brand/48_2.jpg">2-4折</a></li>
<li><a href="http://www.shopin.net/children/brand/list-9/4.html" target="_blank"><img src="http://images.shopin.net/images/brand/9_2.jpg">2折起</a></li>
<li><a href="http://www.shopin.net/children/brand/list-76-1070-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/76_2.jpg">4折封</a></li>
<li><a href="http://www.shopin.net/children/brand/list-1770/18.html" target="_blank"><img src="http://images.shopin.net/images/brand/1770_2.jpg">2.9折起</a></li>
    </ul>
  </div>
  <div id="d" class="ct-title sport mt">
  	<h2>运动休闲<img src="http://images.shopin.net/images/ad/jinqiu1/point.gif"></h2>
    <div id="remainTime3" class="countdown">
			<script language="javascript">
        function _fresh(){
        var endtime=new Date("2012/09/03,23:59:59");//定义结束时间
        var nowtime = new Date();
        var leftsecond=parseInt((endtime.getTime()-nowtime.getTime())/1000);
        __d=parseInt(leftsecond/3600/24);
        __h=parseInt((leftsecond/3600)%24);
        __m=parseInt((leftsecond/60)%60);
        __s=parseInt(leftsecond%60);
        var c=new Date();
        var q=((c.getMilliseconds())%10);
        document.getElementById("remainTime3").innerHTML="剩余："+"<span>"+__d+"</span>"+"天"+"<span>"+__h+"</span>"+"小时"+"<span>"+__m+"</span>"+"分"+"<span>"+__s+"</span>"+"秒";
        if(leftsecond<=0){
        document.getElementById("remainTime3").innerHTML="活动已结束";//结束后的状态
        clearInterval(sh);
        }
        }
        _fresh()
        var sh;
        sh=setInterval(_fresh,100);
      </script>
    </div>
  </div>
  <div class="zt-fcous mt">
    <div class="out-box">
      <ul>
<li style="display:block"><a href="http://www.shopin.net/promotion/5225.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-4-f1-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5892.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-4-f2-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5433.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-4-f3-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/4968.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-4-f4-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5836.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-4-f5-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5839.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-4-f6-0831.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5787.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/area-4-f7-0831.jpg"></a></li>
      </ul>
      <div class="focus-nav">
        <div class="num">
<a class="cur"><img src="http://images.shopin.net/images/ad/jinqiu1/area-4-l1-0831.jpg"><span><h3>四季运动装劲折</h3><em>外套￥59起</em></span></a>
<a><img src="http://images.shopin.net/images/ad/jinqiu1/area-4-l2-0831.jpg"><span><h3>潮品秋装超值购 </h3><em>4折封 </em></span></a>
<a><img src="http://images.shopin.net/images/ad/jinqiu1/area-4-l3-0831.jpg"><span><h3>户外装备大抢</h3><em>3折起</em></span></a>
<a><img src="http://images.shopin.net/images/ad/jinqiu1/area-4-l4-0831.jpg"><span><h3>户外出游装备必BUY</h3><em>3折起</em></span></a>
<a><img src="http://images.shopin.net/images/ad/jinqiu1/area-4-l5-0831.jpg"><span><h3>潮流男装 劲折专场</h3><em>4折封</em></span></a>
<a><img src="http://images.shopin.net/images/ad/jinqiu1/area-4-l6-0831.jpg"><span><h3>少淑装 秋装聚惠</h3><em>4折封</em></span></a>
<a><img src="http://images.shopin.net/images/ad/jinqiu1/area-4-l7-0831.jpg"><span><h3>旗下品牌 联合大促</h3><em>￥59起</em></span></a>
        </div>
        <div class="text"><a></a><a></a><a></a><a></a><a></a><a></a><a></a></div>
      </div>
    </div>
  </div>
  <div class="brandlist">
  	<ul>
    	<li class="li-first"><img src="http://images.shopin.net/images/ad/jinqiu1/bt6.jpg"></li>
<li><a href="http://www.shopin.net/outdoor/brands/602.html" target="_blank"><img src="http://images.shopin.net/images//brand/602_2.jpg">1.9折起</a></li>
<li><a href="http://www.shopin.net/outdoor/brands/1941.html" target="_blank"><img src="http://images.shopin.net/images/brand/1941_2.jpg">5-7折</a></li>
<li><a href="http://www.shopin.net/outdoor/brands/1616.html" target="_blank"><img src="http://images.shopin.net/images/brand/1616_2.jpg">3折起</a></li>
<li><a href="http://www.shopin.net/outdoor/brands/593.html" target="_blank"><img src="http://images.shopin.net/images/brand/593_2.jpg">1.8折起</a></li>
<li><a href="http://www.shopin.net/outdoor/brands/605.html" target="_blank"><img src="http://images.shopin.net/images/brand/605_2.jpg">3折起</a></li>
<li><a href="http://www.shopin.net/outdoor/brands/612.html" target="_blank"><img src="http://images.shopin.net/images/brand/612_2.jpg">3折起</a></li>
    	<li class="li-first"><img src="http://images.shopin.net/images/ad/jinqiu1/bt7.jpg"></li>
<li><a href="http://www.shopin.net/sports/brands/280.html" target="_blank"><img src="http://images.shopin.net/images/brand/280_2.jpg">4折起</a></li>
<li><a href="http://www.shopin.net/sports/brands/1638.html" target="_blank"><img src="http://images.shopin.net/images/brand/1638_2.jpg">3折起</a></li>
<li><a href="http://www.shopin.net/sports/brands/537.html" target="_blank"><img src="http://images.shopin.net/images/brand/537_2.jpg">3折起</a></li>
<li><a href="http://www.shopin.net/casual/brands/2151.html" target="_blank"><img src="http://images.shopin.net/images/brand/2151_2.jpg">3.5折起</a></li>
<li><a href="http://www.shopin.net/casual/brand/list-293-1753.html" target="_blank"><img src="http://images.shopin.net/images/brand/293_2.jpg">3折起</a></li>
<li><a href="http://www.shopin.net/casual/brands/500.html" target="_blank"><img src="http://images.shopin.net/images/brand/500_2.jpg">￥83起</a></li>
    </ul>
  </div>
  <img id="e" class="mt mb" src="http://images.shopin.net/images/ad/jinqiu1/t2.png">
  
  <a href="http://www.shopin.net/promotion/5894.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/teacher.jpg"></a>
  
  <div style="position:relative"><a style="position:absolute; right:20px; top:20px; color:#fff;" href="http://www.shopin.net/list---0.05-0.11------.html" target="_blank">更多&gt;&gt;</a><img id="f" class="mt" src="http://images.shopin.net/images/ad/jinqiu1/t4.png"></div>
  <ul class="prolist">
    <li><a href="http://www.shopin.net/product/1619392.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/04/11/Pic1619392_76029_0_1.jpg" /><h3>诺恩气质印花衬衫</h3></a><del>￥498</del><em>￥36</em></li>
    <li><a href="http://www.shopin.net/product/1697798.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/06/30/Pic1697798_136338_0_1.jpg" /><h3>JIMANNO豹纹荷叶花边衬衫</h3></a><del>￥2299</del><em>￥135</em></li>
    <li><a href="http://www.shopin.net/product/343534.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/04/12/Pic343534_166102_0_1.jpg" /><h3>IVRESSE印花拼接连衣裙</h3></a><del>￥1380</del><em>￥64</em></li>
    <li><a href="http://www.shopin.net/product/1822957.html" target="_blank"><img src="http://images.shopin.net/images//68/2012/05/17//Pic1822957_1221_0_1.jpg" /><h3>桑扶兰刺绣花朵聚拢文胸</h3></a><del>￥158</del><em>￥30</em></li>
    <li><a href="http://www.shopin.net/product/288290.html" target="_blank"><img src="http://images.shopin.net/images/60/2010/11/09/Pic288290_28930_0_1.jpg" /><h3>MAND.YAMAN无痕绑脖聚拢文胸</h3></a><del>￥389</del><em>￥46</em></li>
    <li><a href="http://www.shopin.net/product/1699330.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/04/27/Pic1699330_69343_0_1.jpg" /><h3>博尼动物纹蕾丝底裤</h3></a><del>￥110</del><em>￥20</em></li>
    <li><a href="http://www.shopin.net/product/1675502.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/05/05/Pic1675502_123142_0_1.jpg" /><h3>huayin时尚修身小西服</h3></a><del>￥1280</del><em>￥98</em></li>
    <li><a href="http://www.shopin.net/product/1841288.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/06/30/Pic1841288_185068_0_1.jpg" /><h3>JIMANNO金色亮片装饰小西服</h3></a><del>￥3299</del><em>￥297</em></li>
    <li><a href="http://www.shopin.net/product/1947954.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/07/20/Pic1947954_185046_0_1.jpg" /><h3>柯里卡气质印花短款小西服</h3></a><del>￥1890</del><em>￥160</em></li>
    <li><a href="http://www.shopin.net/product/1979213.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/08/13/Pic1979213_184519_0_1.jpg" /><h3>柯里卡灰色斗篷羊毛大衣</h3></a><del>￥2190</del><em>￥240</em></li>
    <li><a href="http://www.shopin.net/product/1584864.html" target="_blank"><img src="http://images.shopin.net/images/68/2011/12/29/Pic1584864_123084_0_1.jpg" /><h3>huayin深紫色大翻领风衣</h3></a><del>￥1580</del><em>￥134</em></li>
    <li><a href="http://www.shopin.net/product/1567591.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/12/16/Pic1567591_123088_0_1.jpg" /><h3>huayin闪亮宽松版系带风衣</h3></a><del>￥1580</del><em>￥139</em></li>
    <li><a href="http://www.shopin.net/product/1323679.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/07/25/Pic1323679_14441_0_1.jpg" /><h3>富贵鸟拼色牛仔布单鞋</h3></a><del>￥859</del><em>￥99</em></li>
    <li><a href="http://www.shopin.net/product/362578.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/02/27/Pic362578_166103_0_1.jpg" /><h3>FURUSI网状布纹羊皮单鞋</h3></a><del>￥898</del><em>￥100</em></li>
    <li><a href="http://www.shopin.net/product/1138395.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/04/20/Pic1138395_8188_0_1.jpg" /><h3>伊人装饰花鱼嘴女单鞋</h3></a><del>￥798</del><em>￥99</em></li>
    <li><a href="http://www.shopin.net/product/1074170.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/05/30/Pic1074170_124651_0_1.jpg" /><h3>KUUKI黑羊京酒红弹力布女单鞋</h3></a><del>￥769</del><em>￥89</em></li>
    <li><a href="http://www.shopin.net/product/258466.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/06/29/Pic258466_100380_0_1.jpg" /><h3>菲尔图深灰色羊绒休闲平底鞋</h3></a><del>￥630</del><em>￥79</em></li>
    <li><a><img src="http://images.shopin.net/images/60/2012/04/28/Pic1784205_11073_0_1.jpg" /><h3>宾度驼色羊皮坡跟女鞋</h3></a><del>￥859</del><em>￥120</em><span class="cornermark"></span></li>
    <li><a href="http://www.shopin.net/product/378389.html" target="_blank"><img src="http://images.shopin.net/images/61/2010/07/02/Pic378389_8590_0_1.jpg" /><h3>卡曼尼金色羊皮网布深口鞋</h3></a><del>￥820</del><em>￥99</em></li>
    <li><a href="http://www.shopin.net/product/1699174.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/04/15/Pic1699174_97522_0_1.jpg" /><h3>卡美多米白水染打蜡牛皮凉靴</h3></a><del>￥898</del><em>￥99</em></li>
    <li><a href="http://www.shopin.net/product/1501214.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/08/17/Pic1501214_58819_0_1.jpg" /><h3>KUUKI深啡色牛皮长靴</h3></a><del>￥1999</del><em>￥199</em></li>
    <li><a href="http://www.shopin.net/product/1351621.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/07/09/Pic1351621_18280_0_1.jpg" /><h3>KSTYLE复古款手拎斜挎两用包</h3></a><del>￥538</del><em>￥100</em></li>
    <li><a href="http://www.shopin.net/product/1714495.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/07/09/Pic1714495_62451_0_1.jpg" /><h3>oodfumiture休闲链条包</h3></a><del>￥579</del><em>￥89</em></li>
    <li><a href="http://www.shopin.net/product/935067.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/01/12/Pic935067_18470_0_1.jpg" /><h3>LAFITE玫红手提两用包</h3></a><del>￥659</del><em>￥89</em></li>
    <li><a href="http://www.shopin.net/product/621514.html" target="_blank"><img src="http://images.shopin.net/images/60/2010/11/22/Pic621514_84475_0_1.jpg" /><h3>WRC纯棉长袖T恤</h3></a><del>￥799</del><em>￥79</em></li>
    <li><a href="http://www.shopin.net/product/1539151.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/04/12/Pic1539151_154538_0_1.jpg" /><h3>Baleno时尚纯棉帽衫</h3></a><del>￥320</del><em>￥59</em></li>
    <li><a href="http://www.shopin.net/product/1642390.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/02/17/Pic1642390_77335_0_1.jpg" /><h3>费尔法特格纹衬衫</h3></a><del>￥1080</del><em>￥99</em></li>
    <li><a href="http://www.shopin.net/product/1501108.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/11/07/Pic1501108_20094_0_1.jpg" /><h3>卡斯彼龙牛仔长裤</h3></a><del>￥498</del><em>￥44</em></li>
    <li><a href="http://www.shopin.net/product/1606804.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/07/13/Pic1606804_134803_0_1.jpg" /><h3>帕古茨商务休闲外套</h3></a><del>￥1680</del><em>￥92</em></li>
    <li><a href="http://www.shopin.net/product/1991357.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/08/23/Pic1991357_90048_0_1.jpg" /><h3>杰奎普瑞中长款风衣</h3></a><del>￥1980</del><em>￥200</em></li>
    <li><a href="http://www.shopin.net/product/1341359.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/08/18/Pic1341359_28379_0_1.jpg" /><h3>REEBOK男式经典城市系列夹克</h3></a><del>￥480</del><em>￥69</em></li>
    <li><a href="http://www.shopin.net/product/1412366.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/12/21/Pic1412366_28379_0_1.jpg" /><h3>REEBOK女式音乐系列夹克</h3></a><del>￥680</del><em>￥69</em></li>
    <li><a href="http://www.shopin.net/product/1112679.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/11/24/Pic1112679_49154_0_1.jpg" /><h3>凯图TRV男式冲锋衣</h3></a><del>￥1038</del><em>￥177</em></li>
    <li><a href="http://www.shopin.net/product/868951.html" target="_blank"><img src="http://images.shopin.net/images/58/2010/11/29/Pic868951_49180_0_1.jpg" /><h3>凯图MT男式三合一冲锋衣</h3></a><del>￥1284</del><em>￥199</em></li>
    <li><a href="http://www.shopin.net/product/700515.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/08/05/Pic700515_23088_0_1.jpg" /><h3>KAILAS男式夹棉风衣</h3></a><del>￥1680</del><em>￥299</em></li>
    <li><a href="http://www.shopin.net/product/868954.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/04/02/Pic868954_49181_0_1.jpg" /><h3>凯图TRV女式冲锋衣</h3></a><del>￥1284</del><em>￥199</em></li>
    <li><a href="http://www.shopin.net/product/1967106.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/08/03//Pic1967106_160223_0_1.jpg" /><h3>汪小荷羊毛大衣</h3></a><del>￥569</del><em>￥99</em></li>
    <li><a href="http://www.shopin.net/product/463.html" target="_blank"><img src="http://images.shopin.net/images//66/2011/09/20//Pic463_103537_0_1.jpg" /><h3>昱璐蓝色条纹羊毛衫</h3></a><del>￥269</del><em>￥49</em></li>
    <li><a href="http://www.shopin.net/product/695.html" target="_blank"><img src="http://images.shopin.net/images//66/2011/10/21//Pic695_54970_0_1.jpg" /><h3>昱璐纯棉单排系扣帽衫</h3></a><del>￥209</del><em>￥39</em></li>
    <li><a href="http://www.shopin.net/product/164.html" target="_blank"><img src="http://images.shopin.net/images//68/2011/10/20//Pic164_213_0_1.jpg" /><h3>菲格咪妮绣花长裤</h3></a><del>￥178</del><em>￥32</em></li>
    <li><a href="http://www.shopin.net/product/720261.html" target="_blank"><img src="http://images.shopin.net/images//58/2010/09/15//Pic720261_77530_0_1.jpg" /><h3>韦氏羽绒服含绒量80%</h3></a><del>￥668</del><em>￥99</em></li>
    <li><a href="http://www.shopin.net/product/1550655.html" target="_blank"><img src="http://images.shopin.net/images//58/2012/08/10//Pic1550655_2324_0_1.jpg" /><h3>DORDOR HORSE休闲鞋</h3></a><del>￥438</del><em>￥77</em></li>
    <li><a href="http://www.shopin.net/product/1952121.html" target="_blank"><img src="http://images.shopin.net/images//68/2012/07/20/Pic1952121_187557_0_1.jpg" /><h3>LIFE HOME护颈B形曲线枕</h3></a><del>￥688</del><em>￥99</em></li>
    <li><a href="http://www.shopin.net/product/1984683.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/08/18/Pic1984683_192798_0_1.jpg" /><h3>法尔曼夏日艳彩四件套</h3></a><del>￥2880</del><em>￥491</em></li>
    <li><a href="http://www.shopin.net/product/1992805.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/08/24/Pic1992805_187557_0_1.jpg" /><h3>LIFE HOME可爱猫珊瑚绒毯</h3></a><del>￥368</del><em>￥69</em></li>
    <li><a href="http://www.shopin.net/product/1967110.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/08/02/Pic1967110_187557_0_1.jpg" /><h3>LIFEHOME 200*230羊毛被</h3></a><del>￥2390</del><em>￥456</em></li>
    <li><a href="http://www.shopin.net/product/1984664.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/08/18/Pic1984664_192798_0_1.jpg" /><h3>法尔曼幸福守候四件套</h3></a><del>￥3380</del><em>￥607</em></li>
    <li><a href="http://www.shopin.net/product/1998138.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/08/24/Pic1998138_187557_0_1.jpg" /><h3>LIFEHOME纯棉浴巾</h3></a><del>￥289</del><em>￥56</em></li>
      </ul>
  
  <!--ul class="salelist">
  	<li><a href="http://www.shopin.net/promotion/5854.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu/img_01_0829.jpg"></a></li>
  </ul-->
  <div id="g" class="moresale mt mb"><a href="http://www.shopin.net/promotions.html" target="_blank">更多&gt;&gt;</a></div>
  <ul class="actlist mt">
  	<li><a href="http://www.shopin.net/promotion/5868.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/act_01_0831.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/5720.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/act_02_0831.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/5654.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/act_03_0831.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/5869.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/act_04_0831.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/5865.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/act_05_0831.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/5887.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/act_06_0831.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/5885.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/act_07_0831.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/5014.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu1/act_08_0831.jpg"></a></li>
  </ul>
</div>
<div id="summer_subnav" class="summer_subnav png">
  <a class="subnav-close" href="javascript:void(0);" title="关闭">关闭</a>
	<ul>
    <li class="ldwarf"><a href="#a" title="72小时爆抢区">72小时爆抢区</a></li>
		<li class="ldwarf"><a href="#a" title="女装/女鞋">女装/女鞋</a></li>
		<li class="ldwarf"><a href="#b" title="男装/男鞋">男装/男鞋</a></li>
		<li class="ldwarf"><a href="#c" title="童装">童装</a></li>
		<li class="ldwarf"><a href="#d" title="运动/休闲">运动/休闲</a></li>
		<li><a href="#e" title="教师节礼品">教师节礼品</a></li>
		<li><a href="#f" title="千款1折即时">千款1折即时</a></li>
		<li><a href="#g" title="正在进行活动">正在进行活动</a></li>
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