<%--
  Description:Lady List(女装)
  User: Peter Wei
  Date: 2010-1-8
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head><title>${channel.displayName}-上品折扣网shopin.net- 商场名牌1-3折限量秒杀,正品保障,网上购物!服装品牌,名品折扣,名牌打折,团购价!上品折扣官方购物网站</title>

    <link type="text/css" href="${css}/channels.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${css}/freetab.css"/>
    <link rel="stylesheet" href="${css}/slideshow.css"/>
    <link rel="stylesheet" href="${css}/template.css"/>
    <script type="text/javascript" src="${js}/jwidget/jwidget_1.0.0-min.js"></script>
    <script type="text/javascript" src="${js}/jquery/jquery.freetab-0.1.js"></script>
    <script type="text/javascript" src="${js}/jquery/jcarousellite_1.0.1.js"></script>
    <script type="text/javascript" src="${js}/jquery/jquery.easing.1.1.js"></script>
    <style type="text/css">

            /*  some style
               ---------------
            */

    </style>
    <script type="text/javascript">
        //var jq = jQuery.noConflict();
        jQuery(document).ready(function($) {
            //jwidget slides
            jWidget.ui.SlideView("slider", {effect: 'scrolly',autoPlayInterval:10000});

            //tab
            //free tab2,tab2样式在freetab.css里调
            $(".tab2").each(function() {
                $(this).freetab({
                    nav: "tab_nav",
                    content: "tab_content",
                    //tab导航和tab content是通过class方式查找，如通过id则为'id'。
                    selectType: 'class',
                    //鼠标事件，0-onclick;1-onmouseover
                    event: 1
                });
            });
            //free tab1,tab1样式在freetab.css里调
            <!--li class为except的则不在导航列表中-->
            $(".tab1").each(function() {
                $(this).freetab({
                    nav: "tab_nav",
                    content: "tab_content",
                    //tab导航和tab content是通过class方式查找，如通过id则为'id'。
                    selectType: 'class',
                    //鼠标事件，0-onclick;1-onmouseover
                    event: 1
                });
            });

            //link tab,tab样式在freetab.css里调
            $(".linkTab").each(function() {
                $(this).freetab({
                    nav: "tab_nav",
                    navType: "a",
                    //鼠标事件，0-onclick;1-onmouseover
                    event: 1
                })
            });

            //滚动展示商品
            $(".roll_item").jCarouselLite({
                //control button
                btnNext: ".next",
                btnPrev: ".prev",
                speed: 1000,
                //easing: "backin",
                easing: "easeinout",
                //more or less
                visible: 2
            });
        var SysSecond = new Array();
        var InterValObj;
        jQuery(document).ready(function($) {
            $(".remainSeconds").each(function() {
                var curIndex = $(".remainSeconds").index(this);
                SysSecond[curIndex] = parseInt($(this).html());

            });
            InterValObj = window.setInterval(SetRemainTime, 1000); //间隔函数，1秒执行
        });

        //时间倒计时
        function SetRemainTime() {
            $.each(SysSecond, function(i, n) {
                //alert(i);
                //alert(n);
                if (n > 0) {
                    n = n - 1;
                    SysSecond[i] = n;
                    var second = Math.floor(n % 60);             // 计算秒
                    var minute = Math.floor((n / 60) % 60);      //计算分
                    var hour = Math.floor((n / 3600) % 24);      //计算小时
                    var day = Math.floor((n / 3600) / 24);        //计算天
                    var start = "<span class='flash-font16'>";
                    var end = "</span>";
                    var text = "↓还剩";
                    if (day > 0) {
                        text = text + start + day + end + "天";
                    }
                    if (hour > 0) {
                        text = text + start + hour + end + "小时";
                    }
                    if (minute > 0) {
                        text = text + start + minute + end + "分";
                    }
                    if (second > 0) {
                        text = text + start + second + end + "秒";
                    }
                    text=text+"结束";
                    $(".remainTime").eq(i).html(text);
                } else {
                    $(".remainTime").html("活动已结束");
                    //window.clearInterval(InterValObj);
                }
            });
        }
        });
    </script>
</head>
<body>
	<div class="ctop09261">
	
		<ul class="logolist">
			<li class="logofont">找品牌</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html" target="_blank">#</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandA" target="_blank">A</a></li> 
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandB" target="_blank">B</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandC" target="_blank">C</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandD" target="_blank">D</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandE" target="_blank">E</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandF" target="_blank">F</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandG" target="_blank">G</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandH" target="_blank">H</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandI" target="_blank">I</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandJ" target="_blank">J</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandK" target="_blank">K</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandL" target="_blank">L</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandM" target="_blank">M</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandN" target="_blank">N</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandO" target="_blank">O</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandP" target="_blank">P</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandQ" target="_blank">Q</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandR" target="_blank">R</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandS" target="_blank">S</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandT" target="_blank">T</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandU" target="_blank">U</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandV" target="_blank">V</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandW" target="_blank">W</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandX" target="_blank">X</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandY" target="_blank">Y</a></li>
			<li class="focs">·</li>
			<li class="logoabc123"><a href="http://www.shopin.net/channel/brandstores.html#brandZ" target="_blank">Z</a></li>			
		</ul>
		
		<ul class="logolist1">
			<li><img src="http://images.shopin.net/images/ad/09261.gif" /></li>
			<li class=""><a href="http://www.shopin.net/factory/2092.html" target="_blank">Walker Shop</a></li>
			<li class=""><a href="http://www.shopin.net/factory/2266.html" target="_blank">THE NORTH FACE</a></li>
			<li class=""><a href="http://www.shopin.net/factory/2095.html" target="_blank">AZONA</a></li>
		</ul>
		
	</div>




<!--[if !ie]>主体内容开始<![endif]-->
<div id="content">
    <div class="layout grid-s5m0">

        <div class="col-main">
            <!--活动开始-->
            <div class="main-wrap">
                <div id="content-right">
                    <!--[if !ie]>限时特卖会开始<![endif]-->
                    <ul class="flash">
                        <li>
                            <!-- 图片轮播 开始 -->
                            <div id="slider" class="slider">
                    <ul>
                        <c:forEach var="p" items="${promotions}" varStatus="status">
                            <li style="height:350px">

                                <div class="remainSeconds"
                                     style="display:none">${p.remainSeconds}</div>
                                <ul>
                                    <li class="flash-title"><span class="flash-font162"><img src="${images}/w_41.gif"></span> <span
                                            class="flash-font12 remainTime">还剩 <span
                                            class="flash-font16">10</span>天<span class="flash-font16">12</span>小时<span
                                            class="flash-font16">23</span>分<span
                                            class="flash-font16">46</span>秒 结束</span></li>
                                    <li><a href="${p.promotionLink}" target="_blank"><img
                                            src="${images}/${p.promotionSpict}"
                                            alt="${p.promotionTitle}"/></a></li>
                                </ul>
                            </li>
                        </c:forEach>
                    </ul>
                    <ul id="slider_nav" class="slider_nav">
                        <c:forEach var="p" items="${promotions}" varStatus="status">
                            <li>${status.index+1}</li>
                        </c:forEach>
                    </ul>
                            </div>
                            <!-- 图片轮播 结束 -->
                        </li>

                    </ul>
                    <!--[if !ie]>限时特卖会结束<![endif]-->
                    <!--[if !ie]>收藏/打折快报/网站公告开始<![endif]-->
                    <ul class="sidebar">
                        <li class="sidebar-title"><span><a href="#" target="_blank">收藏本站>></a></span></li>
                        <li>
                            <ul>
                                <li class="sidebar-titlemore"><strong>打折预报</strong>
                                    <span>
                                    <!--<a href="${ctx}/rss/${noticesType}.rss"><img src="${images}/rss_icon.png"/>订阅</a> |--> 
                                    <a href="http://www.shopin.net/promotions.html" target="_blank">更多>></a></span></li>
                                <c:forEach var="notice" items="${notices}" begin="0" end="4" varStatus="status">
                                    <c:if test="${status.index==0}">
                                        <li class="sidebar-titleh1">
                                            <h1>
                                                <c:choose>
                                                    <c:when test="${!empty notice.link}"> <a href="${notice.link}" target="_blank">${notice.title}</a></c:when>
                                                    <c:otherwise><a href="${ctx}/notice/${notice.sid}.html" target="_blank">${notice.title}</a></c:otherwise>
                                                </c:choose>
                                            </h1></li>
                                    </c:if>
                                    <c:if test="${status.index==1}">
                                        <li class="sidebar-titleh1">
                                            <p>
                                                <c:choose>
                                                    <c:when test="${!empty notice.link}"> <a href="${notice.link}" target="_blank">${notice.title}</a></c:when>
                                                    <c:otherwise><a href="${ctx}/notice/${notice.sid}.html" target="_blank">${notice.title}</a></c:otherwise>
                                                </c:choose>
                                            </p>
                                        </li>
                                    </c:if>
                                    <c:if test="${status.index>1}">
                                        <li class="sidebar-titlecontent">
                                            <c:choose>
                                                <c:when test="${!empty notice.link}"> <a href="${notice.link}" target="_blank">${notice.title}</a></c:when>
                                                <c:otherwise><a href="${ctx}/notice/${notice.sid}.html" target="_blank">${notice.title}</a></c:otherwise>
                                            </c:choose>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                            <ul>
                                <li class="sidebar-titlemore1"><strong>网站公告</strong><span><a href="${ctx}/notices/1.html">更多</a></span></li>
                                <c:forEach var="notice" items="${notices2}" begin="0" end="1" varStatus="status">
                                    <li class="sidebar-titlecontent1">
                                        <c:choose>
                                            <c:when test="${!empty notice.link}"> <a href="${notice.link}" target="_blank">${notice.title}</a></c:when>
                                            <c:otherwise><a href="${ctx}/notice/${notice.sid}.html" target="_blank">${notice.title}</a></c:otherwise>
                                        </c:choose>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                    </ul>
                    <!--[if !ie]>收藏/打折快报/网站公告结束<![endif]-->
                </div>

            </div>
            <!--活动结束-->

            <!--[if !ie]>热卖商品/人气品牌开始<![endif]-->
            <div class="main-wrap">

                <div id="content-right">
                    ${columns[0].template}
                    <ul class="sidebar1">
                        <li class="sidebar-title"><strong>人气品牌</strong><span><a href="${ctx}/channel/brandstores.html">更多>></a></span></li>
                        <li>
                        <li class="top10-list">
                            <ul>
                            	<li class="top10-backgroundF4F0EF">&nbsp;排名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品牌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;排行趋势&nbsp;</li>
                                <c:forEach var="rank" items="${channelbrandRanks}" begin="0" end="7" varStatus="status">
                                    <c:if test="${rank.rankChange==-1}">
                                        <c:set var="changePic" value="${images}/i-41.gif"></c:set>
                                    </c:if>
                                    <c:if test="${rank.rankChange==0}">
                                        <c:set var="changePic" value="${images}/i-41.gif"></c:set>
                                    </c:if>
                                    <c:if test="${rank.rankChange==1}">
                                        <c:set var="changePic" value="${images}/i-42.gif"></c:set>
                                    </c:if>
                                    <c:choose><c:when test="${status.index<3}">
                                        <li class="top10-list">
                                            <a href="${ctx}/brands/${rank.brand.sid}.html">
                                                <span class="top10-icon brandTopRed">${status.index+1}</span>
                                                <span class="top10-name">${rank.brand.brandName}</span>
                                                <span class="topup-img"><img src="${changePic}"/></span>
                                            </a>
                                        </li>
                                    </c:when>
                                        <c:otherwise>
                                            <li class="top10-list">
                                                <a href="${ctx}/brands/${rank.brand.sid}.html">
                                                    <span class="top10-icon brandTopGray">${status.index+1}</span>
                                                    <span class="top10-name">${rank.brand.brandName}</span>
                                                    <span class="topup-img"><img src="${changePic}"/></span>
                                                </a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <!--[if !ie]>热卖商品/人气品牌结束<![endif]-->
            <div class="main-wrap">
                ${columns[1].template}
            </div>
            <!--[if !ie]>女鞋模块开始<![endif]-->
            <div class="main-wrap">
                ${columns[2].template}
            </div>
            <!--[if !ie]>女鞋模块结束<![endif]-->

            <!--活动广告开始-->
            <c:if test="${!empty ads0}">
                <div class="main-wrap">
                    <div class="channel-ad">
                        <a href="${ads0.link}" target="_blank"><img src="${images}/${ads0.pic}" alt="${ads0.memo}"/></a>
                    </div>
                </div>
            </c:if>

            <!--活动广告结束-->

            <!--[if !ie]>内衣模块开始<![endif]-->
            <div class="main-wrap">
                ${columns[3].template}
            </div>
            <!--[if !ie]>内衣模块结束<![endif]-->

            <!--[if !ie]>配饰模块开始<![endif]-->
            <div class="main-wrap">
                ${columns[4].template}
            </div>
            <!--[if !ie]>配饰模块结束<![endif]-->


            <!--[if !ie]>特色区/抄底区开始<![endif]-->
            <div class="main-wrap">
                ${columns[5].template}
            </div>
            <!--[if !ie]>特色区/抄底区结束<![endif]-->

            <!--[if !ie]>资讯社区开始<![endif]-->
            <div class="main-wrap">
                ${columns[6].template}
            </div>
            <!--[if !ie]>资讯社区结束<![endif]-->
            <c:if test="${fn:length(columns)>7}">
                <c:forEach var="column" items="${columns}" begin="7">
                    <c:if test="${not empty column.template}">
                    <div class="main-wrap">
                         ${column.template}
                    </div>
                    </c:if>
                </c:forEach>
            </c:if>
        </div>
        <!--[if !ie]>左侧分类开始<![endif]-->
        <div class="col-sub">
            <jsp:include page="/common/channelleft.jsp"/>
        </div>
        <!--[if !ie]>左侧分类结束<![endif]-->
    </div>
</div>
<!--[if !ie]>主体内容结束<![endif]-->

<!--[if !ie]>尾部广告开始<![endif]-->
<div>
</div>
<!--[if !ie]>尾部广告结束<![endif]-->
<!-- Google Code for &#39318;&#39029; Remarketing List -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1028537178;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "666666";
var google_conversion_label = "RFDxCKz_1QEQ2va46gM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1028537178/?label=RFDxCKz_1QEQ2va46gM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>




<!-- Google Code for &#38795;&#39057;&#36947; Remarketing List -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1028537178;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "666666";
var google_conversion_label = "Osa8CKSA1gEQ2va46gM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1028537178/?label=Osa8CKSA1gEQ2va46gM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
<script type="text/javascript">
<!-- 
var bd_cpro_rtid="n1f3n6";
//-->
</script>
<script type="text/javascript" src="http://cpro.baidu.com/cpro/ui/rt.js"></script>
<noscript>
<div style="display:none;">
<img height="0" width="0" style="border-style:none;" src="http://eclick.baidu.com/rt.jpg?t=noscript&rtid=n1f3n6" />
</div>
</noscript>
</body>
</html>
