<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>上品12周年庆,折扣航母震撼启航,600品牌十万款商品折上再9折,每天2小时夜场再享折上惊喜价,48大品牌轮播爆抢,1元网络特供单品秒杀,会员回馈满￥999送好礼,百丽,莱尔斯丹,NIKE,华歌尔,JESSCIA,ESPRIT,女装,男装,鞋,运动,2012.10.25-11.4,仅11天</title>
<style>
/* reset */
a{color:#000}
img{vertical-align:top}
.fl{float:left}
.fr{float:right}
.tc,.zt_title {text-align:center}
.cl{clear:both}
.clear:after { height:0; clear:both; content:"."; visibility:hidden; display:block;}
.mt{margin-top:10px}
.mb{margin-bottom:10px}
.ml{margin-left:10px}
.pt{padding-top:10px}
.pb{padding-bottom:10px}
.zm{zoom:1}
/*main*/
.sp-ms { background:#34b5ca}
.box { background:#eff0e8}
.box *{ _zoom:1}
.tab-hd { height:27px; padding-left:5px; border-bottom:1px solid #ca2208}
.tab-hd li { float:left; margin:0 1px 0 0; _display:inline;}
.tab-hd li a { display:block; width:126px; height:27px; text-indent:-99em; overflow:hidden; background-image:url(http://images.shopin.net/images/ad/dianqing1210/t2.png);  background-repeat:no-repeat}
.tab-hd li a.f { width:84px;}
.tab-hd li a.s { background-position:0 -140px}
.tab-hd li a.s:hover, .tab-hd li.cur a.s, .tab-hd li.cur a.s:hover { background-position:0 -140px}
.tab-hd li a.t { background-position:0 -84px}
		.tab-hd li a.t,.tab-hd li a.t:hover, .tab-hd li.cur a.t, .tab-hd li.cur a.t:hover { background-position:0 -168px}
.tab-bd { margin:4px 0; padding:0 0 0 3px}
.tab-bd .item li { float:left; width:230px; height:185px; padding:4px 3px; overflow:hidden; _display:inline; background:url(http://images.shopin.net/images/ad/dianqing1210/box.png)}
/*new sale list*/
.new-sale-list { margin:5px 0}
.new-sale-list li { float:left; width:237px; overflow:hidden}
/*start-wrap*/
.start-wrap { _width:932px; overflow:hidden; padding:0 0 10px 10px; margin-bottom:4px; border:4px solid #ea5421;}
.start-wrap .item { float:left; width:454px; overflow:hidden; margin:8px 10px 0 0; border:1px solid #ea5421;}
.start-wrap .item .hd { position:relative; height:20px; padding-left:25px; margin:1px 5px 0; font:600 14px/20px 'microsoft yahei'; background:#ea5421; color:#fff;}
.start-wrap .item .hd em { position:absolute; top:6px; left:8px; width:9px; height:9x; line-height:9px; background:#fff}
.start-wrap .item .hd a { float:right; margin:-20px 10px 0 0; font:normal 12px/20px simsun; color:#fff}
.start-wrap .bd { padding:0 5px}
/*product list*/
.prolist { margin-bottom:5px; overflow:hidden; zoom:1;}
.prolist ul { margin:0 0 5px -24px; zoom:1;}
.prolist li { float:left; _display:inline; width:132px; margin:10px 0 0 24px; text-align:center; position:relative}
.prolist li a:hover ,.prolist li a:hover h3{ color:#f60}
.prolist li img { width:130px; height:130px; border:1px solid #e2e2e2}
.prolist li h3 { height:20px; overflow:hidden; line-height:20px; font-weight:normal; color:#333}
.prolist li del { color:#676767}
.prolist li em { margin-left:10px; font-size:14px; font-weight:bold; text-decoration:line-through; color:#fc3400}
.prolist .starprice { line-height:20px; text-align:center; overflow:hidden; font-weight:bold; color:#f15930;}
.prolist .save { width:110px; height:20px; margin:3px auto 0; text-align:center; font-weight:bold; background:#f25930; color:#fff601}
.prolist .cornermark { position:absolute; right:5px; top:75px; width:54px; height:54px; line-height:70px; overflow:hidden; font-weight:600; color:#f6ff00; background:url(http://images.shopin.net/images/ad/dianqing1210/cornermark.png)}

/*brand list*/
.brandList ul { margin:5px 0 0 -5px; zoom:1}
.brandList li { float:left; width:128px; margin:0 0 10px 7px; _display:inline; text-align:center; line-height:24px}
.brandList li img { display:block; width:126px; height:86px; border:1px solid #eee}
/*grab-list*/
.grab-wrap {}
.grab-wrap .hd { height:32px; margin-bottom:-1px; zoom:1; text-indent:-999em; overflow:hidden; background-image:url(http://images.shopin.net/images/ad/dianqing1210/t7.png); background-repeat:no-repeat}
.woman .hd { background-position:10px 0}
.man .hd { background-position:10px -33px}
.sport .hd { background-position:10px -66px}
.underwear .hd { background-position:10px -99px}
.children .hd { background-position:10px -132px}

.grab-wrap .bd { padding:8px 8px 2px; border:4px solid #ea5421}
.bd-logolist { width:182px;}
.bd-logolist li { float:left; margin:0 0 9px 18px; line-height:20px; text-align:center; _display:inline}
.bd-logolist li img { display:block; width:70px; height:40px; border:1px solid #f2eeeb}
/*sale-list*/
.sale-list { width:720px}
.sale-list li { float:left; width:352px; height:170px; margin:0 0 6px 6px; _display:inline}
.sale-list li img { width:350px; height:168px; border:1px solid #e0e0e0}

/*subnav*/
.summer_subnav { position:absolute; bottom:-108px; z-index:99; width:950px; height:108px; margin:-108px 0 0 0; zoom:1;}
.summer_subnav ul { width:894px; height:108px; padding-left:56px; background:url(http://images.shopin.net/images/ad/dianqing1210/subnav.png) 0 0 no-repeat}
.summer_subnav ul li { float:left; width:99px; height:60px; margin-right:5px; padding-top:29px; text-indent:-999em; overflow:hidden}
.summer_subnav ul li.c { width:36px; margin-left:10px; _display:inline;}
.summer_subnav ul li a { display:block; line-height:60px;}
.summer_subnav .subnav-open { display:none; position:absolute; left:0; top:13px; width:50px; height:95px; text-indent:-999em; overflow:hidden; background:url(http://images.shopin.net/images/ad/dianqing1210/subnav-c.png)}
</style>
<!--[if lte IE 6]>
<script type="text/javascript" src="http://images.shopin.net/images/ad/summer1/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript"> 
DD_belatedPNG.fix('.png,.cornermark,.summer_subnav ul');
</script> 
<![endif]-->
<script type="text/javascript">
//选项卡
$(function(){
   $(".tab-bd .item:not(:first)").hide();
    function tabs(tabTit,on,tabCon){
	$(tabCon).each(function(){
	  $(this).children().eq(0).show();
	  });
	$(tabTit).each(function(){
	  $(this).children().eq(0).addClass(on);
	  });
     $(tabTit).children().mouseover(function(){
        $(this).addClass(on).siblings().removeClass(on);
         var index = $(tabTit).children().index(this);
         $(tabCon).children().eq(index).show().siblings().hide();
    });
     }
  tabs(".tab-hd","cur",".tab-bd");
   });
</script>
</head>

<body>
  <img src="http://images.shopin.net/images/ad/dianqing1210/top-ad1.jpg" usemap="#Map2" class="mt" align="top">
  <map name="Map2">
    <area shape="rect" coords="59,138,246,227" href="#e">
    <area shape="rect" coords="683,167,877,253" href="#g">
    <area shape="rect" coords="61,236,239,269" href="#c">
  </map>
  <img src="http://images.shopin.net/images/ad/dianqing1210/top-ad2-shhutdown-24.gif" usemap="#Map3" align="top">
  <map name="Map3">
    <area shape="rect" coords="36,28,194,108" href="#g">
    <area shape="rect" coords="702,8,897,90" href="#f">
    <area shape="rect" coords="673,111,842,181" href="#a">
  </map>
  <div id="g" class="sp-ms pt tc">
  	<img class="mb" src="http://images.shopin.net/images/ad/dianqing1210/findsale.jpg"><br>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
  	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date today = new Date();
%>

 <%
   //时间段 开始时间 startDate 结束时间 endDate
    Date startDate = sdf.parse("2012-11-04 00:00:00");
    Date endDate = sdf.parse("2012-11-04 19:59:59");
    if(startDate.before(today) && today.before(endDate)){
%>
    <a href="http://www.shopin.net/help/bazhe1210.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-ad.jpg"></a>
<%}%>
<%
   //时间段 开始时间 startDate 结束时间 endDate
    Date startDate1 = sdf.parse("2012-11-04 20:00:00");
		Date endDate1 = sdf.parse("2012-11-04 23:00:00");
		if(startDate1.before(today) && today.before(endDate1)){
%>
    <a href="http://www.shopin.net/help/bazhe1210.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-ad-cur-1104.jpg"></a>
<%}%> 
<%
   //时间段 开始时间 startDate 结束时间 endDate
    Date startDate2 = sdf.parse("2012-11-04 23:00:01");
		Date endDate2 = sdf.parse("2012-11-04 23:59:59");
		if(startDate2.before(today) && today.before(endDate2)){
%>
    <a href="http://www.shopin.net/help/bazhe1210.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-ad.jpg"></a>
<%}%> 

    <a class="ml" href="http://www.shopin.net/promotion/6203.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/seckill-1104.jpg"></a>
  </div>
  <img id="a" src="http://images.shopin.net/images/ad/dianqing1210/t1.png" align="top">
	<div class="box mb">
  	<ul class="tab-hd mt">
    	<li><a class="t" href="#">第三波</a></li>
    	<li><a class="s" href="#">第二波</a></li>
    	<li><a class="f" href="#">第一波</a></li>
    </ul>
    <div class="tab-bd">
    	<div class="item" name="3">
      	<ul>
<li><a href="http://www.shopin.net/promotion/5703.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1031-01.jpg" alt="B.SIQI"></a></li>
<li><a href="http://www.shopin.net/promotion/5756.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1031-02.jpg" alt="柯里卡"></a></li>
<li><a href="http://www.shopin.net/promotion/4571.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1031-03.jpg" alt="LINNIE.Z"></a></li>
<li><a href="http://www.shopin.net/promotion/5965.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1031-04.jpg" alt="huayin"></a></li>
<li><a href="http://www.shopin.net/promotion/6282.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1031-05.jpg" alt="c.banner"></a></li>
<li><a href="http://www.shopin.net/promotion/6285.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1031-06.jpg" alt="米莲诺"></a></li>
<li><a href="http://www.shopin.net/promotion/6281.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1031-07.jpg" alt="Comoni"></a></li>
<li><a href="http://www.shopin.net/promotion/6070.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1031-08.jpg" alt="水孩儿"></a></li>
<li><a href="http://www.shopin.net/promotion/6283.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1031-09.jpg" alt="蒙丹米尔"></a></li>
<li><a href="http://www.shopin.net/promotion/6284.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1031-10.jpg" alt="KELIYA"></a></li>
<li><a href="http://www.shopin.net/promotion/6280.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1031-11.jpg" alt="洋宾燕"></a></li>
<li><a href="http://www.shopin.net/promotion/5936.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1031-12.jpg" alt="罗蒙"></a></li>
<li><a href="http://www.shopin.net/promotion/5157.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1031-13.jpg" alt="李宁"></a></li>
<li><a href="http://www.shopin.net/promotion/5207.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1031-14.jpg" alt="NORTHLAND"></a></li>
<li><a href="http://www.shopin.net/promotion/5210.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1031-15.jpg" alt="DUNLOP"></a></li>
<li><a href="http://www.shopin.net/promotion/4968.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1031-16.jpg" alt="KAILAS"></a></li>
        </ul>
      </div>
    	<div class="item" name="2">
      	<ul>
<li><a href="http://www.shopin.net/promotion/5329.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1029-01.jpg" alt="PIERRE CARDIN"></a></li>
<li><a href="http://www.shopin.net/promotion/5418.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1029-02.jpg" alt="ST.SANLI"></a></li>
<li><a href="http://www.shopin.net/promotion/6036.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1029-03.jpg" alt="秋水伊人"></a></li>
<li><a href="http://www.shopin.net/promotion/6222.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1029-04.jpg" alt="百丽\天美意\百思图\ELLE\他她\森达\暇步士\美丽宝"></a></li>
<li><a href="http://www.shopin.net/promotion/6258.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1029-05.jpg" alt="JC COLLEZIONE"></a></li>
<li><a href="http://www.shopin.net/promotion/6257.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1029-06.jpg" alt="GOLDLION"></a></li>
<li><a href="http://www.shopin.net/promotion/6256.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1029-07.jpg" alt="cele"></a></li>
<li><a href="http://www.shopin.net/promotion/6259.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1029-08.jpg" alt="鹿王"></a></li>
<li><a href="http://www.shopin.net/promotion/6129.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1029-09.jpg" alt="依彩绒"></a></li>
<li><a href="http://www.shopin.net/promotion/5101.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1029-10.jpg" alt="昱璐"></a></li>
<li><a href="http://www.shopin.net/promotion/3666.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1029-11.jpg" alt="satchi"></a></li>
<li><a href="http://www.shopin.net/promotion/5322.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1029-12.jpg" alt="Kappa"></a></li>
<li><a href="http://www.shopin.net/promotion/5277.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1029-13.jpg" alt="adidas"></a></li>
<li><a href="http://www.shopin.net/promotion/4960.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1029-14.jpg" alt="BLACKYAK"></a></li>
<li><a href="http://www.shopin.net/promotion/5051.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1029-15.jpg" alt="Jack Wolfskin"></a></li>
<li><a href="http://www.shopin.net/promotion/5096.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1029-16.jpg" alt="骆驼牌（运动）"></a></li>
        </ul>
      </div>
    	<div class="item" name="1">
      	<ul>
<li><a href="http://www.shopin.net/promotion/6247.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-1030-01.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/6199.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-02.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/6202.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-03.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/6221.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-04.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/3462.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-05.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5285.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-06.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/6222.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-07.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/6223.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-08.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/6224.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-09.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5069.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-10.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/3837.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-11.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5891.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-12.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/6196.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-13.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/4879.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-14.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5036.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-15.jpg"></a></li>
<li><a href="http://www.shopin.net/promotion/5702.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-16.jpg"></a></li>
        </ul>
      </div>
    </div>
  	
    <img id="b" src="http://images.shopin.net/images/ad/dianqing1210/t3.png">
    <ul class="new-sale-list clear">
    	<li><a href="http://www.shopin.net/casual/brands/2223.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/new-1029-01.jpg"></a></li>
    	
    	<li><a href="http://www.shopin.net/brands/1370.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/new-02.jpg"></a></li>
    	<li><a href="http://www.shopin.net/promotion/5918.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/new-04.jpg"></a></li>
    </ul>
    <img id="c" src="http://images.shopin.net/images/ad/dianqing1210/t4.png">
    <div class="start-wrap clear zm">
    	<ul class="item">
      	<div class="hd"><h3>网络特供专区</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6203.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/1544980.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/06/30/Pic1544980_82019_0_1.jpg" /><h3>JIMANNO时尚保暖系带羊毛大衣</h3></a><del>￥4699</del><em>￥752</em><span class="cornermark">￥499</span></li>
<li><a href="http://www.shopin.net/product/2062188.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic2062188_177915_0_1.jpg" /><h3>RBCA双排扣连帽毛呢大衣</h3></a><del>￥1588</del><em>￥238</em><span class="cornermark">￥199</span></li>
<li><a href="http://www.shopin.net/product/1379706.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic1379706_3307_0_1.jpg" /><h3>HOPE SHOW短款机车皮衣</h3></a><del>￥629</del><em>￥125</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/1677319.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/03/29/Pic1677319_123147_0_1.jpg" /><h3>huayin蕾丝钻饰系带风衣</h3></a><del>￥1680</del><em>￥198</em><span class="cornermark">￥158</span></li>
<li><a href="http://www.shopin.net/product/1998023.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/24/Pic1998023_161785_0_1.jpg" /><h3>WAYONL时尚面包领连帽棉服</h3></a><del>￥1098</del><em>￥268</em><span class="cornermark">￥98</span></li>
<li><a href="http://www.shopin.net/product/2064244.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/29/Pic2064244_200215_0_1.jpg" /><h3>笛舒雅花香袭人四件套</h3></a><del>￥1099</del><em>￥199</em><span class="cornermark">￥169</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6203.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-01.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>网络特供专区</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6217.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/1917815.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/06/26/Pic1917815_97522_0_1.jpg" /><h3>卡美多牛油皮侧面镶钻中筒靴</h3></a><del>￥1438</del><em>￥221</em><span class="cornermark">￥199</span></li>
<li><a href="http://www.shopin.net/product/1584044.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/11/Pic1584044_15375_0_1.jpg" /><h3>莱尔斯丹黑色反羊绒面系带中靴</h3></a><del>￥1598</del><em>￥459</em><span class="cornermark">￥400</span></li>
<li><a href="http://www.shopin.net/product/2029635.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/31/Pic2029635_85305_0_1.jpg" /><h3>依彩绒彩色渐变印花纯羊毛衫</h3></a><del>￥1036</del><em>￥199</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/2044960.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/25/Pic2044960_201191_0_1.jpg" /><h3>洋宾燕男士圆领100%羊绒衫</h3></a><del>￥1260</del><em>￥299</em><span class="cornermark">￥149</span></li>
<li><a href="http://www.shopin.net/product/2027677.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/20/Pic2027677_154109_0_1.jpg" /><h3>爱尔爱司彩色格纹衬衫</h3></a><del>￥799</del><em>￥199</em><span class="cornermark">￥119</span></li>
<li><a href="http://www.shopin.net/product/1547147.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/17/Pic1547147_157401_0_1.jpg" /><h3>聊黛部儿简约长款连帽羽绒服</h3></a><del>￥798</del><em>￥279</em><span class="cornermark">￥189</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6217.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-02.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>女装</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6207.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/2074770.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/10/13/Pic2074770_165623_0_1.jpg" /><h3>LOOIES獭兔毛领棉服</h3></a><del>￥1396</del><em>￥398</em><span class="cornermark">￥199</span></li>
<li><a href="http://www.shopin.net/product/65913.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/17/Pic65913_1493_0_1.jpg" /><h3>秋水伊人时尚印花风衣</h3></a><del>￥806</del><em>￥201</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/1478381.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/17/Pic1478381_3440_0_1.jpg" /><h3>红袖蕾丝串珠装饰针织连衣裙</h3></a><del>￥879</del><em>￥316</em><span class="cornermark">￥139</span></li>
<li><a href="http://www.shopin.net/product/2074514.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/10/22/Pic2074514_200129_0_1.jpg" /><h3>U.NIVE荣澜英伦格纹连帽大衣</h3></a><del>￥1198</del><em>￥359</em><span class="cornermark">￥179</span></li>
<li><a href="http://www.shopin.net/product/2073007.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/29/Pic2073007_185713_0_1.jpg" /><h3>RBCA时尚柳钉装饰领毛呢大衣</h3></a><del>￥1398</del><em>￥199</em><span class="cornermark">￥129</span></li>
<li><a href="http://www.shopin.net/product/2080783.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/10/23/Pic2080783_117266_0_1.jpg" /><h3>无色无味时尚水洗牛仔长裤</h3></a><del>￥416</del><em>￥122</em><span class="cornermark">￥61</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6207.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-04.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>内衣</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6208.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/2074736.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/19/Pic2074736_175850_0_1.jpg" /><h3>曼黛玛琏精致刺绣印花聚拢文胸</h3></a><del>￥298</del><em>￥149</em><span class="cornermark">￥75</span></li>
<li><a href="http://www.shopin.net/product/2037525.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/15/Pic2037525_200263_0_1.jpg" /><h3>WAYONLY蕾丝网纱聚拢文胸</h3></a><del>￥420</del><em>￥78</em><span class="cornermark">￥43</span></li>
<li><a href="http://www.shopin.net/product/156458.html" target="_blank"><img src="http://images.shopin.net/images/61/2010/05/11/Pic156458_1124_0_1.jpg" /><h3>桑扶兰光面聚拢上托水袋文胸</h3></a><del>￥268</del><em>￥150</em><span class="cornermark">￥50</span></li>
<li><a href="http://www.shopin.net/product/2082007.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/10/22/Pic2082007_205734_0_1.jpg" /><h3>波司登时尚印花女款保暖套装</h3></a><del>￥238</del><em>￥118</em><span class="cornermark">￥69</span></li>
<li><a href="http://www.shopin.net/product/2085164.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/10/22/Pic2085164_83762_0_1.jpg" /><h3>北极绒时尚商务丝棉夹克</h3></a><del>￥698</del><em>￥488</em><span class="cornermark">￥199</span></li>
<li><a href="http://www.shopin.net/product/2086687.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/23/Pic2086687_206484_0_1.jpg" /><h3>plandoo牛奶蛋白润肤内衣套装</h3></a><del>￥398</del><em>￥238</em><span class="cornermark">￥99</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6208.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-06.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>羊绒/毛衫</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6226.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/2080485.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/15/Pic2080485_142356_0_1.jpg" /><h3>尼特维尔花纹款混绒衫</h3></a><del>￥396</del><em>￥198</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/2076833.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/15/Pic2076833_201501_0_1.jpg" /><h3>皮尔卡丹豹纹羊绒衫</h3></a><del>￥2350</del><em>￥1175</em><span class="cornermark">￥588</span></li>
<li><a href="http://www.shopin.net/product/2075306.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/12/Pic2075306_97636_0_1.jpg" /><h3>鹿王100%山羊绒围巾</h3></a><del>￥680</del><em>￥580</em><span class="cornermark">￥340</span></li>
<li><a href="http://www.shopin.net/product/2074012.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/15/Pic2074012_72651_0_1.jpg" /><h3>正亚女款套头100%羊毛衫</h3></a><del>￥568</del><em>￥119</em><span class="cornermark">￥59</span></li>
<li><a href="http://www.shopin.net/product/2084748.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/12/Pic2075306_97636_0_1.jpg" /><h3>花花公子男款百搭羊毛衫</h3></a><del>￥899</del><em>￥198</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/2075700.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/10/18/Pic2075700_101629_0_1.jpg" /><h3>KELIYA男款100%羊毛衫</h3></a><del>￥758</del><em>￥129</em><span class="cornermark">￥65</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6226.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-03.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>鞋</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6225.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/2074347.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/12/Pic2074347_10480_0_1.jpg" /><h3>圣大保罗牛皮内坡跟靴子</h3></a><del>￥1098</del><em>￥499</em><span class="cornermark">￥199</span></li>
<li><a href="http://www.shopin.net/product/2081304.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/10/19/Pic2081304_8605_0_1.jpg" /><h3>菲尔图滑雪布棉靴</h3></a><del>￥580</del><em>￥199</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/2073809.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/10/13/Pic2073809_152334_0_1.jpg" /><h3>奥康百搭牛皮长靴</h3></a><del>￥1139</del><em>￥284</em><span class="cornermark">￥142</span></li>
<li><a href="http://www.shopin.net/product/2090774.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/10/23/Pic2090774_11123_0_1.jpg" /><h3>红蜻蜓牛皮过膝长靴</h3></a><del>￥1199</del><em>￥399</em><span class="cornermark">￥199</span></li>
<li><a href="http://www.shopin.net/product/2074170.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/13/Pic2074170_46950_0_1.jpg" /><h3>HANG TEN女款牛皮单鞋</h3></a><del>￥768</del><em>￥198</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/2080343.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/17/Pic2080343_11345_0_1.jpg" /><h3>沙驰男款头层牛皮单鞋</h3></a><del>￥1080</del><em>￥299</em><span class="cornermark">￥199</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6225.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-05.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>男装</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6209.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/2077535.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/15/Pic2077535_14293_0_1.jpg" /><h3>卡尔蒂尼男款羊毛大衣</h3></a><del>￥2390</del><em>￥979</em><span class="cornermark">￥490</span></li>
<li><a href="http://www.shopin.net/product/2074473.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/15/Pic2074473_77335_0_1.jpg" /><h3>费尔法特100%羊毛衫</h3></a><del>￥1280</del><em>￥481</em><span class="cornermark">￥240</span></li>
<li><a href="http://www.shopin.net/product/2076359.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/13/Pic2076359_16412_0_1.jpg" /><h3>大卫山商务休闲长裤</h3></a><del>￥1080</del><em>￥198</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/2084520.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/29/Pic2084520_15311_0_1.jpg" /><h3>蒙漫侬男款羽绒外套</h3></a><del>￥2860</del><em>￥498</em><span class="cornermark">￥249</span></li>
<li><a href="http://www.shopin.net/product/1428626.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/09/23/Pic1428626_16388_0_1.jpg" /><h3>尼诺里拉羊毛毛衫</h3></a><del>￥1780</del><em>￥456</em><span class="cornermark">￥228</span></li>
<li><a href="http://www.shopin.net/product/2074987.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/15/Pic2074987_81055_0_1.jpg" /><h3>罗蒙商务休闲长裤</h3></a><del>￥698</del><em>￥349</em><span class="cornermark">￥175</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6209.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-07.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>休闲</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6212.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/2075717.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/13/Pic2075717_57230_0_1.jpg" /><h3>高尔普男款加棉外套</h3></a><del>￥1399</del><em>￥699</em><span class="cornermark">￥299</span></li>
<li><a href="http://www.shopin.net/product/2077567.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/10/15/Pic2077567_199116_0_1.jpg" /><h3>WRANGLER时尚男士帽衫</h3></a><del>￥690</del><em>￥483</em><span class="cornermark">￥235</span></li>
<li><a href="http://www.shopin.net/product/2079506.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/10/22/Pic2079506_137199_0_1.jpg" /><h3>生活几何男款牛仔长裤</h3></a><del>￥269.9</del><em>￥139</em><span class="cornermark">￥97</span></li>
<li><a href="http://www.shopin.net/product/2076815.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/10/15/Pic2076815_81536_0_1.jpg" /><h3>monchhichi加棉百搭帽衫</h3></a><del>￥798</del><em>￥279</em><span class="cornermark">￥139</span></li>
<li><a href="http://www.shopin.net/product/2075401.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/29/Pic2075401_196080_0_1.jpg" /><h3>衣本色靓丽百搭针织衫</h3></a><del>￥469.9</del><em>￥376</em><span class="cornermark">￥263</span></li>
<li><a href="http://www.shopin.net/product/2074279.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/15/Pic2074279_54089_0_1.jpg" /><h3>I.P.ZONE女款牛仔长裤</h3></a><del>￥259.9</del><em>￥182</em><span class="cornermark">￥127</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6212.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-10.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>运动</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6204.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/2074343.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/13/Pic2074343_135019_0_1.jpg" /><h3>纽巴伦网面运动鞋</h3></a><del>￥547</del><em>￥273</em><span class="cornermark">￥137</span></li>
<li><a href="http://www.shopin.net/product/2078517.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/12/Pic2078517_32097_0_1.jpg" /><h3>安踏女式时尚板鞋</h3></a><del>￥239</del><em>￥155</em><span class="cornermark">￥140</span></li>
<li><a href="http://www.shopin.net/product/2075552.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/17/Pic2075552_21572_0_1.jpg" /><h3>双星女式休闲鞋</h3></a><del>￥259</del><em>￥132</em><span class="cornermark">￥66</span></li>
<li><a href="http://www.shopin.net/product/2075194.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/15/Pic2075194_93831_0_1.jpg" /><h3>FILA男式连帽卫衣</h3></a><del>￥549</del><em>￥249</em><span class="cornermark">￥111</span></li>
<li><a href="http://www.shopin.net/product/2076827.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/15/Pic2076827_15072_0_1.jpg" /><h3>乔丹女式运动长裤</h3></a><del>￥179</del><em>￥125</em><span class="cornermark">￥62</span></li>
<li><a href="http://www.shopin.net/product/2077041.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/10/15/Pic2077041_168666_0_1.jpg" /><h3>SWISSWIN双肩背包</h3></a><del>￥798</del><em>￥399</em><span class="cornermark">￥200</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6204.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-08.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>户外</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6206.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/2074684.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/16/Pic2074684_205774_0_1.jpg" /><h3>K2summit男式冲锋衣</h3></a><del>￥999</del><em>￥599</em><span class="cornermark">￥300</span></li>
<li><a href="http://www.shopin.net/product/213904.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/01/13/Pic213904_27661_0_1.jpg" /><h3>Kolumb男式三合一冲锋衣</h3></a><del>￥1999</del><em>￥599</em><span class="cornermark">￥300</span></li>
<li><a href="http://www.shopin.net/product/2075073.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/19/Pic2075073_129227_0_1.jpg" /><h3>思凯乐女款抓绒衣</h3></a><del>￥680</del><em>￥454</em><span class="cornermark">￥227</span></li>
<li><a href="http://www.shopin.net/product/2075730.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/10/15/Pic2075730_47570_0_1.jpg" /><h3>PURELAND男式长袖衬衫</h3></a><del>￥399</del><em>￥210</em><span class="cornermark">￥95</span></li>
<li><a href="http://www.shopin.net/product/2075180.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/15/Pic2075180_135690_0_1.jpg" /><h3>圣弗莱女式冲锋裤</h3></a><del>￥558</del><em>￥279</em><span class="cornermark">￥98</span></li>
<li><a href="http://www.shopin.net/product/2076492.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/10/15/Pic2076492_113440_0_1.jpg" /><h3>KAILAS男式低帮徒步鞋</h3></a><del>￥998</del><em>￥699</em><span class="cornermark">￥329</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6206.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-09.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>童装</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6205.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/2074235.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/13/Pic2074235_145012_0_1.jpg" /><h3>空中天使圆领斜纹格羊毛衫</h3></a><del>￥369</del><em>￥148</em><span class="cornermark">￥74</span></li>
<li><a href="http://www.shopin.net/product/2075601.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/12/Pic2075601_160207_0_1.jpg" /><h3>汪小荷纯棉翻边短裤</h3></a><del>￥199</del><em>￥50.4</em><span class="cornermark">￥25</span></li>
<li><a href="http://www.shopin.net/product/2074062.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/19/Pic2074062_29522_0_1.jpg" /><h3>ABCKIDS网格系带运动鞋</h3></a><del>￥272</del><em>￥136</em><span class="cornermark">￥68</span></li>
<li><a href="http://www.shopin.net/product/2074115.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/12/Pic2074115_54971_0_1.jpg" /><h3>昱璐女童波浪纹羊毛衫</h3></a><del>￥329</del><em>￥155</em><span class="cornermark">￥77</span></li>
<li><a href="http://www.shopin.net/product/2074176.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/12/Pic2074176_157616_0_1.jpg" /><h3>迪士尼女童长款白鸭绒羽绒</h3></a><del>￥849</del><em>￥284.4</em><span class="cornermark">￥142</span></li>
<li><a href="http://www.shopin.net/product/2073990.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/15/Pic2073990_2327_0_1.jpg" /><h3>DorDor House牛皮网面休闲滑板鞋</h3></a><del>￥418</del><em>￥125</em><span class="cornermark">￥63</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6205.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-11.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>箱包配饰</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6210.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/2076315.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/10/12/Pic2076315_15945_0_1.jpg" /><h3>oodfumiture优质真皮包</h3></a><del>￥1299</del><em>￥426</em><span class="cornermark">￥213</span></li>
<li><a href="http://www.shopin.net/product/2077428.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/10/15/Pic2077428_114095_0_1.jpg" /><h3>仙美时真皮手袋</h3></a><del>￥1618</del><em>￥399</em><span class="cornermark">￥199</span></li>
<li><a href="http://www.shopin.net/product/2076510.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/12/Pic2076510_18283_0_1.jpg" /><h3>KSTYLE休闲手袋</h3></a><del>￥658</del><em>￥329</em><span class="cornermark">￥165</span></li>
<li><a href="http://www.shopin.net/product/2074172.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/13/Pic2074172_19368_0_1.jpg" /><h3>CAMEL男款真皮腰带</h3></a><del>￥238</del><em>￥119</em><span class="cornermark">￥60</span></li>
<li><a href="http://www.shopin.net/product/2075480.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/15/Pic2075480_18227_0_1.jpg" /><h3>梦特娇真皮腰带</h3></a><del>￥658</del><em>￥394</em><span class="cornermark">￥197</span></li>
<li><a href="http://www.shopin.net/product/2074218.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/12/Pic2074218_19331_0_1.jpg" /><h3>LOUIECATTON真皮钱包</h3></a><del>￥519</del><em>￥209</em><span class="cornermark">￥99</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6210.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-12.jpg" width="444" height="120"></a>
        </div>
      </ul>
    </div>
    <img id="d" src="http://images.shopin.net/images/ad/dianqing1210/t5.png">
    <ul class="brandList mt">
<li><a href="http://www.shopin.net/brands/2391.html" target="_blank"><img src="http://images.shopin.net/images//brand/2391_2.jpg" alt="WAYONLY">3.5折封</a></li>
<li><a href="http://www.shopin.net/brands/2226.html" target="_blank"><img src="http://images.shopin.net/images//brand/2226_2.jpg" alt="RBCA">1-3折</a></li>
<li><a href="http://www.shopin.net/brands/1866.html" target="_blank"><img src="http://images.shopin.net/images//brand/1866_2.jpg" alt="衣香丽影">5折封</a></li>
<li><a href="http://www.shopin.net/brands/1818.html" target="_blank"><img src="http://images.shopin.net/images//brand/1818_2.jpg" alt="huayin">1-3折</a></li>
<li><a href="http://www.shopin.net/brands/2402.html" target="_blank"><img src="http://images.shopin.net/images//brand/2402_2.jpg" alt="洋宾燕">1折起</a></li>
<li><a href="http://www.shopin.net/brands/1387.html" target="_blank"><img src="http://images.shopin.net/images//brand/1387_2.jpg" alt="正亚ZENGYA">2-5折</a></li>
<li><a href="http://www.shopin.net/brands/1422.html" target="_blank"><img src="http://images.shopin.net/images//brand/1422_2.jpg" alt="克利雅">2-5折</a></li>
<li><a href="http://www.shopin.net/brands/1963.html" target="_blank"><img src="http://images.shopin.net/images//brand/1963_2.jpg" alt="蒙派MENGPAI">1-3折</a></li>
<li><a href="http://www.shopin.net/brands/1603.html" target="_blank"><img src="http://images.shopin.net/images//brand/1603_2.jpg" alt="kameido  卡美多">3.5折封</a></li>
<li><a href="http://www.shopin.net/brands/463.html" target="_blank"><img src="http://images.shopin.net/images//brand/463_2.jpg" alt="杰思.路易">5折封</a></li>
<li><a href="http://www.shopin.net/home/brands/2381.html" target="_blank"><img src="http://images.shopin.net/images/brand/2381_2.jpg" alt="笛舒雅">1-3折</a></li>
<li><a href="http://www.shopin.net/brands/1881.html" target="_blank"><img src="http://images.shopin.net/images/brand/1881_2.jpg" alt="咔姿莱">3折封</a></li>
<li><a href="http://www.shopin.net/brands/2300.html" target="_blank"><img src="http://images.shopin.net/images//brand/2300_2.jpg" alt="奥羽尚OURSHINE">2-6折</a></li>
<li><a href="http://www.shopin.net/brands/2040.html" target="_blank"><img src="http://images.shopin.net/images//brand/2040_2.jpg" alt="聊黛部儿 LIAODAIBUER">5折封</a></li>
    </ul>
    <img id="e" src="http://images.shopin.net/images/ad/dianqing1210/t6.png">
    <div class="grab-wrap woman mt">
    	<div class="hd">女装/女鞋</div>
      <div class="bd clear zm">
      	<ul class="bd-logolist fl">
<li><a href="http://www.shopin.net/lady/brand/list-1472-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images//brand/1472_2.jpg" alt="JIMANNO">3折封</a></li>
<li><a href="http://www.shopin.net/lady/brand/list-289-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/289_2.jpg" alt="PIERRE CARDIN（女装）">5折封</a></li>
<li><a href="http://www.shopin.net/lady/brand/list-112-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/112_2.jpg" alt="HOPE SHOW">3.8折封顶</a></li>
<li><a href="http://www.shopin.net/lady/brand/list-59-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/59_2.jpg" alt="秋水伊人">新款5折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/882.html" target="_blank"><img src="http://images.shopin.net/images/brand/882_2.jpg" alt="百丽">3折起</a></li>
<li><a href="http://www.shopin.net/shoes/brands/249.html" target="_blank"><img src="http://images.shopin.net/images/brand/249_2.jpg" alt="TATA">3-7折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/247.html" target="_blank"><img src="http://images.shopin.net/images/brand/247_2.jpg" alt="天美意">2-5折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/237.html" target="_blank"><img src="http://images.shopin.net/images/brand/237_2.jpg" alt="捷希">2-5折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/220.html" target="_blank"><img src="http://images.shopin.net/images/brand/220_2.jpg" alt="沙驰">1.5折起</a></li>
<li><a href="http://www.shopin.net/shoes/brands/293.html" target="_blank"><img src="http://images.shopin.net/images/brand/293_2.jpg" alt="暇步士">3-6折</a></li>
        </ul>
        <ul class="sale-list fr">
        <li><a href="http://www.shopin.net/lady/list--1231--------.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/w01.jpg"></a></li>
        <li><a href="http://www.shopin.net/lady/list--1234--------.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/w02.jpg"></a></li>
        <li><a href="http://www.shopin.net/shoes/list--1470-0.05-0.3------.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/w03.jpg"></a></li>
        <li><a href="http://www.shopin.net/shoes/list--1550---100-399----.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/w04.jpg"></a></li>
        </ul>
      </div>
    </div>
    <div class="grab-wrap man mt">
    	<div class="hd">男装/男鞋</div>
      <div class="bd clear zm">
      	<ul class="bd-logolist fl">
<li><a href="http://www.shopin.net/man/brands/412.html" target="_blank"><img src="http://images.shopin.net/images//brand/412_2.jpg" alt="PAGUCI">3折封</a></li>
<li><a href="http://www.shopin.net/man/brands/1167.html" target="_blank"><img src="http://images.shopin.net/images//brand/1167_2.jpg" alt="雅戈尔">2-6折</a></li>
<li><a href="http://www.shopin.net/man/brands/2011.html" target="_blank"><img src="http://images.shopin.net/images//brand/2011_2.jpg" alt="爱尔爱司">2折起</a></li>
<li><a href="http://www.shopin.net/man/brands/465.html" target="_blank"><img src="http://images.shopin.net/images//brand/465_2.jpg" alt="尼诺里拉">2-4折</a></li>
<li><a href="http://www.shopin.net/man/brands/463.html" target="_blank"><img src="http://images.shopin.net/images//brand/463_2.jpg" alt="杰思.路易">3-5折</a></li>
<li><a href="http://www.shopin.net/man/brands/361.html" target="_blank"><img src="http://images.shopin.net/images//brand/361_2.jpg" alt="九牧王">3-7折</a></li>
<li><a href="http://www.shopin.net/man/brands/1577.html" target="_blank"><img src="http://images.shopin.net/images//brand/1577_2.jpg" alt="罗弗帝奇">2-4折</a></li>
<li><a href="http://www.shopin.net/shoes/brand/list-184-1382.html" target="_blank"><img src="http://images.shopin.net/images//brand/184_2.jpg" alt="cele">2折起</a></li>
<li><a href="http://www.shopin.net/shoes/brand/list-319-1382/1.html" target="_blank"><img src="http://images.shopin.net/images//brand/319_2.jpg" alt="红蜻蜓">2-6折</a></li>
<li><a href="http://www.shopin.net/shoes/brand/list-122-1382.html" target="_blank"><img src="http://images.shopin.net/images//brand/122_2.jpg" alt="JEEP">3-6折</a></li>
        </ul>
        <ul class="sale-list fr">
        <li><a href="http://www.shopin.net/man/list--1169-0.0-0.5------.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/m01.jpg"></a></li>
        <li><a href="http://www.shopin.net/man/list--1180--------.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/m02.jpg"></a></li>
        <li><a href="http://www.shopin.net/list--1638-0.0-0.5----0--/2.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/m03.jpg"></a></li>
        <li><a href="http://www.shopin.net/shoes/list--1540-0.05-0.7------.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/m04.jpg"></a></li>
        </ul>
      </div>
    </div>
    <div class="grab-wrap sport mt">
    	<div class="hd">运动/户外/休闲</div>
      <div class="bd clear zm">
      	<ul class="bd-logolist fl">
<li><a href="http://www.shopin.net/brand/list-281--0.05-0.7-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/281_2.jpg" alt="ADIDAS">4-7折</a></li>
<li><a href="http://www.shopin.net/brands/592.html" target="_blank"><img src="http://images.shopin.net/images/brand/592_2.jpg" alt="Kappa">2.5折起</a></li>
<li><a href="http://www.shopin.net/brand/list-920--0.1-0.8-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/920_2.jpg" alt="asics">2-8折</a></li>
<li><a href="http://www.shopin.net/brands/537.html" target="_blank"><img src="http://images.shopin.net/images/brand/537_2.jpg" alt="李宁">3-7折</a></li>
<li><a href="http://www.shopin.net/brands/919.html" target="_blank"><img src="http://images.shopin.net/images/brand/919_2.jpg" alt="安踏">3-7折</a></li>
<li><a href="http://www.shopin.net/brands/602.html" target="_blank"><img src="http://images.shopin.net/images/brand/602_2.jpg" alt="BLACKYAK">1.9折起</a></li>
<li><a href="http://www.shopin.net/brands/599.html" target="_blank"><img src="http://images.shopin.net/images/brand/599_2.jpg" alt="NORTHLAND">3-7折</a></li>
<li><a href="http://www.shopin.net/brands/612.html" target="_blank"><img src="http://images.shopin.net/images/brand/612_2.jpg" alt="DUNLOP">2-7折</a></li>
<li><a href="http://www.shopin.net/brands/591.html" target="_blank"><img src="http://images.shopin.net/images/brand/591_2.jpg" alt="探路者">3折起</a></li>
<li><a href="http://www.shopin.net/brands/593.html" target="_blank"><img src="http://images.shopin.net/images/brand/593_2.jpg" alt="KAILAS">2.4折起</a></li>
<li><a href="http://www.shopin.net/casual/brands/1033.html" target="_blank"><img src="http://images.shopin.net/images//brand/1033_2.jpg" alt="LEE">3-7折</a></li>
<li><a href="http://www.shopin.net/casual/brand/list-2378/1.html" target="_blank"><img src="http://images.shopin.net/images//brand/2378_2.jpg" alt="VISCAP">3-5折</a></li>
<li><a href="http://www.shopin.net/casual/brands/519.html" target="_blank"><img src="http://images.shopin.net/images//brand/519_2.jpg" alt="BALENO">3-7折</a></li>
<li><a href="http://www.shopin.net/casual/brand/list-2151/1.html" target="_blank"><img src="http://images.shopin.net/images//brand/2151_2.jpg" alt="GXG">4折起</a></li>
        </ul>
        <ul class="sale-list fr">
        <li><a href="http://www.shopin.net/outdoor/list--1303--------.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/s01.jpg"></a></li>
        <li><a href="http://www.shopin.net/outdoor/list--1329--------.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/s02.jpg"></a></li>
        <li><a href="http://www.shopin.net/sports/list--1604--------.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/s03.jpg"></a></li>
        <li><a href="http://www.shopin.net/sports/list--1596-0.1-0.5------.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/s04.jpg"></a></li>
        <li><a href="http://www.shopin.net/casual/list--1796-0.3-0.7------/1.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/s05.jpg"></a></li>
        <li><a href="http://www.shopin.net/casual/list--1793-0.05-0.6------.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/s06.jpg"></a></li>
        </ul>
      </div>
    </div>
    <div class="grab-wrap underwear mt">
    	<div class="hd">内衣/箱包配饰</div>
      <div class="bd clear zm">
      	<ul class="bd-logolist fl">
<li><a href="http://www.shopin.net/brand/list-165-1068-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/165_2.jpg" alt="古今">新款5折起</a></li>
<li><a href="http://www.shopin.net/brand/list-69-1068-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/69_2.jpg" alt="桑扶兰">3折起</a></li>
<li><a href="http://www.shopin.net/brand/list-285-1068-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/285_2.jpg" alt="ELLE（内衣）">3折起</a></li>
<li><a href="http://www.shopin.net/brand/list-176-1068-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/176_2.jpg" alt="秋鹿家居服">5折封</a></li>
<li><a href="http://www.shopin.net/brand/list-1488-1068-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1488_2.jpg" alt="plandoo">3-6折</a></li>
<li><a href="http://www.shopin.net/underwear/brand/list-174-1068-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/174_2.jpg" alt="俞兆林">3折起</a></li>
<li><a href="http://www.shopin.net/handbags/list-475-1670-0.3-0.6------.html" target="_blank"><img src="http://images.shopin.net/images//brand/475_2.jpg" alt="艾狄米娜">3-6折</a></li>
<li><a href="http://www.shopin.net/handbags/brand/list-432-1098-0.2-0.6-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/432_2.jpg" alt="BOSSSUNWEN">2-6折</a></li>
<li><a href="http://www.shopin.net/handbags/list-485-1109---69-299----.html" target="_blank"><img src="http://images.shopin.net/images//brand/485_2.jpg" alt="LOUIECATTON">￥79起</a></li>
<li><a href="http://www.shopin.net/handbags/list-1095-1117-0.3-0.5------.html" target="_blank"><img src="http://images.shopin.net/images//brand/1095_2.jpg" alt="黑田">3-5折</a></li>
        </ul>
        <ul class="sale-list fr">
        <li><a href="http://www.shopin.net/list--1081-0.2-0.7----0--.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/u01.jpg"></a></li>
        <li><a href="http://www.shopin.net/underwear/list--1884--------.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/u02.jpg"></a></li>
        <li><a href="http://www.shopin.net/underwear/list--1516--------.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/u03.jpg"></a></li>
        <li><a href="http://www.shopin.net/handbags/list--1670-0.05-0.3------.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/u04.jpg"></a></li>
        </ul>
      </div>
    </div>
    <div class="grab-wrap children mt">
    	<div class="hd">儿童/家纺</div>
      <div class="bd clear zm">
      	<ul class="bd-logolist fl">
<li><a href="http://www.shopin.net/children/brand/list-262-1125.html" target="_blank"><img src="http://images.shopin.net/images/brand/262_2.jpg" alt="迪士尼">百元起</a></li>
<li><a href="http://www.shopin.net/children/brand/list-1540/1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1540_2.jpg" alt="常春藤">3-5折</a></li>
<li><a href="http://www.shopin.net/children/brands/10.html" target="_blank"><img src="http://images.shopin.net/images/brand/10_2.jpg" alt="昱璐">低至2折</a></li>
<li><a href="http://www.shopin.net/children/brand/list-48-1125.html" target="_blank"><img src="http://images.shopin.net/images/brand/48_2.jpg" alt="菲格咪妮">2-5折</a></li>
<li><a href="http://www.shopin.net/children/brands/287.html" target="_blank"><img src="http://images.shopin.net/images/brand/287_2.jpg" alt="MONTAGUT">3折起</a></li>
<li><a href="http://www.shopin.net/children/brands/99.html" target="_blank"><img src="http://images.shopin.net/images/brand/99_2.jpg" alt="空中天使">2-5折</a></li>
<li><a href="http://www.shopin.net/home/brand/list-1295-1855-0.2-0.6-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1295_2.jpg" alt="LIFE HOME">2-6折</a></li>
<li><a href="http://www.shopin.net/list-2381-1856------0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/2381_2.jpg" alt="笛舒雅">99起</a></li>
<li><a href="http://www.shopin.net/home/brand/list-2333-1856-0.1-0.5-----1.html" target="_blank"><img src="http://images.shopin.net/images//brand/2333_2.jpg" alt="法尔曼">2折封</a></li>
<li><a href="http://www.shopin.net/list-575-1876------0--.html" target="_blank"><img src="http://images.shopin.net/images//brand/575_2.jpg" alt="SINOMAX">5折</a></li>
        </ul>
        <ul class="sale-list fr">
        <li><a href="http://www.shopin.net/children/list--1137--------.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/c01.jpg"></a></li>
        <li><a href="http://www.shopin.net/children/list--1699---1-99----.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/c02.jpg"></a></li>
        <li><a href="http://www.shopin.net/list--1691------0--.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/c03.jpg"></a></li>
        <li><a href="http://www.shopin.net/home/list--1858--------.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/c04.jpg"></a></li>
        </ul>
      </div>
    </div>
    <a id="f" href="http://www.shopin.net/help/manzeng.html" target="_blank"><img class="mt" src="http://images.shopin.net/images/ad/dianqing1210/img1.jpg"></a>
    <a href="http://www.shopin.net/help/zfb1210.html" target="_blank"><img class="mt" src="http://images.shopin.net/images/ad/zfb1210/zfb1210.jpg"></a>
    <a href="http://www.shopin.net/help/shuang11.html" target="_blank"><img class="mt" src="http://images.shopin.net/images/ad/shuang11/ad-shuang11-950.jpg"></a>
    <a href="http://www.shopin.net/help/yure.html" target="_blank"><img class="mt" src="http://images.shopin.net/images/ad/dianqing1210/img2.jpg"></a>
    <img src="http://images.shopin.net/images/ad/dianqing1210/fenqu.png" usemap="#Map4">
    <map name="Map4">
      <area shape="rect" coords="10,66,199,116" href="http://www.shopin.net/channel-store.html" target="_blank">
      <area shape="rect" coords="225,67,374,116" href="http://www.shopin.net/channel-lady.html" target="_blank">
      <area shape="rect" coords="400,66,550,116" href="http://www.shopin.net/channel-man.html" target="_blank">
      <area shape="rect" coords="572,66,725,116" href="http://www.shopin.net/channel-shoes.html" target="_blank">
      <area shape="rect" coords="748,65,927,116" href="http://www.shopin.net/channel-sports.html" target="_blank">
      <area shape="rect" coords="7,129,197,182" href="http://www.shopin.net/channel-outdoor.html" target="_blank">
      <area shape="rect" coords="224,126,370,183" href="http://www.shopin.net/channel-casual.html" target="_blank">
      <area shape="rect" coords="401,128,548,181" href="http://www.shopin.net/channel-underwear.html" target="_blank">
      <area shape="rect" coords="574,132,728,178" href="http://www.shopin.net/channel-handbags.html" target="_blank">
      <area shape="rect" coords="749,132,921,182" href="http://www.shopin.net/channel-children.html" target="_blank">
    </map>
  </div>
<div id="summer_subnav" class="summer_subnav png">
	<ul>
    <li><a href="#g" title="每晚2小时超爆夜场">每晚2小时超爆夜场</a></li>
    <li><a href="#g" title="每天12点超爆单品秒杀">每天12点超爆单品秒杀</a></li>
    <li><a href="#a" title="48大品牌 三波轮番抢">48大品牌 三波轮番抢</a></li>
    <li><a href="#b" title="新入驻大牌助阵店庆2-6折">新入驻大牌助阵店庆2-6折</a></li>
    <li><a href="#c" title="万款明星商品 会员独享">万款明星商品 会员独享</a></li>
    <li><a href="#d" title="店庆网络独享品牌">店庆网络独享品牌</a></li>
    <li><a href="#e" title="百大品牌折上再9折">百大品牌折上再9折</a></li>
    <li><a href="#f" title="精彩会员回馈满赠活动">精彩会员回馈满赠活动</a></li>
    <li class="c"><a class="subnav-close" href="javascript:void(0);" title="收起导航">收起导航</a></li>
  </ul>
  <a class="subnav-open" href="javascript:void(0);" title="展开导航">展开导航</a>
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
                         top: '100%'      
                     });
                 }else {
                     element.css({
                         top: scrolls+clientHeight
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
	 var sbu = $("#summer_subnav ul");
	 var sbc = $(".subnav-close");
	 var sbo = $(".subnav-open");
	 $(sbc).click(function(){
		 $(sbu).animate({width:'0',paddingLeft:'0'}, 1500, function(){
			 $(sbo).css("width","0").show().animate({width:'50'});
			 });
		 });
	 $(sbo).click(function(){
		 $(this).fadeOut("slow" , function(){
			 $(sbu).animate({width:'894',paddingLeft:'56'},1500)
			 });
		 });
 });
</script>
</body>
</html>