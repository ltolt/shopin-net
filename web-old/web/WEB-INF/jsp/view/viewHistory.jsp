<%--
  Created by IntelliJ IDEA.
  User: yanwt
  Date: 2010-3-5
  Time: 17:28:08
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<ul class="ypaddingbottom22px">
    <c:forEach var="product" begin="0" end="10" varStatus="status">
        <c:if test="${status.index==0}">
            <li class="ybrand3">
                <a href="${ctx}/product/${product.sid}.html"><img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}"/></a>

                <h3><a href="${ctx}/product/${product.sid}.html">${product.productName}</a></h3>
            </li>
        </c:if>
        <c:if test="${status.index!=0}">
            <li class="yline24-dian">
                <a href="${ctx}/product/${product.sid}.html">${product.productName}</a><span class="ybrand-t4">￥${product.proPrice.promotionPrice}</span>
            </li>
        </c:if>
    </c:forEach>
</ul>