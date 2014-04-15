<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>11月5日即将开抢！上品折扣"双11"光棍节,万款冬品血拼价疯抢!直降10%!</title>
<style>
img{ vertical-align:top}
.clear:after { height:0; clear:both; content:"."; visibility:hidden; display:block;}
.zm{zoom:1}
#page{width:100%!important;padding:0!important}
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
.proArea{float:left;width:452px;height:444px;overflow:;padding:0;margin:0 0 6px 9px;_display:inline;border:1px solid #d1001b}
.proArea .prolist{margin:0;padding:0}
.proArea .prolist li{margin-left:14px}
.proArea .prolist li em {text-decoration:none}
/*product list end*/
.saleList{margin:12px 0 0 2px}
.saleList li{float:left;margin-left:4px}
.vitList{margin-left:6px}
.vitList li{float:left;width:472px}
#t_select{ visibility:hidden}
/*alert box*/
#dialog .dialogHd, #dialog .dialogHd h3, #dialog .dialogHd a, #dialog .dialogHd a:hover, #dialog .dialogForm .formBtn{background-image:url(http://images.shopin.net/images/dialog.png);background-repeat:no-repeat}
#dialog{position:fixed;z-index:999;width:450px;display:none;border:1px solid #888;background:#fff;}
#dialog .dialogHd{height:30px;overflow:hidden;cursor:move;border-bottom:1px solid #ccc;background-position:0 -60px;background-repeat:repeat-x;}
#dialog .dialogHd h3{line-height:30px;padding-left:40px;background-position:0 0;color:#d64820}
#dialog .dialogHd a{float:right;width:30px;height:30px;line-height:100px;margin-top:-30px;background-position:10px -90px;outline:none}
#dialog .dialogHd a:hover{background-position:-11px -90px}
#dialog .dialogBd{padding:30px 10px;line-height:26px;}
#dialog .dialogForm li{margin-bottom:6px}
#dialog .dialogForm li.dialogHli {margin-top:10px;text-align:center}
#dialog .dialogForm .dialogLabel{width:110px;display:inline-block;*display:inline;*zoom:1;text-align:right;vertical-align:top;color:#666}
#dialog .dialogForm .coll{display:inline-block;*display:inline;*zoom:1;}
#dialog .dialogForm .coll .zxm{ text-decoration:underline; color:#00f}
#dialog .dialogForm .formText{width:196px;height:14px;margin-right:5px;padding:5px 3px;font-size:14px;border:1px solid #aaa}
#dialog .dialogForm .vcode{width:60px!important;margin-right:5px}
#dialog .dialogForm .formBtn{width:80px;height:30px;line-height:30px;cursor:pointer;font-weight:bold;border:0;color:#d64820;background-position:0 -30px;}
#dialog .dialogForm .tips{height:20px;line-height:16px;color:#f00}
#mask { position:absolute; top:0; left:0; background:#000; opacity:0.5; filter:alpha(opacity=50); display:none; z-index:99; }
/*alert box end*/
</style>
<%
    Cookie[] cookies = request.getCookies();
    boolean flag = false;
    for (int i = 0; i < cookies.length; i++) {
        if (cookies[i].getName().equals("hasverify")) flag=true;
    }
    if(!flag){
%>
<script>
 //点击事件
	$(function(){
		lockScreen();
		center($("#dialog"));
		//点击确定关闭锁定层
//		$(".btnOk").click(function(){
//			$(".mask,#dialog").hide();
//		});
		$(".dialogClose").click(function(){
			window.close();
		});
	});
</script>

<%
    }
%>

<script>
    //验证光棍节会员专项码的事件
    function   commitCode(button){

          var  xpCode = $("input[name='xpCode']").val();
          $.ajax({
                        url:'${ctx}/verifyXPCode.json',
                        type: 'post',
                        dataType: 'json',
                        data:{'xpCode':xpCode},
                        timeout: 30000,
                        error: function() {
                           $('#codetips .tips')
                                .show().html('<span style=\'color:#ff0000\'>输入超时请重试</span>');

                            return;
                        },
                        success: function(response) {
                        var result = response.result;
                        var status = result.status;
                        var message = result.message;
                        if (status && status == '1') {
                           setcookie("hasverify","true",43200,"/","shopin.net","");
                     		$(".mask,#dialog").hide();
                        }else{
                            $('#codetips .tips')
                                .show().text('验证码不存在');
                        }
                        return;
                    }
         });
    }

     <%--定义一个向Cookie写入的函数
      @param button   @author kongming  new create
      --%>
    function setcookie(cookieName, cookieValue, seconds, path, domain, secure) {
    cookiedomain = 'shopin.net', cookiepath = '/';
    var expires = new Date();
    if(cookieValue == '' || seconds < 0) {
        cookieValue = '';
        seconds = -2592000;
    }
    expires.setTime(expires.getTime() + seconds * 1000);
    domain = !domain ? cookiedomain : domain;
    path = !path ? cookiepath : path;
    document.cookie = escape( cookieName) + '=' + escape(cookieValue)
        + (expires ? '; expires=' + expires.toGMTString() : '')
        + (path ? '; path=' + path : '/')
        + (domain ? '; domain=' + domain : '')
        + (secure ? '; secure' : '');
        }

	// 居中
	function center(obj) {
	var screenWidth = $(window).width(), screenHeight = $(window).height(); //当前浏览器窗口的 宽高
	var scrolltop = $(window).scrollTop();//获取当前窗口距离页面顶部高度
	var objLeft = (screenWidth - obj.width())/2 ;
	var objTop = (screenHeight - obj.height())/2 + scrolltop;
	obj.css({left: objLeft + 'px', top: objTop + 'px','display': 'block'});
	}
	//遮罩层
	//遮罩层
	function lockScreen(){
		$('#mask').show();
		$("#mask").css("height",$(document).height());
		$("#mask").css("width",$(window).width());
	};


</script>
</head>

<body>
<div class="box">
	<img src="http://images.shopin.net/images/ad/shuang11/top-1102-ad1.jpg"><img src="http://images.shopin.net/images/ad/shuang11/top-1102-ad2.jpg"><img src="http://images.shopin.net/images/ad/shuang11/top-1102-ad3.jpg" usemap="#Map">
  <map name="Map">
    <area shape="rect" coords="650,38,927,137" href="http://www.shopin.net/help/zfb1210.html" target="_blank">
    <area shape="rect" coords="365,38,643,136" href="http://www.shopin.net/help/manzeng.html" target="_blank">
  </map>
  <img src="http://images.shopin.net/images/ad/shuang11/t3.png">
  <!--ul class="prolist clear zm">
<li><a><img src="http://images.shopin.net/images/66/2012/05/30/Pic1836710_94263_0_1.jpg" /><h3>罗弗蒂奇男士夹克</h3></a><del>￥1980</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a><img src="http://images.shopin.net/images/66/2012/10/13/Pic2078622_134903_0_1.jpg" /><h3>帕古茨男士夹克</h3></a><del>￥2480</del><em>￥289</em><span class="cornermark">￥119</span></li>
<li><a><img src="http://images.shopin.net/images/63/2012/09/25/Pic2038911_11965_0_1.jpg" /><h3>米连诺女士牛皮休闲鞋</h3></a><del>￥768</del><em>￥468</em><span class="cornermark">￥129</span></li>
<li><a><img src="http://images.shopin.net/images/60/2012/10/30/Pic2085900_74894_0_1.jpg" /><h3>Crocs猛犸系列男士休闲鞋</h3></a><del>￥359</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a><img src="http://images.shopin.net/images/61/2011/10/28/Pic922144_139168_0_1.jpg" /><h3>鹿王男士羊绒衫</h3></a><del>￥1680</del><em>￥759</em><span class="cornermark">￥399</span></li>
<li><a><img src="http://images.shopin.net/images/58/2011/12/14/Pic962347_141720_0_1.jpg" /><h3>鹿王女士羊绒衫</h3></a><del>￥1480</del><em>￥499</em><span class="cornermark">￥299</span></li>
<li><a><img src="http://images.shopin.net/images/61/2011/10/27/Pic1494915_48660_0_1.jpg" /><h3>veilond羊毛收腰小外套</h3></a><del>￥918</del><em>￥302</em><span class="cornermark">￥181</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/05/Pic2008375_123118_0_1.jpg" /><h3>huayin单排扣羊毛大衣</h3></a><del>￥1280</del><em>￥398</em><span class="cornermark">￥171</span></li>
<li><a><img src="http://images.shopin.net/images/60/2012/02/09/Pic1376970_1323_0_1.jpg" /><h3>秋水伊人双排扣装饰风衣</h3></a><del>￥716</del><em>￥272</em><span class="cornermark">￥161</span></li>
<li><a><img src="http://images.shopin.net/images/60/2010/12/10/Pic780887_24086_0_1.jpg" /><h3>IVRESSE中长款羊毛大衣</h3></a><del>￥1780</del><em>￥200</em><span class="cornermark">￥161</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/17/Pic2025348_3416_0_1.jpg" /><h3>红袖腰带装饰风衣</h3></a><del>￥799</del><em>￥239</em><span class="cornermark">￥161</span></li>
<li><a><img src="http://images.shopin.net/images/58/2011/11/28/Pic1536407_53557_0_1.jpg" /><h3>圣三利短款羽绒服</h3></a><del>￥3680</del><em>￥600</em><span class="cornermark">￥541</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/05/Pic2018555_77543_0_1.jpg" /><h3>KELIYA男士100%羊毛衫</h3></a><del>￥798</del><em>￥94</em><span class="cornermark">￥71</span></li>
<li><a><img src="http://images.shopin.net/images/60/2012/01/06/Pic1587142_154803_0_1.jpg" /><h3>蒙丹米尔女士100%羊绒开衫</h3></a><del>￥1360</del><em>￥380</em><span class="cornermark">￥141</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/18/Pic2038770_153757_0_1.jpg" /><h3>蒙派男士100%羊毛衫</h3></a><del>￥896</del><em>￥94</em><span class="cornermark">￥71</span></li>
<li><a><img src="http://images.shopin.net/images/68/2012/09/24/Pic2052344_201416_0_1.jpg" /><h3>洋宾燕斑马纹羊毛连衣裙</h3></a><del>￥980</del><em>￥199</em><span class="cornermark">￥141</span></li>
<li><a><img src="http://images.shopin.net/images/60/2011/10/10/Pic1462257_8605_0_1.jpg" /><h3>菲尔图牛皮长靴</h3></a><del>￥1380</del><em>￥413</em><span class="cornermark">￥299</span></li>
<li><a><img src="http://images.shopin.net/images/60/2012/09/01/Pic1996262_196076_0_1.jpg" /><h3>柯里卡貉子毛领棉服</h3></a><del>￥2190</del><em>￥600</em><span class="cornermark">￥300</span></li>
  </ul-->
  <ul class="prolist clear zm">
<li><a href="http://www.shopin.net/product/1836710.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/05/30/Pic1836710_94263_0_1.jpg" /><h3>罗弗蒂奇男士夹克</h3></a><del>￥1980</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/2078622.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/13/Pic2078622_134903_0_1.jpg" /><h3>帕古茨男士夹克</h3></a><del>￥2480</del><em>￥289</em><span class="cornermark">￥119</span></li>
<li><a href="http://www.shopin.net/product/2038911.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/09/25/Pic2038911_11965_0_1.jpg" /><h3>米连诺女士牛皮休闲鞋</h3></a><del>￥768</del><em>￥468</em><span class="cornermark">￥129</span></li>
<li><a href="http://www.shopin.net/product/2085900.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/30/Pic2085900_74894_0_1.jpg" /><h3>Crocs猛犸系列男士休闲鞋</h3></a><del>￥359</del><em>￥150</em><span class="cornermark">￥99</span></li>
<li><a href="http://www.shopin.net/product/922144.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/10/28/Pic922144_139168_0_1.jpg" /><h3>鹿王男士羊绒衫</h3></a><del>￥1680</del><em>￥759</em><span class="cornermark">￥399</span></li>
<li><a href="http://www.shopin.net/product/962347.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/12/14/Pic962347_141720_0_1.jpg" /><h3>鹿王女士羊绒衫</h3></a><del>￥1480</del><em>￥499</em><span class="cornermark">￥299</span></li>
<li><a href="http://www.shopin.net/product/1494915.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/10/27/Pic1494915_48660_0_1.jpg" /><h3>veilond羊毛收腰小外套</h3></a><del>￥918</del><em>￥302</em><span class="cornermark">￥181</span></li>
<li><a href="http://www.shopin.net/product/2008375.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/05/Pic2008375_123118_0_1.jpg" /><h3>huayin单排扣羊毛大衣</h3></a><del>￥1280</del><em>￥398</em><span class="cornermark">￥171</span></li>
<li><a href="http://www.shopin.net/product/1376970.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/02/09/Pic1376970_1323_0_1.jpg" /><h3>秋水伊人双排扣装饰风衣</h3></a><del>￥716</del><em>￥272</em><span class="cornermark">￥161</span></li>
<li><a href="http://www.shopin.net/product/780887.html" target="_blank"><img src="http://images.shopin.net/images/60/2010/12/10/Pic780887_24086_0_1.jpg" /><h3>IVRESSE中长款羊毛大衣</h3></a><del>￥1780</del><em>￥200</em><span class="cornermark">￥161</span></li>
<li><a href="http://www.shopin.net/product/2025348.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/17/Pic2025348_3416_0_1.jpg" /><h3>红袖腰带装饰风衣</h3></a><del>￥799</del><em>￥239</em><span class="cornermark">￥161</span></li>
<li><a href="http://www.shopin.net/product/1536407.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/11/28/Pic1536407_53557_0_1.jpg" /><h3>圣三利短款羽绒服</h3></a><del>￥3680</del><em>￥600</em><span class="cornermark">￥541</span></li>
<li><a href="http://www.shopin.net/product/2018555.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/05/Pic2018555_77543_0_1.jpg" /><h3>KELIYA男士100%羊毛衫</h3></a><del>￥798</del><em>￥94</em><span class="cornermark">￥71</span></li>
<li><a href="http://www.shopin.net/product/1587142.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/01/06/Pic1587142_154803_0_1.jpg" /><h3>蒙丹米尔女士100%羊绒开衫</h3></a><del>￥1360</del><em>￥380</em><span class="cornermark">￥141</span></li>
<li><a href="http://www.shopin.net/product/2038770.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/18/Pic2038770_153757_0_1.jpg" /><h3>蒙派男士100%羊毛衫</h3></a><del>￥896</del><em>￥94</em><span class="cornermark">￥71</span></li>
<li><a href="http://www.shopin.net/product/2052344.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/24/Pic2052344_201416_0_1.jpg" /><h3>洋宾燕斑马纹羊毛连衣裙</h3></a><del>￥980</del><em>￥199</em><span class="cornermark">￥141</span></li>
<li><a href="http://www.shopin.net/product/1462257.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/10/10/Pic1462257_8605_0_1.jpg" /><h3>菲尔图牛皮长靴</h3></a><del>￥1380</del><em>￥413</em><span class="cornermark">￥299</span></li>
<li><a href="http://www.shopin.net/product/1996262.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/09/01/Pic1996262_196076_0_1.jpg" /><h3>柯里卡貉子毛领棉服</h3></a><del>￥2190</del><em>￥600</em><span class="cornermark">￥300</span></li>
  </ul>
  <img src="http://images.shopin.net/images/ad/shuang11/t2.png">
  <div class="saleArea clear zm">
    <ul class="tlist">
      <li><a href="http://www.shopin.net/promotion/5285.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1102-01.jpg"></a></li>
      <li><a href="http://www.shopin.net/promotion/6129.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1102-02.jpg"></a></li>
      <li><a href="http://www.shopin.net/promotion/6266.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1102-03.jpg"></a></li>
      <li><a href="http://www.shopin.net/promotion/6169.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic-1102-04.jpg"></a></li>
    </ul>
    <p class="tcp"><img src="http://images.shopin.net/images/ad/shuang11/t4.png" width="918"></p>
    <div class="proArea">
      <ul class="prolist">
<li><a href="http://www.shopin.net/product/2062224.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic2062224_178146_0_1.jpg" /><h3>RBCA时尚双排扣连帽大衣</h3></a><del>￥1398</del><em>￥238</em></li>
<li><a href="http://www.shopin.net/product/1344640.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/29/Pic1344640_3351_0_1.jpg" /><h3>HOPE SHOW狐狸毛领短款毛呢外套</h3></a><del>￥1249</del><em>￥249</em></li>
<li><a href="http://www.shopin.net/product/1570637.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/12/20/Pic1570637_63494_0_1.jpg" /><h3>阿尤中国风印花棉服</h3></a><del>￥659</del><em>￥238</em></li>
<li><a href="http://www.shopin.net/product/1554830.html" target="_blank"><img src="http://images.shopin.net/images/68/2011/12/07/Pic1554830_73734_0_1.jpg" /><h3>纳纹羊毛烫钻印花针织衫</h3></a><del>￥716</del><em>￥99</em></li>
<li><a href="http://www.shopin.net/product/1549382.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/29/Pic1549382_67175_0_1.jpg" /><h3>无色无味纯棉舒适棉服</h3></a><del>￥1380</del><em>￥524</em></li>
<li><a href="http://www.shopin.net/product/80958.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/29/Pic80958_24118_0_1.jpg" /><h3>IVRESSE时尚毛呢双排扣大衣</h3></a><del>￥1780</del><em>￥200</em></li>
      </ul>
    	<ul class="saleList">
      	<li><a href="http://www.shopin.net/lady/list---0.32-0.41-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale41.png"></a></li>
      	<li><a href="http://www.shopin.net/lady/list---0.22-0.31-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale31.png"></a></li>
      	<li><a href="http://www.shopin.net/lady/list---0.12-0.21-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale21.png"></a></li>
      	<li><a href="http://www.shopin.net/lady/list---0.01-0.11-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale11.png"></a></li>
      </ul>
    </div>
    <div class="proArea">
      <ul class="prolist">
<li><a href="http://www.shopin.net/product/1432843.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/09/23/Pic1432843_11123_0_1.jpg" /><h3>红蜻蜓头层牛皮靴子</h3></a><del>￥1059</del><em>￥269</em></li>
<li><a href="http://www.shopin.net/product/1517337.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/11/09/Pic1517337_8590_0_1.jpg" /><h3>卡曼尼牛皮短靴</h3></a><del>￥980</del><em>￥279</em></li>
<li><a href="http://www.shopin.net/product/1717603.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/09/12/Pic1717603_13310_0_1.jpg" /><h3>TATA羊皮兔毛靴子</h3></a><del>￥1199</del><em>￥359</em></li>
<li><a href="http://www.shopin.net/product/1508421.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/08/24/Pic1508421_15375_0_1.jpg" /><h3>莱尔斯丹反绒面短靴</h3></a><del>￥1398</del><em>￥359</em></li>
<li><a href="http://www.shopin.net/product/1544266.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/09/11/Pic1544266_13075_0_1.jpg" /><h3>天美意羊皮长靴</h3></a><del>￥1899</del><em>￥449</em></li>
<li><a href="http://www.shopin.net/product/1554622.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/12/09/Pic1554622_8234_0_1.jpg" /><h3>策乐男款牛皮单鞋</h3></a><del>￥668</del><em>￥144</em></li>
      </ul>
    	<ul class="saleList">
      	<li><a href="http://www.shopin.net/shoes/list---0.32-0.41-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale41.png"></a></li>
      	<li><a href="http://www.shopin.net/shoes/list---0.22-0.31-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale31.png"></a></li>
      	<li><a href="http://www.shopin.net/shoes/list---0.12-0.21-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale21.png"></a></li>
      	<li><a href="http://www.shopin.net/shoes/list---0.02-0.11-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale11.png"></a></li>
      </ul>
    </div>
    <div class="proArea">
      <ul class="prolist">
<li><a href="http://www.shopin.net/product/962347.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/12/14/Pic962347_141720_0_1.jpg" /><h3>鹿王100%山羊绒衫</h3></a><del>￥1480</del><em>￥449</em></li>
<li><a href="http://www.shopin.net/product/2062374.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/08/Pic2062374_202556_0_1.jpg" /><h3>洋宾燕时尚花纹羊绒衫</h3></a><del>￥1280</del><em>￥269</em></li>
<li><a href="http://www.shopin.net/product/2051596.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/24/Pic2051596_159502_0_1.jpg" /><h3>蒙派花朵款羊绒衫</h3></a><del>￥1099</del><em>￥169</em></li>
<li><a href="http://www.shopin.net/product/2009540.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/08/28/Pic2009540_78972_0_1.jpg" /><h3>KELIYA女款羊绒衫</h3></a><del>￥1980</del><em>￥256</em></li>
<li><a href="http://www.shopin.net/product/2053634.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/25/Pic2053634_201912_0_1.jpg" /><h3>戎立特100%山羊绒衫</h3></a><del>￥1260</del><em>￥397</em></li>
<li><a href="http://www.shopin.net/product/2042394.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/09/25/Pic2042394_200743_0_1.jpg" /><h3>雪莲男款100%山羊绒衫</h3></a><del>￥2398</del><em>￥734</em></li>
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
<li><a href="http://www.shopin.net/product/1910060.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/07/16/Pic1910060_187287_0_1.jpg" /><h3>OURSHINE长款白鸭绒羽绒服</h3></a><del>￥788</del><em>￥298</em></li>
<li><a href="http://www.shopin.net/product/1479452.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/29/Pic1479452_76477_0_1.jpg" /><h3>雅鹿貉子毛领羽绒服</h3></a><del>￥1929</del><em>￥575</em></li>
<li><a href="http://www.shopin.net/product/1532047.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic1532047_151252_0_1.jpg" /><h3>Kazelaze貉子毛领白鸭绒收腰羽绒服</h3></a><del>￥748</del><em>￥398</em></li>
<li><a href="http://www.shopin.net/product/1555932.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic1555932_157399_0_1.jpg" /><h3>聊黛部儿短款亮面鸭绒羽绒服</h3></a><del>￥698</del><em>￥188</em></li>
<li><a href="http://www.shopin.net/product/1497373.html" target="_blank"><img src="http://images.shopin.net/images/68/2011/11/17/Pic1497373_148805_0_1.jpg" /><h3>MODO GAGA长款羽绒服</h3></a><del>￥1598</del><em>￥478</em></li>
<li><a href="http://www.shopin.net/product/1335823.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/12/22/Pic1335823_152886_0_1.jpg" /><h3>花花公子男士羽绒服</h3></a><del>￥1533</del><em>￥598</em></li>
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
<li><a href="http://www.shopin.net/product/926311.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/01/18/Pic926311_60392_0_1.jpg" /><h3>雅戈尔商务休闲棉服</h3></a><del>￥1880</del><em>￥380</em></li>
<li><a href="http://www.shopin.net/product/128452.html" target="_blank"><img src="http://images.shopin.net/images/58/2010/11/12/Pic128452_91139_0_1.jpg" /><h3>吉诺里兹针织衫</h3></a><del>￥1280</del><em>￥120</em></li>
<li><a href="http://www.shopin.net/product/1723853.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/04/19/Pic1723853_134904_0_1.jpg" /><h3>帕古茨秋冬款外套</h3></a><del>￥2480</del><em>￥289</em></li>
<li><a href="http://www.shopin.net/product/1630431.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/02/15/Pic1630431_18398_0_1.jpg" /><h3>奥古利奥纯棉衬衫</h3></a><del>￥980</del><em>￥98</em></li>
<li><a href="http://www.shopin.net/product/1529624.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/10/Pic1529624_154101_0_1.jpg" /><h3>爱尔爱司休闲棉服</h3></a><del>￥1599</del><em>￥278</em></li>
<li><a href="http://www.shopin.net/product/638447.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/01/11/Pic638447_15311_0_1.jpg" /><h3>蒙漫侬商务休闲长裤</h3></a><del>￥620</del><em>￥87</em></li>
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
<li><a href="http://www.shopin.net/product/1634646.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/09/29/Pic1634646_62850_0_1.jpg" /><h3>Baleno男士秋冬外套</h3></a><del>￥429</del><em>￥99</em></li>
<li><a href="http://www.shopin.net/product/2047425.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/09/24/Pic2047425_51335_0_1.jpg" /><h3>LEE牛仔长裤</h3></a><del>￥890</del><em>￥390</em></li>
<li><a href="http://www.shopin.net/product/1011642.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/08/10/Pic1011642_112194_0_1.jpg" /><h3>悦仕内搭纯棉帽衫</h3></a><del>￥398</del><em>￥76</em></li>
<li><a href="http://www.shopin.net/product/2047495.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/09/24/Pic2047495_51335_0_1.jpg" /><h3>LEE牛仔长裤</h3></a><del>￥890</del><em>￥390</em></li>
<li><a href="http://www.shopin.net/product/1370745.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/08/24/Pic1370745_81524_0_1.jpg" /><h3>monchhichi女士纯棉帽衫</h3></a><del>￥658</del><em>￥229</em></li>
<li><a href="http://www.shopin.net/product/2047169.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/10/08/Pic2047169_51335_0_1.jpg" /><h3>LEE牛仔长裤428-3260</h3></a><del>￥590</del><em>￥296</em></li>
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
<li><a href="http://www.shopin.net/product/1602857.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/09/25/Pic1602857_48029_0_1.jpg" /><h3>NIKE男式舒适跑鞋</h3></a><del>￥869</del><em>￥387</em></li>
<li><a href="http://www.shopin.net/product/1659348.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/08/04/Pic1659348_29071_0_1.jpg" /><h3>NIKE女式舒适跑鞋</h3></a><del>￥829</del><em>￥646</em></li>
<li><a href="http://www.shopin.net/product/1537934.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/12/26/Pic1537934_48014_0_1.jpg" /><h3>ADIDAS男式时尚板鞋</h3></a><del>￥660</del><em>￥297</em></li>
<li><a href="http://www.shopin.net/product/1332493.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/10/26/Pic1332493_48014_0_1.jpg" /><h3>ADIDAS中性时尚板鞋</h3></a><del>￥580</del><em>￥484</em></li>
<li><a href="http://www.shopin.net/product/1501357.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/11/01/Pic1501357_48654_0_1.jpg" /><h3>CONVERSE男式连帽外套</h3></a><del>￥499</del><em>￥226</em></li>
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
<li><a href="http://www.shopin.net/product/1434776.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/11/11/Pic1434776_154606_0_1.jpg" /><h3>诺诗兰菲尼亚斯男式三合一冲锋衣</h3></a><del>￥1380</del><em>￥689</em></li>
<li><a href="http://www.shopin.net/product/801759.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/10/24/Pic801759_23264_0_1.jpg" /><h3>KAILAS女式三合一冲锋衣</h3></a><del>￥1480</del><em>￥590</em></li>
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
<li><a href="http://www.shopin.net/product/161186.html" target="_blank"><img src="http://images.shopin.net/images/61/2010/05/07/Pic161186_6335_0_1.jpg" /><h3>古今蕾丝刺绣时尚文胸</h3></a><del>￥150</del><em>￥76</em></li>
<li><a href="http://www.shopin.net/product/1938552.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/07/09/Pic1938552_117941_0_1.jpg" /><h3>桑扶兰3/4中厚模杯蕾丝聚拢文胸</h3></a><del>￥198</del><em>￥49</em></li>
<li><a href="http://www.shopin.net/product/1382218.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/08/30/Pic1382218_71368_0_1.jpg" /><h3>芬蝶粉嫩卡通图案家居套装</h3></a><del>￥548</del><em>￥150</em></li>
<li><a href="http://www.shopin.net/product/1302360.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/02/29/Pic1302360_8260_0_1.jpg" /><h3>ELLE性感动物纹饰文胸</h3></a><del>￥299</del><em>￥60</em></li>
<li><a href="http://www.shopin.net/product/2073610.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/19/Pic2073610_205762_0_1.jpg" /><h3>北极绒男款提花保暖套装</h3></a><del>￥298</del><em>￥99</em></li>
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
<li><a href="http://www.shopin.net/product/1655141.html" target="_blank"><img src="http://images.shopin.net/images//60/2012/02/23//Pic1655141_56486_0_1.jpg" /><h3>空中天使圆领条纹针织衫</h3></a><del>￥249</del><em>￥98</em></li>
<li><a href="http://www.shopin.net/product/1996195.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/08/22//Pic1996195_184903_0_1.jpg" /><h3>丑丑幼童系扣翻领外套</h3></a><del>￥320</del><em>￥126</em></li>
<li><a href="http://www.shopin.net/product/876576.html" target="_blank"><img src="http://images.shopin.net/images//58/2011/09/13//Pic876576_1608_0_1.jpg" /><h3>艾艾屋男童加绒连帽外套</h3></a><del>￥168</del><em>￥187</em></li>
<li><a href="http://www.shopin.net/product/1592155.html" target="_blank"><img src="http://images.shopin.net/images//68/2012/01/06//Pic1592155_197_0_1.jpg" /><h3>菲格咪妮豹纹加厚大衣</h3></a><del>￥798</del><em>￥318</em></li>
<li><a href="http://www.shopin.net/product/969794.html" target="_blank"><img src="http://images.shopin.net/images//66/2012/09/11//Pic969794_103539_0_1.jpg" /><h3>昱璐女童长款绒毛帽领羽绒服</h3></a><del>￥769</del><em>￥266</em></li>
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
<li><a href="http://www.shopin.net/product/53750.html" target="_blank"><img src="http://images.shopin.net/images//61/2010/10/11//Pic53750_18248_0_1.jpg" /><h3>KSTYLE休闲手袋</h3></a><del>￥498</del><em>￥72</em></li>
<li><a href="http://www.shopin.net/product/715677.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/12/03/Pic715677_70436_0_1.jpg" /><h3>黑田羊毛围巾</h3></a><del>￥480</del><em>￥59</em></li>
<li><a href="http://www.shopin.net/product/1549504.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/05/19/Pic1549504_19572_0_1.jpg" /><h3>POLO女款真皮腰带</h3></a><del>￥198</del><em>￥50</em></li>
<li><a href="http://www.shopin.net/product/565918.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/02/11/Pic565918_19435_0_1.jpg" /><h3>PLAYBOY男士钱夹</h3></a><del>￥548</del><em>￥110</em></li>
<li><a href="http://www.shopin.net/product/1390069.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/09/02/Pic1390069_78035_0_1.jpg" /><h3>ARCTICFOX中性帽</h3></a><del>￥148</del><em>￥41</em></li>
<li><a href="http://www.shopin.net/product/902915.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/10/31/Pic902915_82775_0_1.jpg" /><h3>皮尔卡丹羊皮手套</h3></a><del>￥236</del><em>￥98</em></li>
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
<li><a href="http://www.shopin.net/product/2088087.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/22/Pic2088087_200215_0_1.jpg" /><h3>笛舒雅磨毛钻石绒四件套</h3></a><del>￥699</del><em>￥110</em></li>
<li><a href="http://www.shopin.net/product/1998937.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/09/13/Pic1998937_186972_0_1.jpg" /><h3>Erepo纯棉四件套</h3></a><del>￥698</del><em>￥198</em></li>
<li><a href="http://www.shopin.net/product/1952156.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/07/20/Pic1952156_187557_0_1.jpg" /><h3>LIFE HOME大豆被</h3></a><del>￥1890</del><em>￥299</em></li>
<li><a href="http://www.shopin.net/product/1995430.html" target="_blank"><img src="http://images.shopin.net/images//58/2012/09/10//Pic1995430_196005_0_1.jpg" /><h3>yealotus怡莲蚕砂磁疗枕</h3></a><del>￥409</del><em>￥119</em></li>
<li><a href="http://www.shopin.net/product/53900.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/09/06/Pic53900_194252_0_1.jpg" /><h3>SINOMAX护肩枕</h3></a><del>￥999</del><em>￥438</em></li>
<li><a href="http://www.shopin.net/product/1984707.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/08/18/Pic1984707_192798_0_1.jpg" /><h3>法尔曼粉色柔肤毯</h3></a><del>￥880</del><em>￥138</em></li>
      </ul>
      <ul class="saleList">
      	<li><a href="http://www.shopin.net/home/list--1858-0.3-0.41------.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale41.png"></a></li>
      	<li><a href="http://www.shopin.net/home/list---0.2-0.31-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale31.png"></a></li>
      	<li><a href="http://www.shopin.net/home/list---0.1-0.22-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale21.png"></a></li>
      	<li><a href="http://www.shopin.net/home/list---0.1-0.21-----.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/sale11.png"></a></li>
      </ul>
    </div>

  </div>
  <!--ul class="tlist">
  	<li><a href="http://www.shopin.net/promotion/5285.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic01.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/5703.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic02.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/6271.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic03.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/5719.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic04.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/6039.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic05.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/6169.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic06.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/5070.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic07.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/5992.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic08.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/6132.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic09.jpg"></a></li>
  	<li><a href="http://www.shopin.net/promotion/6065.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/pic10.jpg"></a></li>
  </ul-->
  <img src="http://images.shopin.net/images/ad/shuang11/t1.png"><img src="http://images.shopin.net/images/ad/shuang11/img01.jpg"><a href="http://shopin.tmall.com/view_page-629619952.htm" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/img02.jpg"><img src="http://images.shopin.net/images/ad/shuang11/img03.jpg"></a>
  <ul class="vitList">
  	<li><a href="http://www.shopin.net/help/manzeng.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/full.png"></a></li>
  	<li><a href="http://www.shopin.net/help/zfb1210.html" target="_blank"><img src="http://images.shopin.net/images/ad/shuang11/vip.png"></a></li>
  </ul>
</div>
<div id="dialog">
	<div class="dialogHd"><h3>提示</h3><a class="dialogClose" href="javascript:void(0);" title="关闭">关闭</a></div>
  <div class="dialogBd">
    <ul class="dialogForm">
       <form>
      <li style="height:50px"><label class="dialogLabel">请输入您的专享码：</label><div id="codetips" class="coll" style="height:30px"><input class="formText" name="xpCode" type="text" value="${xpCode}"><a href="${ctx}/catchCode.html"  class="zxm">如何获取专享码？</a><p class="tips"><span style="color:#ff6600;font-size:12px">${tips}</span></p></div></li>
      <li class="dialogHli"><div class="coll"><input class="formBtn btnOk" type="button" value="确　定" onClick="commitCode(this)">　　<input class="formBtn dialogClose" type="button" value="取　消"></div></li>
       </form>
    </ul>
  </div>
</div>
<div id="mask" class="mask"></div>
</body>
</html>