<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="net.shopin.web.vo.*" %>
<%@ page import="java.util.*" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>去工行支付</title>
    <link href="${localcss}/reset.css" rel="stylesheet" type="text/css">
	<link href="${localcss}/layout.css" rel="stylesheet" type="text/css">
	<link href="${localcss}/master.css" rel="stylesheet" type="text/css">

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

<form name="alipaysubmit" method="post" action="${url}">
    <%--<input type=hidden name="body" value="${body}">--%>
    <%--<input type=hidden name="out_trade_no" value="${out_trade_no}">--%>
    <%--<input type=hidden name="partner" value="${partner}">--%>
    <%--<input type=hidden name="payment_type" value="${payment_type}">--%>
    <%--<input type=hidden name="seller_email" value="${seller_email}">--%>
    <%--<input type=hidden name="service" value="${service}">--%>
    <%--<input type=hidden name="sign" value="${sign}">--%>
    <%--<input type=hidden name="total_fee" value="${total_fee}">--%>
    <%--<input type=hidden name="sign_type" value="${sign_type}">--%>
    <%--<input type=hidden name="subject" value="${subject}">--%>
    <%--<input type=hidden name="show_url" value="${show_url}">--%>
    <%--<input type=hidden name="return_url" value="${return_url}">--%>
    <%--<input type=hidden name="notify_url" value="${notify_url}">--%>

    <%--<input type=hidden name="credit_card_pay" value="${credit_card_pay}">--%>
    <%--<input type=hidden name="credit_card_default_display" value="${credit_card_default_display}">--%>
    <%----%>
    <%--<input type=hidden name="defaultbank" value="${defaultbank}">--%>
    <%--<input type=hidden name="paymethod" value="${paymethod}">--%>


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
                
	    　　　<center><font color="#f60">转入银行支付页面请稍候......</font></center>

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
