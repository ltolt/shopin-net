<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>12月25日至1月15日,大牌疯抢应季商品低至1折,持卡会员专享,莱尔斯丹,百思图,波司登,雪莲，羊绒,女鞋,羽绒,保暖,户外,1折起</title>
<style>
img { vertical-align:top}
.cl{clear:both}
.clear:after { height:0; clear:both; content:"."; visibility:hidden; display:block;}
.zm{zoom:1}
.mt { margin-top:10px}
.tc { text-align:center}
#header, .backgroundffffff { width:950px; margin:0 auto}
#page { width:auto; position:static;}
.box { width:950px; padding-bottom:10px; margin:10px auto;}
/*product list*/
.prolist { width:100%; padding:10px 0; overflow:hidden;}
.prolist ul { margin-left:-31px; zoom:1;}
.prolist li { float:left; _display:inline; width:132px; margin:10px 0 0 31px; text-align:center; position:relative}
.prolist li a:hover ,.prolist li a:hover h3{ color:#f60}
.prolist li img { width:130px; height:130px; border:1px solid #e2e2e2}
.prolist li h3 { height:20px; overflow:hidden; line-height:20px; font-weight:normal; color:#000}
.prolist li em { margin-left:10px; font-size:14px; font-weight:bold;}
.prolist .starprice { line-height:20px; text-align:center; overflow:hidden; font-weight:bold; color:#f15930;}
.prolist .save { width:110px; height:20px; margin:3px auto 0; text-align:center; font-weight:bold; background:#f25930; color:#fff601}
h2.hd { height:52px; position:relative;}
h2.hd a { position:absolute; right:50px; top:10px;font:600 18px/50px 'microsoft yahei','黑体'; color:#9a0000}
/*brand list*/
.brand-list li{float:left;width:275px;height:288px;position:relative;margin:20px 0 0 25px;_display:inline;cursor:pointer}
.brand-list .titlebar,.brand-list .titlebox{width:100%;height:63px;position:absolute;left:0;bottom:0;z-index:99;}
.brand-list .titlebar {background:#000;filter:Alpha(opacity=70);-moz-opacity:.7;opacity:.7;}
.brand-list li.hover .titlebox{background:#fe4504;color:#fff!important}
.brand-list .titlebox{width:255px;height:53px;padding:5px 10px}
.titlebox span{height:51px;float:left;zoom:1;overflow:hidden;word-wrap:break-word;}
.brand-logo{width:83px;margin-right:14px}
.brand-sale{width:81px;font:600 18px/51px 'microsoft yahei','airal';color:#ffd241}
.brand-text{width:75px;text-align:right;font:600 14px/51px 'microsoft yahei','airal';color:#fff;}
.brand-list li.hover .brand-sale{color:#fff}
/*popbox*/
#popbox{ display:none; position:fixed; _position:absolute; width:400px; z-index:100; overflow:hidden; border:2px solid #ec560d; background:#fff}
#popbox .pbt { height:25px}
#popbox .pbt a { float:right; width:16px; height:17px; margin:6px 20px 0 0; text-indent:-999em; overflow:hidden; background:url(http://images.shopin.net/images/ad/hyqd/box-c.png)}
#popbox .pbf { height:20px;}
#popbox .pinner { margin-top:13px}
/*popbox tab*/
.tab-hd { position:relative; width:243px; padding-left:45px; margin:0 auto; background:url(http://images.shopin.net/images/ad/hyqd/boxhd-l.png) 0 bottom no-repeat}
.tab-hd li { float:left; width:91px; height:22px; line-height:22px; margin-right:7px; text-align:center; cursor:pointer; background:url(http://images.shopin.net/images/ad/hyqd/boxbg-ib.png);color:#fff}
.tab-hd li.cur { font-weight:600; background:url(http://images.shopin.net/images/ad/hyqd/boxbg-ib.png) 0 -23px}
.tab-hd li.cur a, .tab-hd li a, .tab-hd li a:hover { outline:none; color:#fff}
/*popbox form*/
.popboxform li{ line-height:21px; margin-bottom:6px}
.popboxform label.formlabel { width:90px; display:inline-block; *display:inline; *zoom:1; text-align:right; vertical-align:top}
.popboxform .coll { display:inline-block; *display:inline; *zoom:1;}
.popboxform .coll input { vertical-align:middle}
.popboxform .coll .form-text{width:190px;height:16px;line-height:16px;padding:3px 0 0 3px;font-size:14px;font-family:simsun;border:1px solid #8c8c8c; background:url(http://images.shopin.net/images/ad/hyqd/boxbg-it.png) 0 0}
.popboxform .coll .tips{display:none;color:#f00}
.popboxform li.vcode .form-text {width:80px;margin-right:5px; vertical-align:auto}
.popboxform li.vcode img { vertical-align:middle}
.popboxform .coll i { font-style:normal; color:#f00; margin-left:6px}
.popboxform .alertSumbit { width:93px; height:30px; cursor:pointer; font-weight:bold; background:url(http://images.shopin.net/images/ad/aoyunhui/ok.png); border:0}
.popboxform .alertQuizSumbit{ width:93px; height:30px; cursor:pointer; background:url(http://images.shopin.net/images/ad/aoyunhui/ok.png); border:0}
.alertDet { width:78px; height:30px; cursor:pointer; background:url(http://images.shopin.net/images/ad/aoyunhui/btn.png); border:0}
#mask { position:absolute; top:0; left:0; background:#000; opacity:0.5; filter:alpha(opacity=50); display:none; z-index:99; }
.popbox-btn { display:inline-block; _float:left; padding-left:15px; background:url(http://images.shopin.net/images/ad/hyqd/boxbg-sib.png) 0 0}
.popbox-btn span { display:inline-block; _float:left; height:30px; line-height:30px; padding-right:15px; cursor:pointer; font-weight:600; color:#fff; background:url(http://images.shopin.net/images/ad/hyqd/boxbg-sib.png) right 0}
.sign { width:310px;  margin:0 auto}
.sign h6 { margin:20px 0; font-weight:600; color:#f00}
.sign label.formlabel { width:110px}
.sign .coll .form-text{width:140px}
</style>
<script>
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
	$(".brand-list li").hover(function(){
		$(this).addClass("hover");
		},function(){
			$(this).removeClass("hover").end();
	});
});
//登录注册层
function popbox(){
	$('#mask').show();
	$("#mask").css("height",$(document).height());
	$("#mask").css("width",$(window).width());
	center($('.loginBox'));
};
//提示信息
function popboxTips(){
	$('#mask').show();
	$("#mask").css("height",$(document).height());
	$("#mask").css("width",$(window).width());
	center($('.tipsBox'));
};
//居中层
function center(obj) { 
	var screenWidth = $(window).width(), screenHeight = $(window).height(); //当前浏览器窗口的 宽高 
	var scrolltop = $(document).scrollTop();//获取当前窗口距离页面顶部高度 
	var objLeft = (screenWidth - obj.width())/2 ; 
	var objTop = (screenHeight - obj.height())/2; 
	obj.css({left: objLeft + 'px', top: objTop + 'px','display': 'block'}); 
};
//关闭层
function popclose(){
	$("#mask,#popbox").hide();
	return;
};


var verifyCodeIsValid=false;
var usernameIsValid=false;

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

    function mysign(){
       popbox();
    }

</script>
</head>

<body>
<div class="box">
<a href="http://www.shopin.net/login.html" target="_blank"><img src="http://images.shopin.net/images/ad/yufuka/top1.jpg" width="950" height="220"><img src="http://images.shopin.net/images/ad/yufuka/top2.jpg" width="950" height="220"><img src="http://images.shopin.net/images/ad/yufuka/top3.jpg" width="950" height="220"></a>
<h2 class="hd"><a href="http://www.shopin.net/list---0.05-0.3------.html" target="_blank">更多&gt;&gt;</a><img class="mt" src="http://images.shopin.net/images/ad/yufuka/t1.png" width="950" height="52"></h2>
<div class="prolist">
	<ul>
<li><a href="http://www.shopin.net/product/2107093.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/27/Pic2107093_157168_0.resize_to.130x130.jpg" /><h3>90%白鸭绒军绿色羽绒服</h3></a><del>￥1379</del><em>￥414</em></li>
<li><a href="http://www.shopin.net/product/1608660.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/02/20/Pic1608660_22801_0.resize_to.130x130.jpg" /><h3>凯乐石专柜正品2011外套</h3></a><del>￥498</del><em>￥130</em></li>
<li><a href="http://www.shopin.net/product/1305206.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/08/09/Pic1305206_117362_0.resize_to.130x130.jpg" /><h3>Jack Wolfskin专柜正品外套</h3></a><del>￥1599</del><em>￥799</em></li>
<li><a href="http://www.shopin.net/product/2130085.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/16/Pic2130085_211964_0.resize_to.130x130.jpg" /><h3>IUGGIRL真皮翻毛金属搭扣雪地靴</h3></a><del>￥758</del><em>￥266</em></li>
<li><a href="http://www.shopin.net/product/2119525.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/19/Pic2119525_15375_0.resize_to.130x130.jpg" /><h3>莱尔斯丹平底低跟短靴</h3></a><del>￥1598</del><em>￥323</em></li>
<li><a href="http://www.shopin.net/product/2110161.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/29/Pic2110161_8605_0.resize_to.130x130.jpg" /><h3>菲尔图12年新款时尚长靴</h3></a><del>￥1680</del><em>￥840</em></li>
<li><a href="http://www.shopin.net/product/2037821.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/09/18/Pic2037821_182257_0.resize_to.130x130.jpg" /><h3>Josiny12年新款靓丽短靴</h3></a><del>￥599</del><em>￥239</em></li>
<li><a href="http://www.shopin.net/product/1939136.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/12/Pic1939136_189443_0.resize_to.130x130.jpg" /><h3>飘莱中长款收腰羽绒服</h3></a><del>￥850</del><em>￥249</em></li>
<li><a href="http://www.shopin.net/product/2092712.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/07/Pic2092712_151160_0.resize_to.130x130.jpg" /><h3>Kazelaze100%鸭绒短裤时尚羽绒服</h3></a><del>￥2480</del><em>￥319</em></li>
<li><a href="http://www.shopin.net/product/2142292.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/29/Pic2142292_3557_0.resize_to.130x130.jpg" /><h3>靓丽简约款针织衫</h3></a><del>￥499</del><em>￥99</em></li>
<li><a href="http://www.shopin.net/product/813825.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/01/05/Pic813825_86021_0.resize_to.130x130.jpg" /><h3>雅鹿长款獭兔毛领羽绒服</h3></a><del>￥1429</del><em>￥299</em></li>
<li><a href="http://www.shopin.net/product/941198.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/12/13/Pic941198_85063_0.resize_to.130x130.jpg" /><h3>皮尔卡丹貉子毛领长款羽绒服</h3></a><del>￥1180</del><em>￥471</em></li>
<li><a href="http://www.shopin.net/product/853903.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/11/29/Pic853903_152886_0.resize_to.130x130.jpg" /><h3>花花公子长款狐狸毛领羽绒服</h3></a><del>￥1398</del><em>￥559</em></li>
<li><a href="http://www.shopin.net/product/2094703.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/12/10/Pic2094703_153919_0.resize_to.130x130.jpg" /><h3>金羽杰貉子毛领长款收腰羽绒服</h3></a><del>￥1494</del><em>￥585</em></li>
<li><a href="http://www.shopin.net/product/2051629.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/07/Pic2051629_146776_0.resize_to.130x130.jpg" /><h3>蒙派彩色条纹羊毛男衫</h3></a><del>￥998</del><em>￥94</em></li>
<li><a href="http://www.shopin.net/product/2068123.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/06/Pic2068123_83760_0.resize_to.130x130.jpg" /><h3>尼特维尔条纹时尚羊毛衫</h3></a><del>￥698</del><em>￥150</em></li>
<li><a href="http://www.shopin.net/product/1553340.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/12/19/Pic1553340_78121_0.resize_to.130x130.jpg" /><h3>宾缘印花长款混绒衫</h3></a><del>￥1080</del><em>￥150</em></li>
<li><a href="http://www.shopin.net/product/2149635.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/12/07/Pic2149635_213755_0.resize_to.130x130.jpg" /><h3>维多拉斯镶钻假开衫</h3></a><del>￥1860</del><em>￥380</em></li>
	</ul>
</div>
	<h2 class="hd"><a href="http://www.shopin.net/help/xinpinpai.html" target="_blank">更多&gt;&gt;</a><img class="mt" src="http://images.shopin.net/images/ad/dangdang/t1.png" width="950" height="52">
	</h2>
	<div class="brand-list clear zm">
			<ul>
<li><a href="http://www.shopin.net/list-1411-------0-1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/dangdang/dl-01.jpg" /></a><div class="titlebar"></div><div class="titlebox"><span class="brand-logo"><img src="http://images.shopin.net/images/ad/dangdang/l-01.jpg"  width="83" height="51" ></span><span class="brand-sale">3.5折起</span><span class="brand-text">羽绒服</span></div></li>
<li><a href="http://www.shopin.net/brand/list-1410--0.3-0.5-----1.html" target="_blank"><img src="http://images.shopin.net/images/ad/dangdang/dl-02.jpg" /></a><div class="titlebar"></div><div class="titlebox"><span class="brand-logo"><img src="http://images.shopin.net/images/ad/dangdang/l-02.jpg"  width="83" height="51" ></span><span class="brand-sale">低至128元</span><span class="brand-text">羽绒服</span></div></li>
<li><a href="http://www.shopin.net/brand/list-969-1067-0.3-0.5-----1.html" target="_blank"><img src="http://images.shopin.net/images/ad/dangdang/dl-03.jpg" /></a><div class="titlebar"></div><div class="titlebox"><span class="brand-logo"><img src="http://images.shopin.net/images/ad/dangdang/l-03.jpg"  width="83" height="51" ></span><span class="brand-sale">3-5折</span><span class="brand-text">羊绒</span></div></li>
<li><a href="http://www.shopin.net/brands/1412.html" target="_blank"><img src="http://images.shopin.net/images/ad/dangdang/dl-04.jpg" /></a><div class="titlebar"></div><div class="titlebox"><span class="brand-logo"><img src="http://images.shopin.net/images/ad/dangdang/l-04.jpg"  width="83" height="51" ></span><span class="brand-sale">5折封</span><span class="brand-text">羊绒</span></div></li>
<li><a href="http://www.shopin.net/brand/list-1409--0.3-0.5-----1.html" target="_blank"><img src="http://images.shopin.net/images/ad/dangdang/dl-05.jpg" /></a><div class="titlebar"></div><div class="titlebox"><span class="brand-logo"><img src="http://images.shopin.net/images/ad/dangdang/l-05.jpg"  width="83" height="51" ></span><span class="brand-sale">2-5折</span><span class="brand-text">冬靴</span></div></li>
<li><a href="http://www.shopin.net/brand/list-256-1824-0.05-0.3-----1/1.html" target="_blank"><img src="http://images.shopin.net/images/ad/dangdang/dl-06.jpg" /></a><div class="titlebar"></div><div class="titlebox"><span class="brand-logo"><img src="http://images.shopin.net/images/ad/dangdang/l-06.jpg"  width="83" height="51" ></span><span class="brand-sale">3折封</span><span class="brand-text">冬靴</span></div></li>
		</ul>
	</div>
</div>
<!--登录注册-->
<div id="popbox" class="loginBox">
	<div class="pbt"><a href="javascript:popclose();" title="关闭">关闭</a></div>
	<div class="pbd">
		<ul class="tab-hd mt">
		<li class="cur"><a href="javascript:void(0);">会员注册</a></li>
	</ul>
    <div class="tab-bd pinner zm">
			<div class="item popboxform">
				<form action='${ctx}/dangdang/register.html' method='post' id="register_form">
					<ul>
					<li><label class="formlabel">Email地址：</label><div class="coll" id="username_div"><input class="form-text" type="text" name="memEmail" id="username" onBlur="validateUsername()"><i>必填</i><p class="tips"></p></div></li>
					<li><label class="formlabel">设置密码：</label><div class="coll" id="password_div"><input class="form-text" type="password" name="memPwd" id="password" onBlur="validatePassword()"><i>必填</i><p class="tips"></p></div></li>
					<li><label class="formlabel">确认密码：</label><div class="coll" id="confirm_password_div"><input class="form-text" type="password" name="iptUser" id="confirm_password" onBlur="validateConfirmPassword()"><i>必填</i><p class="tips"></p></div></li>
					<li class="vcode"><label class="formlabel">验证码：</label><div class="coll" id="verifycode_div"><input type="text" class="form-text" name="j_captcha" maxlength="5" id="verifycode"><img id="captchaImg" src="${ctx}/jcaptcha.jpg"/>
                        <div><a href="javascript:refreshCaptcha()">看不清楚换一个</a></div><p class="tips"></p></div></li>
					<li><label class="formlabel"></label><div class="coll"><a class="popbox-btn" onClick="doRegister();"><span>同意以下协议并注册</span></a></div></li>
                    <li><label class="formlabel"></label><div class="coll"><label><input type="checkbox" checked><a href="http://www.shopin.net/goRegister.html" target="_blank">上品折扣网服务协议</a></label></div></li>
					</ul>
				</form>
			</div>
    </div>
	</div>
	<div class="pbf"></div>
</div>
<div id="mask"></div>
</body>
</html>
