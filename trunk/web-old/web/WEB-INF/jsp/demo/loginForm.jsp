<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <script type="text/javascript">
       function postCommit(){
           var form=document.getElementById("form");
           form.action="${ctx}/demo/control/loginPost.html";
           form.submit();
       }

       function getCommit(){
           var username=document.getElementById("username").value;
           var password=document.getElementById("password").value;
           window.location="${ctx}/demo/control/"+username+"/"+password+".html";
       }
       function ajaxCommit(){
           var username=document.getElementById("username").value;
           var password=document.getElementById("password").value;
           $.ajax({
                url:'${ctx}/demo/control/loginAjax.json',
                type: 'post',
                dataType: 'json',
                data:{'username':username,
                       'password':password},
                timeout: 1000,
                error: function(){
                    alert('请求json失败');
                },
                success: function(json){
                        var obj=json;
                        var name=obj.member.username;
                        var pass=obj.member.password;
                        var msg=obj.msg;
                        $("#result").html('用户名:'+name+'<br/>'+'密码:'+pass+'<br/>'+'登录结果:'+msg+'<br/>');
                }
           });
        }

        function validateCommit(){
           var form=document.getElementById("form");
           form.action="${ctx}/demo/control/loginValidate.html";
           form.submit(); 
        }

    </script>
</head>
<body>
   <form id="form" action="" method="post">
       用户名：<input type="text" id="username" name="username" value="${member.username}">${username_error} <br/>
       密码：<input type="text" id="password" name="password" value="${member.password}">${password_error}
   </form> <br/>
   <input type="button" value="post commit" onclick="postCommit();">
   <input type="button" value="get commit" onclick="getCommit();">
   <input type="button" value="ajax commit" onclick="ajaxCommit();">
   <input type="button" value="validate commit" onclick="validateCommit();">
   <div id="result" style="width:500px;height:200px"></div>
</body>

</html>