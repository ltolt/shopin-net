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
	<img src="http://images.shopin.net/images/ad/huiyuan1/top-ad-weibo.jpg" usemap="#Map" class="mt" align="top">
  <map name="Map">
    <area shape="rect" coords="671,16,936,51" href="http://e.weibo.com/shopinnet" target="_blank">
</map>
  <a href="http://www.shopin.net/goRegister.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/top-ad1.jpg" align="top"><img src="http://images.shopin.net/images/ad/huiyuan1/top-ad2.jpg" align="top"></a>
  <a href="http://www.shopin.net/goRegister.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/t1.png" align="top"></a>
  <div class="prolist">
    <ul>
<li><a href="http://www.shopin.net/product/1532047.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic1532047_151252_0_1.jpg" /><h3>Kazelaze骆子毛领白鸭绒收腰羽绒服</h3></a><del>￥2480</del><em>￥388</em></li>
<li><a href="http://www.shopin.net/product/2028622.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic2028622_161814_0_1.jpg" /><h3>WAYONLY甜美糖果色连帽棉服</h3></a><del>￥1098</del><em>￥98</em></li>
<li><a href="http://www.shopin.net/product/1434822.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/08/15/Pic1434822_3548_0_1.jpg" /><h3>HOPE SHOW英伦风格纹双排扣羊毛大衣</h3></a><del>￥879</del><em>￥131</em></li>
<li><a href="http://www.shopin.net/product/2122920.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/15/Pic2122920_177920_0_1.jpg" /><h3>RBCA可拆卸毛领蝴蝶结装饰毛呢大衣</h3></a><del>￥1398</del><em>￥158</em></li>
<li><a href="http://www.shopin.net/product/1914629.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/06/21/Pic1914629_187837_0_1.jpg" /><h3>B.SIQI狐狸毛领90%含绒量长款羽绒</h3></a><del>￥3290</del><em>￥590</em></li>
<li><a href="http://www.shopin.net/product/1548946.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/12/29/Pic1548946_123148_0_1.jpg" /><h3>huayin面包领收腰长款羽绒服</h3></a><del>￥1880</del><em>￥262</em></li>
<li><a href="http://www.shopin.net/product/2126503.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/11/23//Pic2126503_182218_0_1.jpg" /><h3>Josiny时尚牛皮长靴</h3></a><del>￥739</del><em>￥369</em></li>
<li><a href="http://www.shopin.net/product/1951880.html" target="_blank"><img src="http://images.shopin.net/images//68/2012/11/23//Pic1951880_11116_0_1.jpg" /><h3>红蜻蜓灰色羊皮长靴</h3></a><del>￥1799</del><em>￥378</em></li>
<li><a href="http://www.shopin.net/product/2039149.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/09/21/Pic2039149_15375_0_1.jpg" /><h3>莱尔斯丹女款真皮短靴</h3></a><del>￥1598</del><em>￥599</em></li>
<li><a href="http://www.shopin.net/product/1413548.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/10/22/Pic1413548_95874_0_1.jpg" /><h3>捷希时尚真皮女靴</h3></a><del>￥1798</del><em>￥598</em></li>
<li><a href="http://www.shopin.net/product/2136453.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/11/23/Pic2136453_171532_0_1.jpg" /><h3>TATA坡跟豹纹单鞋</h3></a><del>￥899</del><em>￥439</em></li>
<li><a href="http://www.shopin.net/product/1799403.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/08/30/Pic1799403_197050_0_1.jpg" /><h3>BELLE牛皮粗跟单鞋</h3></a><del>￥838</del><em>￥439</em></li>
<li><a href="http://www.shopin.net/product/2076837.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/12/Pic2076837_205425_0_1.jpg" /><h3>依彩绒男款羊毛衫</h3></a><del>￥796</del><em>￥44</em></li>
<li><a href="http://www.shopin.net/product/2032548.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/09/14/Pic2032548_77543_0_1.jpg" /><h3>KELIYA时尚羊绒衫</h3></a><del>￥1980</del><em>￥199</em></li>
<li><a href="http://www.shopin.net/product/2066864.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/10/10/Pic2066864_75596_0_1.jpg" /><h3>雪莲（毛纺）提花女连衣裙</h3></a><del>￥2398</del><em>￥815</em></li>
<li><a href="http://www.shopin.net/product/704909.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/01/12/Pic704909_101222_0_1.jpg" /><h3>鹿王纯正羊绒衫</h3></a><del>￥1530</del><em>￥530</em></li>
<li><a href="http://www.shopin.net/product/1523690.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/01/11/Pic1523690_85010_0_1.jpg" /><h3>蒙丹米尔绞花羊绒衫</h3></a><del>￥1780</del><em>￥199</em></li>
<li><a href="http://www.shopin.net/product/2119657.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/09/Pic2119657_201174_0_1.jpg" /><h3>洋宾燕精品羊毛衫</h3></a><del>￥769</del><em>￥55</em></li>
<li><a href="http://www.shopin.net/product/1910356.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/27/Pic1910356_187271_0_1.jpg" /><h3>奥羽尚时尚短款白鸭绒羽绒服</h3></a><del>￥678</del><em>￥258</em></li>
<li><a href="http://www.shopin.net/product/2094709.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/11/12/Pic2094709_161408_0_1.jpg" /><h3>金羽杰无帽翻领收腰羽绒服</h3></a><del>￥1187</del><em>￥481</em></li>
<li><a href="http://www.shopin.net/product/1547208.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic1547208_157405_0_1.jpg" /><h3>聊黛部儿獭兔毛领鸭绒羽绒服</h3></a><del>￥1246</del><em>￥299</em></li>
<li><a href="http://www.shopin.net/product/1533774.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/12/07/Pic1533774_151212_0_1.jpg" /><h3>咔姿莱时尚长款白鸭绒羽绒服</h3></a><del>￥1880</del><em>￥399</em></li>
<li><a href="http://www.shopin.net/product/1521146.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/12/13/Pic1521146_154662_0_1.jpg" /><h3>皮尔卡丹成熟男款鸭绒羽绒服</h3></a><del>￥1560</del><em>￥489</em></li>
<li><a href="http://www.shopin.net/product/1532375.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/12/08/Pic1532375_85494_0_1.jpg" /><h3>杰奥男士长款鸭绒羽绒服</h3></a><del>￥1818</del><em>￥799</em></li>
<li><a href="http://www.shopin.net/product/1487054.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/11/09/Pic1487054_18405_0_1.jpg" /><h3>罗蒙中长款羊绒大衣</h3></a><del>￥2180</del><em>￥545</em></li>
<li><a href="http://www.shopin.net/product/1695852.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/17/Pic1695852_170058_0_1.jpg" /><h3>帕古茨绵羊皮外套</h3></a><del>￥16800</del><em>￥2380</em></li>
<li><a href="http://www.shopin.net/product/2035949.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/11/09/Pic2035949_15561_0_1.jpg" /><h3>洛萨里奥真皮外套</h3></a><del>￥7990</del><em>￥1980</em></li>
<li><a href="http://www.shopin.net/product/1575199.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/12/22/Pic1575199_16388_0_1.jpg" /><h3>尼诺里拉羊毛外套</h3></a><del>￥4990</del><em>￥990</em></li>
<li><a href="http://www.shopin.net/product/1511360.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/11/10/Pic1511360_18398_0_1.jpg" /><h3>奥古利奥毛领羽绒服</h3></a><del>￥2380</del><em>￥836</em></li>
<li><a href="http://www.shopin.net/product/1645146.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/02/20/Pic1645146_88683_0_1.jpg" /><h3>沙驰经典条纹衬衣</h3></a><del>￥1380</del><em>￥414</em></li>
<li><a href="http://www.shopin.net/product/1556845.html" target="_blank"><img src="http://images.shopin.net/images//61/2011/12/08//Pic1556845_21658_0_1.jpg" /><h3>李宁运动生活系列波点羽绒</h3></a><del>￥749</del><em>￥374</em></li>
<li><a href="http://www.shopin.net/product/1789571.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/08/09/Pic1789571_48029_0_1.jpg" /><h3>耐克男子炫丽拼色篮球鞋</h3></a><del>￥849</del><em>￥424</em></li>
<li><a href="http://www.shopin.net/product/1436123.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/10/14/Pic1436123_27629_0_1.jpg" /><h3>探路者男士套绒冲锋衣</h3></a><del>￥1199</del><em>￥539</em></li>
<li><a href="http://www.shopin.net/product/2078173.html" target="_blank"><img src="http://images.shopin.net/images//63/2012/10/18//Pic2078173_26705_0_1.jpg" /><h3>KingCamp男士简约连帽羽绒服</h3></a><del>￥1159</del><em>￥599</em></li>
<li><a href="http://www.shopin.net/product/1443804.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/10/24/Pic1443804_174494_0_1.jpg" /><h3>THE NORTH FACE女士拉链抓绒衣</h3></a><del>￥398</del><em>￥238</em></li>
<li><a href="http://www.shopin.net/product/1177851.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/04/21/Pic1177851_23222_0_1.jpg" /><h3>凯乐石经典户外登山鞋</h3></a><del>￥899</del><em>￥288</em></li>
<li><a href="http://www.shopin.net/product/1392063.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/09/11/Pic1392063_142229_0_1.jpg" /><h3>昱璐女童双排扣保暖外套</h3></a><del>￥569</del><em>￥49</em></li>
<li><a href="http://www.shopin.net/product/2073631.html" target="_blank"><img src="http://images.shopin.net/images//58/2012/11/10//Pic2073631_251_0_1.jpg" /><h3>小汽车卡通连帽棉外套</h3></a><del>￥339</del><em>￥165</em></li>
<li><a href="http://www.shopin.net/product/1631066.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/09/10/Pic1631066_186160_0_1.jpg" /><h3>大力水手圆领彩条羊毛衫</h3></a><del>￥289</del><em>￥60</em></li>
<li><a href="http://www.shopin.net/product/975383.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/08/27/Pic975383_78345_0_1.jpg" /><h3>韦氏男童长款鸭绒羽绒服</h3></a><del>￥489</del><em>￥150</em></li>
<li><a href="http://www.shopin.net/product/2083953.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/01/Pic2083953_204922_0_1.jpg" /><h3>麻希玛柔泡泡领长款棉服</h3></a><del>￥269</del><em>￥81</em></li>
<li><a href="http://www.shopin.net/product/1484354.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/10/25/Pic1484354_28662_0_1.jpg" /><h3>ABCKIDS男童牛皮粘扣棉鞋</h3></a><del>￥386</del><em>￥119</em></li>
<li><a href="http://www.shopin.net/product/1966384.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/08/23/Pic1966384_187557_0_1.jpg" /><h3>LIFE HOME高密纯棉四件套</h3></a><del>￥998</del><em>￥199</em></li>
<li><a href="http://www.shopin.net/product/2053020.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/25/Pic2053020_200215_0_1.jpg" /><h3>笛舒雅钻石绒四件套</h3></a><del>￥699</del><em>￥99</em></li>
<li><a href="http://www.shopin.net/product/1996338.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/09/03/Pic1996338_186972_0_1.jpg" /><h3>Erepo甜美四件套</h3></a><del>￥698</del><em>￥198</em></li>
<li><a href="http://www.shopin.net/product/2129019.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/16/Pic2129019_211857_0_1.jpg" /><h3>金喜雀桃皮绒羽丝被</h3></a><del>￥1299</del><em>￥199</em></li>
<li><a href="http://www.shopin.net/product/2089320.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/29/Pic2089320_194275_0_1.jpg" /><h3>富安娜云梦冬厚被</h3></a><del>￥768</del><em>￥229</em></li>
<li><a href="http://www.shopin.net/product/2098021.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/07/Pic2098021_208077_0_1.jpg" /><h3>本色人家荞麦颈舒枕</h3></a><del>￥168</del><em>￥92</em></li>
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
  	<li><a href="http://www.shopin.net/promotion/5965.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/img-1127-01.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/6329.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/img-1127-02.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/6435.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/img-1127-03.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/6425.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/img-1127-04.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/5891.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/img-1127-05.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/6451.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/img-1127-06.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/6339.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/img-1127-07.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/5626.html" target="_blank"><img src="http://images.shopin.net/images/ad/huiyuan1/img-1127-08.jpg"></a></li>
  </ul>
</body>
</html>