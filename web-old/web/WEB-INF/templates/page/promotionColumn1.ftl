<#--
    Description:活动-限时抢购-栏目模板(抢购有礼-展示内容:左边为编辑内容;右边为商品列表,展示6条信息)
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
<div id="content-right1">
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
        <li class="content8">
            <ul class="content8-1">
                <li class="content8-1-1">
                    <ul>
                        <li>活动对象：所有上品用户（包括非注册）</li>
                        <li>活动规则：</li>
                        <li class="content8-list">上品折扣网将每日推出5款超值<span>0.5</span>折特价商品；</li>
                        <li class="content8-imgli">
                            <img src="${images}/i-72.gif" alt="礼"/>

                            <p>商品右上角的折扣率<br/>显示为“礼”</p>
                        </li>
                        <li class="content8-list">这些特价商品可能在本栏目的任何一个页面出现；</li>
                        <li class="content8-list">睁大您的眼睛，赶快去抢购吧！</li>
                    </ul>
                </li>
                <li class="content8-1-2">
                    <div class="hot"><strong>今日大礼</strong></div>
                    <ul class="dali-list">
                    <#if root.productList?exists>
                        <#list root.productList as product>
                            <li><a href="${ctx}/product/${product.sid}.html">${product.productName?if_exists}&nbsp;
                                <em>${product.proPrice?if_exists.originalPrice?if_exists}</em>
                                特惠价：<span>￥${product.proPrice?if_exists.promotionPrice?if_exists}</span>元 <span
                                        class="fontff6600"></span></a></li>
                            <#if (product_index>=5)> <#break> </#if>
                        </#list>
                    </#if>
                    </ul>
                </li>
            </ul>
        </li>
    </ul>
</div>
