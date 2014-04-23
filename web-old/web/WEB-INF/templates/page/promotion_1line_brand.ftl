<#--
    Description:活动-1行品牌模板(1行8个品牌)
    Author: Peter Wei
    Date: 2010-2-12
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
    <ul class="submenu5">
        <ol>
        ${root.title?if_exists}
        </ol>
    <#if root.brandList?exists>
        <#list root.brandList as brand>
            <li><a href="#current"><img src="${images}/del/d-10.jpg" alt="logo"/>

                <p>${brand.brandName?if_exists}</p>
            </a></li>
            <#if (brand_index>=8)><#break></#if>
        </#list>
    </#if>
    </ul>
</div>