<%--
  Description:会员密码修改
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>修改密码</title>
<script type="text/javascript" src="${js}/input.js"></script>
<link href="${css}/myshopin-character.css" rel="stylesheet" type="text/css" />
<script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>
<script type="text/javascript">
    /**
     * 校验表单
     */
    function validate(){
       var username_input=$("#content-right input[name='username']");
       var username=$.trim(username_input.val());
       var password_input=$("#content-right input[name='password']");
       var password=$.trim(password_input.val());
       var newpassword_input=$("#content-right input[name='new_password']");
       var newpassword=$.trim(newpassword_input.val());
       var confirmpassword_input=$("#content-right input[name='new_password_confirm']");
       var confirmpassword=$.trim(confirmpassword_input.val());
       var valid=/^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(username);
       if(!valid){
           $.poptip(username_input,"username_tip","旧email地址填写不正确");
           return false;
       }
       if(password==''){
          $.poptip(password_input,"password_tip","旧密码不能为空");
          return false;
       }
       if(newpassword.length<6){
          $.poptip(newpassword_input,"newpassword_tip","新密码填写不正确,长度不小于6位");
          return false;
       }
       if(confirmpassword!=newpassword){
          $.poptip(confirmpassword_input,"confirmpassword_tip","确认密码和新密码不相同");
          return false;
       }
       return true;
    }

    /**
     * 提交表单
     */
    function commit(button){
       if(!validate()){
           return;
       }
       var username_input=$("#content-right input[name='username']");
       var username=$.trim(username_input.val());
       var password_input=$("#content-right input[name='password']");
       var password=$.trim(password_input.val());
       var newpassword_input=$("#content-right input[name='new_password']");
       var newpassword=$.trim(newpassword_input.val());
       $.ajax({
            url:'${ctx}/member/modifyPassword.json',
            type: 'post',
            dataType: 'json',
            data:{'memEmail':username,
                  'oldPwd':password,
                  'memPwd':newpassword},
            timeout: 30000,
            error: function(){
                $.popdialog(button,"modify_password_info","修改密码失败,请重试");
                return;
            },
            success: function(response){
                var result=response.result;
                var status=result.status;
                var message=result.message;
                $.popdialog(button,"modify_password_info",message);
                return;
            }
     });
    }
</script>

</head>

<body>
    <%--面包屑内容开始--%>
    <div id="breadcrumb">
	    <a href="${ctx}">首页</a><span>></span>我的上品<span>></span>修改密码</div>
    <%--面包屑内容结束--%>
<div style="width:950px;float:left">
    <%--左侧分类开始--%>
    <jsp:include page="myshopin_left.jsp"/>
    <%--左侧分类结束--%>
    <%--右侧分类开始--%>
	<div id="content-rightweihzi">
	    <div id="content-right" >
    	<ul class="biaoge">
        	<li class="biaoge-top"><strong style="color:#5050B5">修改密码</strong></li>
        </ul>
		<ul class="biaogey">
			<li>旧Email地址:
				<input name="username" type="text" value="" />&nbsp;&nbsp;<span>*</span>
			</li>
			<li>旧密码:&nbsp;&nbsp;
				<input name="password" type="password" value="" />&nbsp;&nbsp;<span>*</span>
			</li>
			<li>新密码:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input name="new_password" type="password" value="" />&nbsp;&nbsp;<span>*</span>
			</li>
			<li>确认密码:
				<input name="new_password_confirm" type="password" value="" />&nbsp;&nbsp;<span>*</span>
			</li>
			<li class="liimg" style="text-align:left">
                <img src="${images}/y-c002.gif" border="0" style="cursor:pointer" onclick="commit(this)"/>
			</li>
        </ul>
    </div>
   </div>
    <%--右侧分类结束--%>
</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>
</body>
</html>
