<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Access-Control-Allow-Origin" content="*">
<title>上品折扣网 - 实体店应季正品保障，全网底价折扣特卖</title>
<link href="${localcss}/reset.css" rel="stylesheet" type="text/css">
<link href="${localcss}/layout.css" rel="stylesheet" type="text/css">
<link href="${localcss}/cart.css" rel="stylesheet" type="text/css">
<script src="${localjs }/jquery132min.js"></script>
<script>
$(function() {
$(".tWeixin").hover(
	function(){
		$(".tCode").show();
	},function(){
		$(".tCode").hide();
	}
);
$(".btn-payment").click(
	function(){
		$(".payment-success").show();
		var payment = $("input:radio[name='pay']:checked").val();
		var url = "${ctx }/order/toPay.html?orderNo=${order.orderNo }&payment=" + payment;
		window.open(url, 'newwindow');
	}
);
$(".close").click(
	function(){
		$(".payment-success").hide();
	}
);
});
</script>
<script type="text/javascript">
$(function() {
	if ($("input:radio[name='pay']:checked").length == 0) {
		$("input:radio[name='pay']").eq(0).attr("checked", "checked");
	}
});
</script>
<script type="text/javascript">
//搜索
function dosearch() {
	var keyword = $("#search-key").val().trim();
	if (keyword == "请输入搜索内容") {
		$("#search-key").focus();
		return;
	}
	if (keyword != null && keyword != "" && keyword != "请输入搜索内容") {
		var href = '${searchDomain}/search.html?keyword=' + keyword;
		window.open(href, 'newwindow');
	}
};
$(function() {
$("#search-key").keyup(
	function(event) {
		if (event.keyCode<41 && event.keyCode>37) {
			return;
		}
		var key = this.value;
		$.ajax({
			url : '${ctx}/hotkey.json',
			type : 'post',
			dataType: 'json',
			data : {
				key : key
			},
			timeout : 30000,
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				index = -1;
				return;
			},
			success : function(response) {
				index = -1;
				var result = response.result;
				var status = result.status;
				var message = result.message;
				if("" == message) {
					$("#select").html("");
				} else if (status && status == '1') {
					var dataObj = eval("(" + message + ")");//转换为json对象
					if (dataObj.success) {
						var list = dataObj.data.rs;
						$("#select a").remove();
						for ( var i = 0; i < list.length; i++) {
							$("<a href='javascript:void(0);' onclick='aclickhot(this);'></a>")
								.text(list[i]).attr('flag', i).appendTo($("#select"));
						}
						$("#select")[0].size = list.length;
						$("#select").show();
					} else {
						$("#select").hide();
					}
				}
			}
		});
	}
);
$("#search-key").keydown(
	function(event) {
		if (event.keyCode == 13) {//Enter 
			dosearch();
			$("#search-key").blur();
			$("#select").hide();
		}
		var size = $("#select a").length;
		if (event.keyCode == 38) {
			index = index-1;
			if(index < 0) {
				index = size-1;
			}
			$("#select a").eq(index).addClass("selectA")
				.siblings().removeClass("selectA");
			var text = $("#select a").eq(index).text();
			$('#search-key').val(text);
		}
		if (event.keyCode == 40) {
			index = index+1;
			if(index >= size) {
				index = index%size;
			}
			$("#select a").eq(index).addClass("selectA")
				.siblings().removeClass("selectA");
			var text = $("#select a").eq(index).text();
			$('#search-key').val(text);
		}
	}
);
$("#search-key").focus(
	function() {
		if (this.value == "请输入搜索内容") {
			this.value = "";
			this.style.color = "#333";
		}
	}
);
$("#search-key").blur(
	function() {
		if (this.value == "") {
			this.value = "请输入搜索内容";
			this.style.color = "#888";
		} else {
			this.style.color = "#333";
		}
	}
);
});
</script>
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
			<div class="cart-step step3 mt"></div>
			<div class="buy-success mt mb pr">
				<h2 class="pr">
					<i class="ico-success"></i>您的订单已提交成功，请您尽快付款！
				</h2>
				<p>您的订单号：${order.orderNo }
					<u>|</u> 订单总金额：
					<span class="txt-red fb">￥${waitpay }</span>
					<u>|</u> 商品总金额：
					<span class="txt-red fb">￥${order.saleMoneySum }</span>
					<u>|</u> 运费：
					<span class="txt-red fb">￥${order.sendCost }</span>
<c:if test="${not empty gwqmzh }">
					<u>|</u> 购物券：${gwqmzh}元
</c:if>
<c:if test="${not empty manjian }">
					<u>|</u> 满减：-${manjian}元
</c:if>
				</p>
				<p>立即支付
					<span class="txt-red fb">${waitpay }元</span>，即可完成订单。 请您在
					<span class="txt-red">1小时</span> 内完成支付，否则订单会被自动取消。
				</p>
			</div>
			<div class="yellow">
				<div class="confirm-table mb">
					<div class="confirm-th oz txt-edit">
						<h3 class="fl mr15">支付方式</h3>
					</div>
<c:set var="cid" value="${cookie.cid.value == null ? '' : cookie.cid.value}"></c:set>
<c:set var="alipay" value="${cookie.alipayLog.value == null ? '' : cookie.alipayLog.value}"></c:set>
					<div class="confirm-td pr">
						<div>请选择在线支付的方式：</div>
						<h3>第三方支付平台<u>（支持多家第三方支付，如：支付宝）</u></h3>
						<div class="pay-card clear oz">
							<ul>
<c:if test="${cid eq 'tenpay101125tgcxhd' }">
	<c:forEach items="${paymentTypeList }" var="item">
		<c:if test="${item.sid eq '10' }">
								<li>
									<input id="pay_${item.sid }" name="pay" type="radio" value="${item.sid }" checked="checked">
									<label for="pay_${item.sid }">
										<div class="bank-info" id="payicon_${item.sid }">${item.name }</div>
									</label>
								</li>
		</c:if>
	</c:forEach>
</c:if>
<c:if test="${cid ne 'tenpay101125tgcxhd' }">
	<c:if test="${alipay eq 'alipay' }">
		<c:forEach items="${paymentTypeList }" var="item">
			<c:if test="${item.sid eq '3' }">
								<li>
									<input id="pay_${item.sid }" name="pay" type="radio" value="${item.sid }" checked="checked">
									<label for="pay_${item.sid }">
										<div class="bank-info" id="payicon_${item.sid }">${item.name }</div>
									</label>
								</li>
			</c:if>
		</c:forEach>
	</c:if>
	<c:if test="${empty alipay || alipay ne 'alipay' }">
		<c:if test="${cid eq 'shopin-cmb' }">
			<c:forEach items="${paymentTypeList }" var="item">
				<c:if test="${item.sid eq '13' }">
								<li>
									<input id="pay_${item.sid }" name="pay" type="radio" value="${item.sid }" checked="checked">
									<label for="pay_${item.sid }">
										<div class="bank-info" id="payicon_${item.sid }">${item.name }</div>
									</label>
								</li>
				</c:if>
			</c:forEach>
		</c:if>
		<c:if test="${empty cid || cid ne 'shopin-cmb' }">
			<c:forEach items="${paymentTypeList }" var="item">
				<c:if test="${item.paymentTypeClassSid eq '1' }">
					<c:if test="${item.name ne '货到付款' }">
								<li>
									<input id="pay_${item.sid }" name="pay" type="radio" value="${item.sid }"
						<c:if test="${item.sid eq order.paymentModeSid }">
										checked="checked"
						</c:if>
										>
									<label for="pay_${item.sid }">
										<div class="bank-info" id="payicon_${item.sid }">${item.name }</div>
									</label>
								</li>
					</c:if>
				</c:if>
			</c:forEach>
		</c:if>
	</c:if>
</c:if>
							</ul>
						</div>
						<h3>信用卡快捷支付<u>（无需开通网银，有卡就能付）</u></h3>
						<div class="pay-card clear oz">
							<ul>
								<li>
									<input id="pay_17_CMB" name="pay" type="radio" value="17" flag="CMB">
									<label for="pay_17_CMB">
										<div class="bank-info CMB" id="pay13">招商银行</div>
									</label>
								</li>
								<li>
									<input id="pay_17_CCB" name="pay" type="radio" value="17" flag="CCB">
									<label for="pay_17_CCB">
										<div class="bank-info CCB">建设银行</div>
									</label>
								</li>
								<li>
									<input id="pay_17_ICBC" name="pay" type="radio" value="17" flag="ICBC">
									<label for="pay_17_ICBC">
										<div class="bank-info ICBC" id="pay11">中国工商银行</div>
									</label>
								</li>
								<li>
									<input id="pay_17_BOC" name="pay" type="radio" value="17" flag="BOC">
									<label for="pay_17_BOC">
										<div class="bank-info BOC">中国银行</div>
									</label>
								</li>
								<li>
									<input id="pay_17_ABC" name="pay" type="radio" value="17" flag="ABC">
									<label for="pay_17_ABC">
										<div class="bank-info ABC">农业银行</div>
									</label>
								</li>
								<li>
									<input id="pay_17_CEB" name="pay" type="radio" value="17" flag="CEB">
									<label for="pay_17_CEB">
										<div class="bank-info CEB">光大银行</div>
									</label>
								</li>
							</ul>
						</div>
						<h3>借记卡快捷支付<u>（无需开通网银，有卡就能付）</u></h3>
						<div class="pay-card clear oz">
							<ul>
								<li>
									<input id="pay_19_CCB" name="pay" type="radio" value="19" flag="CCB">
									<label for="pay_19_CCB">
										<div class="bank-info CCB">中国建设银行</div>
									</label>
								</li>
								<li>
									<input id="pay_19_ICBC" name="pay" type="radio" value="19" flag="ICBC">
									<label for="pay_19_ICBC">
										<div class="bank-info ICBC">中国工商银行</div>
									</label>
								</li>
								<li>
									<input id="pay_19_BOC" name="pay" type="radio" value="19" flag="BOC">
									<label for="pay_19_BOC">
										<div class="bank-info BOC">中国银行</div>
									</label>
								</li>
								<li>
									<input id="pay_19_ABC" name="pay" type="radio" value="19" flag="ABC">
									<label for="pay_19_ABC">
										<div class="bank-info ABC">中国农业银行</div>
									</label>
								</li>
								<li>
									<input id="pay_19_CEB" name="pay" type="radio" value="19" flag="CEB">
									<label for="pay_19_CEB">
										<div class="bank-info CEB">中国光大银行</div>
									</label>
								</li>
							</ul>
						</div>
						<h3>网上银行</h3>
						<div class="pay-card clear oz">
							<ul>
<c:forEach items="${paymentTypeList }" var="item">
	<c:if test="${item.paymentTypeClassSid eq '3' }">
		<c:if test="${item.name ne '货到付款' }">
								<li>
									<input id="pay_${item.sid }" name="pay" type="radio" value="${item.sid }"
			<c:if test="${item.sid eq order.paymentModeSid }">
										checked="checked"
			</c:if>
										>
									<label for="pay_${item.sid }">
										<div class="bank-info" id="payicon_${item.sid }">${item.name }</div>
									</label>
							</li>
		</c:if>
	</c:if>
</c:forEach>
							</ul>
						</div>
						<h3>找人代付</h3>
						<div class="pay-card clear oz">
							<ul>
<c:forEach items="${paymentTypeList }" var="item">
	<c:if test="${item.paymentTypeClassSid eq '6'}">
		<c:if test="${item.name ne '货到付款' }">
								<li>
									<input id="pay_${item.sid }" name="pay" type="radio" value="${item.sid }"
			<c:if test="${item.sid eq order.paymentModeSid }">
										checked="checked"
			</c:if>
										>
									<label for="pay_${item.sid }">
										<div class="bank-info" id="payicon_${item.sid }">${item.name }</div>
									</label>
							</li>
		</c:if>
	</c:if>
</c:forEach>
							</ul>
						</div>
						<div class="clear btn-all">
							<a href="javascript:void(0);" class="btn-payment fr ml25">确认支付</a>
							<a href="" class="f14 fs fr mt4">返回>></a>
						</div>
					</div>
				</div>
			</div>
			<div class="payment-success undis">
				<div>
					<a href="javascript:void(0);" class="close">关闭</a>
					<h2 class="f14">支付</h2>
					<p class="ml5">请您在新打开的网上银行页面进行支付，支付完成前请不要关闭该窗口。</p>
				</div>
				<div class="btn-apply mt20 pl25">
					<a class="confirm" href="#">支付成功</a>
					<a class="cancel1" href="#">遇到问题</a>
				</div>
			</div>
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
								<li class="w-goods">
									<a>
										<img src="${images }" width="52" height="52">
									</a>
									<a>${od.proName }</a>
									<div class="txt-gray">
										<div>编码：${od.proSku }</div>
										<div>市场价：<del>￥${od.originalPrice }</del></div>
									</div>
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
			</div>
			<div class="yellow">
				<div class="confirm-table yellow mt2 mb">
					<div class="confirm-td pr clear">
						<div class="mt-20">
							<div class="info">
								<h4>收货人信息</h4>
								<p>
									<span>收货姓名：${order.receptName }</span>
									<span>联系电话：${order.receptPhone }</span>
									<span>邮政编码：${order.inceptPostcode }</span>
								</p>
								<p>收货地址：${order.inceptProvince }
								${order.inceptCity } ${order.receptAddress } </p>
							</div>
							<div class="info">
								<h4>配送方式</h4>
								<!--p>配送方式：由上品根据订单的收货地址选择合适的快递方式</p-->
								<p>配送方式：${order.sendTypeName }</p>
								<p>时间要求：${order.memo }</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="cl"></div>
		</div>
	</div>
	<jsp:include page="/common/footer.jsp"/>
</body>
</html>