<#--
    Description:活动1行2列模板(1行2列,每列3条商品)
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
<#if (root.subList?exists)&&(root.subList?size >0)>
<div class="submenu4">
    <div class="submenu3-title">
        <h2>${root.subList[0].title?if_exists}</h2>
        <a href="${ctx}/${root.subList[1].titleLink?if_exists}">更多>></a></div>
    <#if (root.subList[0].contentList?exists)&&(root.subList[0].contentList?size>0)>
        <div class="submenu3-title1">
            <a href="${ctx}/${root.subList[0].contentList[0]?if_exists.link?if_exists}" target="_blank">${root.subList[0].contentList[0]?if_exists.mainTitle?if_exists}</a>
        </div>
        <p class="submenu3-content">
            <a href="${ctx}/${root.subList[0].contentList[0]?if_exists.link?if_exists}" target="_blank">${root.subList[0].contentList[0]?if_exists.subTitle?if_exists}</a>
        </p>
    </#if>
    <ul class="submenu1-1">
        <#if root.subList[0].productList?exists>
            <#list root.subList[0].productList as product>
                <li><a href="${ctx}/product/${product.sid}.html"><img
                        src="${images}/${product.proPicture?if_exists.proPictDir?if_exists}${product.proPicture?if_exists.proPictName?if_exists}"
                        alt="${product.proSku?if_exists}"/>

                    <p>${product.productName?if_exists}</p>
                </a> <span
                        class="color666666"><em>${product.proPrice?if_exists.originalPrice?if_exists}</em>￥${product.proPrice?if_exists.promotionPrice?if_exists}</span>
                </li>
                <#if (product_index>=2)><#break></#if></#list></#if>
    </ul>
</div>
</#if>
<#if (root.subList?exists)&&(root.subList?size >1)>
<div class="submenu4 submenu4-1">
    <div class="submenu3-title">
        <h2>${root.subList[1].title?if_exists}</h2>
        <a href="${ctx}/${root.subList[1].titleLink?if_exists}">更多>></a></div>
    <#if (root.subList[1].contentList?exists)&&(root.subList[1].contentList?size>0)>
        <div class="submenu3-title1">
            <a href="${ctx}/${root.subList[1].contentList[0]?if_exists.link?if_exists}" target="_blank">${root.subList[1].contentList[0]?if_exists.mainTitle?if_exists}</a>
        </div>
        <p class="submenu3-content">
            <a href="${ctx}/${root.subList[1].contentList[0]?if_exists.link?if_exists}" target="_blank">${root.subList[1].contentList[0]?if_exists.subTitle?if_exists}</a>
        </p>
    </#if>
    <ul class="submenu1-1">
        <#if root.subList[1].productList?exists>
            <#list root.subList[1].productList as product>
                <li><a href="${ctx}/product/${product.sid}.html"><img
                        src="${images}/${product.proPicture?if_exists.proPictDir?if_exists}${product.proPicture?if_exists.proPictName?if_exists}"
                        alt="${product.proSku?if_exists}"/>

                    <p>${product.productName?if_exists}</p>
                </a> <span
                        class="color666666"><em>${product.proPrice?if_exists.originalPrice?if_exists}</em>￥${product.proPrice?if_exists.promotionPrice?if_exists}</span>
                </li>
                <#if (product_index>=2)><#break></#if></#list></#if>

    </ul>
</div>
</#if>                                                                                                                                                            