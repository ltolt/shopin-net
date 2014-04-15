<%--
  Created by IntelliJ IDEA.
  User: yanwt
  Date: 2009-7-29
  Time: 12:56:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<script language="javascript">
<!--
function getCookie(name)
{
	var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
	if(arr=document.cookie.match(reg)) return unescape(arr[2]);
	else return null;
}
function openDoyooCustomChat(t) {

	var url = "http://chat.doyoo.net/WebModule/chat/p.do?c=25248";
	if(	t!= null &&  t.length != 0 )
		url +="&g=" + t;

	var sid = getCookie("DOYOO_VISITOR_ID");
	var cid = getCookie("DOYOO_USER_ID");

	if(sid!=null)
		url +="&v=" + sid;
	if(cid !=null)
		url +="&u=" + cid;
	var param = "height=460,width=690,directories=no," + "location=no,menubar=no," + "resizeable=no,status=no,toolbar=no,top=100,left=200";

	var acceptWin = window.open(url,"", param);

}
//-->
</script>
<script type="text/javascript">
    jQuery(document).ready(function($) {
        $("#search-key").focus(function() {
            if (this.value == "请输入品牌/货号") {
                this.value = "";
                this.style.color = "#333";
            }
        });
        $("#search-key").blur(function($) {
            if (this.value == "") {
                this.value = "请输入品牌/货号";
                this.style.color = "#888";
            } else {
                this.style.color = "#333";
            }
        })
    });
    function searchType(type) {
       $("#proClass").val(type); 
    }
    function dosearch() {
      if($("#search-key").val()=="请输入品牌/货号"){
          alert("请输入搜索内容");
          $("#search-key").focus();
          return false;
      }
    }
</script>
<!--[if !ie]>页头开始<![endif]-->

<div id="header">
<%if(new java.util.Date().getDate()<19){%>
<div style="margin:0 auto;"><a href="http://www.shopin.net/help/jc.html" target="_blank"><img src="http://images.shopin.net/images/ad/0511a5.jpg" border="0" /></a></div>
<%}%>
<%if(new java.util.Date().getDate()>=19){%>
   <div style="margin:0 auto;"><a href="http://www.shopin.net/help/dq05.html" target="_blank"><img  src="http://images.shopin.net/images/ad/05181h.jpg" border="0" /></a></div>
<%}%>
    <div class="header0317">
        <div id="logo"><a href="http://www.shopin.net" target="_blank"><img src="${images}/logo.jpg" alt="上品折扣网-www.shopin.net"/></a></div>
      <div id="shopin-site">
      </div>
        <div id="banner"></div>
        <ul id="loginbar">
            <li class="welcome001">您好，欢迎来上品折扣！<a href="${ctx}/login.html" target="_blank">登录</a> | <a href="${ctx}/goRegister.html" target="_blank">免费注册</a> |<a href="${ctx}/help/h_payment.html" target="_blank">新手上路</a> | <a href="${ctx}/myshopin/index.html" target="_blank">我的上品</a> | <a href="${ctx}/help/h_service.html" target="_blank">帮助</a></li>
     
	 
			  <li class="line10">
			  		<ul style="background-image:url(http://images.shopin.net/images/ad/05212.gif); width:136px; height:27px; line-height:27px; float:right;">
						<li style="float:left; "><a href="http://t.sina.com.cn/offprice" target="_blank"><img src="http://images.shopin.net/images/ad/05214.gif" alt="新浪微博" border="0" style="margin:4px 0 0 70px; "></a></li>
						<li style="float:left;  "><a href="http://t.qq.com/shangpinzhekou" target="_blank"><img src="http://images.shopin.net/images/ad/05213.gif" alt="腾讯微博" border="0" style="margin:4px 0 0 8px; "></a></li>
					</ul>
					<!--<img src="${images}/tel0220.gif" alt="客服热线"/>
					<div id='live9922'><img src="${images}/i-2.gif" alt="客服在线"/></div>-->
			  </li>
        </ul>
    </div>
    <div>
        <ul id="main-nav">
            <li class="width25">&nbsp;</li>
            <c:forEach var="c" items="${channelList}" varStatus="status">
                <li><a href="${ctx}/${c.channelUrl}" <c:if test="${channel.sid==c.sid}">id="Focus"</c:if>>${c.displayName}</a></li>
            </c:forEach>
            <li class="width25">&nbsp;</li>
        </ul>
    </div>
    <div class="subnav">
        <ul>
            <li class="topnav">
                <ul>
                    <c:forEach var="c" items="${secondChannelList}" varStatus="status">
                        <li><a href="${ctx}/${c.link}">${c.name}</a></li>
                        <li><c:if test="${!status.last}"><span>|</span></c:if></li>
                    </c:forEach>
                </ul>
            </li>
            <li class="search"><span class="searchfont">商品搜索</span>
                <form action="${ctx}/search.html" method="post">
                    <input style="color: rgb(136, 136, 136);" name="key" id="search-key" type="text" class="s-input" value="<c:if test="${not empty query}">${query}</c:if><c:if test="${empty query}">请输入品牌/货号</c:if>" maxlength="50"/>
                    <input type="hidden" id="proClass" name="proClass" value="<c:if test="${empty proClass}">${channel.productClass}</c:if><c:if test="${not empty proClass}">${proClass}</c:if>">

                    <div id="t_select">
                        <c:if test="${(empty proClass) && (empty channel)}"><div id="t_selected">全部</div></c:if>
                        <c:if test="${not empty proClass}">
                            <c:forEach var="c" items="${channelList}" varStatus="status" begin="1" end="9"><c:if test="${proClass==c.productClass}"><div id="t_selected">${c.displayName}</div></c:if></c:forEach>
                        </c:if>
                        <c:if test="${empty proClass}">
                            <c:if test="${not empty channel}">
                                <c:forEach var="c" items="${channelList}" varStatus="status" begin="1" end="9"><c:if test="${channel.displayName==c.displayName}">
                                    <div id="t_selected">${c.displayName}</div>
                                    <c:set var="flag" value="true"></c:set>
                                </c:if></c:forEach>
                                <c:if test="${flag!=true}">
                                    <div id="t_selected">全部</div>
                                </c:if>
                            </c:if>
                        </c:if>
                        <div id="t_select-list">
                            <div><a href="javascript:searchType('');">全部</a></div>
                            <c:forEach var="c" items="${channelList}" varStatus="status" begin="1" end="9">
                                <div><a href="javascript:searchType('${c.productClass}');">${c.displayName}</a></div>
                            </c:forEach>
                        </div>
                    </div>
                    <input type="image" onclick="javascript:return dosearch();" src="${images}/nc-1.gif" class="searchbutton"/>

                    <h3><span>热门搜索：</span>
                        <c:forEach var="pop" items="${popSearch}" varStatus="status"><a href="${ctx}/search/${pop.url}.html">${pop.key}</a> </c:forEach>
                    </h3>
                </form>
            </li>
        </ul>
        <ul class="shop">
            <li><img src="${images}/nc-2.gif" alt="购物车"/></li>
            <li class="shop3">
                <p><a href="${ctx}/cart/show.html" target="_blank">购物车有&nbsp;<span id="header_pro_qty">0</span>&nbsp;件商品</a></p>

          <p><a href="${ctx}/myshopin/orders.html" target="_blank">未付款订单(<span id="header_order_qty">0</span>)</a>
                    <a href="${ctx}/order/confirm.html" target="_blank">去结算>></a></p>
          </li>
        </ul>
    </div>
</div>
<!--[if !ie]>页头结束<![endif]-->
