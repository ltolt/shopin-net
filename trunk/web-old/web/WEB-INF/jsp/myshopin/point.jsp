<%--
  Description:会员积分信息
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>我的积分</title>

<script type="text/javascript" src="${js}/input.js"></script>
<link href="${css}/myshopin.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%--面包屑内容开始--%>
<div id="breadcrumb">
    <a href="${ctx}">首页</a><span>></span>我的上品<span>></span>我的积分
</div>
<%--面包屑内容结束--%>
<div style="width:950px;float:left">
    <%--左侧分类开始--%>
    <jsp:include page="myshopin_left.jsp"/>
    <%--左侧分类结束--%>
    <%--右侧分类开始--%>
    <div id="content-rightweihzi" style="float:right">
        <div id="content-right">
            <ul class="biaoge">
                <li class="biaoge-top"><strong style="color:#5050B5">我的积分</strong></li>
            </ul>
             <ul class="top-jifen03">
                <li>目前您的账户积分为<span>${point.sumPoint}</span>分</li>
                <li>您目前是：<span>${currentLevel.levelName}</span>
                    <c:if test="${updateLevel!=null}">
                     ，只需<span>${updatepoint}</span>分，即可升级到<span>${updateLevel.levelName}</span>   
                    </c:if>
                </li>
             </ul>
             <ul class="top-fenlei06">
                <li><strong style="color:#5050B5">积分明细</strong></li>
                <li class="top-fenlei0122">
                     <span class="fenlei0122-jine"  style="color:#01439A">积分</span>
                     <span class="fenlei0122-name"  style="color:#01439A">类型</span>
                     <span class="fenlei0122-bianhao"  style="color:#01439A">时间</span>
                </li>
                <c:forEach items="${pointlist}" var="item">
                <li class="top-fenlei01221">
                    <span class="fenlei0122-jine1">${item.expPoints}</span>
                    <span class="fenlei0122-name1">${item.expType}</span>
                    <span class="fenlei0122-bianhao1">${item.expDate}</span>
                </li>
                </c:forEach>
                 <li style="float:right"><div  class="digg" >${page}</div></li>
             </ul>
        </div>
	</div>
    <%--右侧分类结束--%>
</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>
</body>
</html>
