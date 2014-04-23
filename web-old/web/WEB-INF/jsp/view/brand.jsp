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
<head><title>${brand.brandName}品牌折扣店-上品折扣网shopin.net- 商场名牌2-5折限量秒杀,正品保障,网上购物!服装品牌,名品折扣,名牌打折,团购价!上品折扣官方购物网站</title>
    <link rel="stylesheet" href="${css}/lay.css"/>
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
<!--[if !ie]>品牌广告内容开始<![endif]-->
<div class="grid-m">
    <div class="wrapper">
        <div class="sharp color1">
            <c:if test="${not empty brand.brandPict}">
               <img src="${images}/${brand.brandPict}" alt=""/>
            </c:if>
     </div>
</div>
</div>
<!--[if !ie]>品牌广告内容结束<![endif]-->
<!--[if !ie]>主体内容开始<![endif]-->
<div id="content">
    <div class="layout grid-s5m0">
        <div class="col-main">
            <div class="main-wrap">
              <div style="line-height:40px;color:#f00">　温馨提示：本页面所示价格仅供参考，实际以点击商品最终页面后的“上品折扣价”为准。</div>
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

					<c:if test="${fn:length(products)>0}">
                    <div class="content-right2">
                        <div class="shoucang-top">
                            <div class="left">折扣精品</div>
                            <div class="right"></div>
                        </div>
                            <ul class="button-sort">
                                
                                <li><a
                                    href="${ctx}/list-${queryVo.proBrand}-${queryVo.proCate}-${discount.startValue}-${discount.endValue}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-0-${queryVo.orderByTime}-${queryVo.style}.html"
                                    class="content2-img"><img src="${images}/w-36.gif" alt="价格由低到高"/></a></li>
                               
                                <li><a
                                    href="${ctx}/list-${queryVo.proBrand}-${queryVo.proCate}-${discount.startValue}-${discount.endValue}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-1-${queryVo.orderByTime}-${queryVo.style}.html"
                                    class="content2-img"><img src="${images}/w_37.gif" alt="价格由高到低"/></a></li>

                                <li><a
                                    href="${ctx}/list-${queryVo.proBrand}-${queryVo.proCate}-${discount.startValue}-${discount.endValue}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-0-${queryVo.style}.html"
                                    class="content2-img"><img src="${images}/w_38.gif" alt="最新时间"/></a></li>

                                <li><a
                                    href="${ctx}/list-${queryVo.proBrand}-${queryVo.proCate}-${discount.startValue}-${discount.endValue}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-1-${queryVo.style}.html"
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
                      </c:if>
                      <c:if test="${fn:length(products)<=0}">
                        <div class="content-right2">
  															 <p style="text-align:center;padding-top:80px; font-size:14px;">对不起，您来晚了，此品牌货品已抢购一空！<br/><br/>欢迎抢购其他品牌货品！</p>
															 <p style="text-align:center; padding:30px 0 630px 0;"><a href="http://www.shopin.net/newzone.html" target="_blank"><img src="http://images.shopin.net/images/0524b1.gif" border="0"></a><a href="http://www.shopin.net/promotions.html" target="_blank"><img src="http://images.shopin.net/images/0524b2.gif" border="0" style="margin-left:40px; "></a></p>
                        </div>
                      </c:if>
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
