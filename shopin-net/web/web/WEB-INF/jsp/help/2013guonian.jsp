<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>新年巨惠,红红火火过大年，年货大抢节,三波疯抢0.9折起,红袖,秋水伊人,雪中飞,雪莲,羊绒,羽绒,保暖内衣,全家购3折封顶,1.4-1.22</title>
<style>
img{ vertical-align:top}
body{background-image:url(about:blank);background-attachment:fixed}
.cl{clear:both}
.clear:after { height:0; clear:both; content:"."; visibility:hidden; display:block;}
.zm{_zoom:1}
.mt{margin-top:10px}
.mt15 { margin-top:15px}
.tc{text-align:center}
#header, .backgroundffffff { width:950px; margin:0 auto}
#page { width:auto; position:static;}
.box { width:950px; margin:10px auto; padding-bottom:10px; background:#6c0000}
h2.title { height:60px; text-align:center; font:600 35px/54px 'microsoft yahei','simhei'; color:#f9e492; background:#b40605;}
.wrap { padding:0 20px 10px; border-bottom:2px solid #fbe990}
.hd { padding:0 6px; border-bottom:1px dashed #f9e492}
.hd, .hd a { color:#f9e492}
.hd span { width:11px; height:11px; line-height:11px; margin-right:11px; overflow:hidden; display:inline-block; _display:inline; _zoom:1; *vertical-align:middle; background:#f9e492}
.hd h4 { font:600 16px/28px 'microsoft yahei','simhei';}
.hd a { float:right; margin-top:-22px}
/*prolist*/
.prolist { overflow:hidden}
.prolist { margin:10px 0 0 -6px; _zoom:1}
.prolist li { float:left; width:222px; margin:0 0 10px 7px; _display:inline; text-align:center;}
.prolist li a, .prolist li a h5, .prolist li a:hover h5, .prolist li del, .prolist li strong { color:#fff}
.prolist li h5 { height:26px; overflow:hidden; font:normal 12px/30px simsun;}
.prolist li strong { margin-left:11px}
/*salist*/
.salist { overflow:hidden}
.salist ul { margin-left:-10px; _zoom:1;}
.salist li { float:left; width:450px; margin:10px 0 0 10px; _display:inline;}
/*lolist*/
.lolist { overflow:hidden}
.lolist ul { margin-left:-2px; _zoom:1;}
.lolist li { float:left; width:126px; margin:10px 0 0 4px; _display:inline; text-align:center}
.lolist li a { color:#fff}
.lolist li img { width:126px; height:86px; display:block}
/*none*/
.nobg { background:none!important}
.nobd { border:none!important}
/*area*/
.area { width:950px; overflow:hidden; padding-bottom:20px; margin-top:20px; border:2px solid #fbe990; border-width:2px 0}
.area .tab-hd { width:956px; height:84px; overflow:hidden; background:url(http://images.shopin.net/images/ad/2013guonian/bg.png)}
.area .tab-hd li { float:left; width:442px; height:66px; padding-left:30px; margin-right:6px; _display:inline; overflow:hidden; cursor:pointer; font:600 24px/66px 'microsoft yahei','simhei'; color:#fff; background:#c20201}
.area .tab-hd li.cur { color:#000; background:url(http://images.shopin.net/images/ad/2013guonian/tbg.png) repeat-x 0 0}
.area .tab-bd { margin:0 23px}
/*brand list*/
.area .item { overflow:hidden}
.area .item ul { margin-left:-8px; _zoom:1;}
.area .item li { float:left; width:220px; height:220px; margin:8px 0 0 8px; _display:inline; position:relative;}
.area .item .titlebar,.area .item .titlebox{width:100%;height:60px;position:absolute;left:0;bottom:0;z-index:99;}
.area .item .titlebar {background:#000;filter:Alpha(opacity=70);-moz-opacity:.7;opacity:.7;}
.area .item li.hover .titlebox{background:#fe4504;color:#fff!important}
.area .item li.hover .titlebox .brand-sale { color:#fff!important}
.area .item .titlebox{width:220px;height:50px;padding:5px 10px}
.area .item .titlebox span{height:50px;float:left;zoom:1;overflow:hidden;word-wrap:break-word;}
.brand-logo{width:98px;}
.brand-sale{width:106px;font:600 24px/50px 'microsoft yahei','airal';color:#f9f75b}
.brand-text{width:107px;text-align:right;font:600 14px/50px 'microsoft yahei','airal';color:#fff}
.brand-list li.hover .brand-sale{color:#fff}

/*rules*/
.rules { height:200px; margin:0 75px; overflow:hidden; font:600 14px/24px 'microsoft yahei','simhei'; color:#fbe990}
.rules p { margin-bottom:10px; text-indent:2em}
.ticket { float:right; margin:-52px 40px 0 0; _display:inline}

/*popform*/
.popform li { line-height:22px; margin-top:15px}
.popform label.formlabel { width:130px; display:inline-block; *display:inline; *zoom:1; text-align:right; vertical-align:top}
.popform .coll { display:inline-block; *display:inline; *zoom:1;}
.popform input { vertical-align:middle}
.popform .poptxt { width:185px; height:22px; padding-left:3px; font:normal 14px/22px simsun; border:1px solid #8c8c8c; background:url(http://images.shopin.net/images/ad/hyqd/boxbg-it.png) 0 0}
.popform .popbtn { width:95px; height:30px; font-weight:600; cursor:pointer; border:none; background:url(http://images.shopin.net/images/ad/2013guonian/btnbg.png)}
.popform .tips { display:none; height:21px; color:#f00}

/*popbox*/
#popbox{ display:none; position:fixed; _position:absolute; width:400px; z-index:100; padding-bottom:20px; border:2px solid #ec560d; background:#fff}
#popbox .pbt { padding:6px; text-align:right}
#popbox .pbt a  { width:17px; height:17px; line-height:99px; display:inline-block; _display:inline; _zoom:1; overflow:hidden; background:url(http://images.shopin.net/images/ad/2013guonian/popclose.png) no-repeat 0 0;}
#popbox .pinner { margin-top:13px}
/*popbox tab*/
#popbox .tab-hd { position:relative; width:243px; padding-left:45px; margin:0 auto; background:url(http://images.shopin.net/images/ad/hyqd/boxhd-l.png) 0 bottom no-repeat}
#popbox .tab-hd li { float:left; width:91px; height:22px; line-height:22px; margin-right:7px; text-align:center; cursor:pointer; background:url(http://images.shopin.net/images/ad/hyqd/boxbg-ib.png);color:#fff}
#popbox .tab-hd li.cur { font-weight:600; background:url(http://images.shopin.net/images/ad/hyqd/boxbg-ib.png) 0 -23px}
#popbox .tab-hd li.cur a, .tab-hd li a, .tab-hd li a:hover { outline:none; color:#fff}
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
.logintips {text-align:center;margin:50px 0}
.logintips a { margin:0 3px; color:#0360af}
.logintips strong { font-weight:600; display:block; margin:-25px 0 10px; _zoom:1;}
</style>
<script>
//选项卡
$(function(){
//   $(".tab-bd .item:not(:first)").hide();
//    function tabs(tabTit,on,tabCon){
//	$(tabCon).each(function(){
//	  $(this).children().eq(0).show();
//	  });
//	$(tabTit).each(function(){
//	  $(this).children().eq(0).addClass(on);
//	  });
//     $(tabTit).children().click(function(){
//        $(this).addClass(on).siblings().removeClass(on);
//         var index = $(tabTit).children().index(this);
//         $(tabCon).children().eq(index).show().siblings().hide();
//    });
//     }
//  tabs(".tab-hd","cur",".tab-bd");
	//鼠标移上事件
	$(".area .item li").hover(function(){
		$(this).addClass("hover");
			},function(){
		$(this).removeClass("hover").end();
	})
});
//登录注册层
function popbox(){
	$('#mask').show();
	$("#mask").css("height",$(document).height());
	$("#mask").css("width",$(window).width());
	$('.tipsBox').hide();
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
                   .show().html('邮箱地址不能为空')
           return;
        }
        var valid=/^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(username);
        if(!valid){
           verifyCodeIsValid=false;
           $('#username_div .tips')
                   .show().html('邮箱地址不正确')
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
                            .show().html('邮箱地址已经存在,请换一个')
                },
                success: function(response){
                    var result=response.result;
                    if(result.status=='1'){
                      usernameIsValid=true;
                    }else{
                      usernameIsValid=false;
                    }
                    $('#username_div .tips')
                              .show().html(''+result.message+'')
                }
         });
    }
    function validateMobile(){
        var mobile=$.trim($('#mobile').val());
        if(mobile==''){
           verifyCodeIsValid=false;
           $('#mobile_div .tips')
                   .show().html('手机号不能为空')
           return;
        }
        var valid=/^1\d{10}$/.test(mobile);
        if(!valid){
           verifyCodeIsValid=false;
           $('#mobile_div .tips')
                   .show().html('手机号不正确')
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
                            .show().html('')
                },
                success: function(response){
                    var result=response.result;
                    if(result.status=="03"){
                        usernameIsValid=false;
                    }
                    $('#mobile_div .tips')
                            .show().html(''+result.message+'')
                }

         });
        return true;
    }

    <%--校验密码--%>
    function validatePassword(){
        var password=$.trim($('#password').val());
        if(password.length<6){
           $('#password_div .tips')
                   .show().html('密码输入不正确')
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
                  .show().html('两次密码输入不一致')
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
                       .show().html('邮箱地址不能为空')
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
                      .show().html('验证码不能为空')
                 flag=false;
        }else{
              $('#verifycode_div .tips')
                      .show().html('')
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

function validate1() {
    var flag = true;
    if (!validateUsername1()) {
        flag = false;
    }
    if (!validatePassword1()) {
        flag = false;
    }
    if (!validateVerifyCode1()) {
        flag = false;
    }
    return flag;
}


function validateUsername1() {
    var username = $('#username1').val();
    if (username == '') {
        $('#username_div1 .tips').show().html('邮箱地址不能为空')
        return false;
    }
    var valid = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(username);
    if (!valid) {
        $('#username_div1 .tips')
                   .show().html('邮箱地址不正确')
        return false;
    }
    $('#username_div1 .tips').show().html('');
	$('#password1').focus();
    return true;
}
<%--校验密码--%>
function validatePassword1() {
    var password = $('#password1').val();
    if (password == '') {
        $('#password_div1 .tips').show().html('密码不能为空')
        return false;
    }
    $('#password_div1 .tips').show().html('');
	$('#verifycode1').focus();
    return true;
}
function validateVerifyCode1() {
    var verifyCode = $('#verifycode1').val();
    if (verifyCode == '') {
        $('#verifycode_div1 .tips').show().html('验证码不能为空')
        return false;
    }
    $('#verifycode_div1 .tips').show().html('');
    return true;
}





function doLogin() {
    if (!validate1()) {
        return;
    }
   $("#login_form").get(0).submit();
}


<%--刷新验证码--%>
    function refreshCaptcha(){
		$('#captchaImg').attr('src',"${ctx}/jcaptcha.jpg?"+Math.round(Math.random()*100000));
	}

function signup(){
    var guessmobile=$.trim($('#guessmobile').val());
        if(guessmobile==''){
           $('#guessmoblie_div .tips').show().text('手机号不能为空')
           return;
        }else{
          $('#guessmoblie_div .tips').hide().html('');
        }
        var valid=/^1\d{10}$/.test(guessmobile);
        if(!valid){
           $('#guessmoblie_div .tips').show().text('手机号不正确')
						return;
        }else{
           $('#guessmoblie_div .tips').hide().html('');
        }
    $.ajax({
			url:'${ctx}/code/getCode.json',
			type: 'post',
			dataType: 'json',
			data:{'mobile':guessmobile},
			timeout: 30000,
			error: function(){
					//usernameIsValid=false;
					//$('#orderNo_div .tips').show().html('')
			},
			success: function(response){
					var result=response.result;
					alert(result.message);
					popclose();
			}
	 });
}

function mysign(proSid){
   $.ajax({
			url:'${ctx}/code/isLogin.json',
			type: 'post',
			dataType: 'json',
			data:{},
			timeout: 30000,
			error: function(){
			},
			success: function(response){
					var result=response.result;
					if(result.status=="00"){
						 popbox();
					}else{
						 $('#proSid').val(proSid);
						 $('#guessmoblie_div .tips').hide().html('');
						 $('#guessname_div .tips').show().html('');
						 $('#guessmobile').val(result.message);
						 popboxTips();
					}
			}
		});
}
</script>
</head>

<body>
<div class="box">
	<img src="http://images.shopin.net/images/ad/2013guonian/top1.jpg"><img src="http://images.shopin.net/images/ad/2013guonian/top2.jpg"><img class="mt" src="http://images.shopin.net/images/ad/2013guonian/t2.png">
	<div class="area">
		<ul class="tab-hd">
			<li>第一波　1.8-1.14</li>
			<li class="cur">第二波　1.15-1.21</li>
		</ul>
		<div class="tab-bd">
			<div class="item">
				<ul>
<li>
<a href="http://www.shopin.net/promotion/3887.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/act01.jpg" /></a>
<div class="titlebar"></div>
<div class="titlebox">
<span class="brand-logo"><img style="border-top:14px solid #fff;border-bottom:13px solid #fff;" src="http://images.shopin.net/images/brand/2007_2.jpg" width="74" ></span>
<span class="brand-sale">一口价</span>
</div>
</li>
<li>
<a href="http://www.shopin.net/promotion/6712.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/act02.jpg" /></a>
<div class="titlebar"></div>
<div class="titlebox">
<span class="brand-logo"><img src="http://images.shopin.net/images/brand/2198_2.jpg" width="74" ></span>
<span class="brand-sale">一口价</span>
</div>
</li>
<li>
<a href="http://www.shopin.net/promotion/6118.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/act03.jpg" /></a>
<div class="titlebar"></div>
<div class="titlebox">
<span class="brand-logo"><img src="http://images.shopin.net/images//brand/1504_2.jpg" width="74" ></span>
<span class="brand-sale">3折封</span>
</div>
</li>
<li>
<a href="http://www.shopin.net/promotion/6438.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/act04.jpg" /></a>
<div class="titlebar"></div>
<div class="titlebox">
<span class="brand-logo"><img src="http://images.shopin.net/images/brand/287_2.jpg" width="74" ></span>
<span class="brand-sale">立省千元</span>
</div>
</li>
<li>
<a href="http://www.shopin.net/promotion/3988.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/act05.jpg" /></a>
<div class="titlebar"></div>
<div class="titlebox">
<span class="brand-logo"><img src="http://images.shopin.net/images/brand/1357_2.jpg" width="74" ></span>
<span class="brand-sale">2折起</span>
</div>
</li>
<li>
<a href="http://www.shopin.net/promotion/5262.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/act06.jpg" /></a>
<div class="titlebar"></div>
<div class="titlebox">
<span class="brand-logo"><img src="http://images.shopin.net/images/brand/1297_2.jpg" width="74" ></span>
<span class="brand-sale">2折起</span>
</div>
</li>
<li>
<a href="http://www.shopin.net/promotion/6713.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/act07.jpg" /></a>
<div class="titlebar"></div>
<div class="titlebox">
<span class="brand-logo"><img style="border-top:11px solid #fff;border-bottom:10px solid #fff;" src="http://images.shopin.net/images//brand/2047_2.jpg" width="74" ></span>
<span class="brand-sale">3折封</span>
</div>
</li>
<li>
<a href="http://www.shopin.net/promotion/6396.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/act08.jpg" /></a>
<div class="titlebar"></div>
<div class="titlebox">
<span class="brand-logo"><img src="http://images.shopin.net/images//brand/262_2.jpg" width="74" ></span>
<span class="brand-sale">2折起</span>
</div>
</li>
				</ul>
			</div>
		</div>
	</div>
	<h2 class="title mt15">年货大抢节　三波疯抢</h2>
	<h3 class="mt15"><img src="http://images.shopin.net/images/ad/2013guonian/t3.png"></h3>
	<div class="wrap">
		<div class="hd"><h4><span></span>全家新年换新鞋</h4><a href="http://www.shopin.net/shoes/list--1824-0.05-0.3------.html" target="_blank">更多&gt;&gt;</a></div>
		<div class="prolist">
			<ul>
<li><a href="http://www.shopin.net/product/2120349.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/11/08/Pic2120349_37189_0.resize_to.220x220.jpg" /><h5>百思图百搭黑色真皮长靴</h5></a><del>￥1799</del><strong>￥519</strong></li>
<li><a href="http://www.shopin.net/product/845368.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/07/17/Pic845368_12736_0.resize_to.220x220.jpg" /><h5>千百度真皮长靴</h5></a><del>￥1759</del><strong>￥499</strong></li>
<li><a href="http://www.shopin.net/product/2122307.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/12/Pic2122307_182206_0.resize_to.220x220.jpg" /><h5>Josiny时尚坡跟长靴</h5></a><del>￥699</del><strong>￥298</strong></li>
<li><a href="http://www.shopin.net/product/1432820.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/09/23/Pic1432820_11123_0.resize_to.220x220.jpg" /><h5>红蜻蜓百搭长靴</h5></a><del>￥1139</del><strong>￥299</strong></li>
<li><a href="http://www.shopin.net/product/1566450.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/12/15/Pic1566450_9011_0.resize_to.220x220.jpg" /><h5>策乐高帮男靴</h5></a><del>￥1338</del><strong>￥390</strong></li>
<li><a href="http://www.shopin.net/product/1503060.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/10/31/Pic1503060_7913_0.resize_to.220x220.jpg" /><h5>金盾真皮高帮男靴</h5></a><del>￥1580</del><strong>￥433</strong></li>
<li><a href="http://www.shopin.net/product/1715450.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/11/01/Pic1715450_97681_0.resize_to.220x220.jpg" /><h5>森达真皮男靴</h5></a><del>￥1099</del><strong>￥328</strong></li>
<li><a href="http://www.shopin.net/product/2106950.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/11/07/Pic2106950_11394_0.resize_to.220x220.jpg" /><h5>红蜻蜓内里带毛男靴</h5></a><del>￥739</del><strong>￥222</strong></li>
<li><a href="http://www.shopin.net/product/2112510.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/02/Pic2112510_48504_0.resize_to.220x220.jpg" /><h5>史努比卡通加绒小棉鞋</h5></a><del>￥148</del><strong>￥74</strong></li>
<li><a href="http://www.shopin.net/product/647608.html" target="_blank"><img src="http://images.shopin.net/images/58/2010/12/06/Pic647608_2318_0.resize_to.220x220.jpg" /><h5>DorDor House女童牛皮翻毛靴</h5></a><del>￥368</del><strong>￥110</strong></li>
<li><a href="http://www.shopin.net/product/889366.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/11/11/Pic889366_148702_0.resize_to.220x220.jpg" /><h5>CROCS女童时尚翻毛中筒靴</h5></a><del>￥459</del><strong>￥159</strong></li>
<li><a href="http://www.shopin.net/product/2118730.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/12/04/Pic2118730_210652_0.resize_to.220x220.jpg" /><h5>永高人亮面黄金纽扣装饰皮靴</h5></a><del>￥363</del><strong>￥182</strong></li>
			</ul>
		</div>
		<div class="salist">
			<ul>
				<li><a href="http://www.shopin.net/promotion/4134.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/sa-women.jpg" width="450" height="153"></a></li>
				<li><a href="http://www.shopin.net/promotion/6716.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/sa-man.jpg" width="450" height="153"></a></li>
			</ul>
			<a href="http://www.shopin.net/promotion/6583.html" target="_blank"><img class="mt" src="http://images.shopin.net/images/ad/2013guonian/sa-child.jpg" width="910" height="153"></a>
		</div>
		<div class="lolist">
			<ul>
<li><a href="http://www.shopin.net/shoes/brand/list-256-1824.html" target="_blank"><img src="http://images.shopin.net/images/brand/256_2.jpg" alt="莱尔斯丹">低至1.2折</a></li>
<li><a href="http://www.shopin.net/list-969-1067------0-1-/2.html" target="_blank"><img src="http://images.shopin.net/images//brand/969_2.jpg" alt="百思图">￥198起</a></li>
<li><a href="http://www.shopin.net/shoes/brand/list-319-1067-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/319_2.jpg" alt="红蜻蜓">3折封</a></li>
<li><a href="http://www.shopin.net/shoes/brand/list-220-1382.html" target="_blank"><img src="http://images.shopin.net/images/brand/220_2.jpg" alt="SATCHI">2折起</a></li>
<li><a href="http://www.shopin.net/shoes/brands/184.html" target="_blank"><img src="http://images.shopin.net/images/brand/184_2.jpg" alt="CELE">2.2折起</a></li>
<li><a href="http://www.shopin.net/children/list-751-1127--------.html" target="_blank"><img src="http://images.shopin.net/images//brand/751_2.jpg" alt="ABCKIDS ">￥88起</a></li>
<li><a href="http://www.shopin.net/list-206-1127------0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/206_2.jpg" alt="史努比">2.5折起</a></li>
			</ul>
		</div>
		<div class="hd mt15"><h4><span></span>年终犒赏自己</h4><a href="http://www.shopin.net/list--1734.html" target="_blank">更多&gt;&gt;</a></div>
		<div class="prolist">
			<ul>
<li><a href="http://www.shopin.net/product/2038987.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/18/Pic2038987_188748_0.resize_to.220x220.jpg" /><h5>温娜轻奢兔皮造革女上衣</h5></a><del>￥3300</del><strong>￥388</strong></li>
<li><a href="http://www.shopin.net/product/812854.html" target="_blank"><img src="http://images.shopin.net/images/61/2010/12/17/Pic812854_85749_0.resize_to.220x220.jpg" /><h5>AOZIBINLAI意大利品质狐狸毛皮草坎肩</h5></a><del>￥6980</del><strong>￥1693</strong></li>
<li><a href="http://www.shopin.net/product/2051240.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/10/12/Pic2051240_92188_0.resize_to.220x220.jpg" /><h5>谷子高贵奢华滩羊毛背心</h5></a><del>￥3599</del><strong>￥1110</strong></li>
<li><a href="http://www.shopin.net/product/2046029.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/09/28/Pic2046029_158077_0.resize_to.220x220.jpg" /><h5>马里萨羊皮夹克</h5></a><del>￥10800</del><strong>￥1090</strong></li>
<li><a href="http://www.shopin.net/product/1568646.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/12/21/Pic1568646_134813_0.resize_to.220x220.jpg" /><h5>帕古茨皮草内里真皮皮衣</h5></a><del>￥46800</del><strong>￥10000</strong></li>
<li><a href="http://www.shopin.net/product/2079700.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/12/24/Pic2079700_15561_0.resize_to.220x220.jpg" /><h5>洛萨里奥水貂毛领皮衣</h5></a><del>￥15900</del><strong>￥3150</strong></li>
<li><a href="http://www.shopin.net/product/2122146.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/11/09/Pic2122146_197566_0.resize_to.220x220.jpg" /><h5>CAESAR水貂毛领尼克服</h5></a><del>￥9800</del><strong>￥2450</strong></li>
<li><a href="http://www.shopin.net/product/2030985.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/11/02/Pic2030985_94263_0.resize_to.220x220.jpg" /><h5>罗弗帝奇水貂毛领尼克服</h5></a><del>￥5980</del><strong>￥1380</strong></li>
			</ul>
		</div>
		<div class="salist">
			<ul>
				<li><a href="http://www.shopin.net/promotion/6715.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/sa-nick.jpg" width="450" height="153"></a></li>
				<li><a href="http://www.shopin.net/promotion/3739.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/sa-fur.jpg" width="450" height="153"></a></li>
			</ul>
		</div>
		<div class="lolist">
			<ul>
<li><a href="http://www.shopin.net/brands/1299.html" target="_blank"><img src="http://images.shopin.net/images/brand/1299_2.jpg" alt="温娜儿">￥288起</a></li>
<li><a href="http://www.shopin.net/brands/1504.html" target="_blank"><img src="http://images.shopin.net/images/brand/1504_2.jpg" alt="AOZIBINLAI">3折封</a></li>
<li><a href="http://www.shopin.net/brands/1874.html" target="_blank"><img src="http://images.shopin.net/images/brand/1874_2.jpg" alt="奥豹">2折起</a></li>
<li><a href="http://www.shopin.net/list-2047-1736-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/2047_2.jpg" alt="马里萨">3折封</a></li>
<li><a href="http://www.shopin.net/man/list-1577-1180--------.html" target="_blank"><img src="http://images.shopin.net/images//brand/1577_2.jpg" alt="罗弗帝奇">1-3折</a></li>
<li><a href="http://www.shopin.net/man/list-412-1728--------.html" target="_blank"><img src="http://images.shopin.net/images//brand/412_2.jpg" alt="帕古茨">3折封</a></li>
<li><a href="http://www.shopin.net/man/list-1582-1728--------.html" target="_blank"><img src="http://images.shopin.net/images//brand/1582_2.jpg" alt="CAESAR">3折封</a></li>
			</ul>
		</div>
	</div>
	<h2 class="title nobg mt">全家欢乐购　3折封</h2>
	<div class="wrap nobd mt">
		<div class="salist">
			<ul>
<li><a href="http://www.shopin.net/promotion/6696.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/img1.jpg" width="450" height="153"></a></li>
<li><a href="http://www.shopin.net/promotion/6693.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/img2.jpg" width="450" height="153"></a></li>
<li><a href="http://www.shopin.net/promotion/6695.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/img3.jpg" width="450" height="153"></a></li>
<li><a href="http://www.shopin.net/promotion/6697.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/img4.jpg" width="450" height="153"></a></li>
<li><a href="http://www.shopin.net/promotion/6694.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/img5.jpg" width="450" height="153"></a></li>
<li><a href="http://www.shopin.net/promotion/6692.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/img6.jpg" width="450" height="153"></a></li>
			</ul>
			<div class="mt"><a href="http://www.shopin.net/promotion/6698.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/img7.jpg" width="910" height="153"></a></div>

		</div>
	</div>
	<div id="qd" class="area mt15">
	<h2 class="title nobg">新签年　上品喊你来签到！</h2>
	<div class="rules">
	<h6>活动细则：</h6>
		<p>活动期间，凡登录上品折扣网并完善手机号码的顾客，将会即时收到上品折扣网发送的2013年会员独享夜市入场券电子代码短信，凭此代码，可进入上品折扣网举办的2013会员独享夜市专区，独享海量超值优惠商品，尽享购物乐趣！</p>
	<h6>活动时间：2013.1.8-2013.1.14</h6>
	<h6 class="mt">会员独享夜市时间：</h6>
	<p>2013年1月15日-2013年1月16日   每天20:00-24:00  敬请期待！</p>
	<!--a class="ticket" href="javascript:mysign();"><img src="http://images.shopin.net/images/ad/2013guonian/btn.png"></a-->
	</div>
	</div>
	<div class="cl"></div>
</div>
<!--登录注册-->
<div id="popbox" class="loginBox">
	<div class="pbt"><a href="javascript:popclose();" title="关闭">关闭</a></div>
	<h1 class="tc"><img src="http://images.shopin.net/images/ad/2013guonian/logo.png"></h1>
	<div class="pbd popCon mt">
		<ul class="tab-hd mt">
		<li class="cur"><a href="javascript:void(0);">新会员注册</a></li>
		<li><a href="javascript:void(0);">老会员登录</a></li>
	</ul>
    <div class="tab-bd pinner zm">
			<div class="item popboxform">
				<form action='${ctx}/register.html' method='post' id="register_form">
					<input type="hidden" id="forward" name="forward" value="${ctx}/help/2013guonian.html">
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
			<div class="item popboxform">
				<form action='${ctx}/code/login.html' method='post' id="login_form">
                     <input type="hidden" id="forward" name="forward" value="${ctx}/help/2013guonian.html">
					<ul>
					<li><label class="formlabel">Email地址：</label><div class="coll" id="username_div1"><input class="form-text" type="text" id='username1' name="j_username"  onBlur="validateUsername1()" onkeydown= "if(event.keyCode==13){validateUsername();}"><i>必填</i><p class="tips"></p></div></li>
					<li><label class="formlabel">密码：</label><div class="coll" id="password_div1"><input class="form-text" type="password" id='password1' name="j_password" onBlur="validatePassword1()" onkeydown= "if(event.keyCode==13){validatePassword();}"><i>必填</i><p class="tips"></p></div></li>
					<li class="vcode"><label class="formlabel">验证码：</label><div class="coll" id="verifycode_div1"><input type="text" class="form-text" id='verifycode1' name="j_captcha" onBlur="validateVerifyCode1()" onkeydown= "if(event.keyCode==13){doLogin();}"><img id="captchaImg" src="${ctx}/jcaptcha.jpg"/>
                        <div><a href="javascript:refreshCaptcha()">看不清楚换一个</a></div><p class="tips"></p></div></li>
					<li><label class="formlabel"></label><div class="coll"><a class="popbox-btn" href="#" onClick="doLogin();"><span>登录</span></a></div></li>
					</ul>
				</form>
			</div>
    </div>
	</div>
</div>
<!--提示信息-->
<div id="popbox" class="tipsBox">
	<div class="pbt"><a href="javascript:popclose();" title="关闭">关闭</a></div>
	<h1 class="tc"><img src="http://images.shopin.net/images/ad/2013guonian/logo.png"></h1>
	<div class="pbd">
        <form>
		<ul class="popform">
			<li><label class="formlabel">手机号码：</label><div class="coll" id="guessmoblie_div"><input id="guessmobile" class="poptxt" type="text" maxlength="11"><p class="tips"></p></div></li>
			<li class="tc"><input class="popbtn" onClick="signup();" type="button" value="提交"></li>
			<li style="width:260px;margin:15px auto 0">录入您的正确手机号码，我们将通过短信将入场券代码发送给您，持此代码可登录夜场专区，独享限时超值商品！</li>
		</ul>
        </form>
	</div>
</div>
<div id="mask"></div>
</body>
</html>
