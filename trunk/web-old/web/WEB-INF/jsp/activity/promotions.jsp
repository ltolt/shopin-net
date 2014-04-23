<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>上品折扣网shopin.net- 商场名牌1-3折限量秒杀,正品保障,网上购物!服装品牌,名品折扣,名牌打折,团购价!上品折扣官方购物网站</title>
    <link rel="stylesheet" href="${css}/channels.css"/>
    <link rel="stylesheet" href="${css}/freetab.css"/>
    <link rel="stylesheet" href="${css}/slideshow.css"/>
    <link rel="stylesheet" href="${css}/template.css"/>
    <link rel="stylesheet" href="${css}/gomall.css" type="text/css"/>
</head>
<body>
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
                                    <li><a href="${p.promotionLink}"><img
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
            <li class="sidebar-title"><span><a href="javascript:addCookie();">收藏本站>></a></span></li>
            <li>
                <ul>
                    <li class="sidebar-titlemore"><strong>打折预报</strong></li>
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
</div>
<div class="col-sub">
<img src="${images}/fqh.jpg">
</div>
</div>
<div id="offpage">
	<div class="offtab"><c:if test="${page=='current'}">正在限时抢购</c:if><c:if test="${page=='future'}">即将推出的活动</c:if><c:if test="${page=='past'}">已经结束的活动</c:if></div>    
    <div class="fnav">
      <span class="bignav">
        <c:if test="${page=='current'}"><c:forEach var="channel" items="${channels}" varStatus="status" end="8"><c:if test="${status.index!=0}"> | </c:if>
        <a href="${ctx}/promotions/${channel.name}.html" target="_blank">${channel.displayName}</a></c:forEach>
        </c:if><c:if test="${page=='future'}"><c:forEach var="channel" items="${channels}" varStatus="status" end="8"><c:if test="${status.index!=0}"> | </c:if><a href="${ctx}/promotions/${channel.name}/future.html" target="_blank">${channel.displayName}</a></c:forEach>
        </c:if><c:if test="${page=='past'}"><c:forEach var="channel" items="${channels}" varStatus="status" end="8"><c:if test="${status.index!=0}"> | </c:if><a href="${ctx}/promotions/${channel.name}/past.html" target="_blank">${channel.displayName}</a></c:forEach>
        </c:if></span>
    
    
            <span class="smallnav">[ <a href="${ctx}/promotions-future.html" target="_blank">即将推出</a> | <a href="${ctx}/promotions.html" target="_blank">正在进行</a> | <a href="${ctx}/promotions-past.html" target="_blank">已经结束</a> ]</span>

    </div>
</div>







<c:if test="${page=='current'}">
<!--<div class="offbody">
    <div class="offbody0408">
        <div class="offtop0408">
            <span class="text">周末秒杀专场</span>
            <span class="time"></span>
            <span></span>
        </div>
        <ul>
            <li>
                <a href="http://www.shopin.net/promotion/1864.html" target="_blank"><img src="http://images.shopin.net/images//promotions/201106101711521.jpg" border="0" style="margin-top:5px;"/></a>             
            </li>
        </ul>
    </div>
</div>-->
</c:if>





<c:forEach var="act" items="${actlist}" varStatus="status" begin="1">
<div class="offbody">
    <div class="offbody0408">
        <div class="offtop0408">
            <span class="text">${act.displayName}</span>
            <span class="time">活动时间： <fmt:formatDate pattern="yyyy.MM.dd" value="${act.promotionBeginTime}" type="date"/>-<fmt:formatDate pattern="MM.dd" value="${act.promotionEndTime}" type="date"/></span>
            <span><a href="${ctx}/promotions/${act.name}.html">更多</a></span>
        </div>
        <ul>
            <li>
                <c:if test="${page=='current'}"><a href="${ctx}${act.promotionLink}" target="_blank"><img src="${images}${act.promotionBpict}" border="0" style="margin-top:5px;"/></a></c:if>
                <c:if test="${page=='future'}"><a href="${ctx}${act.promotionLink}" target="_blank"><img src="${images}${act.promotionBpict}" border="0" style="margin-top:5px;"/></a></c:if>
                <c:if test="${page=='past'}"><img src="${images}${act.promotionBpict}" border="0" style="filter:progid:DXImageTransform.Microsoft.BasicImage(grayscale=1);margin-top:5px;"/></c:if>
            </li>
        </ul>
    </div>
</div>
</c:forEach>

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


</body>
</html>
