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
    <link rel="stylesheet" href="${css}/factory.css"/>
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


                <!--工厂店开始-->
                	<li>
					<p class="factory-banner"><span class="fac-biaoti">品牌工厂店</span></p>
                    <c:forEach items="${factorys}" begin="0" step="1" end="${fn:length(factorys)}" var="store" varStatus="statu">
                        <c:if test="${statu.index%2 ==0}">
                            <ul class="factory-list">
                            <li class="factory-list1">
                            </c:if>
                            <c:if test="${statu.index%2 ==1}">
                                <li class="factory-list2">
                            </c:if>
							<%--<p class="factory-font">NO.${startNo+statu.index+1}</p>--%>
							<p class="factory-font">${store.brandName}</p>
							<p><a href="/factory/${store.sid}.html" target="_blank"><img src="${images}${store.logoPic}" alt="${store.brandName}" title="${store.brandName}"  border="0" width="367" height="130"></a></p>
						</li>
                        <c:if test="${statu.index%2 ==1 || statu.last}"></ul></c:if>
                    </c:forEach>
                        <div class="yahoo2">${page}</div>
				</li>
                <!--工厂店结束-->
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