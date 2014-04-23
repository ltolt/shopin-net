<#--
    Description:活动通栏3列模板(通栏3列,每列2条商品)
    Author: Peter Wei
    Date: 2010-2-11
-->

<#--
    参数配置，如果ctx,images有值传进来，则用传进来的值；没有，则赋值.
-->
<#if !(ctx?exists && ctx?has_content)>
    <#assign ctx = "/web" />
</#if>
<#if !(images?exists && images?has_content)>
    <#assign images = "/web/images" />
</#if>
<div>
<#if root.subList?exists>
    <#list root.subList as subList>

        <div class="submenu3 <#if (subList_index==2)>submenu3marginright0</#if>">
            <div class="submenu3-title">
                <h2>${subList.title?if_exists}</h2>
                <a href="${ctx}/${subList.titleLink?if_exists}">更多>></a></div>
            <div class="submenu3-title1"><a href="${subList.contentList[0]?if_exists.link?if_exists}" target="_blank">${subList.contentList[0]?if_exists.mainTitle?if_exists}</a></div>
            <p class="submenu3-content"><a href="${subList.contentList[1]?if_exists.link?if_exists}" target="_blank">${subList.contentList[1]?if_exists.mainTitle?if_exists}</a></p>
            <ul class="submenu1-1">
                <#if  subList.productList?exists>
                    <#list subList.productList as product>
                        <li><a href="${ctx}/product/${product.sid}.html"><img
                                src="${images}/${product.proPicture?if_exists.proPictDir?if_exists}${product.proPicture?if_exists.proPictName?if_exists}"
                                alt="${product.proSku?if_exists}"/>

                            <p>${product.productName?if_exists}</p>
                        </a> <span
                                class="color666666"><em>${product.proPrice?if_exists.originalPrice?if_exists}</em>￥${product.proPrice?if_exists.promotionPrice?if_exists}</span>
                        </li>
                        <#if (product_index>=1)><#break></#if>
                    </#list>
                </#if>
            </ul>
        </div>
        <#if (subList_index>=2)><#break></#if>
    </#list>
</#if>
</div>