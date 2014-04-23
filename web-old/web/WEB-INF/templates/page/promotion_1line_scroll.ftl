<#--
    Description:活动-1行滚动商品模板(1行4-5个滚动商品)
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
    <ul class="submenu1">
        <ol>
            <h2>${root.title?if_exists}</h2>
        </ol>
        <li><a href="#current" class="prev submenu1-icon" style="float:left"><img src="${images}/i-100.gif"
                                                                                  alt="点击图片可以左右移动"/></a>

            <div class="roll_item" style="float:left">
                <ul class="submenu1-imglist">
                <#if root.productList?exists>
                    <#list root.productList as product>
                        <li style="width:165px;height:130px"><a href="${ctx}/product/${product.sid}.html"><img
                                src="${images}/${product.proPicture?if_exists.proPictDir?if_exists}${product.proPicture?if_exists.proPictName?if_exists}"
                                alt="${product.proSku?if_exists}"/></a></li>
                    </#list></#if>
                </ul>
            </div>
            <a href="#current" class="next submenu1-icon" style="float:left"><img src="${images}/i-101.gif"
                                                                                  alt="点击图片可以左右移动"/></a>

            <div class="clear"></div>
        </li>
    </ul>
</div>