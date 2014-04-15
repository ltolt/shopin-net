<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>支付宝活动页</title>
<link charset="utf-8" rel="stylesheet" href="https://hi.alipay.com/cms/common/css/base.css" media="all" />
<style type="text/css">
.wrap{
	margin:auto;
	width:950px;
}
.head{
	min-width:950px;
	height:35px;
	overflow:hidden;
	background-color:#85010f
}
.banner{
	min-width:950px;
	height:495px;
	background:url(http://images.shopin.net/images/ad/funvjie/banner.jpg) no-repeat center top;
}
.weibo{
	min-width:950px;
	height:392px;
	background:url(https://i.alipayobjects.com/e/201202/2CDleHEB7R.jpg) no-repeat center top;
}
.weibo .link{
	text-align:right;
	padding-right:22px;
	line-height:40px;
}
.weibo .link a{
	margin-left:20px;
	color:#e5c4b2;
	font-size:14px;
	text-decoration:underline;
}
.weibo .weiboiframe{
	width:576px;
	height:109px;
	overflow:hidden;
	position:absolute;
	margin:52px 0 0 340px;
	border-bottom:solid 1px #cccccc;
}
.tejia{
	min-width:950px;
	height:376px;
	background:url(https://i.alipayobjects.com/e/201202/2CDr6qwU0H.jpg) no-repeat center top;
}
.tejia .pro{
	position:absolute;
	margin:127px 0 0 328px;
	width:560px;
	overflow:hidden;
}
.tejia .pro .fn-left{
	margin-right:22px;
}
.tejia .pro .pic{
	border:solid 1px #eed3c6;
}
.tejia .pro .text{
	padding-top:40px;
	height:94px;
	color:#81563c;
	font-size:14px;
	line-height:28px;
}
.tejia .pro .text .del{
	text-decoration:line-through;
}
.tejia .pro .text .del .price{
	font-size:14px;
}
.tejia .pro .text .price{
	color:#7c0027;
	font-weight:bold;
	font-size:16px;
}
.tejia .pro .btn a{
	float:left;
	color:#316abe;
	font-size:14px;
	text-decoration:underline;
	margin-right:8px;
}
.tejia .pro .btn a.mt{
	padding-top:6px;
}

.prolist{
	min-width:950px;
	height:1130px;
	background:url(https://i.alipayobjects.com/e/201202/2CEHzQJdWL.jpg) no-repeat center top;
}
.prolist ul{
	padding:19px 0 0 30px;
}
.prolist li{
	float:left;
	width:130px;
	height:220px;
	overflow:hidden;
	border:solid 1px #b20136;
	background-color:#cbb0a1;
	margin:0 20px 30px 0;
	color:#81563c;
	line-height:24px;
	font-size:12px;
}
.prolist li .content{
	text-align:center
}
.prolist li .content .price{
	color:#7c0027;
	font-weight:bold;
	font-size:12px;
}
.prolist li .content .del{
	text-decoration:line-through;
	color:#666;
}
.pro-name { height:24px; overflow:hidden}
.prolist li a{
	color:#81563c;
}
.prolist li .content .btn{
	padding-top:2px;
}
.prolist li .content .btn a{
	color:#316abe;
	font-size:14px;
	text-decoration:underline;
}
.prolist li .content .btn a.mt{
	padding-top:4px;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<div class="head">
	<div class="wrap"><img src="https://i.alipayobjects.com/e/201202/2CDbTdsd4z.gif" /><img src="http://images.shopin.net/images/ad/funvjie/logo.png" /><img src="https://i.alipayobjects.com/e/201202/2CDbYIULqj.gif" /></div>
</div>
<div class="banner"></div>
<div class="weibo">
	<div class="wrap">
		<div class="weiboiframe">
			<iframe width="576" height="113"  frameborder="0" scrolling="no" src="http://widget.weibo.com/livestream/listlive.php?language=zh_cn&width=576&height=113&uid=1840056737&skin=1&refer=1&pic=1&titlebar=1&border=1&publish=1&atalk=1&recomm=0&at=0&atopic=%E6%88%91%E5%9C%A8%E4%B8%8A%E5%93%81%E6%8A%98%E6%89%A3%E7%BD%91%E4%B9%B0%E4%BA%86%E5%A5%BD%E5%A4%9A%E8%A1%A3%E6%9C%8D%20%E6%B1%82%E5%85%8D%E5%8D%95%40%E6%94%AF%E4%BB%98%E5%AE%9D&ptopic=%E6%88%91%E5%9C%A8%E4%B8%8A%E5%93%81%E6%8A%98%E6%89%A3%E7%BD%91%E4%B9%B0%E4%BA%86%E5%A5%BD%E5%A4%9A%E8%A1%A3%E6%9C%8D%20%E6%B1%82%E5%85%8D%E5%8D%95%40%E6%94%AF%E4%BB%98%E5%AE%9D&dpc=1"></iframe>
		</div>
		<div class="link">
			<a href="http://club.alipay.com/read-htm-tid-10701207.html" target="_blank">查看活动规则&gt;&gt;</a>
		</div>
	</div>
</div>
<div class="tejia">
	<div class="wrap">
		<div class="pro fn-clear">
			<div class="fn-left"><a href="http://www.shopin.net/product/1417912.html?cid=zfb38" target="_blank"><img src="http://images.shopin.net/images/68/2011/12/07/Pic1417912_68389_0.resize_to.400x400.jpg" width="256" height="223" class="pic" /></a></div>
			<div class="fn-left">
				<div class="text">
					<p>NAWO那沃通勤英伦手提包</p>
					<p><span class="del">原价：<em class="price">￥599</em></span>&nbsp;&nbsp;&nbsp;&nbsp;折扣价：<em class="price">￥113</em></p>
				</div>
				<div class="btn fn-clear">
					<a href="http://www.shopin.net/product/1417912.html?cid=zfb38"><img src="https://i.alipayobjects.com/e/201202/2CDwAHo5KD.gif" /></a>
					
				</div>
			</div>
		</div>
	</div>
</div>
<div class="prolist">
	<div class="wrap">
		<ul class="fn-clear">
			<li>
				<p><a href="http://www.shopin.net/product/1115844.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/08/24/Pic1115844_99671_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/1115844.html" target="_blank">GAINER女款薄款夹克</a></p>
					<p><span class="del price">￥498</span>&nbsp;折扣价:<em class="price">￥284</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/1115844.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/1021150.html" target="_blank"><img src="http://images.shopin.net/images//68/2011/09/26//Pic1021150_57012_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/1021150.html" target="_blank">F2FACE女款呢子大衣</a></p>
					<p><span class="del price">￥716</span>&nbsp;折扣价:<em class="price">￥166</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/1021150.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/782538.html" target="_blank"><img src="http://images.shopin.net/images//66/2011/03/01//Pic782538_56927_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/782538.html" target="_blank">F2FACE女款双排扣上衣</a></p>
					<p><span class="del price">￥369</span>&nbsp;折扣价:<em class="price">￥99</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/782538.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/1508964.html" target="_blank"><img src="http://images.shopin.net/images//61/2011/11/07//Pic1508964_108326_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/1508964.html" target="_blank">monchhichi女款活力外套</a></p>
					<p><span class="del price">￥1388</span>&nbsp;折扣价:<em class="price">￥638</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/1508964.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/983134.html" target="_blank"><img src="http://images.shopin.net/images//61/2011/02/09//Pic983134_22187_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/983134.html" target="_blank">罗宾汉女款经典牛仔外套</a></p>
					<p><span class="del price">￥299</span>&nbsp;折扣价:<em class="price">￥151</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/983134.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/979078.html" target="_blank"><img src="http://images.shopin.net/images//66/2011/01/28//Pic979078_68599_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/979078.html" target="_blank">罗宾汉女款复古牛仔外套</a></p>
					<p><span class="del price">￥399</span>&nbsp;折扣价:<em class="price">￥265</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/979078.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/1040131.html" target="_blank"><img src="http://images.shopin.net/images//61/2011/03/08//Pic1040131_57026_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/1040131.html" target="_blank">F2FACE女款休闲帽衫</a></p>
					<p><span class="del price">￥366</span>&nbsp;折扣价:<em class="price">￥98</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/1040131.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/1458634.html" target="_blank"><img src="http://images.shopin.net/images//66/2011/10/18//Pic1458634_148936_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/1458634.html" target="_blank">F2FACE女款休闲帽衫</a></p>
					<p><span class="del price">￥336</span>&nbsp;折扣价:<em class="price">￥82</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/1458634.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/1425529.html" target="_blank"><img src="http://images.shopin.net/images//58/2011/09/27//Pic1425529_81524_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/1425529.html" target="_blank">monchhichi女款可爱帽衫</a></p>
					<p><span class="del price">￥508</span>&nbsp;折扣价:<em class="price">￥233</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/1425529.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/1369904.html" target="_blank"><img src="http://images.shopin.net/images//58/2011/08/25//Pic1369904_81537_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/1369904.html" target="_blank">monchhichi女款可爱帽衫</a></p>
					<p><span class="del price">￥418</span>&nbsp;折扣价:<em class="price">￥218</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/1369904.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/1650460.html" target="_blank"><img src="http://images.shopin.net/images//58/2012/02/22//Pic1650460_22577_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/1650460.html" target="_blank">JASONWOOD女款经典灰色卫衣</a></p>
					<p><span class="del price">￥459</span>&nbsp;折扣价:<em class="price">￥184</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/1650460.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/918948.html" target="_blank"><img src="http://images.shopin.net/images//66/2011/03/07//Pic918948_57057_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/918948.html" target="_blank">F2FACE女款夹绒帽衫</a></p>
					<p><span class="del price">￥316</span>&nbsp;折扣价:<em class="price">￥79</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/918948.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/1464658.html" target="_blank"><img src="http://images.shopin.net/images//60/2011/10/17//Pic1464658_19931_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/1464658.html" target="_blank">卡斯彼龙女款浅蓝仔裤</a></p>
					<p><span class="del price">￥498</span>&nbsp;折扣价:<em class="price">￥237</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/1464658.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/886827.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/11/23/Pic886827_72507_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/886827.html" target="_blank">TEXWOOD女款直筒仔裤</a></p>
					<p><span class="del price">￥859</span>&nbsp;折扣价:<em class="price">￥399</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/886827.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/1395841.html" target="_blank"><img src="http://images.shopin.net/images//61/2011/03/03//Pic929677_99689_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/1395841.html" target="_blank">GAINER女款浅色经典仔裤</a></p>
					<p><span class="del price">￥428</span>&nbsp;折扣价:<em class="price">￥171</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/1395841.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/1546801.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/02/20/Pic1546801_20781_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/1546801.html" target="_blank">佐丹奴女款休闲仔裤</a></p>
					<p><span class="del price">￥260</span>&nbsp;折扣价:<em class="price">￥208</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/1546801.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/1452041.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/11/17/Pic1452041_22594_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/1452041.html" target="_blank">JASONWOOD女款紧身仔裤</a></p>
					<p><span class="del price">￥429</span>&nbsp;折扣价:<em class="price">￥215</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/1452041.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/1162001.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/04/27/Pic1162001_118370_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/1162001.html" target="_blank">比利女款窄脚牛仔长裤</a></p>
					<p><span class="del price">￥396</span>&nbsp;折扣价:<em class="price">￥141</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/1162001.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/1297484.html" target="_blank"><img src="http://images.shopin.net/images//61/2011/07/07//Pic1297484_15312_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/1297484.html" target="_blank">oxox女款休闲鞋</a></p>
					<p><span class="del price">￥758</span>&nbsp;折扣价:<em class="price">￥323</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/1297484.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/821273.html" target="_blank"><img src="http://images.shopin.net/images//61/2011/03/25//Pic821273_107392_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/821273.html" target="_blank">COEY女款真皮单鞋</a></p>
					<p><span class="del price">￥698</span>&nbsp;折扣价:<em class="price">￥184</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/821273.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/588915.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/04/14/Pic588915_115706_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/588915.html" target="_blank">CROCS女款帆布鞋</a></p>
					<p><span class="del price">￥399</span>&nbsp;折扣价:<em class="price">￥199</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/588915.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/1663369.html" target="_blank"><img src="http://images.shopin.net/images//58/2012/02/27//Pic1663369_49470_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/1663369.html" target="_blank">双星女款2012新品布鞋</a></p>
					<p><span class="del price">￥159</span>&nbsp;折扣价:<em class="price">￥95</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/1663369.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/1647221.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/02/22/Pic1647221_48654_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/1647221.html" target="_blank">CONVERSE2012新品帆布鞋</a></p>
					<p><span class="del price">￥329</span>&nbsp;折扣价:<em class="price">￥263</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/1647221.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
			<li>
				<p><a href="http://www.shopin.net/product/1118168.html" target="_blank"><img src="http://images.shopin.net/images//61/2011/04/21//Pic1118168_47576_0_1.jpg" /></a></p>
				<div class="content">
					<p class="pro-name"><a href="http://www.shopin.net/product/1118168.html" target="_blank">PONY女款帆布鞋</a></p>
					<p><span class="del price">￥329</span>&nbsp;折扣价:<em class="price">￥94</em></p>
					<p class="btn fn-clear">
						<a href="http://www.shopin.net/product/1118168.html" target="_blank"><img src="https://i.alipayobjects.com/e/201202/2CEOYWcLLN.gif" /></a>
					</p>
				</div>
			</li>
		</ul>
	</div>
</div>
</body>
</html>