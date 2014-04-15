<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>3月女人,绚丽三八,换季独享,名品内衣,品牌女装,女装,女鞋,内衣,凉鞋,品牌联合蜂抢会,9大内衣品牌专场,全场2-5折,2012.2.25-3.11,仅13天</title>
<link href="http://images.shopin.net/css/reset.css" rel="stylesheet" type="text/css" />
<link href="http://images.shopin.net/css/funvjie.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://images.shopin.net/js/jquery/jquery132min.js"></script>
<script type="text/javascript">
//轮播图
$(function() {
	var len = $("#focus ul li").length; //获取焦点图中的图片总数
	var index = 0; //图片索引值默认为0
	var picTimer; //声明一个时间变量备用
	
	var btn = "<div class='btn'>"; //btn变量用来在焦点图中添加按钮，由于是纯数字无实际意义，在这里使用jquery插入而不是直接存在于网页内容中，这样也方便于一些网站内容管理系统的生成。
	for(i=0;i<len;i++) {
		btn += "<span>" + (i+1) + "</span>";
	}
	btn += "</div>";
	$("#focus").append(btn);

	$("#focus .btn span").mouseover(function() { //按钮的鼠标单击事件
		index = $("#focus .btn span").index(this); //获取到被单击按钮的索引值（顺序）
		showPic(index); //通过showPic()函数显示该索引值的图片
	}).eq(0).click(); //初始化，默认显示索引值为0（第一张）的图片

	$("#focus").hover(function() {
		clearInterval(picTimer); //鼠标经过焦点图时停止自动播放
	},function() {
		picTimer = setInterval(function() {
			showPic(index); //鼠标滑出时根据当前索引值继续自动播放
			index++; //设置索引值为下一张图片
			if(index==len) {index=0;} //如果索引值等于图片总数，下一次显示第一张图片
		},3000); //3000定义执行以上语句的时间周期
	}).trigger("mouseleave"); //初始化，触发鼠标滑出事件，即自动播放

	function showPic(index) {
		var picHeight = $("#focus ul li img").height(); //变量picHeight获取到图片的高度，当然也可以使用固定值而省略此步
		$("#focus ul").stop(true,false).animate({top:-picHeight*index},300); //根据图片高度和当前图片的索引值，计算出ul向上的偏移量，再使用.animate()来移动它实现动画效果。结尾的"300"定义了移动速度
		$("#focus .btn span").removeClass("on").eq(index).addClass("on");//根据index变量（索引值）给相应的按钮添加selected的类，并移除其它按钮的selected类
	}
});
</script>
</head>

<body>
<div class="box">
  <img src="http://images.shopin.net/images/ad/funvjie/topbanner.jpg" width="950" height="271" alt="绚丽三八 换季独享 品牌联合蜂抢会 2012.2.28-3.11仅13天" />
  <div class="hot_screen clear">
  	<div class="focus fl">
      <div id="focus">
        <ul>
            <li><a href="#m1"><img src="http://images.shopin.net/images/ad/funvjie/pic1.jpg" alt="" /></a></li>
            <li><a href="#m2"><img src="http://images.shopin.net/images/ad/funvjie/pic2.jpg" alt="" /></a></li>
        </ul>
      </div>
    </div>
    <ul class="announcement fr">
      <li class="hd">打折快报</li>
      <li><a href="http://www.shopin.net/brand/list-59/14.html" target="_blank">&gt;&nbsp;秋水伊人 优雅名媛风 超值春装 百元精选</a></li>
      <li><a href="http://www.shopin.net/brand/list-165-1081-------1-.html" target="_blank">&gt;&nbsp;古今 自信美丽 春夏系列文胸3-8折</a></li>
      <li><a href="http://www.shopin.net/promotion/4418.html" target="_blank">&gt;&nbsp;GALADAY 高贵典雅 时尚春夏鞋包半价抢</a></li>
    </ul>
    <a class="fr"><img src="http://images.shopin.net/images/ad/funvjie/subbanner.jpg" width="332" height="155" alt="精彩3月 精明女人" /></a>
  </div>
  <img id="m1" src="http://images.shopin.net/images/ad/funvjie/title2_1.jpg" width="950" height="36" />
  <img src="http://images.shopin.net/images/ad/funvjie/pic3_1.jpg" width="950" height="249" border="0" usemap="#Map3" />
  <map name="Map3" id="Map3">
    <area shape="rect" coords="11,10,235,236" href="http://www.shopin.net/promotion/4152.html" target="_blank" />
    <area shape="rect" coords="245,10,469,236" href="http://www.shopin.net/promotion/4453.html" target="_blank" />
    <area shape="rect" coords="479,10,704,236" href="http://www.shopin.net/promotion/4351.html" target="_blank" />
    <area shape="rect" coords="714,10,937,236" href="http://www.shopin.net/promotion/4454.html" target="_blank" />
  </map>
  <img src="http://images.shopin.net/images/ad/funvjie/pic4_1.jpg" width="950" height="260" border="0" usemap="#Map" align="top" />
  <map name="Map" id="Map">
    <area shape="rect" coords="11,12,235,238" href="http://www.shopin.net/promotion/4456.html" target="_blank" />
    <area shape="rect" coords="246,12,470,238" href="http://www.shopin.net/promotion/4200.html" target="_blank" />
    <area shape="rect" coords="479,12,704,238" href="http://www.shopin.net/promotion/4455.html" target="_blank" />
    <area shape="rect" coords="714,12,937,238" href="http://www.shopin.net/promotion/4457.html" target="_blank" />
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
    Date startDate1 = sdf.parse("2012-03-02 13:14:00");
	Date endDate1 = sdf.parse("2012-03-11 23:59:59");
	// method 2
	if(startDate1.before(today) && today.before(endDate1)){
%>
<!--此处放内容-->
  <img src="http://images.shopin.net/images/ad/funvjie/pic5.jpg" width="950" height="136" border="0" usemap="#Map2" />
  <map name="Map2" id="Map2">
    <area shape="rect" coords="0,5,950,135" href="http://www.shopin.net/promotion/4458.html" target="_blank" />
  </map>
<!--此处放内容-->
<%}%>
<!--other-->
<%
   //时间段 开始时间 startDate 结束时间 endDate
    Date startDate2 = sdf.parse("2012-02-28 00:00:00");
	Date endDate2 = sdf.parse("2012-03-02 13:14:00");
	// method 2
	if(startDate2.before(today) && today.before(endDate2)){
%>

<!--此处放内容-->
  <img src="http://images.shopin.net/images/ad/funvjie/pic5_g.jpg" width="950" height="173" />
<!--此处放内容-->
<%}%>
  <img src="http://images.shopin.net/images/ad/funvjie/title1.jpg" width="950" height="40" />
  <div class="brand_list">
  	<ul class="clear">
      <li class="title"><img src="http://images.shopin.net/images/ad/funvjie/nz.jpg" width="128" height="68" alt="女装" align="top" /><p><a href="http://www.shopin.net/channel-lady.html" target="_blank">更多&gt;&gt;</a></p></li>
      <li><a href="http://www.shopin.net/lady/brands/59.html" target="_blank"><img src="http://images.shopin.net/images/brand/59_2.jpg" />秋水伊人</a><p>2.5-4折</p></li>
      <li><a href="http://www.shopin.net/brands/2087.html" target="_blank"><img src="http://images.shopin.net/images/brand/2087_2.jpg" />片断</a><p>3-5折</p></li>
      <li><a href="http://www.shopin.net/lady/brands/112.html" target="_blank"><img src="http://images.shopin.net/images/brand/112_2.jpg" />红袖</a><p>2-4折</p></li>
      <li><a href="http://www.shopin.net/brands/408.html" target="_blank"><img src="http://images.shopin.net/images/brand/408_2.jpg" />IVRESSE</a><p>1.5-2.5折</p></li>
      <li><a href="http://www.shopin.net/brands/1403.html" target="_blank"><img src="http://images.shopin.net/images//brand/1403_2.jpg" />诺恩</a><p>2-3折</p></li>
      <li><a href="http://www.shopin.net/lady/brands/151.html" target="_blank"><img src="http://images.shopin.net/images/brand/151_2.jpg" /></a>LILY<p>2-4折</p></li>
      <li><a href="http://www.shopin.net/brands/1790.html" target="_blank"><img src="http://images.shopin.net/images/brand/1790_2.jpg" />ST.NORAH</a><p>2-3折</p></li>
      <li><a href="http://www.shopin.net/lady/brands/1818.html" target="_blank"><img src="http://images.shopin.net/images/brand/1818_2.jpg" />花尹</a><p>1.5-5折</p></li>
      <li><a href="http://www.shopin.net/lady/brands/153.html" target="_blank"><img src="http://images.shopin.net/images/brand/153_2.jpg" />纳纹</a><p>2-4折</p></li>
      <li><a href="http://www.shopin.net/brands/2070.html" target="_blank"><img src="http://images.shopin.net/images/brand/2070_2.jpg" />WAYONLY</a><p>3-5折</p></li>
      <li><a href="http://www.shopin.net/lady/brands/1793.html" target="_blank"><img src="http://images.shopin.net/images/ad/funvjie/1793_2.jpg" align="middle" />西贝伦</a><p>3折封</p></li>
      <li><a href="http://www.shopin.net/lady/brands/1047.html" target="_blank"><img src="http://images.shopin.net/images/brand/1047_2.jpg" />圣三利</a><p>3折封</p></li>
      <li><a href="http://www.shopin.net/lady/brands/289.html" target="_blank"><img src="http://images.shopin.net/images/brand/289_2.jpg" />皮尔卡丹</a><p>2-6折</p></li>
    </ul>
  	<ul class="clear">
      <li class="title"><img src="http://images.shopin.net/images/ad/funvjie/nx.jpg" width="128" height="68" alt="女装" align="top" /><p><a href="http://www.shopin.net/channel-shoes.html" target="_blank">更多&gt;&gt;</a></p></li>
      <li><a href="http://www.shopin.net/shoes/brand/list-256-1469-------1-.html" target="_blank"><img src="http://images.shopin.net/images/brand/256_2.jpg" />莱尔斯丹</a><p>3-5折</p></li>
      <li><a href="http://www.shopin.net/shoes/brands/1357.html" target="_blank"><img src="http://images.shopin.net/images/brand/1357_2.jpg" />MISS SIXTY</a><p>3-5折</p></li>
      <li><a href="http://www.shopin.net/shoes/brand/list-319-1379.html" target="_blank"><img src="http://images.shopin.net/images/brand/319_2.jpg" />红蜻蜓</a><p>3-5折</p></li>
      <li><a href="http://www.shopin.net/shoes/brands/219.html" target="_blank"><img src="http://images.shopin.net/images/brand/219_2.jpg" />D:FUSE</a><p>3-5折</p></li>
      <li><a href="http://www.shopin.net/shoes/brands/246.html" target="_blank"><img src="http://images.shopin.net/images/brand/246_2.jpg" />千百度</a><p>4-7折</p></li>
      <li><a href="http://www.shopin.net/shoes/brand/list-340-1379.html" target="_blank"><img src="http://images.shopin.net/images/brand/340_2.jpg" />芭迪</a><p>3-5折</p></li>
      <li><a href="http://www.shopin.net/shoes/brand/list-369-1379.html" target="_blank"><img src="http://images.shopin.net/images/brand/369_2.jpg" />波熙</a><p>3.5-7折</p></li>
      <li><a href="http://www.shopin.net/shoes/brands/237.html" target="_blank"><img src="http://images.shopin.net/images/brand/237_2.jpg" />捷希</a><p>3-6折</p></li>
      <li><a href="http://www.shopin.net/shoes/brand/list-187-1379.html" target="_blank"><img src="http://images.shopin.net/images/brand/187_2.jpg" />菲尔图</a><p>4-6折</p></li>
      <li><a href="http://www.shopin.net/shoes/brands/1191.html" target="_blank"><img src="http://images.shopin.net/images/brand/1191_2.jpg" />GALADAY</a><p>3-5折</p></li>
      <li><a href="http://www.shopin.net/shoes/brands/239.html" target="_blank"><img src="http://images.shopin.net/images/brand/239_2.jpg" />AEE</a><p>3-6折</p></li>
      <li><a href="http://www.shopin.net/shoes/brands/126.html" target="_blank"><img src="http://images.shopin.net/images/brand/126_2.jpg" />FED</a><p>3-5折</p></li>
      <li><a href="http://www.shopin.net/shoes/brands/185.html" target="_blank"><img src="http://images.shopin.net/images/brand/185_2.jpg" />卡曼尼</a><p>3-4.5折</p></li>
    </ul>
  </div>
  <img id="m2" src="http://images.shopin.net/images/ad/funvjie/title3.jpg" width="950" height="37" />
  <div class="wrap">
    <div class="hd"><a class="fr" href="http://www.shopin.net/lady/list--1231--------.html" target="_blank">更多&gt;&gt;</a><img src="http://images.shopin.net/images/ad/funvjie/wt.jpg" width="52" height="19" alt="外套" /></div>
	<ul class="enlarge_list_view clear">
      <li>
        <h3><a href="http://www.shopin.net/product/1599108.html" title="" target="_blank">诺恩专柜正品长裤CY-756</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1599108.html" title="" target="_blank"><img src="http://images.shopin.net/images/63/2012/01/16/Pic1599108_123097_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥1080</del>￥540</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1376970.html" title="" target="_blank">秋水伊人双排扣圆领风衣113111010</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1376970.html" title="" target="_blank"><img src="http://images.shopin.net/images/60/2012/02/09/Pic1376970_1323_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥1259</del>￥359</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1335784.html" title="" target="_blank">秋水伊人波点小外套111207005</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1335784.html" title="" target="_blank"><img src="http://images.shopin.net/images/60/2012/02/26/Pic1335784_1624_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥646</del>￥193</div>
      </li>
      <li>
        <h3><a href="#" title="http://www.shopin.net/product/1658140.html" target="_blank">BEISSY七分袖薄外套CB21062</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1658140.html" title="http://www.shopin.net/product/1658140.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/02/24/Pic1658140_125160_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥549</del>￥329</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1617527.html" title="" target="_blank">veilond中长款风衣</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1617527.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2012/02/13/Pic1617527_48680_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥998</del>￥598</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1643810.html" title="" target="_blank">dribs&drabs纯棉修身小西服</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1643810.html" title="" target="_blank"><img src="http://images.shopin.net/images/68/2012/02/18/Pic1643810_164433_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥329</del>￥164</div>
      </li>
	</ul>
    <div class="hd"><a class="fr" href="http://www.shopin.net/lady/list--1258--------.html">更多&gt;&gt;</a><img src="http://images.shopin.net/images/ad/funvjie/qz.jpg" width="52" height="19" alt="裙子" /></div>
	<ul class="enlarge_list_view clear">
      <li>
        <h3><a href="http://www.shopin.net/product/1418871.html" title="" target="_blank">HOPE SHOW夏款连衣裙</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1418871.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2011/09/16/Pic1418871_3456_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥629</del>￥207</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1419360.html" title="" target="_blank">HOPE SHOW水波纹装饰洋装H8201211</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1419360.html" title="" target="_blank"><img src="http://images.shopin.net/images/60/2012/02/09/Pic1419360_3480_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥549</del>￥181</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1603053.html" title="" target="_blank">BEISSY宝石装饰腰带款修身连衣裙CL21016</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1603053.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2012/01/19/Pic1603053_125166_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥579</del>￥347</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1643479.html" title="" target="_blank">dribs&drabs经典条纹连衣裙112052</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1643479.html" title="" target="_blank"><img src="http://images.shopin.net/images/68/2012/02/20/Pic1643479_164511_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥359</del>￥179</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1328819.html" title="" target="_blank">秋水伊人浪漫印花吊带裙111302061</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1328819.html" title="" target="_blank"><img src="http://images.shopin.net/images/66/2012/02/24/Pic1328819_1493_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥626</del>￥187</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1345519.html" title="" target="_blank">veilond蕾丝装饰半袖连衣裙1C816</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1345519.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2011/08/08/Pic1345519_48677_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥768</del>￥269</div>
      </li>
	</ul>
    <div class="hd"><a class="fr" href="http://www.shopin.net/shoes/list--1469--------.html">更多&gt;&gt;</a><img src="http://images.shopin.net/images/ad/funvjie/dx.jpg" width="52" height="19" alt="单鞋" /></div>
	<ul class="enlarge_list_view clear">
      <li>
        <h3><a href="http://www.shopin.net/product/1605243.html" title="" target="_blank">BOOSARR 可爱蝴蝶结甜美高跟鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1605243.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2012/01/18/Pic1605243_108123_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥568</del>￥256</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/359449.html" title="" target="_blank">GALADAY 不规则撞色鱼嘴鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/359449.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2011/03/21/Pic359449_105221_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥698</del>￥258</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1635678.html" title="" target="_blank">红蜻蜓 优雅蝴蝶结 头层牛皮平底鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1635678.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2012/02/15/Pic1635678_54301_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥639</del>￥298</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1452661.html" title="" target="_blank">MISS SIXTY 复古尖头铆钉平底鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1452661.html" title="" target="_blank"><img src="http://images.shopin.net/images/60/2011/10/11/Pic1452661_147499_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥1290</del>￥645</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1598534.html" title="" target="_blank">劳拉 牛漆皮蝴蝶结休闲鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1598534.html" title="" target="_blank"><img src="http://images.shopin.net/images/63/2012/01/16/Pic1598534_11374_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥598</del>￥298</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1622236.html" title="" target="_blank">捷希 交叉绑带牛皮平底鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1622236.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2012/02/10/Pic1622236_133671_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥788</del>￥398</div>
      </li>
	</ul>
    <div class="hd"><a class="fr" href="http://www.shopin.net/shoes/list--1467--------.html">更多&gt;&gt;</a><img src="http://images.shopin.net/images/ad/funvjie/lx.jpg" width="52" height="19" alt="凉鞋" /></div>
	<ul class="enlarge_list_view clear">
      <li>
        <h3><a href="http://www.shopin.net/product/1633445.html" title="" target="_blank">捷希 豹纹系带坡跟凉鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1633445.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2012/02/15/Pic1633445_95870_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥898</del>￥268</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/422276.html" title="" target="_blank">GALADAY 交叉撞色凉鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/422276.html" title="" target="_blank"><img src="http://images.shopin.net/images//58/2011/05/04//Pic422276_105264_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥638</del>￥258</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1220666.html" title="" target="_blank">MISS SIXTY时尚平底凉鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1220666.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2012/02/29/Pic1220666_123902_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥1290</del>￥480</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1300329.html" title="" target="_blank">维勒当娜 铆钉坡跟凉鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1300329.html" title="" target="_blank"><img src="http://images.shopin.net/images//58/2011/07/07//Pic1300329_50657_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥740</del>￥298</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1649774.html" title="" target="_blank">COUBER.G 头层羊皮花饰凉鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1649774.html" title="" target="_blank"><img src="http://images.shopin.net/images//58/2012/02/22//Pic1649774_59470_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥628</del>￥263</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1048967.html" title="" target="_blank">芭迪 浅金金属羊皮凉鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1048967.html" title="" target="_blank"><img src="http://images.shopin.net/images//61/2011/03/07//Pic1048967_14511_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥529</del>￥218</div>
      </li>
	</ul>
    <div class="hd"><a class="fr" href="http://www.shopin.net/underwear/list--1081--------.html">更多&gt;&gt;</a><img src="http://images.shopin.net/images/ad/funvjie/ny.jpg" width="52" height="19" alt="内衣" /></div>
	<ul class="enlarge_list_view clear">
      <li>
        <h3><a href="http://www.shopin.net/product/2805.html" title="" target="_blank">体会粉色蕾丝边文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/2805.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2010/04/05/Pic2805_1159_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥238</del>￥60</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/967881.html" title="" target="_blank">体会可爱卡通款文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/967881.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2011/01/25/Pic967881_1139_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥198</del>￥99</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/942731.html" title="" target="_blank">古今花朵款少女文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/942731.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2011/01/05/Pic942731_6342_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥150</del>￥70</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/2452.html" title="" target="_blank">欧迪芬纯棉系列文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/2452.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2010/08/10/Pic2452_2350_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥279</del>￥80</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/17291.html" title="" target="_blank">ELLE花朵款文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/17291.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2010/03/19/Pic17291_10372_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥228</del>￥50</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1448418.html" title="" target="_blank">ELLE波点款可爱文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1448418.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2011/11/25/Pic1448418_156976_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥338</del>￥155</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1593962.html" title="" target="_blank">ELLE春夏蕾丝文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1593962.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2012/02/15/Pic1593962_8237_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥328</del>￥164</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/962641.html" title="" target="_blank">欧迪芬性感蕾丝文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/962641.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2011/02/10/Pic962641_1800_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥429</del>￥150</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1133113.html" title="" target="_blank">欧迪芬春夏蕾丝文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1133113.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2011/04/29/Pic1133113_1418_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥239</del>￥120</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/148239.html" title="" target="_blank">古今浅色蕾丝文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/148239.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2010/05/07/Pic148239_23746_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥135</del>￥67</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/184649.html" title="" target="_blank">MAND.YAMAN白色款蕾丝文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/184649.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2010/04/26/Pic184649_28927_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥398</del>￥128</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/280660.html" title="" target="_blank">博尼蕾丝款文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/280660.html" title="" target="_blank"><img src="http://images.shopin.net/images/63/2011/04/02/Pic280660_37251_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥580</del>￥150</div>
      </li>
	</ul>
    <div class="hd"><a class="fr" href="http://www.shopin.net/channel-handbags.html">更多&gt;&gt;</a><img src="http://images.shopin.net/images/ad/funvjie/ps.jpg" width="52" height="19" alt="配饰" /></div>
	<ul class="enlarge_list_view clear">
      <li>
        <h3><a href="http://www.shopin.net/product/1607770.html" title="" target="_blank">LAFITE 驼鸟纹单肩包</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1607770.html" title="" target="_blank"><img src="http://images.shopin.net/images/66/2012/02/08/Pic1607770_18470_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥739</del>￥295</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/917739.html" title="" target="_blank">F8派 鳄鱼纹休闲包</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/917739.html" title="" target="_blank"><img src="http://images.shopin.net/images/60/2010/12/21/Pic917739_19687_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥438</del>￥219</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1469491.html" title="" target="_blank">PUCCA 米色印花休闲包</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1469491.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2011/10/18/Pic1469491_48841_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥319</del>￥135</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1246166.html" title="" target="_blank">金利来 几何纹手提单肩包</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1246166.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2011/07/28/Pic1246166_18608_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥936</del>￥622</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/753451.html" title="" target="_blank">SUSINO 100%桑蚕丝印花丝巾</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/753451.html" title="" target="_blank"><img src="http://images.shopin.net/images/63/2011/09/05/Pic753451_83138_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥119</del>￥50</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/637683.html" title="" target="_blank">T.S.K 金银丝长款丝巾</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/637683.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2010/08/25/Pic637683_72711_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥299</del>￥142</div>
      </li>
	</ul>
  </div>
</div>
</body>
</html>