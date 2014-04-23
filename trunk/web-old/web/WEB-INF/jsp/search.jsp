<%--
  Created by IntelliJ IDEA.
  User: wentao
  Date: 2009-1-6
  Time: 11:30:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>${query}-上品折扣官方购物网站-万款名牌100%正品,1-6折天天低价,1小时抢购!实体店供货,10天退换,全国送货上门!-上品折扣网www.shopin.net</title>
    <meta name="Keywords" content="${query}"/>
    <link rel="stylesheet" href="${css}/yproduct_list.css"/>
    <script type="text/javascript">
        function orderby(orderby) {
            $("#order").val(orderby);
            $("#orderby").submit();
        }
    </script>
</head>
<body>
<!--[if !ie]>主体内容开始<![endif]-->
<div id="content">
    <div class="layout grid-s5m0">
        <div class="col-main">
            <!--[if !ie]>产品列表开始<![endif]-->
            <div class="main-wrap">
                <div id="content-right">
                    <c:if test="${fn:length(products)==0}">
                        <div class="product1008201">很遗憾，该商品已被抢空，请关注其他商品，及时提交订单。</div>
						<div style="text-align:center;"><a href="http://www.shopin.net/newzone.html"><img src="http://images.shopin.net/images/ad/08241.gif"></a></div>
                    </c:if>
                    <c:if test="${fn:length(products)>0}">
					<div style="color:#FF0000; ">温馨提示：本页面所示价格仅供参考，实际以点击商品最终页面后的“上品折扣价”为准。</div>
                    <!--[if !ie]>产品循环开始<![endif]-->
                    <form id="orderby" name="orderby" action="" method="post">
                        <input type="hidden" id="order" name="order" value="${order}">
                    </form>
                    <ul class="content2">
                        <!--产品排序，翻页开始-->
                        <li class="content2-top">
                            <ul class="button-sort">
                                <li><a href="javascript:orderby('0');" class="content2-img"><img src="${images}/w-36.gif" alt="由低到高"/></a></li>

                                <li><a href="javascript:orderby('1');" class="content2-img"><img src="${images}/w_37.gif" alt="价格由高到低"/></a></li>
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
                                            <img src="${images}${product.picture}" alt="${product.proName}"/>
                                        </a>
                                        </div>
                                        <div><a href="${ctx}/product/${product.sid}.html" target="_blank">
                                            <p>${product.proName}</p>
                                        </a>
                                            <h3><em>￥${product.originalPrice}</em>￥${product.price}</h3>
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
                    </c:if>
                </div>
            </div>
            <!--[if !ie]>产品列表结束<![endif]-->
            <!--<div class="main-wrap">
                <div class="test-box">&nbsp;</div>
            </div>-->
        </div>
        <!--[if !ie]>左侧分类开始<![endif]-->
        <div class="col-sub">
            <jsp:include page="/common/left.jsp"/>
        </div>
        <!--[if !ie]>左侧分类结束<![endif]-->
    </div>
</div>
<!--[if !ie]>主体内容结束<![endif]-->
<!--99click统计代码开始-->
<script type="text/javascript">
    var key = $("#search-key").val();
   
 var  _ozprm="keyword99="+key + "&class99="+ "${proClass}";
</script>
<!--99click统计代码结束-->			

</body>
</html>
