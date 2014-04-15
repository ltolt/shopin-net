<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>百变夏装全面上新,夏日扮靓特别价格计划N-N折,圣三利,木真了,LINNIE.Z,米莲诺,天美意,森达,GOLF,欧迪芬,ADIDAS,Nike,骆驼,,女装,女鞋,内衣,箱包,运动,户外,2-6折,活动时间,4月22日-5月6日</title>
<style>
img{ vertical-align:top}
.mt { margin-top:10px}
.mt30 { margin-top:30px}
.box { overflow:hidden; background:url(http://images.shopin.net/images/ad/2013xiazhuangsx/bg.png) repeat-y}
.title { padding-top:17px; border-bottom:1px solid #299383}
.title h2 { width:250px; height:40px; padding:0 25px; margin:0 auto; overflow:hidden; text-align:center; font:600 26px/40px 'microsoft yahei'; background:url(http://images.shopin.net/images/ad/2013xiazhuangsx/title.png); color:#fff;}

/*product list*/
.prolist { overflow:hidden; zoom:1; background:#fff}
.prolist ul { margin-bottom:20px}
.prolist li { float:left; _display:inline; width:182px; margin:10px 0 0 7px; text-align:center; position:relative}
.prolist li a:hover ,.prolist li a:hover h3{ color:#f60}
.prolist li img { width:180px; height:180px; border:1px solid #e2e2e2}
.prolist li h3 { height:20px; overflow:hidden; line-height:20px; font-weight:normal; color:#333}
.prolist li del { color:#676767}
.prolist li em { margin-left:10px; font-size:14px; font-weight:bold; color:#fc3400}
.prolist .starprice { line-height:20px; text-align:center; overflow:hidden; font-weight:bold; color:#f15930;}
.prolist .save { width:110px; height:20px; margin:3px auto 0; text-align:center; font-weight:bold; background:#f25930; color:#fff601}
.prolist .cornermark { position:absolute; right:5px; top:75px; width:54px; height:54px; line-height:70px; overflow:hidden; font-weight:600; color:#f6ff00; background:url(http://images.shopin.net/images/ad/dianqing1210/cornermark.png)}
.proarea { padding:0 2px}
.proarea ul { overflow:hidden; *zoom:1; background:#eff1e8}
.proarea li { float:left; width:229px; margin-left:6px; _display:inline}
/* focus */
.atlist { width:950px; overflow:hidden; position:relative;}
.atlist ul li { float:left; width:950px; overflow:hidden;}
.atlist ul li div { float:left; width:463px; height:145px; margin:0 0 8px 8px; _display:inline; background:#fff}
.atlist .atlistTitle { height:20px; float:left; position:relative; left:50%; top:459px;}
.atlist .btn { position:relative; height:20px; left:-50%}
.atlist .btn span { float:left; width:94px; height:20px; margin-right:5px; text-align:center; cursor:pointer; background:url(http://images.shopin.net/images/ad/2013xiazhuangsx/tabnum.gif) repeat-x; font:normal 12px/20px 'microsoft yahei'; color:#fff}
.atlist .btn span.on  { background:url(http://images.shopin.net/images/ad/2013xiazhuangsx/tabnum.gif) 0 -20px repeat-x;}
#focus { height:479px;}
#focus ul { height:451px; position:absolute}
#focus ul li { height:451px;}

</style>
<script type="text/javascript" src="http://images.shopin.net/js/jquery/jquery132min.js"></script>
<script type="text/javascript">
$(function() {
	var sWidth = $("#focus").width();
	var len = $("#focus ul li").length;
	var index = 0;
	var picTimer;
	
	$("#focus .btn span").mouseenter(function() {
		index = $("#focus .btn span").index(this);
		showPics(index);
	}).eq(0).trigger("mouseenter");
	
	$("#focus ul").css("width",sWidth * (len + 1));
	
		$("#focus ul li div").hover(function() {
			$(this).siblings().css("opacity",0.7);
		},function() {
			$("#focus ul li div").css("opacity",1);
		});
	
	$("#focus").hover(function() {
		clearInterval(picTimer);
	},function() {
		picTimer = setInterval(function() {
			if(index == len) {
				showFirPic();
				index = 0;
			} else {
				showPics(index);
			}
			index++;
		},5000);
	}).trigger("mouseleave");
	
	function showPics(index) {
		var nowLeft = -index*sWidth;
		$("#focus ul").stop(true,false).animate({"left":nowLeft},500);
		$("#focus .btn span").removeClass("on").eq(index).addClass("on");
	}
	
	function showFirPic() {
		$("#focus ul").append($("#focus ul li:first").clone());
		var nowLeft = -len*sWidth;
		$("#focus ul").stop(true,false).animate({"left":nowLeft},500,function() {
			$("#focus ul").css("left","0");
			$("#focus ul li:last").remove();
		}); 
		$("#focus .btn span").removeClass("on").eq(0).addClass("on");
	}
});

</script>
</head>

<body>
	<img class="mt" src="http://images.shopin.net/images/ad/2013xiazhuangsx/top1.jpg"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/top2.jpg"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/top3.jpg" border="0" usemap="#Map">
	<map name="Map">
			<area shape="rect" coords="50,145,152,174" href="#a">
			<area shape="rect" coords="193,145,311,174" href="#b">
			<area shape="rect" coords="350,145,457,174" href="#c">
			<area shape="rect" coords="486,145,597,174" href="#d">
			<area shape="rect" coords="632,145,744,174" href="#e">
			<area shape="rect" coords="777,145,902,174" href="#f">
	</map>
  <div class="box">
		<div id="a" class="title"><h2>大牌乐淘惠</h2></div>
		<div id="focus" class="atlist">
			<ul>
				<li>
					<div><a href="http://www.shopin.net/promotion/6721.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/a01.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/5873.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/a02.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/4571.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/a03.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/5604.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/a04.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/6833.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/a05.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/6827.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/a06.jpg"></a></div>
				</li>
				<li>
					<div><a href="http://www.shopin.net/promotion/5204.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/b01.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/5845.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/b02.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/5762.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/b03.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/7105.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/b04.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/6246.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/b05.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/5318.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/b06.jpg"></a></div>
				</li>
				<li>
					<div><a href="http://www.shopin.net/promotion/5644.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/c01.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/6857.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/c02.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/5211.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/c03.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/6396.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/c04.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/7004.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/c05.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/6339.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/c06.jpg"></a></div>
				</li>
			</ul>
			<div class="atlistTitle"><div class="btn"><span>女装/女鞋</span><span>男装/男鞋</span><span>内衣/儿童</span></div></div>
		</div>
		<div id="b" class="title"><h2>母亲节礼品精选</h2></div>
		<div class="prolist">
			<ul>
<li><a href="http://www.shopin.net/product/2250353.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/22/Pic2250353_77343_0.resize_to.180x180.jpg" /><h3>木真了100%桑蚕丝刺绣中式旗袍</h3></a><del>￥1700</del><em>￥480</em></li>
<li><a href="http://www.shopin.net/product/2053943.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/02/27/Pic2053943_202887_0.jpg" /><h3>nazely芥末黄无袖镶钻衬衫</h3></a><del>￥1600</del><em>￥336</em></li>
<li><a href="http://www.shopin.net/product/2235761.html" target="_blank"><img src="http://images.shopin.net/images/61/2013/03/22/Pic2235761_13295_0.jpg" /><h3>TATA时尚柳钉蝴蝶花饰凉鞋</h3></a><del>￥769</del><em>￥299</em></li>
<li><a href="http://www.shopin.net/product/1828323.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/07/03/Pic1828323_12733_0.jpg" /><h3>千百度时尚复古罗马凉鞋</h3></a><del>￥779</del><em>￥199</em></li>
<li><a href="http://www.shopin.net/product/2195777.html" target="_blank"><img src="http://images.shopin.net/images/60/2013/02/20/Pic2195777_18470_0.jpg" /><h3>LAFITE时尚菱格手提包</h3></a><del>￥969</del><em>￥290</em></li>
<li><a href="http://www.shopin.net/product/1834431.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/06/13/Pic1834431_184132_0.jpg" /><h3>MeierMei经典气质波点无袖连衣裙</h3></a><del>￥1765</del><em>￥498</em></li>
<li><a href="http://www.shopin.net/product/2110414.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/10/29/Pic2110414_162680_0.resize_to.180x180.jpg" /><h3>LINNIE.Z优雅荷叶边短裙</h3></a><del>￥990</del><em>￥198</em></li>
<li><a href="http://www.shopin.net/product/2253606.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/03/26/Pic2253606_11013_0.resize_to.180x180.jpg" /><h3>古莎西舒适平底凉鞋</h3></a><del>￥598</del><em>￥89</em></li>
<li><a href="http://www.shopin.net/product/1117641.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/04/29/Pic1117641_84372_0.jpg" /><h3>柔可佳100%纯棉舒适套装</h3></a><del>￥358</del><em>￥148</em></li>
<li><a href="http://www.shopin.net/product/2240894.html" target="_blank"><img src="http://images.shopin.net/images/66/2013/03/27/Pic2240894_20364_0.jpg" /><h3>暴龙名品潮流遮阳墨镜</h3></a><del>￥1196</del><em>￥568</em></li>
			</ul>
		</div>
		<div class="proarea">
			<img id="c" src="http://images.shopin.net/images/ad/2013xiazhuangsx/img1.jpg" border="0" usemap="#Map2" class="mt30">
			<map name="Map2">
					<area shape="rect" coords="370,26,523,622" href="http://www.shopin.net/product/2243178.html" target="_blank">
					<area shape="rect" coords="72,200,297,384" href="http://www.shopin.net/product/532774.html" target="_blank">
					<area shape="rect" coords="602,406,824,606" href="http://www.shopin.net/product/2252429.html" target="_blank">
					<area shape="rect" coords="614,236,827,389" href="http://www.shopin.net/product/1836096.html" target="_blank">
					<area shape="rect" coords="72,440,291,591" href="http://www.shopin.net/product/1917865.html" target="_blank">
					<area shape="rect" coords="532,29,746,169" href="http://www.shopin.net/product/1800933.html" target="_blank">
					<area shape="rect" coords="98,49,156,76" href="http://www.shopin.net/list-50-1046-0.2-0.5----0-1-.html" target="_blank">
					<area shape="rect" coords="167,49,244,78" href="http://www.shopin.net/lady/brand/list-59-1046-------1.html" target="_blank">
					<area shape="rect" coords="102,79,146,103" href="http://www.shopin.net/lady/brand/list-1000-1046-------1.html" target="_blank">
					<area shape="rect" coords="163,80,231,109" href="http://www.shopin.net/list-2135-1467------0-1-.html" target="_blank">
					<area shape="rect" coords="103,108,155,128" href="http://www.shopin.net/shoes/brand/list-247-1467-------1-.html" target="_blank">
					<area shape="rect" coords="158,114,247,135" href="http://www.shopin.net/list-257-1467------0-1-.html" target="_blank">
					<area shape="rect" coords="99,136,173,159" href="http://www.shopin.net/list-717-1112------0--.html" target="_blank">
					<area shape="rect" coords="180,136,246,161" href="http://www.shopin.net/list-472-1069------0-1-.html" target="_blank">
			</map>
			<ul>
					<li><a href="http://www.shopin.net/promotion/7108.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/t01.jpg"></a></li>
				<li><a href="http://www.shopin.net/promotion/7107.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/t02.jpg"></a></li>
				<li><a href="http://www.shopin.net/promotion/7090.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/t03.jpg"></a></li>
				<li><a href="http://www.shopin.net/promotion/6820.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/t04.jpg"></a></li>
	</ul>
			<img src="http://images.shopin.net/images/ad/2013xiazhuangsx/ft.png">
			<img id="d" src="http://images.shopin.net/images/ad/2013xiazhuangsx/img2.jpg" border="0" usemap="#Map3" class="mt30">
			<map name="Map3">
					<area shape="rect" coords="346,20,558,615" href="http://www.shopin.net/product/1746438.html" target="_blank">
					<area shape="rect" coords="35,184,220,394" href="http://www.shopin.net/product/542728.html" target="_blank">
					<area shape="rect" coords="51,413,244,602" href="http://www.shopin.net/product/1843822.html" target="_blank">
					<area shape="rect" coords="577,25,754,195" href="http://www.shopin.net/product/1906578.html" target="_blank">
					<area shape="rect" coords="584,388,780,614" href="http://www.shopin.net/product/1576904.html" target="_blank">
					<area shape="rect" coords="719,197,882,335" href="http://www.shopin.net/product/3582.html" target="_blank">
					<area shape="rect" coords="101,49,166,78" href="http://www.shopin.net/lady/brand/list-52-1046-------1.html" target="_blank">
					<area shape="rect" coords="173,53,248,79" href="http://www.shopin.net/lady/brand/list-1671-1046-0.2-0.4-----1.html" target="_blank">
					<area shape="rect" coords="102,82,168,106" href="http://www.shopin.net/lady/brand/list-2218-1046-------1.html" target="_blank">
					<area shape="rect" coords="101,144,156,163" href="http://www.shopin.net/list-969-1467------0-1-.html" target="_blank">
					<area shape="rect" coords="166,141,244,163" href="http://www.shopin.net/list-886-1467------0-1-.html" target="_blank">
					<area shape="rect" coords="168,113,239,139" href="http://www.shopin.net/list-364-1379------0-1-.html" target="_blank">
					<area shape="rect" coords="173,82,233,111" href="http://www.shopin.net/underwear/brand/list-831-1068-------1.html" target="_blank">
					<area shape="rect" coords="101,109,164,135" href="http://www.shopin.net/list-192-1103------0-1-.html" target="_blank">
			</map>
			<ul>
				<li><a href="http://www.shopin.net/promotion/7103.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/g01.jpg"></a></li>
				<li><a href="http://www.shopin.net/promotion/7032.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/g02.jpg"></a></li>
				<li><a href="http://www.shopin.net/promotion/6783.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/g03.jpg"></a></li>
				<li><a href="http://www.shopin.net/promotion/5110.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/g04.jpg"></a></li>
	</ul>
			<img src="http://images.shopin.net/images/ad/2013xiazhuangsx/ft.png">
			<img src="http://images.shopin.net/images/ad/2013xiazhuangsx/img3.jpg" border="0" usemap="#eMap" class="mt30" id="e">
			<map name="eMap">
					<area shape="rect" coords="274,24,471,253" href="http://www.shopin.net/product/1141614.html" target="_blank">
					<area shape="rect" coords="655,26,800,245" href="http://www.shopin.net/product/2119810.html" target="_blank">
					<area shape="rect" coords="15,228,273,415" href="http://www.shopin.net/product/1810421.html" target="_blank">
					<area shape="rect" coords="401,292,647,435" href="http://www.shopin.net/product/2162051.html" target="_blank">
					<area shape="rect" coords="652,378,785,549" href="http://www.shopin.net/product/1336450.html" target="_blank">
					<area shape="rect" coords="111,424,290,595" href="http://www.shopin.net/product/1129695.html" target="_blank">

					<area shape="rect" coords="97,41,157,77" href="http://www.shopin.net/list-1577-1047-0.05-0.3----0-1-.html" target="_blank">
					<area shape="rect" coords="101,115,179,134" href="http://www.shopin.net/man/brands/329.html" target="_blank">
					<area shape="rect" coords="179,42,235,73" href="http://www.shopin.net/man/brands/412.html" target="_blank">
					<area shape="rect" coords="185,112,238,139" href="http://www.shopin.net/shoes/brand/list-122-1382.html" target="_blank">
					<area shape="rect" coords="101,136,151,166" href="http://www.shopin.net/shoes/brand/list-293-1382-0.05-0.5-----1.html" target="_blank">
					<area shape="rect" coords="172,140,230,170" href="http://www.shopin.net/shoes/brand/list-771-1067-0.05-0.5-----1.html" target="_blank">
					<area shape="rect" coords="176,79,246,106" href="http://www.shopin.net/list-851-1752------0-1-.html" target="_blank">
					<area shape="rect" coords="96,82,161,107" href="http://www.shopin.net/list-2151-1752------0-1-.html" target="_blank">
			</map>
			<ul>
				<li><a href="http://www.shopin.net/list--1150-0.05-0.3----0--.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/y01.jpg"></a></li>
				<li><a href="http://www.shopin.net/list--1058-0.05-0.4-80-999--0-1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/y02.jpg"></a></li>
				<li><a href="http://www.shopin.net/promotion/7047.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/y03.jpg"></a></li>
				<li><a href="http://www.shopin.net/list--1781---1-199--0--.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/y04.jpg"></a></li>
	</ul>
			<img src="http://images.shopin.net/images/ad/2013xiazhuangsx/ft.png">
		</div>
		<div id="f" class="title"><h2>五一出游乐享惠</h2></div>
    <div class="atlist">
			<ul>
				<li>
					<div><a href="http://www.shopin.net/promotion/6728.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/h01.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/6636.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/h02.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/6570.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/h03.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/6675.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/h04.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/6537.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/h05.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/5702.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/h06.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/5871.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/h07.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/5562.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/h08.jpg"></a></div>
				</li>
			</ul>
		</div>
		
		<div class="title"><h2>出游装备大抢</h2></div>
    <div class="atlist">
			<ul>
				<li>
					<div><a href="http://www.shopin.net/promotion/7060.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/q01.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/6633.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/q02.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/6976.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/q03.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/6759.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/q04.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/6683.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/q05.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/6682.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/q06.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/4157.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/q07.jpg"></a></div>
					<div><a href="http://www.shopin.net/promotion/2674.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013xiazhuangsx/q08.jpg"></a></div>
				</li>
			</ul>
		</div>
  </div>
</body>
</html>
