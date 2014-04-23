<%--
  Description:Brand Top10 Page(品牌排行榜)
  User: Peter Wei
  Date: 2010-1-20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head><title>Brand Top Page</title>
    <link rel="stylesheet" href="${css}/brand-top.css"/>
    <style type="text/css">

            /* Some css style
            ----------------------------------*/


    </style>
    <script type="text/javascript">
        //var jq = jQuery.noConflict();
        jQuery(document).ready(function($) {

        });
    </script>
</head>

<body>
<div class="tonglan"><img src="${images}/del/d-1.jpg" alt="上品折扣"/></div>
<!--[if !ie]>主体内容开始<![endif]-->
<div id="content">
<div class="layout grid-s210m0">
<div class="col-main">
<div class="main-wrap">
<div id="content-right1">
<div class="month-top10">
    <div class="bcimg-top10">24小时热销品牌<img src="${images}/i-29.gif" alt="top10"/></div>
    <ul>
        <li class="top10-backgroundF4F0EF">&nbsp;排名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品牌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销售件数&nbsp;</li>
                <c:forEach var="p" begin="0" end="9" varStatus="status">
                    <c:choose><c:when test="${status.index<3}">
                        <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopRed">${status.index+1}</span><span
                                class="top10-name">百丽${status.index+1}</span> <span
                                class="top10-parts">5645</span> <span
                                class="topup-img"><img
                                src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                    </c:when>
                        <c:otherwise>
                            <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopGray" <c:if test="${status.index==9}">style="text-indent:1px"</c:if>>${status.index+1}</span><span
                                    class="top10-name">puma</span> <span class="top10-parts">56745</span> <span
                                    class="topup-img"><img src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        <li class="top10-list-more"><a href="#">more>></a></li>
    </ul>
</div>
<div class="month-top10">
    <div class="bcimg-top10">一周热销品牌<img src="${images}/i-29.gif" alt="top10"/></div>
    <ul>
        <li class="top10-backgroundF4F0EF">&nbsp;排名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品牌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销售件数&nbsp;</li>
                <c:forEach var="p" begin="0" end="9" varStatus="status">
                    <c:choose><c:when test="${status.index<3}">
                        <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopRed">${status.index+1}</span><span
                                class="top10-name">百丽${status.index+1}</span> <span
                                class="top10-parts">5645</span> <span
                                class="topup-img"><img
                                src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                    </c:when>
                        <c:otherwise>
                            <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopGray" <c:if test="${status.index==9}">style="text-indent:1px"</c:if>>${status.index+1}</span><span
                                    class="top10-name">puma</span> <span class="top10-parts">56745</span> <span
                                    class="topup-img"><img src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        <li class="top10-list-more"><a href="#">more>></a></li>
    </ul>
</div>
<div class="month-top10 month-top11">
    <div class="bcimg-top10">10月热销品牌<img src="${images}/i-29.gif" alt="top10"/></div>
    <ul>
        <li class="top10-backgroundF4F0EF">&nbsp;排名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品牌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销售件数&nbsp;</li>
                <c:forEach var="p" begin="0" end="9" varStatus="status">
                    <c:choose><c:when test="${status.index<3}">
                        <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopRed">${status.index+1}</span><span
                                class="top10-name">百丽${status.index+1}</span> <span
                                class="top10-parts">5645</span> <span
                                class="topup-img"><img
                                src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                    </c:when>
                        <c:otherwise>
                            <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopGray" <c:if test="${status.index==9}">style="text-indent:1px"</c:if>>${status.index+1}</span><span
                                    class="top10-name">puma</span> <span class="top10-parts">56745</span> <span
                                    class="topup-img"><img src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        <li class="top10-list-more"><a href="#">more>></a></li>
    </ul>
</div>
<div class="month-top10">
    <div class="bcimg-top10">一周上升最快新上架品牌<img src="${images}/i-29.gif" alt="top10"/></div>
    <ul>
        <li class="top10-backgroundF4F0EF">&nbsp;排名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品牌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销售件数&nbsp;</li>
                <c:forEach var="p" begin="0" end="9" varStatus="status">
                    <c:choose><c:when test="${status.index<3}">
                        <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopRed">${status.index+1}</span><span
                                class="top10-name">百丽${status.index+1}</span> <span
                                class="top10-parts">5645</span> <span
                                class="topup-img"><img
                                src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                    </c:when>
                        <c:otherwise>
                            <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopGray" <c:if test="${status.index==9}">style="text-indent:1px"</c:if>>${status.index+1}</span><span
                                    class="top10-name">puma</span> <span class="top10-parts">56745</span> <span
                                    class="topup-img"><img src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        <li class="top10-list-more"><a href="#">more>></a></li>
    </ul>
</div>
<div class="month-top10">
    <div class="bcimg-top10">运动休闲类<span><a href="#" target="_blank">日</a> <a href="#" target="_blank">周</a> <a href="#"
                                                                                                               target="_blank">月</a></span>
    </div>
    <ul>
        <li class="top10-backgroundF4F0EF">&nbsp;排名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品牌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销售件数&nbsp;</li>
                <c:forEach var="p" begin="0" end="9" varStatus="status">
                    <c:choose><c:when test="${status.index<3}">
                        <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopRed">${status.index+1}</span><span
                                class="top10-name">百丽${status.index+1}</span> <span
                                class="top10-parts">5645</span> <span
                                class="topup-img"><img
                                src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                    </c:when>
                        <c:otherwise>
                            <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopGray" <c:if test="${status.index==9}">style="text-indent:1px"</c:if>>${status.index+1}</span><span
                                    class="top10-name">puma</span> <span class="top10-parts">56745</span> <span
                                    class="topup-img"><img src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        <li class="top10-list-more"><a href="#">more>></a></li>
    </ul>
</div>
<div class="month-top10 month-top11">
    <div class="bcimg-top10">女装类<span><a href="#" target="_blank">日</a> <a href="#" target="_blank">周</a> <a href="#"
                                                                                                             target="_blank">月</a></span>
    </div>
    <ul>
        <li class="top10-backgroundF4F0EF">&nbsp;排名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品牌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销售件数&nbsp;</li>
                <c:forEach var="p" begin="0" end="9" varStatus="status">
                    <c:choose><c:when test="${status.index<3}">
                        <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopRed">${status.index+1}</span><span
                                class="top10-name">百丽${status.index+1}</span> <span
                                class="top10-parts">5645</span> <span
                                class="topup-img"><img
                                src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                    </c:when>
                        <c:otherwise>
                            <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopGray" <c:if test="${status.index==9}">style="text-indent:1px"</c:if>>${status.index+1}</span><span
                                    class="top10-name">puma</span> <span class="top10-parts">56745</span> <span
                                    class="topup-img"><img src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        <li class="top10-list-more"><a href="#">more>></a></li>
    </ul>
</div>
<div class="month-top10">
    <div class="bcimg-top10">男装类<span><a href="#" target="_blank">日</a> <a href="#" target="_blank">周</a> <a href="#"
                                                                                                             target="_blank">月</a></span>
    </div>
    <ul>
        <li class="top10-backgroundF4F0EF">&nbsp;排名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品牌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销售件数&nbsp;</li>
                <c:forEach var="p" begin="0" end="9" varStatus="status">
                    <c:choose><c:when test="${status.index<3}">
                        <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopRed">${status.index+1}</span><span
                                class="top10-name">百丽${status.index+1}</span> <span
                                class="top10-parts">5645</span> <span
                                class="topup-img"><img
                                src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                    </c:when>
                        <c:otherwise>
                            <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopGray" <c:if test="${status.index==9}">style="text-indent:1px"</c:if>>${status.index+1}</span><span
                                    class="top10-name">puma</span> <span class="top10-parts">56745</span> <span
                                    class="topup-img"><img src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        <li class="top10-list-more"><a href="#">more>></a></li>
    </ul>
</div>
<div class="month-top10">
    <div class="bcimg-top10">鞋类<span><a href="#" target="_blank">日</a> <a href="#" target="_blank">周</a> <a href="#"
                                                                                                            target="_blank">月</a></span>
    </div>
    <ul>
        <li class="top10-backgroundF4F0EF">&nbsp;排名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品牌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销售件数&nbsp;</li>
                <c:forEach var="p" begin="0" end="9" varStatus="status">
                    <c:choose><c:when test="${status.index<3}">
                        <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopRed">${status.index+1}</span><span
                                class="top10-name">百丽${status.index+1}</span> <span
                                class="top10-parts">5645</span> <span
                                class="topup-img"><img
                                src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                    </c:when>
                        <c:otherwise>
                            <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopGray" <c:if test="${status.index==9}">style="text-indent:1px"</c:if>>${status.index+1}</span><span
                                    class="top10-name">puma</span> <span class="top10-parts">56745</span> <span
                                    class="topup-img"><img src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        <li class="top10-list-more"><a href="#">more>></a></li>
    </ul>
</div>
<div class="month-top10 month-top11">
    <div class="bcimg-top10">内衣类<span><a href="#" target="_blank">日</a> <a href="#" target="_blank">周</a> <a href="#"
                                                                                                             target="_blank">月</a></span>
    </div>
    <ul>
        <li class="top10-backgroundF4F0EF">&nbsp;排名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品牌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销售件数&nbsp;</li>
                <c:forEach var="p" begin="0" end="9" varStatus="status">
                    <c:choose><c:when test="${status.index<3}">
                        <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopRed">${status.index+1}</span><span
                                class="top10-name">百丽${status.index+1}</span> <span
                                class="top10-parts">5645</span> <span
                                class="topup-img"><img
                                src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                    </c:when>
                        <c:otherwise>
                            <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopGray" <c:if test="${status.index==9}">style="text-indent:1px"</c:if>>${status.index+1}</span><span
                                    class="top10-name">puma</span> <span class="top10-parts">56745</span> <span
                                    class="topup-img"><img src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        <li class="top10-list-more"><a href="#">more>></a></li>
    </ul>
</div>
<div class="month-top10">
    <div class="bcimg-top10">童装母婴类<span><a href="#" target="_blank">日</a> <a href="#" target="_blank">周</a> <a href="#"
                                                                                                               target="_blank">月</a></span>
    </div>
    <ul>
        <li class="top10-backgroundF4F0EF">&nbsp;排名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品牌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销售件数&nbsp;</li>
                <c:forEach var="p" begin="0" end="9" varStatus="status">
                    <c:choose><c:when test="${status.index<3}">
                        <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopRed">${status.index+1}</span><span
                                class="top10-name">百丽${status.index+1}</span> <span
                                class="top10-parts">5645</span> <span
                                class="topup-img"><img
                                src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                    </c:when>
                        <c:otherwise>
                            <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopGray" <c:if test="${status.index==9}">style="text-indent:1px"</c:if>>${status.index+1}</span><span
                                    class="top10-name">puma</span> <span class="top10-parts">56745</span> <span
                                    class="topup-img"><img src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        <li class="top10-list-more"><a href="#">more>></a></li>
    </ul>
</div>
<div class="month-top10">
    <div class="bcimg-top10">包箱配饰类<span><a href="#" target="_blank">日</a> <a href="#" target="_blank">周</a> <a href="#"
                                                                                                               target="_blank">月</a></span>
    </div>
    <ul>
        <li class="top10-backgroundF4F0EF">&nbsp;排名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品牌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销售件数&nbsp;</li>
                <c:forEach var="p" begin="0" end="9" varStatus="status">
                    <c:choose><c:when test="${status.index<3}">
                        <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopRed">${status.index+1}</span><span
                                class="top10-name">百丽${status.index+1}</span> <span
                                class="top10-parts">5645</span> <span
                                class="topup-img"><img
                                src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                    </c:when>
                        <c:otherwise>
                            <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopGray" <c:if test="${status.index==9}">style="text-indent:1px"</c:if>>${status.index+1}</span><span
                                    class="top10-name">puma</span> <span class="top10-parts">56745</span> <span
                                    class="topup-img"><img src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        <li class="top10-list-more"><a href="#">more>></a></li>
    </ul>
</div>
<div class="month-top10 month-top11">
    <div class="bcimg-top10">家居用品类<span><a href="#" target="_blank">日</a> <a href="#" target="_blank">周</a> <a href="#"
                                                                                                               target="_blank">月</a></span>
    </div>
    <ul>
        <li class="top10-backgroundF4F0EF">&nbsp;排名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品牌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销售件数&nbsp;</li>
                <c:forEach var="p" begin="0" end="9" varStatus="status">
                    <c:choose><c:when test="${status.index<3}">
                        <li class="top10-list"><a href="${ctx}/brand/brand-page.html"><span class="top10-icon brandTopRed">${status.index+1}</span><span
                                class="top10-name">百丽${status.index+1}</span> <span
                                class="top10-parts">5645</span> <span
                                class="topup-img"><img
                                src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                    </c:when>
                        <c:otherwise>
                            <li class="top10-list"><a href="${ctx}/brand/brand-page.htmls"><span class="top10-icon brandTopGray" <c:if test="${status.index==9}">style="text-indent:1px"</c:if>>${status.index+1}</span><span
                                    class="top10-name">puma</span> <span class="top10-parts">56745</span> <span
                                    class="topup-img"><img src="${images}/i-41.gif" alt="上升"/></span> </a></li>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
        <li class="top10-list-more"><a href="#">more>></a></li>
    </ul>
</div>
</div>
</div>
<div class="main-wrap">
    <div class="test-box">一些商品之类的内容</div>
</div>
</div>
<!--[if !ie]>左侧分类开始<![endif]-->
<div class="col-sub">
    <!--[if !ie]>左侧分类开始<![endif]-->
    <div id="content-left1">
        <ul>
            <li><a href="#">24小时热销品牌榜</a></li>
            <li><a href="#">一周热销品牌榜</a></li>
            <li><a href="#">10月热销品牌榜</a></li>
            <li><a href="#">一周上升最快新上架品牌榜</a></li>
            <li><a href="#">运动休闲品牌榜</a></li>
            <li><a href="#">女装品牌榜</a></li>
            <li><a href="#">男装品牌榜</a></li>
            <li><a href="#">名鞋品牌榜</a></li>
            <li><a href="#">内衣品牌榜</a></li>
            <li><a href="#">童装母婴品牌榜</a></li>
            <li><a href="#">箱包配饰品牌榜</a></li>
            <li><a href="#">家居用品品牌榜</a></li>
        </ul>
    </div>
    <!--[if !ie]>左侧分类结束<![endif]-->
</div>
<!--[if !ie]>左侧分类结束<![endif]-->
</div>
</div>
<!--[if !ie]>主体内容结束<![endif]-->
</body>
</html>