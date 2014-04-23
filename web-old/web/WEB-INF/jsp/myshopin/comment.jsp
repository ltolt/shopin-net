<%--
  Description:商品评论
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>商品评论</title>
<script type="text/javascript" src="${js}/input.js"></script>
<link href="${css}/myshopin.css" rel="stylesheet" type="text/css" />
</head>


<body>
<%--面包屑内容开始--%>
<div id="breadcrumb">
    <a href="${ctx}">首页</a><span>></span>我的上品<span>></span>商品评论
</div>
<%--面包屑内容结束--%>
<div style="width:950px;float:left">
    <%--左侧分类开始--%>
    <jsp:include page="myshopin_left.jsp"/>
    <%--左侧分类结束--%>
    <%--右侧分类开始--%>
    <div id="content-rightweihzi" style="float:right">
            <div id="content-right" style="float:right">
            <ul class="biaoge">
        	    <li class="biaoge-top" style="color:#5050B5"><strong>商品评论</strong></li>
            </ul>
            <c:forEach items="${commentlist}" var="item">
            <ul class="top-fenlei02">
                <li class="top-fenlei">
                    <strong style="color:#01439A">商品编号:</strong><a href="${ctx}/product/${item.productListSid}.html" target="_blank">${item.productProSku}</a>&nbsp;&nbsp;
                    <strong style="color:#01439A">商品名称：</strong><a href="${ctx}/product/${item.productListSid}.html" target="_blank">${item.productName}</a>&nbsp;&nbsp;
                    <strong style="color:#01439A">评论时间：</strong>${item.contentTime}&nbsp;&nbsp;
                    <a href="${ctx}/product/${item.productListSid}.html" target="_blank">
                        <strong style="color:#CD520E">添加评论</strong>
                    </a>
                </li>
                <li class="top-commenty">
                    <p><strong style="color:#5B5BBE">内容:</strong>${item.content}</p>
                </li>
                <c:forEach items="${item.replies}" var="reply" varStatus="status">
                <li class="top-commenty">
                    <p><strong style="color:#107CCC">回复${status.index+1}:</strong>${reply.content}</p>
                </li>
                </c:forEach>
            </ul>
            </c:forEach>
            <div class="pc02">
               <div class="digg">${page}</div>
            </div>
        </div>
    </div>
    <%--右侧分类结束--%>
</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>
</body>
</html>
