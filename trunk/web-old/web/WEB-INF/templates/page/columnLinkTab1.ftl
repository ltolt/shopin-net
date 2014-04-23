<#--
    Description:栏目模板(Link Tab方式，左边为单品图片及介绍.右边：上面横向展示商品，有图片，一行4列;下面只展示商品内容，无图片)
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
            <#if root.subList?exists>
                <li class="content2-title3 tab_nav">
                    <#list root.subList as subList>
                        <a href="#current">${subList.title?if_exists}</a> |
                    </#list>
                    <a href="#current" class="except">更多>></a>
                </li>
            </#if>
            </ul>
        </li>

        <li class="content2-bottom">
            <div class="channel-column"><span><a href="#" target="_blank"><img src="${images}/del/d-14.jpg" alt="产品图片"/></a></span>

                <p class="font14px"><a href="#"
                                       target="_blank">MM超爱${root.contentList[0]?if_exists.mainTitle?if_exists}</a></p>

                <p><a href="#" target="_blank">${root.contentList[0]?if_exists.subTitle?if_exists}</a></p>

                <p><a href="#" target="_blank">3折20元起 限100件 7天限时</a></p>
            </div>
        <#if root.subList?exists>
            <#list root.subList as subList>
                <div class="channel-img-list tab_item">
                    <ul class="img-list">
                        <#if subList.productList?exists>
                            <#list subList.productList as product>
                                <li>
                                    <div class="sku-img"><a href="${ctx}/product/${product.sid}.html"><img
                                            src="${images}/${product.proPicture?if_exists.proPictDir?if_exists}${product.proPicture?if_exists.proPictName?if_exists}"
                                            alt="${product.proSku?if_exists}"/>

                                        <div class="zhekou">
                                        ${product.proPrice?if_exists.offValue?default("0")}折
                                        </div>
                                    </a>
                                    </div>
                                    <div>
                                        <a><p>${product.productName?if_exists}</p></a>

                                        <h3>
                                            <em>${product.proPrice?if_exists.originalPrice?if_exists}</em>￥${product.proPrice?if_exists.promotionPrice?if_exists}
                                        </h3>
                                    </div>
                                </li>
                                <#if (product_index>=3)> <#break> </#if>
                            </#list>
                        </#if>
                    </ul>
                <ul class="hot-sku-list1">
                    <#assign i=0 />
                    <#if subList.productList?exists>
                        <#list subList.productList as product>
                            <#if (product_index>3)>
                                <#if (i%3==0)&&(i>2)>
                                </ul>
                                <ul class="hot-sku-list1">
                                </#if>
                                <li><a href="${ctx}/product/${product.sid}.html">${product.productName}</a></li>
                                <#if (product_index>=9)> <#break> </#if>
                                <#assign i=i+1 />
                            </#if>
                        </#list>
                    </#if>
                </ul>
                </div>
            </#list>
        </#if>
        </li>

    </ul>
</div>
