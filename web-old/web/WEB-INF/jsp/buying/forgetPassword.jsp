<%--
  Description:忘记密码
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>忘记密码-上品折扣网www.shopin.net</title>
<link href="${css}/master.css" rel="stylesheet" type="text/css" />
<link href="${css}/mycart.css" rel="stylesheet" type="text/css" />
<style type="text/css">
   .verifycode_css {border:1px solid #999; width:120px; height:24px; line-height:24px; color:#333; font-weight:bold; font-size:14px;padding:3px 2px 2px; text-align:left;}
</style>
<script type="text/javascript" src="${js}/input.js"></script>
<script type="text/javascript" src="${js}/piaoqian.js"></script>
<script src="${js}/ifocus.js" type="text/javascript"></script>
<script type="text/javascript">
    var verifyCodeIsValid=false;
    <%--校验输入的邮件地址是否存在--%>
    function validateUsername(){
        var username=$.trim($('#username').val());
        if(username==''){
           $('#username_div .validate-msg').html('<span style=\'color:#ff6600;font-size:12px\'>邮箱地址不能为空</span>');
           return false;
        }
        var valid=/^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(username);
        if(!valid){
           $('#username_div .validate-msg').html('<span style=\'color:#ff6600;font-size:12px\'>邮箱地址不正确</span>');
            return false;
        }
        return true;
    }
    <%--校验输入的验证码--%>
    function validateVerifyCode(){
         var verifyCode=$.trim($('#verifycode').val());
         if(verifyCode==''){
            verifyCodeIsValid=false;
            $('#verifycode_div .validate-msg').html('<span style=\'color:#ff6600;font-size:12px\'>验证码不能为空</span>');
            return;
         }
         $.ajax({
                url:'${ctx}/member/validateVerifyCode.json',
                type: 'post',
                dataType: 'json',
                data:{'verifycode':verifyCode},
                timeout: 30000,
                error: function(){
                    verifyCodeIsValid=false;
                    $('#verifycode_div .validate-msg').html('<span style=\'color:#ff6600;font-size:12px\'>验证码不正确</span>');
                },
                success: function(response){
                    var result=response.result;
                    if(result=='0'){
                      verifyCodeIsValid=true;
                      $('#verifycode_div .validate-msg').empty();
                    }else{
                      verifyCodeIsValid=false;
                      $('#verifycode_div .validate-msg').html('<span style=\'color:#ff6600;font-size:12px\'>验证码不正确</span>');
                    }
                }
         });
     }

    <%--校验输入的用户名和密码,验证码--%>
    function validate(){
        var flag=true;
        if(!validateUsername()){
            flag=false;
        }
        if(!verifyCodeIsValid){
            if($('#verifycode').val()==''){
               $('#verifycode_div .validate-msg').html('<span style=\'color:#ff6600;font-size:12px\'>验证码不能为空</span>');
            }
            flag=false;
        }
        return flag;
    }
    <%--找回密码--%>
    function fetchPassword(){
//        if(!validate()){
//            return;
//        }
        var username=$.trim($('#username').val());
        $.ajax({
                url:'${ctx}/fetchPassword.json',
                type: 'post',
                dataType: 'json',
                data:{'email':username},
                timeout: 30000,
                error: function(){
                    $('#verifycode_div .validate-msg').html('<span style=\'color:#ff6600;font-size:12px\'>找回密码失败，请重试</span>');
                },
                success: function(response){
                    var result=response.result;
                    var status=result.status;
                    if(!status){
                       $('#verifycode_div .validate-msg').html('<span style=\'color:#ff6600;font-size:12px\'>找回密码失败，请重试</span>');
                       return;
                    }
                    if(status=='0'){
                      $('#fetch_info').html('找回密码成功！我们已经将新的密码发送到您的邮箱地址:'+username);
                    }else if(status=='01'){
                       $('#username_div .validate-msg').html('<span style=\'color:#ff6600;font-size:12px\'>邮箱地址不正确</span>');
                    }else if(status=='02'){
                       $('#username_div .validate-msg').html('<span style=\'color:#ff6600;font-size:12px\'>邮箱地址不存在</span>');
                    }
                }
         });
    }
    <%--刷新验证码--%>
    function refreshCaptcha(){
		$('#captchaImg').attr('src',"${ctx}/jcaptcha.jpg?"+Math.round(Math.random()*100000));
	}
</script>

</head>

<body>
<div class="banner-channels">
    <img src="${images}/y-login005.gif" title="忘记密码" />
</div>
<div>
    <%--mylogin开始--%>
     <div id="mylogin-mlog">
     	<div class="mylogin-logcontent">
       	  <div class="mylogin-logid" >
            	<div class="mylogin-logadress" id="username_div">注册邮箱：
                    <input name="username" type="text"
                           class="logid-input" id="username" tabindex="1" onBlur="validateUsername()"/>
                    <div class="validate-msg"></div>
                </div>
            	<div class="logid-tips" id='username_info'>
                	<div class="login-tipimg"><img src="${images}/y-m003.gif" border="0" /></div>
                  <li>请输入您注册时使用的电子邮箱地址,我们会给您发送一个新密码。</li>
                </div>
          </div>
          <div class="mylogin-logid">
            	<div class="mylogin-logadress"  id="verifycode_div">验证码：&nbsp;&nbsp;
            	  <input name="verifycode" type="text" class="verifycode_css" style="width:60px"
                         id="verifycode" tabindex="1" onBlur="validateVerifyCode()"/>
                  <img id="captchaImg" src="${ctx}/jcaptcha.jpg"/>
                  <div><a href="javascript:refreshCaptcha()">看不清楚换一个</a></div>
                  <div class="validate-msg"></div>
				</div>
            	<div class="logid-tips"  id='verifycode_info'>
               	  <div class="login-tip1img"><img src="${images}/y-m003.gif" border="0" /></div>
                  <li>如果看不清楚,请重新生成一个</li>
                </div>
          </div>
          <div class="mylogin-logid1">
              <img src="${images}/y-m002.gif" border="0" style="cursor:pointer" onClick="fetchPassword();"/>
          </div>
          <div id="fetch_info" style="width:900px;text-align:center;font-color:red"></div>
   	   </div>
     </div>
    <%--mylogin结束--%>
</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>
</body>
</html>
