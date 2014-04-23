<%--
  Description:Brand Store Page(品牌专业店)
  User: Peter Wei
  Date: 2010-1-19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head><title>品牌折扣专场-名牌服装100%正品,1-6折天天低价,1小时抢购!实体店供货,10天退换,全国送货上门!上品折扣网-www.shopin.net</title>
    <link rel="stylesheet" href="${css}/freetab.css"/>
    <link rel="stylesheet" href="${css}/brand-stores.css"/>
    <%--<link rel="stylesheet" href="${css}/factory.css"/>--%>
    <script type="text/javascript" src="${js}/jquery/jquery.freetab-0.1.js"></script>
    <script type="text/javascript">
        //var jq = jQuery.noConflict();
        jQuery(document).ready(function($) {
            $("#tab1").freetab({
                nav: "tab_nav",
                content: "tab_content",
                //tab导航和tab content是通过class方式查找，如通过id则为'id'。
                selectType: 'class',
                //鼠标事件，0-onclick;1-onmouseover
                event: 0
            });
        });
    </script>
</head>

<body>
<!--[if !ie]>主体内容开始<![endif]-->
<div id="content">
    <div class="layout grid-s5m0">
        <div class="col-main">
            ${columns[0].template}
            <!--[if !ie]>品牌列表开始<![endif]-->
           <div class="main-wrap">
            <ul class="content2">

                <!--旗舰店开始-->
                	<c:if test="${flagShipStores!=null && fn:length(flagShipStores)>0}">
                    <li>
					<p class="factory-banner"><span class="fac-biaoti">品牌专柜  网络旗舰店</span><span class="fac-biaoti1"><a href="/shipStore/page/1.html" target="_blank">更多>></a></span></p>
                    <c:forEach items="${flagShipStores}" begin="0" step="1" end="4" var="store" varStatus="statu">
                        <c:if test="${statu.index%2 ==0}">
                            <ul class="factory-list">
                            <li class="factory-list1">
                            </c:if>
                            <c:if test="${statu.index%2 ==1}">
                                <li class="factory-list2">
                            </c:if>
							<%--<p class="factory-font">NO.${statu.index+1}</p>--%>
                        <p class="factory-font">${store.name} 网络旗舰店</p>
							<p><a href="/shipStore/${store.sid}.html" target="_blank"><img src="${images}${store.logoPic}" border="0" alt="${store.name}"  title="${store.name}" width="367" height="130"></a></p>
						</li>
                        <c:if test="${statu.index%2 ==1 || statu.last }"></ul></c:if>
                    </c:forEach>
				</li>
                </c:if>
                <!--旗舰店结束-->
                   <hr   style= "border:2   dotted   " color="#cccccc"   size= "1"   noshade>
                <!--工厂店开始-->
                	<c:if test="${factorys!=null && fn:length(factorys)>0}">
                    <li>
					<p class="factory-banner"><span class="fac-biaoti">品牌工厂店</span><span class="fac-biaoti1"><a href="/factory/page/1.html" target="_blank">更多>></a></span></p>
                    <c:forEach items="${factorys}" begin="0" step="1" end="4" var="store" varStatus="statu">
                        <c:if test="${statu.index%2 ==0}">
                            <ul class="factory-list">
                            <li class="factory-list1">
                            </c:if>
                            <c:if test="${statu.index%2 ==1}">
                                <li class="factory-list2">
                            </c:if>
							<%--<p class="factory-font">NO.${statu.index+1}</p>--%>
                        <p class="factory-font">${store.brandName}</p>
							<p><a href="/factory/${store.sid}.html" target="_blank"><img src="${images}${store.logoPic}" border="0" alt="${store.brandName}"  title="${store.brandName}" width="367" height="130"></a></p>
						</li>
                        <c:if test="${statu.index%2 ==1 || statu.last }"></ul></c:if>
                    </c:forEach>
				</li>
                </c:if>
                <!--工厂店结束-->


                <li class="content2-top">
                    <ul class="content2-title">
                        <li><img src="${images}/i-80.gif" alt="品牌列表"/></li>
                    </ul>
                </li>
                <li class="content8" id="tab1">
                    <ul class="tab_content">
                        <li class="hover1 tab_item">
                            <div class="abc"><span><c:forEach var="brand" items="${allbrands}"><a href="#brand${brand.key}">${brand.key}</a></c:forEach></span></div>
                            <c:forEach var="brand" items="${allbrands}">
                                <div class="abc-a">
                                    <h3><a name="brand${brand.key}">${brand.key}</a></h3>
                                    <ul class="abc-height150px">
                                        <c:forEach var="p" items="${brand.value}" varStatus="status">
                                        <c:if test="${status.index%5==0&&status.index>4}">
                                    </ul>
                                    <ul class="brandfontlist">
                                        </c:if>
                                        <li><a href="${ctx}/brands/${p.sid}.html">
                                            <c:if test="${status.index<5}">
                                            <img src="${images}${p.pictureUrl}" alt="${p.brandName}"/>
                                            </c:if>
                                            <p>${p.brandName}( <span class="ff6600">${p.productCount}</span>款)</p>
                                        </a></li>
                                        </c:forEach>
                                    </ul>

                                </div>
                            </c:forEach>
                        </li>
                    </ul>
                </li>
            </ul>
           </div>
            <!--[if !ie]>品牌列表结束<![endif]-->
        </div>

        <!--[if !ie]>左侧分类开始<![endif]-->
        <div class="col-sub">
            <jsp:include page="/common/left.jsp"/>
        </div>
        <!--[if !ie]>左侧分类结束<![endif]-->
    </div>
</div>
<!--[if !ie]>主体内容结束<![endif]-->
<div class="clear"></div>
</body>
</html>