<%--
  Description:会员专享
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>会员专享</title>
    <link type="text/css" href="${css}/member-only.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${css}/freetab.css"/>
    <link rel="stylesheet" href="${css}/template.css"/>
    <script type="text/javascript" src="${js}/jquery/jquery.freetab-0.1.js"></script>
    <script type="text/javascript">
        //var jq = jQuery.noConflict();
        jQuery(document).ready(function($) {

        });
    </script>
</head>

<body>
<!--[if !ie]>页头开始<![endif]-->
<!--[if !ie]>页头结束<![endif]-->
<div class="banner-channels">
    <div class="member-header"></div>
    <div class="member-hfont">已有<span id=hfont-color>37234</span>人加入金上品折扣网，尊享有<span id=hfont-color>2340</span>款超值热卖商品。
    </div>
</div>
<div>
    <!--[if !ie]>左侧内容开始<![endif]-->
    <div id="content-left">
        <div class="member-info">
            <div class="member-infowelcom">
                <li style=" font-weight:bold">您好，${member.memName}</li>
                <li>等级：${member.memberLevel.levelName}<br/></li>
                <li>账户积分：<span style="color:#ff0000">${memberPoint.availPoint}</span>分
                </li>
                <li>账户余额：￥<span style="color:#ff0000">${memberAccount.balance}</span>元
                </li>
            </div>

        </div>
        <ul class="member-info">
            <li class="member-infotit">会员公告</li>
            <c:forEach var="notice" items="${notices2}" begin="0" end="5" varStatus="status">
                <li class="line24-dian"><a href="#current">${notice.title}</a></li>
            </c:forEach>
        </ul>
        <ul class="member-info">
            <li class="member-infotit">会员专享活动进行时</li>
            <c:forEach var="notice" items="${notices}" begin="0" end="5" varStatus="status">
                <li class="line24-dian"><a href="#current">${fn:substring(notice.noticesTime,0,10)} ${notice.title}</a>
                </li>
            </c:forEach>
        </ul>
        <!--
        <ul class="member-info">
            <li class="member-infotit">会员专享活动进行时</li>
            <li class="member-ing">
                <div class="member-infoimg"><img src="${images}/del/y_4.gif" border="0"/></div>
                <div class="member-infocontent">
                    <span class="member-infoctit">mm超爱big环保包</span><br/>3折20元起&nbsp;限100件&nbsp;7天限时<br/><span
                        class="member-inggo"><a href="#">立即抢购>></a></span>
                </div>
            </li>
            <li class="member-ing">
                <div class="member-infoimg"><img src="${images}/del/y_4.gif" border="0"/></div>
                <div class="member-infocontent">
                    <span class="member-infoctit">mm超爱big环保包</span><br/>3折20元起&nbsp;限100件&nbsp;7天限时<br/><span
                        class="member-inggo"><a href="#">立即抢购>></a></span>
                </div>
            </li>
        </ul>
        -->
        <ul class="member-info1">
            <li class="member-infotit">
                <div class="member-infttitl">您最近浏览过的商品</div>
                <div class="member-inftmore">清除</div>
            </li>
            <c:forEach var="product" begin="0" end="3" varStatus="status">
                <li class="member-img130"><a href="#"><img src="${images}/del/y_2.jpg" border="0"/></a></li>
            </c:forEach>

        </ul>
    </div>
    <!--[if !ie]>左侧内容结束<![endif]-->
    <!--[if !ie]>右侧内容开始<![endif]-->
    <div id="content-right">
        <div class="product-list">
            <div class="list-top">
                <ul class="list-title">
                    <li>会员专享商品</li>
                </ul>
            </div>
            <div class="list-content">
                <div class="product">
                    <ul>
                        <c:forEach var="product" items="${products}" varStatus="status">
                        <c:if test="${status.index%4==0&&status.index>3}">
                    </ul>
                    <ul>
                        </c:if>
                        <li>
                            <div class="sku-img"><a href="${ctx}/product/${product.sid}.html"><img
                                    src="${images}/${product.proPicture.proPictDir}/${product.proPicture.proPictName}"
                                    alt="${product.proSku}"/>

                                <div class="zhekou">
                                        ${product.proPrice.offValue}折
                                </div>
                            </a>
                            </div>
                            <div><a>

                                <p>${product.productName}</p></a>

                                <h3>
                                    <em>${product.proPrice.originalPrice}</em>￥${product.proPrice.promotionPrice}
                                </h3>
                                <span style="color:#FF6600">37</span>人推荐&nbsp;销售<span
                                        style="color:#FF6600">296</span>件</span>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="yahoo2">
                ${page}
            </div>
        </div>
        <!--[if !ie]>右侧内容结束<![endif]-->
    </div>
    <div class="clear">&nbsp;</div>
</body>
</html>
