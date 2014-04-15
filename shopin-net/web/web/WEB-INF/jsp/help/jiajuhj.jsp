<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>阳光三月,床品换季来袭,会员专享,3.22-3.31,笛舒雅,金喜雀,LIFE HOME,纯棉四件套￥99起，春夏新款薄被￥99，绒毯￥49起</title>
<style>
body {
	margin: 0;
	padding: 0;
	color: #000000;
	font-size: 12px;
	font-family: arial, 宋体;
}
h1, h2, h3, h4, ul, ol, li, p {
	margin: 0;
	padding: 0;
	list-style: none;
}
img {
	border: 0;
	vertical-align:top
}
a:link, a:visited {
	color: #000;
	text-decoration: none;
}
a:hover, a:active {
	color: #ff0000;
	text-decoration: underline;
	text-shadow: 0 0 1px #757575;
}
.clear:after { height:0; clear:both; content:"."; visibility:hidden; display:block}
.zc { zoom:1}
.new-img-h2 {
	height:79px;
}
.new-img-h2 img {
	float:left;
	margin:0 0 0 230px;
}
.m38body {
	width:950px;
	margin:0 auto;
	overflow:hidden;
}
.jiaju-ls {
	background:url(http://images.shopin.net/images/ad/jiajuhj/img-bg.jpg) no-repeat 0 0;
	height:549px;
}
.jiaju-ls ul {
	float:left;
	width:950px;
	margin-top:70px
	}
.jiaju-ls li{
	float:left;
	width:220px;
	height:220px;
	margin:0 0 10px 14px;
	_display:inline;
}
.jiaju-ls li.jiaju-ls-big {
	width:450px;
	height:450px;
	margin-bottom:0;
	}




.m38network, .m38newshow {
	display:inline-block;
	width:950px;
	padding:10px
}
.m38network-mr {
	width:950px;
	display:inline-block;
}
.m38network-div {
	float:left;
	margin:0 9px 0 0;
	text-align: center;
	line-height:24px;
	width:222px;
	overflow:hidden
}
.m38network-div a {
	display:inline-block
}
.m38network-div img {
	border:1px solid #E0E0E0
}
.jiaju-ad {
	background:#E4EEA9;
	padding-top:20px;
	padding-bottom:20px;
}
.jiaju-ad li {
	display:inline-block;
	margin:0 0 10px 0;
}
.m38newshow-top {
	background:COLOR="#0986C0";
	margin:4px;
	width:950px;
	overflow:hidden;
	display:inline-block;
	padding:10px 0
}
.m38newshow-top-l {
	width:374px;
	float:left;
	margin:0px 17px 0px 11px;
	height:255px;
	display:inline
}
.m38newshow-top-l-img {
	width:374px;
	height:255px
}
.m38newshow-top-r {
	width:514px;
	float:left;
	display:inline;
}
.m38newshow-top-r-t {
	display:inline-block;
	width: 514px;
	margin:0 0 20px 0
}
.m38newshow-top-r-mr {
	width:128px;
	float:left;
	text-align:center;
	margin:0 60px 0 0
}
.m38newshow-top-r-mr p {
	line-height: 24px;
	color:#FFFFFF
}
.m38newshow-top-r-mr strong {
	color:#FCFF00;
	margin:0 5px
}
.m38newshow-down {
	width:950px;
	overflow:hidden;
	display:inline-block;
	background-color:#E5EFAA;
}
.m38newshow-list {
	display:block;
	padding-bottom:18px
}
.m38newshow-list li {
	float:left;
	_display:inline;
	_zom:1;
	width:316px;
	height:355px;
	margin:20px 0 5px 0px;
	margin-left:0;
	overflow:hidden;
	text-align:center;
	border:0;
	color:#000;
}
.m38newshow-list li img {
	margin-bottom:12px;
}
.m38newshow-list em {
	text-decoration: line-through;
	font-style: normal
}

.m38newshow-down1 {
	width:950px;
	overflow:hidden;
	display:inline-block;
	background-color:#E5EFAA;
}
.m38newshow-list1 {
	display:block;
	padding-bottom:18px
}
.m38newshow-list1 li {
	float:left;
	_display:inline;
	_zom:1;
	width:237px;
	height:275px;
	margin:20px 0 5px 0px;
	margin-left:0;
	overflow:hidden;
	text-align:center;
	border:0;
	color:#000;
}
.m38newshow-list1 li img {
	margin-bottom:12px;
}
.m38newshow-list1 em {
	text-decoration: line-through;
	font-style: normal;
}


.m38newshow-list li .pngicon {
	position:absolute;
	background: url(http://images.shopin.net/images/ad/2013taqing/miaosha.png);
	width:103px;
	height:101px;
	display:inline-block
}
.divp {
	display:inline-block;
	text-align:left;
	width:210px;
	line-height:28px;
	font-size:12px;
	padding-left:20px;
}
.m38newshow-lis-r {
	float:right;
	height:32px;
	color:red;
	font-size:20px;
	line-height:28px;
	text-align:right;
	font-weight:bold;
}
.m38newshow-list .mr-r-0 {
	margin-right:0
}
.product-list-ad {
	margin:10px 0;
}
.product-list {
	padding:0 8px 20px;
	text-align:center;
	margin-left:-2px;
}
.dress1 {
	float:left;
	width:458px;
	padding-bottom:8px;
	margin-left:6px;
	text-align:center;
	line-height:20px;
	color:#FFF;
	font-family:"微软雅黑";
	font-size:14px;
	border:0;
	background-color:#3E9396;
}
.dress2 {
	float:left;
	width:458px;
	padding-bottom:8px;
	margin-left:12px;
	text-align:center;
	line-height:20px;
	color:#FFF;
	font-family:"微软雅黑";
	font-size:14px;
	border:0;
	background-color:#4F6F7E;
}
.dress-w, .dress-m {
	width:50%;
	text-align:center;
	float:left;
}
.dress-w li, .dress-m li {
	margin-bottom:8px;
}
.dress-w em, .dress-m em {
	text-decoration: line-through;
	font-style: normal;
}
.button-share {
	width:55px;
	height:17px;
	margin-right:4px;
}
.button-buy {
	width:55px;
	height:17px;
}
.m38network-h2 {
	background:url(http://images.shopin.net/images/ad/sanl/h31.jpg) no-repeat;
	width:927px;
	height:36px;
	margin:0 0 10px 0;
	text-align:right;
	line-height:36px;
}
.m38network-h2 a {
	color:#000
}
.workh22 {
	background-position: 0 -36px
}
.workh23 {
	background-position: 0 -72px
}
.workh24 {
	background-position: 0 -108px
}
.workh25 {
	background-position: 0 -144px
}
.workh26 {
	background-position: 0 -180px
}
.workh27 {
	background-position: 0 -216px
}
.workh28 {
	background-position: 0 -252px
}
/*countdown*/
.stime {
	float:left;
	height:26px;
	padding:26px 0 20px 20px;
	font:bold 22px/26px 'microsoft yahei', Tahoma, arial;
	color:#fff
}
.stime span {
	width:26px;
	height:26px;
	margin:0 5px;
	display:inline-block;
	overflow:hidden/9;
	_display:inline;
	_zoom:1;
	text-align:center;
	vertical-align:middle;
	font-size:18px;
	border-left:1px solid #547f3a;
	border-right:1px solid #547f3a;
	border-bottom:1px solid #3e6525;
	color:#087816;
	background:#fff
}
.mr-r-0 {
	margin-right:0
}
.mr-b-0 {
	margin-bottom:0
}
</style>
<!--[if lte IE 6]>
<script type="text/javascript" src="http://images.shopin.net/images/ad/summer1/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript"> 
DD_belatedPNG.fix('.png');
</script> 
<![endif]-->
</head>

<body>
<div class="m38body">
		<div class="topimg"> <img src="http://images.shopin.net/images/ad/jiajuhj/top01.jpg" border="0" usemap="#Map" />
          <map name="Map">
            <area shape="poly" coords="695,211" href="#map1">
            <area shape="circle" coords="793,232,102" href="#map1">
          </map>
  <img src="http://images.shopin.net/images/ad/jiajuhj/top02.jpg" border="0" usemap="#Map2" />
  <map name="Map2">
    <area shape="circle" coords="572,116,57" href="#map02">
    <area shape="circle" coords="699,114,70" href="#map3">
    <area shape="circle" coords="800,0,85" href="#map1">
  </map>
  </div>
		<!--topimg-->

<div class="jiaju-ls" id="map1">
    <ul>
        <li class="jiaju-ls-big"><a href="http://www.shopin.net/product/2147233.html" target="_blank"><img src="http://images.shopin.net/images/ad/jiajuhj/bg-new01.jpg"></a></li>
        <li><a href="http://www.shopin.net/product/2147234.html" target="_blank"><img src="http://images.shopin.net/images/ad/jiajuhj/bg_1.jpg"></a></li>
        <li><a href="http://www.shopin.net/product/2247492.html" target="_blank"><img src="http://images.shopin.net/images/ad/jiajuhj/bg-new02.jpg"></a></li>
        <li><a href="http://www.shopin.net/product/2036764.html" target="_blank"><img src="http://images.shopin.net/images/ad/jiajuhj/bg_3.jpg"></a></li>
        <li><a href="http://www.shopin.net/product/2147230.html" target="_blank"><img src="http://images.shopin.net/images/ad/jiajuhj/bg_4.jpg"></a></li>
    </ul>
</div>

		<div class="m38network-mr"><img src="http://images.shopin.net/images/ad/jiajuhj/banner01.jpg" /></div>
		<!--m38network-mr-->

				<div class="m38newshow-down">
						<ul class="m38newshow-list clear zc">
								<li><a href="http://www.shopin.net/product/2247480.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/19/Pic2247480_200215_0.resize_to.300x300.jpg"></a>
										<p>笛舒雅100%棉四件套 一见倾心</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥159</span>原价:<em>￥1099 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2247485.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/19/Pic2247485_200215_0.resize_to.300x300.jpg"></a>
										<p>笛舒雅100%棉四件套 暗香紫</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥159</span>原价:<em>￥1099 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2247488.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/19/Pic2247488_200215_0.resize_to.300x300.jpg"></a>
										<p>笛舒雅100%棉四件套 静香阁</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥159</span>原价:<em>￥1099 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2246737.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/19/Pic2246737_200215_0.resize_to.300x300.jpg"></a>
										<p>笛舒雅100%棉四件套 暗香粉</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥199</span>原价:<em>￥1099 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2247478.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/19/Pic2247478_200215_0.resize_to.300x300.jpg"></a>
										<p>笛舒雅100%棉四件套 香飘万里</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥199</span>原价:<em>￥1099 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2247481.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/19/Pic2247481_200215_0.resize_to.300x300.jpg"></a>
										<p>笛舒雅100%棉四件套 田园梦</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥199</span>原价:<em>￥1099 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2247482.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/19/Pic2247482_200215_0.resize_to.300x300.jpg"></a>
										<p>笛舒雅100%棉四件套 花香飘舞</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥199</span>原价:<em>￥1099 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2247484.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/19/Pic2247484_200215_0.resize_to.300x300.jpg"></a>
										<p>笛舒雅100%棉四件套 美丽日记</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥199</span>原价:<em>￥1099 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2247490.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/19/Pic2247490_200215_0.resize_to.300x300.jpg"></a>
										<p>笛舒雅100%棉四件套 怡人香</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥199</span>原价:<em>￥1099 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2106111.html" target="_blank"><img src="http://images.shopin.net/images/ad/jiajuhj/img-04.jpg"></a>
										<p>LIFEHOME纯棉四件套 粉红女郎</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥288</span>原价:<em>￥2180 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2249302.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/20/Pic2249302_187557_0.resize_to.300x300.jpg"></a>
										<p>LIFEHOME纯棉四件套 动感地带</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥288</span>原价:<em>￥1980 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2194421.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/01/28/Pic2194421_187557_0.resize_to.300x300.jpg"></a>
										<p>LIFE HOME全棉斜纹印花四件套</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥258</span>原价:<em>￥1280 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/1967379.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/08/02/Pic1967379_187557_0.resize_to.300x300.jpg"></a>
										<p>LIFE HOME活性贡缎纯棉六件套</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥299</span>原价:<em>￥2580 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/1967384.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/08/23/Pic1967384_187557_0.resize_to.300x300.jpg"></a>
										<p>LIFE HOME纯棉六件套 相伴一生</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥299</span>原价:<em>￥2580 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2132711.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/21/Pic2132711_187557_0.resize_to.300x300.jpg"></a>
										<p>LIFEHOME纯棉四件套 快乐女生</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥258</span>原价:<em>￥1280 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2125854.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/20/Pic2125854_187557_0.resize_to.300x300.jpg"></a>
										<p>LIFEHOME纯棉四件套 流彩飞丝</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥399</span>原价:<em>￥2399 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2181962.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/01/14/Pic2181962_187557_0.resize_to.300x300.jpg"></a>
										<p>LIFEHOME纯棉四件套 绝代佳人</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥399</span>原价:<em>￥2399 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2125855.html" target="_blank"><img src="http://images.shopin.net/images/ad/jiajuhj/img-01.jpg"></a>
										<p>LIFEHOME纯棉四件套 拼色条纹</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥399</span>原价:<em>￥2399 </em></p>
								</li>
						</ul>
				</div>	

		<div class="m38network-mr"><img src="http://images.shopin.net/images/ad/jiajuhj/banner02.jpg" id="map02"/></div><!--m38network-mr-->

				<div class="m38newshow-down">
						<ul class="m38newshow-list clear zc">
								<li><a href="http://www.shopin.net/product/2244289.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/20/Pic2244289_187557_0.resize_to.300x300.jpg"></a>
										<p>LIFE HOME纯棉薄被 粉荷香露</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥99</span>原价:<em>￥549 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2239984.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/19/Pic2239984_211857_0.resize_to.300x300.jpg"></a>
										<p>金喜雀羽丝绒单人空调被</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥99</span>原价:<em>￥429 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2239992.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/19/Pic2239992_211857_0.resize_to.300x300.jpg"></a>
										<p>金喜雀羽丝绒单人空调被</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥99</span>原价:<em>￥429 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2239993.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/19/Pic2239993_211857_0.resize_to.300x300.jpg"></a>
										<p>金喜雀羽丝绒单人空调被</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥99</span>原价:<em>￥429 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2239997.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/19/Pic2239997_211857_0.resize_to.300x300.jpg"></a>
										<p>金喜雀羽丝绒单人空调被</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥99</span>原价:<em>￥429 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2249223.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/20/Pic2249223_211857_0.resize_to.300x300.jpg"></a>
										<p>金喜雀羽丝绒双人空调被</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥109</span>原价:<em>￥429 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2249226.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/20/Pic2249226_211857_0.resize_to.300x300.jpg"></a>
										<p>金喜雀羽丝绒双人空调被</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥109</span>原价:<em>￥429 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2249229.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/20/Pic2249229_211857_0.resize_to.300x300.jpg"></a>
										<p>金喜雀羽丝绒双人空调被</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥109</span>原价:<em>￥429 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2249231.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/20/Pic2249231_211857_0.resize_to.300x300.jpg"></a>
										<p>金喜雀羽丝绒双人空调被</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥109</span>原价:<em>￥429 </em></p>
								</li>
						</ul>
				</div>	

		<div class="m38network-mr"><img src="http://images.shopin.net/images/ad/jiajuhj/banner03.jpg" id="map3"/></div>
		<!--m38network-mr-->

				<div class="m38newshow-down1">
						<ul class="m38newshow-list1 clear zc">
								<li><a href="http://www.shopin.net/product/2148369.html" target="_blank"><img src="http://images.shopin.net/images/ad/jiajuhj/img-2.jpg"></a>
										<p>LIFE HOME珊瑚绒毯 执爱</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥49</span>原价:<em>￥368 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/1952161.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/07/20/Pic1952161_187557_0.resize_to.220x220.jpg"></a>
										<p>LIFE HOME珊瑚绒毯 湖蓝色</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥49</span>原价:<em>￥368 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2081419.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/25/Pic2081419_187557_0.resize_to.220x220.jpg"></a>
										<p>LIFE HOME珊瑚绒毯 卡通</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥49</span>原价:<em>￥368 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2181577.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/01/14/Pic2181577_187557_0.resize_to.220x220.jpg"></a>
										<p>LIFE HOME珊瑚绒毯 花影</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥49</span>原价:<em>￥368 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2021851.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/07/Pic2021851_187557_0.resize_to.220x220.jpg"></a>
										<p>LIFE HOME珊瑚绒毯 粉色</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥49</span>原价:<em>￥368 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2081426.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/25/Pic2081426_187557_0.resize_to.220x220.jpg"></a>
										<p>LIFE HOME珊瑚绒毯 米色</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥49</span>原价:<em>￥368 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2021846.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/13/Pic2021846_187557_0.resize_to.220x220.jpg"></a>
										<p>LIFE HOME珊瑚绒毯 西瓜红</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥49</span>原价:<em>￥368 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2194396.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/01/28/Pic2194396_187557_0.resize_to.220x220.jpg"></a>
										<p>LIFE HOME法兰绒毯 魅影豹圈</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥88</span>原价:<em>￥398 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2154418.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/12/10/Pic2154418_187557_0.resize_to.220x220.jpg"></a>
										<p>LIFE HOME法兰绒毯 咖啡牡丹</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥88</span>原价:<em>￥398 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2154419.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/12/10/Pic2154419_187557_0.resize_to.220x220.jpg"></a>
										<p>LIFE HOME法兰绒多功能毯</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥88</span>原价:<em>￥398 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2156898.html" target="_blank"><img src="http://images.shopin.net/images/ad/jiajuhj/img-03.jpg"></a>
										<p>LIFE HOME法兰绒毯 卡通小熊</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥88</span>原价:<em>￥398 </em></p>
								</li>
								<li><a href="http://www.shopin.net/product/2154413.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/12/10/Pic2154413_187557_0.resize_to.220x220.jpg"></a>
										<p>LIFE HOME法兰绒毯 山茶花</p>
										<p class="divp"><span class="m38newshow-lis-r"> 抢购价:￥88</span>原价:<em>￥398 </em></p>
								</li>
						</ul>
				</div>	

		<div class="m38network-mr"><img src="http://images.shopin.net/images/ad/jiajuhj/banner04.jpg" /></div>
		<!--m38network-mr-->

		<div class="jiaju-ad">
        <ul>
           <li><a href="http://www.shopin.net/promotion/6403.html" target="_blank"><img src="http://images.shopin.net/images/ad/jiajuhj/ad1.jpg" /></a></li>
           <li><a href="http://www.shopin.net/promotion/6497.html" target="_blank"><img src="http://images.shopin.net/images/ad/jiajuhj/ad2.jpg" /></a></li>
           <li><a href="http://www.shopin.net/promotion/6406.html" target="_blank"><img src="http://images.shopin.net/images/ad/jiajuhj/ad3.jpg" /></a></li>
        </ul>
        </div>
		<!--jiaju-ad--> 
		
</div>
<!--m38body-->
</body>
</html>
