<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %><%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN">
<head>
<title><decorator:title/></title>
<jsp:include page="/common/meta.jsp"/>
<script type="text/javascript" src="${js}/jquery/jquery132min.js"></script>
<script type="text/javascript" src="${js}/jquery/jquery-select.js"></script>
<script type="text/javascript" src="${js}/jquery/jquery.cookie.js"></script>
<script type="text/javascript" src="${js}/jwidget/jwidget_1.0.0-min.js"></script>
<link href="${css}/reset.css" rel="stylesheet" type="text/css"/>
<link href="${css}/grids.css" rel="stylesheet" type="text/css"/>
<link href="${css}/grids-taobao.css" rel="stylesheet" type="text/css"/>
<link href="${css}/adcss.css" rel="stylesheet" type="text/css"/>
<link href="${css}/master.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="${css}/slideshow.css"/>
<decorator:head/>
<script type="text/javascript">
        $(document).ready(function(){
            <%--页头初始化--%>
            $.ajax({
                url:'${ctx}/headerinfo.json',
                type: 'post',
                dataType: 'json',
                data:{},
                timeout: 30000,
                error: function(){
                    return;
                },
                success: function(response){
                    var isLogin=response.isLogin;
                    var username=response.username;
                    var proqty=response.proqty;
                    var orderqty=response.orderqty;
                    <%--处理登楼后的显示--%>
                    if(isLogin=='1'){
                      var username=response.username;
                      var li=$("#loginbar").children("li").eq(0);
                      li.html("<font color='red'>"+username+"</font>，欢迎来到上品折扣！<a href='${ctx}/logout.html'>注销</a>")
                        .append(" | <a href=\"#\">新手上路</a> | <a href=\"${ctx}/myshopin/orders/1.html\">我的上品</a> | <a href=\"#\">帮助</a>");
                    }
                    <%--处理用户购物车商品数量--%>
                    $("#header_pro_qty").html(proqty);
                    <%--处理用户订单数量--%>
                    $("#header_order_qty").html(orderqty);
                    return;
                }
            });

            jWidget.ui.SlideView("slider", {effect: 'scrolly',autoPlayInterval:10000});
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
                    text=text+"结束";
                    $(".remainTime").eq(i).html(text);
                } else {
                    $(".remainTime").html("活动已结束");
                    //window.clearInterval(InterValObj);
                }
            });
        }
        function addCookie() { // 加入收藏夹   
            if (document.all) {
                window.external.addFavorite('http://www.shopin.net', '上品折扣网-www.shopin.net');
            } else if (window.sidebar) {
                window.sidebar.addPanel('上品折扣网-www.shopin.net', 'http://www.shopin.net', "");
            }
        }
    </script>
  </head>
  <body>
<div id="page" class="w950">
<jsp:include page="/common/header.jsp"/>
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
<decorator:body/>
<div class="clear"></div>
<jsp:include page="/common/footer.jsp"/>
</div>
<!-- Live800默认跟踪代码: 开始-->
<div style="display:none">
<script src="http://s3.cnzz.com/stat.php?id=1516938&web_id=1516938&show=pic" language="JavaScript" charset="gb2312"></script>
<script language="javascript" src="http://chat16.live800.com/live800/chatClient/staticButton.js?jid=3886034846&companyID=100703&configID=9937&codeType=steady"></script>
<script id='write' language="javascript">function writehtml(){var temptext=StaticIcon_generate();document.getElementById('live9922').innerHTML=temptext;document.getElementById('shopin9922').innerHTML=temptext;setTimeout('write.src',9000);}writehtml();</script>
<script language="javascript" src="http://chat16.live800.com/live800/chatClient/monitor.js?jid=3886034846&companyID=100703&configID=9921&codeType=custom"></script>
</div>
<!-- Live800默认跟踪代码: 结束-->
<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-15677805-1");
pageTracker._trackPageview();
} catch(err) {}</script>
<script language="JavaScript" type="text/javascript">
var langtaojin_client_id = "6194";
</script>
<script language="JavaScript" src="http://track.langtaojin.com/tracking/referrer.js"></script>
<noscript>
<img height="1" width="1" border="0" src="http://track.langtaojin.com/tracking/noscript.gif?client_id=6194" />
</noscript>
<script type="text/javascript">
document.write(unescape("%3Cscript src='http://cactus.clieye.com/js/ck.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {ck.setAccount("SITE_0000000095");
ck.trackPageView();
} catch(err) {}
</script>


<!--百度默认跟踪代码: 结束-->
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fe0a537ff2f1696dc1ba1f057955404e7' type='text/javascript'%3E%3C/script%3E"));
</script>
<!-- 百度默认跟踪代码: 结束-->
</body>
</html>
