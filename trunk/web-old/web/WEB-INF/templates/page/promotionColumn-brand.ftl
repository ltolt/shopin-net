<#--
    Description:活动-新品上架-栏目模板(新品牌-横向展示新品牌，一行4列,二列。直接在跟下加brand list)
    Author: Peter Wei
    Date: 2010-2-7
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
    <!--[if !ie]>新品牌开始<![endif]-->
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
        <li class="content8 contentmargintop10">
            <ul>
                <li class="new-brand-left" style="width:auto;">
                <ul class="logo-list" style="width:auto">
                <#if root.brandList?exists>
                    <#list root.brandList as brand>
                        <#if (brand_index%4==0)&&(brand_index>3)>
                        </ul>
                        <ul class="logo-list" style="width:auto">
                        </#if>
                        <li><a href="#current"><img src="${images}/${brand.brandpic1?if_exists}" alt="logo"/>

                            <p>${brand.brandName?if_exists}</p>

                            <p>1-6折</p></a></li>
                        <#if (brand_index>=7)> <#break> </#if>
                    </#list>
                </#if>
                </ul>
                </li>
            </ul>
        </li>
    </ul>
    <!--[if !ie]>新品牌结束<![endif]-->
</div>
