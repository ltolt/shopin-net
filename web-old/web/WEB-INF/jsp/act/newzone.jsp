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
    <title>新品上架-万款名牌100%正品,1-6折天天低价,1小时抢购!实体店供货,10天退换,全国送货上门!-www.shopin.net</title>
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
    </script>
</head>
<body>
<!--[if !ie]>页头开始<![endif]-->
<!--[if !ie]>页头结束<![endif]-->
<div class="tonglan"><img src="${images}/del/d-17.gif" alt="上品折扣"/></div>
<!--[if !ie]>主体内容开始<![endif]-->
<div id="content">
    <div class="layout grid-s5m0">
        <div class="col-main">
            <div class="main-wrap">
                ${columns[0].template}
            </div>
            <div class="main-wrap">
                ${columns[1].template}
            </div>
            <div class="main-wrap">
                ${columns[2].template}
            </div>
            <!--[if !ie]>产品列表开始<![endif]-->
            <div class="main-wrap">
                <div id="content-right">
                    <ul class="content2">
                        <li class="content2-top">
                            <ul class="content2-title">
                                <!--<li><a href="http://www.shopin.net/newzone.html"><img src="${images}/i-79.gif" alt="24小时更新商品" style="margin-right:1px;"/></a></li>-->
                                <li><a href="http://www.shopin.net/list-------3--1.html"><img src="${images}/w_64.gif" alt="最近三天上架" style="margin-right:1px;/></a></li>
                                <li><a href="http://www.shopin.net/list-------5--1.html"><img src="${images}/w_65.gif" alt="最近五天上架" style="margin-right:1px;/></a></li>
                                <li><a href="http://www.shopin.net/list-------7--1.html"><img src="${images}/w_66.gif" alt="最近七天上架" style="margin-right:1px;/></a></li>
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
                                            <img src="${images}/${product.proPicture.proPictDir}/${product.proPicture.proPictName}" alt="${product.productName}"/>

                                            <div class="zhekou">
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
</body>
</html>
