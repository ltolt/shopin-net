<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
  	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date today = new Date();
%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>上品折扣网提前开启双11光棍节!万款冬品血拼价疯抢,直降10%!11.5-11.12</title>
<style>
img{ vertical-align:top}
.clear:after { height:0; clear:both; content:"."; visibility:hidden; display:block;}
.zm{zoom:1}
#page{width:100%!important;padding:0!important; position:static}
#header, .backgroundffffff{width:950px;margin:0 auto}
.box{width:950px;margin:10px auto;padding-bottom:4px;overflow:hidden;background:#d1011b}
.saleArea{margin:0 8px 8px;padding-bottom:7px;background:#f0f1e9}
.tlist li{float:left;width:456px;margin:7px 0 0 7px; _display:inline}
.tlist li img{border:1px solid #dfdfdf}
.tcp{text-align:center;margin:2px 0}
/*product list*/
.prolist{display:block;margin:0 8px 8px;padding:10px 6px 6px;background:#f0f1e9}
.prolist li { float:left; _display:inline; width:132px; margin:10px 0 0 19px; text-align:center; position:relative}
.prolist li a:hover ,.prolist li a:hover h3{ color:#f60}
.prolist li img { width:130px; height:130px; border:1px solid #e2e2e2}
.prolist li h3 { height:20px; overflow:hidden; line-height:20px; font-weight:normal; color:#333}
.prolist li del { color:#676767}
.prolist li em { margin-left:10px; font-size:14px; font-weight:bold; text-decoration:line-through; color:#fc3400}
.prolist .starprice { line-height:20px; text-align:center; overflow:hidden; font-weight:bold; color:#f15930;}
.prolist .save { width:110px; height:20px; margin:3px auto 0; text-align:center; font-weight:bold; background:#f25930; color:#fff601}
.prolist .cornermark { position:absolute; right:5px; top:75px; width:54px; height:54px; line-height:70px; overflow:hidden; font-weight:600; color:#f6ff00; background:url(http://images.shopin.net/images/ad/shuang11/cornermark.png)}
/*plus*/
.proArea{float:left;width:452px;height:462px;overflow:;padding:0;margin:0 0 6px 9px;_display:inline;border:1px solid #d1001b}
.proArea .prolist{margin:0;padding:0}
.proArea .prolist li{margin-left:14px}
.proArea .prolist li em {text-decoration:none}
.proArea .hd { position:relative; height:20px; padding-left:25px; margin:2px 5px 0; font:600 14px/20px 'microsoft yahei'; background:#d1011b; color:#fff;}
.proArea .hd em { position:absolute; top:6px; left:8px; width:9px; height:9x; line-height:9px; background:#fff}
/*product list end*/
.saleList{margin:12px 0 0 2px}
.saleList li{float:left;margin-left:4px}
.vitList{margin-left:6px}
.vitList li{float:left;width:472px}
/*loading*/
#loading{position:relative;width:300px;height:50px;top:0px;left:50%;margin:50px 0 50px -150px;text-align:center;padding:7px 0 0 0;font:bold 11px Arial, Helvetica, sans-serif;}

/*alert box*/
#dialog .dialogHd, #dialog .dialogHd h3, #dialog .dialogHd a, #dialog .dialogHd a:hover, #dialog .dialogForm .formBtn{background-image:url(http://images.shopin.net/images/dialog.png);background-repeat:no-repeat}
#dialog{position:fixed; _position:absolute;z-index:99999999!important;width:450px;display:none;border:1px solid #888;background:#fff;}
#dialog .dialogHd{height:30px;overflow:hidden;cursor:move;border-bottom:1px solid #ccc;background-position:0 -60px;background-repeat:repeat-x;}
#dialog .dialogHd h3{line-height:30px;padding-left:40px;background-position:0 0;color:#d64820}
#dialog .dialogHd a{float:right;width:30px;height:30px;line-height:100px;margin-top:-30px;background-position:10px -90px;outline:none}
#dialog .dialogHd a:hover{background-position:-11px -90px}
#dialog .dialogBd{padding:30px 10px;line-height:26px;}
#dialog .dialogForm li{margin-bottom:6px}
#dialog .dialogForm li.dialogHli {margin-top:10px;text-align:center}
#dialog .dialogForm .dialogLabel{width:110px;display:inline-block;*display:inline;*zoom:1;text-align:right;vertical-align:top;color:#666}
#dialog .dialogForm .coll{display:inline-block;*display:inline;*zoom:1;}
#dialog,#dialog *{ text-decoration:none!important}
#dialog .dialogForm .coll .zxm{ text-decoration:underline!important; color:#00f}
#dialog .dialogForm .formText{width:196px;height:14px;margin-right:5px;padding:5px 3px;font-size:14px;border:1px solid #aaa}
#dialog .dialogForm .vcode{width:60px!important;margin-right:5px}
#dialog .dialogForm .formBtn{width:80px;height:30px;line-height:30px;cursor:pointer;font-weight:bold;border:0;color:#d64820;background-position:0 -30px;}
#dialog .dialogForm .tips{height:20px;line-height:16px;color:#f00}
.mask{width:100%;z-index:99!important; position:absolute; top:0; left:0; background:#000; opacity:0.3; filter:alpha(opacity=30);}
/*alert box end*/
</style>
</head>

<body>
<div class="box">
	<img src="http://images.shopin.net/images/ad/shuang11/top-1102-ad1.jpg"><img src="http://images.shopin.net/images/ad/shuang11/top-1102-ad2.jpg"><img src="http://images.shopin.net/images/ad/shuang11/top-1102-ad3.jpg" usemap="#Map">
  <map name="Map">
    <area shape="rect" coords="650,38,927,137" href="http://www.shopin.net/help/zfb1210.html" target="_blank">
    <area shape="rect" coords="365,38,643,136" href="http://www.shopin.net/help/manzeng.html" target="_blank">
  </map>
  <!--img src="http://images.shopin.net/images/ad/shuang11/t1.png"><img src="http://images.shopin.net/images/ad/shuang11/img01.jpg"><a href="http://shopin.tmall.com/view_page-629619952.htm" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/img02.jpg"><img src="http://images.shopin.net/images/ad/shuang11/img03.jpg"></a-->
  <img src="http://images.shopin.net/images/ad/shuang11/t2.png">
  <div class="saleArea clear zm">
  <%
    Date startDate = sdf.parse("2012-11-08 00:00:00");
    Date endDate = sdf.parse("2012-11-10 23:59:59");
	if(startDate.before(today) && today.before(endDate)){
%>
<!--10号大场-->
    <ul class="tlist">
      <li><a href="http://www.shopin.net/promotion/6309.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1110-01.jpg"></a></li>
      <li><a href="http://www.shopin.net/promotion/6310.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1110-02.jpg"></a></li>
      <li><a href="http://www.shopin.net/promotion/6171.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1110-03.jpg"></a></li>
      <li><a href="http://www.shopin.net/promotion/5993.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1110-04.jpg"></a></li>
    </ul>
<!--10号大场-->	
<%}%>
<%
    Date startDate1 = sdf.parse("2012-11-11 00:00:00");
    Date endDate1 = sdf.parse("2012-11-12 23:59:59");
	if(startDate1.before(today) && today.before(endDate1)){
%>
<!--十一号大场-->
    <ul class="tlist">
<li><a href="http://www.shopin.net/promotion/5285.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-01.jpg" alt="Hope Show         "></a></li>
<li><a href="http://www.shopin.net/promotion/5703.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-02.jpg" alt="B.SIQI"></a></li>
<li><a href="http://www.shopin.net/promotion/6271.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-03.jpg" alt="衣香丽影YIXIANGLIYING"></a></li>
<li><a href="http://www.shopin.net/promotion/6105.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-04.jpg" alt="Voca"></a></li>
<li><a href="http://www.shopin.net/promotion/6171.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-05.jpg" alt="T.B2JEANS; T.B2 Trend Lady"></a></li>
<li><a href="http://www.shopin.net/promotion/4406.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-06.jpg" alt="无色无味"></a></li>
<li><a href="http://www.shopin.net/promotion/5626.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-07.jpg" alt="Life Home"></a></li>
<li><a href="http://www.shopin.net/promotion/6129.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-08.jpg" alt="依彩绒"></a></li>
<li><a href="http://www.shopin.net/promotion/6065.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-09.jpg" alt="洋宾燕"></a></li>
<li><a href="http://www.shopin.net/promotion/6132.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-10.jpg" alt="蒙丹米尔"></a></li>
<li><a href="http://www.shopin.net/promotion/6311.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-11.jpg" alt="正亚ZENGYA"></a></li>
<li><a href="http://www.shopin.net/promotion/6266.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-12.jpg" alt="奥羽尚OURSHINE"></a></li>
<li><a href="http://www.shopin.net/promotion/6312.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-13.jpg" alt="聊黛部儿 LIAODAIBUER"></a></li>
<li><a href="http://www.shopin.net/promotion/6313.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-14.jpg" alt="咔姿莱"></a></li>
<li><a href="http://www.shopin.net/promotion/5821.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-15.jpg" alt="帕古茨/PAGUCI"></a></li>
<li><a href="http://www.shopin.net/promotion/5721.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-16.jpg" alt="红蜻蜓（女）      "></a></li>
<li><a href="http://www.shopin.net/promotion/6039.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-17.jpg" alt="Comoni"></a></li>
<li><a href="http://www.shopin.net/promotion/6231.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-18.jpg" alt="kameido  卡美多"></a></li>
<li><a href="http://www.shopin.net/promotion/6169.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-19.jpg" alt="菲尔图   "></a></li>
<li><a href="http://www.shopin.net/promotion/5070.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-20.jpg" alt="桑扶兰"></a></li>
<li><a href="http://www.shopin.net/promotion/6309.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-21.jpg" alt="WAYONLY"></a></li>
<li><a href="http://www.shopin.net/promotion/6310.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-22.jpg" alt="北极绒"></a></li>
<li><a href="http://www.shopin.net/promotion/5992.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-23.jpg" alt="帕兰朵 PLANDOO"></a></li>
<li><a href="http://www.shopin.net/promotion/4457.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-24.jpg" alt="欣姿芳SORELLA/Lofan"></a></li>
<li><a href="http://www.shopin.net/promotion/5993.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1111-25.jpg" alt="俞兆林 YUZHAOLIN"></a></li>
    </ul>
<!--十一号大场-->	
<%}%>

  <img style="position:relative;left:-8px" src="http://images.shopin.net/images/ad/shuang11/t5.jpg">
  <ul class="tlist">
<li><a href="http://www.shopin.net/promotion/6353.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/1-s.jpg" alt="男女款羊绒/羊毛衫"></a></li>
<li><a href="http://www.shopin.net/promotion/6354.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/2-s.jpg" alt="时尚保暖羊绒/羊毛/混绒衫"></a></li>
<li><a href="http://www.shopin.net/promotion/6355.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/3-s.jpg" alt="女款羊绒/羊毛衫"></a></li>
<li><a href="http://www.shopin.net/promotion/6356.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/4-s.jpg" alt="男款羊绒/羊毛衫"></a></li>
<li><a href="http://www.shopin.net/promotion/6357.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/5-s.jpg" alt="男女款羊绒/羊毛衫"></a></li>
<li><a href="http://www.shopin.net/promotion/6358.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/6-s.jpg" alt="男女款羊绒/羊毛衫"></a></li>
<li><a href="http://www.shopin.net/promotion/6359.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/7-s.jpg" alt="男女款羊绒/羊毛衫"></a></li>
<li><a href="http://www.shopin.net/promotion/6360.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/8-s.jpg" alt="男女款羊绒/羊毛衫"></a></li>
<li><a href="http://www.shopin.net/promotion/6349.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/9-s.jpg" alt="男女款羽绒服"></a></li>
<li><a href="http://www.shopin.net/promotion/6351.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/10-s.jpg" alt="时尚羽绒"></a></li>
<li><a href="http://www.shopin.net/promotion/6232.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/11-s.jpg" alt="女士长款、短款羽绒服"></a></li>
<li><a href="http://www.shopin.net/promotion/6348.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/12-s.jpg" alt="雪地靴、棉靴 "></a></li>
<li><a href="http://www.shopin.net/promotion/6118.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/13-s.jpg" alt="男士皮衣、皮草"></a></li>
<li><a href="http://www.shopin.net/promotion/6028.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/14-s.jpg" alt="气质皮衣&皮草 聚惠双11 直降10% 立省千元"></a></li>
<li><a href="http://www.shopin.net/promotion/3973.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/15-s.jpg" alt="名牌保暖 双11专享 直降10% 男女款保暖内衣 ￥45起"></a></li>
<li><a href="http://www.shopin.net/promotion/2015.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/16-s.jpg" alt="男女款保暖内衣"></a></li>
<li><a href="http://www.shopin.net/promotion/6350.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/18-s.jpg" alt="文胸、底裤、保暖内衣"></a></li>
<li><a href="http://www.shopin.net/promotion/6361.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/19-s.jpg" alt="男女款保暖内衣"></a></li>
  </ul>
  <img style="margin-left:-8px;_zoom:1" src="http://images.shopin.net/images/ad/shuang11/t3.png">
  <ul class="prolist clear zm">
<%
    Date startDate2 = sdf.parse("2012-11-08 00:00:00");
    Date endDate2 = sdf.parse("2012-11-09 19:59:59");
	if(startDate2.before(today) && today.before(endDate2)){
%>
<!--页面内容一-->
  <h4 align="center" style="line-height:40px; font-size:16px">9号-12号 每晚 20点-23点开始限量抢！</h4>
<li><a><img src="http://images.shopin.net/images/58/2012/11/07/Pic2120722_31199_0_1.jpg" /><h3>爱霓梦舟单人枕头</h3></a><del>￥80</del><em>￥60</em><span class="cornermark">￥19</span></li>
<li><a><img src="http://images.shopin.net/images/60/2012/10/30/Pic2085900_74894_0_1.jpg" /><h3>Crocs猛犸系列男士休闲鞋</h3></a><del>￥359</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a><img src="http://images.shopin.net/images/60/2012/10/30/Pic2085931_155540_0_1.jpg" /><h3>CROCS粉红色休闲鞋</h3></a><del>￥339</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/08/21/Pic1994248_78972_0_1.jpg" /><h3>KELIYA男士羊毛衫</h3></a><del>￥698</del><em>￥299</em><span class="cornermark">￥71</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/18/Pic2036707_148038_0_1.jpg" /><h3>蒙派男士羊毛衫</h3></a><del>￥896</del><em>￥349</em><span class="cornermark">￥79</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/07/03/Pic1919446_188186_0_1.jpg" /><h3>JIMANNO双排扣羊毛大衣</h3></a><del>￥5899</del><em>￥1000</em><span class="cornermark">￥649</span></li>
<li><a><img src="http://images.shopin.net/images/66/2012/05/30/Pic1836710_94263_0_1.jpg" /><h3>罗弗蒂奇男士夹克</h3></a><del>￥1980</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a><img src="http://images.shopin.net/images/66/2012/10/13/Pic2078622_134903_0_1.jpg" /><h3>帕古茨男士夹克</h3></a><del>￥2480</del><em>￥289</em><span class="cornermark">￥119</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/11/02/Pic2089416_174632_0_1.jpg" /><h3>优歌糖果色短款棉服</h3></a><del>￥756</del><em>￥279</em><span class="cornermark">￥121</span></li>
<li><a><img src="http://images.shopin.net/images/66/2012/10/25/Pic2105848_148164_0_1.jpg" /><h3>plandoo女士保暖套装 </h3></a><del>198</del><em>￥79</em><span class="cornermark">￥28</span></li>
<li><a><img src="http://images.shopin.net/images/61/2011/10/28/Pic922144_139168_0_1.jpg" /><h3>鹿王男士羊绒衫</h3></a><del>￥1680</del><em>￥759</em><span class="cornermark">￥339</span></li>
<li><a><img src="http://images.shopin.net/images/58/2011/12/14/Pic962347_141720_0_1.jpg" /><h3>鹿王女士羊绒衫</h3></a><del>￥1480</del><em>￥499</em><span class="cornermark">￥229</span></li>
<li><a><img src="http://images.shopin.net/images/61/2011/10/27/Pic1494915_48660_0_1.jpg" /><h3>veilond羊毛收腰小外套</h3></a><del>￥918</del><em>￥302</em><span class="cornermark">￥181</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/05/Pic2008375_123118_0_1.jpg" /><h3>huayin单排扣羊毛大衣</h3></a><del>￥1280</del><em>￥398</em><span class="cornermark">￥171</span></li>
<li><a><img src="http://images.shopin.net/images/60/2012/02/09/Pic1376970_1323_0_1.jpg" /><h3>秋水伊人双排扣装饰风衣</h3></a><del>￥716</del><em>￥272</em><span class="cornermark">￥161</span></li>
<li><a><img src="http://images.shopin.net/images/60/2010/12/10/Pic780887_24086_0_1.jpg" /><h3>IVRESSE中长款羊毛大衣</h3></a><del>￥1780</del><em>￥200</em><span class="cornermark">￥161</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/17/Pic2025348_3416_0_1.jpg" /><h3>红袖腰带装饰风衣</h3></a><del>￥799</del><em>￥239</em><span class="cornermark">￥161</span></li>
<li><a><img src="http://images.shopin.net/images/58/2011/11/28/Pic1536407_53557_0_1.jpg" /><h3>圣三利短款羽绒服</h3></a><del>￥3680</del><em>￥600</em><span class="cornermark">￥541</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/05/Pic2018555_77543_0_1.jpg" /><h3>KELIYA男士100%羊毛衫</h3></a><del>￥798</del><em>￥94</em><span class="cornermark">￥71</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/07/15/Pic1944077_77583_0_1.jpg" /><h3>KELIYA女士翻领100%山羊绒羊毛衫</h3></a><del>￥2180</del><em>￥299</em><span class="cornermark">￥240</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/18/Pic2038770_153757_0_1.jpg" /><h3>蒙派男士100%羊毛衫</h3></a><del>￥896</del><em>￥94</em><span class="cornermark">￥71</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/24/Pic2052344_201416_0_1.jpg" /><h3>洋宾燕斑马纹羊毛连衣裙</h3></a><del>￥980</del><em>￥199</em><span class="cornermark">￥141</span></li>
<li><a><img src="http://images.shopin.net/images/68/2011/12/30/Pic1549891_157407_0_1.jpg" /><h3>聊黛部儿时尚彩格纹羽绒服</h3></a><del>￥738</del><em>￥99</em><span class="cornermark">￥91</span></li>
<li><a><img src="http://images.shopin.net/images/60/2012/09/01/Pic1996262_196076_0_1.jpg" /><h3>柯里卡貉子毛领棉服</h3></a><del>￥2190</del><em>￥600</em><span class="cornermark">￥300</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/10/19/Pic2079535_161817_0_1.jpg" /><h3>WAYONLY绚丽毛领连帽棉服</h3></a><del>￥1288</del><em>￥138</em><span class="cornermark">￥114</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/10/08/Pic2071346_161789_0_1.jpg" /><h3>WAYONLY时尚渐变色系扣棉服</h3></a><del>￥1399</del><em>￥139</em><span class="cornermark">￥114</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/10/19/Pic2028622_161814_0_1.jpg" /><h3>WAYONLY连帽修身棉服</h3></a><del>￥1098</del><em>￥136</em><span class="cornermark">￥114</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/21/Pic2037565_200267_0_1.jpg" /><h3>WAYONLY蕾丝网面聚拢文胸</h3></a><del>￥720</del><em>￥78</em><span class="cornermark">￥51</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/15/Pic2037557_200261_0_1.jpg" /><h3>WAYONLY优雅深V聚拢文胸</h3></a><del>￥570</del><em>￥78</em><span class="cornermark">￥51</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/15/Pic2037530_200266_0_1.jpg" /><h3>WAYONLY蕾丝聚拢前扣式文胸</h3></a><del>￥570</del><em>￥78</em><span class="cornermark">￥51</span></li>
<!--页面内容一-->	
<%}%>

<%
    Date startDate3 = sdf.parse("2012-11-09 20:00:00");
    Date endDate3 = sdf.parse("2012-11-09 23:00:00");
	if(startDate3.before(today) && today.before(endDate3)){
%>
<!--页面内容二-->
<li><a href="http://www.shopin.net/product/2120722.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/11/07/Pic2120722_31199_0_1.jpg" /><h3>爱霓梦舟单人枕头</h3></a><del>￥80</del><em>￥60</em><span class="cornermark">￥19</span></li>
<li><a href="http://www.shopin.net/product/2105890.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/30/Pic2085900_74894_0_1.jpg" /><h3>Crocs猛犸系列男士休闲鞋</h3></a><del>￥359</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/2085931.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/30/Pic2085931_155540_0_1.jpg" /><h3>CROCS粉红色休闲鞋</h3></a><del>￥339</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/1994248.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/08/21/Pic1994248_78972_0_1.jpg" /><h3>KELIYA男士羊毛衫</h3></a><del>￥698</del><em>￥299</em><span class="cornermark">￥71</span></li>
<li><a href="http://www.shopin.net/product/2036707.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/18/Pic2036707_148038_0_1.jpg" /><h3>蒙派男士羊毛衫</h3></a><del>￥896</del><em>￥349</em><span class="cornermark">￥79</span></li>
<li><a href="http://www.shopin.net/product/1919446.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/07/03/Pic1919446_188186_0_1.jpg" /><h3>JIMANNO双排扣羊毛大衣</h3></a><del>￥5899</del><em>￥1000</em><span class="cornermark">￥649</span></li>
<li><a href="http://www.shopin.net/product/1836710.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/05/30/Pic1836710_94263_0_1.jpg" /><h3>罗弗蒂奇男士夹克</h3></a><del>￥1980</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/2078622.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/13/Pic2078622_134903_0_1.jpg" /><h3>帕古茨男士夹克</h3></a><del>￥2480</del><em>￥289</em><span class="cornermark">￥119</span></li>
<li><a href="http://www.shopin.net/product/2089416.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/02/Pic2089416_174632_0_1.jpg" /><h3>优歌糖果色短款棉服</h3></a><del>￥756
</del><em>￥279</em><span class="cornermark">￥121</span></li>
<li><a href="http://www.shopin.net/product/2105848.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/25/Pic2105848_148164_0_1.jpg" /><h3>plandoo女士保暖套装 </h3></a><del>198</del><em>￥79</em><span class="cornermark">￥28</span></li>
</del><em>￥650</em><span class="cornermark">￥325</span></li>
<li><a href="http://www.shopin.net/product/2089313.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/10/28/Pic922144_139168_0_1.jpg" /><h3>鹿王男士羊绒衫</h3></a><del>￥1680</del><em>￥759</em><span class="cornermark">￥399</span></li>
<li><a href="http://www.shopin.net/product/2089872.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/12/14/Pic962347_141720_0_1.jpg" /><h3>鹿王女士羊绒衫</h3></a><del>￥1480</del><em>￥499</em><span class="cornermark">￥229</span></li>
<li><a href="http://www.shopin.net/product/1494915.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/10/27/Pic1494915_48660_0_1.jpg" /><h3>veilond羊毛收腰小外套</h3></a><del>￥918</del><em>￥302</em><span class="cornermark">￥181</span></li>
<li><a href="http://www.shopin.net/product/2008375.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/05/Pic2008375_123118_0_1.jpg" /><h3>huayin单排扣羊毛大衣</h3></a><del>￥1280</del><em>￥398</em><span class="cornermark">￥171</span></li>
<li><a href="http://www.shopin.net/product/1376970.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/02/09/Pic1376970_1323_0_1.jpg" /><h3>秋水伊人双排扣装饰风衣</h3></a><del>￥716</del><em>￥272</em><span class="cornermark">￥161</span></li>
<li><a href="http://www.shopin.net/product/780887.html" target="_blank"><img src="http://images.shopin.net/images/60/2010/12/10/Pic780887_24086_0_1.jpg" /><h3>IVRESSE中长款羊毛大衣</h3></a><del>￥1780</del><em>￥200</em><span class="cornermark">￥161</span></li>
<li><a href="http://www.shopin.net/product/2025348.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/17/Pic2025348_3416_0_1.jpg" /><h3>红袖腰带装饰风衣</h3></a><del>￥799</del><em>￥239</em><span class="cornermark">￥161</span></li>
<li><a href="http://www.shopin.net/product/1536407.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/11/28/Pic1536407_53557_0_1.jpg" /><h3>圣三利短款羽绒服</h3></a><del>￥3680</del><em>￥600</em><span class="cornermark">￥541</span></li>
<li><a href="http://www.shopin.net/product/2018555.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/05/Pic2018555_77543_0_1.jpg" /><h3>KELIYA男士100%羊毛衫</h3></a><del>￥798</del><em>￥94</em><span class="cornermark">￥71</span></li>
<li><a href="http://www.shopin.net/product/1944077.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/07/15/Pic1944077_77583_0_1.jpg" /><h3>KELIYA女士翻领100%山羊绒羊毛衫</h3></a><del>￥2180</del><em>￥299</em><span class="cornermark">￥240</span></li>
<li><a href="http://www.shopin.net/product/2038770.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/18/Pic2038770_153757_0_1.jpg" /><h3>蒙派男士100%羊毛衫</h3></a><del>￥896</del><em>￥94</em><span class="cornermark">￥71</span></li>
<li><a href="http://www.shopin.net/product/2052344.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/24/Pic2052344_201416_0_1.jpg" /><h3>洋宾燕斑马纹羊毛连衣裙</h3></a><del>￥980</del><em>￥199</em><span class="cornermark">￥141</span></li>
<li><a href="http://www.shopin.net/product/1549891.html" target="_blank"><img src="http://images.shopin.net/images/68/2011/12/30/Pic1549891_157407_0_1.jpg" /><h3>聊黛部儿时尚彩格纹羽绒服</h3></a><del>￥738</del><em>￥99</em><span class="cornermark">￥91</span></li>
<li><a href="http://www.shopin.net/product/1996262.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/09/01/Pic1996262_196076_0_1.jpg" /><h3>柯里卡貉子毛领棉服</h3></a><del>￥2190</del><em>￥600</em><span class="cornermark">￥300</span></li>
<li><a href="http://www.shopin.net/product/2079535.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic2079535_161817_0_1.jpg" /><h3>WAYONLY绚丽毛领连帽棉服</h3></a><del>￥1288</del><em>￥138</em><span class="cornermark">￥114</span></li>
<li><a href="http://www.shopin.net/product/2071346.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/08/Pic2071346_161789_0_1.jpg" /><h3>WAYONLY时尚渐变色系扣棉服</h3></a><del>￥1399</del><em>￥139</em><span class="cornermark">￥114</span></li>
<li><a href="http://www.shopin.net/product/2028622.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic2028622_161814_0_1.jpg" /><h3>WAYONLY连帽修身棉服</h3></a><del>￥1098</del><em>￥136</em><span class="cornermark">￥114</span></li>
<li><a href="http://www.shopin.net/product/2037565.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/21/Pic2037565_200267_0_1.jpg" /><h3>WAYONLY蕾丝网面聚拢文胸</h3></a><del>￥720</del><em>￥78</em><span class="cornermark">￥51</span></li>
<li><a href="http://www.shopin.net/product/2037557.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/15/Pic2037557_200261_0_1.jpg" /><h3>WAYONLY优雅深V聚拢文胸</h3></a><del>￥570</del><em>￥78</em><span class="cornermark">￥51</span></li>
<li><a href="http://www.shopin.net/product/2037530.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/15/Pic2037530_200266_0_1.jpg" /><h3>WAYONLY蕾丝聚拢前扣式文胸</h3></a><del>￥570</del><em>￥78</em><span class="cornermark">￥51</span></li>
<!--页面内容二-->	
<%}%>

<%
    Date startDate4 = sdf.parse("2012-11-09 23:00:01");
    Date endDate4 = sdf.parse("2012-11-10 19:59:59");
	if(startDate4.before(today) && today.before(endDate4)){
%>
<!--页面内容三-->
  <h4 align="center" style="line-height:40px; font-size:16px">9号-12号 每晚 20点-23点开始限量抢！</h4>
<li><a><img src="http://images.shopin.net/images/58/2012/11/07/Pic2120722_31199_0_1.jpg" /><h3>爱霓梦舟单人枕头</h3></a><del>￥80</del><em>￥60</em><span class="cornermark">￥19</span></li>
<li><a><img src="http://images.shopin.net/images/60/2012/10/30/Pic2085900_74894_0_1.jpg" /><h3>Crocs猛犸系列男士休闲鞋</h3></a><del>￥359</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a><img src="http://images.shopin.net/images/60/2012/10/30/Pic2085931_155540_0_1.jpg" /><h3>CROCS粉红色休闲鞋</h3></a><del>￥339</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/08/21/Pic1994248_78972_0_1.jpg" /><h3>KELIYA男士羊毛衫</h3></a><del>￥698</del><em>￥299</em><span class="cornermark">￥71</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/18/Pic2036707_148038_0_1.jpg" /><h3>蒙派男士羊毛衫</h3></a><del>￥896</del><em>￥349</em><span class="cornermark">￥79</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/07/03/Pic1919446_188186_0_1.jpg" /><h3>JIMANNO双排扣羊毛大衣</h3></a><del>￥5899</del><em>￥1000</em><span class="cornermark">￥649</span></li>
<li><a><img src="http://images.shopin.net/images/66/2012/05/30/Pic1836710_94263_0_1.jpg" /><h3>罗弗蒂奇男士夹克</h3></a><del>￥1980</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a><img src="http://images.shopin.net/images/66/2012/10/13/Pic2078622_134903_0_1.jpg" /><h3>帕古茨男士夹克</h3></a><del>￥2480</del><em>￥289</em><span class="cornermark">￥119</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/11/02/Pic2089416_174632_0_1.jpg" /><h3>优歌糖果色短款棉服</h3></a><del>￥756</del><em>￥279</em><span class="cornermark">￥121</span></li>
<li><a><img src="http://images.shopin.net/images/66/2012/10/25/Pic2105848_148164_0_1.jpg" /><h3>plandoo女士保暖套装 </h3></a><del>198</del><em>￥79</em><span class="cornermark">￥28</span></li>
<li><a><img src="http://images.shopin.net/images/61/2011/10/28/Pic922144_139168_0_1.jpg" /><h3>鹿王男士羊绒衫</h3></a><del>￥1680</del><em>￥759</em><span class="cornermark">￥339</span></li>
<li><a><img src="http://images.shopin.net/images/58/2011/12/14/Pic962347_141720_0_1.jpg" /><h3>鹿王女士羊绒衫</h3></a><del>￥1480</del><em>￥499</em><span class="cornermark">￥229</span></li>
<li><a><img src="http://images.shopin.net/images/61/2011/10/27/Pic1494915_48660_0_1.jpg" /><h3>veilond羊毛收腰小外套</h3></a><del>￥918</del><em>￥302</em><span class="cornermark">￥181</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/05/Pic2008375_123118_0_1.jpg" /><h3>huayin单排扣羊毛大衣</h3></a><del>￥1280</del><em>￥398</em><span class="cornermark">￥171</span></li>
<li><a><img src="http://images.shopin.net/images/60/2012/02/09/Pic1376970_1323_0_1.jpg" /><h3>秋水伊人双排扣装饰风衣</h3></a><del>￥716</del><em>￥272</em><span class="cornermark">￥161</span></li>
<li><a><img src="http://images.shopin.net/images/60/2010/12/10/Pic780887_24086_0_1.jpg" /><h3>IVRESSE中长款羊毛大衣</h3></a><del>￥1780</del><em>￥200</em><span class="cornermark">￥161</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/17/Pic2025348_3416_0_1.jpg" /><h3>红袖腰带装饰风衣</h3></a><del>￥799</del><em>￥239</em><span class="cornermark">￥161</span></li>
<li><a><img src="http://images.shopin.net/images/58/2011/11/28/Pic1536407_53557_0_1.jpg" /><h3>圣三利短款羽绒服</h3></a><del>￥3680</del><em>￥600</em><span class="cornermark">￥541</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/05/Pic2018555_77543_0_1.jpg" /><h3>KELIYA男士100%羊毛衫</h3></a><del>￥798</del><em>￥94</em><span class="cornermark">￥71</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/07/15/Pic1944077_77583_0_1.jpg" /><h3>KELIYA女士翻领100%山羊绒羊毛衫</h3></a><del>￥2180</del><em>￥299</em><span class="cornermark">￥240</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/18/Pic2038770_153757_0_1.jpg" /><h3>蒙派男士100%羊毛衫</h3></a><del>￥896</del><em>￥94</em><span class="cornermark">￥71</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/24/Pic2052344_201416_0_1.jpg" /><h3>洋宾燕斑马纹羊毛连衣裙</h3></a><del>￥980</del><em>￥199</em><span class="cornermark">￥141</span></li>
<li><a><img src="http://images.shopin.net/images/68/2011/12/30/Pic1549891_157407_0_1.jpg" /><h3>聊黛部儿时尚彩格纹羽绒服</h3></a><del>￥738</del><em>￥99</em><span class="cornermark">￥91</span></li>
<li><a><img src="http://images.shopin.net/images/60/2012/09/01/Pic1996262_196076_0_1.jpg" /><h3>柯里卡貉子毛领棉服</h3></a><del>￥2190</del><em>￥600</em><span class="cornermark">￥300</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/10/19/Pic2079535_161817_0_1.jpg" /><h3>WAYONLY绚丽毛领连帽棉服</h3></a><del>￥1288</del><em>￥138</em><span class="cornermark">￥114</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/10/08/Pic2071346_161789_0_1.jpg" /><h3>WAYONLY时尚渐变色系扣棉服</h3></a><del>￥1399</del><em>￥139</em><span class="cornermark">￥114</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/10/19/Pic2028622_161814_0_1.jpg" /><h3>WAYONLY连帽修身棉服</h3></a><del>￥1098</del><em>￥136</em><span class="cornermark">￥114</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/21/Pic2037565_200267_0_1.jpg" /><h3>WAYONLY蕾丝网面聚拢文胸</h3></a><del>￥720</del><em>￥78</em><span class="cornermark">￥51</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/15/Pic2037557_200261_0_1.jpg" /><h3>WAYONLY优雅深V聚拢文胸</h3></a><del>￥570</del><em>￥78</em><span class="cornermark">￥51</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/15/Pic2037530_200266_0_1.jpg" /><h3>WAYONLY蕾丝聚拢前扣式文胸</h3></a><del>￥570</del><em>￥78</em><span class="cornermark">￥51</span></li>
<!--页面内容三-->	
<%}%>

<%
    Date startDate5 = sdf.parse("2012-11-10 20:00:00");
    Date endDate5 = sdf.parse("2012-11-10 23:00:00");
	if(startDate5.before(today) && today.before(endDate5)){
%>
<!--页面内容四-->
<li><a href="http://www.shopin.net/product/2120722.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/11/07/Pic2120722_31199_0_1.jpg" /><h3>爱霓梦舟单人枕头</h3></a><del>￥80</del><em>￥60</em><span class="cornermark">￥19</span></li>
<li><a href="http://www.shopin.net/product/2105890.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/30/Pic2085900_74894_0_1.jpg" /><h3>Crocs猛犸系列男士休闲鞋</h3></a><del>￥359</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/2085931.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/30/Pic2085931_155540_0_1.jpg" /><h3>CROCS粉红色休闲鞋</h3></a><del>￥339</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/1994248.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/08/21/Pic1994248_78972_0_1.jpg" /><h3>KELIYA男士羊毛衫</h3></a><del>￥698</del><em>￥299</em><span class="cornermark">￥71</span></li>
<li><a href="http://www.shopin.net/product/2036707.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/18/Pic2036707_148038_0_1.jpg" /><h3>蒙派男士羊毛衫</h3></a><del>￥896</del><em>￥349</em><span class="cornermark">￥79</span></li>
<li><a href="http://www.shopin.net/product/1919446.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/07/03/Pic1919446_188186_0_1.jpg" /><h3>JIMANNO双排扣羊毛大衣</h3></a><del>￥5899</del><em>￥1000</em><span class="cornermark">￥649</span></li>
<li><a href="http://www.shopin.net/product/1836710.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/05/30/Pic1836710_94263_0_1.jpg" /><h3>罗弗蒂奇男士夹克</h3></a><del>￥1980</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/2078622.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/13/Pic2078622_134903_0_1.jpg" /><h3>帕古茨男士夹克</h3></a><del>￥2480</del><em>￥289</em><span class="cornermark">￥119</span></li>
<li><a href="http://www.shopin.net/product/2089416.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/02/Pic2089416_174632_0_1.jpg" /><h3>优歌糖果色短款棉服</h3></a><del>￥756
</del><em>￥279</em><span class="cornermark">￥121</span></li>
<li><a href="http://www.shopin.net/product/2105848.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/25/Pic2105848_148164_0_1.jpg" /><h3>plandoo女士保暖套装 </h3></a><del>198</del><em>￥79</em><span class="cornermark">￥28</span></li>
</del><em>￥650</em><span class="cornermark">￥325</span></li>
<li><a href="http://www.shopin.net/product/2089313.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/10/28/Pic922144_139168_0_1.jpg" /><h3>鹿王男士羊绒衫</h3></a><del>￥1680</del><em>￥759</em><span class="cornermark">￥399</span></li>
<li><a href="http://www.shopin.net/product/2089872.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/12/14/Pic962347_141720_0_1.jpg" /><h3>鹿王女士羊绒衫</h3></a><del>￥1480</del><em>￥499</em><span class="cornermark">￥229</span></li>
<li><a href="http://www.shopin.net/product/1494915.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/10/27/Pic1494915_48660_0_1.jpg" /><h3>veilond羊毛收腰小外套</h3></a><del>￥918</del><em>￥302</em><span class="cornermark">￥181</span></li>
<li><a href="http://www.shopin.net/product/2008375.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/05/Pic2008375_123118_0_1.jpg" /><h3>huayin单排扣羊毛大衣</h3></a><del>￥1280</del><em>￥398</em><span class="cornermark">￥171</span></li>
<li><a href="http://www.shopin.net/product/1376970.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/02/09/Pic1376970_1323_0_1.jpg" /><h3>秋水伊人双排扣装饰风衣</h3></a><del>￥716</del><em>￥272</em><span class="cornermark">￥161</span></li>
<li><a href="http://www.shopin.net/product/780887.html" target="_blank"><img src="http://images.shopin.net/images/60/2010/12/10/Pic780887_24086_0_1.jpg" /><h3>IVRESSE中长款羊毛大衣</h3></a><del>￥1780</del><em>￥200</em><span class="cornermark">￥161</span></li>
<li><a href="http://www.shopin.net/product/2025348.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/17/Pic2025348_3416_0_1.jpg" /><h3>红袖腰带装饰风衣</h3></a><del>￥799</del><em>￥239</em><span class="cornermark">￥161</span></li>
<li><a href="http://www.shopin.net/product/1536407.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/11/28/Pic1536407_53557_0_1.jpg" /><h3>圣三利短款羽绒服</h3></a><del>￥3680</del><em>￥600</em><span class="cornermark">￥541</span></li>
<li><a href="http://www.shopin.net/product/2018555.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/05/Pic2018555_77543_0_1.jpg" /><h3>KELIYA男士100%羊毛衫</h3></a><del>￥798</del><em>￥94</em><span class="cornermark">￥71</span></li>
<li><a href="http://www.shopin.net/product/1944077.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/07/15/Pic1944077_77583_0_1.jpg" /><h3>KELIYA女士翻领100%山羊绒羊毛衫</h3></a><del>￥2180</del><em>￥299</em><span class="cornermark">￥240</span></li>
<li><a href="http://www.shopin.net/product/2038770.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/18/Pic2038770_153757_0_1.jpg" /><h3>蒙派男士100%羊毛衫</h3></a><del>￥896</del><em>￥94</em><span class="cornermark">￥71</span></li>
<li><a href="http://www.shopin.net/product/2052344.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/24/Pic2052344_201416_0_1.jpg" /><h3>洋宾燕斑马纹羊毛连衣裙</h3></a><del>￥980</del><em>￥199</em><span class="cornermark">￥141</span></li>
<li><a href="http://www.shopin.net/product/1549891.html" target="_blank"><img src="http://images.shopin.net/images/68/2011/12/30/Pic1549891_157407_0_1.jpg" /><h3>聊黛部儿时尚彩格纹羽绒服</h3></a><del>￥738</del><em>￥99</em><span class="cornermark">￥91</span></li>
<li><a href="http://www.shopin.net/product/1996262.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/09/01/Pic1996262_196076_0_1.jpg" /><h3>柯里卡貉子毛领棉服</h3></a><del>￥2190</del><em>￥600</em><span class="cornermark">￥300</span></li>
<li><a href="http://www.shopin.net/product/2079535.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic2079535_161817_0_1.jpg" /><h3>WAYONLY绚丽毛领连帽棉服</h3></a><del>￥1288</del><em>￥138</em><span class="cornermark">￥114</span></li>
<li><a href="http://www.shopin.net/product/2071346.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/08/Pic2071346_161789_0_1.jpg" /><h3>WAYONLY时尚渐变色系扣棉服</h3></a><del>￥1399</del><em>￥139</em><span class="cornermark">￥114</span></li>
<li><a href="http://www.shopin.net/product/2028622.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic2028622_161814_0_1.jpg" /><h3>WAYONLY连帽修身棉服</h3></a><del>￥1098</del><em>￥136</em><span class="cornermark">￥114</span></li>
<li><a href="http://www.shopin.net/product/2037565.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/21/Pic2037565_200267_0_1.jpg" /><h3>WAYONLY蕾丝网面聚拢文胸</h3></a><del>￥720</del><em>￥78</em><span class="cornermark">￥51</span></li>
<li><a href="http://www.shopin.net/product/2037557.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/15/Pic2037557_200261_0_1.jpg" /><h3>WAYONLY优雅深V聚拢文胸</h3></a><del>￥570</del><em>￥78</em><span class="cornermark">￥51</span></li>
<li><a href="http://www.shopin.net/product/2037530.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/15/Pic2037530_200266_0_1.jpg" /><h3>WAYONLY蕾丝聚拢前扣式文胸</h3></a><del>￥570</del><em>￥78</em><span class="cornermark">￥51</span></li>
<!--页面内容四-->	
<%}%>

<%
    Date startDate6 = sdf.parse("2012-11-10 23:00:01");
    Date endDate6 = sdf.parse("2012-11-11 19:59:59");
	if(startDate6.before(today) && today.before(endDate6)){
%>
<!--页面内容五-->
  <h4 align="center" style="line-height:40px; font-size:16px">9号-12号 每晚 20点-23点开始限量抢！</h4>
<li><a><img src="http://images.shopin.net/images/58/2012/11/07/Pic2120722_31199_0_1.jpg" /><h3>爱霓梦舟单人枕头</h3></a><del>￥80</del><em>￥60</em><span class="cornermark">￥19</span></li>
<li><a><img src="http://images.shopin.net/images/60/2012/10/30/Pic2085900_74894_0_1.jpg" /><h3>Crocs猛犸系列男士休闲鞋</h3></a><del>￥359</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a><img src="http://images.shopin.net/images/60/2012/10/30/Pic2085931_155540_0_1.jpg" /><h3>CROCS粉红色休闲鞋</h3></a><del>￥339</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/08/21/Pic1994248_78972_0_1.jpg" /><h3>KELIYA男士羊毛衫</h3></a><del>￥698</del><em>￥299</em><span class="cornermark">￥71</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/18/Pic2036707_148038_0_1.jpg" /><h3>蒙派男士羊毛衫</h3></a><del>￥896</del><em>￥349</em><span class="cornermark">￥79</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/07/03/Pic1919446_188186_0_1.jpg" /><h3>JIMANNO双排扣羊毛大衣</h3></a><del>￥5899</del><em>￥1000</em><span class="cornermark">￥649</span></li>
<li><a><img src="http://images.shopin.net/images/66/2012/05/30/Pic1836710_94263_0_1.jpg" /><h3>罗弗蒂奇男士夹克</h3></a><del>￥1980</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a><img src="http://images.shopin.net/images/66/2012/10/13/Pic2078622_134903_0_1.jpg" /><h3>帕古茨男士夹克</h3></a><del>￥2480</del><em>￥289</em><span class="cornermark">￥119</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/11/02/Pic2089416_174632_0_1.jpg" /><h3>优歌糖果色短款棉服</h3></a><del>￥756</del><em>￥279</em><span class="cornermark">￥121</span></li>
<li><a><img src="http://images.shopin.net/images/66/2012/10/25/Pic2105848_148164_0_1.jpg" /><h3>plandoo女士保暖套装 </h3></a><del>198</del><em>￥79</em><span class="cornermark">￥28</span></li>
<li><a><img src="http://images.shopin.net/images/61/2011/10/28/Pic922144_139168_0_1.jpg" /><h3>鹿王男士羊绒衫</h3></a><del>￥1680</del><em>￥759</em><span class="cornermark">￥339</span></li>
<li><a><img src="http://images.shopin.net/images/58/2011/12/14/Pic962347_141720_0_1.jpg" /><h3>鹿王女士羊绒衫</h3></a><del>￥1480</del><em>￥499</em><span class="cornermark">￥229</span></li>
<li><a><img src="http://images.shopin.net/images/61/2011/10/27/Pic1494915_48660_0_1.jpg" /><h3>veilond羊毛收腰小外套</h3></a><del>￥918</del><em>￥302</em><span class="cornermark">￥181</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/05/Pic2008375_123118_0_1.jpg" /><h3>huayin单排扣羊毛大衣</h3></a><del>￥1280</del><em>￥398</em><span class="cornermark">￥171</span></li>
<li><a><img src="http://images.shopin.net/images/60/2012/02/09/Pic1376970_1323_0_1.jpg" /><h3>秋水伊人双排扣装饰风衣</h3></a><del>￥716</del><em>￥272</em><span class="cornermark">￥161</span></li>
<li><a><img src="http://images.shopin.net/images/60/2010/12/10/Pic780887_24086_0_1.jpg" /><h3>IVRESSE中长款羊毛大衣</h3></a><del>￥1780</del><em>￥200</em><span class="cornermark">￥161</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/17/Pic2025348_3416_0_1.jpg" /><h3>红袖腰带装饰风衣</h3></a><del>￥799</del><em>￥239</em><span class="cornermark">￥161</span></li>
<li><a><img src="http://images.shopin.net/images/58/2011/11/28/Pic1536407_53557_0_1.jpg" /><h3>圣三利短款羽绒服</h3></a><del>￥3680</del><em>￥600</em><span class="cornermark">￥541</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/05/Pic2018555_77543_0_1.jpg" /><h3>KELIYA男士100%羊毛衫</h3></a><del>￥798</del><em>￥94</em><span class="cornermark">￥71</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/07/15/Pic1944077_77583_0_1.jpg" /><h3>KELIYA女士翻领100%山羊绒羊毛衫</h3></a><del>￥2180</del><em>￥299</em><span class="cornermark">￥240</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/18/Pic2038770_153757_0_1.jpg" /><h3>蒙派男士100%羊毛衫</h3></a><del>￥896</del><em>￥94</em><span class="cornermark">￥71</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/24/Pic2052344_201416_0_1.jpg" /><h3>洋宾燕斑马纹羊毛连衣裙</h3></a><del>￥980</del><em>￥199</em><span class="cornermark">￥141</span></li>
<li><a><img src="http://images.shopin.net/images/68/2011/12/30/Pic1549891_157407_0_1.jpg" /><h3>聊黛部儿时尚彩格纹羽绒服</h3></a><del>￥738</del><em>￥99</em><span class="cornermark">￥91</span></li>
<li><a><img src="http://images.shopin.net/images/60/2012/09/01/Pic1996262_196076_0_1.jpg" /><h3>柯里卡貉子毛领棉服</h3></a><del>￥2190</del><em>￥600</em><span class="cornermark">￥300</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/10/19/Pic2079535_161817_0_1.jpg" /><h3>WAYONLY绚丽毛领连帽棉服</h3></a><del>￥1288</del><em>￥138</em><span class="cornermark">￥114</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/10/08/Pic2071346_161789_0_1.jpg" /><h3>WAYONLY时尚渐变色系扣棉服</h3></a><del>￥1399</del><em>￥139</em><span class="cornermark">￥114</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/10/19/Pic2028622_161814_0_1.jpg" /><h3>WAYONLY连帽修身棉服</h3></a><del>￥1098</del><em>￥136</em><span class="cornermark">￥114</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/21/Pic2037565_200267_0_1.jpg" /><h3>WAYONLY蕾丝网面聚拢文胸</h3></a><del>￥720</del><em>￥78</em><span class="cornermark">￥51</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/15/Pic2037557_200261_0_1.jpg" /><h3>WAYONLY优雅深V聚拢文胸</h3></a><del>￥570</del><em>￥78</em><span class="cornermark">￥51</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/15/Pic2037530_200266_0_1.jpg" /><h3>WAYONLY蕾丝聚拢前扣式文胸</h3></a><del>￥570</del><em>￥78</em><span class="cornermark">￥51</span></li>
<!--页面内容五-->	
<%}%>

<%
    Date startDate7 = sdf.parse("2012-11-11 20:00:00");
    Date endDate7 = sdf.parse("2012-11-11 23:00:00");
	if(startDate7.before(today) && today.before(endDate7)){
%>
<!--页面内容六-->
<li><a href="http://www.shopin.net/product/2120722.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/11/07/Pic2120722_31199_0_1.jpg" /><h3>爱霓梦舟单人枕头</h3></a><del>￥80</del><em>￥60</em><span class="cornermark">￥19</span></li>
<li><a href="http://www.shopin.net/product/2105890.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/30/Pic2085900_74894_0_1.jpg" /><h3>Crocs猛犸系列男士休闲鞋</h3></a><del>￥359</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/2085931.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/30/Pic2085931_155540_0_1.jpg" /><h3>CROCS粉红色休闲鞋</h3></a><del>￥339</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/1994248.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/08/21/Pic1994248_78972_0_1.jpg" /><h3>KELIYA男士羊毛衫</h3></a><del>￥698</del><em>￥299</em><span class="cornermark">￥71</span></li>
<li><a href="http://www.shopin.net/product/2036707.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/18/Pic2036707_148038_0_1.jpg" /><h3>蒙派男士羊毛衫</h3></a><del>￥896</del><em>￥349</em><span class="cornermark">￥79</span></li>
<li><a href="http://www.shopin.net/product/1919446.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/07/03/Pic1919446_188186_0_1.jpg" /><h3>JIMANNO双排扣羊毛大衣</h3></a><del>￥5899</del><em>￥1000</em><span class="cornermark">￥649</span></li>
<li><a href="http://www.shopin.net/product/1836710.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/05/30/Pic1836710_94263_0_1.jpg" /><h3>罗弗蒂奇男士夹克</h3></a><del>￥1980</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/2078622.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/13/Pic2078622_134903_0_1.jpg" /><h3>帕古茨男士夹克</h3></a><del>￥2480</del><em>￥289</em><span class="cornermark">￥119</span></li>
<li><a href="http://www.shopin.net/product/2089416.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/02/Pic2089416_174632_0_1.jpg" /><h3>优歌糖果色短款棉服</h3></a><del>￥756
</del><em>￥279</em><span class="cornermark">￥121</span></li>
<li><a href="http://www.shopin.net/product/2105848.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/25/Pic2105848_148164_0_1.jpg" /><h3>plandoo女士保暖套装 </h3></a><del>198</del><em>￥79</em><span class="cornermark">￥28</span></li>
</del><em>￥650</em><span class="cornermark">￥325</span></li>
<li><a href="http://www.shopin.net/product/2089313.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/10/28/Pic922144_139168_0_1.jpg" /><h3>鹿王男士羊绒衫</h3></a><del>￥1680</del><em>￥759</em><span class="cornermark">￥399</span></li>
<li><a href="http://www.shopin.net/product/2089872.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/12/14/Pic962347_141720_0_1.jpg" /><h3>鹿王女士羊绒衫</h3></a><del>￥1480</del><em>￥499</em><span class="cornermark">￥229</span></li>
<li><a href="http://www.shopin.net/product/1494915.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/10/27/Pic1494915_48660_0_1.jpg" /><h3>veilond羊毛收腰小外套</h3></a><del>￥918</del><em>￥302</em><span class="cornermark">￥181</span></li>
<li><a href="http://www.shopin.net/product/2008375.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/05/Pic2008375_123118_0_1.jpg" /><h3>huayin单排扣羊毛大衣</h3></a><del>￥1280</del><em>￥398</em><span class="cornermark">￥171</span></li>
<li><a href="http://www.shopin.net/product/1376970.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/02/09/Pic1376970_1323_0_1.jpg" /><h3>秋水伊人双排扣装饰风衣</h3></a><del>￥716</del><em>￥272</em><span class="cornermark">￥161</span></li>
<li><a href="http://www.shopin.net/product/780887.html" target="_blank"><img src="http://images.shopin.net/images/60/2010/12/10/Pic780887_24086_0_1.jpg" /><h3>IVRESSE中长款羊毛大衣</h3></a><del>￥1780</del><em>￥200</em><span class="cornermark">￥161</span></li>
<li><a href="http://www.shopin.net/product/2025348.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/17/Pic2025348_3416_0_1.jpg" /><h3>红袖腰带装饰风衣</h3></a><del>￥799</del><em>￥239</em><span class="cornermark">￥161</span></li>
<li><a href="http://www.shopin.net/product/1536407.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/11/28/Pic1536407_53557_0_1.jpg" /><h3>圣三利短款羽绒服</h3></a><del>￥3680</del><em>￥600</em><span class="cornermark">￥541</span></li>
<li><a href="http://www.shopin.net/product/2018555.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/05/Pic2018555_77543_0_1.jpg" /><h3>KELIYA男士100%羊毛衫</h3></a><del>￥798</del><em>￥94</em><span class="cornermark">￥71</span></li>
<li><a href="http://www.shopin.net/product/1944077.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/07/15/Pic1944077_77583_0_1.jpg" /><h3>KELIYA女士翻领100%山羊绒羊毛衫</h3></a><del>￥2180</del><em>￥299</em><span class="cornermark">￥240</span></li>
<li><a href="http://www.shopin.net/product/2038770.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/18/Pic2038770_153757_0_1.jpg" /><h3>蒙派男士100%羊毛衫</h3></a><del>￥896</del><em>￥94</em><span class="cornermark">￥71</span></li>
<li><a href="http://www.shopin.net/product/2052344.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/24/Pic2052344_201416_0_1.jpg" /><h3>洋宾燕斑马纹羊毛连衣裙</h3></a><del>￥980</del><em>￥199</em><span class="cornermark">￥141</span></li>
<li><a href="http://www.shopin.net/product/1549891.html" target="_blank"><img src="http://images.shopin.net/images/68/2011/12/30/Pic1549891_157407_0_1.jpg" /><h3>聊黛部儿时尚彩格纹羽绒服</h3></a><del>￥738</del><em>￥99</em><span class="cornermark">￥91</span></li>
<li><a href="http://www.shopin.net/product/1996262.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/09/01/Pic1996262_196076_0_1.jpg" /><h3>柯里卡貉子毛领棉服</h3></a><del>￥2190</del><em>￥600</em><span class="cornermark">￥300</span></li>
<li><a href="http://www.shopin.net/product/2079535.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic2079535_161817_0_1.jpg" /><h3>WAYONLY绚丽毛领连帽棉服</h3></a><del>￥1288</del><em>￥138</em><span class="cornermark">￥114</span></li>
<li><a href="http://www.shopin.net/product/2071346.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/08/Pic2071346_161789_0_1.jpg" /><h3>WAYONLY时尚渐变色系扣棉服</h3></a><del>￥1399</del><em>￥139</em><span class="cornermark">￥114</span></li>
<li><a href="http://www.shopin.net/product/2028622.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic2028622_161814_0_1.jpg" /><h3>WAYONLY连帽修身棉服</h3></a><del>￥1098</del><em>￥136</em><span class="cornermark">￥114</span></li>
<li><a href="http://www.shopin.net/product/2037565.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/21/Pic2037565_200267_0_1.jpg" /><h3>WAYONLY蕾丝网面聚拢文胸</h3></a><del>￥720</del><em>￥78</em><span class="cornermark">￥51</span></li>
<li><a href="http://www.shopin.net/product/2037557.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/15/Pic2037557_200261_0_1.jpg" /><h3>WAYONLY优雅深V聚拢文胸</h3></a><del>￥570</del><em>￥78</em><span class="cornermark">￥51</span></li>
<li><a href="http://www.shopin.net/product/2037530.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/15/Pic2037530_200266_0_1.jpg" /><h3>WAYONLY蕾丝聚拢前扣式文胸</h3></a><del>￥570</del><em>￥78</em><span class="cornermark">￥51</span></li>
<!--页面内容六-->	
<%}%>

<%
    Date startDate8 = sdf.parse("2012-11-11 23:00:01");
    Date endDate8 = sdf.parse("2012-11-12 19:59:59");
	if(startDate8.before(today) && today.before(endDate8)){
%>
<!--页面内容七-->
  <h4 align="center" style="line-height:40px; font-size:16px">9号-12号 每晚 20点-23点开始限量抢！</h4>
<li><a><img src="http://images.shopin.net/images/58/2012/11/07/Pic2120722_31199_0_1.jpg" /><h3>爱霓梦舟单人枕头</h3></a><del>￥80</del><em>￥60</em><span class="cornermark">￥19</span></li>
<li><a><img src="http://images.shopin.net/images/60/2012/10/30/Pic2085900_74894_0_1.jpg" /><h3>Crocs猛犸系列男士休闲鞋</h3></a><del>￥359</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a><img src="http://images.shopin.net/images/60/2012/10/30/Pic2085931_155540_0_1.jpg" /><h3>CROCS粉红色休闲鞋</h3></a><del>￥339</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/08/21/Pic1994248_78972_0_1.jpg" /><h3>KELIYA男士羊毛衫</h3></a><del>￥698</del><em>￥299</em><span class="cornermark">￥71</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/18/Pic2036707_148038_0_1.jpg" /><h3>蒙派男士羊毛衫</h3></a><del>￥896</del><em>￥349</em><span class="cornermark">￥79</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/07/03/Pic1919446_188186_0_1.jpg" /><h3>JIMANNO双排扣羊毛大衣</h3></a><del>￥5899</del><em>￥1000</em><span class="cornermark">￥649</span></li>
<li><a><img src="http://images.shopin.net/images/66/2012/05/30/Pic1836710_94263_0_1.jpg" /><h3>罗弗蒂奇男士夹克</h3></a><del>￥1980</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a><img src="http://images.shopin.net/images/66/2012/10/13/Pic2078622_134903_0_1.jpg" /><h3>帕古茨男士夹克</h3></a><del>￥2480</del><em>￥289</em><span class="cornermark">￥119</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/11/02/Pic2089416_174632_0_1.jpg" /><h3>优歌糖果色短款棉服</h3></a><del>￥756</del><em>￥279</em><span class="cornermark">￥121</span></li>
<li><a><img src="http://images.shopin.net/images/66/2012/10/25/Pic2105848_148164_0_1.jpg" /><h3>plandoo女士保暖套装 </h3></a><del>198</del><em>￥79</em><span class="cornermark">￥28</span></li>
<li><a><img src="http://images.shopin.net/images/61/2011/10/28/Pic922144_139168_0_1.jpg" /><h3>鹿王男士羊绒衫</h3></a><del>￥1680</del><em>￥759</em><span class="cornermark">￥339</span></li>
<li><a><img src="http://images.shopin.net/images/58/2011/12/14/Pic962347_141720_0_1.jpg" /><h3>鹿王女士羊绒衫</h3></a><del>￥1480</del><em>￥499</em><span class="cornermark">￥229</span></li>
<li><a><img src="http://images.shopin.net/images/61/2011/10/27/Pic1494915_48660_0_1.jpg" /><h3>veilond羊毛收腰小外套</h3></a><del>￥918</del><em>￥302</em><span class="cornermark">￥181</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/05/Pic2008375_123118_0_1.jpg" /><h3>huayin单排扣羊毛大衣</h3></a><del>￥1280</del><em>￥398</em><span class="cornermark">￥171</span></li>
<li><a><img src="http://images.shopin.net/images/60/2012/02/09/Pic1376970_1323_0_1.jpg" /><h3>秋水伊人双排扣装饰风衣</h3></a><del>￥716</del><em>￥272</em><span class="cornermark">￥161</span></li>
<li><a><img src="http://images.shopin.net/images/60/2010/12/10/Pic780887_24086_0_1.jpg" /><h3>IVRESSE中长款羊毛大衣</h3></a><del>￥1780</del><em>￥200</em><span class="cornermark">￥161</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/17/Pic2025348_3416_0_1.jpg" /><h3>红袖腰带装饰风衣</h3></a><del>￥799</del><em>￥239</em><span class="cornermark">￥161</span></li>
<li><a><img src="http://images.shopin.net/images/58/2011/11/28/Pic1536407_53557_0_1.jpg" /><h3>圣三利短款羽绒服</h3></a><del>￥3680</del><em>￥600</em><span class="cornermark">￥541</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/05/Pic2018555_77543_0_1.jpg" /><h3>KELIYA男士100%羊毛衫</h3></a><del>￥798</del><em>￥94</em><span class="cornermark">￥71</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/07/15/Pic1944077_77583_0_1.jpg" /><h3>KELIYA女士翻领100%山羊绒羊毛衫</h3></a><del>￥2180</del><em>￥299</em><span class="cornermark">￥240</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/18/Pic2038770_153757_0_1.jpg" /><h3>蒙派男士100%羊毛衫</h3></a><del>￥896</del><em>￥94</em><span class="cornermark">￥71</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/24/Pic2052344_201416_0_1.jpg" /><h3>洋宾燕斑马纹羊毛连衣裙</h3></a><del>￥980</del><em>￥199</em><span class="cornermark">￥141</span></li>
<li><a><img src="http://images.shopin.net/images/68/2011/12/30/Pic1549891_157407_0_1.jpg" /><h3>聊黛部儿时尚彩格纹羽绒服</h3></a><del>￥738</del><em>￥99</em><span class="cornermark">￥91</span></li>
<li><a><img src="http://images.shopin.net/images/60/2012/09/01/Pic1996262_196076_0_1.jpg" /><h3>柯里卡貉子毛领棉服</h3></a><del>￥2190</del><em>￥600</em><span class="cornermark">￥300</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/10/19/Pic2079535_161817_0_1.jpg" /><h3>WAYONLY绚丽毛领连帽棉服</h3></a><del>￥1288</del><em>￥138</em><span class="cornermark">￥114</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/10/08/Pic2071346_161789_0_1.jpg" /><h3>WAYONLY时尚渐变色系扣棉服</h3></a><del>￥1399</del><em>￥139</em><span class="cornermark">￥114</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/10/19/Pic2028622_161814_0_1.jpg" /><h3>WAYONLY连帽修身棉服</h3></a><del>￥1098</del><em>￥136</em><span class="cornermark">￥114</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/21/Pic2037565_200267_0_1.jpg" /><h3>WAYONLY蕾丝网面聚拢文胸</h3></a><del>￥720</del><em>￥78</em><span class="cornermark">￥51</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/15/Pic2037557_200261_0_1.jpg" /><h3>WAYONLY优雅深V聚拢文胸</h3></a><del>￥570</del><em>￥78</em><span class="cornermark">￥51</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/15/Pic2037530_200266_0_1.jpg" /><h3>WAYONLY蕾丝聚拢前扣式文胸</h3></a><del>￥570</del><em>￥78</em><span class="cornermark">￥51</span></li>
<!--页面内容七-->	
<%}%>

<%
    Date startDate9 = sdf.parse("2012-11-12 20:00:00");
    Date endDate9 = sdf.parse("2012-11-12 23:00:00");
	if(startDate9.before(today) && today.before(endDate9)){
%>
<!--页面内容八-->
<li><a href="http://www.shopin.net/product/2120722.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/11/07/Pic2120722_31199_0_1.jpg" /><h3>爱霓梦舟单人枕头</h3></a><del>￥80</del><em>￥60</em><span class="cornermark">￥19</span></li>
<li><a href="http://www.shopin.net/product/2105890.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/30/Pic2085900_74894_0_1.jpg" /><h3>Crocs猛犸系列男士休闲鞋</h3></a><del>￥359</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/2085931.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/30/Pic2085931_155540_0_1.jpg" /><h3>CROCS粉红色休闲鞋</h3></a><del>￥339</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/1994248.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/08/21/Pic1994248_78972_0_1.jpg" /><h3>KELIYA男士羊毛衫</h3></a><del>￥698</del><em>￥299</em><span class="cornermark">￥71</span></li>
<li><a href="http://www.shopin.net/product/2036707.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/18/Pic2036707_148038_0_1.jpg" /><h3>蒙派男士羊毛衫</h3></a><del>￥896</del><em>￥349</em><span class="cornermark">￥79</span></li>
<li><a href="http://www.shopin.net/product/1919446.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/07/03/Pic1919446_188186_0_1.jpg" /><h3>JIMANNO双排扣羊毛大衣</h3></a><del>￥5899</del><em>￥1000</em><span class="cornermark">￥649</span></li>
<li><a href="http://www.shopin.net/product/1836710.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/05/30/Pic1836710_94263_0_1.jpg" /><h3>罗弗蒂奇男士夹克</h3></a><del>￥1980</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/2078622.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/13/Pic2078622_134903_0_1.jpg" /><h3>帕古茨男士夹克</h3></a><del>￥2480</del><em>￥289</em><span class="cornermark">￥119</span></li>
<li><a href="http://www.shopin.net/product/2089416.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/02/Pic2089416_174632_0_1.jpg" /><h3>优歌糖果色短款棉服</h3></a><del>￥756
</del><em>￥279</em><span class="cornermark">￥121</span></li>
<li><a href="http://www.shopin.net/product/2105848.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/25/Pic2105848_148164_0_1.jpg" /><h3>plandoo女士保暖套装 </h3></a><del>198</del><em>￥79</em><span class="cornermark">￥28</span></li>
</del><em>￥650</em><span class="cornermark">￥325</span></li>
<li><a href="http://www.shopin.net/product/2089313.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/10/28/Pic922144_139168_0_1.jpg" /><h3>鹿王男士羊绒衫</h3></a><del>￥1680</del><em>￥759</em><span class="cornermark">￥399</span></li>
<li><a href="http://www.shopin.net/product/2089872.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/12/14/Pic962347_141720_0_1.jpg" /><h3>鹿王女士羊绒衫</h3></a><del>￥1480</del><em>￥499</em><span class="cornermark">￥229</span></li>
<li><a href="http://www.shopin.net/product/1494915.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/10/27/Pic1494915_48660_0_1.jpg" /><h3>veilond羊毛收腰小外套</h3></a><del>￥918</del><em>￥302</em><span class="cornermark">￥181</span></li>
<li><a href="http://www.shopin.net/product/2008375.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/05/Pic2008375_123118_0_1.jpg" /><h3>huayin单排扣羊毛大衣</h3></a><del>￥1280</del><em>￥398</em><span class="cornermark">￥171</span></li>
<li><a href="http://www.shopin.net/product/1376970.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/02/09/Pic1376970_1323_0_1.jpg" /><h3>秋水伊人双排扣装饰风衣</h3></a><del>￥716</del><em>￥272</em><span class="cornermark">￥161</span></li>
<li><a href="http://www.shopin.net/product/780887.html" target="_blank"><img src="http://images.shopin.net/images/60/2010/12/10/Pic780887_24086_0_1.jpg" /><h3>IVRESSE中长款羊毛大衣</h3></a><del>￥1780</del><em>￥200</em><span class="cornermark">￥161</span></li>
<li><a href="http://www.shopin.net/product/2025348.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/17/Pic2025348_3416_0_1.jpg" /><h3>红袖腰带装饰风衣</h3></a><del>￥799</del><em>￥239</em><span class="cornermark">￥161</span></li>
<li><a href="http://www.shopin.net/product/1536407.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/11/28/Pic1536407_53557_0_1.jpg" /><h3>圣三利短款羽绒服</h3></a><del>￥3680</del><em>￥600</em><span class="cornermark">￥541</span></li>
<li><a href="http://www.shopin.net/product/2018555.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/05/Pic2018555_77543_0_1.jpg" /><h3>KELIYA男士100%羊毛衫</h3></a><del>￥798</del><em>￥94</em><span class="cornermark">￥71</span></li>
<li><a href="http://www.shopin.net/product/1944077.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/07/15/Pic1944077_77583_0_1.jpg" /><h3>KELIYA女士翻领100%山羊绒羊毛衫</h3></a><del>￥2180</del><em>￥299</em><span class="cornermark">￥240</span></li>
<li><a href="http://www.shopin.net/product/2038770.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/18/Pic2038770_153757_0_1.jpg" /><h3>蒙派男士100%羊毛衫</h3></a><del>￥896</del><em>￥94</em><span class="cornermark">￥71</span></li>
<li><a href="http://www.shopin.net/product/2052344.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/24/Pic2052344_201416_0_1.jpg" /><h3>洋宾燕斑马纹羊毛连衣裙</h3></a><del>￥980</del><em>￥199</em><span class="cornermark">￥141</span></li>
<li><a href="http://www.shopin.net/product/1549891.html" target="_blank"><img src="http://images.shopin.net/images/68/2011/12/30/Pic1549891_157407_0_1.jpg" /><h3>聊黛部儿时尚彩格纹羽绒服</h3></a><del>￥738</del><em>￥99</em><span class="cornermark">￥91</span></li>
<li><a href="http://www.shopin.net/product/1996262.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/09/01/Pic1996262_196076_0_1.jpg" /><h3>柯里卡貉子毛领棉服</h3></a><del>￥2190</del><em>￥600</em><span class="cornermark">￥300</span></li>
<li><a href="http://www.shopin.net/product/2079535.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic2079535_161817_0_1.jpg" /><h3>WAYONLY绚丽毛领连帽棉服</h3></a><del>￥1288</del><em>￥138</em><span class="cornermark">￥114</span></li>
<li><a href="http://www.shopin.net/product/2071346.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/08/Pic2071346_161789_0_1.jpg" /><h3>WAYONLY时尚渐变色系扣棉服</h3></a><del>￥1399</del><em>￥139</em><span class="cornermark">￥114</span></li>
<li><a href="http://www.shopin.net/product/2028622.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic2028622_161814_0_1.jpg" /><h3>WAYONLY连帽修身棉服</h3></a><del>￥1098</del><em>￥136</em><span class="cornermark">￥114</span></li>
<li><a href="http://www.shopin.net/product/2037565.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/21/Pic2037565_200267_0_1.jpg" /><h3>WAYONLY蕾丝网面聚拢文胸</h3></a><del>￥720</del><em>￥78</em><span class="cornermark">￥51</span></li>
<li><a href="http://www.shopin.net/product/2037557.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/15/Pic2037557_200261_0_1.jpg" /><h3>WAYONLY优雅深V聚拢文胸</h3></a><del>￥570</del><em>￥78</em><span class="cornermark">￥51</span></li>
<li><a href="http://www.shopin.net/product/2037530.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/15/Pic2037530_200266_0_1.jpg" /><h3>WAYONLY蕾丝聚拢前扣式文胸</h3></a><del>￥570</del><em>￥78</em><span class="cornermark">￥51</span></li>
<!--页面内容八-->	
<%}%>

  </ul>
    <p class="tcp"><img src="http://images.shopin.net/images/ad/shuang11/t4.png" width="918"></p>
    <div class="proArea">
      <ul class="prolist">
      	<div class="hd"><h3>女装</h3><em>&nbsp;</em></div>
<li><a href="http://www.shopin.net/product/1344655.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic1344655_3351_0_1.jpg" /><h3>HOPE SHOW兔毛领羊毛大衣</h3></a><del>￥1499</del><em>￥299</em></li>
<li><a href="http://www.shopin.net/product/1474385.html" target="_blank"><img src="http://images.shopin.net/images/68/2011/12/23/Pic1474385_73734_0_1.jpg" /><h3>纳纹不规则条纹堆堆领羊毛衫</h3></a><del>￥746</del><em>￥110</em></li>
<li><a href="http://www.shopin.net/product/1507921.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic1507921_123097_0_1.jpg" /><h3>huayin多口袋小香风外套</h3></a><del>￥1880</del><em>￥179</em></li>
<li><a href="http://www.shopin.net/product/2028624.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic2028624_170253_0_1.jpg" /><h3>WAYONLY时尚糖果色保暖棉服</h3></a><del>￥899</del><em>￥101</em></li>
<li><a href="http://www.shopin.net/product/2038987.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/18/Pic2038987_188748_0_1.jpg" /><h3>温娜尔高贵兔毛皮一体上衣</h3></a><del>￥3300</del><em>￥495</em></li>
<li><a href="http://www.shopin.net/product/2062224.html" target="_blank"><img src="http://images.shopin.net/images//68/2012/10/19//Pic2062224_178146_0_1.jpg" /><h3>RBCA甜美连帽双排扣呢大衣</h3></a><del>￥1398</del><em>￥238</em></li>
      </ul>
    	<ul class="saleList">
      	<li><a href="http://www.shopin.net/lady/list---0.32-0.41-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale41.png"></a></li>
      	<li><a href="http://www.shopin.net/lady/list---0.22-0.31-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale31.png"></a></li>
      	<li><a href="http://www.shopin.net/lady/list---0.12-0.21-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale21.png"></a></li>
      	<li><a href="http://www.shopin.net/lady/list---0.01-0.11-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale11.png"></a></li>
      </ul>
    </div>
    <div class="proArea">
      	<div class="hd"><h3>鞋</h3><em>&nbsp;</em></div>
      <ul class="prolist">
<li><a href="http://www.shopin.net/product/2077631.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/10/26/Pic2077631_198833_0_1.jpg" /><h3>炫姿时尚中筒靴</h3></a><del>￥816</del><em>￥253</em></li>
<li><a href="http://www.shopin.net/product/1483057.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/10/28/Pic1483057_11103_0_1.jpg" /><h3>红蜻蜓牛皮短靴</h3></a><del>￥1279</del><em>￥399</em></li>
<li><a href="http://www.shopin.net/product/1717603.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/09/12/Pic1717603_13310_0_1.jpg" /><h3>TATA羊皮兔毛靴子</h3></a><del>￥1199</del><em>￥399</em></li>
<li><a href="http://www.shopin.net/product/913033.html" target="_blank"><img src="http://images.shopin.net/images//66/2011/10/30//Pic913033_15312_0_1.jpg" /><h3>oxox时尚豹纹雪地靴</h3></a><del>￥780</del><em>￥269</em></li>
<li><a href="http://www.shopin.net/product/1432820.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/09/23/Pic1432820_11123_0_1.jpg" /><h3>红蜻蜓真皮长靴</h3></a><del>￥1139</del><em>￥380</em></li>
<li><a href="http://www.shopin.net/product/1554622.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/12/09/Pic1554622_8234_0_1.jpg" /><h3>策乐男款牛皮单鞋</h3></a><del>￥668</del><em>￥140</em></li>
      </ul>
    	<ul class="saleList">
      	<li><a href="http://www.shopin.net/shoes/list---0.32-0.41-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale41.png"></a></li>
      	<li><a href="http://www.shopin.net/shoes/list---0.22-0.31-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale31.png"></a></li>
      	<li><a href="http://www.shopin.net/shoes/list---0.12-0.21-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale21.png"></a></li>
      	<li><a href="http://www.shopin.net/shoes/list---0.02-0.11-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale11.png"></a></li>
      </ul>
    </div>
    <div class="proArea">
      	<div class="hd"><h3>羊绒</h3><em>&nbsp;</em></div>
      <ul class="prolist">
<li><a href="http://www.shopin.net/product/962347.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/12/14/Pic962347_141720_0_1.jpg" /><h3>鹿王100%山羊绒衫</h3></a><del>￥1480</del><em>￥459</em></li>
<li><a href="http://www.shopin.net/product/2062374.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/08/Pic2062374_202556_0_1.jpg" /><h3>洋宾燕时尚花纹羊绒衫</h3></a><del>￥1280</del><em>￥299</em></li>
<li><a href="http://www.shopin.net/product/2051596.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/24/Pic2051596_159502_0_1.jpg" /><h3>蒙派花朵款羊绒衫</h3></a><del>￥1099</del><em>￥188</em></li>
<li><a href="http://www.shopin.net/product/2064349.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/29/Pic2064349_77803_0_1.jpg" /><h3>宾缘女款混绒裤</h3></a><del>￥798</del><em>￥99</em></li>
<li><a href="http://www.shopin.net/product/2053634.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/25/Pic2053634_201912_0_1.jpg" /><h3>戎立特100%山羊绒衫</h3></a><del>￥1260</del><em>￥441</em></li>
<li><a href="http://www.shopin.net/product/2018528.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/09/24/Pic2018528_78973_0_1.jpg" /><h3>KELIYA男士100%羊毛背心</h3></a><del>￥598</del><em>￥66</em></li>
      </ul>
    	<ul class="saleList">
      	<li><a href="http://www.shopin.net/list--1720-0.32-0.41-----1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale41.png"></a></li>
      	<li><a href="http://www.shopin.net/list--1720-0.22-0.31-----1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale31.png"></a></li>
      	<li><a href="http://www.shopin.net/list--1720-0.12-0.21-----1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale21.png"></a></li>
      	<li><a href="http://www.shopin.net/list--1720-0.02-0.11-----1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale11.png"></a></li>
      </ul>
    </div>
    <div class="proArea">
      <ul class="prolist">
      	<div class="hd"><h3>羽绒</h3><em>&nbsp;</em></div>
<li><a href="http://www.shopin.net/product/1910060.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/07/16/Pic1910060_187287_0_1.jpg" /><h3>OURSHINE长款白鸭绒羽绒服</h3></a><del>￥788</del><em>￥399</em></li>
<li><a href="http://www.shopin.net/product/1479452.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/29/Pic1479452_76477_0_1.jpg" /><h3>雅鹿貉子毛领羽绒服</h3></a><del>￥1929</del><em>￥799</em></li>
<li><a href="http://www.shopin.net/product/1532047.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic1532047_151252_0_1.jpg" /><h3>Kazelaze貉子毛领白鸭绒收腰羽绒服</h3></a><del>￥748</del><em>￥399</em></li>
<li><a href="http://www.shopin.net/product/1555932.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic1555932_157399_0_1.jpg" /><h3>聊黛部儿短款亮面鸭绒羽绒服</h3></a><del>￥698</del><em>￥189</em></li>
<li><a href="http://www.shopin.net/product/1497373.html" target="_blank"><img src="http://images.shopin.net/images/68/2011/11/17/Pic1497373_148805_0_1.jpg" /><h3>MODO GAGA长款羽绒服</h3></a><del>￥1598</del><em>￥336</em></li>
<li><a href="http://www.shopin.net/product/1335823.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/12/22/Pic1335823_152886_0_1.jpg" /><h3>花花公子男士羽绒服</h3></a><del>￥1533</del><em>￥475</em></li>
      </ul>
    	<ul class="saleList">
      	<li><a href="http://www.shopin.net/list--1740-0.32-0.41-----1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale41.png"></a></li>
      	<li><a href="http://www.shopin.net/list--1740-0.22-0.31-----1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale31.png"></a></li>
      	<li><a href="http://www.shopin.net/list--1740-0.05-0.21-----1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale21.png"></a></li>
      	<li><a href="http://www.shopin.net/list--1740-0.05-0.21-----1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale11.png"></a></li>
      </ul>
    </div>
    <div class="proArea">
      <ul class="prolist">
      	<div class="hd"><h3>男装</h3><em>&nbsp;</em></div>
<li><a href="http://www.shopin.net/product/1973459.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/03/Pic1973459_174162_0_1.jpg" /><h3>雅戈尔羽绒外套</h3></a><del>￥2580</del><em>￥774</em></li>
<li><a href="http://www.shopin.net/product/128452.html" target="_blank"><img src="http://images.shopin.net/images/58/2010/11/12/Pic128452_91139_0_1.jpg" /><h3>吉诺里兹针织衫</h3></a><del>￥1280</del><em>￥120</em></li>
<li><a href="http://www.shopin.net/product/1434589.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/08/15//Pic1434589_16391_0_1.jpg" /><h3>罗马世家加棉外套</h3></a><del>￥2890</del><em>￥390</em></li>
<li><a href="http://www.shopin.net/product/1630431.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/02/15/Pic1630431_18398_0_1.jpg" /><h3>奥古利奥纯棉衬衫</h3></a><del>￥980</del><em>￥99</em></li>
<li><a href="http://www.shopin.net/product/1548293.html" target="_blank"><img src="http://images.shopin.net/images//68/2012/09/10//Pic1548293_154104_0_1.jpg" /><h3>爱尔爱司时尚羽绒服</h3></a><del>￥2599</del><em>￥579</em></li>
<li><a href="http://www.shopin.net/product/638447.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/01/11/Pic638447_15311_0_1.jpg" /><h3>蒙漫侬商务休闲长裤</h3></a><del>￥620</del><em>￥68</em></li>
      </ul>
    	<ul class="saleList">
      	<li><a href="http://www.shopin.net/man/list---0.31-0.41-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale41.png"></a></li>
      	<li><a href="http://www.shopin.net/man/list---0.21-0.31-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale31.png"></a></li>
      	<li><a href="http://www.shopin.net/man/list---0.11-0.21-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale21.png"></a></li>
      	<li><a href="http://www.shopin.net/man/list---0.05-0.11-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale11.png"></a></li>
      </ul>
    </div>
    <div class="proArea">
      <ul class="prolist">
      	<div class="hd"><h3>休闲</h3><em>&nbsp;</em></div>
<li><a href="http://www.shopin.net/product/1717972.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/03/30/Pic1717972_171750_0_1.jpg" /><h3>GXG男士羊毛短大衣</h3></a><del>￥1098</del><em>￥439</em></li>
<li><a href="http://www.shopin.net/product/2047425.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/09/24/Pic2047425_51335_0_1.jpg" /><h3>LEE牛仔长裤</h3></a><del>￥890</del><em>￥390</em></li>
<li><a href="http://www.shopin.net/product/1990630.html" target="_blank"><img src="http://images.shopin.net/images//61/2012/08/22//Pic1990630_195183_0_1.jpg" /><h3>Tonyjeans时尚毛衫</h3></a><del>￥690</del><em>￥207</em></li>
<li><a href="http://www.shopin.net/product/2047495.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/09/24/Pic2047495_51335_0_1.jpg" /><h3>LEE牛仔长裤</h3></a><del>￥890</del><em>￥390</em></li>
<li><a href="http://www.shopin.net/product/1370745.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/08/24/Pic1370745_81524_0_1.jpg" /><h3>monchhichi女士纯棉帽衫</h3></a><del>￥658</del><em>￥204</em></li>
<li><a href="http://www.shopin.net/product/2047169.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/10/08/Pic2047169_51335_0_1.jpg" /><h3>LEE牛仔长裤428-3260</h3></a><del>￥590</del><em>￥295</em></li>
      </ul>
    	<ul class="saleList">
      	<li><a href="http://www.shopin.net/casual/list---0.31-0.41-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale41.png"></a></li>
      	<li><a href="http://www.shopin.net/casual/list---0.21-0.31-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale31.png"></a></li>
      	<li><a href="http://www.shopin.net/casual/list---0.11-0.21-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale21.png"></a></li>
      	<li><a href="http://www.shopin.net/casual/list---0.05-0.11-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale11.png"></a></li>
      </ul>
    </div>
    <div class="proArea">
    	<ul class="prolist">
      	<div class="hd"><h3>运动</h3><em>&nbsp;</em></div>
<li><a href="http://www.shopin.net/product/1602857.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/09/25/Pic1602857_48029_0_1.jpg" /><h3>NIKE男式舒适跑鞋</h3></a><del>￥869</del><em>￥387</em></li>
<li><a href="http://www.shopin.net/product/1659348.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/08/04/Pic1659348_29071_0_1.jpg" /><h3>NIKE女式舒适跑鞋</h3></a><del>￥829</del><em>￥581</em></li>
<li><a href="http://www.shopin.net/product/1537934.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/12/26/Pic1537934_48014_0_1.jpg" /><h3>ADIDAS男式时尚板鞋</h3></a><del>￥660</del><em>￥297</em></li>
<li><a href="http://www.shopin.net/product/1332493.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/10/26/Pic1332493_48014_0_1.jpg" /><h3>ADIDAS中性时尚板鞋</h3></a><del>￥580</del><em>￥436</em></li>
<li><a href="http://www.shopin.net/product/1501357.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/11/01/Pic1501357_48654_0_1.jpg" /><h3>CONVERSE男式连帽外套</h3></a><del>￥499</del><em>￥225</em></li>
<li><a href="http://www.shopin.net/product/1941426.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/07/17/Pic1941426_190563_0_1.jpg" /><h3>KAPPA女式连帽外套</h3></a><del>￥438</del><em>￥219</em></li>
      </ul>
      <ul class="saleList">
      	<li><a href="http://www.shopin.net/sports/list---0.405-0.415-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale41.png"></a></li>
      	<li><a href="http://www.shopin.net/sports/list---0.305-0.315-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale31.png"></a></li>
      	<li><a href="http://www.shopin.net/sports/list---0.205-0.215-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale21.png"></a></li>
      	<li><a href="http://www.shopin.net/sports/list---0.01-0.115-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale11.png"></a></li>
      </ul>
    </div>
    <div class="proArea">
    	<ul class="prolist">
      	<div class="hd"><h3>户外</h3><em>&nbsp;</em></div>
<li><a href="http://www.shopin.net/product/1434776.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/11/11/Pic1434776_154606_0_1.jpg" /><h3>诺诗兰菲尼亚斯男式三合一冲锋衣</h3></a><del>￥1380</del><em>￥689</em></li>
<li><a href="http://www.shopin.net/product/801759.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/10/24/Pic801759_23264_0_1.jpg" /><h3>KAILAS女式三合一冲锋衣</h3></a><del>￥1480</del><em>￥459</em></li>
<li><a href="http://www.shopin.net/product/1594972.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/01/10/Pic1594972_27908_0_1.jpg" /><h3>布来亚克男式羽绒服</h3></a><del>￥1480</del><em>￥448</em></li>
<li><a href="http://www.shopin.net/product/1594992.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/01/10/Pic1594992_27835_0_1.jpg" /><h3>布来亚克女式羽绒服</h3></a><del>￥1480</del><em>￥448</em></li>
<li><a href="http://www.shopin.net/product/1471836.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/10/18/Pic1471836_27290_0_1.jpg" /><h3>探路者中性徒步鞋</h3></a><del>￥749</del><em>￥374</em></li>
<li><a href="http://www.shopin.net/product/1474211.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/11/30/Pic1474211_148759_0_1.jpg" /><h3>探路者中性徒步鞋</h3></a><del>￥729</del><em>￥364</em></li>
      </ul>
      <ul class="saleList">
      	<li><a href="http://www.shopin.net/outdoor/list---0.405-0.415-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale41.png"></a></li>
      	<li><a href="http://www.shopin.net/outdoor/list---0.305-0.315-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale31.png"></a></li>
      	<li><a href="http://www.shopin.net/outdoor/list---0.205-0.215-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale21.png"></a></li>
      	<li><a href="http://www.shopin.net/outdoor/list---0.05-0.15-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale11.png"></a></li>
      </ul>
    </div>
    <div class="proArea">
    	<ul class="prolist">
      	<div class="hd"><h3>内衣</h3><em>&nbsp;</em></div>
<li><a href="http://www.shopin.net/product/161186.html" target="_blank"><img src="http://images.shopin.net/images/61/2010/05/07/Pic161186_6335_0_1.jpg" /><h3>古今蕾丝刺绣时尚文胸</h3></a><del>￥150</del><em>￥75</em></li>
<li><a href="http://www.shopin.net/product/1938552.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/07/09/Pic1938552_117941_0_1.jpg" /><h3>桑扶兰3/4中厚模杯蕾丝聚拢文胸</h3></a><del>￥198</del><em>￥49</em></li>
<li><a href="http://www.shopin.net/product/1382218.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/08/30/Pic1382218_71368_0_1.jpg" /><h3>芬蝶粉嫩卡通图案家居套装</h3></a><del>￥548</del><em>￥150</em></li>
<li><a href="http://www.shopin.net/product/1302360.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/02/29/Pic1302360_8260_0_1.jpg" /><h3>ELLE性感动物纹饰文胸</h3></a><del>￥299</del><em>￥60</em></li>
<li><a href="http://www.shopin.net/product/2073610.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/19/Pic2073610_205762_0_1.jpg" /><h3>北极绒男款提花保暖套装</h3></a><del>￥298</del><em>￥92</em></li>
<li><a href="http://www.shopin.net/product/2090186.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/23/Pic2090186_206871_0_1.jpg" /><h3>和人纺女士羊毛取暖保暖套装</h3></a><del>￥498</del><em>￥99</em></li>
      </ul>
      <ul class="saleList">
      	<li><a href="http://www.shopin.net/underwear/list---0.32-0.41-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale41.png"></a></li>
      	<li><a href="http://www.shopin.net/underwear/list---0.22-0.31-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale31.png"></a></li>
      	<li><a href="http://www.shopin.net/underwear/list---0.12-0.21-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale21.png"></a></li>
      	<li><a href="http://www.shopin.net/underwear/list---0.01-0.11-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale11.png"></a></li>
      </ul>
    </div>
    <div class="proArea">
    	<ul class="prolist">
      	<div class="hd"><h3>儿童</h3><em>&nbsp;</em></div>
<li><a href="http://www.shopin.net/product/1655141.html" target="_blank"><img src="http://images.shopin.net/images//60/2012/02/23//Pic1655141_56486_0_1.jpg" /><h3>空中天使圆领条纹针织衫</h3></a><del>￥249</del><em>￥98</em></li>
<li><a href="http://www.shopin.net/product/1996195.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/08/22//Pic1996195_184903_0_1.jpg" /><h3>丑丑幼童系扣翻领外套</h3></a><del>￥320</del><em>￥99</em></li>
<li><a href="http://www.shopin.net/product/876576.html" target="_blank"><img src="http://images.shopin.net/images//58/2011/09/13//Pic876576_1608_0_1.jpg" /><h3>艾艾屋男童加绒连帽外套</h3></a><del>￥168</del><em>￥187</em></li>
<li><a href="http://www.shopin.net/product/1592155.html" target="_blank"><img src="http://images.shopin.net/images//68/2012/01/06//Pic1592155_197_0_1.jpg" /><h3>菲格咪妮豹纹加厚大衣</h3></a><del>￥798</del><em>￥318</em></li>
<li><a href="http://www.shopin.net/product/969794.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/09/11//Pic969794_103539_0_1.jpg" /><h3>昱璐女童长款绒毛帽领羽绒服</h3></a><del>￥769</del><em>￥238</em></li>
<li><a href="http://www.shopin.net/product/1475392.html" target="_blank"><img src="http://images.shopin.net/images//58/2011/10/18//Pic1475392_2318_0_1.jpg" /><h3>DorDor House女童牛皮翻毛小棉靴</h3></a><del>￥338</del><em>￥136</em></li>
      </ul>
      <ul class="saleList">
      	<li><a href="http://www.shopin.net/children/list---0.32-0.41-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale41.png"></a></li>
      	<li><a href="http://www.shopin.net/children/list---0.22-0.31-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale31.png"></a></li>
      	<li><a href="http://www.shopin.net/children/list---0.12-0.21-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale21.png"></a></li>
      	<li><a href="http://www.shopin.net/children/list---0.12-0.21-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale11.png"></a></li>
      </ul>
    </div>
    <div class="proArea">
    	<ul class="prolist">
      	<div class="hd"><h3>箱包配饰</h3><em>&nbsp;</em></div>
<li><a href="http://www.shopin.net/product/1817959.html" target="_blank"><img src="http://images.shopin.net/images//58/2012/07/16//Pic1817959_181403_0_1.jpg" /><h3> TUSCANS真皮包</h3></a><del>￥2080</del><em>￥599</em></li>
<li><a href="http://www.shopin.net/product/2010205.html" target="_blank"><img src="http://images.shopin.net/images//58/2012/09/05//Pic2010205_197466_0_1.jpg" /><h3>特莱玟羊毛围巾</h3></a><del>￥239</del><em>￥74</em></li>
<li><a href="http://www.shopin.net/product/1549504.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/05/19/Pic1549504_19572_0_1.jpg" /><h3>POLO女款真皮腰带</h3></a><del>￥198</del><em>￥50</em></li>
<li><a href="http://www.shopin.net/product/62729.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/06/21/Pic62729_129515_0_1.jpg" /><h3>PLAYBOY男士钱夹</h3></a><del>￥498</del><em>￥86</em></li>
<li><a href="http://www.shopin.net/product/2102515.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/10/29/Pic2102515_208707_0_1.jpg" /><h3>LAVIALADY护耳帽</h3></a><del>￥590</del><em>￥295</em></li>
<li><a href="http://www.shopin.net/product/1451535.html" target="_blank"><img src="http://images.shopin.net/images//60/2011/11/28//Pic1451535_55822_0_1.jpg" /><h3>黑田羊毛手套</h3></a><del>￥200</del><em>￥84</em></li>
      </ul>
      <ul class="saleList">
      	<li><a href="http://www.shopin.net/handbags/list--1103-0.3-0.41------.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale41.png"></a></li>
      	<li><a href="http://www.shopin.net/handbags/list---0.2-0.31-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale31.png"></a></li>
      	<li><a href="http://www.shopin.net/handbags/list---0.1-0.21-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale21.png"></a></li>
      	<li><a href="http://www.shopin.net/handbags/list---0.01-0.11-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale11.png"></a></li>
      </ul>
    </div>
    <div class="proArea">
    	<ul class="prolist">
      	<div class="hd"><h3>家居</h3><em>&nbsp;</em></div>
<li><a href="http://www.shopin.net/product/1998957.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/09/03/Pic1998957_186972_0_1.jpg" /><h3>Erepo纯棉四件套</h3></a><del>￥698</del><em>￥147</em></li>
<li><a href="http://www.shopin.net/product/1981062.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/08/20/Pic1981062_31199_0_1.jpg" /><h3>爱霓梦舟格纹四件套</h3></a><del>￥768</del><em>￥369</em></li>
<li><a href="http://www.shopin.net/product/1952156.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/07/20/Pic1952156_187557_0_1.jpg" /><h3>LIFE HOME大豆被</h3></a><del>￥1890</del><em>￥299</em></li>
<li><a href="http://www.shopin.net/product/1546682.html" target="_blank"><img src="http://images.shopin.net/images//58/2012/08/20//Pic1546682_59161_0_1.jpg" /><h3>Dahonsou精品荞麦枕</h3></a><del>￥320</del><em>￥99</em></li>
<li><a href="http://www.shopin.net/product/53900.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/09/06/Pic53900_194252_0_1.jpg" /><h3>SINOMAX护肩枕</h3></a><del>￥999</del><em>￥438</em></li>
<li><a href="http://www.shopin.net/product/1995409.html" target="_blank"><img src="http://images.shopin.net/images//58/2012/09/05//Pic1995409_196005_0_1.jpg" /><h3>yealotus怡莲亲肤被</h3></a><del>￥848</del><em>￥358</em></li>
      </ul>
      <ul class="saleList">
      	<li><a href="http://www.shopin.net/home/list--1858-0.3-0.41------.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale41.png"></a></li>
      	<li><a href="http://www.shopin.net/home/list---0.2-0.31-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale31.png"></a></li>
      	<li><a href="http://www.shopin.net/home/list---0.1-0.22-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale21.png"></a></li>
      	<li><a href="http://www.shopin.net/home/list---0.1-0.21-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale11.png"></a></li>
      </ul>
    </div>
  </div>
  <ul class="vitList">
  	<li><a href="http://www.shopin.net/help/manzeng.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/full.png"></a></li>
  	<li><a href="http://www.shopin.net/help/zfb1210.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/vip.png"></a></li>
  </ul>
</div>
</body>
</html>