<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>去首信易支付</title>
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
            $("form:banksubmit").submit();
        });
    </script>


</head>

<body>

<form name="banksubmit" method="post" action="http://pay.beijing.com.cn/customer/gb/pay_bank.jsp">

    <input type=hidden name="v_mid" value="${v_mid}">
    <input type=hidden name="v_oid" value="${v_oid}">
    <input type=hidden name="v_rcvname" value="${v_rcvname}">
    <input type=hidden name="v_rcvaddr" value="${v_rcvaddr}">
    <input type=hidden name="v_rcvtel" value="${v_rcvtel}">
    <input type=hidden name="v_rcvpost" value="${v_rcvpost}">
    <input type=hidden name="v_amount" value="${v_amount}">
    <input type=hidden name="v_ymd" value="${v_ymd}">
    <input type=hidden name="v_orderstatus" value="${v_orderstatus}">
    <input type=hidden name="v_ordername" value="${v_ordername}">
    <input type=hidden name="v_moneytype" value="${v_moneytype}">
    <input type=hidden name="v_url" value="${v_url}">
    <input type=hidden name="v_md5info" value="${v_md5info}">
    <input type=hidden name="v_pmode" value="${v_pmode}">

    <div id=pays-content>
        <div class="pay-kong1"></div>
        <div class="pay-kong1"></div>
        <div class="pay-kong1"></div>

        <br/>
        <br/>
        <br/>
        <br/>

        <ul class="pays-bk">
                <span class="pays-bk100125"><br/>　
              <br/>

            　　　<center><font color="#f60">转入首信易页面请稍候......</font></center>

                </span><br/>
            <br/>

            <div class="pays-bk100125"></div>
        </ul>
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
