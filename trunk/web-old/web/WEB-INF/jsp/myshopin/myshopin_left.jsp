<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<%--左侧分类开始--%>
    <div id="content-left">
    	<ul class="top-left">
        	<li class="top-left">我的上品</li>
        </ul>
        <ul class="top-left2">
        	<li id="menu_01">订单管理</li>
        </ul>
        <ul class="top-left3">
        	<li id="menu_01_01"><a href="${ctx}/myshopin/orders.html">查看订单</a></li>
            <li id="menu_01_02"><a href="${ctx}/myshopin/refunds.html">查看退货订单</a></li>
            <li id="menu_01_03"><a href="${ctx}/myshopin/dmorders.html">查看二维码订单</a></li>
          <%--  <li id="menu_01_03"><a href="${ctx}/myshopin/merge.html">合并订单发货</a></li>--%>
        </ul>
        <ul class="top-left2">
        	<li id="menu_02">个人信息</li>
        </ul>
        <ul class="top-left3">
        	<li id="menu_02_01"><a href="${ctx}/myshopin/memberinfo.html">修改个人信息</a></li>
            <li id="menu_02_02"><a href="${ctx}/myshopin/password.html">修改密码</a></li>
            <li id="menu_02_03"><a href="${ctx}/myshopin/address.html">管理地址簿</a></li>
            <li id="menu_02_04"><a href="${ctx}/myshopin/favorite.html">我的收藏夹</a></li>
            <li id="menu_02_05"><a href="${ctx}/myshopin/myleavemsg/1.html">我的留言</a></li>
        </ul>
<%--        <ul class="top-left2" >
        	<li id="menu_03">虚拟账户</li>
        </ul>
        <ul class="top-left3">
            <li id="menu_03_01"><a href="${ctx}/myshopin/account.html">账户余额</a></li>
            <li id="menu_03_02"><a href="${ctx}/myshopin/coupon.html">优惠券</a></li>
        	<li id="menu_03_03"><a href="${ctx}/myshopin/point.html">我的积分</a></li>
        </ul>--%>
        <ul class="top-left2">
        	<li id="menu_04">我的社区</li>
        </ul>
        <ul class="top-left3">
        	<li id="menu_04_01"><a href="${ctx}/myshopin/comment.html">商品评论</a></li>
        </ul>
    </div>
<%--左侧分类结束--%>
<%--高亮显示当前页面对应的左侧菜单的链接,开始--%>
<script type="text/javascript">
    function initLeft(){
        var location=window.top.location.toString();
        var index1=location.lastIndexOf("/");
        var index2=location.lastIndexOf(".");
        var param=location.substring(index1+1,index2);
        if(!isNaN(param)){
            location=location.replace(param,"1");
        }
        $("#content-left ul").each(function(){
           var ul=$(this);
           ul.find("a").each(function(){
               var a=$(this);
               if(location.indexOf(a.attr("href"))!=-1){
                    a.parent().addClass("focus11");
                    a.parent().parent().prev().addClass("focus11");
                    return;
               }
           });
        });
    };
    initLeft();
</script>
<%--高亮显示当前页面对应的左侧菜单的链接,结束--%>