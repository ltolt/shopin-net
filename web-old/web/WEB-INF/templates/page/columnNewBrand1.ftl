<#--
    Description:新品牌栏目模板(二行二列，只放品牌信息.)
    Author: Peter Wei
    Date: 2010-1-27
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
<div id="content-left4">
    <ul class="content2">
        <li class="content2-top">
            <ul class="content2-title">
                <li><img src="${images}/i-78.gif" alt="新品牌"/></li>
            </ul>
        </li>
    <li class="content8">
    <#if root.subList[0]?exists&&root.subList[0].brandList?exists>
        <#list root.subList[0].brandList as brand>
            <#if (brand_index%2==0)&&(brand_index>1)>
            </li>
            <li class="content8">
            </#if>
            <div class="width340"><span class="logobrand"><a href="${ctx}/brands/${brand.sid?if_exists}.html"><img
                    src="${images}/del/d-18.gif" alt="logo"/></a></span>
                <ul class="brand-imglist">
                    <ol>
                        <a href="${ctx}/brands/${brand.sid?if_exists}.html"><span
                                class="font14px333333">${brand.brandName?if_exists}</span> (<span
                                class="ff6600">${brand.productCount?if_exists}</span>款)</a>
                    </ol>
                    <li><a href="${ctx}/brands/${brand.sid?if_exists}.html">品牌注册号：${brand.brandno?if_exists}</a></li>                    
                    <li><a href="${ctx}/brands/${brand.sid?if_exists}.html">产地：${brand.brandcorp?if_exists}</a></li>
                    <li class="height60"><a
                            href="${ctx}/brands/${brand.sid?if_exists}.html">简介：${brand.brandDesc?if_exists}</a>
                    </li>

                </ul>
            </div>
            <#if (brand_index>=3)> <#break> </#if>
        </#list>
    </#if>
    </li>
    </ul>
</div>
