<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>会员优惠专享区  名牌冬日单品全场1折起    羊绒衫、羽绒服、长靴、皮草 爆款热卖！</title>
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
		$(window).load(function(){
			$("#loading").hide();
			$(".box").fadeIn();
			lockScreen();
			center($("#dialog"));
		});

    </script>
<%
    }
%>
<script>
    //验证光棍节会员专项码的事件
    function commitCode(button){
          var xpCode = $("input[name='xpCode']").val();
          $.ajax({
                        url:'${ctx}/verifybaiduCode.json',
                        type: 'post',
                        dataType: 'json',
                        data:{'code':xpCode},
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
	var scrolltop = $(document).scrollTop();//获取当前窗口距离页面顶部高度
	var objLeft = (screenWidth - obj.width())/2 ;
	var objTop = (screenHeight - obj.height())/2 + scrolltop;
	//var objTop = 200;
	obj.css({left: objLeft + 'px', top: objTop + 'px','display': 'block'});
	}
	//遮罩层
	function lockScreen(){
		//var w = $(window).width();
		var h = $(document).height();
		var x = $(window).scrollLeft();
		//var y = $(document).scrollTop();
		//创建一层div遮盖，大小是窗口大小
		$("<div class='mask'>").css({
			position:"absolute",
			//width:w - 18,
			height:h,
			left:x,
			top:0,
			opacity:.3,
			filter:"alpha(opacity=30)",
			"background-color":"#000000"
		}).appendTo("#page").slideDown(200);
	};
	$(function(){
		$(".formText").focus();
		$(".dialogClose").click(function(){
			window.close();
		});
	});
</script>
<!--[if IE 6]>
<script> 
$(function(){ 
	$.fn.extend({
    ie6fixedbug: function () {
        $(this).css("position", "absolute");
        var m = (window.screen.height - $(this).height()) / 4;
        var obj = $(this)[0];
        window.onscroll = function () {
            obj.style.top = (document.body.scrollTop || document.documentElement.scrollTop) + m + 'px';
        }
        window.onresize = function () {
            obj.style.top = (document.body.scrollTop || document.documentElement.scrollTop) + m + 'px';
        }
    }
});
	$("#dialog").ie6fixedbug();
}); 
</script> 
<![endif]-->
<style>
img{ vertical-align:top}
.mt{margin-top:10px}
.clear:after,.prolist:after,.blist:after { height:0; clear:both; content:"."; visibility:hidden; display:block;}
.zm{zoom:1}
#page{width:100%!important;padding:0!important}
#header, .backgroundffffff{width:950px;margin:0 auto}
.box{width:950px;margin:10px auto;padding-bottom:4px;overflow:hidden;background:#ea4609}
.saleArea{margin:0 8px 8px;padding-bottom:7px;background:#f0f1e9}
.tlist li{float:left;width:456px;margin:7px 0 0 7px; _display:inline}
.tlist li img{border:1px solid #dfdfdf}
.tcp{text-align:center;margin:2px 0}
h2.hd{text-align:center;font:600 38px/70px 'microsoft yahei','黑体'; color:#e94709; background:#eff0e8}
/*product list*/
.prolist{display:block;padding:5px 0 5px 10px;border:2px solid #eff0e8;border-top:none;zoom:1}
.prolist li { float:left; _display:inline; width:132px; margin:10px 0 0 19px; text-align:center; position:relative}
.prolist li a:hover ,.prolist li a:hover h3{ color:#fff}
.prolist li img { width:130px; height:130px; border:1px solid #e2e2e2}
.prolist li h3 { height:20px; overflow:hidden; line-height:20px; font-weight:normal; color:#333}
.prolist li a h3 { color:#fff}
.prolist li del { color:#fff}
.prolist li em { margin-left:10px; font-size:14px; font-weight:bold; color:#fff}
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
/*alert box*/
#dialog .dialogHd, #dialog .dialogHd h3, #dialog .dialogHd a, #dialog .dialogHd a:hover, #dialog .dialogForm .formBtn{background-image:url(http://images.shopin.net/images/dialog.png);background-repeat:no-repeat}
#dialog{position:fixed; *position:absolute;z-index:99999999!important;width:450px;display:none;border:1px solid #888;background:#fff;}
#dialog .dialogHd{height:30px;overflow:hidden;cursor:move;border-bottom:1px solid #ccc;background-position:0 -60px;background-repeat:repeat-x;}
#dialog .dialogHd h3{line-height:30px;padding-left:40px;background-position:0 0;color:#d64820}
#dialog .dialogHd a{float:right;width:30px;height:30px;line-height:100px;margin-top:-30px;background-position:10px -90px;outline:none}
#dialog .dialogHd a:hover{background-position:-11px -90px}
#dialog .dialogBd{padding:30px 10px;line-height:26px;}
#dialog .dialogForm li{margin-bottom:6px}
#dialog .dialogForm li.dialogHli {margin-top:10px;text-align:center}
#dialog .dialogForm .dialogLabel{width:110px;display:inline-block;*display:inline;*zoom:1;text-align:right;vertical-align:top;color:#666}
#dialog .dialogForm .coll{display:inline-block;*display:inline;*zoom:1;}
#dialog .dialogForm .coll .zxm{ text-decoration:underline!important; color:#00f}
#dialog .dialogForm .formText{width:196px;height:15px;line-height:14px;margin-right:5px;padding:5px 3px;font-size:14px;border:1px solid #aaa}
#dialog .dialogForm .vcode{width:60px!important;margin-right:5px}
#dialog .dialogForm .formBtn{width:80px;height:30px;line-height:30px;cursor:pointer;font-weight:bold;border:0;color:#d64820;background-position:0 -30px;}
#dialog .dialogForm .tips{display:none;height:20px;line-height:16px;color:#f00}
.mask{width:100%;top:-147px!important;z-index:10!important}
/*brand list*/
.blist { padding-top:12px; margin-bottom:10px; border:2px solid #eff0e8;border-top:none }
.blist li { float: left; _display: inline; width: 130px; margin-left: 5px; text-align: center; line-height: 28px; font-weight: bold }
.blist li a:hover,.blist li a { color: #fff }
.blist li img { display: block; width: 128px; height: 88px }
/*loading*/
.box{ display:none}
#loading{position:relative;width:300px;height:50px;top:0px;left:50%;margin:50px 0 50px -150px;text-align:center;padding:7px 0 0 0;font:bold 11px Arial, Helvetica, sans-serif;}
</style>
</head>

<body>
<div id="loading">请稍候...<br><img src="http://images.shopin.net/images/loading.gif" alt="loading.." /></div>
<div class="box">
	<img src="http://images.shopin.net/images/ad/baidcoupon/top-ad1.png"><img src="http://images.shopin.net/images/ad/baidcoupon/top-ad2.png">
  <h2 class="hd">超值爆款区</h2>
	<ul class="prolist">
<li><a href="http://www.shopin.net/product/store/1344633.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/12/29/Pic1344633_3351_0_1.jpg" /><h3>HOPE SHOW兔毛领双排扣短款毛呢外套</h3></a><del>￥749</del><em>￥187</em></li>
<li><a href="http://www.shopin.net/product/2122920.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/15/Pic2122920_177920_0_1.jpg" /><h3>RBCA可拆卸毛领甜美毛呢大衣</h3></a><del>￥1398</del><em>￥238</em></li>
<li><a href="http://www.shopin.net/product/1545131.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/08/02/Pic1545131_82019_0_1.jpg" /><h3>JIMANNO链条装饰修身毛呢大衣</h3></a><del>￥4799</del><em>￥711</em></li>
<li><a href="http://www.shopin.net/product/store/1914629.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/06/21/Pic1914629_187837_0_1.jpg" /><h3>B.SIQI狐狸毛领收腰长款羽绒</h3></a><del>￥3290</del><em>￥590</em></li>
<li><a href="http://www.shopin.net/product/1523682.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic1523682_1382_0_1.jpg" /><h3>秋水伊人糖果色貉子毛领系带羽绒</h3></a><del>￥1168</del><em>￥343</em></li>
<li><a href="http://www.shopin.net/product/2089412.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/02/Pic2089412_174632_0_1.jpg" /><h3>优歌圈圈毛领连帽短款棉服</h3></a><del>￥756</del><em>￥226</em></li>
<li><a href="http://www.shopin.net/product/1571886.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic1571886_123103_0_1.jpg" /><h3>huayin甜美双排扣大口袋长羽绒</h3></a><del>￥2580</del><em>￥262</em></li>
<li><a href="http://www.shopin.net/product/2079579.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/18/Pic2079579_130864_0_1.jpg" /><h3>衣香丽影渐变珠片花饰长款针织衫</h3></a><del>￥539</del><em>￥162</em></li>
<li><a href="http://www.shopin.net/product/1947917.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/09/01/Pic1947917_185046_0_1.jpg" /><h3>柯里卡炫彩印花拼接针织连衣裙</h3></a><del>￥2590</del><em>￥420</em></li>
<li><a href="http://www.shopin.net/product/1532047.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic1532047_151252_0_1.jpg" /><h3>Kazelaze貉子毛领收腰长款羽绒</h3></a><del>￥2480</del><em>￥399</em></li>
<li><a href="http://www.shopin.net/product/1910046.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/07/16/Pic1910046_187271_0_1.jpg" /><h3>OURSHINE百搭连帽长款羽绒</h3></a><del>￥878</del><em>￥298</em></li>
<li><a href="http://www.shopin.net/product/1549891.html" target="_blank"><img src="http://images.shopin.net/images/68/2011/12/30/Pic1549891_157407_0_1.jpg" /><h3>聊黛部儿情侣印花女款羽绒</h3></a><del>￥738</del><em>￥98</em></li>
<li><a href="http://www.shopin.net/product/1939136.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/12/Pic1939136_189441_0_1.jpg" /><h3>飘莱貉子毛领90%含绒量长款羽绒</h3></a><del>￥850</del><em>￥249</em></li>
<li><a href="http://www.shopin.net/product/store/1483489.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/12/06/Pic1483489_134883_0_1.jpg" /><h3>MODO GAGA貉子毛领连帽短款羽绒</h3></a><del>￥198</del><em>￥359</em></li>
<li><a href="http://www.shopin.net/product/1916095.html" target="_blank"><img src="http://images.shopin.net/images//68/2012/06/26/Pic1916095_97522_0_1.jpg" /><h3>卡美多民族图腾黑色牛皮长筒靴</h3></a><del>￥1468</del><em>￥299</em></li>
<li><a href="http://www.shopin.net/product/2119452.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/08/Pic2119452_15375_0_1.jpg" /><h3>莱尔斯丹时尚反羊绒皮系带中筒靴</h3></a><del>￥1598</del><em>￥311</em></li>
<li><a href="http://www.shopin.net/product/1913977.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/06/20/Pic1913977_8639_0_1.jpg" /><h3>卡曼尼复古铆钉搭扣牛皮短靴</h3></a><del>￥1380</del><em>￥299</em></li>
<li><a href="http://www.shopin.net/product/1567938.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/12/16/Pic1567938_11103_0_1.jpg" /><h3>红蜻蜓头层牛皮流苏装饰长筒靴</h3></a><del>￥1699</del><em>￥299</em></li>
<li><a href="http://www.shopin.net/product/1457950.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/10/10/Pic1457950_8605_0_1.jpg" /><h3>菲尔图牛皮羊毛内增高系带短靴</h3></a><del>￥1380</del><em>￥260</em></li>
<li><a href="http://www.shopin.net/product/2029546.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/01/Pic2029546_85305_0_1.jpg" /><h3>依彩绒钻饰渐变花色长款羊毛衫</h3></a><del>￥1096</del><em>￥199</em></li>
<li><a href="http://www.shopin.net/product/2051586.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/22/Pic2051586_190914_0_1.jpg" /><h3>蒙派纯色圆领镶钻纯羊绒衫</h3></a><del>￥1099</del><em>￥189</em></li>
<li><a href="http://www.shopin.net/product/2061681.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/31/Pic2061681_72656_0_1.jpg" /><h3>正亚时尚彩条印花长款羊毛衫</h3></a><del>￥1080</del><em>￥120</em></li>
<li><a href="http://www.shopin.net/product/2080597.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/30/Pic2080597_205648_0_1.jpg" /><h3>洋宾燕V领提花100%羊毛衫</h3></a><del>￥869</del><em>￥99</em></li>
<li><a href="http://www.shopin.net/product/2050996.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/25/Pic2050996_201894_0_1.jpg" /><h3>戎立特女士彩条纹100%羊绒衫</h3></a><del>￥1100</del><em>￥385</em></li>
<li><a href="http://www.shopin.net/product/2018580.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/11/Pic2018580_77545_0_1.jpg" /><h3>KELIYA男款圆领波纹印花羊毛衫</h3></a><del>￥658</del><em>￥94</em></li>
<li><a href="http://www.shopin.net/product/1934356.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/09/06/Pic1934356_85108_0_1.jpg" /><h3>蒙丹米尔男款圆领提花纯羊绒衫</h3></a><del>￥1460</del><em>￥280</em></li>
<li><a href="http://www.shopin.net/product/2064320.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/29/Pic2064320_83516_0_1.jpg" /><h3>宾缘男款提花保暖混绒裤</h3></a><del>￥818</del><em>￥79</em></li>
<li><a href="http://www.shopin.net/product/3265.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/09/05/Pic3265_1183_0_1.jpg" /><h3>桑扶兰3/4杯刺绣花朵蕾丝聚拢文胸</h3></a><del>￥188</del><em>￥35</em></li>
<li><a href="http://www.shopin.net/product/2037536.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/21/Pic2037536_200272_0_1.jpg" /><h3>WAYONLY渐变蕾丝刺绣聚拢文胸</h3></a><del>￥570</del><em>￥66</em></li>
<li><a href="http://www.shopin.net/product/1481094.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/10/26/Pic1481094_150052_0_1.jpg" /><h3>plandoo珍珠绒旭暖热力套装</h3></a><del>￥238</del><em>￥79</em></li>
<!--li><a href="http://www.shopin.net/product/1444458.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/12/23/Pic1444458_146164_0_1.jpg" /><h3>北极绒加厚保暖绒套装</h3></a><del>￥498</del><em>￥150</em></li>
<li><a href="http://www.shopin.net/product/2036164.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/18/Pic2036164_79088_0_1.jpg" /><h3>俞兆林男士活性竹炭保暖套装</h3></a><del>￥328</del><em>￥109</em></li-->
  </ul>
  <h2 class="hd">3折封顶专区</h2>
	<ul class="prolist">
<li><a href="http://www.shopin.net/product/1538725.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/12/06/Pic1538725_149226_0_1.jpg" /><h3>MODO GAGA长款泡泡领鸭绒收腰羽绒服</h3></a><del>￥868</del><em>￥260</em></li>
<li><a href="http://www.shopin.net/product/2059548.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/09/Pic2059548_3456_0_1.jpg" /><h3>HOPE SHOW气质双排扣羊毛大衣</h3></a><del>￥1629</del><em>￥325</em></li>
<li><a href="http://www.shopin.net/product/1552363.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/09/04/Pic1552363_101112_0_1.jpg" /><h3>百思图时尚百搭高筒靴</h3></a><del>￥1799</del><em>￥538</em></li>
<li><a href="http://www.shopin.net/product/884614.html" target="_blank"><img src="http://images.shopin.net/images/60/2010/12/17/Pic884614_27628_0_1.jpg" /><h3>哥仑步三合一冲锋衣</h3></a><del>￥1799</del><em>￥470</em></li>
<li><a href="http://www.shopin.net/product/956876.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/11/18/Pic956876_15311_0_1.jpg" /><h3>蒙漫侬羽绒夹克外套</h3></a><del>￥2860</del><em>￥349</em></li>
<li><a href="http://www.shopin.net/product/2077180.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/12/Pic2077180_85331_0_1.jpg" /><h3>依彩绒男款格纹羊绒衫</h3></a><del>￥1390</del><em>￥199</em></li>
  </ul>
  <h2 class="hd">名品折扣专区</h2>
  <ul class="blist">
<li><a href="http://www.shopin.net/brand/list-1413/1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1413_2.jpg" alt="雅鹿">￥399起</a></li>
<li><a href="http://www.shopin.net/brand/list-1881/1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1881_2.jpg" alt="咔姿莱">3折封</a></li>
<li><a href="http://www.shopin.net/list-1422-1720-0.05-0.4-----1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1422_2.jpg" alt="克利雅">4折封</a></li>
<li><a href="http://www.shopin.net/shoes/brands/256.html" target="_blank"><img src="http://images.shopin.net/images//brand/256_2.jpg" alt="莱尔斯丹">2-6折</a></li>
<li><a href="http://www.shopin.net/lady/brand/list-1472-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1472_2.jpg" alt="JIMANNO">3折封</a></li>
<li><a href="http://www.shopin.net/underwear/brand/list-1488-1068-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1488_2.jpg" alt="plandoo">新款5折</a></li>
<li><a href="http://www.shopin.net/man/brands/1167.html" target="_blank"><img src="http://images.shopin.net/images/brand/1167_2.jpg" alt="雅戈尔">2-6折</a></li>
  </ul>
  <a href="http://www.shopin.net/promotion/4960.html" target="_blank"><img src="http://images.shopin.net/images//promotions/201211161041571.jpg"></a>
  <img class="mt" src="http://images.shopin.net/images/ad/baidcoupon/img1.jpg">
</div>
<div id="dialog">
	<div class="dialogHd"><h3>提示</h3><a class="dialogClose" href="javascript:void(0);" title="关闭">关闭</a></div>
  <div class="dialogBd">
    <ul class="dialogForm">
       <form>
      <li style="height:50px"><label class="dialogLabel">请输入您的专享码：</label><div id="codetips" class="coll" style="height:30px"><input class="formText" name="xpCode" type="text"><p class="tips"></p></div></li>
      <li class="dialogHli"><div class="coll"><input class="formBtn btnOk" type="button" value="确　定" onclick="commitCode(this)">　　<input class="formBtn dialogClose" type="button" value="取　消"></div></li>
       </form>
    </ul>
  </div>
</div>
</body>
</html>