<%--
  Created by IntelliJ IDEA.
  User: kongm
  Date: 2013-7-17
  Time: 15:47:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<jsp:include page="/common/meta.jsp" />
<%@ include file="/common/taglibs.jsp"%>
<html>
<head>
<meta name="google-site-verification" content="qswRxDn0CpoN2zbM79yH_OnDiDIvQyN6iMoQ1vmRaU4" />
<title>上品折扣网shopin.net-商场名牌1-3折限量秒杀,正品保障,网上购物!服装品牌,名品折扣,名牌打折,团购价!上品折扣官方购物网站</title>
<link href="${localcss}/reset.css" rel="stylesheet" type="text/css">
<link href="${localcss}/layout.css" rel="stylesheet" type="text/css">
<link href="${localcss}/master.css" rel="stylesheet" type="text/css">
</head>
<body>
<div id="slideBox">
    <div class="in">
        <div id="slide">
            <ul>
                <c:forEach var="p" items="${promotions}">
                    <li><a href="${p.promotionLink}" target="_blank"><img  src="${ftpimages}/${p.promotionSpict}" height="313" width="790" alt="${p.promotionTitle}"></a></li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>
<div id="container">
<div class="in">
    <div class="sidebar fr">
        <div class="integrity tc bos">
            <ul>
                <li class="int1"><img
                        src="images/s.gif">
                        <p>货到付款</p></li>
                <li class="int2"><img
                        src="images/s.gif">
                        <p>诚信网站</p></li>
                <li class="int3"><img
                        src="images/s.gif">
                        <p>快乐购物</p></li>
                <li class="int4"><img
                        src="images/s.gif">
                        <p>超值折扣</p></li>
            </ul>
        </div>
        <div class="news bos mt">
            <div class="newsTitle">
                <ul class="tabHd">
                    <li class="cur" id="off"><a href="javascript:void(0);"
                        onmouseover="data('off')">打折预报</a></li>
                    <li id="notice"><a href="javascript:void(0);"
                        onmouseover="data('notice')">网站公告</a></li>
                </ul>
                <a class="more fr" id="more" href="${ctx}/notices/0.html" target="_blank">更多&gt;&gt;</a>
            </div>
            <div class="tabBd">
             	<div class="item">
                    <ul class="txtList">
                        <c:forEach var="notice" items="${saleOff}" varStatus="status" begin="0" end="3">
                            <li class="sidebar-titlecontent1"><c:choose>
                                    <c:when test="${!empty notice.link}">
                                        <a href="${notice.link}" target="_blank">${notice.title}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${ctx}/notice/${notice.sid}.html" target="_blank">${notice.title}</a>
                                    </c:otherwise>
                                </c:choose></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="item">
                    <ul class="txtList">
                        <c:forEach var="notice" items="${notices}" varStatus="status" begin="0" end="3">
                            <li class="sidebar-titlecontent"><c:choose>
                                    <c:when test="${!empty notice.link}">
                                        <a href="${notice.link}" target="_blank">${notice.title}</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="${ctx}/notice/${notice.sid}.html" target="_blank">${notice.title}</a>
                                    </c:otherwise>
                                </c:choose></li>

                        </c:forEach>
                    </ul>
                </div>
               
            </div>
        </div>
        <c:forEach var="column" items="${columns}" varStatus="status">
                ${column.template}
            </c:forEach>
        <%--  ${columns[1].template} 
         ${columns[0].template}	  --%>
        <!-- <div class="ms mt bos">
            <div style="height: 300px"></div>
        </div> -->
        <c:if test="${!empty ads1 }"> 
        <div class="ms mt">
            <a href="${ads1.link}" target="_blank"><img src="${images}/${ads1.pic}" alt="${ads1.memo }"></a>
        </div>
        </c:if>
        <c:if test="${!empty ads2 }"> 
        <div class="ms mt">
            <a href="${ads2.link}" target="_blank"><img src="${images}/${ads2.pic}" alt="${ads2.memo }"></a>
        </div>
        </c:if>
        <c:if test="${!empty ads3 }"> 
        <div class="ms mt">
            <a href="${ads3.link}" target="_blank"><img src="${images}/${ads3.pic}" alt="${ads3.memo }"></a>
        </div>
        </c:if>
        <div class="ms mt">
            <img src="${localimg}/twocode.png" alt="关注二维码">
        </div>
    </div>
    <div class="content">
        <div class="main">
            <div class="onSale">
                <div class="title pr">
                    <h5>品牌疯抢会</h5>
                    <span class="pa">每天9:50&nbsp; 商场品牌正品&nbsp; 超值抢购</span>
                </div>
                <ul class="tabHd oz">
                    <li><a href="javascript:void(0);">正在进行</a></li>
                    <li><a href="#shopin1">最后疯抢</a></li>
                    <li><a href="#shopin2">即将推出</a></li>
                </ul>
                
                <div class="tabBd">
                    <div class="item">
                        <ul class="saleList">
                            <c:forEach var="act" items="${actlist}" varStatus="status">
                                <li><a href="${ctx}${act.promotionLink}" target="_blank">
                                        <img width="698" height="200" src="${ftpimages}${act.promotionVpict}" >
                                    </a>
                                    <div class="saleTime">
                                        ${act.promotionDesc }
                                        <div id="remainTime${act.sid}/${act.promotionLink}" class="remainTime"></div>
                                    </div>
                                     <script language="javascript">
                                        function _fresh() {
                                            var end = '${act.promotionEndTime}';
                                            var endtime = new Date(end);//定义结束时间 
                                            var nowtime = new Date();
                                            var leftsecond = parseInt((endtime.getTime() - nowtime.getTime()) / 1000)-3600*14;
                                            __d = parseInt(leftsecond / 3600 / 24);
                                            __h = parseInt((leftsecond / 3600) % 24);
                                            __m = parseInt((leftsecond / 60) % 60);
                                            __s = parseInt(leftsecond % 60);
                                            var c = new Date();
                                            var q = ((c.getMilliseconds()) % 10);
                                            var id = '${act.sid}/${act.promotionLink}';
                                            document.getElementById("remainTime"+ id).innerHTML = "剩余："
                                                    + "<span>"
                                                    + __d
                                                    + "</span>"
                                                    + "天"
                                                    + "<span>"
                                                    + __h
                                                    + "</span>"
                                                    + "小时"
                                                    + "<span>"
                                                    + __m
                                                    + "</span>"
                                                    + "分"
                                                    + "<span>"
                                                    + __s
                                                    + "</span>" + "秒";
                                            if (leftsecond <= 0) {
                                                document.getElementById("remainTime"+ id).innerHTML = "活动已结束";//结束后的状态
                                                clearInterval(sh);
                                            }
                                        }
                                        _fresh()
                                        var sh;
                                        sh = setInterval(_fresh, 100);
                                    </script>
                                </li>
                            </c:forEach>

                        </ul>
                    </div>
</div>

</div>

</div>
</div>
<div class="cl"></div>

<a id="shopin1"></a>
<div class="in">
<div class="lastSale mousemove mt oz">

     <div class="title pr"><h5>最后疯抢</h5></div>
         <ul >
             <c:forEach var="actZHFQ" items="${actlastFQ}" varStatus="status">
                 <li>
                     <a href="${ctx}${actZHFQ.promotionLink}" target="_blank">
                        <img width="310" height="184" src="${ftpimages}${actZHFQ.promotionCpict}" >
                      </a>
                    <div class="saleFt">
                       <div id="remainTime4${actZHFQ.sid}/${actZHFQ.promotionLink}" class="remainTime"></div>
                    </div>
                   <script language="javascript">
                                        function _fresh() {
                                            var end = '${actZHFQ.promotionEndTime}';
                                            
                                            var endtime = new Date(end);//定义结束时间 
                                            var nowtime = new Date();
                                            var leftsecond = parseInt((endtime.getTime() - nowtime.getTime()) / 1000)-3600*14;
                                            
                                            __d = parseInt(leftsecond / 3600 / 24);
                                            __h = parseInt((leftsecond / 3600) % 24);
                                            __m = parseInt((leftsecond / 60) % 60);
                                            __s = parseInt(leftsecond % 60);
                                            var c = new Date();
                                            var q = ((c.getMilliseconds()) % 10);
                                            var id = '${actZHFQ.sid}/${actZHFQ.promotionLink}';
                                            document.getElementById("remainTime4"+ id).innerHTML = "剩余："
                                                    + "<span>"
                                                    + __d
                                                    + "</span>"
                                                    + "天"
                                                    + "<span>"
                                                    + __h
                                                    + "</span>"
                                                    + "小时"
                                                    + "<span>"
                                                    + __m
                                                    + "</span>"
                                                    + "分"
                                                    + "<span>"
                                                    + __s
                                                    + "</span>" + "秒";
                                            if (leftsecond <= 0) {
                                                document.getElementById("remainTime4"+ id).innerHTML = "活动已结束";//结束后的状态
                                                clearInterval(sh);
                                            }
                                        }
                                        _fresh()
                                        var sh;
                                        sh = setInterval(_fresh, 100);
                                    </script>
                 </li>
                 </c:forEach> 
       </ul>
       </div>
</div>   
<a id="shopin2"></a>
<div class="in">
<div class="lastSale mt oz">

     <div class="title pr"><h5>即将推出</h5></div>
                        <ul >
                            <c:forEach var="actotw" items="${actlistOnTheWay}" varStatus="status">
                                <li>
                                <%-- <a href="${ctx}${actotw.promotionLink}"
                                    target="_blank"> --%> 
                                    <img width="310" height="184" src="${ftpimages}${actotw.promotionCgpict}">
                                    <!-- </a> -->
                                    <div class="saleFt">
                                        <div id="remainTime3${actotw.sid}/${actotw.promotionLink}" class="remainTime"></div>
                                    </div> 
                                    <script language="javascript">
                                        function _fresh() {
                                            var begin = '${actotw.promotionBeginTime}';
                                            var endtime = new Date(begin);//定义结束时间 
                                            var nowtime = new Date();
                                            var leftsecond = parseInt((endtime.getTime() - nowtime.getTime()) / 1000)-3600*14;
                                            __d = parseInt(leftsecond / 3600 / 24);
                                            __h = parseInt((leftsecond / 3600) % 24);
                                            __m = parseInt((leftsecond / 60) % 60);
                                            __s = parseInt(leftsecond % 60);
                                            var c = new Date();
                                            var q = ((c.getMilliseconds()) % 10);
                                            var id = '${actotw.sid}/${actotw.promotionLink}';
                                            document.getElementById("remainTime3"+ id).innerHTML = "剩余："
                                                    + "<span>"
                                                    + __d
                                                    + "</span>"
                                                    + "天"
                                                    + "<span>"
                                                    + __h
                                                    + "</span>"
                                                    + "小时"
                                                    + "<span>"
                                                    + __m
                                                    + "</span>"
                                                    + "分"
                                                    + "<span>"
                                                    + __s
                                                    + "</span>" + "秒";
                                            if (leftsecond <= 0) {
                                                document.getElementById("remainTime3"+ id).innerHTML = "活动已结束";//结束后的状态
                                                clearInterval(sh);
                                            }
                                        }
                                        _fresh()
                                        var sh;
                                        sh = setInterval(_fresh, 100);
                                    </script></li>
                            </c:forEach>

                        </ul>
                    </div> 
                </div>
</div>
</div>
<script src="${localjs}/mousemove.js"></script>
<script type="text/javascript">
	function data(target) {
//		alert(target);
//		alert(document.getElementById("notice").className);
//		if (document.getElementById("notice").className == "cur") {
//			document.getElementById("more").href = "${ctx}/notices/1.html";
//		} else if (document.getElementById("off").className == "cur") {
//			document.getElementById("more").href = "${ctx}/notices/0.html";
//		}
		if("off" == target) {
			document.getElementById("more").href = "${ctx}/notices/0.html";
		} else if("notice" == target) {
			document.getElementById("more").href = "${ctx}/notices/1.html";
		}
	}
</script>
</body>
</html>