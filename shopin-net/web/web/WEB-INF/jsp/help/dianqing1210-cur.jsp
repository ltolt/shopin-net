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
.pt{padding-top:10px}
.pb{padding-bottom:10px}
.zm{zoom:1}
/*main*/
.box { background:#eff0e8}
.box *{ _zoom:1}
.tab-hd { height:27px; padding-left:5px; border-bottom:1px solid #ca2208}
.tab-hd li { float:left; margin:0 1px 0 0; _display:inline;}
.tab-hd li a { display:block; width:126px; height:27px; text-indent:-99em; overflow:hidden; background-image:url(http://images.shopin.net/images/ad/dianqing1210/t2.png);  background-repeat:no-repeat}
.tab-hd li a.f { width:84px;}
.tab-hd li a.s { background-position:0 -28px}
.tab-hd li a.s:hover, .tab-hd li.cur a.s, .tab-hd li.cur a.s:hover { background-position:0 -56px}
.tab-hd li a.t { background-position:0 -84px}
.tab-hd li a.t:hover, .tab-hd li.cur a.t, .tab-hd li.cur a.t:hover { background-position:0 -112px}
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
  <img src="http://images.shopin.net/images/ad/dianqing1210/top-ad2.jpg" usemap="#Map3" align="top">
  <map name="Map3">
    <area shape="rect" coords="36,28,194,108" href="#g">
    <area shape="rect" coords="702,8,897,90" href="#f">
    <area shape="rect" coords="673,111,842,181" href="#a">
  </map>

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
    Date startDate = sdf.parse("2012-10-25 00:00:00");
    Date endDate = sdf.parse("2012-10-25 19:17:59");
    if(startDate.before(today) && today.before(endDate)){
%>
  <img id="g" src="http://images.shopin.net/images/ad/dianqing1210/top4.jpg" usemap="#Map" align="top">
  <map name="Map">
    <area shape="rect" coords="19,131,471,400" href="http://www.shopin.net/help/bazhe1210.html" target="_blank">
    <area shape="rect" coords="478,131,932,399" href="http://www.shopin.net/promotion/6203.html" target="_blank">
  </map>
<%}%>
<%
   //时间段 开始时间 startDate 结束时间 endDate
    Date startDate1 = sdf.parse("2012-10-25 19:18:00");
		Date endDate1 = sdf.parse("2012-10-25 19:20:00");
		if(startDate1.before(today) && today.before(endDate1)){
%>
  <img id="g" src="http://images.shopin.net/images/ad/dianqing1210/top4-cur.jpg" usemap="#Mapcur" align="top">
  <map name="Mapcur">
    <area shape="rect" coords="19,131,471,400" href="http://www.shopin.net/help/bazhe1210.html" target="_blank">
    <area shape="rect" coords="478,131,932,399" href="http://www.shopin.net/promotion/6203.html" target="_blank">
  </map>
<%}%> 
<%
   //时间段 开始时间 startDate 结束时间 endDate
    Date startDate2 = sdf.parse("2012-10-25 19:20:01");
		Date endDate2 = sdf.parse("2012-10-26 23:59:59");
		if(startDate2.before(today) && today.before(endDate2)){
%>
  <img id="g" src="http://images.shopin.net/images/ad/dianqing1210/top4.jpg" usemap="#Map" align="top">
  <map name="Map">
    <area shape="rect" coords="19,131,471,400" href="http://www.shopin.net/help/bazhe1210.html" target="_blank">
    <area shape="rect" coords="478,131,932,399" href="http://www.shopin.net/promotion/6203.html" target="_blank">
  </map>
<%}%> 


  <img id="a" src="http://images.shopin.net/images/ad/dianqing1210/t1.png" align="top">
	<div class="box mb">
  	<ul class="tab-hd mt">
    	<li><a class="f" href="#">第一波</a></li>
    	<li><a class="s" href="#">第二波</a></li>
    	<li><a class="t" href="#">第三波</a></li>
    </ul>
    <div class="tab-bd">
    	<div class="item">
      	<ul>
<li><a href="http://www.shopin.net/promotion/6198.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/bd-01.jpg"></a></li>
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
    	<div class="item"><img src="http://images.shopin.net/images/ad/dianqing1210/logo.jpg" width="944" height="785"></div>
    	<div class="item"><img src="http://images.shopin.net/images/ad/dianqing1210/logo1.jpg" width="944" height="785"></div>
    </div>
    <img id="b" src="http://images.shopin.net/images/ad/dianqing1210/t3.png">
    <ul class="new-sale-list clear">
    	<li><a href="http://www.shopin.net/brands/1370.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/new-02.jpg"></a></li>
    	<li><a href="http://www.shopin.net/brands/2388.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/new-01.jpg"></a></li>
    	<li><a href="http://www.shopin.net/list-1591-1720-------1-/1.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/new-03.jpg"></a></li>
    	<li><a href="http://www.shopin.net/promotion/5918.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/new-04.jpg"></a></li>
    </ul>
    <img id="c" src="http://images.shopin.net/images/ad/dianqing1210/t4.png">
    <div class="start-wrap clear zm">
    	<ul class="item">
      	<div class="hd"><h3>网络特供专区</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6203.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/1345084.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/17/Pic1345084_3351_0_1.jpg" /><h3>HOPE SHOW时尚毛领双排扣大衣</h3></a><del>￥1499</del><em>￥374</em><span class="cornermark">￥189</span></li>
<li><a href="http://www.shopin.net/product/1422392.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/17/Pic1422392_1252_0_1.jpg" /><h3>秋水伊人貉子毛领网纱双排扣皮衣</h3></a><del>￥1293</del><em>￥492</em><span class="cornermark">￥239</span></li>
<li><a href="http://www.shopin.net/product/2077169.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/17/Pic2077169_7182_0_1.jpg" /><h3>纳纹V领羊毛连衣裙</h3></a><del>￥626</del><em>￥249</em><span class="cornermark">￥124</span></li>
<li><a href="http://www.shopin.net/product/1545131.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/08/02/Pic1545131_82019_0_1.jpg" /><h3>JIMANNO气质羊毛链条装饰大衣</h3></a><del>￥4799</del><em>￥711</em><span class="cornermark">￥360</span></li>
<li><a href="http://www.shopin.net/product/1495399.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/07/10/Pic1495399_189096_0_1.jpg" /><h3>温娜儿针织兔毛上衣</h3></a><del>￥1200</del><em>￥300</em><span class="cornermark">￥139</span></li>
<li><a href="http://www.shopin.net/product/1948158.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/17/Pic1948158_185046_0_1.jpg" /><h3>柯里卡时尚花饰V领针织衫</h3></a><del>￥1190</del><em>￥300</em><span class="cornermark">￥150</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6203.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-01.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>网络特供专区</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6217.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/2081304.html" target="_blank"><img src="http://images.shopin.net/images/68/2011/12/07/Pic1532501_8605_0_1.jpg" /><h3>菲尔图超保暖滑雪布中筒棉靴</h3></a><del>￥580</del><em>￥199</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/1432820.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/09/23/Pic1432820_11123_0_1.jpg" /><h3>红蜻蜓简约防水台过膝长筒靴</h3></a><del>￥1139</del><em>￥380</em><span class="cornermark">￥199</span></li>
<li><a href="http://www.shopin.net/product/2029546.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/13/Pic2029546_85315_0_1.jpg" /><h3>依彩绒渐变色长款纯羊毛衫</h3></a><del>￥1096</del><em>￥269</em><span class="cornermark">￥149</span></li>
<li><a href="http://www.shopin.net/product/2077811.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/10/18/Pic2077811_143009_0_1.jpg" /><h3>KELIYA男士菱形纹100%羊毛衫</h3></a><del>￥698</del><em>￥129</em><span class="cornermark">￥65</span></li>
<li><a href="http://www.shopin.net/product/1910046.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/06/19/Pic1910046_187272_0_1.jpg" /><h3>OURSHINE长款收腰连帽白鸭绒羽绒服</h3></a><del>￥878</del><em>￥298</em><span class="cornermark">￥199</span></li>
<li><a href="http://www.shopin.net/product/1547160.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/17/Pic1547160_157399_0_1.jpg" /><h3>聊黛部儿专柜正品2012长款白鸭绒羽绒</h3></a><del>￥782</del><em>￥279</em><span class="cornermark">￥189</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6217.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-02.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>女装</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6207.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/1387748.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/17/Pic1387748_123130_0_1.jpg" /><h3>huayin韩版双排扣连帽大衣</h3></a><del>￥1280</del><em>￥298</em><span class="cornermark">￥149</span></li>
<li><a href="http://www.shopin.net/product/1722323.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/17/Pic1722323_122240_0_1.jpg" /><h3>B.SIQI气质钻饰印花外套</h3></a><del>￥1690</del><em>￥500</em><span class="cornermark">￥249</span></li>
<li><a href="http://www.shopin.net/product/2074389.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/17/Pic2074389_1382_0_1.jpg" /><h3>秋水伊人蓝底印花衬衫</h3></a><del>￥596</del><em>￥119</em><span class="cornermark">￥60</span></li>
<li><a href="http://www.shopin.net/product/1699142.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/17/Pic1699142_7172_0_1.jpg" /><h3>纳纹网纱两件套连衣裙</h3></a><del>￥716</del><em>￥286</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/1998045.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/17/Pic1998045_167228_0_1.jpg" /><h3>WAYONLY时尚闪亮短款连帽棉服</h3></a><del>￥899</del><em>￥248</em><span class="cornermark">￥78</span></li>
<li><a href="http://www.shopin.net/product/82521.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/17/Pic82521_24118_0_1.jpg" /><h3>IVRESSE时尚立领长款风衣</h3></a><del>￥1488</del><em>￥150</em><span class="cornermark">￥75</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6207.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-04.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>内衣</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6208.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/2037535.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/17/Pic2037535_200261_0_1.jpg" /><h3>WAYONLY深V聚拢文胸</h3></a><del>￥570</del><em>￥78</em><span class="cornermark">￥39</span></li>
<li><a href="http://www.shopin.net/product/2075666.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/23/Pic2075666_1141_0_1.jpg" /><h3>桑扶兰精致刺绣文胸</h3></a><del>￥248</del><em>￥120</em><span class="cornermark">￥50</span></li>
<li><a href="http://www.shopin.net/product/759757.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/11/25/Pic759757_82666_0_1.jpg" /><h3>俞兆林女士时尚圆领保暖套装</h3></a><del>￥188</del><em>￥59</em><span class="cornermark">￥49</span></li>
<li><a href="http://www.shopin.net/product/330856.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/08/09/Pic330856_1221_0_1.jpg" /><h3>桑扶兰刺绣花边3/4模杯文胸</h3></a><del>￥358</del><em>￥99</em><span class="cornermark">￥35</span></li>
<li><a href="http://www.shopin.net/product/2083211.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/18/Pic2083211_161362_0_1.jpg" /><h3>plandoo素面高领弹力套装</h3></a><del>￥238</del><em>￥142</em><span class="cornermark">￥50</span></li>
<li><a href="http://www.shopin.net/product/2081291.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/18/Pic2081291_158035_0_1.jpg" /><h3>北极绒男士丝柔薄暖套装</h3></a><del>￥498</del><em>￥298</em><span class="cornermark">￥129</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6208.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-06.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>羊绒/毛衫</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6225.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/2077864.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/17/Pic2077864_77568_0_1.jpg" /><h3>KELIYA长款时尚混绒衫</h3></a><del>￥998</del><em>￥398</em><span class="cornermark">￥199</span></li>
<li><a href="http://www.shopin.net/product/2075101.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/13/Pic2075101_73633_0_1.jpg" /><h3>金利来女款圆领羊绒衫</h3></a><del>￥2898</del><em>￥1449</em><span class="cornermark">￥699</span></li>
<li><a href="http://www.shopin.net/product/2077196.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/13/Pic2077196_83755_0_1.jpg" /><h3>尼特维尔时尚混绒衫</h3></a><del>￥792</del><em>￥350</em><span class="cornermark">￥198</span></li>
<li><a href="http://www.shopin.net/product/2077823.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/13/Pic2077823_77568_0_1.jpg" /><h3>KELIYA长款时尚混绒衫</h3></a><del>￥998</del><em>￥398</em><span class="cornermark">￥199</span></li>
<li><a href="http://www.shopin.net/product/2075084.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/13/Pic2075084_205144_0_1.jpg" /><h3>金利来女款高领羊绒衫</h3></a><del>￥2198</del><em>￥1099</em><span class="cornermark">￥499</span></li>
<li><a href="http://www.shopin.net/product/2074000.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/22/Pic2074000_72662_0_1.jpg" /><h3>正亚女款羊毛衫</h3></a><del>￥568</del><em>￥119</em><span class="cornermark">￥￥59起</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6225.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-03.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>鞋</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6226.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/2074404.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/13/Pic2074404_122758_0_1.jpg" /><h3>鳄鱼恤女款牛皮短靴</h3></a><del>￥798</del><em>￥299</em><span class="cornermark">￥149</span></li>
<li><a href="http://www.shopin.net/product/2073807.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/10/13/Pic2073807_152334_0_1.jpg" /><h3>奥康牛皮钻饰靴子</h3></a><del>￥969</del><em>￥265</em><span class="cornermark">￥133</span></li>
<li><a href="http://www.shopin.net/product/2077179.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/15/Pic2077179_15374_0_1.jpg" /><h3>CNE女款绒面长靴</h3></a><del>￥1699</del><em>￥399</em><span class="cornermark">￥199</span></li>
<li><a href="http://www.shopin.net/product/2079039.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/15/Pic2079039_11103_0_1.jpg" /><h3>红蜻蜓真皮中长靴</h3></a><del>￥939</del><em>￥259</em><span class="cornermark">￥130</span></li>
<li><a href="http://www.shopin.net/product/2076642.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/13/Pic2076642_13836_0_1.jpg" /><h3>Kiss Cat反绒皮短靴</h3></a><del>￥938</del><em>￥284</em><span class="cornermark">￥100</span></li>
<li><a href="http://www.shopin.net/product/1991745.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/09/19/Pic1991745_185648_0_1.jpg" /><h3>TB羊绒系带靴子</h3></a><del>￥1380</del><em>￥399</em><span class="cornermark">￥199</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6226.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-05.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>男装</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6209.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/935917.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/01/28/Pic935917_94263_0_1.jpg" /><h3>罗弗帝奇男款羽绒服</h3></a><del>￥2980</del><em>￥716</em><span class="cornermark">￥199</span></li>
<li><a href="http://www.shopin.net/product/2074413.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/15/Pic2074413_77335_0_1.jpg" /><h3>费尔法特男款羊毛套头衫</h3></a><del>￥1280</del><em>￥361</em><span class="cornermark">￥180</span></li>
<li><a href="http://www.shopin.net/product/2074326.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/12/Pic2074326_106808_0_1.jpg" /><h3>普顿商务休闲长裤</h3></a><del>￥636</del><em>￥319</em><span class="cornermark">￥159</span></li>
<li><a href="http://www.shopin.net/product/2077525.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/13/Pic2077525_134904_0_1.jpg" /><h3>帕古茨商务休闲外套</h3></a><del>￥2480</del><em>￥289</em><span class="cornermark">￥119</span></li>
<li><a href="http://www.shopin.net/product/2077855.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/15/Pic2077855_91139_0_1.jpg" /><h3>吉诺里兹针织羊毛衫</h3></a><del>￥1380</del><em>￥300</em><span class="cornermark">￥150</span></li>
<li><a href="http://www.shopin.net/product/2076926.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/15/Pic2076926_74965_0_1.jpg" /><h3>大卫山男款加棉长裤</h3></a><del>￥1080</del><em>￥198</em><span class="cornermark">￥99</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6209.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-07.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>休闲</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6212.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/2075718.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/13/Pic2075718_57230_0_1.jpg" /><h3>高尔普男款羽绒外套</h3></a><del>￥1760</del><em>￥884</em><span class="cornermark">￥399</span></li>
<li><a href="http://www.shopin.net/product/2074356.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/13/Pic2074356_90838_0_1.jpg" /><h3>WRC时尚针织毛衣</h3></a><del>￥998</del><em>￥149</em><span class="cornermark">￥75</span></li>
<li><a href="http://www.shopin.net/product/2074175.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/12/Pic2074175_30907_0_1.jpg" /><h3>苏格兰飞人格纹衬衣</h3></a><del>￥429</del><em>￥215</em><span class="cornermark">￥108</span></li>
<li><a href="http://www.shopin.net/product/2079366.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/15/Pic2079366_20135_0_1.jpg" /><h3>皮尔卡丹男士牛仔长裤</h3></a><del>￥698</del><em>￥349</em><span class="cornermark">￥175</span></li>
<li><a href="http://www.shopin.net/product/2074202.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/10/15/Pic2074202_62850_0_1.jpg" /><h3>Baleno时尚秋款卫衣</h3></a><del>￥169</del><em>￥135</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/2074213.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/15/Pic2074213_20629_0_1.jpg" /><h3>I.P.ZONE时尚牛仔长裤</h3></a><del>￥229.9</del><em>￥160</em><span class="cornermark">￥112</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6212.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-10.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>运动</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6204.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/1061951.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/03/14/Pic1061951_109343_0_1.jpg" /><h3>纽巴伦男式休闲鞋</h3></a><del>￥532</del><em>￥239</em><span class="cornermark">￥120</span></li>
<li><a href="http://www.shopin.net/product/1518792.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/11/18/Pic1518792_154499_0_1.jpg" /><h3>美国苹果女式运动鞋</h3></a><del>￥447</del><em>￥188</em><span class="cornermark">￥94</span></li>
<li><a href="http://www.shopin.net/product/1393807.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/09/07/Pic1393807_32097_0_1.jpg" /><h3>安踏男式休闲鞋</h3></a><del>￥239</del><em>￥143</em><span class="cornermark">￥71</span></li>
<li><a href="http://www.shopin.net/product/1393726.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/09/07/Pic1393726_32097_0_1.jpg" /><h3>安踏女式休闲鞋</h3></a><del>￥239</del><em>￥143</em><span class="cornermark">￥71</span></li>
<li><a href="http://www.shopin.net/product/2015440.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/09/03/Pic2015440_30505_0_1.jpg" /><h3>361°男式摇粒风衣</h3></a><del>￥569</del><em>￥341</em><span class="cornermark">￥170</span></li>
<li><a href="http://www.shopin.net/product/1500697.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/11/09/Pic1500697_32097_0_1.jpg" /><h3>安踏女式运动长裤</h3></a><del>￥159</del><em>￥79</em><span class="cornermark">￥40</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6204.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-08.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>户外</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6206.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/761223.html" target="_blank"><img src="http://images.shopin.net/images/61/2010/11/02/Pic761223_86081_0_1.jpg" /><h3>PURELAND派雷男式三合一冲锋衣</h3></a><del>￥1588</del><em>￥754</em><span class="cornermark">￥377</span></li>
<li><a href="http://www.shopin.net/product/1429620.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/09/22/Pic1429620_26708_0_1.jpg" /><h3>KingCamp男式三合一冲锋衣</h3></a><del>￥1480</del><em>￥740</em><span class="cornermark">￥370</span></li>
<li><a href="http://www.shopin.net/product/2079137.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/10/15/Pic2079137_22757_0_1.jpg" /><h3>KAILAS男式AAC三合一冲锋衣</h3></a><del>￥2198</del><em>￥849</em><span class="cornermark">￥425</span></li>
<li><a href="http://www.shopin.net/product/2079147.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/10/15/Pic2079147_23200_0_1.jpg" /><h3>KAILAS女式AAC三合一冲锋衣</h3></a><del>￥2198</del><em>￥849</em><span class="cornermark">￥425</span></li>
<li><a href="http://www.shopin.net/product/1376376.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/08/26/Pic1376376_26686_0_1.jpg" /><h3>KingCamp男式冲锋裤</h3></a><del>￥698</del><em>￥349</em><span class="cornermark">￥175</span></li>
<li><a href="http://www.shopin.net/product/2074180.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/16/Pic2074180_26743_0_1.jpg" /><h3>KingCamp女式冲锋裤</h3></a><del>￥738</del><em>￥369</em><span class="cornermark">￥185</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6206.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-09.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>童装</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6205.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/2079169.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/15/Pic2079169_110236_0_1.jpg" /><h3>ABCKIDS男童运动外套</h3></a><del>￥326</del><em>￥130</em><span class="cornermark">￥66</span></li>
<li><a href="http://www.shopin.net/product/2075587.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/12/Pic2075587_166997_0_1.jpg" /><h3>汪小荷纯棉翻领系扣小外套</h3></a><del>￥199</del><em>￥59</em><span class="cornermark">￥30</span></li>
<li><a href="http://www.shopin.net/product/2074235.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/13/Pic2074235_145012_0_1.jpg" /><h3>空中天使男童圆领彩格羊毛衣</h3></a><del>￥369</del><em>￥149</em><span class="cornermark">￥74</span></li>
<li><a href="http://www.shopin.net/product/2074115.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/12/Pic2074115_54971_0_1.jpg" /><h3>昱璐女童波浪纹羊毛衫</h3></a><del>￥329</del><em>￥155</em><span class="cornermark">￥77</span></li>
<li><a href="http://www.shopin.net/product/2074183.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/12/Pic2074183_157660_0_1.jpg" /><h3>迪士尼女童长款炫彩白鸭绒羽绒服</h3></a><del>￥809</del><em>￥324</em><span class="cornermark">￥162</span></li>
<li><a href="http://www.shopin.net/product/2073990.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/15/Pic2073990_2327_0_1.jpg" /><h3>DorDorHouse舒适运动单鞋</h3></a><del>￥418</del><em>￥125</em><span class="cornermark">￥63</span></li>
          </ul>
          <a href="http://www.shopin.net/promotion/6205.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/start-11.jpg" width="444" height="120"></a>
        </div>
      </ul>
    	<ul class="item">
      	<div class="hd"><h3>箱包配饰</h3><em>&nbsp;</em><a href="http://www.shopin.net/promotion/6210.html" target="_blank">更多&gt;&gt;</a></div>
      	<div class="bd prolist">
          <ul>
<li><a href="http://www.shopin.net/product/2076315.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/10/12/Pic2076315_15945_0_1.jpg" /><h3>oodfumiture真皮包</h3></a><del>￥1299</del><em>￥426</em><span class="cornermark">￥213</span></li>
<li><a href="http://www.shopin.net/product/1959790.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/07/30/Pic1959790_18470_0_1.jpg" /><h3>LAFITE磨沙休闲手袋</h3></a><del>￥639</del><em>￥223</em><span class="cornermark">￥113</span></li>
<li><a href="http://www.shopin.net/product/2074315.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/12/Pic2074315_197467_0_1.jpg" /><h3>特莱玟时尚围巾</h3></a><del>￥299</del><em>￥149</em><span class="cornermark">￥75</span></li>
<li><a href="http://www.shopin.net/product/2074204.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/12/Pic2074204_105772_0_1.jpg" /><h3>POLO女款PU钱包</h3></a><del>￥498</del><em>￥149</em><span class="cornermark">￥75</span></li>
<li><a href="http://www.shopin.net/product/2074123.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/10/13/Pic2074123_17129_0_1.jpg" /><h3>扎内蒂双肩包</h3></a><del>￥538</del><em>￥188</em><span class="cornermark">￥94</span></li>
<li><a href="http://www.shopin.net/product/2075470.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/13/Pic2075470_18239_0_1.jpg" /><h3>梦特娇男士真皮腰带</h3></a><del>￥428</del><em>￥256</em><span class="cornermark">￥128</span></li>
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
<li><a href="http://www.shopin.net/brands/1295.html" target="_blank"><img src="http://images.shopin.net/images//brand/1295_2.jpg" alt="Life Home">1-3折</a></li>
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
<li><a href="http://www.shopin.net/casual/brand/list-293-1753/1.html" target="_blank"><img src="http://images.shopin.net/images//brand/293_2.jpg" alt="HUSH PUPPIES">5折封</a></li>
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
    <a id="f" href="http://www.shopin.net/help/manzeng.html" target="_blank"><img class="mt" src="http://images.shopin.net/images/ad/dianqing1210/img1.jpg"></a><a href="http://www.shopin.net/help/yure.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/img2.jpg"></a>
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