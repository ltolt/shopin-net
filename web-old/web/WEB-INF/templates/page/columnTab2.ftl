<#--
    Description:栏目模板(图片Tab方式，上面横向展示商品，有图片，一行五列;下面只展示商品内容，无图片)
    Author: Peter Wei
    Date: 2010-1-26
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
<div class="tab2" id="content-right">
    <div class="tab_nav">
        <ul>
        <#if  root.subList?exists>
            <#list root.subList as subList>
                <li>${subList.title?if_exists}</li>
            </#list>
        </#if>
        </ul>
    </div>
    <div class="tab_content">
    <#if  root.subList?exists>
        <#list root.subList as subList>
            <div class="tab_item">
                <ul> <#if  subList.productList?exists>
                    <#list subList.productList as product>
                        <li>
                            <div class="sku-img"><a href="${ctx}/product/${product.sid}.html"><img
                                    src="${images}/${product.proPicture?if_exists.proPictDir?if_exists}/${product.proPicture?if_exists.proPictName?if_exists}"
                                    alt="${product.proSku?if_exists}"/>

                                <div class="zhekou">
                                ${product.proPrice?if_exists.offValue?default("0")}折
                                </div>
                            </a>
                            </div>
                            <div><a href="${ctx}/product/${product.sid}.html">

                                <p>${product.productName?if_exists}</p>
                            </a>

                                <h3>
                                    <em>${product.proPrice?if_exists.originalPrice?if_exists}</em>￥${product.proPrice?if_exists.promotionPrice?if_exists}
                                </h3>
                                <span class="color666666">
                                    <#if (product.productCates?exists)&&(product.productCates?size>=1)>
                                        <a href="${ctx}/list--${product.productCates[0].sid}.html">更多同类商品>></a>
                                        <#else>
                                            <a href="${ctx}/list-${product.brandSid}.html">更多同类商品>></a>
                                    </#if>
                                </span>
                            </div>
                        </li>
                        <#if (product_index>=4)> <#break> </#if>
                    </#list>
                </#if>
                </ul>

            <ul class="tab-list">
                <#assign i=0 />
                <#if  subList.productList?exists>
                    <#list subList.productList as product>
                        <#if (product_index>4)>
                            <#if (i%3==0)&&(i>2)>
                            </ul>
                            <ul class="tab-list">
                            </#if>
                            <li><a href="${ctx}/product/${product.sid}.html"><span
                                    class="ff6600">[立省${product.proPrice?if_exists.saveMoney?if_exists}
                                元]</span>${product.productName?if_exists}
                            </a>
                            </li>
                            <#if (product_index>=10)> <#break> </#if>
                            <#assign i=i+1 />
                        </#if>
                    </#list>
                </#if>
            </ul>
            </div>
        </#list>
    </#if>
    </div>
</div>                                                                                                                                                          