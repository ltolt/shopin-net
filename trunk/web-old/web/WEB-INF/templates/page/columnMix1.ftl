<#--
    Description:主页栏目模板(混合排版方式，金牌买手推荐)
    Author: Peter Wei
    Date: 2010-1-28
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
<div id="content-right10">
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
                <li class="content2-title3" style="float:right"></li>
            </ul>
        </li>
        <li class="content2-bottom">
            <ul>
                <li class="content2-bottom1">
                <#if (root.subList?exists)&&(root.subList?size>0)>
                    <div class="tab1">
                        <div class="tab_nav">
                            <ul>
                                <li class="kong except"></li>

                                <#list root.subList[0].subList as subList>
                                    <li>${subList.title?if_exists}</li>
                                </#list>
                                <li class="more except"><a href="#current">更多>></a></li>
                            </ul>

                        </div>
                        <div class="tab_content">
                            <#list root.subList[0].subList as subList>
                                <div class="tab_item hover1">
                                    <ul> <#if subList.productList?exists>
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
                                                <div>
                                                    <a href="${ctx}/product/${product.sid}.html">
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
                                                    </#if></span></div>
                                            </li>
                                            <#if (product_index>=3)> <#break> </#if>
                                        </#list>
                                    </#if>
                                    </ul>
                                </div>
                            </#list>
                        </div>
                    </div>
                </#if>
                <#if (root.subList?exists)&&(root.subList?size>1)>
                <div class="content2-bottom3">
                    <h3>${root.subList[1].title?if_exists}</h3>
                    <#if (root.subList[1].contentList?exists)>
                        <#list root.subList[1].contentList as content>

                            <#if (content_index%3==0)&&(content_index>2)>
                            </div>
                            <div class="content2-bottom3">
                                <h3>活动进行时</h3>
                            </#if>
                            <p><a href="${content.link?if_exists}"><span
                                    class="ff6600">[${content.mainTitle?if_exists}]</span>${content.subTitle?if_exists}
                            </a></p>
                            <#if (content_index>=5)> <#break> </#if>
                        </#list>
                    </#if>
                </div>
                </#if>
                </li>
                <li class="content2-bottom4">
                <#if (root.subList?exists)&&(root.subList?size>2)>
                    <div class="content2-bottom4-1">${root.subList[2].title?if_exists}</div>
                    <#if (root.subList[2].contentList?exists)&&(root.subList[2].contentList?size>0)>
                        <div class="content5" style="width:66px;height:77px;"><a
                                href="${root.subList[2].contentList[0].link?if_exists}"> <img
                                src="${images}/${root.subList[2].contentList[0].pict?if_exists}"
                                alt="${root.subList[2].contentList[0].mainTitle?if_exists}"
                                style="width:66px;height:77px;"/>
                            <ul class="content3">
                                <li>${root.subList[2].contentList[0].mainTitle?if_exists}</li>
                            </ul>
                        </a></div>
                        <ul class="content4">

                            <#list root.subList[2].contentList as content>
                                <#if (content_index>0)>
                                    <li><a href="${content.link?if_exists}">${content.mainTitle?if_exists}
                                    </a></li>
                                </#if>
                                <#if (content_index>=3)> <#break> </#if>
                            </#list>
                        </ul>
                    </#if>
                </#if>
                <#if (root.subList?exists)&&(root.subList?size>3)>
                    <div class="content2-bottom4-1">${root.subList[3].title?if_exists}</div>
                    <#if (root.subList[3].contentList?exists)&&(root.subList[3].contentList?size>0)>
                        <div class="content5" style="width:68px;height:77px;"><a
                                href="${root.subList[3].contentList[0].link?if_exists}"> <img
                                src="${images}/${root.subList[3].contentList[0].pict?if_exists}"
                                alt="${root.subList[3].contentList[0].mainTitle?if_exists}"
                                style="width:66px;height:77px;"/>
                            <ul class="content3">
                                <li>${root.subList[3].contentList[0].mainTitle?if_exists}</li>
                            </ul>
                        </a></div>
                        <ul class="content4">

                            <#list root.subList[3].contentList as content>
                                <#if (content_index>0)>
                                    <li><a href="${content.link?if_exists}">${content.mainTitle?if_exists}
                                    </a></li>
                                </#if>
                                <#if (content_index>=3)> <#break> </#if>
                            </#list>
                        </ul>
                    </#if>
                </#if>
                </li>
            </ul>
        </li>
    </ul>
</div>