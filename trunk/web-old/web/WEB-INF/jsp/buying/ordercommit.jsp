<%--
  Description:订单提交后页面
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<%--如果订单状态不是1,重定向到订单详细页--%>
<c:if test="${'1'!=order.orderStatus}">
    <c:redirect url="/myshopin/order/${order.orderId}.html" context="${ctx}"></c:redirect>
</c:if>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订购成功-上品折扣网www.shopin.net</title>
<link href="${css}/master.css" rel="stylesheet" type="text/css" />
<link href="${css}/mycart.css" rel="stylesheet" type="text/css" />
<script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>

<c:if test="${'1'==order.paymentModeSid}">
<script type="text/javascript">
      <%--使用会员账户支付--%>
      function payByAccount(button){
          $.ajax({
            url:'${ctx}/accountpay.json',
            type: 'post',
            dataType: 'json',
            data:{
                orderId:'${order.orderId}'
            },
            timeout: 30000,
            error: function(){
                $.popdialog(button,"order_pay_commit",'使用会员账户支付失败');
                return;
            },
            success: function(response){
                var result=response.result;
                var status=result.status;
                var message=result.message;
                $.popdialog(button,"order_pay_commit",message);
                if(status=='1'){
                    window.setTimeout(function(){window.location='${ctx}/myshopin/order/${order.orderId}.html'},5000);
                }
                return;
            }
        });
      }
</script>
</c:if>
<c:if test="${'2'==order.paymentModeSid}">
<%--银行卡支付 --%>
<script type="text/javascript">
    function bankPay(v_pmode){
       var orderSid='${order.orderId}';
       var paynum='${order.saleTotalSum}';
       var form=$("#order_form");
//       alert(form.length);
       if(form.length==0){
           form=$("<form id='order_form' action='${ctx}/toBankpay.html' method='post' target='_blank'></form>");
           form.append("<input type='hidden' name='orderSid' value='"+orderSid+"'/>");
           form.append("<input type='hidden' name='paynum' value='"+paynum+"'/>");
           form.append("<input type='hidden' name='v_pmode'/>");
           $("body").append(form);
       }
       form.children("input[name='v_pmode']").eq(0).val(v_pmode);
       $("#order_form").get(0).submit();
    }
</script>
</c:if>
<style type="text/css">
    .pays-bk .pay-minfo1{ float:left; border:1px solid #ff6601;
        background-color:#fff4e6; width:820px; margin-bottom:10px; text-indent:5px;
        margin-top:0px; padding-top:10px; height:230px}
    .pays-bk .pay-minfo1 .pay-minfotit1{font-family:"宋体"; font-size:12px; line-height:24px;
        color:#333; height:24px; border-bottom:1px solid #ffcc00; margin-bottom:5px;
        margin-left:5px; margin-right:5px; }
    .pays-bk .pay-minfo1 .pay-minfotit2{font-family:"宋体"; font-size:12px; line-height:24px;
        color:#333; height:24px; margin-bottom:5px; margin-left:5px; margin-right:5px; }
    .table_css{border:1px solid #ff9900;border-collapse:collapse;}
    .td_css{border:1px solid #ff9900;}
</style>
</head>

<body>
<div>
    <div>
    <ul class="banner-channels">
    	<ol><img src="${images}/y-p001.gif" title="我的购物车" />
    	</ol>
        <div class="cart-step">
		   <img src="${images}/y_num001.gif" title="第一步" border="0" /><font color="#f60">挑选商品</font> <img src="${images}/y_arr_001-c.gif" title="" width="23" height="8" />
		   <img src="${images}/y_num002-c.gif" title="第二步" border="0" /><font color="#f60">我的购物车</font><img src="${images}/y_arr_001-c.gif" title="" width="23" height="8" />
		   <img src="${images}/y_num003-c.gif" title="第三步" border="0" /><font color="#f60">确认结算</font><img src="${images}/y_arr_001-c.gif" title="" width="23" height="8" />
		   <img src="${images}/y_num004-c.gif" title="第四步" border="0" /><font color="#f60">订购成功</font>		</div>
    </ul>
    </div>
<%--commit-content开始--%>
    <div id=pays-content>
		<div class="pay-kong1"></div>
		<div class="pays-bk">
			<li class="pays-bktit">恭喜您，订单提交成功了!</li>
			<li>您的订单号：<strong><font color="#cc0000">${order.orderNo}</font></strong>&nbsp;&nbsp;
                订单总金额：<strong><font color="#cc0000"><fmt:formatNumber type="currency" value="${order.saleTotalSum}"/></font></strong>元&nbsp;&nbsp;
                商品总金额：<strong><font color="#cc0000"><fmt:formatNumber type="currency" value="${order.saleMoneySum}"/></font></strong>元&nbsp;&nbsp;
                运费：<strong><font color="#cc0000"><fmt:formatNumber type="currency" value="${order.sendCost}"/></font></strong>元
            </li>
            <c:choose>
                <c:when test="${order.paymentModeSid=='1'}">
                     <div class="pays-titimg">
                         <img src="${images}/bt_s2-13.gif"  onclick="payByAccount(this);"
                              border="0" style="cursor:pointer"/>
                     </div>
                </c:when>
                <c:when test="${order.paymentModeSid=='3'}">
                     <div class="pays-titimg">
                        <form action="${ctx}/toAlipay.html" id="alipay_form" method="post">
                            <input type="hidden" name="sid" value="${order.orderId}"/>

                            <img src="${images}/y-p003.gif" border="0" style="cursor:pointer"
                                 onclick="javascript:document.getElementById('alipay_form').submit();"/>
                        </form>
                     </div>
                </c:when>
                <c:when test="${order.paymentModeSid=='5'}">
                     <div class="pays-titimg">
                        <form action="${ctx}/toIcbcPay.html" id="icbc_form" method="post">
                            <input type="hidden" name="sid" value="${order.orderId}"/>
                            <input name="time" type="hidden" value="1810"/>
                            <img src="${images}/icbc.gif" border="0" style="cursor:pointer"
                                 onclick="javascript:document.getElementById('icbc_form').submit();"/>
                        </form>
                     </div>
                </c:when>
                <c:when test="${order.paymentModeSid=='4'}">
                    <li>您的订单预计在发货后5至6天送达，稍后您的邮箱将会收到一份订单提交成功的邮件。</li>
                    <li>您还需支付<strong><font color="#cc0000"><fmt:formatNumber type="currency" value="${order.saleTotalSum}"/></font></strong> 元现金，
                        快递人员会在送货上门时收取，请当面付款后验货。
                    </li>
                </c:when>
            </c:choose>
        </div>
        <c:if test="${'4'!=order.paymentModeSid}">
        <div class="clear" >&nbsp;</div>
        <div class="pays-bk">
			<img src="${images}/y_003.gif" border="0" />上品小助手提醒您：<font color="#f60">请尽快付款！由于该宝贝同时在实体店销售，如果您未能及时付款，有可能被别人抢走哦！</font>
		</div>
        </c:if>
        <c:if test="${order.paymentModeSid=='2'}">
        <div class="pay-kong1"></div>
        <div class="pays-bk" style="border:0px">
            <div class="pay-minfo1">
				<div class="pay-minfotit1">
				<b>银行卡支付</b>&nbsp;&nbsp;&nbsp;&nbsp;利用您手中的银行卡，轻松实现刷卡购物。
				</div>
				<div class="pay-minfotit2">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="25%"><a href="#" onClick="bankPay('3');">招商银行</a></td>
							<td width="25%"><a href="#" onClick="bankPay('4');">建设银行</a></td>
							<td width="25%"><a href="#" onClick="bankPay('9');">工商银行</a></td>
							<td width="25%"><a href="#" onClick="bankPay('14');">平安银行</a></td>
						</tr>
						<tr>
							<td><a href="#" onClick="bankPay('22');">首信会员帐户</a></td>
							<td><a href="#" onClick="bankPay('28');">民生银行卡</a></td>
							<td><a href="#" onClick="bankPay('33');">兴业银行卡</a></td>
							<td><a href="#" onClick="bankPay('40');">深圳发展银行</a></td>
						</tr>
						<tr>
							<td><a href="#" onClick="bankPay('43');">农业银行</a></td>
							<td><a href="#" onClick="bankPay('44');">广东发展银行</a></td>
							<td><a href="#" onClick="bankPay('50');">北京银行</a></td>
							<td><a href="#" onClick="bankPay('60');">华夏银行</a></td>
						</tr>
						<tr>
							<td><a href="#" onClick="bankPay('67');">交通银行</a></td>
							<td><a href="#" onClick="bankPay('69');">浦发银行</a></td>
							<td><a href="#" onClick="bankPay('72');">网汇通</a></td>
							<td><a href="#" onClick="bankPay('74');">渤海银行</a></td>
						</tr>
						<tr>
							<td><a href="#" onClick="bankPay('75');">光大银行</a></td>
							<td><a href="#" onClick="bankPay('83');">北京农村商业银行</a></td>
							<td><a href="#" onClick="bankPay('84');">中信银行</a></td>
							<td><a href="#" onClick="bankPay('85');">中国银行</a></td>
						</tr>
						<tr>
							<td colspan="2"><a href="#" onClick="bankPay('16');">ChinaPay [上海农村商业银行 、中国银行（上海）</a></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td colspan="4"><a href="#" onClick="bankPay('13');">广东银联[广州市商业银行（广州市）、广州市农村信用合作社联合社（广州市、深圳） 、 顺德农村信用合作社 中国银行（广州除深圳）]</a></td>
						</tr>
					</table>
				</div>
			</div>
        </div>
        </c:if>
		<div class="clear">&nbsp;</div>
		<div class="pays-bk1">
			<div class="pays-tit">&nbsp;&nbsp;您的订单内容</div>
			<div class="pays-tcon">商品清单</div>
			<div class="pays-tcontent" style="padding-left:10px">
				<table width="96%" border="0" cellspacing="0" cellpadding="0"
                         class="table_css">
					<tr>
						<td width="11%" bgcolor="#ffecd0" class="td_css">商品编码</td>
						<td width="29%" bgcolor="#ffecd0" class="td_css">商品名称</td>
						<td width="11%" bgcolor="#ffecd0" class="td_css">市场正价</td>
						<td width="11%" bgcolor="#ffecd0" class="td_css">上品价</td>
						<td width="11%" bgcolor="#ffecd0" class="td_css">颜色</td>
						<td width="9%" bgcolor="#ffecd0" class="td_css">尺寸</td>
						<td width="9%" bgcolor="#ffecd0" class="td_css">购买数量</td>
					</tr>
                    <c:forEach items="${order.orderDetails}" var="item">
					<tr>
						<td bgcolor="#ffecd0" class="td_css">${item.proSku}</td>
						<td bgcolor="#ffecd0" class="td_css"><a href="${ctx}/product/${item.proSid}.html" target="_blank">${item.proName}</a></td>
						<td bgcolor="#ffecd0" class="td_css"><del><fmt:formatNumber type="currency" value="${item.proPrice}"/></del></td>
						<td bgcolor="#ffecd0" class="td_css"><fmt:formatNumber type="currency" value="${item.salePrice}"/></td>
						<td bgcolor="#ffecd0" class="td_css">${item.proColorName}</td>
						<td bgcolor="#ffecd0" class="td_css">${item.proSize}</td>
						<td bgcolor="#ffecd0" class="td_css">${item.saleSum}</td>
					</tr>
                    </c:forEach>
				</table>
			</div>
			<div class="pays-tcon">收货人信息</div>
			<div class="pays-tinfo">
				<li>姓名：${order.receptName}</li>
				<li>地址：${order.inceptProvince}${order.inceptCity}${order.receptAddress}</li>
				<li>邮编：${order.inceptPostcode}</li>
				<li>电话：${order.receptPhone}</li>
			</div>
			<div class="pays-tcon">配送方式</div>
			<div class="pays-tinfo">
				<li>配送方式：${order.sendTypeName}</li>
				<li>时间要求：${order.memo}</li>
			</div>
            <c:if test="${order.invoiceBit!=null&&order.invoiceBit=='1'}">
                <div class="pays-tcon">发票信息</div>
                <div class="pays-tinfo">
                    <li>发票抬头：${order.invoiceName}</li>
                    <li>发票内容：${order.invoiceDesc}</li>
                </div>
            </c:if>
		</div>
		<div class="pays-ths">
            <img src="${images}/y-p002.gif" border="0" style="cursor:pointer"
                     onclick="javascript:window.location='${ctx}'"/>
            <br />非常感谢您的惠顾，期待您的下次光临
		</div>
	</div>
<%--cart-content结束--%>
</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>
</body>
</html>
