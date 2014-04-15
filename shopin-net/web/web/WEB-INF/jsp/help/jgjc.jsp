<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>猜价格赢暖手抱枕，注册会员，知名品牌，热卖商品，低折扣价格，上品折扣官网购物网</title>
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
<a href="http://www.shopin.net/login.html" target="_blank"><img class="mt" src="http://images.shopin.net/images/ad/jgjc/top-ad1.jpg" align="top" width="950" height="204">
<img src="http://images.shopin.net/images/ad/jgjc/top-ad2.jpg" align="top" width="950" height="246">
<img src="http://images.shopin.net/images/ad/jgjc/top-ad3.jpg" align="top" width="950" height="166"></a>
<img src="http://images.shopin.net/images/ad/jgjc/t4.jpg" align="top" width="950" height="69">
<ul class="quiz-list clear zc"><!--alt里为 单品链接-->
<li><a href="http://www.shopin.net/list--1231-------1-.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/12/04/Pic2148894_162520_0.resize_to.220x220.jpg" alt="" /></a><p>市场价：￥1699</p><input id="101" class="iwquiz" type="button" value="" /></li>
<li><a href="http://www.shopin.net/list--1231-------1-.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/12/07/Pic2143131_213135_0.resize_to.220x220.jpg" alt="" /></a><p>市场价：￥998</p><input id="102" class="iwquiz" type="button" value="" /></li>
<li><a href="http://www.shopin.net/list--1706-------1-.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/11/29/Pic2142994_176336_0.resize_to.220x220.jpg" alt="" /></a><p>市场价：￥1698</p><input id="103" class="iwquiz" type="button" value="" /></li>
<li><a href="http://www.shopin.net/list--1235-------1-.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/11/01/Pic2111639_119595_0.resize_to.220x220.jpg" alt="" /></a><p>市场价：￥1780</p><input id="104" class="iwquiz" type="button" value="" /></li>
<li><a href="http://www.shopin.net/list--1824.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/12/13/Pic2156662_11159_0.resize_to.220x220.jpg" alt="" /></a><p>市场价：￥898</p><input id="105" class="iwquiz" type="button" value="" /></li>
<li><a href="http://www.shopin.net/list--1382.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/12/13/Pic2150996_53943_0.resize_to.220x220.jpg" alt="" /></a><p>市场价：￥1299</p><input id="106" class="iwquiz" type="button" value="" /></li>
<li><a href="http://www.shopin.net/list--1885-------1-.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/09/Pic2051470_202346_0.resize_to.220x220.jpg" alt="" /></a><p>市场价：￥298</p><input id="107" class="iwquiz" type="button" value="" /></li>
<li><a href="http://www.shopin.net/list--1720.html" target="_blank"><img src="http://images.shopin.net/images/58/2011/09/23/Pic1428513_144338_0.resize_to.220x220.jpg" alt="" /></a><p>市场价：￥1980</p><input id="108" class="iwquiz" type="button" value="" /></li>
<li><a href="http://www.shopin.net/list--1720-------1-2.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/12/07/Pic2149717_144958_0.resize_to.220x220.jpg" alt="" /></a><p>市场价：￥769</p><input id="109" class="iwquiz" type="button" value="" /></li>
<li><a href="http://www.shopin.net/list--1327.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/05/19/Pic1688777_135685_0.resize_to.220x220.jpg" alt="" /></a><p>市场价：￥398</p><input id="1010" class="iwquiz" type="button" value="" /></li>
<li><a href="http://www.shopin.net/list--1295.html" target="_blank"><img src="http://images.shopin.net/images/58/2012/10/27/Pic2028837_178156_0.resize_to.220x220.jpg" alt="" /></a><p>市场价：￥1518</p><input id="1011" class="iwquiz" type="button" value="" /></li>
<li><a href="http://www.shopin.net/list--1308-------1-.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/09/06/Pic1663244_26686_0.resize_to.220x220.jpg" alt="" /></a><p>市场价：￥398</p><input id="1012" class="iwquiz" type="button" value="" /></li>
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
        <input type="hidden" id="forward" name="forward" value="${ctx}/help/jgjc.html">
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
//弹出层
	$('.quiz-list .iwquiz,.sp-btns a').click(function(){

            $("#myguess").val(this.id);
            $.ajax({
                url:'${ctx}/guess/isLogin.json',
                type: 'post',
                dataType: 'json',
                data:{},
                timeout: 30000,
                error: function(){

                },
                success: function(response){

                   var result=response.result;
                   if(result.status=="01"){


                       $('#mask').show();
                       $("#mask").css("height",$(document).height());
                       $("#mask").css("width",$(window).width());
                       center($('#alertQuizForm'));
					   $('#guessprice_div .tips').show().html('');
                       return false;
                   }
                   if(result.status=="00"){
                      window.location.href="${ctx}/guess/gotologin.html";
                   }
                }
         });



	});
	$(".btn2").click(function(){
		center($('#alertOrder'));
	return false;
		})


	$(".quiz-list .iwquiz").click(function(){
		//center($('#alertQuizForm'));
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
           $('#guessname_div .tips').html('<span style=\'color:#ff0000;font-size:12px\'>姓名不能为空</span>').show();
           return;
        }else{
           $('#guessname_div .tips').show().html('');
        }
    var guessmobile=$.trim($('#guessmobile').val());
        if(guessmobile==''){
           $('#guessmoblie_div .tips').html('<span style=\'color:#ff0000;font-size:12px\'>手机号不能为空</span>').show();
           return;
        }else{
          $('#guessmoblie_div .tips').show().html('');
        }
        var valid=/^1\d{10}$/.test(guessmobile);
        if(!valid){
           $('#guessmoblie_div .tips')
                   .html('<span style=\'color:#ff0000;font-size:12px\'>手机号不正确</span>').show();
            return;
        }else{
           $('#guessmoblie_div .tips').show().html('');
        }

    var guessprice=$.trim($('#guessprice').val());
        if(guessprice==''){
           $('#guessprice_div .tips').html('<span style=\'color:#ff0000;font-size:12px\'>竞猜价格不能为空</span>').show();
           return;
        }else{
           $('#guessprice_div .tips').show().html('');
        }

    var proSid=$.trim($('#myguess').val());

    $.ajax({
                url:'${ctx}/guess/guessprice.json',
                type: 'post',
                dataType: 'json',
                data:{'guessname':guessname,'guessmobile':guessmobile,'guessprice':guessprice,'proId':proSid},
                timeout: 30000,
                error: function(){
                    //usernameIsValid=false;
                    //$('#orderNo_div .tips').show().html('<span style=\'color:#ff0000;font-size:12px\'></span>');
                },
                success: function(response){
                    var result=response.result;
                    $('#guessprice_div .tips').html(result.message).show();
                }

         });
    //$("#alertQuizForm").hide();
	//center($('#alertTips'));
	//return false;
}




</script>
</body>
</html>