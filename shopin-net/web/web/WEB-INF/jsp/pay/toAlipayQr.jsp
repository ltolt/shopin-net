<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="net.shopin.web.vo.*" %>
<%@ page import="java.util.*" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>去支付宝支付</title>
<link href="${localcss}/reset.css" rel="stylesheet" type="text/css">
<link href="${localcss}/layout.css" rel="stylesheet" type="text/css">
<link href="${localcss}/master.css" rel="stylesheet" type="text/css">
<style type="text/css">
#container h3 {font-size:24px;margin-bottom:30px; font-family:'microsoft yahei'}
.style1 {color:#f00}
</style>


</head>

<body>
<div id="container">
    <div class="in oz" style="width:600px;margin:20px auto 30px">
        <h3 class="tc">支付宝扫码支付</h3>
        <iframe width="600" height="300" frameborder="0" style="width:600px;height:300px;border:none" src="${url}" ></iframe>
    </div>
</div>
</body>
</html>
