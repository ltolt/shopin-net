<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>上品折扣网 - 会员专区 3折封顶超值体验 每周60款明星单品</title>
<style>
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
.zc{zoom:1}
#page{ position:static}
/*product list*/
.prolist { overflow:hidden; zoom:1; *margin-bottom:10px;}
.prolist ul { margin:5px 0 0 -26px; zoom:1;}
.prolist li { float:left; _display:inline; width:132px; margin:0 0 10px 30px; text-align:center; position:relative}
.prolist li a:hover ,.prolist li a:hover h3{ color:#f60}
.prolist li img { width:130px; height:130px; border:1px solid #e2e2e2}
.prolist li h3 { height:20px; overflow:hidden; line-height:20px; font-weight:normal; color:#333}
.prolist li del { color:#676767}
.prolist li em { margin-left:10px; font-size:14px; font-weight:bold; color:#fc3400}
.prolist .starprice { line-height:20px; text-align:center; overflow:hidden; font-weight:bold; color:#f15930;}
.prolist .save { width:110px; height:20px; margin:3px auto 0; text-align:center; font-weight:bold; background:#f25930; color:#fff601}
/*piclist*/
.piclist li { float:left; _display:inline}
.vipsale li { width:310px; margin-left:6px}
.moresale li { width:235px; margin:5px 2px 0 0}
.ongoing-sale-hd { height:23px; text-align:right; padding-right:10px; background:url(http://images.shopin.net/images/ad/huiyuan1/t3.png)}
.ongoing-sale-hd a { color:#d11d0e}
</style>
</head>

<body>
	<img src="http://images.shopin.net/images/ad/huiyuan1/top-ad3.jpg" usemap="#Map" class="mt" align="top">
  <map name="Map">
    <area shape="rect" coords="671,16,936,51" href="http://e.weibo.com/shopinnet" target="_blank">
</map>
  <a href="http://www.shopin.net/goRegister.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/top-ad4.jpg" align="top"></a>
  <a href="http://www.shopin.net/goRegister.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/t1.png" align="top"></a>
  <div class="prolist">
    <ul>
<li><a href="http://www.shopin.net/product/946624.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/01/05/Pic946624_3557_0_1.jpg" /><h3>HOPE SHOW英伦格纹风毛呢大衣</h3></a><del>￥1379</del><em>￥152</em></li>
<li><a href="http://www.shopin.net/product/2071351.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/16/Pic2071351_161789_0_1.jpg" /><h3>WAYONLY时尚连帽长款棉服</h3></a><del>￥1399</del><em>￥114</em></li>
<li><a href="http://www.shopin.net/product/store/1571339.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/17/Pic1571339_123103_0_1.jpg" /><h3>huayin甜美糖果色短款羽绒</h3></a><del>￥1080</del><em>￥227</em></li>
<li><a href="http://www.shopin.net/product/2062259.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic2062259_177915_0_1.jpg" /><h3>RBCA时尚肩部蕾丝花饰羊毛外套</h3></a><del>￥998</del><em>￥199</em></li>
<li><a href="http://www.shopin.net/product/1492090.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/12/28/Pic1492090_48661_0_1.jpg" /><h3>veilond长款高领镂空花毛衫</h3></a><del>￥718</del><em>￥179</em></li>
<li><a href="http://www.shopin.net/product/1929228.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/06/30/Pic1929228_153396_0_1.jpg" /><h3>温娜尔100%兔毛连帽马甲</h3></a><del>￥960</del><em>￥288</em></li>
<li><a href="http://www.shopin.net/product/1744054.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/04/11/Pic1744054_11123_0_1.jpg" /><h3>红蜻蜓高筒靴子</h3></a><del>￥979</del><em>￥259</em></li>
<li><a href="http://www.shopin.net/product/1461070.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/10/09/Pic1461070_11123_0_1.jpg" /><h3>红蜻蜓头层牛皮靴子</h3></a><del>￥859</del><em>￥199</em></li>
<li><a href="http://www.shopin.net/product/887739.html" target="_blank"><img src="http://images.shopin.net/images/61/2010/12/10/Pic887739_9747_0_1.jpg" /><h3>卡曼尼牛绒靴子</h3></a><del>￥690</del><em>￥145</em></li>
<li><a href="http://www.shopin.net/product/887783.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/10/13/Pic887783_9747_0_1.jpg" /><h3>卡曼尼羊皮靴子</h3></a><del>￥890</del><em>￥187</em></li>
<li><a href="http://www.shopin.net/product/1511198.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/12/22/Pic1511198_153724_0_1.jpg" /><h3>Minicactus雪地靴</h3></a><del>￥798</del><em>￥199</em></li>
<li><a href="http://www.shopin.net/product/2049632.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/09/27/Pic2049632_202023_0_1.jpg" /><h3>COZY STEPS雪地靴</h3></a><del>￥2280</del><em>￥479</em></li>
<li><a href="http://www.shopin.net/product/2060531.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/31/Pic2060531_201164_0_1.jpg" /><h3>洋宾燕时尚羊绒衫</h3></a><del>￥1280</del><em>￥199</em></li>
<li><a href="http://www.shopin.net/product/2076837.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/12/Pic2076837_205425_0_1.jpg" /><h3>依彩绒男款100%羊毛衫</h3></a><del>￥796</del><em>￥44</em></li>
<li><a href="http://www.shopin.net/product/2036628.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/17/Pic2036628_77531_0_1.jpg" /><h3>KELIYA混绒长裤</h3></a><del>￥598</del><em>￥66</em></li>
<li><a href="http://www.shopin.net/product/2058805.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/09/27/Pic2058805_147529_0_1.jpg" /><h3>CARRUN长款羊绒衫</h3></a><del>￥3280</del><em>￥898</em></li>
<li><a href="http://www.shopin.net/product/2042356.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/24/Pic2042356_75787_0_1.jpg" /><h3>雪莲（毛纺）短款羊绒衫</h3></a><del>￥1908</del><em>￥591</em></li>
<li><a href="http://www.shopin.net/product/2098112.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/29/Pic2098112_208130_0_1.jpg" /><h3>帕罗豹纹羊绒衫</h3></a><del>￥2090</del><em>￥500</em></li>
<li><a href="http://www.shopin.net/product/1910060.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/07/16/Pic1910060_187287_0_1.jpg" /><h3>奥羽尚长款纯色白鸭绒羽绒服</h3></a><del>￥788</del><em>￥399</em></li>
<li><a href="http://www.shopin.net/product/2092677.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/07/Pic2092677_132536_0_1.jpg" /><h3>Kazelaze獭兔毛领双排扣羽绒服</h3></a><del>￥2880</del><em>￥299</em></li>
<li><a href="http://www.shopin.net/product/1555932.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic1555932_157399_0_1.jpg" /><h3>聊黛部儿短款亮面鸭绒羽绒服</h3></a><del>￥698</del><em>￥189</em></li>
<li><a href="http://www.shopin.net/product/873178.html" target="_blank"><img src="http://images.shopin.net/images/58/2010/12/03/Pic873178_95050_0_1.jpg" /><h3>MODO GAGA长款收腰进口獭兔毛领羽绒服</h3></a><del>￥1298</del><em>￥249</em></li>
<li><a href="http://www.shopin.net/product/1934354.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/07/03/Pic1934354_189445_0_1.jpg" /><h3>飘莱时尚收腰连帽长款羽绒</h3></a><del>￥666</del><em>￥199</em></li>
<li><a href="http://www.shopin.net/product/1928420.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/29/Pic1928420_23381_0_1.jpg" /><h3>VOCA泡泡领收腰鸭绒羽绒服</h3></a><del>￥2885</del><em>￥576</em></li>
<li><a href="http://www.shopin.net/product/2046029.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/09/28/Pic2046029_158077_0_1.jpg" /><h3>马里萨短款羊皮皮衣</h3></a><del>￥10800</del><em>￥1090</em></li>
<li><a href="http://www.shopin.net/product/917833.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/01/10/Pic917833_77335_0_1.jpg" /><h3>费尔法特男款羊毛衫</h3></a><del>￥1380</del><em>￥246</em></li>
<li><a href="http://www.shopin.net/product/1973459.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/08/30/Pic1973459_60392_0_1.jpg" /><h3>雅戈尔87%连帽羽绒服</h3></a><del>￥2580</del><em>￥774</em></li>
<li><a href="http://www.shopin.net/product/1630431.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/02/15/Pic1630431_18398_0_1.jpg" /><h3>奥古利奥100%纯棉衬衫</h3></a><del>￥980</del><em>￥99</em></li>
<li><a href="http://www.shopin.net/product/2026574.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/25/Pic2026574_134903_0_1.jpg" /><h3>帕古茨秋冬款茄克</h3></a><del>￥1980</del><em>￥298</em></li>
<li><a href="http://www.shopin.net/product/1566851.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/12/15/Pic1566851_60393_0_1.jpg" /><h3>雅戈尔61%羊毛衫</h3></a><del>￥1280</del><em>￥380</em></li>
<li><a href="http://www.shopin.net/product/2025326.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/13/Pic2025326_180707_0_1.jpg" /><h3>Telent男式三合一冲锋衣</h3></a><del>￥898</del><em>￥448</em></li>
<li><a href="http://www.shopin.net/product/2044069.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/21/Pic2044069_180710_0_1.jpg" /><h3>Telent女式三合一冲锋衣</h3></a><del>￥1598</del><em>￥495</em></li>
<li><a href="http://www.shopin.net/product/1528416.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/12/27/Pic1528416_24988_0_1.jpg" /><h3>SCALER男式超轻羽绒服</h3></a><del>￥798</del><em>￥399</em></li>
<li><a href="http://www.shopin.net/product/1528422.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/12/27/Pic1528422_25565_0_1.jpg" /><h3>SCALER女式超轻羽绒服</h3></a><del>￥758</del><em>￥399</em></li>
<li><a href="http://www.shopin.net/product/1544325.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/12/27/Pic1544325_23041_0_1.jpg" /><h3>KAILAS男式户外徒步鞋</h3></a><del>￥998</del><em>￥309</em></li>
<li><a href="http://www.shopin.net/product/968291.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/01/21/Pic968291_23223_0_1.jpg" /><h3>KAILAS女式户外徒步鞋</h3></a><del>￥768</del><em>￥238</em></li>
<li><a href="http://www.shopin.net/product/1640785.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/02/25/Pic1640785_16542_0_1.jpg" /><h3>空中天使圆领彩格针织衫</h3></a><del>￥229</del><em>￥79</em></li>
<li><a href="http://www.shopin.net/product/1942302.html" target="_blank"><img src="http://images.shopin.net/images//60/2012/07/12//Pic1942302_114037_0_1.jpg" /><h3>水孩儿纯色卡通帽衫</h3></a><del>￥199</del><em>￥79</em></li>
<li><a href="http://www.shopin.net/product/2116835.html" target="_blank"><img src="http://images.shopin.net/images//60/2012/11/06//Pic2116835_112544_0_1.jpg" /><h3>菲格咪妮女童条纹暗格保暖大衣</h3></a><del>￥798</del><em>￥398</em></li>
<li><a href="http://www.shopin.net/product/1435100.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/08/27//Pic1435100_197072_0_1.jpg" /><h3>韦氏长款纯色羽绒服</h3></a><del>￥486</del><em>￥198</em></li>
<li><a href="http://www.shopin.net/product/2112478.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/11/02//Pic2112478_2813_0_1.jpg" /><h3>史努比卡通休闲棉鞋</h3></a><del>￥148</del><em>￥74</em></li>
<li><a href="http://www.shopin.net/product/647608.html" target="_blank"><img src="http://images.shopin.net/images//58/2010/12/06//Pic647608_2318_0_1.jpg" /><h3>DorDor House女童牛皮面翻毛靴</h3></a><del>￥368</del><em>￥114</em></li>
<li><a href="http://www.shopin.net/product/2075209.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/24/Pic2075209_194275_0_1.jpg" /><h3>富安娜纯棉四件套</h3></a><del>￥1680</del><em>￥399</em></li>
<li><a href="http://www.shopin.net/product/2089389.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/23/Pic2089389_200215_0_1.jpg" /><h3>笛舒雅磨毛钻石绒四件套</h3></a><del>￥699</del><em>￥99</em></li>
<li><a href="http://www.shopin.net/product/2107973.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/29/Pic2107973_207650_0_1.jpg" /><h3>LIFE HOME加厚冬被</h3></a><del>￥359</del><em>￥99</em></li>
<li><a href="http://www.shopin.net/product/2098021.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/07/Pic2098021_208077_0_1.jpg" /><h3>本色人家荞麦颈舒枕</h3></a><del>￥168</del><em>￥92</em></li>
<li><a href="http://www.shopin.net/product/1992805.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/08/24/Pic1992805_187557_0_1.jpg" /><h3>LIFE HOME珊瑚绒毯</h3></a><del>￥368</del><em>￥69</em></li>
<li><a href="http://www.shopin.net/product/53759.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/09/06/Pic53759_194252_0_1.jpg" /><h3>SINOMAX美梦舒柔枕</h3></a><del>￥653</del><em>￥327</em></li>
    </ul>
</div>
  <a href="http://www.shopin.net/goRegister.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/t2.png" align="top"></a>
  <ul class="piclist vipsale mt clear">
    <li><a href="http://www.shopin.net/help/xinpinpai.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan2/img01.jpg"></a></li>
    <li><a href="http://www.shopin.net/promotions.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan2/img02.jpg"></a></li>
    <li><a href="http://www.shopin.net/index.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan2/img03.jpg"></a></li>
  </ul>
  <h3 class="ongoing-sale-hd mt"><a href="http://www.shopin.net/promotions.html" target="_blank">更多&gt;&gt;</a></h3>
  <ul class="piclist moresale clear">
  	<li><a href="http://www.shopin.net/promotion/3770.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/img-1112-01.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/6329.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/img-1112-02.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/6015.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/img-1112-03.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/6323.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/img-1112-04.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/6344.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/img-1112-05.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/5270.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/img-1112-06.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/6179.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/img-1112-07.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/6194.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/img-1112-08.jpg"></a></li>
  </ul>
<!--右下角广告-->
<div id="ad" style="position:absolute;right:0;top:100px;width:300px;height:200px;"><a href="http://www.egou.com/club/qiandao/qiandao.htm?id=1420" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/eject-ad-1112.jpg" width="300" height="200"></a>
</div>
<script language="javascript" type="text/javascript">
function rightBottomAd(){
var abc = document.getElementById("ad");
abc.style.top = document.documentElement.scrollTop+document.documentElement.clientHeight-200+"px";
setTimeout(function(){rightBottomAd();},50);
}
rightBottomAd();
rightBottomAd();function close_rbad(){
document.getElementById("ad").style.display="none";
}
</script>
<!--右下角广告-->
</body>
</html>