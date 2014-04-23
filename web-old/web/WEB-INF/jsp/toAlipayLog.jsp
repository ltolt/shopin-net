<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>去支付宝登陆</title>
    <link href="${css}/mycart.css" rel="stylesheet" type="text/css"/>

    <style type="text/css">
        <!--
        .STYLE1 {
            color: #FF0000
        }

        -->
    </style>
    <script language="javascript">
        $(document).ready(function() {
            $("form:alipaysubmit").submit();
        });
    </script>


</head>

<body>

<%--<form id="alipay_form" name="alipaysubmit" method="post"--%>
      <%--action="https://www.alipay.com/cooperate/gateway.do?_input_charset=utf-8">--%>
    <%--<input type=hidden name="partner" value="${partner}">--%>
    <%--<input type=hidden name="service" value="${service}">--%>
    <%--<input type=hidden name="sign" value="${ItemUrl}">--%>
    <%--<input type=hidden name="sign_type" value="${sign_type}">--%>
    <%--<input type=hidden name="return_url" value="${return_url}">--%>
<%--</form>--%>

     ${url}
<div id=pays-content>
    <div class="pay-kong1"></div>
    <div class="pay-kong1"></div>
    <div class="pay-kong1"></div>

    <br/>
    <br/>
    <br/>
    <br/>

    <div class="pays-bk">
            <span class="pays-bk100125"><br/>　
		  <br/>
                
	    　　　<center><font color="#f60">转入支付宝会员登陆页面请稍候......</font></center>

            </span><br/>
        <br/>

        <div class="pays-bk100125"></div>
    </div>
    <br/>
    <br/>

    <div class="pay-kong1"></div>
    <div class="pay-kong1"></div>
    <div class="pay-kong1"></div>

    <br/>
    <br/>
    <br/>
    <br/>
</div>

</form>
<div class="clear"></div>
</body>
</html>
