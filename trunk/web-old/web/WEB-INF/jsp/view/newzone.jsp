<%--
  Description:新品上架 
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>新品上架-上品折扣网shopin.net- 商场名牌1-3折限量秒杀,正品保障,网上购物!服装品牌,名品折扣,名牌打折,团购价!上品折扣官方购物网站</title>
    <link type="text/css" href="${css}/channels.css" rel="stylesheet"/>
    <link type="text/css" href="${css}/new-shelves.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${css}/freetab.css"/>
    <link rel="stylesheet" href="${css}/template.css"/>
    <script type="text/javascript" src="${js}/jquery/jquery.freetab-0.1.js"></script>
    <script type="text/javascript" src="${js}/jquery/jcarousellite_1.0.1.js"></script>
    <script type="text/javascript" src="${js}/jquery/jquery.easing.1.1.js"></script>
    <script type="text/javascript">
        //var jq = jQuery.noConflict();
        jQuery(document).ready(function($) {

            //tab
            //free tab2,tab2样式在freetab.css里调
            $(".tab2").each(function() {
                $(this).freetab({
                    nav: "tab_nav",
                    content: "tab_content",
                    //tab导航和tab content是通过class方式查找，如通过id则为'id'。
                    selectType: 'class',
                    //鼠标事件，0-onclick;1-onmouseover
                    event: 0
                });
            });
            //free tab1,tab1样式在freetab.css里调
            <!--li class为except的则不在导航列表中-->
            $(".tab1").each(function() {
                $(this).freetab({
                    nav: "tab_nav",
                    content: "tab_content",
                    //tab导航和tab content是通过class方式查找，如通过id则为'id'。
                    selectType: 'class',
                    //鼠标事件，0-onclick;1-onmouseover
                    event: 0
                });
            });

            //link tab,tab样式在freetab.css里调
            $(".linkTab").each(function() {
                $(this).freetab({
                    nav: "tab_nav",
                    navType: "a",
                    //鼠标事件，0-onclick;1-onmouseover
                    event: 0
                })
            });

            //滚动展示商品
            $(".roll_item").jCarouselLite({
                //control button
                btnNext: ".next",
                btnPrev: ".prev",
                speed: 1000,
                //easing: "backin",
                easing: "easeinout",
                //more or less
                visible: 2
            });

        });
        function doNewzone(newtab) {
            window.location = "${ctx}/newzone.html?recent=" + newtab;
        }
    </script>
</head>
<body>
<!--[if !ie]>页头开始<![endif]-->
<!--[if !ie]>页头结束<![endif]-->
<div style="padding-top:10px;"><a href="http://www.shopin.net/promotion/4950.html" target="_blank"><img src="http://images.shopin.net/images/ad/2012050303.jpg" alt="上品折扣"/></a></div>
<!--[if !ie]>主体内容开始<![endif]-->
<div id="content">
    <div class="layout grid-s5m0">
        <div class="col-main">
            <c:forEach var="column" items="${columns}" varStatus="status">
                <div class="main-wrap">
                    ${columns.template}
                </div>
            </c:forEach>
            <!--[if !ie]>产品列表开始<![endif]-->
            <div class="main-wrap">
                <div id="content-right">
                    <ul class="content2">
                        <li class="content2-top">
                            <ul class="content2-title">
                                <c:if test="${recent==1}"><li><img src="${images}/i-79.gif" alt="24小时更新商品"/></li></c:if>
                                <c:if test="${recent!=1}"><li><a href="javascript:doNewzone('1');"><img src="${images}/w_67.gif" alt="24小时更新商品"/></a></li></c:if>
                                <c:if test="${recent==3}"><li><img src="${images}/w_64.gif" alt="最近3天更新商品"/></li></c:if>
                                <c:if test="${recent!=3}"><li><a href="javascript:doNewzone('3');"><img src="${images}/w_68.gif" alt="最近3天更新商品"/></a></li></c:if>
                                <c:if test="${recent==5}"><li><img src="${images}/w_65.gif" alt="最近5天更新商品"/></li></c:if>
                                <c:if test="${recent!=5}"><li><a href="javascript:doNewzone('5');"><img src="${images}/w_69.gif" alt="最近5天更新商品"/></a></li></c:if>
                                <c:if test="${recent==7}"><li><img src="${images}/w_66.gif" alt="最近7天更新商品"/></li></c:if>
                                <c:if test="${recent!=7}"><li><a href="javascript:doNewzone('7');"><img src="${images}/w_70.gif" alt="最近7天更新商品"/></a></li></c:if>
                            </ul>
                        </li>
                        <li class="content8">
                            <ul class="new-list">
                                <c:forEach var="product" items="${products}" varStatus="status">
                                <c:if test="${status.index%5==0&&status.index>4}">
                            </ul>
                            <ul class="new-list">
                                </c:if>
                                <li>
                                    <div class="sku-img">
                                        <a href="${ctx}/product/${product.sid}.html" target="_blank">
                                            <img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}"/>

                                            <div class="<c:if test="${product.proPrice.offValue*1>5}">new</c:if>zhekou">
                                                    ${product.proPrice.offValue}折
                                            </div>
                                        </a>
                                    </div>
                                    <div>
                                        <a href="${ctx}/product/${product.sid}.html" target="_blank">
                                        <p>${product.productName}</p>
                                        </a>
                                        <h3>
                                            <em>￥${product.proPrice.originalPrice}</em>￥${product.proPrice.promotionPrice}
                                        </h3>
                                        <span class="color666666"><a href="${ctx}/list--${product.productCateSid}.html">更多同类商品>></a></span></div>
                                </li>
                                </c:forEach>

                            </ul>
                            <ul class="new-list">
                                <li>&nbsp;</li>
                            </ul>
                            <div class="yahoo2">
                                ${page}
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
            <!--[if !ie]>产品列表结束<![endif]-->
        </div>
        <!--[if !ie]>左侧分类开始<![endif]-->
        <div class="col-sub">
            <jsp:include page="/common/listleft.jsp"/>
        </div>
        <!--[if !ie]>左侧分类结束<![endif]-->
    </div>
</div>
<!--[if !ie]>主体内容结束<![endif]-->

<!-- google统计代码开始-->
<div style="display: none;">
<!-- Google Code for &#26032;&#21697;&#19978;&#26550; Remarketing List -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1028537178;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "666666";
var google_conversion_label = "KwZ9COTTgQIQ2va46gM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1028537178/?label=KwZ9COTTgQIQ2va46gM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
</div>
<!-- 结束-->
</body>
</html>
