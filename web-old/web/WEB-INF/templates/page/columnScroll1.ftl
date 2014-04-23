<#--
    Description:栏目模板(左边为单品图片及介绍.右边：滚动显示商品信息，两条信息.)
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
    <ul class="content01061">
        <#if root.subList[0]?exists&&root.subList[0].contentList?exists>
        <li class="content2-top">
            <ul class="content2-title">
                <li>
                    <ul class="background-nofont">
                        <li class="b-left"></li>
                        <li class="b-font" style="color:#FFFFFF">${root.subList[0].title?if_exists}</li>
                        <li class="b-right"></li>
                    </ul>
                </li>
                <li class="content2-title3"><a href="${ctx}/${root.subList[0].link?if_exists}" target="_blank">更多>></a></li>
            </ul>
        </li>
            <li class="content2-bottom content2-bottom2">
                <#if root.subList[0].contentList?exists>
                    <div class="channel-column">
            <span>

                    <a href="${ctx}/${root.subList[0].contentList[0]?if_exists.link?if_exists}" target="_blank">
                        <img src="${images}/${root.subList[0].contentList[0]?if_exists.pict?if_exists}" alt="产品图片"/>
                    </a>

            </span>
                    </div>
                    <div class="channel-column3">
                        <h3>
                            <a href="${ctx}/${root.subList[0].contentList[1]?if_exists.link?if_exists}" target="_blank">${root.subList[0].contentList[1].mainTitle?if_exists}</a>
                        </h3>

                        <p class="xiaobianyu">${root.subList[0].contentList[2]?if_exists.mainTitle?if_exists} </p>

                        <p class="xiaobianyu1">
                            <a href="${ctx}/${root.subList[0].contentList[2]?if_exists.link?if_exists}" target="_blank">
                                ${root.subList[0].contentList[2]?if_exists.subTitle?if_exists}
                            </a>
                        </p>

                        <p class="xiaobianyu2">
                            <a href="${ctx}/${root.subList[0].contentList[3]?if_exists.link?if_exists}" target="_blank">${root.subList[0].contentList[3]?if_exists.mainTitle?if_exists}</a>
                        </p>
                    </div>
                </#if>
            </li>
        </#if>
    </ul>

    <ul class="content01061 content01063">
    <#if root.subList[1]?exists&&root.subList[1].productList?exists>
        <li class="content2-top">
            <ul class="content2-title">
                <li>
                    <ul class="background-nofont">
                        <li class="b-left"></li>
                        <li class="b-font" style="color:#FFFFFF">${root.subList[1].title?if_exists}</li>
                        <li class="b-right"></li>
                    </ul>
                </li>
                <li class="content2-title3"><a href="${root.subList[1].link?if_exists}" target="_blank">更多>></a></li>
            </ul>
        </li>
        <li class="content2-bottom content2-bottom80">

            <a href="#current" class="prev" style="float:left"><span class="jiao3"><img src="${images}/i-66.gif" alt="点击图片可以左右移动"/></span></a>

            <div class="roll_item" style="float:left">
                <ul class="img-list">

                    <#list root.subList[1].productList as product>
                        <li>
                            <div class="sku-img"><a href="${ctx}/product/${product.sid}.html"><img
                                    src="${images}/${product.proPicture?if_exists.proPictDir?if_exists}${product.proPicture?if_exists.proPictName?if_exists}"
                                    alt="${product.proSku?if_exists}"/>
                            </a>
                            </div>
                            <div>
                                <a><p>${product.productName?if_exists}</p></a>

                                <h3>
                                    <em>${product.proPrice?if_exists.originalPrice?if_exists}</em>￥${product.proPrice?if_exists.promotionPrice?if_exists}
                                </h3>
                            </div>
                        </li>

                    </#list>

                </ul>

            </div>
            <a href="#current" class="next"><span class="jiao3"><img src="${images}/i-65.gif" alt="点击图片可以左右移动"/></span></a>

            <div class="clear"></div>

        </li>
    </#if>
    </ul>
</div>
