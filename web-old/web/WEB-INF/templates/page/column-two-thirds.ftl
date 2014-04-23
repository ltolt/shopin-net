<#--
    Description:频道热买商品栏目模板(2/3大小)
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
<div class="template">
<ul class="hot-sku">
    <li>
        <ul class="hot-sku-title">
            <li>
                <ul class="background-nofont">
                    <li class="b-left"></li>
                    <li class="b-font" style="color:#FFFFFF">${root.title?if_exists}</li>
                    <li class="b-right"></li>
                </ul>
            </li>
            <li class="hot-sku-more"><a href="${ctx}${root.link?if_exists}">更多>></a></li>
        </ul>
    </li>
    <li class="content2-title-1">
        <ul class="hot-sku-imglist">
        <#if root.productList?exists>
            <#list root.productList as product>
                <li><a href="${ctx}/product/${product.sid}.html">
                    <img src="${images}/${product.proPicture?if_exists.proPictDir?if_exists}${product.proPicture?if_exists.proPictName?if_exists}" width="90" height="90" alt="${product.proSku?if_exists}"/>
                    <p>${product.productName?if_exists}</p></a></li>
                <#if (product_index>=3)> <#break> </#if>
            </#list>
        </#if>
        </ul>
    <ul class="hot-sku-list">
    <#assign i=0 />
    <#if root.productList?exists>
        <#list root.productList as product>
            <#if (product_index>3)>
                <#if (i%3==0)&&(i>2)>
                </ul>
                <ul class="hot-sku-list">
                </#if>
                <li><a href="${ctx}/product/${product.sid}.html">${product.productName}</a></li>
                <#if (product_index>=9)> <#break> </#if>
                <#assign i=i+1 />
            </#if>
        </#list>
    </#if>
    </ul>
    </li>
</ul>
</div>