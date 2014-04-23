<%--
  Description:会员账户信息
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>我的账户信息</title>

<script type="text/javascript" src="${js}/input.js"></script>
<link href="${css}/myshopin.css" rel="stylesheet" type="text/css" />
</head>

<body>

<%--面包屑内容开始--%>
    <div id="breadcrumb">
	    <a href="${ctx}">首页</a><span>></span>我的上品<span>></span>优惠券
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
                <li class="biaoge-top"><strong style="color:#5050B5">优惠券明细</strong></li>
            </ul>
             <ul class="top-fenlei06">
                 <li class="top-fenlei">
                     <strong  style="color:#01439A">
                     <span style="padding-left:20px">名称</span>
                     <span style="padding-left:60px">类型</span>
                     <span style="padding-left:50px">金额</span>
                     <span style="padding-left:80px">使用开始时间</span>
                     <span class="fenlei05-name" style="padding-left:70px" >使用结束时间</span>
                     </strong>
                 </li>
                 <c:forEach items="${coupon_list}" var="item">
                 <li class="top-fenlei03">
                    <span class="fenlei05-name">${item.memberCouponName}</span>
                    <span class="fenlei05-name">${item.couponTypeName}</span>
                    <span class="fenlei05-name"><fmt:formatNumber value="${item.memberCoupon}" type="currency"/></span>
                    <span class="fenlei05-riqi">${item.couponStarttime}</span>
                    <span class="fenlei05-riqi">${item.couponendtime}</span>
                </li>
                </c:forEach>
                 <li style="float:right"><div class="digg" >${page}</div></li>
             </ul>
        </div>
	</div>
    <%--右侧分类结束--%>
</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>
</body>
</html>
