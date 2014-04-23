<#--
    Description:活动-新品上架-栏目模板(名品新货-展示内容:展示3条信息)
    Author: Peter Wei
    Date: 2010-2-5
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

    <ul class="content2">
        <li class="content2-top">
            <ul class="content2-title">
                <li>
                    <ul class="background-nofont">
                        <li class="b-left"></li>
                        <li class="b-font" style="color:#FFFFFF">${root.title?if_exists}</li>
                        <li class="b-right"></li>
                    </ul>
                </li>
            </ul>
        </li>
        <li class="content8 content8-value">
            <ul class="value-imglist">
            <#if root.productList?exists>
                <#list root.productList as product>
                    <li>
                        <a href="${ctx}/product/${product.sid}.html">
                            <div><img
                                    src="${images}/${product.proPicture?if_exists.proPictDir?if_exists}/${product.proPicture?if_exists.proPictName?if_exists}"
                                    alt="${product.proSku?if_exists}"/></div>
                            <p class="height36">${product.productName?if_exists}</p>
                        </a>
                    </li>
                    <#if (product_index>=5)> <#break> </#if>
                </#list></#if>
            </ul>
        </li>
    </ul>
</div>
