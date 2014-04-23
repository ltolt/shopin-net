<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
    <title>我的留言</title>
    <link href="${css}/myshopin.css" rel="stylesheet" type="text/css"/>
    <link href="${css}/mymessage.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="breadcrumb">
    <a href="${ctx}">首页</a><span>></span>我的上品<span>></span>我的留言
</div>
<%--中间内容开始--%>
<div style="width:950px;float:left">
    <%--左侧分类开始--%>
    <jsp:include page="myshopin_left.jsp"/>


<div class="text-top222">
    <ul>
        <li><strong style="color:#5B5BBE">我的留言</strong></li>
    </ul>
</div>
<div class="messbutt">
    <a href="${ctx}/msg/common/1.html"><img src="${images}/w_79.gif"/></a>
</div>

<table class="pright1">
    <c:forEach items="${pageVO.list}" var="msg" varStatus="statu">

        <tr <c:if test="${statu.index%2==1}">class="nr"</c:if>>
            <td class="ptime2"><b>咨询内容：</b>${msg.msgContent}</td>
            <td class="ptime">${msg.leaveMsgTime}</td>
        </tr>
        <tr <c:if test="${statu.index%2==1}">class="nr"</c:if>>
            <td class="ptime2"><b>客服回复：</b>${msg.replayContent}</td>
            <td class="ptime">${msg.replayTime}</td>
        </tr>
    </c:forEach>
     <tr>
        <td>
            <div class="yahoo2">${page}</div>
        </td>
    </tr>
</table>

</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>

<%--<div style="width:950px;float:left">
<div class="text-top222">
    <ul>
        <li><strong style="color:#5B5BBE">我的留言</strong></li>
    </ul>
</div>
<div class="messbutt">
    <img src="${images}/w_79.gif"/>
</div>
<table class="pright1">
    <c:forEach items="${pageVO.list}" var="msg">
        <tr>
            <td class="ptime2"><b>咨询内容：</b>${msg.msgContent}</td>
            <td class="ptime">${msg.leaveMsgTime}</td>
        </tr>
        <tr>
            <td class="ptime2"><b>客服回复：</b>${msg.replayContent}</td>
            <td class="ptime">${msg.replayTime}</td>
        </tr>
    </c:forEach>
    <tr>
        <td>
            <div class="yahoo2">${page}</div>
        </td>
    </tr>
</table>


</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>--%>

</body>
</html>

