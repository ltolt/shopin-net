<#--
    Description:栏目模板(展示内容:一行两格，每格有五条信息)
    Author: Peter Wei
    Date: 2010-1-24
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
                <li class="content2-title3"><a href="#">进入资讯社区>></a></li>
            </ul>
        </li>
        <li class="news">
        <#if (root.subList?exists)&&(root.subList?size>0)>
            <div class="float-left2">
                <p class="hot"><strong>${root.subList[0].title?if_exists}</strong></p>
                <#if root.subList[0].contentList?exists><a href="${root.subList[0].contentList[0].link?if_exists}">
                    <img src="${images}/${root.subList[0].contentList[0].pict?if_exists}"
                         alt="${root.subList[0].contentList[0].mainTitle?if_exists}"/></a>
                    <ul class="news-list">

                        <#list root.subList[0].contentList as list>
                            <li><a href="${list.link?if_exists}">[${list.mainTitle?if_exists}]${list.subTitle?if_exists}</a></li>
                            <#if (list_index>=4)> <#break> </#if>
                        </#list>

                    </ul>
                </#if>
            </div>
        </#if>
        <#if (root.subList?exists)&&(root.subList?size>1)>
            <div class="float-left2">
                <p class="hot"><strong>${root.subList[1].title?if_exists}</strong></p>
                <#if root.subList[1].contentList?exists>
                    <img src="${images}/${root.subList[1].contentList[0].pict?if_exists}"
                         alt="${root.subList[1].contentList[0].mainTitle?if_exists}"/>
                    <ul class="news-list">

                        <#list root.subList[1].contentList as list>
                            <li><a href="#">[${list.mainTitle?if_exists}]${list.subTitle?if_exists}</a></li>
                            <#if (list_index>=4)> <#break> </#if>
                        </#list>

                    </ul>
                </#if>
            </div>
        </#if>
        </li>
    </ul>
</div>
