<%--
  Description: Sub Channel[value buying]
  User: Peter Wei
  Date: 2010-1-12
  Time: 13:01:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head><title>上品折扣网shopin.net- 商场名牌1-3折限量秒杀,正品保障,网上购物!服装品牌,名品折扣,名牌打折,团购价!上品折扣官方购物网站</title>

    <link type="text/css" href="${css}/channels.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${css}/freetab.css"/>
    <link rel="stylesheet" href="${css}/slideshow.css"/>
    <link rel="stylesheet" href="${css}/template.css"/>
    <script type="text/javascript" src="${js}/jwidget/jwidget_1.0.0-min.js"></script>
    <script type="text/javascript" src="${js}/jquery/jquery.freetab-0.1.js"></script>
    <script type="text/javascript" src="${js}/jquery/jcarousellite_1.0.1.js"></script>
    <script type="text/javascript" src="${js}/jquery/jquery.easing.1.1.js"></script>
    <style type="text/css">

            /*  some style
               ---------------
            */

    </style>
    <script type="text/javascript">
        //var jq = jQuery.noConflict();
        jQuery(document).ready(function($) {
            //jwidget slides
            jWidget.ui.SlideView("slider", {effect: 'scrolly'});

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
<!--[if !ie]>头部广告开始<![endif]-->
<div>
    <ul class="banner-channels">
        <ol><img src="${images}/i-56.gif" alt="上品女人"/>

            <p>${channel.channelDesc}</p></ol>
        <c:forEach var="i" begin="0" end="3" step="1">
            <li>
                <ul class="banner-channels-1">
                    <c:forEach var="brandRank" items="${brandRanks}" begin="${i*4}" end="${i*4+3}" step="1"
                               varStatus="status">
                        <c:if test="${status.index == i*4}">
                            <li><strong>热卖&nbsp;&nbsp;</strong>
                            <a href="${ctx}/brand-${brandRank.brand.sid}.html">${brandRank.brand.brandName}</a></c:if>
                        <c:if test="${status.index == i*4+1}">|
                            <a href="${ctx}/brand-${brandRank.brand.sid}.html">${brandRank.brand.brandName}</a></li>
                        </c:if>
                        <c:if test="${status.index == i*4+2}">
                            <li><strong>品牌&nbsp;&nbsp;</strong>
                            <a href="${ctx}/brand-${brandRank.brand.sid}.html">${brandRank.brand.brandName}</a></c:if>
                        <c:if test="${status.index == i*4+3}"> |
                            <a href="${ctx}/brand-${brandRank.brand.sid}.html">${brandRank.brand.brandName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </li>
        </c:forEach>
    </ul>
</div>
<!--[if !ie]>头部广告结束<![endif]-->

<!--[if !ie]>主体内容开始<![endif]-->
<div id="content">
    <div class="layout grid-s5m0">

        <div class="col-main">
            <!--活动开始-->
            <div class="main-wrap" style="background-color: lightgray;">
                <div id="content-right">
                    <!--[if !ie]>限时特卖会开始<![endif]-->
                    <ul class="flash">
                        <li class="flash-title">
                            <img src="${images}/i-9.gif" alt="限时特卖会"/>
                            <span class="flash-font12">还剩 <span class="flash-font16">10</span>天<span
                                    class="flash-font16">12</span>小时<span class="flash-font16">23</span>分<span
                                    class="flash-font16">46</span>秒 结束</span>
                        </li>
                        <li>
                            <!-- 图片轮播 开始 -->
                            <div id="slider" class="slider">
                                <ul>
                                    <li><a href="${ctx}/view/productList.html"><img src="${images}/1-1.jpg" width="510"
                                                                                    height="308"
                                                                                    alt="Lightning"/></a></li>
                                    <li><a href="${ctx}/view/productList.html"><img src="${images}/1-2.jpg" width="510"
                                                                                    height="308"
                                                                                    alt="Mojave"/></a></li>
                                    <li><a href="${ctx}/view/productList.html"><img src="${images}/1-3.jpg" width="510"
                                                                                    height="308"
                                                                                    alt="Sea Mist"/></a></li>
                                    <li><a href="${ctx}/view/productList.html"><img src="${images}/1-4.jpg" width="510"
                                                                                    height="308"
                                                                                    alt="Ladybug"/></a></li>
                                    <li><a href="${ctx}/view/productList.html"><img src="${images}/1-1.jpg" width="510"
                                                                                    height="308"
                                                                                    alt="Lightning"/></a></li>
                                    <li><a href="${ctx}/view/productList.html"><img src="${images}/1-3.jpg" width="510"
                                                                                    height="308"
                                                                                    alt="Mojave"/></a></li>

                                </ul>
                                <ul id="slider_nav" class="slider_nav">
                                    <c:forEach var="p" begin="0" end="5" varStatus="status">
                                        <li>${status.index+1}</li>
                                    </c:forEach>
                                </ul>
                            </div>
                            <!-- 图片轮播 结束 -->
                        </li>

                    </ul>
                    <!--[if !ie]>限时特卖会结束<![endif]-->
                    <!--[if !ie]>收藏/打折快报/网站公告开始<![endif]-->
                    <ul class="sidebar">
                        <li class="sidebar-title">已有145897人收藏<span><a href="#" target="_blank">收藏本站>></a></span></li>
                        <li>
                            <ul>
                                <li class="sidebar-titlemore"><strong>打折快报</strong><span><a href="#"
                                                                                            target="_blank">订阅</a> | <a
                                        href="#" target="_blank">更多>></a></span></li>
                                <li class="sidebar-titleh1">
                                    <h1><a href="#" target="_blank">Esprit秋冬新款大衣特卖</a></h1>

                                    <p><a href="#" target="_blank">3折20元起 限100件 7天限时抢购</a></p>
                                </li>
                                <c:forEach var="notice" items="${notices}" begin="0" end="3" varStatus="status">
                                    <li class="sidebar-titlecontent"><a href="#current">01.08-01.30 ${notice.title}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                            <img src="${images}/del/d-2.gif" alt="活动广告" class="sidebar-imgad"/>
                        </li>
                    </ul>
                    <!--[if !ie]>收藏/打折快报/网站公告结束<![endif]-->
                </div>

            </div>
            <!--活动结束-->

            <!--[if !ie]>热卖商品/人气品牌开始<![endif]-->
            <div class="main-wrap">
                <div id="content-right">
                    ${columns[0].template}
                    <ul class="sidebar1">
                        <li class="sidebar-title"><strong>人气品牌</strong><span><a href="#">更多>></a></span></li>
                        <li>
                        <li class="top10-list">
                            <ul>
                                <c:forEach var="rank" items="${brandRanks}" begin="0" end="7" varStatus="status">
                                    <c:if test="${rank.rankChange=='0'}">
                                        <c:set var="changePic" value="${images}/i-41.gif"></c:set>
                                    </c:if>
                                    <c:if test="${rank.rankChange=='1'}">
                                        <c:set var="changePic" value="${images}/i-42.gif"></c:set>
                                    </c:if>
                                    <c:choose><c:when test="${status.index<3}">
                                        <li class="top10-list">
                                            <a href="#">
                                                <span class="top10-icon brandTopRed">${status.index+1}</span>
                                                <span class="top10-name">${rank.brand.brandName}</span>
                                                <span class="top10-parts">${rank.salesNum}</span>
                                                <span class="topup-img"><img src="${changePic}"/></span>
                                            </a>
                                        </li>
                                    </c:when>
                                        <c:otherwise>
                                            <li class="top10-list">
                                                <a href="#">
                                                    <span class="top10-icon brandTopGray">${status.index+1}</span>
                                                    <span class="top10-name">${rank.brand.brandName}</span>
                                                    <span class="top10-parts">${rank.salesNum}</span>
                                                    <span class="topup-img"><img src="${changePic}"/></span>
                                                </a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <!--[if !ie]>热卖商品/人气品牌结束<![endif]-->


            <div class="main-wrap">
                ${columns[1].template}
            </div>



            <div class="main-wrap">
                ${columns[2].template}
            </div>


            <!--活动广告开始-->
            <div class="main-wrap">
                <div class="channel-ad"><a href="#" target="_blank"><img src="${images}/del/d-3.gif" alt="活动广告"/></a>
                </div>
            </div>
            <!--活动广告结束-->


            <div class="main-wrap">
                ${columns[3].template}
            </div>


            <div class="main-wrap">
                <div>other column..other column..other</div>
            </div>
        </div>
        <!--[if !ie]>左侧分类开始<![endif]-->
        <div class="col-sub">
            <jsp:include page="/common/channelleft.jsp"/>
        </div>
        <!--[if !ie]>左侧分类结束<![endif]-->
    </div>
</div>
<!--[if !ie]>主体内容结束<![endif]-->

<!--[if !ie]>尾部广告开始<![endif]-->
<div>
</div>
<!--[if !ie]>尾部广告结束<![endif]-->

</body>
</html>