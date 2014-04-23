<%--
  Created by IntelliJ IDEA.
  User: yanwt
  Date: 2009-7-30
  Time: 15:47:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
	<meta name="google-site-verification" content="qswRxDn0CpoN2zbM79yH_OnDiDIvQyN6iMoQ1vmRaU4" />
    <title>上品折扣网shopin.net- 商场名牌1-3折限量秒杀,正品保障,网上购物!服装品牌,名品折扣,名牌打折,团购价!上品折扣官方购物网站</title>
    <link rel="stylesheet" href="${css}/channels.css"/>
    <link rel="stylesheet" href="${css}/freetab.css"/>
    <link rel="stylesheet" href="${css}/slideshow.css"/>
    <link rel="stylesheet" href="${css}/template.css"/>
</head>
<body>
<!--[if !ie]>头部广告开始<![endif]-->
<c:if test="${!empty ads0}">
    <div class="tonglan"><a href="${ads0.link}" target="_blank"><img src="${images}/${ads0.pic}" alt="${ads0.memo}" /></a></div>
</c:if>
<!--[if !ie]>头部广告结束<![endif]-->
<!--[if !ie]>主体内容开始<![endif]-->
<div id="content">
<div class="layout grid-s5m0">
<!--[if !ie]>各栏目内容开始<![endif]-->
<div class="col-main">
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
                                    <li><a href="${p.promotionLink}" target="_blank"><img src="${images}/${p.promotionSpict}" alt="${p.promotionTitle}"/></a></li>
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
            <li class="sidebar-title"><span><a href="javascript:addCookie();">收藏本站>></a></span></li>
            <li>
                <ul>
                    <li class="sidebar-titlemore"><strong>打折预报</strong>
                    <span>
                    	<!--<a href="${ctx}/rss/0.rss"><img src="${images}/rss_icon.png"/>订阅</a> | -->
                        <a href="http://www.shopin.net/promotions.html" target="_blank">更多</a></span></li>
                    <c:forEach var="notice" items="${notices}" begin="0" end="4" varStatus="status">
                        <c:if test="${status.index==0}">
                            <li class="sidebar-titleh1">
                                <h1>
                                    <c:choose>
                                        <c:when test="${!empty notice.link}"> <a href="${notice.link}" target="_blank">${notice.title}</a></c:when>
                                        <c:otherwise><a href="${ctx}/notice/${notice.sid}.html" target="_blank">${notice.title}</a></c:otherwise>
                                    </c:choose>
                                </h1>
                            </li>
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
                    <li class="sidebar-titlemore1"><strong>网站公告</strong><span><a href="${ctx}/notices/1.html" target="_blank">更多</a></span></li>
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
<c:forEach var="column" items="${columns}" varStatus="status">
	<div class="main-wrap">
	    ${column.template}
	</div>
</c:forEach>
<!--[if !ie]>人气榜单开始<![endif]-->
<div class="main-wrap">
    <div id="content-right">
        <ul class="content2">
            <li class="content2-top">

                <ul class="content2-title">
                    <li>
                        <ul class="background-nofont">
                            <li class="b-left"></li>
                            <li class="b-font" style="color:#ffffff">人气榜单</li>
                            <li class="b-right"></li>
                        </ul>
                    </li>
                    <li class="content2-title3"></li>
                </ul>
            </li>
            <li class="top10">
                <ul>
                    <li class="month-top10">
                    	<div class="bcimg-top10">一周热销品牌<span><a href="${ctx}/channel/brandstores.html">更多>></a></span></div>
                        <ul>
                            <li class="top10-backgroundF4F0EF">&nbsp;排名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;品牌&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;排行趋势&nbsp;</li>
                            <c:forEach var="rank" items="${brandRanks2}" begin="0" end="9" varStatus="status">
                                <c:if test="${rank.rankChange=='-1'}">
                                    <c:set var="changePic" value="${images}/i-41.gif"></c:set>
                                </c:if>
                                <c:if test="${rank.rankChange=='0'}">
                                    <c:set var="changePic" value="${images}/i-41.gif"></c:set>
                                </c:if>
                                <c:if test="${rank.rankChange=='1'}">
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
                    <li class="store-top3">
                    	 <div>品牌工厂店<span><a href="channel/brandstores.html">更多>></a></span></div>
                        <ul>
                           <li class="top10-backgroundF4F0EF">&nbsp;一网打尽</li>
                           <li class="top10-list">

                                <a href="http://www.shopin.net/factory/2095.html" target="_blank" class="topup-img1"><img src="${images}/ad/06141.jpg" alt="a02-1" /></a>


                      		<div>
                            		<a href="http://www.shopin.net/factory/2095.html" target="_blank">
                                        <p class="store-title">☆工厂店</p>
                                        <p><span>2</span>个品牌</p>
                                        <p><span>65</span>款商品3折起</p>
                                    </a>
                            </div>

                    </li>
                  <li class="top10-list">
                            <a href="http://www.shopin.net/brands/1383.html" target="_blank" class="topup-img1"><img src="${images}/ad/641383.jpg" alt="百家好2" /></a>
                                <div>
                                	<a href="http://www.shopin.net/brands/1383.html" target="_blank" class="topup-img1">
                                        <p class="store-title">☆工厂店</p>
                                        <p>夏款全面上市</p>
                                        <p>百款商品<span>2-5</span>折</p>
                                    </a>
                                </div>
                      </a>
                    </li>
                           <li class="top10-list">
                            <a href="http://www.shopin.net/factory/2092.html" target="_blank" class="topup-img1"><img src="${images}/ad/06143.jpg" alt="工厂店3" /></a>
                                <div>
                                <a href="http://www.shopin.net/factory/2092.html" target="_blank" class="topup-img1">
                                	<p class="store-title">☆工厂店</p>
                                    <p><span>6</span>个品牌</p>
                                    <p><span>669</span>款商品1.5折起</p>
                                  </a>
                                </div>
                            </a>
                    </li> 
                        </ul>
                    </li>
                    <li class="zb0609">
                    	<div>抢购直播</div>
                        <ul>
                            <c:forEach var="sale" items="${sales}" begin="0" end="9" varStatus="status">
                                <li><a href="${ctx}/product/${sale.productSid}.html" target="_blank">·<span>售出</span>:${sale.productName}</a></li>
                            </c:forEach>
                        </ul>
                    </li>

                </ul>
            </li>
        </ul>
    </div>
</div>
<!--[if !ie]>人气榜单结束<![endif]-->
</div>
<!--[if !ie]>各栏目内容结束<![endif]-->

<!--[if !ie]>左侧分类开始<![endif]-->
<div class="col-sub">
    <jsp:include page="/common/left.jsp"/>
</div>
<!--[if !ie]>左侧分类结束<![endif]-->
</div>
</div>
<!--[if !ie]>主体内容结束<![endif]-->
<!--[if !ie]>尾部广告开始<![endif]-->
<div>
    <ul id="shangpin">
        <li class="shangpin-logo"><img src="${images}/i-444.gif" alt="上品商业"/></li>
        <li><a href="http://www.shopin.cn/wfj/index.htm" target="_blank"><img src="${images}/i-2.jpg" alt="王府井店" width="84" height="53"/>

        <p>王府井店</p>
        </a></li>
        <li><a href="http://www.shopin.cn/yyc/index.htm" target="_blank"><img src="${images}/i-1.jpg" alt="亚运村店" width="84" height="53"/>

        <p>亚奥旗舰店</p>
        </a></li>
        <li><a href="http://www.shopin.cn/sht/index.htm" target="_blank"><img src="${images}/i-5.jpg" alt="首体店" width="84" height="53"/>

        <p>首体店</p>
        </a></li>
        <li><a href="http://www.shopin.cn/wks/index.htm" target="_blank"><img src="${images}/i-4.jpg" alt="五棵松店" width="84" height="53"/>

        <p>五棵松店</p>
        </a></li>
<li><a href="http://www.shopin.cn/zhgc/index.htm" target="_blank"><img src="${images}/i-3.jpg" alt="中关村店" width="84" height="53"/>

      <p>中关村店</p>
        </a></li>
<li><a href="http://www.shopin.cn/chym/index.htm" target="_blank"><img src="${images}/i-6.jpg" alt="朝阳门店" width="84" height="53"/>

      <p>朝阳门店</p>
        </a></li>
<li><a href="http://www.shopin.cn/slh/index.htm" target="_blank"><img src="${images}/i-9.jpg" alt="三里河店" width="84" height="53"/>

      <p>三里河店</p>
        </a></li>
<li><a target="_blank" href="http://www.shopin.cn/lgy/index.htm"><img alt="三里河店" src="http://images.shopin.net/images/ad/12231.jpg" width="84" height="53">

      <p>来广营店</p>
        </a></li>
  </ul>
</div>

<%
  long current = System.currentTimeMillis();
  java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
  long begenDay = format.parse("2011-11-1 23:59:59").getTime();
  long firstDay = format.parse("2011-11-2 23:59:59").getTime();
  long secondDay = format.parse("2011-11-3 23:59:59").getTime();
  long thirdDay = format.parse("2011-11-4 23:59:59").getTime();
  long fourthDay = format.parse("2011-11-5 23:59:59").getTime();
  long fifthDay = format.parse("2011-11-6 23:59:59").getTime();
  long endDay = format.parse("2011-11-7 23:59:59").getTime();
if(begenDay <= current && current < firstDay){
%>
<script type="text/javascript">
$(function(){
$("body").append("<div class='floatAD' style='position:absolute; top:0; z-index:1000; background:#fff; width:100%; text-align:center;'><a href='/help/11st.html' target='_blank'><img src='http://images.shopin.net/images/had/hdjs5.gif' width='950' height='503'></a><a href='javascript:void();' class='adclose' style='margin-left:-60px;'><img src='http://images.shopin.net/images/ad/11st/adclose.gif' width='59' height='24' /></a></div>")
$(".adclose").click(function(){
	$(this).parent(".floatAD").slideUp(1000);
	});
setTimeout("$('.floatAD').slideUp(1000)",10000);
})
</script>
<%
  }else if(firstDay <= current && current < secondDay){
%>
<script type="text/javascript">
$(function(){
$("body").append("<div class='floatAD' style='position:absolute; top:0; z-index:1000; background:#fff; width:100%; text-align:center;'><a href='/help/11st.html' target='_blank'><img src='http://images.shopin.net/images/had/hdjs4.gif' width='950' height='503'></a><a href='javascript:void();' class='adclose' style='margin-left:-60px;'><img src='http://images.shopin.net/images/ad/11st/adclose.gif' width='59' height='24' /></a></div>")
$(".adclose").click(function(){
	$(this).parent(".floatAD").slideUp(1000);
	});
setTimeout("$('.floatAD').slideUp(1000)",10000);
})
</script>
<%
  }else if(secondDay <= current && current < thirdDay){
%>
<script type="text/javascript">
$(function(){
$("body").append("<div class='floatAD' style='position:absolute; top:0; z-index:1000; background:#fff; width:100%; text-align:center;'><a href='/help/11st.html' target='_blank'><img src='http://images.shopin.net/images/had/hdjs3.gif' width='950' height='503'></a><a href='javascript:void();' class='adclose' style='margin-left:-60px;'><img src='http://images.shopin.net/images/ad/11st/adclose.gif' width='59' height='24' /></a></div>")
$(".adclose").click(function(){
	$(this).parent(".floatAD").slideUp(1000);
	});
setTimeout("$('.floatAD').slideUp(1000)",10000);
})
</script>
<%
  }else if(thirdDay <= current && current < fourthDay){
%>
<script type="text/javascript">
$(function(){
$("body").append("<div class='floatAD' style='position:absolute; top:0; z-index:1000; background:#fff; width:100%; text-align:center;'><a href='/help/11st.html' target='_blank'><img src='http://images.shopin.net/images/had/hdjs2.gif' width='950' height='503'></a><a href='javascript:void();' class='adclose' style='margin-left:-60px;'><img src='http://images.shopin.net/images/ad/11st/adclose.gif' width='59' height='24' /></a></div>")
$(".adclose").click(function(){
	$(this).parent(".floatAD").slideUp(1000);
	});
setTimeout("$('.floatAD').slideUp(1000)",10000);
})
</script>
<%
  }else if(fourthDay <= current && current < fifthDay){
%>
<script type="text/javascript">
$(function(){
$("body").append("<div class='floatAD' style='position:absolute; top:0; z-index:1000; background:#fff; width:100%; text-align:center;'><a href='/help/11st.html' target='_blank'><img src='http://images.shopin.net/images/had/hdjs1.gif' width='950' height='503'></a><a href='javascript:void();' class='adclose' style='margin-left:-60px;'><img src='http://images.shopin.net/images/ad/11st/adclose.gif' width='59' height='24' /></a></div>")
$(".adclose").click(function(){
	$(this).parent(".floatAD").slideUp(1000);
	});
setTimeout("$('.floatAD').slideUp(1000)",10000);
})
</script>
<%
  }else {
%>

<%
  }
%>

<!--[if !ie]>尾部广告结束<![endif]-->
<script type="text/javascript" src="${js}/jwidget/jwidget_1.0.0-min.js"></script>
<script type="text/javascript" src="${js}/jquery/jquery.freetab-0.1.js"></script>
<script type="text/javascript" src="${js}/jquery/jcarousellite_1.0.1.js"></script>
<script type="text/javascript" src="${js}/jquery/jquery.easing.1.1.js"></script>
<script type="text/javascript">
    //var jq = jQuery.noConflict();
    jQuery(document).ready(function($) {
        //jwidget slides
        jWidget.ui.SlideView("slider", {effect: 'scrolly',autoPlayInterval:10000});


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
                var text = "还剩";
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
                text = text + "结束";
                $(".remainTime").eq(i).html(text);
            } else {
                $(".remainTime").html("活动已结束");
                //window.clearInterval(InterValObj);
            }
        });
    }
</script>
<script>
    function addCookie() {// 加入收藏夹
        if (document.all) {
            window.external.addFavorite('http://www.shopin.net', '上品折扣网-www.shopin.net');
        } else if (window.sidebar) {
            window.sidebar.addPanel('上品折扣网-www.shopin.net', 'http://www.shopin.net', "");
        }
    }
</script>
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
<script type="text/javascript">
<!-- 
var bd_cpro_rtid="nHTdn1D";
//-->
</script>
<script type="text/javascript" src="http://cpro.baidu.com/cpro/ui/rt.js"></script>
<noscript>
<div style="display:none;">
<img height="0" width="0" style="border-style:none;" src="http://eclick.baidu.com/rt.jpg?t=noscript&rtid=nHTdn1D" />
</div>
</noscript>
</body>
</html>
