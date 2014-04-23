<%--
  Description:会员登录 
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>登录注册</title>
<link href="${css}/mycart.css" rel="stylesheet" type="text/css"/>
<script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>
<link href="${css}/facebox.css" media="screen" rel="stylesheet" type="text/css"/>
<link href="${css}/dingyue.css" media="screen" rel="stylesheet" type="text/css"/>
<script src="${js}/facebox.js" type="text/javascript"></script>
<script type="text/javascript">
jQuery(document).ready(function($) {
    $('a[rel*=facebox]').facebox({
        loadingImage : '${images}/loading.gif',
        closeImage   : '${images}/ad/03251.gif'
    })
})
<%--校验用户名--%>
function validateUsername() {
    var username = $('#username').val();
    if (username == '') {
        $('#username_div .validate-msg').html('<span style=\'color:#ff6600;font-size:12px\'>邮箱地址不能为空</span>');
        return false;
    }
    var valid = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(username);
    if (!valid) {

        return true;
    }
    $('#username_div div').html("&nbsp;");
	$('#password').focus();
    return true;
}
<%--校验密码--%>
function validatePassword() {
    var password = $('#password').val();
    if (password == '') {
        $('#password_div .validate-msg').html('<span style=\'color:#ff6600;font-size:12px\'>密码不能为空</span>');
        return false;
    }
    $('#password_div div').html("&nbsp;");
	$('#verifycode').focus();
    return true;
}
<%--校验验证码--%>
function validateVerifyCode() {
    var verifyCode = $('#verifycode').val();
    if (verifyCode == '') {
        $('#verifycode_div .validate-msg').html('<span style=\'color:#ff6600;font-size:12px\'>验证码不能为空</span>');
        return false;
    }
    $('#verifycode_div .validate-msg').html("&nbsp;");
    return true;
}

<%--校验输入的用户名和密码,验证码--%>
function validate() {
    var flag = true;
    if (!validateUsername()) {
        flag = false;
    }
    if (!validatePassword()) {
        flag = false;
    }
    if (!validateVerifyCode()) {
        flag = false;
    }
    return flag;
}

<%--登录--%>
function doLogin() {
    if (!validate()) {
        return;
    }
    $("#login_form").get(0).submit();
}
function alipayLogin() {
    $("#alipay_form").get(0).submit();
}
function sinaLogin() {
    $("#sina_form").get(0).submit();
}
function qqLogin() {
    $("#qq_form").get(0).submit();
}
function renrenLogin() {
    $("#renren_form").get(0).submit();
}
function tenpayLogin() {
    $("#tenpay_form").get(0).submit();
}
function cm139Login() {
    $("#cm_form").get(0).submit();
}
<%--注册--%>
function doRegister() {
    $("#register_form").get(0).submit();
}
<%--刷新验证码--%>
function refreshCaptcha() {
    $('#captchaImg').html('<img src="${ctx}/jcaptcha.jpg?' + Math.round(Math.random() * 100000) + '"/>');
}

<%--快速购买校验邮件--%>
var quickbuy_email_is_valid = false;
function userPassView() {
    var quickbuy_email = $.trim($("#quickbuy_email").val());
    if (quickbuy_email_is_valid==true) {
        var password = quickbuy_email.split("@");
        $("#yPassword").empty();
        $("#yPassword").prepend(password[0]);
        $('#meme').trigger('click');
    }
}
function validateEmail() {
    var quickbuy_email = $.trim($("#quickbuy_email").val());
    if (quickbuy_email == '') {
        quickbuy_email_is_valid = false;
        $('#quickbuy_email_info').css("display", "block")
                .html('<span style=\'color:#ff6600;font-size:12px\'>邮箱地址不能为空</span>');
        return;
    }
    var email_pattern = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
    if (!email_pattern.test(quickbuy_email)) {
        quickbuy_email_is_valid = false;
        $('#quickbuy_email_info').css("display", "block")
                .html('<span style=\'color:#ff6600;font-size:12px\'>邮箱地址不正确</span>');
        return;
    }
    $.ajax({
        url:'${ctx}/validateEmail.json',
        type: 'post',
        dataType: 'json',
        data:{'email':quickbuy_email},
        timeout: 30000,
        error: function() {
            quickbuy_email_is_valid = false;
            $('#quickbuy_email_info').css("display", "block")
                    .html('<span style=\'color:#ff6600;font-size:12px\'>邮箱地址不正确</span>');
        },
        success: function(response) {
            var result = response.result;
            var status = result.status;
            var message = result.message;
            if (status == '1') {
                quickbuy_email_is_valid = true;
                $('#quickbuy_email_info').css("display", "none");
            } else {
                quickbuy_email_is_valid = false;
                $('#quickbuy_email_info').css("display", "block")
                        .html('<span style=\'color:#ff6600;font-size:12px\'>' + message + '</span>');
            }

        }
    });
}
<%
    Cookie[] cookies = request.getCookies();
    String cid = "";
    for (int i = 0; i < cookies.length; i++) {
        if (cookies[i].getName().equals("cid")) cid = cookies[i].getValue();
    }

%>
<%--快速购买--%>
function quickbuy(button) {
    $.facebox.close();
    if (!quickbuy_email_is_valid) {
        if ($('#quickbuy_email_info').html() == '') {
            $('#quickbuy_email_info').css("display", "block")
                    .html('<span style=\'color:#ff6600;font-size:12px\'>邮箱地址不正确</span>');
        }
        return;
    }
<%
if (cid.startsWith("ad-baidu")) {
%>
    RapidBuy();
<%
        }
            %>
    var quickbuy_email = $.trim($("#quickbuy_email").val());
    $.ajax({
        url:'${ctx}/order/quickbuy.json',
        type: 'post',
        dataType: 'json',
        data:{'email':quickbuy_email},
        timeout: 30000,
        error: function() {
            $.popdialog(button, "order_quickbuy_info", '确认订单失败，请重试');
            return;
        },
        success: function(response) {
            var result = response.result;
            var status = result.status;
            var message = result.message;
            $.popdialog(button, 'order_quickbuy_info', message);
            if (status == '1' || status == '10') {
                if (status == '1') {
                    var userTicket = response.userTicket;
                    setCookie("userTicket", userTicket, 1, "/");
                }
                window.setTimeout(function() {
                    window.location = '${ctx}/order/confirm.html';
                }, 2000);
            } else {
                if (status == '01') {
                    var userTicket = response.userTicket;
                    setCookie("userTicket", userTicket, 1, "/", "${ctx}");
                    window.setTimeout(function() {
                        window.location = '${ctx}/index.html';
                    }, 2000);
                }
            }
            return;
        }
    });
}

function setCookie(name, value, expires, path, domain, secure) {
    var today = new Date();
    today.setTime(today.getTime());
    if (expires) {
        expires = expires * 1000 * 60 * 60 * 24;
    }
    var expires_date = new Date(today.getTime() + (expires));
    document.cookie = name + '=' + escape(value)
            + ( ( expires ) ? ';expires=' + expires_date.toGMTString() : '' )
            + ( ( path ) ? ';path=' + path : '' )
            + ( ( domain ) ? ';domain=' + domain : '' )
            + ( ( secure ) ? ';secure' : '' );
}
</script>
<%
    if (cid.startsWith("ad-baidu")) {
%>
<noscript>
    <img height="1" width="1" border="0" alt="" style="display:none"
         src="http://analytics.adsage.cn/atac.gif?acc=936&cid=1063&csid=2630&ver=1.0"/>
</noscript>
<script type="text/javascript" src="http://analytics.adsage.cn/atac.js"></script>
<script type="text/javascript">
    <!--
    function RapidBuy() {
        ataTracker.setAccount("936");
        ataTracker.setConversion("1063", "2630");
        ataTracker.track();
    }
    //-->
</script>


<%
    }
%>

<script type="text/javascript">
	$(function(){
		$(".cb_alertbox").mouseover(function(){
			$(this).children(".mod_cb_jr_pop").show().end();
			});
		$(".cb_alertbox").mouseout(function(){
			$(this).children(".mod_cb_jr_pop").hide().end();
			});
		});
</script> 
</head>

<body>

<ul class="banner-channels" style="margin-bottom:0">
    <ol><img src="${images}/y-login001.gif" alt="注册登录"/></ol>
</ul>
<div>
    <%--登录开始--%>

<style type="text/css">
		.mylogin-lcontent .lcontent-img { margin-top:0; padding-top:0}
  		.lcontent-img a { text-decoration:underline; margin-left:30px}
		#page #mylogin-left .mylogin-lcontent { margin-bottom:0; border-bottom:none}
		.joint_login {padding:10px 0;margin-bottom:10px;zoom:1;background:#f5f5f5;}
		.joint_login form{float:left;line-height:18px;padding:0 10px;margin:5px 0;border-right:1px solid #ddd}
		.joint_login form#mail_139{border-right:none}
		.joint_login:after { height:0; clear:both; content:"."; visibility:hidden; display:block;}
		.joint_login { zoom:1;}
		.joint_login a { float:left; height:18px; display:block; padding-left:22px;}
		.joint_login a.alipay { width:58px; padding:0; margin-left:5px; background:url(http://images.shopin.net/images/s_login_zfb_0229.gif) no-repeat 0 2px}
		.joint_login a.xinlang { background:url(http://images.shopin.net/images/s_login_sina_0229.gif) no-repeat 0 0}
		.joint_login a.qq { background:url(http://images.shopin.net/images/s_login_qq_0229.gif) no-repeat 0 0}
		.joint_login a.m139 { width:55px; padding:0; background:url(http://images.shopin.net/images/s_login_139_0315.gif) no-repeat 0 0}
/*彩贝*/
.mod_cb_jr_pop { display:none; font-size:12px; width:220px; padding:6px 10px 10px; position:absolute; left:-30px; top:24px; background:#fffce6; border:1px solid #f5d682;}
.mod_cb_jr_pop .pop_title { font-size:16px; font-family:"Microsoft Yahei"; line-height:30px; padding-left:28px; background:url(http://imgcache.qq.com/vipstyle/act/caibei_110826_tips/img/bg.png) no-repeat left -34px; color:#0066b8;}
.mod_cb_jr_pop .pop_tips { line-height:20px; color:#858585;}
.mod_cb_jr_pop .pop_flag { position:absolute; width:15px; height:7px; left:30px; top:-6px; background:url(http://imgcache.qq.com/vipstyle/act/caibei_110826_tips/img/bg.png) left -21px no-repeat;}
        </style>
    <div id="mylogin-left">
        <form action='${ctx}/login.html' method='post' id="login_form">
            <div class="mylogin-ltit">会员登录</div>
            <input type="hidden" value="${forward}" name="forward" id="forward"/>

            <div class="mylogin-lcontent">
                <div class="lcontent-name" id="username_div">注册邮箱:<input id='username' name="j_username" type="text"
                                                                         class="ipt-t"
                                                                         tabindex="1" value="${username}"
                                                                         onBlur="validateUsername()" onkeydown= "if(event.keyCode==13){validateUsername();}" />

                    <div class="validate-msg">&nbsp;</div>
                </div>
                <div class="lcontent-name" id="password_div">密码:&nbsp;&nbsp;&nbsp;&nbsp;<input id='password'
                                                                                               name="j_password"
                                                                                               type="password"
                                                                                               class="ipt-t"
                                                                                               tabindex="1"
                                                                                               value="${password}"
                                                                                               onBlur="validatePassword()" onkeydown= "if(event.keyCode==13){validatePassword();}"/>

                    <div class="validate-msg">&nbsp;</div>
                </div>
                <div class="lcontent-name" id="verifycode_div">验证码:&nbsp;&nbsp;<input id='verifycode' name="j_captcha"
                                                                                      type="text"
                                                                                      class="ipt-t" style="width:60px"
                                                                                      tabindex="1"
                                                                                      onBlur="validateVerifyCode()" onkeydown= "if(event.keyCode==13){doLogin();}"/>
                    <span id="captchaImg"><img src="${ctx}/jcaptcha.jpg"/></span>

                    <div><a href="javascript:refreshCaptcha()">看不清楚换一个</a></div>
                    <div class="validate-msg">&nbsp;<span style="color:#ff6600;font-size:12px">${error}</span></div>
                </div>
                <div class="lcontent-img">
                    <img src="${images}/y-login002.gif" border="0" align="middle" style="cursor:pointer" onClick="doLogin();"/><a href="${ctx}/forgetPassword.html">忘记密码</a>
                </div>
            </div>
        </form>
        <div class="joint_login">
        　使用合作网站账号登录上品折扣：<br />
        <form id="alipay_form" method='post' action='${ctx}/aliLogin.html'>
            <a class="alipay" href="javascript:void(0);" onClick="alipayLogin();"><input type="hidden" value="${forward}" name="forward" id="forward"/></a>
        </form>
        <form id="sina_form" method='post' action='${ctx}/sinaLog.html'>
            <a class="xinlang" href="javascript:void(0);" onClick="sinaLogin();"><input type="hidden" value="${forward}" name="forward" id="forward"/>新浪微博</a>
        </form>
		<form id="qq_form" method='post' action='${ctx}/qqLog.html'>
            <div class="cb_alertbox" style="position:relative"><a class="qq" href="javascript:void(0);" onClick="qqLogin();"><input type="hidden" value="${forward}" name="forward" id="forward"/>QQ</a>
            <div class="mod_cb_jr_pop">
				<div class="pop_title">QQ彩贝联盟商户</div>
				<div class="pop_tips">使用QQ无需注册，购物还可额外获得彩贝积分返还。</div>
				<div class="pop_flag"></div>
			</div>
            </div>
        </form>
        <form id="cm_form" method="post" action="${ctx}/139Transfer.html">
           <a class="m139" href="javascript:void(0);"  onClick="cm139Login();"><input type="hidden" value="${forward}" name="forward" id="forward"/></a>
        </form>
        </div>
		 
        <%--<form id="renren_form" method='post' action='${ctx}/renrenLog.html'>
            <div class="lcontent-img"></div>
            <input type="hidden" value="${forward}" name="forward" id="forward"/>

            &lt;%&ndash;<div class="zhifb">人人网用户，请点此<img src="http://a.xnimg.cn/connect/img/login_buttons/renren/connect_light_medium.png" style="cursor:pointer" align="absmiddle"&ndash;%&gt;
                                                 &lt;%&ndash;onClick="renrenLogin();"/></div>&ndash;%&gt;
        </form>--%>
        <%--<form id="tenpay_form" method='post' action='${ctx}/tenpayLogin.html'>
            <div class="lcontent-img"></div>
            <input type="hidden" value="${forward}" name="forward" id="forward"/>

            &lt;%&ndash;<div class="zhifb">如果您是财付通用户，请点此<img src="http://a.xnimg.cn/connect/img/login_buttons/renren/connect_light_medium.png" style="cursor:pointer" align="absmiddle"&ndash;%&gt;
                                                 &lt;%&ndash;onClick="tenpayLogin();"/></div>&ndash;%&gt;
        </form>--%>
        <a href="${ctx}/forgetPassword.html"></a>
        <div class="lcontent-ans">
            <ul>
                <li class="ans-tit">有任何疑问请点击<a href="${ctx}/help/h_service.html" target="_blank" style="color:#FF6600;">帮助中心</a>!
                </li>
                <li class="ans-tit1"><a href="${ctx}/forgetPassword.html" target="_blank">如何找回我的密码账号</a></li>
                <li class="ans-tit1"><a href="${ctx}/help/h_log.html" target="_blank">可以收到货后再付款吗?</a></li>
            </ul>

        </div>
    </div>
    <%--登录结束--%>

    <%--注册开始--%>
    <div id="mylogin-right">
        <form action='${ctx}/goRegister.html' method='post' id="register_form">
            <input type="hidden" value="${forward}" name="forward" id="forward"/>
        </form>
        <div class="mylogin-rtit">还没有上品账号？</div>
        <div class="mylogin-rtt">
            <div class="mylogin-member">
                <div class="mylogin-rtitle"><img src="${images}/i-22.gif" border="0"/>会员注册</div>
                <div class="mylogin-rcontent">
                    <ul>
                        <li><font color="#FF6600"><b>立即享受</b></font></li>
                        <li>1.订单快速提交</li>
                        <li>2.品牌打折促销通知</li>
                        <li>3.会员专享活动</li>
                        <li style="color:#FFFFFF;">4</li>
                    </ul>
                </div>
                <div class="rcontent-img"><img src="${images}/y-login003.gif" border="0" onClick="doRegister();"/></div>

            </div>
            <div class="mylogin-shopping">
                <div class="mylogin-rtitle"><img src="${images}/i-22.gif" border="0"/>非会员购物</div>
                <div class="mylogin-rcontent">
                    <ul>
                        <li><font color="#FF6600"><b>无需注册，立刻享受</b></font></li>
                        <li>1.近千个知名品牌打折</li>
                        <li>2.体验抢购的乐趣</li>
                        <li>3.系统协助完成注册</li>
                        <li>4.登陆密码为邮箱名即"@"符号前面的内容</li>
                        <li>邮箱:<input type="text" name='quickbuy_email' id="quickbuy_email" onBlur="validateEmail();"/>
                        </li>
                        <li id="quickbuy_email_info" style="display:none"></li>
                    </ul>
                </div>
                <div class="rcontent-img">
                    <a href="#messageBox" rel="facebox" id="meme"></a>
                    <img src="${images}/y-login004.gif" border="0" style="cursor:pointer;"
                           onClick="userPassView();"/>
                </div>
                <div>
                </div>
            </div>
        </div>
        <%--注册结束--%>

    </div>
		
    <div id="messageBox" style="display:none;">
        <ul class="dy1-1">
            <li class="dy1-title"></li>
            <li class="dy1-font">
                <span><img src="${images}/ad/03253.gif"></span>

                <div><h1>快速购买用户密码通知</h1></div>
            </li>
            <li class="dy1-from">尊敬的用户您的登陆密码为：<span id="yPassword"> </span> 请牢记！
            </li>
            <li class="dy-from">
            <span><a href="#"><img src="${images}/ad/03255.gif" border="0" align="absmiddle"
                                   style="cursor:pointer;" onClick="quickbuy(this);"></a></span></li>
            <li class="dy1-more"></li>
        </ul>
    </div>


</div>
<div class="clear"></div>
</body>
</html>
