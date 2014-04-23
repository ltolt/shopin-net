<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<script type="text/javascript" src="${js}/jquery/price-query.js"></script>
<!--[if !ie]>左侧分类开始<![endif]-->
<div id="content-left">

    <ul class="paddingbottom22px">
        <li class="brand"><img src="${images}/i-50.gif" alt="品类"/></li>
        <li>
            <c:forEach var="cate" items="${cates.childCates}" varStatus="status2">
                <ul class="line24-sanjiao">
                    <ol>
                        <a href="${ctx}/${channel.name}/list-${queryVo.proBrand}-${cate.sid}-${queryVo.soffprice}-${queryVo.eoffprice}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}-${queryVo.style}.html">${cate.nodeName}(${cate.productCount})</a>
                    </ol>
                    <c:forEach var="childCates" items="${cate.childCates}" varStatus="status2">
                    <li>
                        <a href="${ctx}/${channel.name}/list-${queryVo.proBrand}-${childCates.sid}-${queryVo.soffprice}-${queryVo.eoffprice}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}-${queryVo.style}.html">${childCates.nodeName}(${childCates.productCount})</a>
                        <c:if test="${fn:length(cate.childCates)==1}">
                            <ul>
                                <c:forEach var="lastCates" items="${childCates.childCates}" varStatus="status3">
                                    <li>
                                        <a href="${ctx}/${channel.name}/list-${queryVo.proBrand}-${lastCates.sid}-${queryVo.soffprice}-${queryVo.eoffprice}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}-${queryVo.style}.html">${lastCates.nodeName}(${lastCates.productCount})</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:if>
                     </li>
                     </c:forEach>
                </ul>
            </c:forEach>
        </li>
    </ul>
        <ul class="paddingbottom22px">
        <li class="brand"><img src="${images}/i-12.gif" alt="品牌"/></li>
        <!--每行两列-->
        <li>
            <ul>
                <c:forEach var="brand" items="${brands}" begin="0" end="7" varStatus="status">
                <c:if test="${status.index%2==0&&status.index>1}">
            </ul>
        </li>
        <li>
            <ul>
                </c:if>
                <c:choose>
                    <c:when test="${status.index%2==0}">
                        <li class="brand1"><a
                                href="${ctx}/${channel.name}/list-${brand.sid}-${queryVo.proCate}-${queryVo.soffprice}-${queryVo.eoffprice}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}-${queryVo.style}.html"><img
                                src="${images}/${brand.pictureUrl}"
                                alt="lee"/>

                            <h3>${brand.brandName}<c:if test="${not empty brand.brandNameSecond}"> ${brand.brandNameSecond} </c:if>(${brand.productCount})</h3></a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="brand2"><a
                                href="${ctx}/${channel.name}/list-${brand.sid}-${queryVo.proCate}-${queryVo.soffprice}-${queryVo.eoffprice}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}-${queryVo.style}.html"><img
                                src="${images}/${brand.pictureUrl}"
                                alt="lee"/>

                            <h3>${brand.brandName}<c:if test="${not empty brand.brandNameSecond}"> ${brand.brandNameSecond} </c:if>(${brand.productCount})</h3></a></li>
                    </c:otherwise>
                </c:choose>
                </c:forEach>
            </ul>
        </li>
    </ul>

    <ul class="paddingbottom22px <c:if test="${fn:length(brands)>24}">brand-scroll</c:if>">
        <c:forEach var="brand" items="${brands}" begin="8" varStatus="status">
            <li class="line24-dian"><a
                    href="${ctx}/${channel.name}/list-${brand.sid}-${queryVo.proCate}-${queryVo.soffprice}-${queryVo.eoffprice}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}-${queryVo.style}.html">${brand.brandName}(${brand.productCount})</a>
            </li>
        </c:forEach>
    </ul>
    <ul class="paddingbottom22px">
        <li>
            <a href="${ctx}/${channel.name}/list--${queryVo.proCate}-${queryVo.soffprice}-${queryVo.eoffprice}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}-${queryVo.style}.html"
               class="brand-more"><img src="${images}/i-53.gif" alt="所有品牌"/></a>
        </li>
    </ul>
    <ul class="paddingbottom22px">
        <li class="brand"><img src="${images}/w-29.gif" alt="性别"/></li>
        <c:forEach var="obj" items="${sex}" varStatus="status">
            <li class="line24-dian"><a href="${ctx}/${channel.name}/list-${queryVo.proBrand}-${queryVo.proCate}-${queryVo.soffprice}-${queryVo.eoffprice}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}-${obj.startValue}.html">${obj.name}</a></li>
        </c:forEach>
    </ul>
    <ul class="paddingbottom22px">
        <li class="brand"><img src="${images}/i-14.gif" alt="折扣"/></li>
        <li class="line24-dian"><a
                href="${ctx}/${channel.name}/list-${queryVo.proBrand}-${queryVo.proCate}---${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}-${queryVo.style}.html">所有折扣</a>
        </li>
        <c:forEach var="discount" items="${discounts}" varStatus="status2">
            <li class="line24-dian"><a
                    href="${ctx}/${channel.name}/list-${queryVo.proBrand}-${queryVo.proCate}-${discount.startValue}-${discount.endValue}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}-${queryVo.style}.html">${discount.name}</a>
            </li>
        </c:forEach>
    </ul>

    <ul class="paddingbottom22px">
        <li class="brand"><img src="${images}/i-52.gif" alt="价格"/></li>
        <li class="line24-dian"><a
                href="${ctx}/${channel.name}/list-${queryVo.proBrand}-${queryVo.proCate}-${queryVo.soffprice}-${queryVo.eoffprice}---${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}-${queryVo.style}.html">所有价格</a>
        </li>
        <c:forEach var="price" items="${prices}" varStatus="status2">
            <li class="line24-dian"><a
                    href="${ctx}/${channel.name}/list-${queryVo.proBrand}-${queryVo.proCate}-${queryVo.soffprice}-${queryVo.eoffprice}-${price.startValue}-${price.endValue}-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}-${queryVo.style}.html">${price.name}</a>
            </li>
        </c:forEach>
        <li class="price-search">
            <form>
                <div class="price-search-title">自定义价格区间</div>
                <p class="price-search" id="price-search"><input name="startPrice" type="text"
                                                                 value="${queryVo.sprice}"/> - <input
                        name="endPrice" type="text" value="${queryVo.eprice}"/>
                    <a href="#current" id="priceQuery"><img src="${images}/i-54.gif" align="absmiddle"/></a>
                </p>
                <input id="queryParam" type="hidden"
                       value="${ctx}/${channel.name}/list-${queryVo.proBrand}-${queryVo.proCate}-${queryVo.soffprice}-${queryVo.eoffprice}-startPrice-endPrice-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}-${queryVo.style}.html"/>

                <div class="errorInfo"></div>
            </form>
        </li>
    </ul>
  	<div><a href="http://www.shopin.net/help/zc.html" target="_blank"><img src="http://images.shopin.net/images/ad/11264.jpg" alt="信赖上品" border="0"/ style="margin-left:15px;"></a></div>
	<!--<img src="${images}/ad/08191.jpg" alt=""/>-->
</div>

<!--[if !ie]>左侧分类结束<![endif]-->
