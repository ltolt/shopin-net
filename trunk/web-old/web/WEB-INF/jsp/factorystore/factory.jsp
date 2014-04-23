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
<head><title>${brand.brandName}品牌折扣店-上品折扣官方网站,1-6折天天低价,1小时抢购!实体店供货,10天退换,全国送货上门!-www.shopin.net</title>
    <link rel="stylesheet" href="${css}/lay.css"/>
    <%--<link rel="stylesheet" href="${css}/brand-stores.css"/>--%>
    <link rel="stylesheet" href="${css}/factory.css"/>
    <style type="text/css">



    </style>
    <script type="text/javascript">
        //var jq = jQuery.noConflict();
        jQuery(document).ready(function($) {

        });
        //用来切换图片的函数
        function  switchImage(url){
            $("#bigPic").attr("src",url);
        }
    </script>
</head>

<body>
<!--工厂店广告-->
    <c:if test="${not empty(factory.brandPict)}">
    <p><img src="${images}${factory.brandPict}"width="951" height="138"></p>
    </c:if>
<!--只有工厂店活动图和活动的图片都有的时候才显示此部分-->
<c:if test="${not empty(factory.factoryBicPic) && not empty(factory.activityBigPic)}">
   <ul class="factbanner">
		<li class="factbanner-big"><img src="${images}${factory.factoryBicPic}" id="bigPic" alt="${factory.brandName}" title="${factory.brandName}" width="710" height="395"></li>
		<li class="factbanner-sma">
			<p class="factbanner-sma1">
            <img src="${images}${factory.factorySmallPic}" border="0" style="cursor:pointer" onclick="switchImage('${images}${factory.factoryBicPic}')" width="190" height="181"></p>
			<p><img src="${images}${factory.activitySmallPic}" border="0" style="cursor:pointer" onclick="switchImage('${images}${factory.activityBigPic}')" width="190" height="181"></p>
		</li>
	</ul>
</c:if>

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
                                <c:forEach var="product" items="${starProducts}" begin="0" end="4" varStatus="status">
                                <c:if test="${status.index%5==0&&status.index>4}">
                            </ul>
                        </div>
                        <div class="Contentbox1">
                            <ul class="img-list">
                                </c:if>
                                <li>
                                    <div class="sku-img"><a href="${ctx}/product/${product.sid}.html" target="_blank"><img
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
                                    <div class="sku-img"><a href="${ctx}/product/${product.sid}.html" target="_blank"><img
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
