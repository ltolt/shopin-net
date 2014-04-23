<#--
    Description:活动通栏模板(Tab方式:展示30条信息，5行6行)
    Author: Peter Wei
    Date: 2010-2-10
-->
<#if !(ctx?exists && ctx?has_content)>
    <#assign ctx = "/web" />
</#if>
<#if !(images?exists && images?has_content)>
    <#assign images = "/web/images" />
</#if>
<div class="tab5">
    <div class="tab_nav">
        <ul>
        <#if root.subList?exists><#list root.subList as subList>
            <li>${subList.title?if_exists}</li>
            <li class="shuxian except">|</li>
        </#list></#if>
        </ul>
    </div>
    <div class="tab_content">
    <#if  root.subList?exists><#list root.subList as subList><#if subList?exists>
        <div class="tab_item">
            <ul class="submenu1">
                <ol>
                    <h2>${subList.title?if_exists}</h2>
                    <a href="${ctx}${subList.titleLink?if_exists}">+更多</a>
                </ol>
                <li>
                    <ul class="submenu1-1">
                        <#if  subList.productList?exists><#list subList.productList as product>
                            <li><a href="${ctx}product/${product.sid}.html">
                                <img src="${images}${product.proPicture?if_exists.proPictDir?if_exists}${product.proPicture?if_exists.proPictName?if_exists}" alt="${product.proSku?if_exists}"/>

                                <p>${product.productName?if_exists}</p></a>
                                <span class="color666666"><em>￥${product.proPrice?if_exists.originalPrice?if_exists}</em>￥${product.proPrice?if_exists.promotionPrice?if_exists}</span>
                            </li><#if (product_index>=30)><#break></#if>
                        </#list></#if>
                    </ul>
                </li>
            </ul>
        </div>
    </#if></#list></#if>
    </div>
</div>