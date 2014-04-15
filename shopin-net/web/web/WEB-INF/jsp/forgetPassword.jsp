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
    <title>忘记密码</title>
    <link href="${css}/mycart.css" rel="stylesheet" type="text/css"/>
    <script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>
    <script type="text/javascript">

        <%--快速购买--%>
        function doResSet(button) {
            var username = $.trim($("#username").val());
            if (username == "") {
                alert("请输入注册邮箱");
                return;
            }
            $.ajax({
                url:'${ctx}/fetchPassword.json',
                type: 'post',
                dataType: 'json',
                data:{'email':username},
                timeout: 30000,
                error: function() {
                    $.popdialog(button, "fetch_password_info", '提交失败，请重试');
                    return;
                },
                success: function(response) {
                    var result = response.result;
                    var status = result.status;
                    var message = result.message;
                    if (status == '1') {
                        $.popdialog(button, 'fetch_password_info', "密码重置成功，请您登录邮箱获取新密码");
                    }else if(status == '11'){
                        $.popdialog(button, 'fetch_password_info', "系统正在维护，请稍后重试");
                    } else {
                        $.popdialog(button, 'fetch_password_info', message);
                    }
                    return;
                }
            });
        }


    </script>
</head>

<body>

<ul class="mylogin-logcontent">
    <ol class="forgetimg"><img src="${images}/w_52.gif"></ol>
    <li>
    	<ul class="forgetfont">
        	<li style=" font-size:14px;">请输入您在上品折扣网的用户名，然后单击"找回密码"按钮 </li>
    		<li style="padding:15px 0;">注册邮箱:<input id='username' name="j_username" type="text" class="ipt-t" tabindex="1"></li>
    		<li style="text-align:center;"><img src="${images}/w_49.gif" border="0" style="cursor:pointer" onClick="doResSet(this);"/></li>
        </ul>
</ul>
<div class="clear"></div>
</body>
</html>
