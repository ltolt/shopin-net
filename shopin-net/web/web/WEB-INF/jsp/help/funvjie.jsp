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
            <li><a href="http://www.shopin.net/help/index.html" target="_blank"><img src="http://images.shopin.net/images/ad/funvjie/pic6.jpg" alt="" /></a></li>
        </ul>
      </div>
    </div>
    
    <a class="fr" href="http://topic.55bbs.com/topic/222.html" target="_blank"><img src="http://images.shopin.net/images/ad/funvjie/subad.jpg" width="332" height="269" alt="精彩3月 精明女人" /></a>
  </div>
  <img id="m1" src="http://images.shopin.net/images/ad/funvjie/title2_1.jpg" width="950" height="36" />
  <img src="http://images.shopin.net/images/ad/funvjie/pic3_1.jpg" width="950" height="249" border="0" usemap="#Map3" />
  <map name="Map3" id="Map3">
    <area shape="rect" coords="11,10,235,236" href="http://www.shopin.net/promotion/4152.html" target="_blank" />
    <area shape="rect" coords="245,10,469,236" href="http://www.shopin.net/promotion/4391.html " target="_blank" />
    <area shape="rect" coords="479,10,704,236" href="http://www.shopin.net/promotion/4351.html" target="_blank" />
    <area shape="rect" coords="714,10,937,236" href="http://www.shopin.net/promotion/4454.html" target="_blank" />
  </map>
  <img src="http://images.shopin.net/images/ad/funvjie/pic4_1.jpg" width="950" height="260" border="0" usemap="#Map" align="top" />
  <map name="Map" id="Map">
    <area shape="rect" coords="11,12,235,238" href="http://www.shopin.net/promotion/4456.html" target="_blank" />
    <area shape="rect" coords="246,12,470,238" href="http://www.shopin.net/promotion/4200.html" target="_blank" />
    <area shape="rect" coords="480,12,705,238" href="http://www.shopin.net/promotion/4455.html" target="_blank" />
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
    Date startDate1 = sdf.parse("2012-03-03 08:00:00");
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
	Date endDate2 = sdf.parse("2012-03-03 08:00:00");
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
        <h3><a href="http://www.shopin.net/product/555532.html" title="" target="_blank">秋水伊人单排扣收腰小外套</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/555532.html" title="" target="_blank"><img src="http://images.shopin.net/images/68/2012/03/01/Pic555532_1308_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥566</del>￥147</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1579263.html" title="" target="_blank">百家好军装风双排扣小外套</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1579263.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2011/12/29/Pic1579263_51117_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥698</del>￥349</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1583879.html" title="" target="_blank">JIMANNO黑色修身小西服</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1583879.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2011/12/28/Pic1583879_82019_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥2699</del>￥550</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1084146.html" title="" target="_blank">LILY双排扣白色风衣</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1084146.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2011/03/23/Pic1084146_92826_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥699</del>￥175</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1643738.html" title="" target="_blank">dribs&drabs蓝色渐变风衣</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1643738.html" title="" target="_blank"><img src="http://images.shopin.net/images/68/2012/02/20/Pic1643738_164453_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥489</del>￥244</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1675334.html" title="" target="_blank">HOPE SHOW双排扣收腰风衣</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1675334.html" title="" target="_blank"><img src="http://images.shopin.net/images/60/2012/03/04/Pic1675334_3351_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥749</del>￥374</div>
      </li>
	</ul>
    <div class="hd"><a class="fr" href="http://www.shopin.net/lady/list--1258--------.html">更多&gt;&gt;</a><img src="http://images.shopin.net/images/ad/funvjie/qz.jpg" width="52" height="19" alt="裙子" /></div>
	<ul class="enlarge_list_view clear">
      <li>
        <h3><a href="http://www.shopin.net/product/1363904.html" title="" target="_blank">秋水伊人碎花连衣裙</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1363904.html" title="" target="_blank"><img src="http://images.shopin.net/images/60/2012/02/28/Pic1363904_1382_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥676</del>￥202</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1347310.html" title="" target="_blank">BEISSY腰带装饰半袖连衣裙</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1347310.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2011/08/18/Pic1347310_134271_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥599</del>￥180</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1373784.html" title="" target="_blank">JIMANNO碎花背心连衣裙</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1373784.html" title="" target="_blank"><img src="http://images.shopin.net/images/60/2011/08/31/Pic1373784_136330_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥2699</del>￥249</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1672704.html" title="" target="_blank">纳纹橘色小荷叶图案连衣裙</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1672704.html" title="" target="_blank"><img src="http://images.shopin.net/images/68/2012/03/02/Pic1672704_7192_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥446</del>￥156</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1345523.html" title="" target="_blank">伟伦波西米亚风长裙</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1345523.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2011/08/08/Pic1345523_52324_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥758</del>￥265</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1664752.html" title="" target="_blank">JUST MODE蕾丝连衣裙</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1664752.html" title="" target="_blank"><img src="http://images.shopin.net/images/60/2012/03/04/Pic1664752_166405_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥619</del>￥185</div>
      </li>
	</ul>
    <div class="hd"><a class="fr" href="http://www.shopin.net/shoes/list--1469--------.html">更多&gt;&gt;</a><img src="http://images.shopin.net/images/ad/funvjie/dx.jpg" width="52" height="19" alt="单鞋" /></div>
	<ul class="enlarge_list_view clear">
      <li>
        <h3><a href="http://www.shopin.net/product/1238286.html" title="" target="_blank">Aee 小羊皮豹纹高跟鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1238286.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2011/06/10/Pic1238286_13165_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥828</del>￥299</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1237133.html" title="" target="_blank">芭迪 日式蝴蝶结 OL款高跟鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1237133.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2011/06/02/Pic1237133_14511_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥669</del>￥246</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1629620.html" title="" target="_blank">捷希 铆钉装饰高跟鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1629620.html" title="" target="_blank"><img src="http://images.shopin.net/images/60/2012/02/14/Pic1629620_163270_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥1098</del>￥328</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1601856.html" title="" target="_blank">图卡 玫瑰花纹饰坡跟鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1601856.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2012/01/16/Pic1601856_161684_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥2080</del>￥598</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1649516.html" title="" target="_blank">Canlive 牛仔布拼色鱼嘴鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1649516.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2012/02/28/Pic1649516_105274_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥658</del>￥289</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1175596.html" title="" target="_blank">暇步士 甜美风休闲鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1175596.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2011/05/04/Pic1175596_112063_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥698</del>￥399</div>
      </li>
	</ul>
    <div class="hd"><a class="fr" href="http://www.shopin.net/shoes/list--1467--------.html">更多&gt;&gt;</a><img src="http://images.shopin.net/images/ad/funvjie/lx.jpg" width="52" height="19" alt="凉鞋" /></div>
	<ul class="enlarge_list_view clear">
      <li>
        <h3><a href="http://www.shopin.net/product/1220424.html" title="" target="_blank">MISS SIXTY 精致亮片高跟鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1220424.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2012/02/07/Pic1220424_123905_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥1390</del>￥380</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/358578.html" title="" target="_blank">GALADAY 小羊皮舒适平底凉鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/358578.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2011/04/11/Pic358578_105873_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥598</del>￥258</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1106911.html" title="" target="_blank">捷希 镜面牛皮交叉绑带凉鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1106911.html" title="" target="_blank"><img src="http://images.shopin.net/images/60/2011/04/20/Pic1106911_95885_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥928</del>￥298</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1652184.html" title="" target="_blank">Aee 绚彩布面鱼嘴鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1652184.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2012/02/22/Pic1652184_12840_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥768</del>￥230</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1275276.html" title="" target="_blank">BSILLY 罗马风绑带凉鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1275276.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2012/03/03/Pic1275276_14173_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥799</del>￥268</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1630555.html" title="" target="_blank">哈森 甜美风装饰花鱼嘴鞋</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1630555.html" title="" target="_blank"><img src="http://images.shopin.net/images/60/2012/02/27/Pic1630555_166381_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥768</del>￥299</div>
      </li>
	</ul>
    <div class="hd"><a class="fr" href="http://www.shopin.net/underwear/list--1081--------.html">更多&gt;&gt;</a><img src="http://images.shopin.net/images/ad/funvjie/ny.jpg" width="52" height="19" alt="内衣" /></div>
	<ul class="enlarge_list_view clear">
      <li>
        <h3><a href="http://www.shopin.net/product/808338.html" title="" target="_blank">古今春季新品文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/808338.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2011/03/28/Pic808338_7855_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥235</del>￥81</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1518623.html" title="" target="_blank">MAKE BODY性感妩媚聚拢文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1518623.html" title="" target="_blank"><img src="http://images.shopin.net/images/66/2011/11/14/Pic1518623_136260_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥1680</del>￥168</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1525668.html" title="" target="_blank">MAKE BODY性感调整型文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1525668.html" title="" target="_blank"><img src="http://images.shopin.net/images/66/2012/01/18/Pic1525668_136257_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥1180</del>￥138</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/184339.html" title="" target="_blank">MAND.YAMAN无痕文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/184339.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2010/11/04/Pic184339_28931_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥389</del>￥46</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/162558.html" title="" target="_blank">Rubii薄款文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/162558.html" title="" target="_blank"><img src="http://images.shopin.net/images/63/2012/02/01/Pic162558_61363_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥219</del>￥30</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/805504.html" title="" target="_blank">古今性感蕾丝文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/805504.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2010/10/25/Pic805504_7811_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥185</del>￥92</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/14353.html" title="" target="_blank">古今春季花色文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/14353.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2011/08/12/Pic14353_6480_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥220</del>￥77</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/17291.html" title="" target="_blank">ELLE纯棉文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/17291.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2010/03/19/Pic17291_10372_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥228</del>￥50</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/184718.html" title="" target="_blank">MAND.YAMAN深V聚拢文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/184718.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2010/11/04/Pic184718_28932_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥398</del>￥46</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/148239.html" title="" target="_blank">古今深V聚拢文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/148239.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2010/05/07/Pic148239_23746_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥135</del>￥67</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/160057.html" title="" target="_blank">欧迪芬纯色聚拢文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/160057.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2010/05/07/Pic160057_1452_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥279</del>￥80</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/808341.html" title="" target="_blank">古今蕾丝文胸</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/808341.html" title="" target="_blank"><img src="http://images.shopin.net/images/60/2010/11/05/Pic808341_6682_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥230</del>￥77</div>
      </li>
	</ul>
    <div class="hd"><a class="fr" href="http://www.shopin.net/channel-handbags.html">更多&gt;&gt;</a><img src="http://images.shopin.net/images/ad/funvjie/ps.jpg" width="52" height="19" alt="配饰" /></div>
	<ul class="enlarge_list_view clear">
      <li>
        <h3><a href="http://www.shopin.net/product/1498985.html" title="" target="_blank">PUCCA 驼鸟纹拼色复古包</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1498985.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2011/10/28/Pic1498985_33224_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥329</del>￥224</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1546996.html" title="" target="_blank">艾狄米娜 焦糖色简约包包</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1546996.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2011/12/15/Pic1546996_113157_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥1056</del>￥400</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1645952.html" title="" target="_blank">GALADAY 玫瑰花型链条包</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1645952.html" title="" target="_blank"><img src="http://images.shopin.net/images/68/2012/02/20/Pic1645952_105261_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥998</del>￥499</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1573593.html" title="" target="_blank">Kstyle 甜美清新风水桶包</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1573593.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2011/12/21/Pic1573593_18274_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥658</del>￥329</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/1029945.html" title="" target="_blank">暴龙 水钻装饰太阳镜</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/1029945.html" title="" target="_blank"><img src="http://images.shopin.net/images/58/2011/05/30/Pic1029945_20364_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥976</del>￥464</div>
      </li>
      <li>
        <h3><a href="http://www.shopin.net/product/318706.html" title="" target="_blank">黑田 100%桑蚕丝柔美印花丝巾</a></h3>
        <div class="photo"><a href="http://www.shopin.net/product/318706.html" title="" target="_blank"><img src="http://images.shopin.net/images/61/2010/06/04/Pic318706_55852_0_1.jpg" alt="" title="" /></a></div>
        <div class="price"><del>￥220</del>￥79</div>
      </li>
	</ul>
  </div>
</div>
</body>
</html>