<%--
  Description:会员dm单查询
  User: kong ming 
  Date: 2012-06-08
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>我的订单</title>

<script type="text/javascript" src="${js}/input.js"></script>
<script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>
<link href="${css}/myshopin.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.table_css{border:1px solid #ff9900;border-collapse:collapse;}
.td_css{border:1px solid #ff9900;}
.span_css{padding-left:2px;padding-right:5px;color:red}
</style>
<script type="text/javascript">

    <%--搜索订单--%>
    function search(button){

        var alipayTradeNo=$.trim($("#alipayTradeNo").val());
        var receptPhone=$.trim($("#receptPhone").val());
        var receptName=$.trim($("#receptName").val());
           receptName = encodeURI(receptName);
        
        if(alipayTradeNo==''){
            $.poptip(button,"search_info","请输入支付宝订单号");
            return;
        }
        if(receptPhone==''){
             $.poptip(button,"search_info","请输入手机号");
            return;
        }
        if(receptName==''){
             $.poptip(button,"search_info","请输入姓名");
            return;
        }
       
        window.location='${ctx}/myshopin/searchdmorders/'+alipayTradeNo+'/'+receptPhone +'/'+ encodeURI(receptName) + '.html';
    }
    <%--绑定DM单--%>
    function bindDM(button){
          var input=$(button).parent().children("input").eq(0);
          var orderSID=input.val();
          var ordercode=$(button).parent().parent().children("td").eq(0).html();
          $.popalert(button,"confirm_"+orderSID,"该操作将不能恢复,您确定要绑定二维码订单到当前用户"+ordercode+"吗?",dobind);
      }
         <%--绑定DM单,确认框点击确认后的回调函数--%>
      function dobind(button){
           var input=$(button).parent().children("input").eq(0);
           var orderSID=input.val();
           $.ajax({
               url:'${ctx}/myshopin/bindDM.json',
               type: 'post',
               dataType: 'json',
               data:{'orderId':orderSID},
               timeout: 30000,
               error: function(){
                   $.popdialog(button,"order_cancel_"+orderSID,"绑定订单失败,请重试");
                   return;
               },
               success: function(response){
                   var result=response.result;
                   var status=result.status;
                   var message=result.message;
                   $.popdialog(button,"order_cancel_"+orderSID,message);
                   if(status=='1'){
                       window.setTimeout(
                           function(){window.location.reload();},2000);
                   }
                   return;
               }
           });
       }

    <%--撤销订单--%>
    function cancel(button){
        var input=$(button).parent().children("input").eq(0);
        var orderSID=input.val();
        var ordercode=$(button).parent().parent().children("td").eq(0).html();
        $.popalert(button,"confirm_"+orderSID,"该操作将不能恢复,您确定要撤销订单"+ordercode+"吗?",docancel);
    }

    <%--撤销订单,确认框点击确认后的回调函数--%>
    function docancel(button){
        var input=$(button).parent().children("input").eq(0);
        var orderSID=input.val();
        $.ajax({
            url:'${ctx}/order/cancel.json',
            type: 'post',
            dataType: 'json',
            data:{'orderId':orderSID},
            timeout: 30000,
            error: function(){
                $.popdialog(button,"order_cancel_"+orderSID,"撤销订单失败,请重试");
                return;
            },
            success: function(response){
                var result=response.result;
                var status=result.status;
                var message=result.message;
                $.popdialog(button,"order_cancel_"+orderSID,message);
                if(status=='1'){
                    window.setTimeout(
                        function(){window.location.reload();},2000);
                }
                return;
            }
        }); 
    }

    <%--申请退货--%>
    function refund(button){
        var input=$(button).parent().children("input").eq(0);
        var orderSID=input.val();
        var ordercode=$(button).parent().parent().children("td").eq(0).html();
        $.popalert(button,"confirm_"+orderSID,
                "您确定要为订单"+ordercode+"申请退货吗?",goRefund);
    }

    <%--去退货--%>
    function doRefund(){
        window.location='${ctx}/index.html';
    }

</script>
</head>

<body>
<%--面包屑内容开始--%>
<div id="breadcrumb">
    <a href="${ctx}">首页</a><span>></span>我的上品<span>></span>订单管理<span>></span>查看订单</div>
<%--面包屑内容结束--%>
<div style="width:950px;float:left">
    <%--左侧分类开始--%>
    <jsp:include page="myshopin_left.jsp"/>
    <%--左侧分类结束--%>
    <%--右侧分类开始--%>
    <div class="text-top222">
	  <ul>
	<li><strong style="color:#5B5BBE">二维码订单管理</strong></li></ul>
	</div>
	<div class="text-top333">
	    <ul class="search-top22">
            <li>姓名:</li>
		   <li><input type="text" size="15" maxlength="" id="receptName" value="${receptName}"/>
		   </li>
		   <li>手机号:</li>
		   <li><input type="text" size="15" maxlength="" id="receptPhone" value="${receptPhone}"/>
		   </li>
            <li>支付宝订单编号:</li>
		   <li><input type="text" size="15" maxlength="" id="alipayTradeNo" value="${alipayTradeNo}"/>
		   </li>

		   <li><img src="${images}/l-26.gif" title="搜索订单"
                    onclick="search(this)" style="cursor:pointer"/>
           </li>
		</ul>
	</div>
	<div id="biaoge0101010">
		 <div id="biaoge0">
		   <table cellspacing="0" cellpadding="0" border="0"  width="700">
             <tr>
               <td width="100%" >
                   <table width="100%" cellspacing="1" cellpadding="1" border="0" align="center">
                       <tr height="25">
                         <td width="15%" align="center" bgcolor="#ffecd0" class="td_css"><b   style="color:#01439A">订单编号</b></td>
                         <td width="20%" align="center" bgcolor="#ffecd0" class="td_css"><b  style="color:#01439A">下单时间</b></td>
                         <td width="10%" align="center" bgcolor="#ffecd0" class="td_css"><b  style="color:#01439A">总数量</b></td>
                         <td width="16%" align="center" bgcolor="#ffecd0" class="td_css"><b  style="color:#01439A">总金额</b></td>
                         <td width="15%" align="center" bgcolor="#ffecd0" class="td_css"><b  style="color:#01439A">状态</b></td>
                         <td width="26%" align="center" bgcolor="#ffecd0" class="td_css"><b  style="color:#01439A">操作</b></td>
                       </tr>
                       <c:forEach items="${orderlist}" var="item">
                        <tr height="25">
                         <td align="center" bgcolor="#ffecd0" class="td_css">${item.orderNo}</td>
                         <td align="center"  bgcolor="#ffecd0" class="td_css">${item.saleTime}</td>
                         <td align="center" bgcolor="#ffecd0" class="td_css">${item.saleTotalQty}</td>
                         <td align="right" bgcolor="#ffecd0" class="td_css"><fmt:formatNumber type="currency" value="${item.saleTotalSum}" /></td>
                         <td align="center" bgcolor="#ffecd0" class="td_css">
                            ${item.orderStatusName}
                         </td>
                         <td width="25%" style="padding-left:20px" bgcolor="#ffecd0" class="td_css">
                             <input type="hidden" name="orderSID" value="${item.orderId}" />
                             <span>
                                 <a href="${ctx}/myshopin/order/${item.orderNo}.html">
                                     <img src="${images}/bt_s1-14.gif" style="cursor:pointer"/>
                                 </a>
                             </span>
                             <span onclick="bindDM(this)">
                                 <img src="${images}/bt_s1-24.gif" style="cursor:pointer"/>
                             </span>
                             <c:if test="${'1'==item.orderClientStatus}">
                             <span onclick="cancel(this)">
                                 <img src="${images}/bt_s1-15.gif" style="cursor:pointer"/>
                             </span>
                             </c:if>
                             <c:if test="${'3'==item.orderClientStatus||'4'==item.orderClientStatus}">
                                 <c:if test="${1==item.orderRefunBit}">
                                     <span>
                                         <a href="${ctx}/myshopin/refund/${item.orderId}.html">
                                             <img src="${images}/bt_s1-20.gif" style="cursor:pointer"/>
                                         </a>
                                     </span>
                                 </c:if>
                             </c:if>
                         </td>
                       </tr>
                       </c:forEach>
                       <tr height="30">
                         <td colspan="8" align="right" bgcolor="#ffecd0" class="td_css">　
                             <div class="digg">${page}</div>
                       </tr>
                       <tr height="30">
                         <td colspan="8" align="right"  bgcolor="#ffecd0" class="td_css">　
                             <strong>等待付款订单数：<span class="span_css">${not_paid_count}</span>未完成的订单数：<span class="span_css">${not_finished_count}</span>已完成的订单数：<span class="span_css">${finished_count}</span></strong></td>
                       </tr>
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
