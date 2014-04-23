<%--
  Description:订单重新生成页面
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订购成功</title>
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
        margin-top:0px; padding-top:10px; height:350px}
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
			<li class="pays-bktit">恭喜您，新订单生成成功了!</li>
			<li>您的订单号：<strong><font color="#cc0000">${order.orderNo}</font></strong>&nbsp;&nbsp;
                订单总金额：<strong><font color="#cc0000"><c:if test="${not empty offPriceRecord.offPrice}"><fmt:formatNumber type="currency" value="${order.saleTotalSum*1-offPriceRecord.offPrice*1}"/></c:if><c:if test="${empty offPriceRecord.offPrice}"><fmt:formatNumber type="currency" value="${order.saleTotalSum}"/></c:if></font></strong>元&nbsp;&nbsp;
                商品总金额：<strong><font color="#cc0000"><fmt:formatNumber type="currency" value="${order.saleMoneySum}"/></font></strong>元&nbsp;&nbsp;
                运费：<strong><font color="#cc0000"><fmt:formatNumber type="currency" value="${order.sendCost}"/></font></strong>元
                <c:if test="${not empty offPriceRecord}">
                减免运费：<strong><font color="#cc0000"><fmt:formatNumber type="currency" value="${offPriceRecord.offPrice}"/></font></strong>元
                </c:if>
            </li>
            <c:choose>
                <c:when test="${order.paymentModeSid=='1'}">
                     <div class="pays-titimg">
                         <center><img src="${images}/bt_s2-13.gif"  onclick="payByAccount(this);"
                              border="0" style="cursor:pointer"/></center> 
                     </div>
                </c:when>
                <c:when test="${order.paymentModeSid=='3'}">
                     <div class="pays-titimg">
                        <form action="${ctx}/toAlipay.html" id="alipay_form" method="post" target="_blank">
                            <input type="hidden" name="sid" value="${order.orderId}"/>

                            <center><img src="${images}/y-p003.gif" border="0" style="cursor:pointer"
                                 onclick="javascript:document.getElementById('alipay_form').submit();"/></center>
                        </form>
                     </div>
                </c:when>
                <c:when test="${order.paymentModeSid=='5'}">
                     <div class="pays-titimg">
                        <form action="${ctx}/toIcbcPay.html" id="icbc_form" method="post">
                            <input type="hidden" name="sid" value="${order.orderId}"/>
                            <input name="time" type="hidden" value="1015"/>
                           <center><img src="${images}/w-26.gif" border="0" style="cursor:pointer"
                                 onclick="javascript:document.getElementById('icbc_form').submit();"/></center> 
                        </form>
                     </div>
                </c:when>
                <c:when test="${order.paymentModeSid=='4'}">
                    <li>您的订单预计在发货后5至6天送达，稍后您的邮箱将会收到一份订单提交成功的邮件。</li>
                    <li>您还需支付<strong><font color="#cc0000"><c:if test="${not empty offPriceRecord.offPrice}"><fmt:formatNumber type="currency" value="${order.saleTotalSum*1-offPriceRecord.offPrice*1}"/></c:if><c:if test="${empty offPriceRecord.offPrice}"><fmt:formatNumber type="currency" value="${order.saleTotalSum}"/></c:if></font></strong> 元现金，
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
				<b><img src="${images}/bank.jpg" hspace="5" align="absmiddle">请选择以下银行卡支付</b>				</div>
                <div class="pay-minfotit2">
					<ul class="bankstyle">
						<li>
							<span class="banktd"><a href="#" onClick="bankPay('3');"><img src="${images}/bank/CMB_OUT.gif" alt="招商银行"></a></span>
						 	<span class="banktd"><a href="#" onClick="bankPay('4');"><img src="${images}/bank/CCB_OUT.gif" alt="建设银行"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('9');"><img src="${images}/bank/ICBC_OUT.gif" alt="工商银行"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('14');"><img src="${images}/bank/SPABANK_OUT.gif" alt="平安银行"></a></span>
						</li>
						<li>
							<span class="banktd"><a href="#" onClick="bankPay('22');"><img src="${images}/bank/SXY_OUT.gif" alt="首信会员帐户"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('28');"><img src="${images}/bank/CMBC_OUT.gif" alt="民生银行卡"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('33');"><img src="${images}/bank/CIB_OUT.gif" alt="兴业银行卡"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('40');"><img src="${images}/bank/SDB_OUT.gif" alt="深圳发展银行"></a></span>
						</li>
						<li>
							<span class="banktd"><a href="#" onClick="bankPay('43');"><img src="${images}/bank/ABC_OUT.gif" alt="农业银行"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('44');"><img src="${images}/bank/GDB_OUT.gif" alt="广东发展银行"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('50');"><img src="${images}/bank/BO_OUT.gif" alt="北京银行"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('60');"><img src="${images}/bank/HX_OUT.gif" alt="华夏银行"></a></span>
						</li>
						<li>
							<span class="banktd"><a href="#" onClick="bankPay('67');"><img src="${images}/bank/COMM_OUT.gif" alt="交通银行"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('69');"><img src="${images}/bank/SPDB_OUT.gif" alt="浦发银行"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('72');"><img src="${images}/bank/WH_OUT.gif" alt="网汇通"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('83');"><img src="${images}/bank/BH_OUT.gif" alt="渤海银行"></a></span>
						</li>
						<li>
							<span class="banktd"><a href="#" onClick="bankPay('74');"><img src="${images}/bank/CEB_OUT.gif" alt="光大银行"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('75');"><img src="${images}/bank/BJY_OUT.gif" alt="北京农村商业银行"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('84');"><img src="${images}/bank/CITIC_OUT.gif" alt="中信银行"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('85');"><img src="${images}/bank/BOC_OUT.gif" alt="中国银行"></a></span>
						</li>
						<li>
							<a href="#" onClick="bankPay('16');">ChinaPay [上海农村商业银行 、中国银行（上海）</a></td>
						</li>
						<li>
							<a href="#" onClick="bankPay('13');">广东银联[广州市商业银行（广州市）、广州市农村信用合作社联合社（广州市、深圳） 、 顺德农村信用合作社 中国银行（广州除深圳）]</a>
						</li>
					</ul>
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
		</div>
		<div class="pays-ths">
            <a href="/index.html" target="_blank">
            <img src="${images}/y-p002.gif" border="0" style="cursor:pointer"/></a>
            <br />非常感谢您的惠顾，期待您的下次光临
		</div>
	</div>
<%--cart-content结束--%>
</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>
</body>
</html>
