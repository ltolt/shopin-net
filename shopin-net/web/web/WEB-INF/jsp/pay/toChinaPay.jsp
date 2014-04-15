<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<HTML>
<HEAD>
    <META http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <TITLE>去银联支付</TITLE>
   <link href="${localcss}/reset.css" rel="stylesheet" type="text/css">
	<link href="${localcss}/layout.css" rel="stylesheet" type="text/css">
	<link href="${localcss}/master.css" rel="stylesheet" type="text/css">

    <script language="javascript">
        $(document).ready(function() {
            $("form:icbc").submit();
        });
    </script>
</HEAD>
<BODY bgcolor=Silver>
<form id="icbc" method="post" action="${toUrl}">
    <input type=hidden name="MerId" value="${MerId}">
    <input type=hidden name="OrdId" value="${OrdId}">
    <input type=hidden name="TransAmt" value="${TransAmt}">
    <input type=hidden name="CuryId" value="156">
    <input type=hidden name="TransDate" value="${TransDate}">
    <input type=hidden name="TransType" value="${TransType}">
    <input type=hidden name="Version" value="${Version}">
    <input type=hidden name="BgRetUrl" value="${BgRetUrl}">
    <input type=hidden name="PageRetUrl" value="${PageRetUrl}">
    <input type=hidden name="Priv1" value="${Priv1}">
    <input type=hidden name="ChkValue" value="${ChkValue}">
    <input type=hidden name="GateId" value="${GateId}">

    

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

                　　　<center><font color="#f60">转入银联页面请稍候......</font></center>

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
</BODY>
</HTML>
