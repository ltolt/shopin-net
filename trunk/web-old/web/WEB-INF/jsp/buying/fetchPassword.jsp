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
    var usernameIsValid=false;
    function validateUsername(){
        var username=$('#username').val();
        $('#username_div div').empty();
        if(username==''){
           verifyCodeIsValid=false;
           $('#username_div div').html('<span style=\'color:#ff6600;font-size:12px\'>邮箱地址不能为空</span>');
           return;
        }
        var valid=/^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(username);
        if(!valid){
           verifyCodeIsValid=false;
           $('#username_div div').html('<span style=\'color:#ff6600;font-size:12px\'>邮箱地址不正确</span>');
            return;
        }
        $.ajax({
                url:'${ctx}/member/validateEmail.html',
                type: 'post',
                dataType: 'json',
                data:{'username':username},
                timeout: 30000,
                error: function(){
                    usernameIsValid=false;
                    $('#username_div div').html('<span style=\'color:#ff6600;font-size:12px\'>服务器忙,请稍后再试</span>');
                },
                success: function(response){
                    var result=response.result;
                    if(result=='0'){
                      usernameIsValid=true;
                      $('#username_div div').empty();
                    }else{
                      usernameIsValid=false;
                      $('#username_div div').html('<span style=\'color:#ff6600;font-size:12px\'>邮箱地址已经存在,请换一个</span>');
                    }
                }
         });
    }
    function validatePassword(){
        var password=$('#password').val();
         $('#password_div div').empty();
        if(password.length<6){
           $('#password_div div').append('<span style=\'color:#ff6600;font-size:12px\'>密码输入不正确</span>');
            return false;
        }
        return true;
    }
    function validateConfirmPassword(){
        var password=$('#password').val();
        var confirm_password=$('#confirm_password').val();
         $('#confirm_password_div div').empty();
         if(password!==confirm_password){
           $('#confirm_password_div div').html('<span style=\'color:#ff6600;font-size:12px\'>两次密码输入不一致</span>');
            return false;
        }
        return true;
    }
    function validateVerifyCode(){
         var verifyCode=$('#verifycode').val();
         $('#verifycode_div div').empty();
         if(verifyCode==''){
            verifyCodeIsValid=false;
            $('#verifycode_div div').append('<span style=\'color:#ff6600;font-size:12px\'>验证码不能为空</span>');
            return;
         }
         $.ajax({
                url:'${ctx}/member/validateVerifyCode.html',
                type: 'post',
                dataType: 'json',
                data:{'verifycode':verifyCode},
                timeout: 30000,
                error: function(){
                    verifyCodeIsValid=false;
                    $('#verifycode_div div').html('<span style=\'color:#ff6600;font-size:12px\'>服务器忙,请稍后再试</span>');
                },
                success: function(response){
                    var result=response.result;
                    if(result=='0'){
                      verifyCodeIsValid=true;
                      $('#verifycode_div div').empty();
                    }else{
                      verifyCodeIsValid=false;
                      $('#verifycode_div div').html('<span style=\'color:#ff6600;font-size:12px\'>验证码不正确</span>');
                    }
                }
         });
     }

    /**
     *校验输入的用户名和密码,验证码
     */
    function validate(){
        var flag=true;
        if(!usernameIsValid){
            if($('#username').val()==''){
               $('#username_div div').html('<span style=\'color:#ff6600;font-size:12px\'>邮箱地址不能为空</span>');
            }
            flag=false;
        }
        if(!validatePassword()){
            flag=false;
        }
        if(!validateConfirmPassword()){
            flag=false;
        }
        if(!verifyCodeIsValid){
            if($('#verifycode').val()==''){
               $('#verifycode_div div').html('<span style=\'color:#ff6600;font-size:12px\'>验证码不能为空</span>');
            }
            flag=false;
        }
        return flag;
    }
    function doRegister(){
        if(!validate()){
            return;
        }
        var username=$('#username').val();
        var password=$('#password').val();
        var verifyCode=$('#verifycode').val();
        $.ajax({
                url:'${ctx}/member/login.html',
                type: 'post',
                dataType: 'json',
                data:{'username':username,
                      'password':password,
                      'verifycode':verifyCode
                    },
                timeout: 30000,
                error: function(){
                    $('#verifycode_div div').html('<span style=\'color:#ff6600;font-size:12px\'>服务器忙,请稍后再试</span>');
                },
                success: function(response){
                    var result=response.result;
                    if(result=='0'){
                      window.location='${ctx}/index.html';
                    }
                    else if(result=='1'){
                       $('#password_div div').html('<span style=\'color:#ff6600;font-size:12px\'>密码不正确</span>');
                    }
                    else if(result=='2'){
                       $('#verifycode_div div').html('<span style=\'color:#ff6600;font-size:12px\'>验证码不正确</span>');
                    }
                }
         });
    }
</script>

</head>

<body>
<!--[if !ie]>页头开始<![endif]-->
<!--[if !ie]>页头结束<![endif]-->
<div class="banner-channels">
    <img src="${images}/y-login005.gif"/>
</div>
<div>
    <!--[if !ie]>mylogin开始<![endif]-->
     <div id="mylogin-mlog">
     	<div class="mylogin-logcontent">
       	  <div class="mylogin-logid" >
            	<div class="mylogin-logadress" id="username_div">Email地址：
                    <input name="logidinput" type="text"
                           class="logid-input" id="username" tabindex="1" onBlur="validateUsername()"/>
                    <div></div>
                </div>
            	<div class="logid-tips" id='username_info'>
                	<div class="login-tipimg"><img src="${images}/y-m003.gif" border="0" /></div>
                  <li>请输入您常用的邮箱，方便日后管理账户信息、收取订单通知。</li>
                    <li>没有电子邮箱？推荐使用MSN邮箱、网易邮箱。</li>
                </div>
          </div>
          <div class="mylogin-logid">
            	<div class="mylogin-logadress"  id="password_div">设置密码：&nbsp;
                    <input name="logidinput" type="password"
                           class="logid-input" id="password" tabindex="1" onBlur="validatePassword()"/>
                    <div></div>
                </div>
            	<div class="logid-tips"  id='password_info'>
               	  <div class="login-tipimg"><img src="${images}/y-m003.gif" border="0" /></div>
                  	<li>请输入6-16位字符，密码最好包括数字，大小写字母，特殊符号！</li>
                    <li>密码强度：</li>
                </div>
          </div>
          <div class="mylogin-logid">
            	<div class="mylogin-logadress"  id="confirm_password_div">确认密码：&nbsp;
            	  <input name="iptUser" type="password"
                         class="logid-input" id="confirm_password" tabindex="1" onBlur="validateConfirmPassword()" />
                    <div></div>
				</div>
            	<div class="logid-tips"  id='confirm_password_info'>
               	  <div class="login-tip1img"><img src="${images}/y-m003.gif" border="0"/></div>
                  <li>确认密码必须和密码相同</li>
                </div>
          </div>
          <div class="mylogin-logid">
            	<div class="mylogin-logadress"  id="verifycode_div">验证码：&nbsp;&nbsp;&nbsp;
            	  <input name="iptUser" type="text"
                         class="verifycode_css" id="verifycode" tabindex="1" onBlur="validateVerifyCode()"/>
                  <img src="${ctx}/" width="60" height="20" style="cursor:pointer" title="点击重新生成验证码">
                  <div></div>
				</div>
            	<div class="logid-tips"  id='verifycode_info'>
               	  <div class="login-tip1img"><img src="${images}/y-m003.gif" border="0" /></div>
                  <li>如果看不清楚,请点击验证码图片,重新生成一个</li>
                </div>
          </div>
          <div class="mylogin-logid1">
              <a href="javascript:void(0);"><img src="${images}/y-m002.gif" border="0" onClick="doRegister();"/></a>
          </div>
          <div class="mylogin-agree">上品折扣网服务协议 </div>
          <div class="mylogin-agree1">
            <textarea name="协议" class="mylogin-agreebk" style="width:700px;height:250px" readonly="readonly">
      您成为上品折扣网用户前，必须阅读、同意并接受本协议中的所有条款和条件，包括以下明示载明的及因被提及而纳入的条款和条件。
      1. 上品折扣网和您之间的契约
      上品折扣网将尽最大努力保证您所购商品与网站上公布的价格一致，但价目表和声明并不构成要约。上品折扣网有权在发现了其网站上显现的产品或订单的错误或缺货的情况下，单方面撤回相关承诺。
      您向上品折扣网提交订单的同时，视为您向本公司承诺拥有购买这些产品的权利能力和行为能力，并且将对您在订单中提供的所有信息的真实性负责。
      2. 价格变化和缺货
      产品的价格和可获性都在上品折扣网站上指明，上品折扣网有权随时更改该等信息而不再另行发出任何通知或公告。商品的价格都包含了增值税。送货费将另外结算，费用根据您选择的送货方式的不同而异。在您确认提交订单后，如由于供应商提价，税额变化等引起商品价格变化，或是由于上品折扣网的网站/网络错误造成商品价格变化，您有权取消您的订单，并希望您能及时通过电子邮件或电话通知上品折扣网客户服务部。
      您所订购的商品，如果发生缺货，您有权取消订单。
      3. 邮件/短信服务
      上品折扣网保留通过邮件和短信形式对本网站注册、购物用户发送订单信息、促销活动信息等告知服务的权利。如果您在上品折扣网注册、购物，表明您已默示接受此项服务。
      如果您不想接收来自上品折扣网的邮件和短信，请在收到短信后直接回复“N”，或在邮件下方输入您的E-mail地址自助完成退阅；您也可以向上品折扣网客服提出退阅申请，并注明您的E-mail地址或手机号，上品折扣网会在收到邮件后为您办理退阅。
      4. 送货
      上品折扣网将会把产品送到您所指定的送货地址。所有在上品折扣网站上列出的送货时间为参考时间，参考时间是根据库存状况、正常的处理过程和送货时间、送货地点等因素综合估算得出的。
      5.变更和补充
      上品折扣网有权不时变更或补充本协议及/或上品折扣网其他交易协议、制度、规则、流程等法律文件条款，并将在本网站上及时公布变更或补充后的条款，但上品折扣网并无义务就该等变更或补充另行发布任何通知或公告。在上品折扣网变更或补充有关条款后，您对上品折扣网的继续使用，视为您对该等变更和补充条款的接受。
      6. 效力
      因任何原因导致本协议及/或上品折扣网其他交易协议、制度、规则、流程等法律文件项下任何条款被宣告无效、被撤销、不可执行或存在其他效力瑕疵的，本协议及/或上品折扣网其他交易协议、制度、规则、流程等法律文件其他条款的效力和执行将不受影响。
      7. 适用的法律和管辖权
      本协议及您与上品折扣网在商品网络销售过程中的一切交易活动适用中华人民共和国法律。因本协议所生及与本协议有关的一切争议（包括但不限于您与上品折扣网在商品网络销售过程中发生的一切争议），由双方协商解决；协商不成的，任何一方可向北京市上品商业发展有限责任公司所在地有管辖权的人民法院起诉。
      8.协议的终止
      上品折扣网可以不经通知而自行决定终止全部或部分计划。即使上品折扣网没有要求或强制您严格遵守这些条款，也并不构成对属于上品折扣网的任何权利的放弃。
      如果您在上品折扣网的客户账户被关闭，那么您也将丧失您的会员资格。对于该会员资格的丧失，您对上品折扣网不能主张任何权利或为此索赔。
            </textarea>
          </div>
   	   </div>
     </div>
    <!--[if !ie]>mylogin结束<![endif]-->
</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>
</body>
</html>
