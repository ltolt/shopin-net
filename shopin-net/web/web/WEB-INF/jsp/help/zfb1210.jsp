<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>上品折扣网携手支付宝,互动赢取IPAD3、淘公仔！</title>
<style>
img{vertical-align:top}
.mt{margin-top:10px}
#page{width:100%;padding:0;}
#box,#header,.backgroundffffff{width:950px;margin:0 auto}
.sp-btns{position:relative; height:140px; background:#ea4609}
.sp-btns a { position:absolute; top:10px}
.sp-btns .btn1{ left:200px}
.sp-btns .btn2{ left:510px}
/*quiz-list*/
.quiz-list { padding:0 0 10px; margin-bottom:10px; background:#eff0e8}
.quiz-list li { float:left; width:220px; display:inline; margin:20px 0 0 14px; text-align:center}
.quiz-list li p { line-height:30px; font-weight:600}
.quiz-list .iwquiz { width:81px; height:22px; cursor:pointer; border:0; background:url(http://images.shopin.net/images/ad/aoyunhui/jcbtn.png) no-repeat 0 0}

/*alertbox*/
.alertbox{display:none;width:450px;padding:5px;position:absolute;z-index:101;background:#eee}
.alertboxhd{height:16px;text-align:right}
.alertinnr{padding:5px;border:3px solid #e85b14;background:#fff}
.alertcont { padding:10px 5px; font:600 14px/30px simsun;}
.alertform{line-height:24px;padding:10px}
.alertform li{ margin-bottom:5px}
.alertform label.formlabel { width:100px; display:inline-block; *display:inline; *zoom:1; text-align:right; vertical-align:top}
.alertform .coll{ display:inline-block; *display:inline; *zoom:1;}
.alertform .coll .form-text{width:250px;height:24px;line-height:24px;padding-left:3px;font-size:14px;border:1px solid #999;font-family:simsun}
.alertform .coll a{margin-left:8px}
.alertform .coll .tips{display:none;color:#f00}
.alertform .alertSumbit { width:93px; height:30px; cursor:pointer; font-weight:bold; background:url(http://images.shopin.net/images/ad/aoyunhui/ok.png); border:0}
.alertform .alertQuizSumbit{ width:93px; height:30px; cursor:pointer; background:url(http://images.shopin.net/images/ad/aoyunhui/ok.png); border:0}
.alertDet { width:78px; height:30px; cursor:pointer; background:url(http://images.shopin.net/images/ad/aoyunhui/btn.png); border:0}
#mask { position:absolute; top:0; left:0; background:#000; opacity:0.5; filter:alpha(opacity=50); display:none; z-index:99; }
.vcode{width:60px!important;margin-right:5px}
</style>
</head>

<body>
<div id="box">
<img class="mt" src="http://images.shopin.net/images/ad/zfb1210/top-ad1.png" align="top">
<img src="http://images.shopin.net/images/ad/zfb1210/top-ad2.png" align="top">
<div class="sp-btns">
<a class="btn1" href="javascript:void(0);"><img src="http://images.shopin.net/images/ad/zfb1210/btn1.png"></a><a class="btn2" href="javascript:void(0);"><img src="http://images.shopin.net/images/ad/zfb1210/btn2.png"></a>
</div>
<a href="http://www.shopin.net/help/manzeng.html" target="_blank"><img class="mt" src="http://images.shopin.net/images/ad/manzeng/ad-manzeng-1102.jpg"></a>
<a href="http://www.shopin.net/help/shuang11.html" target="_blank"><img class="mt" src="http://images.shopin.net/images/ad/shuang11/ad-shuang11-950.jpg"></a>
<img class="mt" src="http://images.shopin.net/images/ad/zfb1210/t1.png" align="top">
<ul class="quiz-list clear zc"><!--alt里为 单品链接-->
<li><img src="http://images.shopin.net/images/ad/zfb1210/pro-01.jpg" alt="1344655" /><p>原价：1499</p><input id="1" class="iwquiz" type="button" value="" /></li>
<li><img src="http://images.shopin.net/images/ad/zfb1210/pro-02.jpg" alt="83660" /><p>原价：1280</p><input id="2" class="iwquiz" type="button" value="" /></li>
<li><img src="http://images.shopin.net/images/ad/zfb1210/pro-03.jpg" alt="1101070" /><p>原价：1190</p><input id="3" class="iwquiz" type="button" value="" /></li>
<li><img src="http://images.shopin.net/images/ad/zfb1210/pro-04.jpg" alt="1480205" /><p>原价：688</p><input id="4" class="iwquiz" type="button" value="" /></li>
<li><img src="http://images.shopin.net/images/ad/zfb1210/pro-05.jpg" alt="1709300" /><p>原价：1199</p><input id="5" class="iwquiz" type="button" value="" /></li>
<li><img src="http://images.shopin.net/images/ad/zfb1210/pro-06.jpg" alt="2088087" /><p>原价：699</p><input id="6" class="iwquiz" type="button" value="" /></li>
<li><img src="http://images.shopin.net/images/ad/zfb1210/pro-07.jpg" alt="1532533" /><p>原价：580</p><input id="7" class="iwquiz" type="button" value="" /></li>
<li><img src="http://images.shopin.net/images/ad/zfb1210/pro-08.jpg" alt="1436516" /><p>原价：979</p><input id="8" class="iwquiz" type="button" value="" /></li>
<li><img src="http://images.shopin.net/images/ad/zfb1210/pro-09.jpg" alt="2050917" /><p>原价：1060</p><input id="9" class="iwquiz" type="button" value="" /></li>
<li><img src="http://images.shopin.net/images/ad/zfb1210/pro-10.jpg" alt="2044905" /><p>原价：1228</p><input id="10" class="iwquiz" type="button" value="" /></li>
<li><img src="http://images.shopin.net/images/ad/zfb1210/pro-11.jpg" alt="1547160" /><p>原价：782</p><input id="11" class="iwquiz" type="button" value="" /></li>
<li><img src="http://images.shopin.net/images/ad/zfb1210/pro-12.jpg" alt="1910046" /><p>原价：878</p><input id="12" class="iwquiz" type="button" value="" /></li>
</ul>
</div>
<!--alertbox-->
<div id="alertTips" class="alertbox">
	<div class="alertinnr" style="text-align:center">
  	<div class="alertboxhd"><a class="close" href="javascript:void(0);" title="关闭"><img src="http://images.shopin.net/images/ad/yure/close.png"></a></div>
    <div class="alertcont">
    您的信息提交成功！<br />上品折扣网将于2012年8月17日公布竞猜中奖名单，敬请关注！<br />更多精彩活动点击：<a href="http://www.shopin.net/" target="_blank">www.shopin.net</a>
    <p><input type="button" class="alertDet" value="确定"></p>
    </div>
	</div>
</div>
<div id="alertForm" class="alertbox">
<div class="alertinnr">
  <div class="alertboxhd"><a class="close" href="javascript:void(0);" title="关闭"><img src="http://images.shopin.net/images/ad/yure/close.png"></a></div>
  <div class="alertform">
   <form action='${ctx}/jcregister.html' method='post' id="register_form">
        <input type="hidden" id="forward" name="forward" value="${ctx}/help/zfb1210.html">
      <ul>
        <li><label class="formlabel">Email地址：</label><div class="coll" id="username_div"><input class="form-text" type="text" name="memEmail" id="username"  onBlur="validateUsername()"><p class="tips"></p></div></li>
        <li><label class="formlabel">手机号码：</label><div class="coll" id="mobile_div"><input class="form-text" type="text" name="iptMobile" id="mobile" maxlength="11" onBlur="validateMobile()"><p class="tips"></p></div></li>
        <li><label class="formlabel">设置密码：</label><div class="coll" id="password_div"><input class="form-text" type="password" name="memPwd"  id="password" onBlur="validatePassword()"><p class="tips"></p></div></li>
        <li><label class="formlabel">确认密码：</label><div class="coll" id="confirm_password_div"><input class="form-text" type="password" name="iptUser" id="confirm_password" onBlur="validateConfirmPassword()"><p class="tips"></p></div></li>
        <li><label class="formlabel">验证码：</label><div class="coll" id="verifycode_div"><input type="text" class="form-text vcode" name="j_captcha" maxlength="5" id="verifycode"><img id="captchaImg" src="${ctx}/jcaptcha.jpg"/>
                  <div><a href="javascript:refreshCaptcha()">看不清楚换一个</a></div><p class="tips"></p></div></li>
          <li><label class="formlabel"></label><div class="coll"><img src="http://images.shopin.net/images/y-m002.gif" onClick="doRegister();"></div></li>
        	<li><label class="formlabel"></label><div class="coll"><label><input type="checkbox" checked><a href="http://www.shopin.net/goRegister.html" target="_blank">上品折扣网服务协议</a></label></div></li>
      </ul>
    </form>
  </div>
</div>
</div>
<div id="alertQuizForm" class="alertbox">
<div class="alertinnr">
  <div class="alertboxhd"><a class="close" href="javascript:void(0);" title="关闭"><img src="http://images.shopin.net/images/ad/yure/close.png"></a></div>
  <div class="alertform">
  	<p style="text-align:center;font-weight:600">竞猜价格和商品价格在￥50以内误差即可参加抽奖~ </p>
    <form>
      <ul>
        <input type="hidden" id="myguess" value=""  />
        <li><label class="formlabel">您的姓名：</label><div class="coll" id="guessname_div"><input class="form-text" type="text"  id="guessname" maxlength="11"><p class="tips"></p></div></li>
        <li><label class="formlabel">联系方式(手机)：</label><div class="coll" id="guessmoblie_div"><input class="form-text" type="text" maxlength="11" id="guessmobile"><p class="tips"></p></div></li>
        <li><label class="formlabel">竞猜商品价格：</label><div class="coll" id="guessprice_div"><input class="form-text" type="text" maxlength="11" id="guessprice"><p class="tips" ></p></div></li>
        <li class="mt"><label class="formlabel">&nbsp;</label><div class="coll"><input class="alertQuizSumbit" type="button" value="&nbsp;" onclick="saveGuessPrice();"></div></li>
      </ul>
    </form>
  </div>
</div>
</div>
<div id="alertOrder" class="alertbox">
	<div class="alertinnr">
  	<div class="alertboxhd"><a class="close" href="javascript:void(0);" title="关闭"><img src="http://images.shopin.net/images/ad/yure/close.png"></a></div>
    <div class="alertform">
    <form>
      <ul>
        <li><label class="formlabel">您的订单号：</label><div class="coll" id="orderNo_div"><input class="form-text" type="text" id="orderNo" ><p class="tips"></p></div></li>
        <li class="mt"><label class="formlabel">&nbsp;</label><div class="coll"><input class="alertSumbit" type="button" value=""  onclick="saveGreatMember();"></div></li>
      </ul>
    </form>
  </div>
	</div>
</div>
<div id="mask" class="mask"></div>
<script>
$(function(){
	//获得焦点改变边框色
	$(".form-text").focus(function(){
		$(this).css("border","1px solid #ea4609");
		})
	//失去焦点还原边框色
	$(".form-text").blur(function(){
		$(this).css("border","1px solid #999");
		})
	//失去焦点显示提示信息
	$(".alertform .form-text").blur(function(){
		$(this).nextAll(".tips").show();
		})
//弹出层
	$('.quiz-list .iwquiz,.sp-btns a').click(function(){
        $("#myguess").val(this.id);
		$('#mask').show();
		$("#mask").css("height",$(document).height());
		$("#mask").css("width",$(window).width());
	    return false;
	});
	$(".btn2").click(function(){
		center($('#alertOrder'));
	return false;
		})


	$(".quiz-list .iwquiz").click(function(){
		center($('#alertQuizForm'));
	return false;
		})
	$(".btn1").click(function(){
		center($('#alertForm'));
	return false;
		})
	// 居中
	function center(obj) { 
	var screenWidth = $(window).width(), screenHeight = $(window).height(); //当前浏览器窗口的 宽高 
	var scrolltop = $(document).scrollTop();//获取当前窗口距离页面顶部高度 
	var objLeft = (screenWidth - obj.width())/2 ; 
	var objTop = (screenHeight - obj.height())/2 + scrolltop; 
	obj.css({left: objLeft + 'px', top: objTop + 'px','display': 'block'}); 
	}
	$("#mask,.close,.alertDet").click(function(){
		$(".alertbox,#mask").hide();
	return false;
		});
});

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



function saveGreatMember(){
    var orderNo=$.trim($('#orderNo').val());
        if(orderNo==''){
           $('#orderNo_div .tips').show().html('<span style=\'color:#ff0000;font-size:12px\'>订单号不能为空</span>');
           return;
        }

    $.ajax({
                url:'${ctx}/saveGreatMember.json',
                type: 'post',
                dataType: 'json',
                data:{'orderNo':orderNo,'flag':'1'},
                timeout: 30000,
                error: function(){
                    usernameIsValid=false;
                    $('#orderNo_div .tips').show().html('<span style=\'color:#ff0000;font-size:12px\'></span>');
                },
                success: function(response){
                    var result=response.result;
                    $('#orderNo_div .tips').show().html('<span style=\'color:#ff0000;font-size:12px\'>'+result.message+'</span>');
                }

         });
    //$("#alertOrder").hide();
    //center($('#alertTips'));
	return false;

}

function saveGuessPrice(){
    var guessname=$.trim($('#guessname').val());
        if(guessname==''){
           $('#guessname_div .tips').show().html('<span style=\'color:#ff0000;font-size:12px\'>姓名不能为空</span>');
           return;
        }else{
           $('#guessname_div .tips').show().html('');
        }
    var guessmobile=$.trim($('#guessmobile').val());
        if(guessmobile==''){
           $('#guessmoblie_div .tips').show().html('<span style=\'color:#ff0000;font-size:12px\'>手机号不能为空</span>');
           return;
        }else{
          $('#guessmoblie_div .tips').show().html('');
        }
        var valid=/^1\d{10}$/.test(guessmobile);
        if(!valid){
           $('#guessmoblie_div .tips')
                   .show().html('<span style=\'color:#ff0000;font-size:12px\'>手机号不正确</span>');
            return;
        }else{
           $('#guessmoblie_div .tips').show().html('');
        }

    var guessprice=$.trim($('#guessprice').val());
        if(guessprice==''){
           $('#guessprice_div .tips').show().html('<span style=\'color:#ff0000;font-size:12px\'>竞猜价格不能为空</span>');
           return;
        }else{
           $('#guessprice_div .tips').show().html('');
        }

    var proSid=$.trim($('#myguess').val());

    $.ajax({
                url:'${ctx}/saveGreatMember.json',
                type: 'post',
                dataType: 'json',
                data:{'guessname':guessname,'guessmobile':guessmobile,'guessprice':guessprice,'proId':proSid,flag:'2'},
                timeout: 30000,
                error: function(){
                    //usernameIsValid=false;
                    //$('#orderNo_div .tips').show().html('<span style=\'color:#ff0000;font-size:12px\'></span>');
                },
                success: function(response){
                    var result=response.result;
                    $('#guessprice_div .tips').show().html('<span style=\'color:#ff0000;font-size:12px\'>'+result.message+'</span>');
                }

         });
    //$("#alertQuizForm").hide();
	//center($('#alertTips'));
	//return false;
}




</script>
</body>
</html>