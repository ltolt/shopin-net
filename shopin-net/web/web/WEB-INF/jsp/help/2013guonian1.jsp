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
.area .item { overflow:hidden}
.area .item ul { margin-left:-8px; _zoom:1;}
.area .item li { float:left; width:220px; margin:8px 0 0 8px; _display:inline;}
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
.popform .tips { display:none; color:#f00}

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
           $('#guessmoblie_div .tips').show().html('手机号不能为空')
           return;
        }else{
          $('#guessmoblie_div .tips').show().html('');
        }
        var valid=/^1\d{10}$/.test(guessmobile);
        if(!valid){
           $('#guessmoblie_div .tips')
						.show().html('手机号不正确');
						return;
        }else{
           $('#guessmoblie_div .tips').show().html('');
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
                       $('#guessmoblie_div .tips').show().html('');
                       $('#guessname_div .tips').show().html('');
                       $('#guessmobile').val(result.message);
                       popboxTips();
                    }
                }
         });

}
//下面是提交成功后的提示信息 写入 .popCon 的层下即可
//$(".popCon").html("<div class='logintips'><strong>提交成功！</strong><p>请于2013年1月8日20点登录夜场专区抢购！</p></div>");
</script>
</head>

<body>
<div class="box">
	<img src="http://images.shopin.net/images/ad/2013guonian/top1.jpg"><img src="http://images.shopin.net/images/ad/2013guonian/top2.jpg"><img class="mt" src="http://images.shopin.net/images/ad/2013guonian/t2.png">
	<h2 class="title mt15">年货大抢节　三波疯抢</h2>
	<h3 class="mt15"><img src="http://images.shopin.net/images/ad/2013guonian/t1.png"></h3>
	<div class="wrap">
		<div class="hd"><h4><span></span>吉祥如意 红色系列</h4><a href="http://www.shopin.net/underwear/list--1079--------.html" target="_blank">更多&gt;&gt;</a></div>
		<div class="prolist">
			<ul>
<li><a href="http://www.shopin.net/product/2053954.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/09/26/Pic2053954_82132_0.resize_to.220x220.jpg" /><h5>丽织纺女士舒棉暖绒倍暖红运套装</h5></a><del>￥438</del><strong>￥99</strong></li>
<li><a href="http://www.shopin.net/product/2036164.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/12/21/Pic2036164_82666_0.resize_to.220x220.jpg" /><h5>俞兆林男士活性竹炭保暖套装</h5></a><del>￥328</del><strong>￥99</strong></li>
<li><a href="http://www.shopin.net/product/2137660.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/12/04/Pic2137660_172951_0.resize_to.220x220.jpg" /><h5>LALPINA金属花形针扣牛皮腰带</h5></a><del>￥249</del><strong>￥136</strong></li>
<li><a href="http://www.shopin.net/product/1466327.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/10/12/Pic1466327_15699_0.resize_to.220x220.jpg" /><h5>GOLF专柜正品男款真皮腰带</h5></a><del>￥168</del><strong>￥80</strong></li>
<li><a href="http://www.shopin.net/product/184828.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/12/14/Pic184828_28929_0.resize_to.220x220.jpg" /><h5>MAND.YAMAN魅力刺绣红运文胸</h5></a><del>￥389</del><strong>￥38</strong></li>
<li><a href="http://www.shopin.net/product/2133539.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/12/28/Pic2133539_200272_0.resize_to.220x220.jpg" /><h5>WAYONLY性感刺绣红运内裤</h5></a><del>￥232</del><strong>￥24</strong></li>
<li><a href="http://www.shopin.net/product/1462136.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/10/12/Pic1462136_1793_0.resize_to.220x220.jpg" /><h5>寓美男款加棉袜子</h5></a><del>￥23</del><strong>￥13</strong></li>
<li><a href="http://www.shopin.net/product/1704055.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/12/31/Pic1704055_84065_0.resize_to.220x220.jpg" /><h5>fioseta男款红运棉袜</h5></a><del>￥49</del><strong>￥19</strong></li>
			</ul>
		</div>
		<div class="salist">
			<ul>
				<li><a href="http://www.shopin.net/promotion/5868.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/sa1.jpg" width="450" height="153"></a></li>
				<li><a href="http://www.shopin.net/promotion/4087.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/sa2.jpg" width="450" height="153"></a></li>
			</ul>
		</div>
		<div class="hd mt15"><h4><span></span>年货大抢　温暖回家</h4><a href="http://www.shopin.net/list--1740-0.05-0.3-----1-.html" target="_blank">更多&gt;&gt;</a></div>
		<div class="prolist">
			<ul>
<li><a href="http://www.shopin.net/product/1519718.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/27/Pic1519718_136642_0.resize_to.220x220.jpg" /><h5>秋水伊人欧美风立领双排扣大衣</h5></a><del>￥1238</del><strong>￥371</strong></li>
<li><a href="http://www.shopin.net/product/2079535.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic2079535_161817_0.resize_to.220x220.jpg" /><h5>WAYONLY靓丽糖果色长款棉服</h5></a><del>￥1288</del><strong>￥98</strong></li>
<li><a href="http://www.shopin.net/product/813019.html" target="_blank"><img src="http://images.shopin.net/images/58/2010/11/04/Pic813019_85749_0.resize_to.220x220.jpg" /><h5>AOZIBINLAI意大利100%狐狸毛坎肩</h5></a><del>￥11800</del><strong>￥2548</strong></li>
<li><a href="http://www.shopin.net/product/1993889.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/11/20/Pic1993889_15375_0.resize_to.220x220.jpg" /><h5>莱尔斯丹时尚牛皮高筒靴</h5></a><del>￥2398</del><strong>￥599</strong></li>
<li><a href="http://www.shopin.net/product/1512080.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/11/09/Pic1512080_60393_0.resize_to.220x220.jpg" /><h5>雅戈尔羊毛棉大衣</h5></a><del>￥3580</del><strong>￥800</strong></li>
<li><a href="http://www.shopin.net/product/2119017.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/11/07/Pic2119017_18398_0.resize_to.220x220.jpg" /><h5>奥古利奥100%羊毛衫</h5></a><del>￥1580</del><strong>￥480</strong></li>
<li><a href="http://www.shopin.net/product/1977464.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/08/11/Pic1977464_14626_0.resize_to.220x220.jpg" /><h5>九牧王羊毛西裤</h5></a><del>￥1265</del><strong>￥380</strong></li>
<li><a href="http://www.shopin.net/product/1559889.html" target="_blank"><img src="http://images.shopin.net/images/63/2011/12/12/Pic1559889_8234_0.resize_to.220x220.jpg" /><h5>策乐舒适防滑男鞋</h5></a><del>￥1098</del><strong>￥260</strong></li>
			</ul>
		</div>
		<div class="salist">
			<ul>
				<li><a href="http://www.shopin.net/promotion/6433.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/sa3.jpg" width="450" height="153"></a></li>
				<li><a href="http://www.shopin.net/promotion/6379.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013guonian/sa4.jpg" width="450" height="153"></a></li>
			</ul>
		</div>
		<div class="lolist">
			<ul>
<li><a href="http://www.shopin.net/list-1412-------0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1412_2.jpg" alt="雪中飞">256元起</a></li>
<li><a href="http://www.shopin.net/list-1881-------0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1881_2.jpg" alt="咔姿莱">低至一折</a></li>
<li><a href="http://www.shopin.net/list-1409-1720-0.3-0.5-----1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1409_2.jpg" alt="雪莲">3-5折</a></li>
<li><a href="http://www.shopin.net/list-1410-1720-0.2-0.6-----1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1410_2.jpg" alt="鹿王">2折起</a></li>
<li><a href="http://www.shopin.net/list-1488-------0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1488_2.jpg" alt="plandoo">￥59起</a></li>
<li><a href="http://www.shopin.net/underwear/brand/list-1476-1068-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1476_2.jpg" alt="丽织纺">2折起</a></li>
<li><a href="http://www.shopin.net/underwear/brand/list-174-1068-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/174_2.jpg" alt="北极绒">￥99蜂抢</a></li>
<li><a href="http://www.shopin.net/list-249-1824------0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/249_2.jpg" alt="TATA">2.4折起</a></li>
<li><a href="http://www.shopin.net/list-247-1824------0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/247_2.jpg" alt="Teemix">2折起</a></li>
<li><a href="http://www.shopin.net/list-220-1382------0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/220_2.jpg" alt="SATCHI">￥288起</a></li>
<li><a href="http://www.shopin.net/list-184-1067-0.05-0.3----0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/184_2.jpg" alt="CELE">3折封</a></li>
<li><a href="http://www.shopin.net/list-1295-1855------0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1295_2.jpg" alt="LIFE HOME">￥36超值BUY</a></li>
<li><a href="http://www.shopin.net/home/brand/list-2333-1855-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/2333_2.jpg" alt="法尔曼">3折封</a></li>
<li><a href="http://www.shopin.net/outdoor/brand/list-591-1066-0.2-0.6-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/591_2.jpg" alt="探路者">2折起</a></li>
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
	<div class="area">
		<h2 class="title nobg">全家欢乐购　3折封</h2>
		<ul class="tab-hd">
			<li class="cur">第一波　1.8-1.14</li>
			<li>第二波　1.15-1.21</li>
		</ul>
		<div class="tab-bd">
			<div class="item">
				<ul>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
			</div>
			<div class="item">
			2
			</div>
		</div>
	</div>
	<div class="area mt15">
	<h2 class="title nobg">新签年　上品喊你来签到！</h2>
	<div class="rules">
	<h6>活动细则：</h6>
		<p>活动期间，凡登录上品折扣网并完善手机号码的顾客，将会即时收到上品折扣网发送的2013年会员独享夜市入场券电子代码短信，凭此代码，可进入上品折扣网举办的2013会员独享夜市专区，独享海量超值优惠商品，尽享购物乐趣！</p>
	<h6>活动时间：2013.1.8-2013.1.14</h6>
	<h6 class="mt">会员独享夜市时间：</h6>
	<p>2013年1月15日-2013年1月16日   每天20:00-24:00  敬请期待！</p>
	<a class="ticket" href="javascript:mysign();"><img src="http://images.shopin.net/images/ad/2013guonian/btn.png"></a>
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
