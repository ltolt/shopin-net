<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>注册成为会员就获特供商品抢购特权!10.12-10.24</title>
<style>
#page{width:auto!important}
#header,.backgroundffffff{width:950px!important;margin:0 auto!important}
img{vertical-align:top}
.tc{text-align:center}
.mt{margin-top:10px}
.wrap{width:950px;margin:10px auto;background:#ea4609}
.guize{position:relative;padding:8px 0;text-align:center;background:#56b2bf;zoom:1;}
.guize a{position:absolute;top:89px}
.guize a.y{left:545px}
.guize a.n{left:668px}
.shiti{padding:15px 0; text-align:center; border:1px solid #dfd5cb; background:#fff;zoom:1;}
.shiti dt,.shiti dd{float:left}
.shiti dd img{display:block;width:84px;height:53px}
.shiti dt{width:160px}
.shiti dd{margin-left:12px}
/*tab*/
.tab-hd { height:30px; padding-left:5px; border-bottom:2px solid #F15930}
.tab-hd li { float:left; width:105px; margin:0 3px}
.tab-hd li a { display:block; line-height:30px; text-align:center; outline:none; color:#000;}
.tab-hd li.cur,.tab-hd li.cur a,.tab-hd li a:hover { font-weight:bold; background:#F15930; color:#fff}

/*product list*/
.prolist { width:100%; margin:5px 0 10px;overflow:hidden;}
.prolist li { position:relative; float:left; _display:inline; width:184px; height:276px; zoom:1; margin:0 0 8px 5px;cursor:pointer; font-size:14px;background:#; text-align:center}
.prolist .proinfo ,.prolist .proinbox { position:absolute; left:0; bottom:0;}
.prolist .proinfo {padding:6px 5px 0; width:174px; height:64px; z-index:2}
.prolist .proinbox { opacity:0.2; filter:alpha(opacity=20); width:184px; height:70px; background:#000;}
.prolist li h3 { height:20px; overflow:hidden; line-height:20px; font-weight:normal; color:#fff}
.prolist li a:hover ,.prolist li a:hover h3{ text-decoration:none; color:#f60}
.prolist li img { width:184px; height:206px}
.prolist li del {float:left;width:72px;text-align:left;font-size:12px;line-height:16px; color:#ccc}
.prolist li em {float:right;width:102px;text-align:right;line-height:32px;font-weight:600;color:#ff0}
.prolist li p { clear:both}

.bg{height:29px;line-height:32px;margin-top:6px;overflow:hidden;font-weight:600;text-indent:1em;background:url(http://images.shopin.net/images/ad/w_94.gif);}
/*alertbox*/
.alertbox{display:none;width:450px;padding:5px;position:absolute;z-index:101;background:#eee}
.alertboxhd{height:16px;text-align:right}
.alertinnr{padding:5px;border:3px solid #e85b14;background:#fff}
.alertform{line-height:24px;padding:10px}
.alertform li{ margin-bottom:5px}
.alertform label.formlabel { width:100px; display:inline-block; *display:inline; *zoom:1; text-align:right; vertical-align:top}
.alertform .coll{ display:inline-block; *display:inline; *zoom:1;}
.alertform .coll .form-text{width:250px;height:24px;line-height:24px;padding-left:3px;font-size:14px;border:1px solid #999;font-family:simsun}
.alertform .coll a{margin-left:8px}
.alertform .coll .tips{display:none;color:#f00}
#mask { position:absolute; top:0; left:0; background:#000; opacity:0.5; filter:alpha(opacity=50); display:none; z-index:99; }
.w100{width:60px!important;margin-right:5px}
</style>
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
     $(tabTit).children().click(function(){
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
<div class="wrap">
<img src="http://images.shopin.net/images/ad/yure/top-ad.jpg">
<div class="guize">
<img src="http://images.shopin.net/images/ad/yure/img1.jpg">
<a class="y" href="${ctx}/olduser.html" target="_blank"><img src="http://images.shopin.net/images/ad/yure/y.png"></a>
<a class="n" href="javascript:void(0);"><img src="http://images.shopin.net/images/ad/yure/n.png"></a>
</div>
<dl class="shiti clear">
	<dt><img src="http://images.shopin.net/images/i-444.gif"></dt>
  <dd><a href="http://www.shopin.cn/wfj/index.htm" target="_blank"><img src="http://images.shopin.net/images/i-2.jpg" alt="王府井店">王府井店</a></dd>
  <dd><a href="http://www.shopin.cn/yyc/index.htm" target="_blank"><img src="http://images.shopin.net/images/i-1.jpg" alt="亚运村店">亚奥旗舰店</a></dd>
  <dd><a href="http://www.shopin.cn/sht/index.htm" target="_blank"><img src="http://images.shopin.net/images/i-5.jpg" alt="首体店">首体店</a></dd>
  <dd><a href="http://www.shopin.cn/wks/index.htm" target="_blank"><img src="http://images.shopin.net/images/i-4.jpg" alt="五棵松店">五棵松店</a></dd>
  <dd><a href="http://www.shopin.cn/zhgc/index.htm" target="_blank"><img src="http://images.shopin.net/images/i-3.jpg" alt="中关村店">中关村店</a></dd>
  <dd><a href="http://www.shopin.cn/chym/index.htm" target="_blank"><img src="http://images.shopin.net/images/i-6.jpg" alt="朝阳门店">朝阳门店</a></dd>
  <dd><a href="http://www.shopin.cn/slh/index.htm" target="_blank"><img src="http://images.shopin.net/images/i-9.jpg" alt="三里河店">三里河店</a></dd>
  <dd><a target="_blank" href="http://www.shopin.cn/lgy/index.htm"><img alt="三里河店" src="http://images.shopin.net/images/ad/12231.jpg">来广营店</a></dd>
</dl>
<p class="mt" align="center"><img src="http://images.shopin.net/images/ad/yure/t2.png"></p>
<div class="wp mt">
	<ul class="tab-hd">
    <li class="cur"><a href="javascript:void(0);">亚运村店</a></li>
    <li><a href="javascript:void(0);">王府井店</a></li>
    <li><a href="javascript:void(0);">首体店</a></li>
    <li><a href="javascript:void(0);">五棵松店</a></li>
    <li><a href="javascript:void(0);">中关村店</a></li>
    <li><a href="javascript:void(0);">朝阳门店</a></li>
    <li><a href="javascript:void(0);">三里河店</a></li>
    <li><a href="javascript:void(0);">来广营店</a></li>
  </ul>
  <div class="tab-bd">
  	<div class="item">
      <ul class="prolist">
<li><img src="http://images.shopin.net/images/ad/yure/pro-1-20121011.jpg"><div class="proinfo"><h3>罗弗蒂奇男士夹克</h3><del>原价：￥1980<br>现价：￥150</del><em>明星价：￥99</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-2-20121011.jpg"><div class="proinfo"><h3>绅士男士衬衫</h3><del>原价：￥420<br>现价：￥128</del><em>明星价：￥29</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-6-20121011.jpg"><div class="proinfo"><h3>Nike男鞋</h3><del>原价：￥589<br>现价：￥589</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-7-20121011.jpg"><div class="proinfo"><h3>Nike女鞋</h3><del>原价：￥589<br>现价：￥589</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-8-20121011.jpg"><div class="proinfo"><h3>金羽杰女款羽绒服</h3><del>原价：￥1323<br>现价：￥586</del><em>明星价：￥99</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-9-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥1980<br>现价：￥298</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-14-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥1980<br>现价：￥298</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-17-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-18-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-19-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-20-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-50-20121011.jpg"><div class="proinfo"><h3>哥伦比亚男士三合一冲锋衣</h3><del>原价：￥1999<br>现价：￥1699</del><em>明星价：￥999</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-51-20121011.jpg"><div class="proinfo"><h3>哥伦比亚男士三合一冲锋衣</h3><del>原价：￥1999<br>现价：￥1699</del><em>明星价：￥999</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-23-20121011.jpg"><div class="proinfo"><h3>TheNorthFace全拉链抓绒衣</h3><del>原价：￥698<br>现价：￥593</del><em>明星价：￥299</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-28-20121011.jpg"><div class="proinfo"><h3>米连诺女士牛皮休闲鞋</h3><del>原价：￥768<br>现价：￥468</del><em>明星价：￥129</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-29-20121011.jpg"><div class="proinfo"><h3>米连诺女士牛皮休闲鞋</h3><del>原价：￥768<br>现价：￥468</del><em>明星价：￥129</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-36-20121011.jpg"><div class="proinfo"><h3>米连诺女士牛皮休闲鞋</h3><del>原价：￥768<br>现价：￥468</del><em>明星价：￥129</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-37-20121011.jpg"><div class="proinfo"><h3>米连诺女士牛皮休闲鞋</h3><del>原价：￥768<br>现价：￥468</del><em>明星价：￥129</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-34-20121011.jpg"><div class="proinfo"><h3>沙驰男士牛皮休闲鞋</h3><del>原价：￥1280<br>现价：￥640</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-35-20121011.jpg"><div class="proinfo"><h3>沙驰男士牛皮休闲鞋</h3><del>原价：￥1280<br>现价：￥640</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-33-20121011.jpg"><div class="proinfo"><h3>沙驰男士牛皮休闲鞋</h3><del>原价：￥1480<br>现价：￥888</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-38-20121011.jpg"><div class="proinfo"><h3>Crocs猛犸系列</h3><del>原价：￥359<br>现价：￥150</del><em>明星价：￥99</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-55-20121011.jpg"><div class="proinfo"><h3>鹿王男士羊绒衫</h3><del>原价：￥1680<br>现价：￥759</del><em>明星价：￥399</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-56-20121011.jpg"><div class="proinfo"><h3>鹿王男士羊绒衫</h3><del>原价：￥1680<br>现价：￥759</del><em>明星价：￥399</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-54-20121011.jpg"><div class="proinfo"><h3>鹿王男士羊绒衫</h3><del>原价：￥1680<br>现价：￥759</del><em>明星价：￥399</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-53-20121011.jpg"><div class="proinfo"><h3>鹿王男士羊绒衫</h3><del>原价：￥1680<br>现价：￥759</del><em>明星价：￥399</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-22-20121011.jpg"><div class="proinfo"><h3>鹿王女士羊绒衫</h3><del>原价：￥1480<br>现价：￥499</del><em>明星价：￥299</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-58-20121011.jpg"><div class="proinfo"><h3>鹿王女士羊绒衫</h3><del>原价：￥1480<br>现价：￥499</del><em>明星价：￥299</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-39-20121011.jpg"><div class="proinfo"><h3>世王莫代尔男式背心</h3><del>原价：￥196<br>现价：￥50</del><em>明星价：￥9.9</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-40-20121011.jpg"><div class="proinfo"><h3>莱卡女式背心</h3><del>原价：￥78<br>现价：￥39</del><em>明星价：￥9.9</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-41-20121011.jpg"><div class="proinfo"><h3>爱尼梦舟四孔枕芯</h3><del>原价：￥80<br>现价：￥28</del><em>明星价：￥19</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-59-20121011.jpg"><div class="proinfo"><h3>富安娜七孔被</h3><del>原价：￥768<br>现价：￥537</del><em>明星价：￥229</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-01-20121018.jpg"><div class="proinfo"><h3>ELLE 深V聚拢修身内衣套装</h3><del>原价：￥436<br>现价：￥142</del><em>明星价：￥68</em></div><div class="proinbox"></div></li>
      </ul>
    </div>
    <div class="item">
      <ul class="prolist">
<li><img src="http://images.shopin.net/images/ad/yure/pro-1-20121011.jpg"><div class="proinfo"><h3>罗弗蒂奇男士夹克</h3><del>原价：￥1980<br>现价：￥150</del><em>明星价：￥99</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-6-20121011.jpg"><div class="proinfo"><h3>Nike男鞋</h3><del>原价：￥589<br>现价：￥589</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-7-20121011.jpg"><div class="proinfo"><h3>Nike女鞋</h3><del>原价：￥589<br>现价：￥589</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-17-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-18-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-19-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-20-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-50-20121011.jpg"><div class="proinfo"><h3>哥伦比亚男士三合一冲锋衣</h3><del>原价：￥1999<br>现价：￥1699</del><em>明星价：￥999</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-51-20121011.jpg"><div class="proinfo"><h3>哥伦比亚男士三合一冲锋衣</h3><del>原价：￥1999<br>现价：￥1699</del><em>明星价：￥999</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-52-20121011.jpg"><div class="proinfo"><h3>哥伦比亚男士三合一冲锋衣</h3><del>原价：￥1999<br>现价：￥1699</del><em>明星价：￥999</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-26-20121011.jpg"><div class="proinfo"><h3>哥伦比亚半拉链抓绒衣</h3><del>原价：￥439<br>现价：￥373</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-27-20121011.jpg"><div class="proinfo"><h3>哥伦比亚半拉链抓绒衣</h3><del>原价：￥439<br>现价：￥373</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-53-20121011.jpg"><div class="proinfo"><h3>鹿王男士羊绒衫</h3><del>原价：￥1680<br>现价：￥759</del><em>明星价：￥399</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-54-20121011.jpg"><div class="proinfo"><h3>鹿王男士羊绒衫</h3><del>原价：￥1680<br>现价：￥759</del><em>明星价：￥399</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-55-20121011.jpg"><div class="proinfo"><h3>鹿王男士羊绒衫</h3><del>原价：￥1680<br>现价：￥759</del><em>明星价：￥399</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-56-20121011.jpg"><div class="proinfo"><h3>鹿王男士羊绒衫</h3><del>原价：￥1680<br>现价：￥759</del><em>明星价：￥399</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-22-20121011.jpg"><div class="proinfo"><h3>鹿王女士羊绒衫</h3><del>原价：￥1480<br>现价：￥499</del><em>明星价：￥299</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-58-20121011.jpg"><div class="proinfo"><h3>鹿王女士羊绒衫</h3><del>原价：￥1480<br>现价：￥499</del><em>明星价：￥299</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-01-20121018.jpg"><div class="proinfo"><h3>ELLE 深V聚拢修身内衣套装</h3><del>原价：￥436<br>现价：￥142</del><em>明星价：￥68</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-02-20121018.jpg"><div class="proinfo"><h3>GUESS	女士手袋</h3><del>原价：￥1090<br>现价：￥436</del><em>明星价：￥299</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-03-20121018.jpg"><div class="proinfo"><h3>GUESS	女士手袋</h3><del>原价：￥890<br>现价：￥356</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-04-20121018.jpg"><div class="proinfo"><h3>KISS CAT 时尚女靴</h3><del>原价：￥1380<br>现价：￥399</del><em>明星价：￥159</em></div><div class="proinbox"></div></li>
      </ul>
    </div>
    <div class="item">
      <ul class="prolist">
<li><img src="http://images.shopin.net/images/ad/yure/pro-3-20121011.jpg"><div class="proinfo"><h3>NIKE女款T恤</h3><del>原价：￥299<br>现价：￥89</del><em>明星价：￥39</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-5-20121011.jpg"><div class="proinfo"><h3>NIKE男款T恤</h3><del>原价：￥299<br>现价：￥89</del><em>明星价：￥40</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-9-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥1980<br>现价：￥298</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-14-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥1980<br>现价：￥298</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-17-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-18-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-19-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-20-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-50-20121011.jpg"><div class="proinfo"><h3>哥伦比亚男士三合一冲锋衣</h3><del>原价：￥1999<br>现价：￥1699</del><em>明星价：￥999</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-51-20121011.jpg"><div class="proinfo"><h3>哥伦比亚男士三合一冲锋衣</h3><del>原价：￥1999<br>现价：￥1699</del><em>明星价：￥999</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-52-20121011.jpg"><div class="proinfo"><h3>哥伦比亚男士三合一冲锋衣</h3><del>原价：￥1999<br>现价：￥1699</del><em>明星价：￥999</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-26-20121011.jpg"><div class="proinfo"><h3>哥伦比亚半拉链抓绒衣</h3><del>原价：￥439<br>现价：￥373</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-27-20121011.jpg"><div class="proinfo"><h3>哥伦比亚半拉链抓绒衣</h3><del>原价：￥439<br>现价：￥373</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-57-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-01-20121018.jpg"><div class="proinfo"><h3>ELLE 深V聚拢修身内衣套装</h3><del>原价：￥436<br>现价：￥142</del><em>明星价：￥68</em></div><div class="proinbox"></div></li>
      </ul>
    </div>
    <div class="item">
      <ul class="prolist">
<li><img src="http://images.shopin.net/images/ad/yure/pro-2-20121011.jpg"><div class="proinfo"><h3>绅士男士衬衫</h3><del>原价：￥420<br>现价：￥128</del><em>明星价：￥29</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-3-20121011.jpg"><div class="proinfo"><h3>NIKE女款T恤</h3><del>原价：￥299<br>现价：￥89</del><em>明星价：￥39</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-5-20121011.jpg"><div class="proinfo"><h3>NIKE男款T恤</h3><del>原价：￥299<br>现价：￥89</del><em>明星价：￥40</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-9-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥1980<br>现价：￥298</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-14-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥1980<br>现价：￥298</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-17-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-18-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-19-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-20-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-50-20121011.jpg"><div class="proinfo"><h3>哥伦比亚男士三合一冲锋衣</h3><del>原价：￥1999<br>现价：￥1699</del><em>明星价：￥999</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-51-20121011.jpg"><div class="proinfo"><h3>哥伦比亚男士三合一冲锋衣</h3><del>原价：￥1999<br>现价：￥1699</del><em>明星价：￥999</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-23-20121011.jpg"><div class="proinfo"><h3>TheNorthFace全拉链抓绒衣</h3><del>原价：￥698<br>现价：￥593</del><em>明星价：￥299</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-28-20121011.jpg"><div class="proinfo"><h3>米连诺女士牛皮休闲鞋</h3><del>原价：￥768<br>现价：￥468</del><em>明星价：￥129</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-29-20121011.jpg"><div class="proinfo"><h3>米连诺女士牛皮休闲鞋</h3><del>原价：￥768<br>现价：￥468</del><em>明星价：￥129</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-36-20121011.jpg"><div class="proinfo"><h3>米连诺女士牛皮休闲鞋</h3><del>原价：￥768<br>现价：￥468</del><em>明星价：￥129</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-37-20121011.jpg"><div class="proinfo"><h3>米连诺女士牛皮休闲鞋</h3><del>原价：￥768<br>现价：￥468</del><em>明星价：￥129</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-31-20121011.jpg"><div class="proinfo"><h3>reebok鞋</h3><del>原价：￥59<br>现价：￥119</del><em>明星价：￥69</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-32-20121011.jpg"><div class="proinfo"><h3>reebok鞋</h3><del>原价：￥598<br>现价：￥119</del><em>明星价：￥69</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-34-20121011.jpg"><div class="proinfo"><h3>沙驰男士牛皮休闲鞋</h3><del>原价：￥1280<br>现价：￥640</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-35-20121011.jpg"><div class="proinfo"><h3>沙驰男士牛皮休闲鞋</h3><del>原价：￥1280<br>现价：￥640</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-33-20121011.jpg"><div class="proinfo"><h3>沙驰男士牛皮休闲鞋</h3><del>原价：￥1480<br>现价：￥888</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-38-20121011.jpg"><div class="proinfo"><h3>Crocs猛犸系列</h3><del>原价：￥359<br>现价：￥150</del><em>明星价：￥99</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-54-20121011.jpg"><div class="proinfo"><h3>鹿王男士羊绒衫</h3><del>原价：￥1680<br>现价：￥759</del><em>明星价：￥399</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-55-20121011.jpg"><div class="proinfo"><h3>鹿王男士羊绒衫</h3><del>原价：￥1680<br>现价：￥759</del><em>明星价：￥399</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-56-20121011.jpg"><div class="proinfo"><h3>鹿王男士羊绒衫</h3><del>原价：￥1680<br>现价：￥759</del><em>明星价：￥399</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-53-20121011.jpg"><div class="proinfo"><h3>鹿王男士羊绒衫</h3><del>原价：￥1680<br>现价：￥759</del><em>明星价：￥399</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-22-20121011.jpg"><div class="proinfo"><h3>鹿王女士羊绒衫</h3><del>原价：￥1480<br>现价：￥499</del><em>明星价：￥299</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-58-20121011.jpg"><div class="proinfo"><h3>鹿王女士羊绒衫</h3><del>原价：￥1480<br>现价：￥499</del><em>明星价：￥299</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-24-20121011.jpg"><div class="proinfo"><h3>帕兰朵三层里外纯棉保暖内衣</h3><del>原价：￥198<br>现价：￥50</del><em>明星价：￥28</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-39-20121011.jpg"><div class="proinfo"><h3>世王莫代尔男式背心</h3><del>原价：￥196<br>现价：￥50</del><em>明星价：￥9.9</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-40-20121011.jpg"><div class="proinfo"><h3>莱卡女式背心</h3><del>原价：￥78<br>现价：￥39</del><em>明星价：￥9.9</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-01-20121018.jpg"><div class="proinfo"><h3>ELLE 深V聚拢修身内衣套装</h3><del>原价：￥436<br>现价：￥142</del><em>明星价：￥68</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-04-20121018.jpg"><div class="proinfo"><h3>KISS CAT 时尚女靴</h3><del>原价：￥1380<br>现价：￥399</del><em>明星价：￥159</em></div><div class="proinbox"></div></li>
      </ul>
    </div>
    <div class="item">
      <ul class="prolist">
<li><img src="http://images.shopin.net/images/ad/yure/pro-8-20121011.jpg"><div class="proinfo"><h3>金羽杰女款羽绒服</h3><del>原价：￥1323<br>现价：￥586</del><em>明星价：￥99</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-11-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥2480<br>现价：￥289</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-16-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥2480<br>现价：￥289</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-9-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥1980<br>现价：￥298</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-14-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥1980<br>现价：￥298</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-17-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-18-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-19-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-20-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-50-20121011.jpg"><div class="proinfo"><h3>哥伦比亚男士三合一冲锋衣</h3><del>原价：￥1999<br>现价：￥1699</del><em>明星价：￥999</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-51-20121011.jpg"><div class="proinfo"><h3>哥伦比亚男士三合一冲锋衣</h3><del>原价：￥1999<br>现价：￥1699</del><em>明星价：￥999</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-52-20121011.jpg"><div class="proinfo"><h3>哥伦比亚男士三合一冲锋衣</h3><del>原价：￥1999<br>现价：￥1699</del><em>明星价：￥999</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-26-20121011.jpg"><div class="proinfo"><h3>哥伦比亚半拉链抓绒衣</h3><del>原价：￥439<br>现价：￥373</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-27-20121011.jpg"><div class="proinfo"><h3>哥伦比亚半拉链抓绒衣</h3><del>原价：￥439<br>现价：￥373</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-38-20121011.jpg"><div class="proinfo"><h3>Crocs猛犸系列</h3><del>原价：￥359<br>现价：￥150</del><em>明星价：￥99</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-24-20121011.jpg"><div class="proinfo"><h3>帕兰朵三层里外纯棉保暖内衣</h3><del>原价：￥198<br>现价：￥50</del><em>明星价：￥28</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-01-20121018.jpg"><div class="proinfo"><h3>ELLE 深V聚拢修身内衣套装</h3><del>原价：￥436<br>现价：￥142</del><em>明星价：￥68</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-04-20121018.jpg"><div class="proinfo"><h3>KISS CAT 时尚女靴</h3><del>原价：￥1380<br>现价：￥399</del><em>明星价：￥159</em></div><div class="proinbox"></div></li>
      </ul>
    </div>
    <div class="item">
      <ul class="prolist">
<li><img src="http://images.shopin.net/images/ad/yure/pro-2-20121011.jpg"><div class="proinfo"><h3>绅士男士衬衫</h3><del>原价：￥420<br>现价：￥128</del><em>明星价：￥29</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-10-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥2480<br>现价：￥289</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-13-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥2480<br>现价：￥289</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-9-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥1980<br>现价：￥298</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-14-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥1980<br>现价：￥298</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-17-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-18-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-19-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-20-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-50-20121011.jpg"><div class="proinfo"><h3>哥伦比亚男士三合一冲锋衣</h3><del>原价：￥1999<br>现价：￥1699</del><em>明星价：￥999</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-51-20121011.jpg"><div class="proinfo"><h3>哥伦比亚男士三合一冲锋衣</h3><del>原价：￥1999<br>现价：￥1699</del><em>明星价：￥999</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-52-20121011.jpg"><div class="proinfo"><h3>哥伦比亚男士三合一冲锋衣</h3><del>原价：￥1999<br>现价：￥1699</del><em>明星价：￥999</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-57-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-22-20121011.jpg"><div class="proinfo"><h3>鹿王女士羊绒衫</h3><del>原价：￥1480<br>现价：￥499</del><em>明星价：￥299</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-58-20121011.jpg"><div class="proinfo"><h3>鹿王女士羊绒衫</h3><del>原价：￥1480<br>现价：￥499</del><em>明星价：￥299</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-24-20121011.jpg"><div class="proinfo"><h3>帕兰朵三层里外纯棉保暖内衣</h3><del>原价：￥198<br>现价：￥50</del><em>明星价：￥28</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-01-20121018.jpg"><div class="proinfo"><h3>ELLE 深V聚拢修身内衣套装</h3><del>原价：￥436<br>现价：￥142</del><em>明星价：￥68</em></div><div class="proinbox"></div></li>
      </ul>
    </div>
    <div class="item">
      <ul class="prolist">
<li><img src="http://images.shopin.net/images/ad/yure/pro-1-20121011.jpg"><div class="proinfo"><h3>罗弗蒂奇男士夹克</h3><del>原价：￥1980<br>现价：￥150</del><em>明星价：￥99</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-2-20121011.jpg"><div class="proinfo"><h3>绅士男士衬衫</h3><del>原价：￥420<br>现价：￥128</del><em>明星价：￥29</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-6-20121011.jpg"><div class="proinfo"><h3>Nike男鞋</h3><del>原价：￥589<br>现价：￥589</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-11-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥2480<br>现价：￥289</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-16-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥2480<br>现价：￥289</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-12-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥2860<br>现价：￥572</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-15-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥2860<br>现价：￥572</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-9-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥1980<br>现价：￥298</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-14-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥1980<br>现价：￥298</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-17-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-18-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-19-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-20-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-50-20121011.jpg"><div class="proinfo"><h3>哥伦比亚男士三合一冲锋衣</h3><del>原价：￥1999<br>现价：￥1699</del><em>明星价：￥999</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-51-20121011.jpg"><div class="proinfo"><h3>哥伦比亚男士三合一冲锋衣</h3><del>原价：￥1999<br>现价：￥1699</del><em>明星价：￥999</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-26-20121011.jpg"><div class="proinfo"><h3>哥伦比亚半拉链抓绒衣</h3><del>原价：￥439<br>现价：￥373</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-27-20121011.jpg"><div class="proinfo"><h3>哥伦比亚半拉链抓绒衣</h3><del>原价：￥439<br>现价：￥373</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-23-20121011.jpg"><div class="proinfo"><h3>TheNorthFace全拉链抓绒衣</h3><del>原价：￥698<br>现价：￥593</del><em>明星价：￥299</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-28-20121011.jpg"><div class="proinfo"><h3>米连诺女士牛皮休闲鞋</h3><del>原价：￥768<br>现价：￥468</del><em>明星价：￥129</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-29-20121011.jpg"><div class="proinfo"><h3>米连诺女士牛皮休闲鞋</h3><del>原价：￥768<br>现价：￥468</del><em>明星价：￥129</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-36-20121011.jpg"><div class="proinfo"><h3>米连诺女士牛皮休闲鞋</h3><del>原价：￥768<br>现价：￥468</del><em>明星价：￥129</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-37-20121011.jpg"><div class="proinfo"><h3>米连诺女士牛皮休闲鞋</h3><del>原价：￥768<br>现价：￥468</del><em>明星价：￥129</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-34-20121011.jpg"><div class="proinfo"><h3>沙驰男士牛皮休闲鞋</h3><del>原价：￥1280<br>现价：￥640</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-35-20121011.jpg"><div class="proinfo"><h3>沙驰男士牛皮休闲鞋</h3><del>原价：￥1280<br>现价：￥640</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-54-20121011.jpg"><div class="proinfo"><h3>鹿王男士羊绒衫</h3><del>原价：￥1680<br>现价：￥759</del><em>明星价：￥399</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-55-20121011.jpg"><div class="proinfo"><h3>鹿王男士羊绒衫</h3><del>原价：￥1680<br>现价：￥759</del><em>明星价：￥399</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-56-20121011.jpg"><div class="proinfo"><h3>鹿王男士羊绒衫</h3><del>原价：￥1680<br>现价：￥759</del><em>明星价：￥399</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-53-20121011.jpg"><div class="proinfo"><h3>鹿王男士羊绒衫</h3><del>原价：￥1680<br>现价：￥759</del><em>明星价：￥399</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-22-20121011.jpg"><div class="proinfo"><h3>鹿王女士羊绒衫</h3><del>原价：￥1480<br>现价：￥499</del><em>明星价：￥299</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-58-20121011.jpg"><div class="proinfo"><h3>鹿王女士羊绒衫</h3><del>原价：￥1480<br>现价：￥499</del><em>明星价：￥299</em></div><div class="proinbox"></div></li>
      </ul>
    </div>
    <div class="item">
      <ul class="prolist">
<li><img src="http://images.shopin.net/images/ad/yure/pro-1-20121011.jpg"><div class="proinfo"><h3>罗弗蒂奇男士夹克</h3><del>原价：￥1980<br>现价：￥150</del><em>明星价：￥99</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-2-20121011.jpg"><div class="proinfo"><h3>绅士男士衬衫</h3><del>原价：￥420<br>现价：￥128</del><em>明星价：￥29</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-6-20121011.jpg"><div class="proinfo"><h3>Nike男鞋</h3><del>原价：￥589<br>现价：￥589</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-10-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥2480<br>现价：￥289</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-13-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥2480<br>现价：￥289</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-12-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥2860<br>现价：￥572</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-15-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥2860<br>现价：￥572</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-9-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥1980<br>现价：￥298</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-14-20121011.jpg"><div class="proinfo"><h3>帕古茨男士夹克</h3><del>原价：￥1980<br>现价：￥298</del><em>明星价：￥119</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-17-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-18-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-19-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-20-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-50-20121011.jpg"><div class="proinfo"><h3>哥伦比亚男士三合一冲锋衣</h3><del>原价：￥1999<br>现价：￥1699</del><em>明星价：￥999</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-51-20121011.jpg"><div class="proinfo"><h3>哥伦比亚男士三合一冲锋衣</h3><del>原价：￥1999<br>现价：￥1699</del><em>明星价：￥999</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-57-20121011.jpg"><div class="proinfo"><h3>哥伦比亚全拉链抓绒衣</h3><del>原价：￥499<br>现价：￥424</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-34-20121011.jpg"><div class="proinfo"><h3>沙驰男士牛皮休闲鞋</h3><del>原价：￥1280<br>现价：￥640</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-35-20121011.jpg"><div class="proinfo"><h3>沙驰男士牛皮休闲鞋</h3><del>原价：￥1280<br>现价：￥640</del><em>明星价：￥199</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-54-20121011.jpg"><div class="proinfo"><h3>鹿王男士羊绒衫</h3><del>原价：￥1680<br>现价：￥759</del><em>明星价：￥399</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-55-20121011.jpg"><div class="proinfo"><h3>鹿王男士羊绒衫</h3><del>原价：￥1680<br>现价：￥759</del><em>明星价：￥399</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-56-20121011.jpg"><div class="proinfo"><h3>鹿王男士羊绒衫</h3><del>原价：￥1680<br>现价：￥759</del><em>明星价：￥399</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-53-20121011.jpg"><div class="proinfo"><h3>鹿王男士羊绒衫</h3><del>原价：￥1680<br>现价：￥759</del><em>明星价：￥399</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-58-20121011.jpg"><div class="proinfo"><h3>鹿王女士羊绒衫</h3><del>原价：￥1480<br>现价：￥499</del><em>明星价：￥299</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-22-20121011.jpg"><div class="proinfo"><h3>鹿王女士羊绒衫</h3><del>原价：￥1480<br>现价：￥499</del><em>明星价：￥299</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-24-20121011.jpg"><div class="proinfo"><h3>帕兰朵三层里外纯棉保暖内衣</h3><del>原价：￥198<br>现价：￥50</del><em>明星价：￥28</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-41-20121011.jpg"><div class="proinfo"><h3>爱尼梦舟四孔枕芯</h3><del>原价：￥80<br>现价：￥28</del><em>明星价：￥19</em></div><div class="proinbox"></div></li>
<li><img src="http://images.shopin.net/images/ad/yure/pro-59-20121011.jpg"><div class="proinfo"><h3>富安娜七孔被</h3><del>原价：￥标准：768、加大：858<br>现价：￥标准：537、加大：600</del><em>明星价：￥229</em></div><div class="proinbox"></div></li>
      </ul>
    </div>
  </div>
</div>
<p align="center"><img src="http://images.shopin.net/images/ad/yure/t1.png"></p>
<p class="bg">LEE 3折起</p>
<p><a href="http://www.shopin.net/promotion/4879.html" target="_blank"><img src="http://images.shopin.net/images//promotions/201209251415291.jpg"></a></p>
<p class="bg">JIMANNO 3折封</p>
<p><a href="http://www.shopin.net/promotion/3462.html" target="_blank"><img src="http://images.shopin.net/images//promotions/201210101758371.jpg"></a></p>
<p class="bg">红袖 2-4折</p>
<p><a href="http://www.shopin.net/promotion/5285.html" target="_blank"><img src="http://images.shopin.net/images//promotions/201210101758531.jpg"></a></p>
<p class="bg">JC COLLFZIONE 低至2.4折</p>
<p><a href="http://www.shopin.net/promotion/5916.html" target="_blank"><img src="http://images.shopin.net/images//promotions/201210111513111.jpg"></a></p>
<p class="bg">百丽旗下靴子专场 2-5折</p>
<p><a href="http://www.shopin.net/promotion/6123.html" target="_blank"><img src="http://images.shopin.net/images//promotions/201210101744151.jpg"></a></p>
<p class="bg">男人皮衣专场 2折</p>
<p><a href="http://www.shopin.net/promotion/4063.html" target="_blank"><img src="http://images.shopin.net/images//promotions/201210101744011.jpg"></a></p>
<p class="bg">THE NORTH FACE 5折</p>
<p><a href="http://www.shopin.net/promotion/5702.html" target="_blank"><img src="http://images.shopin.net/images//promotions/201210081826061.jpg"></a></p>
<p class="bg">Jack Wolfskin 4-7折</p>
<p><a href="http://www.shopin.net/promotion/5051.html" target="_blank"><img src="http://images.shopin.net/images//promotions/201210111512471.jpg"></a></p>
<p class="bg">打底裤专场 ￥27起</p>
<p><a href="http://www.shopin.net/promotion/5925.html" target="_blank"><img src="http://images.shopin.net/images//promotions/201209061716161.jpg"></a></p>
</div>
<div id="mask" class="mask"></div>
<div id="alertTips" class="alertbox">
	<div class="alertinnr" style="text-align:center">
  	<div class="alertboxhd"><a class="close" href="javascript:void(0);" title="关闭"><img src="http://images.shopin.net/images/ad/yure/close.png"></a></div>
    <a class="y" href="${ctx}/olduser.html" target="_blank"><img src="http://images.shopin.net/images/ad/yure/y-b.png"></a>
    <a class="n" href="javascript:void(0);"><img src="http://images.shopin.net/images/ad/yure/n-b.png"></a>
	</div>
</div>
<div id="alertForm" class="alertbox">
	<div class="alertinnr">
  	<div class="alertboxhd"><a class="close" href="javascript:void(0);" title="关闭"><img src="http://images.shopin.net/images/ad/yure/close.png"></a></div>
    <div class="alertform">
    	<form action='${ctx}/dqregister.html' method='post' id="register_form">
      	    <input type="hidden" id="forward" name="forward" value="${forward}">
         <ul>
        	<li><label class="formlabel">Email地址：</label><div class="coll" id="username_div"><input class="form-text" type="text" name="memEmail" id="username"  onBlur="validateUsername()"><p class="tips"></p></div></li>
        	<li><label class="formlabel">手机号码：</label><div class="coll" id="mobile_div"><input class="form-text" type="text" name="iptMobile" id="mobile" maxlength="11" onBlur="validateMobile()"><p class="tips"></p></div></li>
        	<li><label class="formlabel">设置密码：</label><div class="coll" id="password_div"><input class="form-text" type="password" name="memPwd"  id="password" onBlur="validatePassword()"><p class="tips"></p></div></li>
        	<li><label class="formlabel">确认密码：</label><div class="coll" id="confirm_password_div"><input class="form-text" type="password" name="iptUser" id="confirm_password" onBlur="validateConfirmPassword()"><p class="tips"></p></div></li>
        	<li><label class="formlabel">验证码：</label><div class="coll" id="verifycode_div"><input type="text" class="form-text w100" name="j_captcha" maxlength="5" id="verifycode"><img id="captchaImg" src="${ctx}/jcaptcha.jpg"/>
                  <div><a href="javascript:refreshCaptcha()">看不清楚换一个</a></div><p class="tips"></p></div></li>
          <li><label class="formlabel"></label><div class="coll"><img src="http://images.shopin.net/images/y-m002.gif" onClick="doRegister();"></div></li>
        	<li><label class="formlabel"></label><div class="coll"><label><input type="checkbox" checked><a href="http://www.shopin.net/goRegister.html" target="_blank">上品折扣网服务协议</a></label></div></li>
        </ul>
      </form>
    </div>
	</div>
</div>
<script>
    var verifyCodeIsValid=false;
    var usernameIsValid=false;
    <%--校验邮箱地址--%>
    function validateUsername(){

        var username=$.trim($('#username').val());
        if(username==''){
           verifyCodeIsValid=false;
           $('#username_div .tips')
                   .show().html('<span style=\'color:#ff0000;font-size:12px\'>邮箱地址不能为空</span>');
           return;
        }
        var valid=/^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(username);
        if(!valid){
           verifyCodeIsValid=false;
           $('#username_div .tips')
                   .show().html('<span style=\'color:#ff0000;font-size:12px\'>邮箱地址不正确</span>');
            return;
        }

        $.ajax({
                url:'${ctx}/validateEmail.json',
                type: 'post',
                dataType: 'json',
                data:{'email':username},
                timeout: 30000,
                error: function(){
                    usernameIsValid=false;
                    $('#username_div .tips')
                            .show().html('<span style=\'color:#ff0000;font-size:12px\'>邮箱地址已经存在,请换一个</span>');
                },
                success: function(response){
                    var result=response.result;
                    if(result.status=='1'){
                      usernameIsValid=true;
                    }else{
                      usernameIsValid=false;
                    }
                    $('#username_div .tips')
                              .show().html('<span style=\'color:#ff0000;font-size:12px\'>'+result.message+'</span>');
                }
         });
    }
    function validateMobile(){
        var mobile=$.trim($('#mobile').val());
        if(mobile==''){
           verifyCodeIsValid=false;
           $('#mobile_div .tips')
                   .show().html('<span style=\'color:#ff0000;font-size:12px\'>手机号不能为空</span>');
           return;
        }
        var valid=/^1\d{10}$/.test(mobile);
        if(!valid){
           verifyCodeIsValid=false;
           $('#mobile_div .tips')
                   .show().html('<span style=\'color:#ff0000;font-size:12px\'>手机号不正确</span>');
            return;
        }else{
           $('#mobile_div .tips').show().html('');
        }

        $.ajax({
                url:'${ctx}/validateMobile.json',
                type: 'post',
                dataType: 'json',
                data:{'type':"mobile",'q':mobile},
                timeout: 30000,
                error: function(){
                    usernameIsValid=false;
                    $('#mobile_div .tips')
                            .show().html('<span style=\'color:#ff0000;font-size:12px\'></span>');
                },
                success: function(response){
                    var result=response.result;
                    if(result.status=="03"){
                        usernameIsValid=false;
                    }
                    $('#mobile_div .tips')
                            .show().html('<span style=\'color:#ff0000;font-size:12px\'>'+result.message+'</span>');
                }

         });
        return true;
    }

    <%--校验密码--%>
    function validatePassword(){
        var password=$.trim($('#password').val());
        if(password.length<6){
           $('#password_div .tips')
                   .show().html('<span style=\'color:#ff0000;font-size:12px\'>密码输入不正确</span>');
            return false;
        }
        $('#password_div .tips').empty();
        return true;
    }
    <%--校验重复密码--%>
    function validateConfirmPassword(){
        var password=$.trim($('#password').val());
        var confirm_password=$('#confirm_password').val();
        if(password!==confirm_password){
           $('#confirm_password_div .tips')
                  .show().html('<span style=\'color:#ff0000;font-size:12px\'>两次密码输入不一致</span>');
            return false;
        }
        $('#confirm_password_div .tips').empty();
        return true;
    }

    <%--校验输入的用户名和密码,验证码--%>
    function validate(){
        var flag=true;
        if(!usernameIsValid){
            if($.trim($('#username').val())==''){
               $('#username_div .tips')
                       .show().html('<span style=\'color:#ff0000;font-size:12px\'>邮箱地址不能为空</span>');
            }
            flag=false;
        }
        if(!validatePassword()){
            flag=false;
        }
        if(!validateConfirmPassword()){
            flag=false;
        }
        if(!validateMobile()){
            flag=false;
        }

        if($('#verifycode').val()==''){
               $('#verifycode_div .tips')
                      .show().html('<span style=\'color:#ff0000;font-size:12px\'>验证码不能为空</span>');
                 flag=false;
        }else{
              $('#verifycode_div .tips')
                      .show().html('<span style=\'color:#ff0000;font-size:12px\'></span>');
        }
        return flag;
    }
     <%
        Cookie[] cookies = request.getCookies();
        String cid = "";
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("cid")) cid = cookies[i].getValue();
        }

    %>
    <%--注册--%>
    function doRegister(){
        if(!validate()){
            return;
        }
        <%
        if (cid.startsWith("ad-baidu")) {
        %>
        TrackSuccess();
        <%
        }
    		%>
        $("#register_form").get(0).submit();
    }
<%--刷新验证码--%>
    function refreshCaptcha(){
		$('#captchaImg').attr('src',"${ctx}/jcaptcha.jpg?"+Math.round(Math.random()*100000));
	}

$(function(){
	//获得焦点改变边框色

//弹出层
	$('.prolist li,.n').click(function(){
		$('#mask').show();
		$("#mask").css("height",$(document).height());
		$("#mask").css("width",$(window).width());
	});
	$(".prolist li").click(function(){
		center($('#alertTips'));
		})
	$(".n").click(function(){
		center($('#alertForm'));
		})
	// 居中
	function center(obj) {
	var screenWidth = $(window).width(), screenHeight = $(window).height(); //当前浏览器窗口的 宽高
	var scrolltop = $(document).scrollTop();//获取当前窗口距离页面顶部高度
	var objLeft = (screenWidth - obj.width())/2 ;
	var objTop = (screenHeight - obj.height())/2 + scrolltop;
	obj.css({left: objLeft + 'px', top: objTop + 'px','display': 'block'});
	}
	$("#mask,.close").click(function(){
		$(".alertbox,#mask").hide();
		});
});
</script>
</body>
</html>