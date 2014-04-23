<%--
  Description:会员退货订单列表
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>我的退货订单</title>

<script type="text/javascript" src="${js}/input.js"></script>
<script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>
<link href="${css}/myshopin.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.table_css{border:1px solid #ff9900;border-collapse:collapse;}
.td_css{border:1px solid #ff9900;}
</style>
<script type="text/javascript">

    <%--搜索订单--%>
    function search(button){
        var orderNo=$.trim($("#searchOrderId").val());
        if(orderNo==''){
            $.poptip(button,"search_info","请输入订单号");
            return;
        }
        window.location='${ctx}/myshopin/searchrefunds/'+orderNo+'.html';
    }

</script>
</head>

<body>
<%--面包屑内容开始--%>
<div id="breadcrumb">
    <a href="${ctx}">首页</a><span>></span>我的上品<span>></span>订单管理<span>></span>查看退货订单
</div>
<%--面包屑内容结束--%>
<div style="width:950px;float:left">
    <%--左侧分类开始--%>
    <jsp:include page="myshopin_left.jsp"/>
    <%--左侧分类结束--%>
    <%--右侧分类开始--%>
    <div class="text-top222">
	  <ul>
	<li><strong style="color:#5050B5">退货订单管理</strong></li></ul>
	</div>
	<div class="text-top333">
	    <ul class="search-top22">
		   <li>订单编号:</li>
		   <li><input type="text" size="15" maxlength="" id="searchOrderId" value="${orderSearchNo}"/>
		   </li>
		   <li><img src="${images}/l-26.gif" title="搜索订单"
                    onclick="search(this)" style="cursor:pointer"/>
           </li>
		</ul>
	</div>
	<div id="biaoge0101010">
		 <div id="biaoge0">
		   <table cellspacing="0" cellpadding="0" border="0" width="700">
             <tr>
               <td width="100%" >
                   <table width="100%" cellspacing="1" cellpadding="1" border="0" align="center">
                       <tr height="25">
                         <td width="20%" align="center" bgcolor="#ffecd0" class="td_css"><b style="color:#01439A">订单编号</b></td>
                         <td width="25%" align="center" bgcolor="#ffecd0" class="td_css"><b style="color:#01439A">下单时间</b></td>
                         <td width="20%" align="center" bgcolor="#ffecd0" class="td_css"><b style="color:#01439A">总数量</b></td>
                         <td width="20%" align="center" bgcolor="#ffecd0" class="td_css"><b style="color:#01439A">总金额</b></td>
                         <td width="15%" align="center" bgcolor="#ffecd0" class="td_css"><b style="color:#01439A">操作</b></td>
                       </tr>
                       <c:forEach items="${orderlist}" var="item">
                        <tr height="25">
                         <td align="center" bgcolor="#ffecd0" class="td_css">${item.orderNo}</td>
                         <td align="center"  bgcolor="#ffecd0" class="td_css">${item.saleTime}</td>
                         <td align="center" bgcolor="#ffecd0" class="td_css">${item.saleTotalQty}</td>
                         <td align="center" bgcolor="#ffecd0" class="td_css"><fmt:formatNumber type="currency" value="${item.saleTotalSum}" /></td>
                         <td align="center" bgcolor="#ffecd0" class="td_css">
                             <input type="hidden" name="orderSID" value="${item.orderId}" />
                             <span><a href="${ctx}/myshopin/refund/${item.orderNo}.html">
                                 <img src="${images}/bt_s1-14.gif" style="cursor:pointer"/>
                             </a></span>
                         </td>
                       </tr>
                       </c:forEach>
                       <c:if test="${not empty page}">
                       <tr height="30">
                         <td colspan="8" align="right" bgcolor="#ffecd0" class="td_css">　
                             <div class="digg">${page}</div>
                       </tr>
                       </c:if>
                   </table>
               </td>
             </tr>
           </table>
		 </div>
	  </div>
<%--右侧分类结束--%>
</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>
</body>
</html>
