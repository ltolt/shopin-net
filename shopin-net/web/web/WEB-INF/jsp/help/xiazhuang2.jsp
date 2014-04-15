<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>夏装深度打折,夏装劲折抄底,全家购物最划算,秋水伊人,Tata,莱尔斯丹,红袖坊,雅戈尔,巴拉巴拉,连衣裙,T恤,凉鞋,低至1折</title>
<link href="http://images.shopin.net/images/ad/xiazhuang2/xiazhuang2.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
/*首页广告效果*/
$(function(){
     var len  = $(".num > li").length;
	 var index = 0;
	 var adTimer;
	 $(".num li").mouseover(function(){
		index  =   $(".num li").index(this);
		showImg(index);
	 }).eq(0).mouseover();	
	 //滑入 停止动画，滑出开始动画.
	 $('.ad').hover(function(){
			 clearInterval(adTimer);
		 },function(){
			 adTimer = setInterval(function(){
			    showImg(index)
				index++;
				if(index==len){index=0;}
			  } , 4000);
	 }).trigger("mouseleave");
})
// 通过控制top ，来显示不同的幻灯片
function showImg(index){
        var adHeight = $(".zt_focus .ad").height();
		$(".slider").stop(true,false).animate({top : -adHeight*index},500);
		$(".num li").removeClass("on")
			.eq(index).addClass("on");
}
</script>
<!--[if lte IE 6]>
<script type="text/javascript" src="http://images.shopin.net/images/ad/summer1/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript"> 
DD_belatedPNG.fix('.png,.cornermark');
</script> 
<![endif]-->
</head>

<body>
<div class="box">
<div class="zt_focus" style="display:none">
  <div class="ad">
    <ul class="slider">
      <li><a title="第二波：深度打折　全家夏装最划算采购季，全场立省1000元！"><img src="http://images.shopin.net/images/ad/xiazhuang2/tb1.jpg" width="950" height="154" /><img src="http://images.shopin.net/images/ad/xiazhuang2/tb2.jpg" width="950" height="154" /><img src="http://images.shopin.net/images/ad/xiazhuang2/tb3.jpg" width="950" height="154" /></a></li>
      <li><a href="http://www.shopin.net/help/ouzhoubei.html" title="迎暑期运动户外休闲大牌蜂抢会" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/tb4.jpg" width="950" height="154" /><img src="http://images.shopin.net/images/ad/xiazhuang2/tb5.jpg" width="950" height="154" /><img src="http://images.shopin.net/images/ad/xiazhuang2/tb6.jpg" width="950" height="154" /></a></li>
    </ul>
    <ul class="num" >
      <li>1</li>
      <li>2</li>
    </ul>
  </div>
</div>
<div class="zt_title mt"><a class="zt_more" href="http://www.shopin.net/lady/list--1644--------.html" target="_blank">更多&gt;&gt;</a><h2 class="zt_ma"><a href="http://www.shopin.net/lady/list--1648--------.html" target="_blank">雅致衬衫</a>　<a href="http://www.shopin.net/lady/list--1269--------.html" target="_blank">优雅连衣裙</a>　<a href="http://www.shopin.net/shoes/list--1467--------.html" target="_blank">舒适凉鞋</a>　<a href="http://www.shopin.net/handbags/list--1670--------.html" target="_blank">真皮包</a>　<a href="http://www.shopin.net/handbags/list--1815--------.html" target="_blank">遮阳伞</a></h2></div>
<div class="zt_conts">
<ul class="zt_suit clear zc">
  <li class="zt_product"><a href="http://www.shopin.net/product/1796078.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/05/29/Pic1796078_118690_0_1.jpg" width="130" height="130" /><h3>西贝伦气质印花拼接连衣裙</h3></a><del>￥1280</del><em>￥150</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1750743.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/04/16/Pic1750743_152334_0_1.jpg" width="130" height="130" /><h3>奥康交叉绑带凉鞋</h3></a><del>￥539</del><em>￥120</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1697164.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/03/20/Pic1697164_114095_0_1.jpg" width="130" height="130" /><h3>仙美时简约百搭真皮包</h3></a><del>￥1268</del><em>￥334</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1775085.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/04/23/Pic1775085_177304_0_1.jpg" width="130" height="130" /><h3>法缇儿大框白边太阳镜 </h3></a><del>￥220</del><em>￥70</em></li>
  <li class="zt_equal"></li>
  <li class="zt_result">原组合价：￥3307<br />现组合价：￥674<p>立省：2633</p></li>
</ul>
<ul class="zt_suit clear zc">
  <li class="zt_product"><a href="http://www.shopin.net/product/397941.html" target="_blank"><img src="http://images.shopin.net/images/60/2010/07/15/Pic397941_21082_0_1.jpg" width="130" height="130" /><h3>红袖坊时尚职业衬衫</h3></a><del>￥980</del><em>￥158</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/397918.html" target="_blank"><img src="http://images.shopin.net/images/58/2010/07/09/Pic397918_21082_0_1.jpg" width="130" height="130" /><h3>红袖坊翠绿职业半裙</h3></a><del>￥720</del><em>￥79</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1792888.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/06/14/Pic1792888_109888_0_1.jpg" width="130" height="130" /><h3>适步蝴蝶结舒适镂空鱼嘴鞋</h3></a><del>￥668</del><em>￥128</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1226464.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/04/19/Pic1226464_175372_0_1.jpg" width="130" height="130" /><h3>太阳城淑女花边遮阳伞</h3></a><del>￥288</del><em>￥86</em></li>
  <li class="zt_equal"></li>
  <li class="zt_result">原组合价：￥2656<br />现组合价：￥451<p>立省：2205</p></li>
</ul>
<ul class="zt_slt clear zc mt">
<li><a href="http://www.shopin.net/promotion/5308.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/m1.jpg" width="465" height="136" alt="知性简约,自信优雅" /></a></li>
<li><a href="http://www.shopin.net/promotion/5309.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/m2.jpg" width="465" height="136" alt="舒适凉拖 炎夏添凉意" /></a></li>
<li><a href="http://www.shopin.net/promotion/5092.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/m3.jpg" width="465" height="136" alt="经典品牌 年中感恩回馈" /></a></li>
<li><a href="http://www.shopin.net/promotion/4858.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/m4.jpg" width="465" height="136" alt="太阳伞 为盛夏做准备" /></a></li>
</ul>
<ul class="zt_llt clear zc mt">
<li><a href="http://www.shopin.net/lady/brand/list-1994/3.html" target="_blank"><img src="http://images.shopin.net/images/brand/1994_2.jpg" width="128" height="88" />1折起</a></li>
<li><a href="http://www.shopin.net/lady/brand/list-1047-1046-0.05-0.41-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1047_2.jpg" />1-3折</a></li>
<li><a href="http://www.shopin.net/brand/list-1671-1046-------1/2.html" target="_blank"><img src="http://images.shopin.net/images/brand/1671_2.jpg" />1.5-5折</a></li>
<li><a href="http://www.shopin.net/shoes/brand/list-256-1379-0.05-0.41-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/256_2.jpg" />2-5折</a></li>
<li><a href="http://www.shopin.net/shoes/brand/list-319-1379.html" target="_blank"><img src="http://images.shopin.net/images/brand/319_2.jpg" />1.3-5折</a></li>
<li><a href="http://www.shopin.net/brand/list-185--0.05-0.4-----1/4.html" target="_blank"><img src="http://images.shopin.net/images/brand/185_2.jpg" />1.5折起</a></li>
<li><a href="http://www.shopin.net/brand/list-192-1069-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/192_2.jpg" />2折起</a></li>
<!--li><a href="http://www.shopin.net/handbags/brands/1348.html" target="_blank"><img src="http://images.shopin.net/images/brand/1348_2.jpg" />2-3折</a></li-->
</ul>
</div>
<div class="zt_title mt"><a class="zt_more" href="http://www.shopin.net/channel-man.html" target="_blank">更多&gt;&gt;</a><h2 class="zt_ba"><a href="http://www.shopin.net/man/list--1058--------.html" target="_blank">polo衫</a>　<a href="http://www.shopin.net/man/list--1150--------.html" target="_blank">衬衫</a>　<a href="http://www.shopin.net/man/list--1194--------.html" target="_blank">休闲裤</a>　<a href="http://www.shopin.net/shoes/list--1540--------.html" target="_blank">休闲皮鞋</a>　<a href="http://www.shopin.net/handbags/list--1102--------.html" target="_blank">公文包</a></h2></div>
<div class="zt_conts">
<ul class="zt_suit clear zc">
  <li class="zt_product"><a href="http://www.shopin.net/product/1741675.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/04/24/Pic1741675_60395_0_1.jpg" width="130" height="130" /><h3>雅戈尔100%纯棉衬衫</h3></a><del>￥620</del><em>￥200</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1745444.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/04/28/Pic1745444_91139_0_1.jpg" width="130" height="130" /><h3>吉诺里兹正品西裤</h3></a><del>￥1280</del><em>￥200</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1178752.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/12/09/Pic1178752_91139_0_1.jpg" width="130" height="130" /><h3>吉诺里兹100%桑蚕丝领带</h3></a><del>￥480</del><em>￥80</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1750117.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/06/01/Pic1750117_11426_0_1.jpg" width="130" height="130" /><h3>思姆2012款牛皮单鞋</h3></a><del>￥920</del><em>￥333</em></li>
  <li class="zt_equal"></li>
  <li class="zt_result">原组合价：￥3300<br />现组合价：￥813<p>立省：2487</p></li>
</ul>
<ul class="zt_suit clear zc">
  <li class="zt_product"><a href="http://www.shopin.net/product/1667856.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/02/29/Pic1667856_158387_0_1.jpg" width="130" height="130" /><h3>帕古茨优雅条纹polo衫</h3></a><del>￥1680</del><em>￥147</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1235422.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/06/10/Pic1235422_14626_0_1.jpg" width="130" height="130" /><h3>九牧王浅色休闲长裤</h3></a><del>￥625</del><em>￥198</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1523831.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/11/15/Pic1523831_19416_0_1.jpg" width="130" height="130" /><h3>POLO头层牛皮腰带</h3></a><del>￥698</del><em>￥175</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1635423.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/03/16/Pic1635423_20364_0_1.jpg" width="130" height="130" /><h3>暴龙2012新款眼镜</h3></a><del>￥976</del><em>￥464</em></li>
  <li class="zt_equal"></li>
  <li class="zt_result">原组合价：￥3979<br />现组合价：￥984<p>立省：2995</p></li>
</ul>
<ul class="zt_slt clear zc mt">
<li><a href="http://www.shopin.net/promotion/5340.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/f1.jpg" width="465" height="136" alt="" /></a></li>
<li><a href="http://www.shopin.net/promotion/5339.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/f2.jpg" width="465" height="136" alt="" /></a></li>
<li><a href="http://www.shopin.net/promotion/5133.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/f3.jpg" width="465" height="136" alt="" /></a></li>
<li><a href="http://www.shopin.net/promotion/3564.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/f4.jpg" width="465" height="136" alt="" /></a></li>
</ul>
<ul class="zt_llt clear zc mt">
<li><a href="http://www.shopin.net/brands/1167.html" target="_blank"><img src="http://images.shopin.net/images/brand/1167_2.jpg" width="128" height="88" />1.4-5折</a></li>
<li><a href="http://www.shopin.net/brands/412.html" target="_blank"><img src="http://images.shopin.net/images/brand/412_2.jpg" width="128" height="88" />1-4折</a></li>
<li><a href="http://www.shopin.net/man/brands/361.html" target="_blank"><img src="http://images.shopin.net/images/brand/361_2.jpg" width="128" height="88" />3.5折起</a></li>
<li><a href="http://www.shopin.net/brand/list-432-1047-------1/2.html" target="_blank"><img src="http://images.shopin.net/images/brand/432_2.jpg" width="128" height="88" />1-4折</a></li>
<li><a href="http://www.shopin.net/brand/list-256-1382.html" target="_blank"><img src="http://images.shopin.net/images/brand/256_2.jpg" width="128" height="88" />2-5折</a></li>
<li><a href="http://www.shopin.net/brand/list-228-1382/1.html" target="_blank"><img src="http://images.shopin.net/images/brand/228_2.jpg" width="128" height="88" />3-7折</a></li>
<li><a href="http://www.shopin.net/brand/list-586-1069-------1-1/2.html" target="_blank"><img src="http://images.shopin.net/images/brand/586_2.jpg" width="128" height="88" />2.2折起</a></li>
<!--li><a href="http://www.shopin.net/handbags/list-323-1109--------1.html" target="_blank"><img src="http://images.shopin.net/images//brand/323_2.jpg" width="128" height="88" />4.2折起</a></li-->
</ul>
</div>
<div class="zt_title mt"><a class="zt_more" href="http://www.shopin.net/channel-children.html" target="_blank">更多&gt;&gt;</a><h2 class="zt_er"><a href="http://www.shopin.net/children/list--1135--------.html" target="_blank">公主连衣裙</a>　<a href="http://www.shopin.net/children/list--1656--------.html" target="_blank">100%纯绵T恤</a>　<a href="http://www.shopin.net/children/list--1657--------.html" target="_blank">短裤</a>　<a href="http://www.shopin.net/children/list--1143--------.html" target="_blank">凉鞋</a>　<a href="http://www.shopin.net/children/list--1140--------.html" target="_blank">套装</a></h2></div>
<div class="zt_conts">
<ul class="zt_suit clear zc">
  <li class="zt_product"><a href="http://www.shopin.net/product/145970.html" target="_blank"><img src="http://images.shopin.net/images//58/2010/05/27//Pic145970_254_0_1.jpg" width="130" height="130" /><h3>小汽车100%纯棉连体衣</h3></a><del>￥139</del><em>￥50</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1231766.html" target="_blank"><img src="http://images.shopin.net/images//60/2012/04/11//Pic1231766_88018_0_1.jpg" width="130" height="130" /><h3>丑丑100%纯棉绑带上衣</h3></a><del>￥43</del><em>￥17</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1799998.html" target="_blank"><img src="http://images.shopin.net/images//58/2012/06/11//Pic1799998_6070_0_1.jpg" width="130" height="130" /><h3>迪士尼花檐遮阳帽</h3></a><del>￥72</del><em>￥43</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1739631.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/04/10/Pic1739631_28560_0_1.jpg" width="130" height="130" /><h3>ABCKIDS女款宝宝凉鞋</h3></a><del>￥256</del><em>￥115</em></li>
  <li class="zt_equal"></li>
  <li class="zt_result">原组合价：￥510<br />现组合价：￥225<p>立省：285</p></li>
</ul>
<ul class="zt_suit clear zc">
  <li class="zt_product"><a href="http://www.shopin.net/product/1804231.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/05/09/Pic1804231_152_0_1.jpg" width="130" height="130" /><h3>奥克汤姆纯棉印花款连衣裙</h3></a><del>￥198</del><em>￥49</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/259052.html" target="_blank"><img src="http://images.shopin.net/images/58/2010/06/24/Pic259052_25_0_1.jpg" width="130" height="130" /><h3>昱璐女款圆领印花T恤</h3></a><del>￥139</del><em>￥36</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/383334.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/12/09/Pic383334_6070_0_1.jpg" width="130" height="130" /><h3>迪士尼女款卡通书包</h3></a><del>￥108</del><em>￥64</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/159972.html" target="_blank"><img src="http://images.shopin.net/images/58/2010/08/11/Pic159972_33990_0_1.jpg" width="130" height="130" /><h3>Tempovincer摩沙皮凉鞋</h3></a><del>￥198</del><em>￥71</em></li>
  <li class="zt_equal"></li>
  <li class="zt_result">原组合价：￥643<br />现组合价：￥220<p>立省：423</p></li>
</ul>
<ul class="zt_slt clear zc mt">
<li><a href="http://www.shopin.net/promotion/5022.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/c1.jpg" width="465" height="136" alt="夏装劲折 条纹拼色款
T恤 裙衫 低至1折" /></a></li>
<li><a href="http://www.shopin.net/promotion/5190.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/c2.jpg" width="465" height="136" alt="6岁以下小童专场
裙衫 整体衣 ￥12起" /></a></li>
<li><a href="http://www.shopin.net/promotion/5054.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/c3.jpg" width="465" height="136" alt="水孩儿（LOGO) 法式风尚 潮流名品
背心 短裤 ￥34↑" /></a></li>
<li><a href="http://www.shopin.net/promotion/5267.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/c4.jpg" width="465" height="136" alt="时尚新品 完美装扮
裙衫 短裤 鞋 3折起" /></a></li>
</ul>
<ul class="zt_llt clear zc mt">
<li><a href="http://www.shopin.net/children/brands/9.html" target="_blank"><img src="http://images.shopin.net/images/brand/9_2.jpg" width="128" height="88" />2-5折</a></li>
<li><a href="http://www.shopin.net/children/brand/list-1531/3.html" target="_blank"><img src="http://images.shopin.net/images/brand/1531_2.jpg" width="128" height="88" />3-6折</a></li>
<li><a href="http://www.shopin.net/children/brands/48.html" target="_blank"><img src="http://images.shopin.net/images/brand/48_2.jpg" width="128" height="88" />2-5折</a></li>
<li><a href="http://www.shopin.net/children/brand/list-262/6.html" target="_blank"><img src="http://images.shopin.net/images/brand/262_2.jpg" width="128" height="88" />3-7折</a></li>
<li><a href="http://www.shopin.net/children/brands/42.html" target="_blank"><img src="http://images.shopin.net/images/brand/42_2.jpg" width="128" height="88" />2折起</a></li>
<li><a href="http://www.shopin.net/children/brands/99.html" target="_blank"><img src="http://images.shopin.net/images/brand/99_2.jpg" width="128" height="88" />2-6折</a></li>
<li><a href="http://www.shopin.net/children/brand/list-751-1127/7.html" target="_blank"><img src="http://images.shopin.net/images/brand/751_2.jpg" width="128" height="88" />5折封</a></li>
<!--li><a href="http://www.shopin.net/children/brands/1770.html" target="_blank"><img src="http://images.shopin.net/images/brand/1770_2.jpg" width="128" height="88" />3-5折</a></li-->
</ul>
</div>
<div class="zt_title mt"><a class="zt_more" href="http://www.shopin.net/lady/list--1643--------.html" target="_blank">更多&gt;&gt;</a><h2 class="zt_nv"><a href="http://www.shopin.net/lady/list--1269--------.html" target="_blank">连衣裙</a>　<a href="http://www.shopin.net/lady/list--1648--------.html" target="_blank">雪纺衫</a>　<a href="http://www.shopin.net/shoes/list--1467--------.html" target="_blank">缤纷凉鞋</a>　<a href="http://www.shopin.net/handbags/list--1671--------.html" target="_blank">手提包</a>　<a href="http://www.shopin.net/handbags/list--1112--------.html" target="_blank">时尚墨镜</a></h2></div>
<div class="zt_conts">
<ul class="zt_suit clear zc">
  <li class="zt_product"><a href="http://www.shopin.net/product/1726782.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/04/26/Pic1726782_1308_0_1.jpg" width="130" height="130" /><h3>秋水伊人粉色波点连衣裙</h3></a><del>￥676</del><em>￥225</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1223732.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/03/29/Pic1223732_13281_0_1.jpg" width="130" height="130" /><h3>Tata桔色简约坡跟凉鞋</h3></a><del>￥639</del><em>￥299</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1827302.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/05/18/Pic1827302_183120_0_1.jpg" width="130" height="130" /><h3>伊都锦旗下Ofuon草编包</h3></a><del>￥390</del><em>￥117</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1760911.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/05/17/Pic1760911_119480_0_1.jpg" width="130" height="130" /><h3>天堂专柜2012国色天香太阳伞</h3></a><del>￥136</del><em>￥68</em></li>
  <li class="zt_equal"></li>
  <li class="zt_result">原组合价：￥1841<br />现组合价：￥709<p>立省：1132</p></li>
</ul>
<ul class="zt_suit clear zc">
  <li class="zt_product"><a href="http://www.shopin.net/product/1317415.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/08/02/Pic1317415_130868_0_1.jpg" width="130" height="130" /><h3>衣香丽影时尚印花雪纺衫</h3></a><del>￥469</del><em>￥141</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1284524.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/06/28/Pic1284524_3499_0_1.jpg" width="130" height="130" /><h3>Hopeshow红袖甜美半裙</h3></a><del>￥399</del><em>￥60</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1295286.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/07/04/Pic1295286_13003_0_1.jpg" width="130" height="130" /><h3>FED编织复古风凉鞋</h3></a><del>￥699</del><em>￥239</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1624654.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/02/13/Pic1624654_20329_0_1.jpg" width="130" height="130" /><h3>雪曼诗时尚大框太阳镜</h3></a><del>￥276</del><em>￥109</em></li>
  <li class="zt_equal"></li>
  <li class="zt_result">原组合价：￥1843<br />现组合价：￥549<p>立省：1294</p></li>
</ul>
<ul class="zt_slt clear zc mt">
<li><a href="http://www.shopin.net/promotion/5314.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/g1.jpg" width="465" height="136" alt="俏丽girl 清爽一夏" /></a></li>
<li><a href="http://www.shopin.net/promotion/5312.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/g2.jpg" width="465" height="136" alt="气质OL 干练优雅" /></a></li>
<li><a href="http://www.shopin.net/promotion/5268.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/g3.jpg" width="465" height="136" alt="凉鞋折扣季" /></a></li>
<li><a href="http://www.shopin.net/promotion/4911.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/g4.jpg" width="465" height="136" alt="夏日の姿态 休闲包包" /></a></li>
</ul>
<ul class="zt_llt clear zc mt">
<li><a href="http://www.shopin.net/lady/brands/112.html" target="_blank"><img src="http://images.shopin.net/images/brand/112_2.jpg" width="128" height="88" />1.6折起</a></li>
<li><a href="http://www.shopin.net/lady/brand/list-85/3.html" target="_blank"><img src="http://images.shopin.net/images/brand/85_2.jpg" width="128" height="88" />1.3-5折</a></li>
<li><a href="http://www.shopin.net/lady/brand/list-1672/1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1672_2.jpg" width="128" height="88" />2.6折起</a></li>
<li><a href="http://www.shopin.net/brands/969.html" target="_blank"><img src="http://images.shopin.net/images/brand/969_2.jpg" width="128" height="88" />2-5折</a></li>
<li><a href="http://www.shopin.net/shoes/brand/list-895/10.html" target="_blank"><img src="http://images.shopin.net/images/brand/895_2.jpg" width="128" height="88" />3折封</a></li>
<li><a href="http://www.shopin.net/handbags/brand/list-470/4.html" target="_blank"><img src="http://images.shopin.net/images/brand/470_2.jpg" width="128" height="88" />1.3-4折</a></li>
<li><a href="http://www.shopin.net/handbags/brands/621.html" target="_blank"><img src="http://images.shopin.net/images/brand/621_2.jpg" width="128" height="88" />4-5折</a></li>
<!--li><a href="http://www.shopin.net/handbags/brands/717.html" target="_blank"><img src="http://images.shopin.net/images/brand/717_2.jpg" width="128" height="88" />全场4.8折</a></li-->
</ul>
</div>
<div class="zt_title mt"><a class="zt_more" href="http://www.shopin.net/casual/list--1753--------.html" target="_blank">更多&gt;&gt;</a><h2 class="zt_na"><a href="http://www.shopin.net/casual/list--1785--------.html" target="_blank">潮款格子衫</a>　<a href="http://www.shopin.net/casual/list--1798--------.html" target="_blank">休闲短裤</a>　<a href="http://www.shopin.net/sports/list--1604--------1.html" target="_blank">跑步鞋</a>　<a href="http://www.shopin.net/handbags/list--1512--------.html" target="_blank">双肩背包</a>　<a href="http://www.shopin.net/handbags/list--1104--------1.html" target="_blank">钱包</a></h2></div>
<div class="zt_conts">
<ul class="zt_suit clear zc">
  <li class="zt_product"><a href="http://www.shopin.net/product/1174476.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/03/19/Pic1174476_30907_0_1.jpg" width="130" height="130" /><h3>苏格兰飞人男款格子衬衣</h3></a><del>￥389</del><em>￥86</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/863348.html" target="_blank"><img src="http://images.shopin.net/images/61/2010/11/30/Pic863348_14626_0_1.jpg" width="130" height="130" /><h3>九牧王男款休闲长裤</h3></a><del>￥579</del><em>￥163</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1231146.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/06/30/Pic1231146_90831_0_1.jpg" width="130" height="130" /><h3>哥雷夫男款休闲皮鞋</h3></a><del>￥918</del><em>￥340</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1624344.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/02/15/Pic1624344_20364_0_1.jpg" width="130" height="130" /><h3>暴龙经典飞行员眼镜</h3></a><del>￥976</del><em>￥464</em></li>
  <li class="zt_equal"></li>
  <li class="zt_result">原组合价：￥2862<br />现组合价：￥1053<p>立省：1809</p></li>
</ul>
<ul class="zt_suit clear zc">
  <li class="zt_product"><a href="http://www.shopin.net/product/1236639.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/06/01/Pic1236639_43604_0_1.jpg" width="130" height="130" /><h3>耐克男款简约POLO衫</h3></a><del>￥299</del><em>￥135</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1744183.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/04/13/Pic1744183_19767_0_1.jpg" width="130" height="130" /><h3>比利男款牛仔短裤</h3></a><del>￥416</del><em>￥183</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/1436036.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/09/27/Pic1436036_21658_0_1.jpg" width="130" height="130" /><h3>李宁时尚运动双肩包</h3></a><del>￥239</del><em>￥119</em></li>
  <li class="zt_plus"></li>
  <li class="zt_product"><a href="http://www.shopin.net/product/789338.html" target="_blank"><img src="http://images.shopin.net/images/61/2010/11/05/Pic789338_48433_0_1.jpg" width="130" height="130" /><h3>asics男款经典跑鞋</h3></a><del>￥998</del><em>￥399</em></li>
  <li class="zt_equal"></li>
  <li class="zt_result">原组合价：￥1952<br />现组合价：￥836<p>立省：1116</p></li>
</ul>
<ul class="zt_slt clear zc mt">
<li><a href="http://www.shopin.net/promotion/5337.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/b1.jpg" width="465" height="136" alt="衬衫+短裤 搭配更划算" /></a></li>
<li><a href="http://www.shopin.net/promotion/5260.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/b2.jpg" width="465" height="136" alt="运动精品" /></a></li>
<li><a href="http://www.shopin.net/promotion/5261.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/b3.jpg" width="465" height="136" alt="我的运动 我做主" /></a></li>
<li><a href="http://www.shopin.net/promotion/5270.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/b4.jpg" width="465" height="136" alt="专业户外 领导品牌" /></a></li>
</ul>
<ul class="zt_llt clear zc mt">
<li><a href="http://www.shopin.net/casual/brands/865.html" target="_blank"><img src="http://images.shopin.net/images/brand/865_2.jpg" width="128" height="88" />2.6-6折</a></li>
<li><a href="http://www.shopin.net/brand/list-2151/3.html" target="_blank"><img src="http://images.shopin.net/images/brand/2151_2.jpg" width="128" height="88" />2.6折起</a></li>
<li><a href="http://www.shopin.net/brand/list-280/5.html" target="_blank"><img src="http://images.shopin.net/images/brand/280_2.jpg" width="128" height="88" />4折起</a></li>
<li><a href="http://www.shopin.net/brands/537.html" target="_blank"><img src="http://images.shopin.net/images/brand/537_2.jpg" width="128" height="88" />3-7折</a></li>
<li><a href="http://www.shopin.net/brands/602.html" target="_blank"><img src="http://images.shopin.net/images/brand/602_2.jpg" width="128" height="88" />1折起</a></li>
<li><a href="http://www.shopin.net/brand/list-591/7.html" target="_blank"><img src="http://images.shopin.net/images/brand/591_2.jpg" width="128" height="88" />3-8折</a></li>
<li><a href="http://www.shopin.net/brand/list-586--------1-1.html" target="_blank"><img src="http://images.shopin.net/images/brand/586_2.jpg" width="128" height="88" />2.2折起</a></li>
<!--li><a href="http://www.shopin.net/list-485.html" target="_blank"><img src="http://images.shopin.net/images//brand/485_2.jpg" width="128" height="88" />2.5-4折</a></li-->
</ul>
</div>
<div class="mt zt_sale tc"><img src="http://images.shopin.net/images/ad/xiazhuang2/sale.png" width="313" height="30" align="middle" /></div>
<div class="zt_conts zt_t_none pb">
<div id="remainTime" class="zt_ct">
还剩：<span class="day" id="day">01</span>天<span class="hour" id="hour">23</span>小时<span class="mini" id="mini">45</span>分<span class="sec" id="sec">67</span>秒
<script language="javascript">
function _fresh(){
 var endtime=new Date("2012/07/02,23:59:59");//定义结束时间
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
<div class="zt_hd"><span></span>女装</div>
<div class="zt_bd">
  <ul class="prolist">
	<li><a href="http://www.shopin.net/product/1027167.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/03/01/Pic1027167_104920_0_1.jpg" /><h3>B.SIQI黑白波点收腰连衣裙</h3></a><del>￥820</del><em>￥129</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/312731.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/06/04/Pic312731_174632_0_1.jpg" /><h3>优歌新款雪纺印花连衣裙</h3></a><del>￥598</del><em>￥89</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/179130.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/04/13/Pic179130_9578_0_1.jpg" /><h3>皮尔卡丹典雅黄色绣花上衣</h3></a><del>￥1668</del><em>￥150</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/1237389.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/04/13/Pic1237389_3456_0_1.jpg" /><h3>HOPE SHOW流行花色连衣裙</h3></a><del>￥579</del><em>￥93</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/1299249.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/05/07/Pic1299249_123100_0_1.jpg" /><h3>HOPE huayin红色不规则剪裁连衣裙</h3></a><del>￥980</del><em>￥89</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/1079508.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/04/13/Pic1079508_1323_0_1.jpg" /><h3>秋水伊人明亮色彩雪纺裙</h3></a><del>￥626</del><em>￥99</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/1783739.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/04/27/Pic1783739_178146_0_1.jpg" /><h3>RBCA粉色雪纺百褶连衣裙</h3></a><del>￥529</del><em>￥129</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/1259252.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/03/28/Pic1259252_52302_0_1.jpg" /><h3>伟伦时尚印花拼接连衣裙</h3></a><del>￥598</del><em>￥129</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/1704058.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/04/20/Pic1704058_7192_0_1.jpg" /><h3>纳纹时尚大波点吊带雪纺裙</h3></a><del>￥566</del><em>￥129</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/1808269.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/05/11/Pic1808269_66159_0_1.jpg" /><h3>KLEIN PLUS+精致刺绣圆领娃娃衫</h3></a><del>￥490</del><em>￥80</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/1192907.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/05/07/Pic1192907_68388_0_1.jpg" /><h3>KLEIN Eneby雪纺碎花吊带裙</h3></a><del>￥589</del><em>￥89</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/1850946.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/06/10/Pic1850946_161779_0_1.jpg" /><h3>WAYONLY优雅蝴蝶结装饰连衣裙</h3></a><del>￥799</del><em>￥179</em><span class="cornermark"></span></li>
  </ul>
</div>
<div class="zt_hd mt"><span></span>女鞋</div>
<div class="zt_bd">
  <ul class="prolist">
	<li><a href="http://www.shopin.net/product/1234268.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/06/03/Pic1234268_15375_0_1.jpg" /><h3>莱尔斯丹蓝色小羊皮凉鞋</h3></a><del>￥898</del><em>￥199</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/351481.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/04/11/Pic351481_105219_0_1.jpg" /><h3>GALADAY小羊皮简约系带凉鞋</h3></a><del>￥698</del><em>￥198</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/1842911.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/06/04/Pic1842911_8675_0_1.jpg" /><h3>伊人民族风牛皮凉鞋</h3></a><del>￥798</del><em>￥209</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/1269134.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/07/05/Pic1269134_15374_0_1.jpg" /><h3>CNE真适意牛仔布凉鞋</h3></a><del>￥659</del><em>￥159</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/1099413.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/03/28/Pic1099413_97522_0_1.jpg" /><h3>卡美多进口油花布凉拖</h3></a><del>￥598</del><em>￥80</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/155822.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/05/19/Pic155822_15375_0_1.jpg" /><h3>莱尔斯丹黑色羊皮坡跟凉鞋</h3></a><del>￥858</del><em>￥239</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/570321.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/06/22/Pic570321_68204_0_1.jpg" /><h3>菲尔图金色豹纹凉鞋</h3></a><del>￥638</del><em>￥94</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/1189197.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/05/06/Pic1189197_12198_0_1.jpg" /><h3>红蜻蜓铆钉装饰罗马罗凉鞋</h3></a><del>￥798</del><em>￥99</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/1178338.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/06/03/Pic1178338_58824_0_1.jpg" /><h3>KUUKI小牛皮鱼嘴凉鞋</h3></a><del>￥669</del><em>￥99</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/396604.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/04/22/Pic396604_9076_0_1.jpg" /><h3>卡曼尼舒适牛皮凉拖</h3></a><del>￥498</del><em>￥91</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/1792888.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/05/09/Pic1792888_37024_0_1.jpg" /><h3>适步镂空装饰花休闲鱼嘴鞋</h3></a><del>￥668</del><em>￥128</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/1174693.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/05/03/Pic1174693_9371_0_1.jpg" /><h3>卡曼尼时髦厚底凉鞋</h3></a><del>￥690</del><em>￥150</em><span class="cornermark"></span></li>
  </ul>
</div>
<div class="zt_hd mt"><span></span>童装</div>
<div class="zt_bd">
  <ul class="prolist">
	<li><a href="http://www.shopin.net/product/1854509.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/06/11/Pic1854509_186239_0_1.jpg" /><h3>奥克汤姆经典款翻领格子裙</h3></a><del>￥198</del><em>￥58</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/160234.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/05/31/Pic160234_124094_0_1.jpg" /><h3>奥克汤姆纯棉套头衫（多色可选）</h3></a><del>￥129</del><em>￥44</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/1854478.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/06/11/Pic1854478_186238_0_1.jpg" /><h3>奥克汤姆中性格纹短裤</h3></a><del>￥118</del><em>￥34</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/1090975.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/04/10/Pic1090975_37673_0_1.jpg" /><h3>菲格咪妮圆领花边连衣裙</h3></a><del>￥298</del><em>￥47</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/209777.html" target="_blank"><img src="http://images.shopin.net/images/58/2010/06/28/Pic209777_47437_0_1.jpg" /><h3>菲格咪妮纯棉印花T恤</h3></a><del>￥238</del><em>￥49</em><span class="cornermark"></span></li>
	<li><a href="http://www.shopin.net/product/1277375.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/06/24/Pic1277375_220_0_1.jpg" /><h3>菲格咪妮纯棉蝴蝶结短裤</h3></a><del>￥268</del><em>￥79</em><span class="cornermark"></span></li>
  </ul>
</div>
<div class="tc mt mb"><a href="http://www.shopin.net/promotion/5349.html" target="_blank"><img src="http://images.shopin.net/images/ad/xiazhuang2/promotion.jpg" width="875" height="167" /></a></div>
</div>
</div>
</body>
</html>