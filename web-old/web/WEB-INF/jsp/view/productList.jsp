<%--
  Description:商品列表页
  User: Peter Wei
  Date: 2010-1-11
  Time: 17:00:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head><title>${navigation.name}上品折扣网shopin.net- 商场名牌1-3折限量秒杀,正品保障,网上购物!服装品牌,名品折扣,名牌打折,团购价!上品折扣官方购物网站</title>
    <link rel="stylesheet" href="${css}/yproduct_list.css"/>
    <script type="text/javascript" src="${js}/jwidget/jwidget_1.0.0-min.js"></script>
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
<!--[if !ie]>主体内容开始<![endif]-->
<div id="content">
    <div class="layout grid-s5m0">
        <div class="col-main">
            <div class="main-wrap">
                <div id="content-right">
                    <!--[if !ie]>二级导航开始<![endif]-->
                    <div class="channel-smenu"><a href="${ctx}/index.html">首页</a>>><c:forEach var="navigation"
                                                                                              items="${breadcrumbNavigation.list}"
                                                                                              varStatus="status"><a
                            href="${ctx}/${navigation.url}">${navigation.name}</a><c:if test="${!status.last}">>></c:if></c:forEach>
                    </div>
                    <!--[if !ie]>二级导航结束<![endif]-->
                    <div class="channel-ad"><a href="http://www.shopin.net/promotion/5809.html"><img src="http://images.shopin.net/images/ad/2012082301.jpg"
                                                                             alt="活动广告"/></a></div>         
																			 

              </div>
            </div>
            <!--[if !ie]>产品列表开始<![endif]-->
            <div class="main-wrap">
                <div id="content-right">
                    <!--[if !ie]>产品循环开始<![endif]-->
                    <ul class="content2">
                        <!--产品排序，翻页开始-->
                        <li class="content2-top">
                            <ul class="button-sort">
                                <li><a href="${ctx}/list-${queryVo.proBrand}-${queryVo.proCate}-${queryVo.soffprice}-${queryVo.eoffprice}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-0-${queryVo.orderByTime}-${queryVo.style}.html"
                                        class="content2-img"><img src="${images}/w-36.gif" alt="由低到高"/></a></li>

                                <li><a href="${ctx}/list-${queryVo.proBrand}-${queryVo.proCate}-${queryVo.soffprice}-${queryVo.eoffprice}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-1-${queryVo.orderByTime}-${queryVo.style}.html"
                                        class="content2-img"><img src="${images}/w_37.gif" alt="价格由高到低"/></a></li>


                                <li><a href="${ctx}/list-${queryVo.proBrand}-${queryVo.proCate}-${queryVo.soffprice}-${queryVo.eoffprice}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-0-${queryVo.orderByTime}-${queryVo.style}.html"
                                        class="content2-img"><img src="${images}/w_38.gif" alt="最新时间"/></a></li>


                                <li><a href="${ctx}/list-${queryVo.proBrand}-${queryVo.proCate}-${queryVo.soffprice}-${queryVo.eoffprice}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-1-${queryVo.orderByTime}-${queryVo.style}.html"
                                        class="content2-img"><img src="${images}/w-39.gif" alt="最晚时间"/></a></li>
                            </ul>
                        </li>
                        <!--产品排序，翻页结束-->

                        <!--每行5列-->
                        <li class="content2-bottom content2-bottom1">
                            <div class="channel-img-list">
                                <ul class="img-list img-list1">
                                    <c:forEach var="product" items="${products}" varStatus="status">
                                    <c:if test="${status.index%5==0&&status.index>4}">
                                </ul>
                            </div>
                        </li>
                        <li class="content2-bottom content2-bottom1">
                            <div class="channel-img-list">
                                <ul class="img-list img-list1">
                                    </c:if>
                                    <li>
                                        <div class="sku-img"><a href="${ctx}/product/${product.sid}.html" target="_blank">
                                            <img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}"/>
                                            <div class="<c:if test="${product.proPrice.offValue*1>5}">new</c:if>zhekou">
                                                    ${product.proPrice.offValue}折
                                            </div>
                                        </a>
                                        </div>
                                        <div><a href="${ctx}/product/${product.sid}.html" target="_blank">
                                            <p>${product.productName}</p>
                                        </a>
                                            <h3>
                                                <em>￥${product.proPrice.originalPrice}</em>￥${product.proPrice.promotionPrice}
                                            </h3>
                                        </div>

                                    </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </li>

                    </ul>
                    <!--[if !ie]>产品循环结束<![endif]-->
                    <!--翻页开始-->
                    <div class="yahoo2"> ${page} </div>
                    <!--翻页结束-->
                </div>
            </div>
            <!--[if !ie]>产品列表结束<![endif]-->
            <!--<div class="main-wrap">
                <div class="test-box">&nbsp;</div>
            </div>-->
        </div>
        <!--[if !ie]>左侧分类开始<![endif]-->
        <div class="col-sub">
            <jsp:include page="/common/listleft.jsp"/>
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