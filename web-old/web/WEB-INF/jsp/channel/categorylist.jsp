<%--
  Description:All Category(所有品类页)
  User: Peter Wei
  Date: 2010-1-22
  Time: 17:00:51
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>所有品类-上品折扣网shopin.net- 商场名牌1-3折限量秒杀,正品保障,网上购物!服装品牌,名品折扣,名牌打折,团购价!上品折扣官方购物网站</title>
    <link rel="stylesheet" href="${css}/sort.css"/>
    <script type="text/javascript" src="${js}/jquery/jquery.freetab-0.1.js"></script>
    <style type="text/css">

            /* Some css style
            ----------------------------------*/


    </style>
    <script type="text/javascript">
        var jq = jQuery.noConflict();
        jQuery(document).ready(function($) {


        });
    </script>
</head>
<body>
<!--[if !ie]>主体内容开始<![endif]-->
<div id="sort-content">
<div class="sort-left">
    <ul>
        <c:forEach var="cate" items="${catelists.childCates}" varStatus="status">
             <li><a href="#cate${status.index}">${cate.nodeName}</a></li>
        </c:forEach>
    </ul>
</div>
<c:forEach var="cate" items="${catelists.childCates}" varStatus="status">
<div class="sort-right">
    <div class="sort-rtit">${cate.nodeName}<a name="cate${status.index}" id="cate${status.index}"></a></div>
        <c:forEach var="cate1" items="${cate.childCates}" varStatus="status2">
    <ul>
        <li class="sort-rli"><a href="${ctx}/list--${cate1.sid}.html" target="_blank">${cate1.nodeName}(${cate1.productCount})</a></li>
        <li>
            <ul class="sort-rul">
                <c:forEach var="cate2" items="${cate1.childCates}" varStatus="status2">
                    <li class="sort-rulli"><a href="${ctx}/list--${cate2.sid}.html" target="_blank">${cate2.nodeName}(${cate2.productCount})</a></li>
                </c:forEach>
            </ul>
        </li>
    </ul>
    </c:forEach>
</div>
</c:forEach>
</div>
<div class="clear"></div>
<!--[if !ie]>主体内容结束<![endif]-->
</body>
</html>