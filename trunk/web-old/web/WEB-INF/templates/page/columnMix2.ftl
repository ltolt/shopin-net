<#--
    Description:主页栏目模板(混合排版方式，周周新鲜货)
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
                <li class="content2-title1">低价限量 抢完为止</li>
                <li class="content2-title2"></li>
            </ul>
        </li>
        <li class="content8">
            <ul class="content8-1">
                <li class="content8-1-1">
                <#if (root.subList?exists)&&(root.subList?size>0)>
                    <div class="hot"><strong>应季新品</strong><span><a href="#current">更多>></a></span></div>
                    <#if (root.subList[0].contentList?exists)&&(root.subList[0].contentList?size>0)>
                        <h3>
                            <a href="${root.subList[0].contentList[0].link?if_exists}">${root.subList[0].contentList[0].mainTitle?if_exists}</a>
                        </h3>

                        <p class="p-content"><a
                                href="${root.subList[0].contentList[0].link?if_exists}">${root.subList[0].contentList[0].subTitle?if_exists}
                            ……[详细]</a></p>
                        <#else>
                            <h3>&nbsp;</h3>

                            <p class="p-content">&nbsp;</p>
                    </#if>
                    <ul class="img-list">
                        <#if root.subList[0].productList?exists>
                            <#list root.subList[0].productList as product>
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
                                        </h3></div>
                                </li>
                                <#if (product_index>=1)> <#break> </#if>
                            </#list>
                            <li class="img-list-more"><a href="#"><img src="${images}/i-25.gif" alt="更多"/></a></li>
                        </#if>
                    </ul>
                    <div class="img-list1">
                <span><#if (root.subList[0].contentList?exists)&&(root.subList[0].contentList?size>1)>
                    <a
                            href="${root.subList[0].contentList[1].link?if_exists}">
                        <img src="${images}/${root.subList[0].contentList[1].pict?if_exists}"
                             alt="${root.subList[0].contentList[1].mainTitle?if_exists}" style="width:145px;height:83px;"/></a><#else><img
                            src="${images}/del/d-9.jpg" alt="广告活动"/></#if></span>
                        <ul><#if root.subList[0]?exists&&root.subList[0].productList?exists><#list root.subList[0].productList as product>
                            <#if (product_index>=2)>
                                <li><a href="${ctx}/product/${product.sid}.html">${product.productName?if_exists}</a>
                                </li>
                                <#if (product_index>=5)> <#break> </#if>
                            </#if>
                        </#list>
                        </#if>
                        </ul>
                    </div>
                    <div class="img-list1"><span><#if (root.subList[0].contentList?exists)&&(root.subList[0].contentList?size>2)>
                        <a
                                href="${root.subList[0].contentList[2].link?if_exists}">
                            <img src="${images}/${root.subList[0].contentList[2].pict?if_exists}"
                                 alt="${root.subList[0].contentList[2].mainTitle?if_exists}" style="width:145px;height:83px;"/></a>
                        <#else><img
                                src="${images}/del/d-9.jpg" alt="广告活动"/></#if></span>
                        <ul><#if root.subList[0]?exists&&root.subList[0].productList?exists>
                            <#list root.subList[0].productList as product>
                                <#if (product_index>=6)>
                                    <li>
                                        <a href="${ctx}/product/${product.sid}.html">${product.productName?if_exists}</a>
                                    </li>
                                    <#if (product_index>=9)> <#break> </#if>
                                </#if>
                            </#list>
                        </#if>
                        </ul>
                    </div>
                </#if>
                </li>
                <li class="content8-1-2">
                <#if (root.subList?exists)&&(root.subList?size >1)>
                    <div class="hot"><strong>${root.subList[1].title?if_exists}应季新品</strong><span><a
                            href="#">更多>></a></span></div>
                    <ul class="tab-list">
                        <#if root.subList[1].productList?exists>
                            <#list root.subList[1].productList as product>
                                <li><a href="${ctx}/product/${product.sid}.html"><span
                                        class="ff6600">[立省${product.proPrice?if_exists.saveMoney?if_exists}
                                    元]</span>${product.productName?if_exists}</a>
                                </li>
                                <#if (product_index>=2)> <#break> </#if>
                            </#list>
                        </#if>
                    </ul>
                    <ul class="img-list">
                        <#if root.subList[1].productList?exists>
                            <#list root.subList[1].productList as product>
                                <#if (product_index>=3)>
                                    <li>
                                        <div class="sku-img"><a href="${ctx}/product/${product.sid}.html"><img
                                                src="${images}/${product.proPicture?if_exists.proPictDir?if_exists}/${product.proPicture?if_exists.proPictName?if_exists}"
                                                alt="${product.proSku?if_exists}"/>

                                            <div class="zhekou">
                                            ${product.proPrice?if_exists.offValue?if_exists}折
                                            </div>
                                        </a>
                                        </div>
                                        <div><a href="${ctx}/product/${product.sid}.html">

                                            <p>${product.productName?if_exists}</p>
                                        </a>

                                            <h3>
                                                <em>${product.proPrice?if_exists.originalPrice?if_exists}</em>￥${product.proPrice?if_exists.promotionPrice?if_exists}
                                            </h3></div>
                                    </li>
                                    <#if (product_index>=4)> <#break> </#if>
                                </#if>
                            </#list>
                        </#if>
                        <li class="img-list-more"><a href="#"><img src="${images}/i-25.gif" alt="更多"/></a></li>
                    </ul>
                </#if>
                <#if (root.subList?exists)&&(root.subList?size >2)>
                    <div class="hot hot1"><strong>新款式</strong><span><a href="#">更多>></a></span></div>

                    <ul class="img-list">
                        <#if root.subList[2].productList?exists>
                            <#list root.subList[2].productList as product>
                                <li>
                                    <div class="sku-img"><a href="${ctx}/product/${product.sid}.html"><img
                                            src="${images}/${product.proPicture?if_exists.proPictDir?if_exists}/${product.proPicture?if_exists.proPictName?if_exists}"
                                            alt="${product.proSku?if_exists}"/>

                                        <div class="zhekou">
                                        ${product.proPrice?if_exists.offValue?if_exists}折
                                        </div>
                                    </a>
                                    </div>
                                    <div><a href="${ctx}/product/${product.sid}.html">
                                        <p>${product.productName?if_exists}</p>
                                    </a>

                                        <h3>
                                            <em>${product.proPrice?if_exists.originalPrice?if_exists}</em>￥${product.proPrice?if_exists.promotionPrice?if_exists}
                                        </h3></div>
                                </li>
                                <#if (product_index>=1)> <#break> </#if>
                            </#list>
                        </#if>
                        <li class="img-list-more"><a href="#"><img src="${"images"}/i-25.gif" alt="更多"/></a></li>
                    </ul>
                </#if>
                </li>
            </ul>
        </li>
    </ul>
    <div class="newsbrand">
    <#if (root.subList?exists)&&(root.subList?size >3)>
        <div class="hot"><strong>新品牌</strong><span><a href="#current">更多>></a></span>
        </div>
        <ul class="listbrand">
            <#if root.subList[3].brandList?exists>
                <#list root.subList[3].brandList as brands>
                    <li><a href="#"><img src="${"images"}/del/d-10.jpg" alt="logo"/>

                        <p>${brands.brandName?if_exists}</p>
                    </a></li>
                    <#if (brands_index>=6)> <#break> </#if>
                </#list>
            </#if>
        </ul>
    </#if>
    </div>
</div>