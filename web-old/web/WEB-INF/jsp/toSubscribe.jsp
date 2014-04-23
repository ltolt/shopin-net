<%--
  Created by IntelliJ IDEA.
  User: yanwt
  Date: 2010-4-20
  Time: 13:11:16
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>会员邮件订阅</title>
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

        function submit() {
            var email = $('#facebox input[type=text]:first').val();
            if($.trim(email)==""){
                alert("请您输入正确格式的邮箱地址");
                return;
            }
            var valid = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(email);
            if (!valid) {
                alert("请您确认邮箱地址是否正确");
                return;
            }
            $.ajax({
                url:'${ctx}/web/saveSubscribe.json',
                type: 'post',
                dataType: 'json',
                data:{'email':email},
                timeout: 30000,
                success: function(response) {
                    var reEmail = response.subscribe;
                    if (reEmail == email) {
                        $("#yEmail").empty();
                        $("#yEmail").prepend(email);
                        $('#me').trigger('click');
                    }
                    return;
                }
            });
        }
    </script>
</head>
<body>

    <p><a href="#info" rel="facebox">会员订阅打折快报</a></p>
    <p><a id="me" href="#success" rel="facebox"></a></p>



<div id="info" style="display:none;">
    <ul class="dy-1">
        <li class="dy-title"></li>
        <li class="dy-font">我们会将最新的优惠信息发到您的Email</li>
        <li class="dy-from">
            <input id="email" name="email" type="text" class="dy-frominput">
            <span><a href="#"><img src="${images}/ad/03255.gif" border="0" align="absmiddle"
                       onclick="submit();"></a></span></li>
    </ul>
</div>

<div id="success" style="display:none;">
    <ul class="dy1-1">
            <li class="dy1-font">
                <span><img src="${images}/ad/03253.gif"></span>

                <div><h1>邮件订阅成功！</h1>

                    <p>我们会将最新的优惠信息发到您的Email</p></div>
            </li>
            <li class="dy1-from">您的邮件地址：<span id="yEmail"> </span> 已经加入到上品折扣网的邮件列表。您将第一时间收到来自上品折扣的最新产品介绍、特惠活动以及更多的蜂抢会信息！</li>
            <li class="dy1-more"><a href="http://www.shopin.net/promotions.html" target="_blank">更多的蜂抢会>>></a></li>
    </ul>
</div>


</body>
</html>