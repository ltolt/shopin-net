<%--
  Description:Brand Page(品牌最终页)
  User: Peter Wei
  Date: 2010-1-19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head><title>上品折扣官方网站,1-6折天天低价,1小时抢购!实体店供货,10天退换,全国送货上门!-www.shopin.net</title>
    <link rel="stylesheet" href="${css}/lay.css"/>
    <%--<link rel="stylesheet" href="${css}/brand-stores.css"/>--%>
    <link rel="stylesheet" href="${css}/factory.css"/>
    <style type="text/css">


    </style>
    <script type="text/javascript">
        $(function(){$(".badshow a:eq(1)").hide();$(".thumb a:eq(0)").hover(function(){$(".badshow a:eq(0)").show(100).siblings().hide(100);});$(".thumb a:eq(1)").hover(function(){$(".badshow a:eq(1)").show(100).siblings().hide(100);})})
        //var jq = jQuery.noConflict();
        jQuery(document).ready(function($) {

        });
        //用来切换图片的函数
        function switchImage(url) {
            $("#bigPic").attr("src", url);
        }
    </script>
</head>

<body>
<div class="brand_ad">
    <c:if test="${not empty(shipstore.widthpic)}">
    <div class="toppic"><img src="${images}${shipstore.widthpic}" width="952" height="121"/></div>
    </c:if>

    <div class="bra1">
        <div class="badshow">
            <a href="${shipstore.linkUrl1}" target="_blank"><img src="${images}${shipstore.switchImage1Big}" width="664"
                             height="364"/></a>
            <a href="${shipstore.linkUrl2}" target="_blank"><img src="${images}${shipstore.switchImage2Big}" width="664"
                             height="364"/></a>
        </div>
        <div class="badside">
            <div class="thumb">
                <a><img src="${images}${shipstore.switchImage1Small}" width="275" height="138"/></a>
                <a><img src="${images}${shipstore.switchImage2Small}" width="275" height="138"/></a>
            </div>
            <c:if test="${not empty(shipstore.storeNotices)}">
            <ul>
                <c:forEach var="notice" items="${shipstore.storeNotices}">
                <li>&gt; <a href="${notice.noticeUrl}" target="_blank">${notice.noticeTitle}</a></li>
                </c:forEach>
            </ul>
            </c:if>
        </div>
        <div class="clr"></div>
    </div>
    <c:if test="${not empty(shipstore.navImages)}">
    <div class="bra2">
        <ul>
            <c:forEach var="image" items="${shipstore.navImages}">
            <li><a href="${image.linkUrl}" target="_blank"><img src="${images}${image.imageUrl}" width="143"
                                 height="74"/></a></li>
            </c:forEach>
        </ul>
    </div>
    </c:if>
</div>

<!--[if !ie]>品牌广告内容结束<![endif]-->
<!--[if !ie]>主体内容开始<![endif]-->
<div id="content">
    <div class="layout grid-s5m0">
        <div class="col-main">

            <div class="main-wrap">
                <!--[if !ie]>右侧分类开始<![endif]-->
                <div id="content-right">
                    <%--<div id="banner2">
                        <ul>
                            <li><img src="${images}/1-9.gif" alt="" width="748"/></li>
                        </ul>
                    </div>--%>
                    <c:if test="${fn:length(starProducts)>0}">
                        <div class="content-right2">
                            <div class="mingxing">
                                <div class="mingxing_left">明星产品</div>
                                <div class="mingxing_right"></div>
                            </div>
                            <div class="Contentbox1">
                                <ul class="img-list">
                                    <c:forEach var="product" items="${starProducts}" begin="0" end="4"
                                               varStatus="status">
                                    <c:if test="${status.index%5==0&&status.index>4}">
                                </ul>
                            </div>
                            <div class="Contentbox1">
                                <ul class="img-list">
                                    </c:if>
                                    <li>
                                        <div class="sku-img"><a href="${ctx}/product/${product.sid}.html"
                                                                target="_blank"><img
                                                src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}"
                                                alt="${product.proSku}"/>

                                            <div class="<c:if test="${product.proPrice.offValue*1>=5}">new</c:if>zhekou">
                                                    ${product.proPrice.offValue}折
                                            </div>
                                        </a>
                                        </div>
                                        <div><a href="${ctx}/product/${product.sid}.html" target="_blank">
                                            <p>${product.productName}</p>
                                        </a> <span
                                                class="color666666"><em>￥${product.proPrice.originalPrice}</em>￥${product.proPrice.promotionPrice}</span>
                                        </div>
                                    </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </c:if>

                    <div class="content-right2">
                        <div class="shoucang-top">
                            <div class="left">折扣精品</div>
                            <div class="right"></div>
                        </div>
                        <ul class="button-sort">

                            <li><a
                                    href="${ctx}/list-${queryVo.proBrand}-${queryVo.proCate}-${discount.startValue}-${discount.endValue}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-0-${queryVo.orderByTime}.html"
                                    class="content2-img"><img src="${images}/w-36.gif" alt="价格由低到高"/></a></li>

                            <li><a
                                    href="${ctx}/list-${queryVo.proBrand}-${queryVo.proCate}-${discount.startValue}-${discount.endValue}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-1-${queryVo.orderByTime}.html"
                                    class="content2-img"><img src="${images}/w_37.gif" alt="价格由高到低"/></a></li>

                            <li><a
                                    href="${ctx}/list-${queryVo.proBrand}-${queryVo.proCate}-${discount.startValue}-${discount.endValue}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-0.html"
                                    class="content2-img"><img src="${images}/w_38.gif" alt="最新时间"/></a></li>

                            <li><a
                                    href="${ctx}/list-${queryVo.proBrand}-${queryVo.proCate}-${discount.startValue}-${discount.endValue}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-1.html"
                                    class="content2-img"><img src="${images}/w-39.gif" alt="最晚时间"/></a></li>
                        </ul>
                        <div class="Contentbox1">
                            <ul class="img-list">
                                <c:forEach var="product" items="${products}" varStatus="status">
                                <c:if test="${status.index%5==0&&status.index>4}">
                            </ul>
                        </div>
                        <div class="Contentbox1">
                            <ul class="img-list">
                                </c:if>
                                <li>
                                    <div class="sku-img"><a href="${ctx}/product/${product.sid}.html"
                                                            target="_blank"><img
                                            src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}"
                                            alt="${product.proSku}"/>

                                        <div class="<c:if test="${product.proPrice.offValue*1>=5}">new</c:if>zhekou">
                                                ${product.proPrice.offValue}折
                                        </div>
                                    </a>
                                    </div>
                                    <div>
                                        <p>${product.productName}</p>
                                        </a> <span
                                            class="color666666"><em>￥${product.proPrice.originalPrice}</em>￥${product.proPrice.promotionPrice}</span>
                                    </div>
                                </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="yahoo2">${page}</div>
                    </div>

                    <!--[if !ie]>右侧分类结束<![endif]-->
                </div>
            </div>
            <div class="main-wrap">
                <div>&nbsp;</div>
            </div>
        </div>
        <!--[if !ie]>左侧分类开始<![endif]-->
        <div class="col-sub">
            <jsp:include page="/common/brandleft.jsp"/>

        </div>
        <!--[if !ie]>左侧分类结束<![endif]-->
    </div>
</div>
<!--[if !ie]>主体内容结束<![endif]-->
</body>
</html>
