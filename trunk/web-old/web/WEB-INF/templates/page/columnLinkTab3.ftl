<#--
    Description:栏目模板(横向展示商品，一行五列)
    Author: Peter Wei
    Date: 2010-1-24
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
<div id="content-right">
    <ul class="content2 linkTab">
        <li class="content2-top">
            <ul class="content2-title">
                <li>
                    <ul class="background-nofont">
                        <li class="b-left"></li>
                        <li class="b-font" style="color:#FFFFFF">${root.title?if_exists}</li>
                        <li class="b-right"></li>
                    </ul>
                </li>
            <li class="content2-title3 tab_nav">
            <#if root.subList?exists>
                <#list root.subList as subList>
                    <a href="javascript:void(0);">${subList.title?if_exists}</a> |
                </#list>
                 <a href="${ctx}${root.titleLink?if_exists}" class="except">更多>></a>
            </li>
            </#if>
            </ul>
        </li>

        <li class="content2-bottom content2-bottom1">
        <#if root.subList?exists>
            <#list root.subList as subList>
                <div class="channel-img-list tab_item" style="display: none">
                    <ul class="img-list img-list1">
                        <#if subList.productList?exists>
                            <#list subList.productList as product>
                                <li>
                                    <div class="sku-img"><a href="${ctx}product/${product.sid}.html"><img
                                            src="${images}${product.proPicture?if_exists.proPictDir?if_exists}${product.proPicture?if_exists.proPictName?if_exists}"
                                            alt="${product.proSku?if_exists}"/>

                                        <div class="zhekou">
                                        ${product.proPrice?if_exists.offValue?default("0")}折
                                        </div>
                                    </a>
                                    </div>
                                    <div>
                                        <a><p>${product.productName?if_exists}</p></a>
                                        <h3>
                                            <em>￥${product.proPrice?if_exists.originalPrice?if_exists}</em>￥${product.proPrice?if_exists.promotionPrice?if_exists}
                                        </h3>
                                    </div>
                                </li>
                                <#if (product_index>=4)> <#break> </#if>
                            </#list>
                        </#if>
                    </ul>

                </div>
            </#list>
        </#if>
        </li>

    </ul>
</div>