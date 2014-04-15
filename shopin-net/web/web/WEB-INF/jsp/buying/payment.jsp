<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="net.shopin.view.OrderDetailVO" %>
<%@ page import="net.shopin.view.OrderVO" %>
<%@ page import="java.util.Iterator" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Access-Control-Allow-Origin" content="*">
<title>上品折扣网 - 实体店应季正品保障，全网底价折扣</title>
<link href="${localcss}/reset.css?1231" rel="stylesheet" type="text/css">
<link href="${localcss}/layout.css" rel="stylesheet" type="text/css">
<link href="${localcss}/cart.css" rel="stylesheet" type="text/css">
<style type="text/css">
#payicon_3 {}
#payicon_14 { background-position:0 -40px}
#payicon_10 { background-position:0 -80px}
#payicon_11,#payicon_25,.ICBC { background-position:0 -120px}
#payicon_13,.CMB { background-position:0 -160px}
#payicon_15 { background-position:0 -200px}
#payicon_4 { background-position:0 -732px}
#payicon_20{ background-position:0 -807px}
.CCB,#payicon_21 { background-position:0 -320px}
.BOC,#payicon_22 { background-position:0 -240px}
.ABC,#payicon_23 { background-position:0 -281px}
.CEB { background-position:0 -364px}
.SPABANK { background-position:0 -658px}
.SDB { background-position:0 -623px}
.COMM,#payicon_24 { background-position:0 -511px}
.SPDB { background-position:0 -694px}
.GDB { background-position:0 -547px}
.CITIC { background-position:0 -436px}
.CIB { background-position:0 -403px}
.CMBC { background-position:0 -476px}
#payicon_18,.other_pay{ background-position:0 -772px}
</style>
</head>

<body>
<%@include file="/common/cart_header.jsp" %>
<div id="container">
		<div class="in oz">
<c:choose>
		<c:when test="${order.paymentModeSid == '4' }">
				<div class="cart-step steps5 mt"></div>
		</c:when>
		<c:otherwise>
				<div class="cart-step steps3 mt"></div>
		</c:otherwise>
</c:choose>
				<div class="buy-success mt mb pr clear">
				<c:choose>
					<c:when test="${order.paymentModeSid == '4' }">
								<h2 class="pr"><i class="ico-success"></i>您的订单已提交成功！</h2>
					</c:when>
					<c:otherwise>
								<h2 class="pr"><i class="ico-success"></i>您的订单已提交成功，请您尽快付款！</h2>
					</c:otherwise>
				</c:choose>
				<p>您的订单号：${order.orderNo }<u>|</u><span id="getOrderNo" style=display:none>${order.orderNo }</span><span id="getOrderId" style=display:none>${order.orderId }</span>
				订单总金额：<span class="txt-red f20" >￥</span><span class="txt-red f20" id="saleTotalSum">${order.saleTotalSum }</span> <u>|</u>
				商品总金额：<span class="txt-red fb">￥</span><span class="txt-red fb" id="saleMoneySum">${order.saleMoneySum }</span><u>|</u>
				运费：<span class="txt-red fb">￥</span><span class="txt-red fb" id="sendCost">${order.sendCost }</span><u>|</u>
				购物券：<span class="txt-red fb">￥</span><span class="txt-red fb" id="ticketValue">${order.ticketSnUsePrice == null?0:order.ticketSnUsePrice }</span></p>
				<c:if test="${order.paymentModeSid != '4' }">
					<p>立即支付<span class="txt-red fb" id="waitPay">${order.saleTotalSum }元</span>，即可完成订单。 请您在<span class="txt-red">1小时</span>内完成支付，否则订单会被自动取消。</p>
					<div class="mt">
						<input type="text" name="textfield" id="ticket" class="input-quan"
							value="使用上品购物券" onFocus="if(this.value==this.defaultValue) this.value='';"
							onblur="if(this.value=='') this.value=this.defaultValue;">
						<a id="useTicketButton" href="javascript:void(0);" class="btn-quan ml5" onclick="commitTicket()">使用</a>&nbsp;&nbsp;
						<a href="http://www.shopin.net/help/shopincard.html" title="购物券使用说明"  target="_blank"><img src="../images/ico_mark.gif" width="14" height="14"></a>
						
						<span id="pointFalse" class="point" style="display: none;">购物券不正确！</span>
						<span id="pointTrue" class="point" style="display: none;">使用成功！</span>
						
					</div>
				</c:if>
				<c:if test="${order.paymentModeSid == '4' }">
					<div class="btn-cart fr mt-40"><a href="javascript:void(0);" class="confirm" onclick="toSuccess()">确认订单</a></div>
				</c:if>
			</div>
<c:if test="${order.paymentModeSid != '4' }">
				<div class="yellow">
					<div class="confirm-table mb">
						<div class="confirm-th oz txt-edit">
							<h3 class="fl mr15">支付方式</h3>
						</div>
						<c:set var="cid" value="${cookie.cid.value == null ? '' : cookie.cid.value}"></c:set>
						<c:set var="alipay" value="${cookie.alipayLog.value == null ? '' : cookie.alipayLog.value}"></c:set>
						<div class="confirm-td pr">
						<c:forEach items="${paymentTypeResult }" var="item">
								<h3>${item.name}</h3>
								<div class="pay-card clear oz">
								<ur>
									<c:forEach items="${item.paymentTypeList}" var="bankResult">
											   <li>
													<input id="pay_${bankResult.sid}_${bankResult.flag}" name="pay" type="radio" value="${bankResult.sid}"  flag="${bankResult.flag}">
													<label for="pay_${bankResult.sid}_${bankResult.flag}">
														<div class="bank-info ${bankResult.flag}" id="payicon_${bankResult.sid}">${bankResult.name}</div>
													</label>
												</li>
									</c:forEach>
								</ur>
						</div>
						</c:forEach>
						<div class="clear btn-all">
							<a href="javascript:void(0);" onclick="topay()" class="btn-payment fr ml25" id="open_e">确认支付</a>
							<!--a href="javascript:void(0);" onclick="returnConfirmOrder()" class="fs fr f14 btn-back mt4">返回修改>></a-->
						</div>
					</div>
				</div>
			</div>
</c:if>
				
				<div class="yellow">
				<div class="confirm-table yellow">
					<div class="confirm-th oz txt-edit">
						<h3 class="fl mr15">您的订单内容</h3>
					</div>
					<div class="confirm-td pr clear">
						<div class="confirm-list clear">
							<ul class="list-th oz">
								<li class="w-goods">商品</li>
								<li class="w-size">尺码</li>
								<li class="w-color">颜色</li>
								<li class="w-price">单价</li>
								<li class="w-quantity">数量</li>
							</ul>
<c:forEach items="${order.orderDetails }" var="od">
							<ul class="list-td oz">
								<li class="w-goods"> <a href="../product/${od.proSid}.html" target="_blank"><img src="${od.proPicture}" width="52" height="52"></a> <a href="../product/${od.proSid}.html" target="_blank">${od.proName }</a>
									<div class="txt-gray"><div>编码：${od.proSku }</div><div>市场价：<del>￥${od.originalPrice }</del></div></div>
								</li>
								<li class="w-size">${od.proSize }</li>
								<li class="w-color">${od.proColor }</li>
								<li class="w-price">￥${od.promotionPrice }</li>
								<li class="w-quantity">${od.saleSum }</li>
							</ul>
</c:forEach>
						</div>
					</div>
				</div>
				<!-- 99click转化明细 商品清单代码修改  开始-->
                <%
                    String str="";
                    String detailList = "";
                    int k = 0;
                    OrderVO vo = (OrderVO)request.getAttribute("order");
                    for(Iterator it=vo.getOrderDetails().iterator();it.hasNext();){
                        OrderDetailVO o = (OrderDetailVO)it.next();
                        if(it.hasNext()){
                            str += o.getProSid()+","+o.getSalePrice()+","+o.getSaleSum()+",,"+o.getProColor()+","+o.getProSize()+";";
                        }else{
                             str += o.getProSid()+","+o.getSalePrice()+","+o.getSaleSum()+",,"+o.getProColor()+","+o.getProSize();
                        }
                        if(k==0){
                       		detailList = o.getProDetailSid()+","+o.getSaleSum()+","+o.getSalePrice();
                       }else if(k==1){
                      	   detailList =detailList+","+o.getProDetailSid()+","+o.getSaleSum()+","+o.getSalePrice();
                       }else if(k==2){
                       		detailList =detailList +","+ o.getProDetailSid()+","+o.getSaleSum()+","+o.getSalePrice();
                       }
                        k++;
                    }
                    detailList = vo.getOrderDetails().size() + ","+detailList;
                %>
                <input type="hidden" id="skulist" value="<%=str %>" />
                <input type="hidden" id="getDetailList" value="<%=detailList %>"/>
           	 <!-- 99click转化明细 商品清单代码修改  结束-->
				<div class="yellow">
					<div class="confirm-table yellow mt2 mb">
						<div class="confirm-td pr clear">
							<div class="mt-20">
								<div class="info"><h4>收货人信息</h4>
									<p><span>收货姓名：${order.receptName }</span>         <span>联系电话：${order.receptPhone }</span>         <span>邮政编码：${order.inceptPostcode }</span> </p>   
									<p>收货地址：${order.inceptProvince }${order.inceptCity } ${order.receptAddress } </p>
								</div>
								<div class="info"><h4>配送方式</h4>
									<p>配送方式：${order.sendTypeName }</p>   
									<p>时间要求：${order.memo }</p>
								</div>
								<div class="info"><h4>发票信息</h4>
								<c:choose>
									<c:when test="${order.invoiceBit == '1' }">
										<p>发票抬头：${order.invoiceName }</p>
										<p>发票内容：${order.invoiceDesc }</p>
									</c:when>
									<c:otherwise>
										<p>不需要发票</p>
									</c:otherwise>
								</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>

<!--支付提示-->
<div id="idPop_pay" class="undis" style="padding:40px">
    <p class="mb">请您在新打开的网上银行页面进行支付，支付完成前请不要关闭该窗口。</p>
    <div class="tc"><input class="submit_btn" type="button" onclick="javascript:window.location='${sso}/myshopin/vieworders.html?orderNo=${order.orderNo }&status=view'" value="支付成功"><a class="cancel_btn" href="http://www.shopin.net/help/abcbank.html"  target="_blank">遇到问题</a></div>
</div>

				<div class="cl"></div>
		</div>
</div>
<%@include file="/common/paysuccessfooter.jsp" %>
<script src="${localjs}/jquery.skygqbox.1.3.js"></script>
<script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>
<script src="${js}/jquery/jquery-format-0.1.js" type="text/javascript"></script>
<script>
$(function() {
	$(".tWeixin").hover(function(){
		$(".tCode").show();
	},function(){
		$(".tCode").hide();
	});
	//确认支付提示
	$("#open_e").click(function(){
		$('#idPop_pay').skygqbox({title:'确认支付'});
	});
	$(".btn-payment22").click(function(){
		$('#idPop_pay').skygqbox({title:'确认支付'});
		var payment = $("input:radio[name='pay']:checked").val();
		var url = "${ctx }/order/toPay.html?orderNo=${order.orderNo }&payment=" + payment;
		window.open(url, 'newwindow');
	}); 
}); 
</script>
<script type="text/javascript">
$(function() {
	if ($("input:radio[name='pay']:checked").length == 0) {
		$("input:radio[name='pay']").eq(0).attr("checked", "checked");
	}
});
$(".close").click(function(){
	$(".payment").hide();
});
function topay(){
	$(".payment").show();
	var payment = $("input:radio[name='pay']:checked").val();
	var arr = $("input:radio[name='pay'][checked]");
	if (!arr || arr.length == 0) {
        $.popdialog(button, "cart_paytype_commit", '请选择支付方式');
        return;
    }
    var input = arr.eq(0);
    var defaultbank = input.attr("flag");
	var url = "${ctx }/order/toPay.html?orderNo=${order.orderNo }&payment=" + payment + "&defaultBank=" + defaultbank;
	window.open(url, 'newwindow');
}
function paySuccess(){
	var url = "${ctx }/order/testPayOrder.html?orderNo=${order.orderNo }";
	window.location = url;
}
function toSuccess(){
	var url = "${ctx }/order/toSuccess.html?orderNo=${order.orderNo }";
	window.location = url;
}
// 使用购物券
function commitTicket(button){
	var ticket = $("#ticket").val().toUpperCase();
	var orderMoney = $("#saleMoneySum").html();
	var orderNo = $("#getOrderNo").html();
	$.ajax({
		url : '${ctx}/order/verifyTicket.json',
		type : 'post',
		dataType : 'json',
		data : {
			'sn' : ticket,
			'orderMoney' : orderMoney,
			'orderNo':orderNo
		},
		timeout : 30000,
		error : function() {
			$.popdialog(button, "order_confirm_commit", "购物券验证失败");
            $('#hasUseTicket').val(false);
            $('#pointFalse').show();
            $('#pointTrue').hide();
            return;
		},
		success : function(response) {
			var result = response.result;
            var status = result.status;
            var message = result.message;
            var ticketValue = response.ticketValue;
            if(status == '1') {
            	$('#hasUseTicket').val(true);
            	$('#ticket').attr('disabled',true);
            	//$('#verifyTips').text(message);
            	countAllByTicket(ticketValue);
            	$('#pointTrue').show();
            	$('#pointFalse').hide();
                return;
            } else {
                $('#hasUseTicket').val(false);
                //s$('#verifyTips').text(message);
                $('#pointFalse').show();
                $('#pointTrue').hide();
                return;
            }
		}
	});
};
//根据购物券重新计算订单金额
function countAllByTicket(ticket){
	var saleTotalSum = $("#saleTotalSum").html();
	var saleMoneySum = $("#saleMoneySum").html();
	var sendCost = $("#sendCost").html();
    var totalAmountTicket = (parseFloat(""+saleMoneySum)-parseFloat(ticket)>0)?(parseFloat(""+saleMoneySum)-parseFloat(ticket)):0;
	var orderTotalAmount = totalAmountTicket + parseFloat(sendCost);
	
	$("#saleTotalSum").html(orderTotalAmount.toFixed(2));
	$("#waitPay").html(orderTotalAmount.toFixed(2)+"元");
	$("#ticketValue").html(ticket);
}
</script>
<!--[if IE 6]>
<script src="http://images.shopin.net/s/js/DD_belatedPNG_0.0.8a-min.js"></script> 
<script type="text/javascript"> 
DD_belatedPNG.fix('.png');
</script> 
<![endif]-->


<div style="display:none;">



    <%
        Cookie[] cookies = request.getCookies();
        String ltinfo = "";
        String ltype = "";
        String cid = "";
        String qqlog = "";
        String openid = "";
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("LTINFO")) ltinfo = cookies[i].getValue();
            if (cookies[i].getName().equals("LTYPE")) ltype = cookies[i].getValue();
            if (cookies[i].getName().equals("cid")) cid = cookies[i].getValue();
            if (cookies[i].getName().equals("openid")) openid = cookies[i].getValue();
            if (cookies[i].getName().equals("qqlog")) qqlog = cookies[i].getValue();
        }

		if (ltinfo.length() > 0&&"linktech".equals(ltype) && qqlog.length() > 0 && qqlog.equals(openid)) {
    %>
    <script src='http://service.linktech.cn/purchase_cps.php?a_id=<%=ltinfo%>&m_id=shopin&mbr_id=${order.membersSid}(${order.membersSid})&o_cd=${order.orderNo}&p_cd=${order.orderNo}&price=${order.saleMoneySum}&mbr_name=A100136514<%=openid%>&it_cnt=1&c_cd=01'></script>
	<script src='http://www.shopin.net/extend/updateOrder.html?sid=${order.orderId}&ltinfo=<%=ltinfo%>&ltype=linktech@<%=openid%>'></script>
    <%
        } if (ltinfo.length() > 0&&"linktech".equals(ltype) && (qqlog.length() == 0 || !qqlog.equals(openid))) {
    %>
    <script src='http://service.linktech.cn/purchase_cps.php?a_id=<%=ltinfo%>&m_id=shopin&mbr_id=${order.membersSid}(${order.membersSid})&o_cd=${order.orderNo}&p_cd=${order.orderNo}&price=${order.saleMoneySum}&it_cnt=1&c_cd=01'></script>
    <%
        } if (ltinfo.length() == 0 && qqlog.length() > 0 && qqlog.equals(openid)) {
    %>
    <script src='http://service.linktech.cn/purchase_cps.php?a_id=A100136514<%=openid%>&m_id=shopin&mbr_id=${order.membersSid}(${order.membersSid})&o_cd=${order.orderNo}&p_cd=${order.orderNo}&price=${order.saleMoneySum}&c_cd=qq_login&it_cnt=1'></script>
	<script src='http://www.shopin.net/extend/updateOrder.html?sid=${order.orderId}&ltinfo=A100060164<%=openid%>&ltype=linktech'></script>
    <%
        }if ("shopin-union".equals(ltype)) {
    %>
    <script src="http://union.shopin.net/cpspost.php?orderid=${order.orderNo}&orderpay=${order.saleMoneySum}&ordersn=${order.membersSid}" language="JavaScript" charset="utf-8"></script>
    <%
        } if (cid.startsWith("ad-baidu")) {
    %>
    <noscript>
    <img height="1" width="1" border="0" alt="" style="display:none"
    src="http://analytics.adsage.cn/atac.gif?acc=936&cid=1062&csid=2629&ver=1.0"/>
    </noscript>
    <script type="text/javascript" src="http://analytics.adsage.cn/atac.js"></script>
    <script type="text/javascript">
    <!--
        function TrackSuccess(orderIdValue, priceValue,productIdValue) {
            ataTracker.setAccount("936");
            ataTracker.setConversion("1062", "2629");
            ataTracker.addKey("orderId", orderIdValue);
            ataTracker.addKey("af", priceValue);
            ataTracker.addKey("productId", productIdValue);
            ataTracker.track();
        }
        TrackSuccess('${order.orderNo}', '${order.saleMoneySum}', '${order.orderNo}');
//-->
    </script>

    <%
        }
    %>
</div>

<!-- Google 再营销代码 开始 Date:13-11-26 By:ShuLF-->
<script type="text/javascript">
var google_conversion_id = 990409835;
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
</script>
<div style="display:inline;"><img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/990409835/?value=0&amp;guid=ON&amp;script=0"/></div>
<!-- Google 再营销代码 结束-->

</body>
</html>
