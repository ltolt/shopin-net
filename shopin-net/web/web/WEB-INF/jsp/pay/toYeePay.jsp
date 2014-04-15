<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<HTML>
<HEAD>
    <META http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <TITLE>去易宝支付</TITLE>
    <link href="${localcss}/reset.css" rel="stylesheet" type="text/css">
	<link href="${localcss}/layout.css" rel="stylesheet" type="text/css">
	<link href="${localcss}/master.css" rel="stylesheet" type="text/css">

    <script language="javascript">
        $(document).ready(function() {
            $("form:yeepay").submit();
        });
    </script>
</HEAD>
<BODY bgcolor=Silver>
<form name="yeepay" action='${nodeAuthorizationURL}' method='POST'>
			<input type='hidden' name='p0_Cmd'   value='${p0Cmd}'>
			<input type='hidden' name='p1_MerId' value='${p1MerId}'>
			<input type='hidden' name='p2_Order' value='${p2Order}'>
			<input type='hidden' name='p3_Amt'   value='${p3Amt}'>
			<input type='hidden' name='p4_Cur'   value='${p4Cur}'>
			<input type='hidden' name='p5_Pid'   value='${p5Pid}'>
			<input type='hidden' name='p6_Pcat'  value='${p6Pcat}'>
			<input type='hidden' name='p7_Pdesc' value='${p7Pdesc}'>
			<input type='hidden' name='p8_Url'   value='${p8Url}'>
			<input type='hidden' name='p9_SAF'   value='${p9SAF}'>
			<input type='hidden' name='pa_MP'    value='${paMP}'>
			<input type='hidden' name='pd_FrpId' value='${pdFrpId}'>
			<input type="hidden" name="pr_NeedResponse"  value="${prNeedResponse}">
			<input type='hidden' name='hmac'     value='${hmac}'>
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

                　　　<center><font color="#f60">转入易宝支付页面请稍候......</font></center>

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
