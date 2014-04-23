<%@ page language="java" pageEncoding="UTF-8" %>
<%@ include file="/common/taglibs.jsp" %>
<script type="text/javascript" src="${js}/jquery/price-query.js"></script>
<!--[if !ie]>左侧分类开始<![endif]-->
<div id="content-left">
    <!--品牌-->
      <c:if test="${not empty(brandVOs)}">
      <ul class="paddingbottom22px">
            <li class="brand"><span class="fac-leftfont">${factory.brandName}旗下品牌</span></li>
            <li>
                <ul>
                    <c:forEach items="${brandVOs}" var="brand">

                    <li class="fac-logo"><a target="_blank" href="/brands/${brand.sid}.html"><img alt="${brand.brandName}" src="${images}${brand.brandpic2}">
                                <h3>${brand.brandName}</h3></a>
                    </li>
                    </c:forEach>
                </ul>
            </li>
     </ul>
    </c:if>


    <ul class="paddingbottom22px">
        <li class="brand"><img src="${images}/i-50.gif" alt="品类"/></li>
        <li><a href="${ctx}${curchannel}/brand/list-${queryVo.proBrand}--${queryVo.soffprice}-${queryVo.eoffprice}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}.html" >所有品类</a></li>
        <li>
            <c:forEach var="cate" items="${cates.childCates}" varStatus="status2">
                <ul class="line24-sanjiao">
                    <ol>
                        <a href="${ctx}${curchannel}/brand/list-${queryVo.proBrand}-${cate.sid}-${queryVo.soffprice}-${queryVo.eoffprice}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}.html" >${cate.nodeName}(${cate.productCount})</a>
                    </ol>
                    <c:forEach var="childCates" items="${cate.childCates}" varStatus="status2">
                    <li>
                        <a href="${ctx}${curchannel}/brand/list-${queryVo.proBrand}-${childCates.sid}.html" >${childCates.nodeName}(${childCates.productCount})</a>
                    		<c:if test="${fn:length(cate.childCates)==1}">
                            <ul>
                                <c:forEach var="lastCates" items="${childCates.childCates}" varStatus="status3">
                                    <li>
                                        <a href="${ctx}${curchannel}/brand/list-${queryVo.proBrand}-${lastCates.sid}-${queryVo.soffprice}-${queryVo.eoffprice}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}-${queryVo.style}.html">${lastCates.nodeName}(${lastCates.productCount})</a>
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
        <li>
            <ul>
                <li class="brand1"><a href="${ctx}/brands/${brand.sid}.html" target="_blank"><img src="${images}${brand.brandpic2}" alt="${brand.brandName}"/>
                            <h3>${brand.brandName}<c:if test="${not empty brand.brandNameSecond}"> ${brand.brandNameSecond} </c:if></h3></a></li>
            </ul>
        </li>
    </ul>
    <ul class="paddingbottom22px">
        <li>
            <a href="${ctx}/list--${queryVo.proCate}-${queryVo.soffprice}-${queryVo.eoffprice}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}.html" target="_blank"
               class="brand-more"><img src="${images}/i-53.gif" alt="所有品牌"/></a>
        </li>
    </ul>
    <ul class="paddingbottom22px">
        <li class="brand"><img src="${images}/w-29.gif" alt="性别"/></li>
        <c:forEach var="obj" items="${sex}" varStatus="status">
            <li class="line24-dian"><a href="${ctx}/brand/list-${queryVo.proBrand}-${queryVo.proCate}---${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}-${obj.startValue}.html" target="_blank">${obj.name}</a></li>
        </c:forEach>
    </ul>
    <ul class="paddingbottom22px">
        <li class="brand"><img src="${images}/i-14.gif" alt="折扣"/></li>
        <li class="line24-dian"><a
                href="${ctx}${curchannel}/brand/list-${queryVo.proBrand}-${queryVo.proCate}---${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}.html" target="_blank">所有折扣</a>
        </li>
        <c:forEach var="discount" items="${discounts}" varStatus="status2">
        <li class="line24-dian"><a
                href="${ctx}${curchannel}/brand/list-${queryVo.proBrand}-${queryVo.proCate}-${discount.startValue}-${discount.endValue}-${queryVo.sprice}-${queryVo.eprice}-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}.html" target="_blank">${discount.name}</a>
        </li>
        </c:forEach>
    </ul>
    <ul class="paddingbottom22px">
        <li class="brand"><img src="${images}/i-52.gif" alt="价格"/></li>
        <li class="line24-dian"><a
                href="${ctx}${curchannel}/brand/list-${queryVo.proBrand}-${queryVo.proCate}-${queryVo.soffprice}-${queryVo.eoffprice}---${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}.html" target="_blank">所有价格</a>
        </li>
        <c:forEach var="price" items="${prices}" varStatus="status2">
        <li class="line24-dian"><a
                href="${ctx}${curchannel}/brand/list-${queryVo.proBrand}-${queryVo.proCate}-${queryVo.soffprice}-${queryVo.eoffprice}-${price.startValue}-${price.endValue}-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}.html" target="_blank">${price.name}</a>
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
                            value="${ctx}${curchannel}/brand/list-${queryVo.proBrand}-${queryVo.proCate}-${queryVo.soffprice}-${queryVo.eoffprice}-startPrice-endPrice-${queryVo.recent}-${queryVo.orderByPrice}-${queryVo.orderByTime}.html" target="_blank"/>
                <div class="errorInfo"></div>
            </form>
        </li>
    </ul>
    <br />
       
        
  	 <!--<img src="${images}/i-55.gif" alt="信赖上品"/>-->
	<!--<img src="${images}/ad/08191.jpg" alt=""/>-->
</div>

<!--[if !ie]>左侧分类结束<![endif]-->
