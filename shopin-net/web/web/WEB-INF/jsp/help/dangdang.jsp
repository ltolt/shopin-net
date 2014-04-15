<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>12.14仅1天,当当网会员独享,免费送暖手抱枕</title>
<style>
img { vertical-align:top}
.cl{clear:both}
.clear:after { height:0; clear:both; content:"."; visibility:hidden; display:block;}
.zm{zoom:1}
.mt { margin-top:10px}
.tc { text-align:center}
#header, .backgroundffffff { width:950px; margin:0 auto}
#page { width:auto; position:static;}
.box { width:950px; padding-bottom:10px; margin:10px auto; background:#9a0000 url(http://images.shopin.net/images/ad/dangdang/boxbg.jpg) no-repeat 0 670px}
/*product list*/
.probox { width:868px; margin:0 auto; background:url(http://images.shopin.net/images/ad/dangdang/proboxcenter.png)}
.prolist { padding-bottom:30px; background:url(http://images.shopin.net/images/ad/dangdang/proboxbottom.png) no-repeat 0 bottom}
.prolist ul { zoom:1; background:url(http://images.shopin.net/images/ad/dangdang/proboxtop.png) no-repeat 0 0}
.prolist li { float:left; _display:inline; width:132px; margin:10px 0 0 11px; text-align:center; position:relative}
.prolist li a:hover ,.prolist li a:hover h3{ color:#f60}
.prolist li img { width:130px; height:130px; border:1px solid #e2e2e2}
.prolist li h3 { height:20px; overflow:hidden; line-height:20px; font-weight:normal; color:#000}
.prolist li em { margin-left:10px; font-size:14px; font-weight:bold;}
.prolist .starprice { line-height:20px; text-align:center; overflow:hidden; font-weight:bold; color:#f15930;}
.prolist .save { width:110px; height:20px; margin:3px auto 0; text-align:center; font-weight:bold; background:#f25930; color:#fff601}
h2.hd { height:52px; position:relative;}
h2.hd a { position:absolute; right:50px; top:10px;font:600 18px/50px 'microsoft yahei','黑体'; color:#9a0000}
/*brand list*/
.brand-list{padding-left:43px}
.brand-list li{float:left;width:275px;height:288px;position:relative;margin:20px 20px 0 0;_display:inline;cursor:pointer}
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
<img src="http://images.shopin.net/images/ad/dangdang/top1.jpg" width="950" height="297"><img src="http://images.shopin.net/images/ad/dangdang/top2.jpg" width="950" height="297" usemap="#Map"><img src="http://images.shopin.net/images/ad/dangdang/top3.jpg" width="950" height="81">
<map name="Map">
		<area shape="rect" coords="722,37,871,85" href="#" onclick="mysign()">
</map>
	<div class="probox">
		<div class="prolist clear zm">
			<ul>
				<li><a href="http://www.shopin.net/product/2158227.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/12/13/Pic2158227_214756_0_1.jpg" width="220" height="220"><h3>NIKE阿甘男士文化鞋</h3></a><del>￥699</del><em>￥299</em></li>
				<li><a href="http://www.shopin.net/product/1793132.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/12/14/Pic1793132_48014_0_1.jpg" width="220" height="220"><h3>adidas男士轻便训练鞋</h3></a><del>￥580</del><em>￥299</em></li>
				<li><a href="http://www.shopin.net/product/1978008.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/12/13/Pic1978008_48014_0_1.jpg" width="220" height="220"><h3>adidas男士缓震训练鞋</h3></a><del>￥580</del><em>￥239</em></li>
				<li><a href="http://www.shopin.net/product/1978028.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/12/13/Pic1978028_48014_0_1.jpg" width="220" height="220"><h3>adidas男士多功能室内鞋</h3></a><del>￥580</del><em>￥299</em></li>
				<li><a href="http://www.shopin.net/product/2146045.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/12/13/Pic2146045_48014_0_1.jpg" width="220" height="220"><h3>adidas男士清风系列跑鞋</h3></a><del>￥480</del><em>￥199</em></li>
				<li><a href="http://www.shopin.net/product/1815008.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/12/13/Pic1815008_48014_0_1.jpg" width="220" height="220"><h3>adidas男士休闲运动鞋</h3></a><del>￥460</del><em>￥199</em></li>
<!--li><a href="http://www.shopin.net/product/2092594.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/07/Pic2092594_133470_0.resize_to.130x130.jpg" /><h3>Kazelaze白鸭绒中长款羽绒服</h3></a><del>￥2880</del><em>￥288</em></li>
<li><a href="http://www.shopin.net/product/1910046.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/07/16/Pic1910046_187288_0.resize_to.130x130.jpg" /><h3>OURSHINE白鸭绒中长款羽绒服</h3></a><del>￥878</del><em>￥199</em></li>
<li><a href="http://www.shopin.net/product/1939136.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/12/Pic1939136_189443_0.resize_to.130x130.jpg" /><h3>飘莱白鸭绒中长款羽绒服</h3></a><del>￥850</del><em>￥249</em></li>
<li><a href="http://www.shopin.net/product/2071346.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/13/Pic2071346_204782_0.resize_to.130x130.jpg" /><h3>WAYONLY靓丽时尚大衣</h3></a><del>￥1399</del><em>￥85</em></li>
<li><a href="http://www.shopin.net/product/1910035.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/06/19/Pic1910035_187273_0.resize_to.130x130.jpg" /><h3>OURSHINE白鸭绒中长款羽绒服</h3></a><del>￥878</del><em>￥199</em></li>
<li><a href="http://www.shopin.net/product/1998023.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/24/Pic1998023_198262_2.resize_to.130x130.jpg" /><h3>WAYONLY靓丽时尚外套</h3></a><del>￥1098</del><em>￥128</em></li-->
<li><a href="http://www.shopin.net/product/570210.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/01/17/Pic570210_85000_0.resize_to.130x130.jpg" /><h3>蒙丹米尔100%羊绒衫</h3></a><del>￥1680</del><em>￥199</em></li>
<li><a href="http://www.shopin.net/product/2032548.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/29/Pic2032548_77583_0.resize_to.130x130.jpg" /><h3>KELIYA时尚100%羊绒衫</h3></a><del>￥1980</del><em>￥139</em></li>
<li><a href="http://www.shopin.net/product/2030217.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/13/Pic2030217_77583_0.resize_to.130x130.jpg" /><h3>KELIYA靓丽时尚100%羊绒衫</h3></a><del>￥1980</del><em>￥199</em></li>
<li><a href="http://www.shopin.net/product/2051586.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/24/Pic2051586_199440_0.resize_to.130x130.jpg" /><h3>蒙派时尚100%羊绒衫</h3></a><del>￥1099</del><em>￥92</em></li>
<li><a href="http://www.shopin.net/product/1574436.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/09/06/Pic1574436_84996_0.resize_to.130x130.jpg" /><h3>蒙丹米尔时尚100%羊绒衫</h3></a><del>￥1589</del><em>￥199</em></li>
<li><a href="http://www.shopin.net/product/2060538.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/30/Pic2060538_201182_0.resize_to.130x130.jpg" /><h3>洋宾燕时尚中长款100%羊绒衫</h3></a><del>￥1289</del><em>￥199</em></li>
<li><a href="http://www.shopin.net/product/1581089.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/02/10/Pic1581089_15375_0.resize_to.130x130.jpg" /><h3>莱尔斯丹时尚羊皮中靴</h3></a><del>￥1598</del><em>￥399</em></li>
<li><a href="http://www.shopin.net/product/2115643.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/11/05/Pic2115643_108098_0.resize_to.130x130.jpg" /><h3>BOOSARR时尚牛皮短棉靴</h3></a><del>￥1380</del><em>￥288</em></li>
<li><a href="http://www.shopin.net/product/2151273.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/12/07/Pic2151273_213557_0.resize_to.130x130.jpg" /><h3>IUGGIRL专柜时尚雪地靴</h3></a><del>￥478</del><em>￥215</em></li>
<li><a href="http://www.shopin.net/product/2137938.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/11/28/Pic2137938_179527_0.resize_to.130x130.jpg" /><h3>COZY STEPS时尚长靴</h3></a><del>￥3580</del><em>￥399</em></li>
<li><a href="http://www.shopin.net/product/1764339.html " target="_blank"><img src="http://images.shopin.net/images/60/2012/05/04/Pic1764339_37185_0_1.jpg" /><h3>百思图纯牛皮女鞋</h3></a><del>￥839</del><em>￥238</em></li>
<li><a href="http://www.shopin.net/product/1566450.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/12/15/Pic1566450_9011_0.resize_to.130x130.jpg" /><h3>策乐时尚户外鞋</h3></a><del>￥1338</del><em>￥388</em></li>
			</ul>
		</div>
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
