<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<HTML>
<HEAD>
    <META http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <TITLE>去工行支付</TITLE>
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
    <input name="interfaceName" type="hidden" value="${interfaceName}"/>
    <input name="interfaceVersion" type="hidden" value="${interfaceVersion}"/>
    <input name="tranData" type="hidden" value="${ tranData }"/>
    <input name="merSignMsg" type="hidden" value="${ merSignMsg }"/>
    <input name="merCert" type="hidden" value="${ merCert }"/>

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

                　　　<center><font color="#f60">转入工行页面请稍候......</font></center>

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
