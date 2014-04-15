<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<HTML>
<HEAD>
    <META http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <TITLE>去招行支付</TITLE>
    <link href="${localcss}/reset.css" rel="stylesheet" type="text/css">
	<link href="${localcss}/layout.css" rel="stylesheet" type="text/css">
	<link href="${localcss}/master.css" rel="stylesheet" type="text/css">

    <script language="javascript">
        $(document).ready(function() {
            $("form:cmb").submit();
        });
    </script>
</HEAD>
<BODY bgcolor=Silver>
                        <%--https://mybank.icbc.com.cn/servlet/ICBCINBSEBusinessServlet--%>
<form id="cmb" method="post" action="https://netpay.cmbchina.com/netpayment/basehttp.dll?prepayc2">
    <input type="hidden" name="date" value="${date}">
    <input type="hidden" name="cono" value="${cono}">
    <input type="hidden" name="branchid" value="${branchid}">
    <input type="hidden" name="billno" value="${billno}">
    <input type="hidden" name="amount" value="${amount}">
    <input type="hidden" name="merchantUrl" value="${merchantUrl}">
    <input type="hidden" name="merchantPara" value="${merchantPara}">
    <input type="hidden" name="merchantCode" value="${merchantCode}">
    
    <%--<br><input type="submit"  value="提交">--%>
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

                　　　<center><font color="#f60">转入招行页面请稍候......</font></center>

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
