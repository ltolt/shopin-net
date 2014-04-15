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
</head>
<style type="text/css">
.sp-mark-collection {color: red; margin-left:80px;display:none;}
</style>
<body>
<%@include file="/common/cart_header.jsp" %>
<div id="container">
		<div class="in oz">
				<div class="cart-step step2 mt"></div>
				<h2 class="confirm-title">填写并确认订单信息</h2>
				
				<input type="hidden" id="validate_address" value="${validate_address}"/>
				<input type="hidden" id="validate_paytype" value="${validate_paytype}"/>
				<input type="hidden" id="validate_sendtype" value="${validate_sendtype}"/>
				<input type="hidden" id="validate_invoice" value="${validate_invoice}"/>
				<input type="hidden" id="validate_productlist" value="${validate_productlist}"/>
				
				
				<div class="confirm-table address mb">
						<div class="confirm-th oz txt-edit">
								<h3 class="fl mr15">收货人信息</h3><a class="oc-btnReceiving" href="javascript:void(0);">
								<c:choose>
								<c:when test="${order.receptName!=null}">
									修改
								</c:when>
								<c:otherwise>
									取消
								</c:otherwise>
								</c:choose>
								</a>
						</div>
						<div class="confirm-td">
							<ul class="address-list info"<c:if test="${order.receptName==null}">style="display:none"</c:if>>
									<li>收货姓名：${order.receptName}</li>
									<li>联系电话：${order.receptPhone}</li>
									<li>邮政编码：${order.inceptPostcode}</li>
									<li>收货地址：${order.receptAddress}</li>
							</ul>
							<ul class="address-list" <c:if test="${order.receptName!=null}">style="display:none"</c:if>>
									<c:forEach items="${addresslist}" var="item" varStatus="status">
										<li <c:if test="${status.first}">class="selected"</c:if>>
											<input id="addressInfo${item.sid}" name="address" type="radio" value="${item.sid}" >
											${item.recipientName} &nbsp;&nbsp; ${item.province}${item.city}${item.address} &nbsp;&nbsp;${item.mobile}
											<span class="edit">
												<a href="javascript:void(0);" onclick="showAddressEdit(${item.sid});"
													class="address-edit">编辑</a>
												&nbsp;&nbsp;&nbsp;
												<a href="javascript:void(0);" onclick="addressDel(${item.sid});"
													class="address-del">删除</a>
											</span>
											<input id="addr_sid${item.sid}" type="hidden" value="${item.sid}"/>
											<input id="addr_memberSid${item.sid}" type="hidden" value="${item.memberSid}"/>
											<input id="addr_province${item.sid}" type="hidden" value="${item.province}"/>
											<input id="addr_city${item.sid}" type="hidden" value="${item.city}"/>
											<input id="addr_area${item.sid}" type="hidden" value="${item.area}"/>
											<input id="addr_address${item.sid}" type="hidden" value="${item.address}"/>
											<input id="addr_receptName${item.sid}" type="hidden" value="${item.recipientName}"/>
											<input id="addr_mailCode${item.sid}" type="hidden" value="${item.mailCode}"/>
											<input id="addr_mobile${item.sid}" type="hidden" value="${item.mobile}"/>
											<input id="addr_provinceSid${item.sid}" type="hidden" value="${item.provinceSid}"/>
											<input id="addr_citySid${item.sid}" type="hidden" value="${item.citySid}"/>
										</li>
									</c:forEach>
									<li><input id="newAddress" name="address" type="radio" value=""> 使用新地址</li>
									<div class="new-address clear undis">
									<input id="addressSid" type="hidden" value="">
									<ul><li class="li1"><span class="txt-red">*</span>&nbsp;收货人：</li><li><input id="receptName" type="text" value=""></li></ul>
									<div class="sp-mark-collection">
											<span class="sp-mark">请填写收货人姓名</span>
									</div>
									<ul><li class="li1"><span class="txt-red">*</span>&nbsp;所在地区：</li><li>
											<label for="select2"></label>
											<select name="select2"onChange="selectProvince()" id="provincelist">
													<option value="">请选择</option>
													<c:forEach items="${provincelist}" var="pro">
													<option value="${pro.sid}">${pro.province}</option>
													</c:forEach>
											</select>
											<select name="select" onChange="selectCity()" id="citylist">
													<option>请选择</option>
											</select>
									</li>
									</ul>
									<div class="sp-mark-collection">
											<span class="sp-mark">请选择省份和城市</span>
									</div>
									<ul><li class="li1"><span class="txt-red">*</span>&nbsp;详细地址：</li>
											<li><input name="" id="detailAddr" type="text" size="50"></li></ul>
									<div class="sp-mark-collection">
											<span class="sp-mark">请填写收货地址</span>
									</div>
									<ul>
											<li class="li1"><span class="txt-red">*</span>&nbsp;手机：</li>
											<li><input name="" type="text" id="phone"></li>
									</ul>
									<div class="sp-mark-collection">
											<span class="sp-mark">手机号码填写不正确，为便于送货时及时联系您，请填写正确手机号码</span>
									</div>
									<ul>
									
											<li class="li1">邮编：</li>
											<li><input id="mailCode" name="" type="text"></li></ul>
											<ul><li class="save-invoice ml60 mt4"><a onClick="commitAddress(this);" href="javascript:void(0);">保存收货人信息</a></li></ul>
									</div>
							</ul>
								
						</div>
				</div>
				<div class="confirm-table mb">
						<div class="confirm-th oz txt-edit">
								<h3 class="fl mr15">支付方式</h3>
						</div>
						<div class="confirm-td">
								<ul class="confirm-pay payment">
										<li class="selected"><label><input name="payType" type="radio" value="100" checked>在线支付        <em>即时到帐，支持绝大数银行借记卡、部分银行信用卡及支付宝</em>&nbsp;&nbsp;<a href="">查看银行及限额</a></label></li>
										<li><label><input name="payType" type="radio" value="4">货到付款        <em>送货上门后再收款，支持现金、POS机刷卡、支票支付</em>&nbsp;&nbsp;<a href="">查看服务及配送范围</a></label></li>
								</ul>
						</div>
				</div>
				<div class="confirm-table mb">
						<div class="confirm-th oz txt-edit">
								<a href="" class="fr">查看运费及送达时间详情>></a><h3 class="fl mr15">配送方式</h3>
								(大件类超重物品根据商品实际重量需另行加收运费，敬请理解)
						</div>
						<div class="payDetail">
							<div class="confirm-td item">
									<ul>
										<li>配送方式：
										<c:forEach items="${sentTypeMap}" var="item" varStatus="status">
											<i><input name="sentType" type="radio" value="${item.key }" <c:if test="${status.index==0}">checked</c:if> >${item.value }</i>
										</c:forEach>
										</li>
									</ul>
									<ul class="distr-time pr"><u>配送时间：</u>
										<li><input name="time1" type="radio" value="工作日、双休日与假日均可送货" checked>工作日、双休日与假日均可送货</li>
										<li><input name="time1" type="radio" value="只双休日、假日送货(工作日不用送)">只双休日、假日送货(工作日不用送)</li>
										<li><input name="time1" type="radio" value="只工作日送货(双休日、假日不用送) (注：写字楼/商用地址客户请选择)">只工作日送货(双休日、假日不用送) (注：写字楼/商用地址客户请选择) </li>
										<li><input name="time1" type="radio" value="学校地址/地址白天没人，请尽量安排其他时间送货 (注：特别安排可能会超出预计送货天数)">学校地址/地址白天没人，请尽量安排其他时间送货 (注：特别安排可能会超出预计送货天数) </li>
									</ul>
									<ul><li class="save-invoice ml60 mt4"><a href="javascript:void(0);"  onClick="commitPaySendtype(this);">保存支付及配送方式</a></li></ul>
							</div>
							<div class="confirm-td item">
									<ul><li>配送方式：由上品选择合适的配送方式      运费：${sendcost}&nbsp;元</li></ul>
									<ul class="distr-time pr"><u>配送时间：</u>
										<li><input name="time2" type="radio" value="工作日、双休日与假日均可送货" checked>工作日、双休日与假日均可送货</li>
										<li><input name="time2" type="radio" value="只双休日、假日送货(工作日不用送)">只双休日、假日送货(工作日不用送)</li>
										<li><input name="time2" type="radio" value="只工作日送货(双休日、假日不用送) (注：写字楼/商用地址客户请选择)">只工作日送货(双休日、假日不用送) (注：写字楼/商用地址客户请选择) </li>
										<li><input name="time2" type="radio" value="学校地址/地址白天没人，请尽量安排其他时间送货 (注：特别安排可能会超出预计送货天数)">学校地址/地址白天没人，请尽量安排其他时间送货 (注：特别安排可能会超出预计送货天数) </li>
									</ul>
									<ul><li class="save-invoice ml60 mt4"><a href="javascript:void(0);"  onClick="commitPaySendtype(this);">保存支付及配送方式</a></li></ul>
							</div>
							<div class="confirm-td info">
								<ul class="sendtype-list info">
									<li>配送方式：</li>
									<li>运费：</li>
									<li>配送时间：</li>
								</ul>
							</div>
						</div>
				</div>
				
				<div class="confirm-table mb">
						<div class="confirm-th oz txt-edit">
								<h3 class="fl mr15">发票信息</h3><a href="#">修改>></a>
						</div>
						<div class="confirm-td">
								<ul>
										<li>发票抬头：<i><input name="fapiao" type="radio" value="">个人</i><i><input name="fapiao" type="radio" value="" checked>单位
												<input type="text" name="textfield" id="textfield" class="input-invoice"></i>
										</li>
										<li>发票内容：<i><input name="fn" type="radio" value="" checked>体育用品</i><i><input name="fn" type="radio" value="">服装</i><i><input name="fn" type="radio" value="">包</i><i><input name="fn" type="radio" value="">鞋</i><i><input name="fn" type="radio" value="">礼品</i></li>
										<li class="save-invoice ml60 mt4"><a href="">保存发票信息</a></li>
								</ul>
						</div>
				</div>
				<div class="confirm-table mb">
						<div class="confirm-th oz txt-edit">
								<a href="#" class="fr">返回购物车修改>></a><h3 class="fl mr15">商品清单</h3>
						</div>
						<div class="confirm-td pr clear">
								<div class="confirm-list clear">
								<ul class="list-th oz">
										<li class="w-goods">商品</li>
										<li class="w-size">尺码</li>
										<li class="w-color">颜色</li>
										<li class="w-price">单价</li>
										<li class="w-quantity">数量</li>
										<li class="w-action">操作</li>
								</ul>
								<c:forEach items="${cartItem}" var="item" varStatus="status">
									<ul class="list-td oz">
										<li class="w-goods"> <a href=" "><img src="${item.proPicture}" } width="56" height="56"></a> <a href="">${item.name}</a>
												<div class="txt-gray"><div>编码：${item.positionId}</div><div>市场价：<del>￥${item.originalPrice}</del></div></div>
										</li>
										<li class="w-size">${item.size}</li>
										<li class="w-color">${item.color}</li>
										<li class="w-price">￥${item.promotionPrice}</li>
										<li class="w-quantity">${item.qty}</li>
										<li class="w-action"><a href="">删除</a>&nbsp;&nbsp;<a href="">收藏</a></li>
									</ul>
									<input id="saleCount" type="hidden" value="${item.qty}">
								</c:forEach>
						<div class="confirm-total oz clear"><ul class="fl">
								<li><b>使用上品购物券：</b><input type="text" name="textfield" id="textfield" class="input-invoice"><a href="" class="btn-confirm">确定</a>&nbsp;&nbsp;<a href="#">查看我的购物券</a></li></ul>
						<ul class="fr"><li><span class="li1"><u class="txt-red">${totalCount}</u> 件商品，总商品金额：</span><span>￥${totalMoney}</span></li>
								<li><span class="li1">运费：</span><span>￥6.00</span></li>
								<li><span class="li1">购物券优惠：</span><span>￥0.00</span></li>
								<li><span class="li1">应付总额：</span><span>￥</span></li>
								</ul>
						</div>
						<div class="account-total f14 fb clear">
						<div class="btn-cart fr"><a class="order" onClick="commitOrder(this);" href="javascript:void(0);">提交订单</a></div><div class="fr mr15">应付总额：<span class="f16 txt-red">￥306.00</span>&nbsp;元</div>
						</div>
						</div>
				</div>
				
				<div class="cl"></div>
		</div>
</div>
<%@include file="/common/footer.jsp" %>
<script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>
<script language="javascript">  
	$(function(){
		$(".payment li").click(function(){
			$(this).children(":input:checked");
			$(this).addClass("selected").siblings().removeClass("selected");
		});
	});
</script>
<script language="javascript">  
	$(function(){
		$(".address-list li").click(function(){
			$(this).children(":input:checked");
			$(this).addClass("selected").siblings().removeClass("selected");
		});
	});
</script>
<script>
$(function(){
	$(".payDetail .item:not(:first)").hide();
	$(".payDetail .info").hide();
	function tabs(tabTit,on,tabCon){
			$(tabCon).each(function(){
				$(this).children().eq(0).show();
			});
			$(tabTit).each(function(){
				$(this).children().eq(0).addClass(on);
			});
			$(tabTit).children().click(function(){
				$(this).addClass(on).siblings().removeClass(on);
				var index = $(tabTit).children().index(this);
				$(tabCon).children().eq(index).show().siblings().hide();
		});
	}
	tabs(".payment","cur",".payDetail");
});
</script>
<script type="text/javascript">

//核对订单信息后确认订单
function commitOrder(button){
	if(!validateOrder(button)) {
		return ;
	}
	
	var sn = getOrderSn(button);
	if(sn == 'validate_sn_error') {
		return ;
	}
	$.ajax({
		url : '${ctx}/order/commit.json',
		type : 'post',
		dataType : 'json',
		data : {
			'sn' : sn
		},
		timeout : 30000,
		error : function() {
			$.popdialog(button, "order_confirm_commit", '确认订单失败，可能原因是库存不足，请检查商品库存量和购买数量');
            var url = '${ctx}/order/confirm.html'
            window.location = url;
            return ;
		},
		success : function(response) {
			var result = response.result;
            var status = result.status;
            var message = result.message;
            if(status == '1') {
            	var orderId = response.orderId;
                //清空Cookie 删除cookie中已经购买的商品的明细
                setcookie("cart_item_details","",86400,"/","www.shopin.net","");
                setcookie("pre_order_id","",86400,"/","www.shopin.net","");
                var url = '${ctx}/orderpay/' + orderId + '.html'
                window.location = url;
            } else {
            	$.popdialog(button, "order_confirm_commit", message);
                if (status == '01') {
                    window.setTimeout(function() {
                        window.location = '${ctx}/.html';
                    }, 5000);
                }
            }
            return ;
		}
	});
}

//获取购物券
function getOrderSn(button){
    var sn ='';
    var useTicket = $('.oc-on');
    var flag = $('#hasUseTicket').val();
    if(useTicket.size() > 0 && flag == 'false') {
    	$.popdialog(button, "order_confirm_commit","请先验证购物券");
    	return 'validate_sn_error';
    }
    if(flag == 'true'){
        sn = $('#ticket').val();
    }
    return sn;

}

//校验订单信息是否填写正确
function validateOrder(button) {
	/* if ($("#validate_address").val() == 'false') {
		$.popdialog(button, "validate_info", "您还没有填写收货地址");
		return false;
	}
	if ($("#validate_invoice").val() == 'false') {
        $.popdialog(button, "validate_info", "您还没有填写发票信息");
        return false;
    } 
    if ($("#validate_paytype").val() == 'false') {
        $.popdialog(button, "validate_info", "您还没有选择支付方式");
        return false;
    }*/
    if ($("#validate_sendtype").val() == 'false') {
        $.popdialog(button, "validate_info", "您还没有选择配送方式");
        return false;
    }
    return true;
}

// 获取地址信息
function getAddressData() {
	var address = {};

	address.sid = $("#addressSid").val();
	address.name = $.trim($("#receptName").val());
	address.deliProvinceSid = $("#provincelist").val();
	address.provinceName = $("#provincelist option:selected").eq(0).html();
	address.deliCitySid = $("#citylist").val();
	address.cityName = $("#citylist option:selected").eq(0).html();
	address.address = $.trim($("#detailAddr").val());
	address.postcode = $.trim($("#postcode").val());
	address.tel = $.trim($("#phone").val());
	address.newoption = '1';

	return address;
}
<%--选择省份--%>
function selectProvince() {
	var province = $("#provincelist");
	var city = $("#citylist");
	var value = province.val();
	if (value == '') {
		return;
	}
	var provinceName = $("#provincelist").children("option[selected]").eq(0)
			.html();
	province.attr("provinceName", provinceName);
	$.ajax({
		url : '${ctx}/order/getCities.json',
		type : 'get',
		data : {
			'provinceSid' : value
		},
		dataType : 'json',
		timeout : 30000,
		success : function(response) {
			var result = response.citylist;
			city.html("<option value=''>请选择</option>");
			for ( var i = 0; i < result.length; i++) {
				var ele = result[i];
				var option = $("<option value='" + ele['sid'] + "'>"
						+ ele['city'] + "</option>");
				option.attr("freight", ele['freight']);
				option.attr("cityname", ele['name']);
				option.appendTo(city);
			}
			return;
		}
	});
}
// 添加新地址
function addressDel(sid) {
	$.ajax({
		url : '${ctx}/order/delAddress.json',
		type : 'get',
		data : {
			'sid' : sid
		},
		dataType : 'json',
		timeout : 30000,
		success : function(response){
			console.log(response);
			if(response.success){
				alert("删除成功");
			}else{
				alert("删除失败");
			}
			
		}
	});
}
function showAddressEdit(sid) {
	$(".new-address").show();
	$("#addressSid").val($("#addr_sid" + sid).val());
	$("#receptName").val($("#addr_receptName" + sid).val());
	var value = $("#addr_provinceSid" + sid).val();
	$("#provincelist").val(value);
	$.ajax({
		url : '${ctx}/order/getCities.json',
		type : 'get',
		data : {
			'provinceSid' : value
		},
		dataType : 'json',
		timeout : 30000,
		success : function(response) {
			var result = response.citylist;
			var city = $("#citylist");
			city.html("<option value=''>请选择</option>");
			for ( var i = 0; i < result.length; i++) {
				var ele = result[i];
				var option = $("<option value='" + ele['sid'] + "'>"
						+ ele['city'] + "</option>");
				option.attr("freight", ele['freight']);
				option.attr("cityname", ele['name']);
				option.appendTo(city);
			}
			$("#citylist").val($("#addr_citySid" + sid).val());
		}
	});
	$("#detailAddr").val($("#addr_address" + sid).val());
	$("#phone").val($("#addr_mobile" + sid).val());
	$("#mailCode").val($("#addr_mailCode" + sid).val());
}
// 确定配送地址
function commitAddress(button) {
	if (!validateAddress(button)) {
		return;
	}
	var address = getAddressData();
	var url = '${ctx}/order/newAddress.json';
	$.ajax({
		url : url,
		type : 'post',
		dataType : 'json',
		data : {
			sid: address.sid,
			receptName : address.name,
			provinceSid : address.deliProvinceSid,
			provinceName : address.provinceName,
			citySid : address.deliCitySid,
			cityName : address.cityName,
			address : address.address,
			postcode : address.postcode,
			phone : address.tel
		},
		timeout : 30000,
		error : function() {
			alert("保存地址失败，请稍后重试。");
		},
		success : function(response) {
			console.log(response);
			var result = response.success;
			if (result) {
				alert("保存地址信息成功。");
			} else {
				alert("保存地址信息失败。");
			}
		}
	});
}
</script>
<script>
$(function() {
	var $receivingBtn = $(".oc-btnReceiving");
	$receivingBtn.click(function() {
		console.log("a");
	});
	// 收货人信息
	var editBtn = $(".address .txt-edit a");
	var editCon = $(".address-list");
	editBtn.click(function() {
		editCon.toggle();
		if ($(this).text() == '修改>>') {
			$(this).text("取消>>");
		} else {
			$(this).text("修改>>");
		}
	});
	var addNewAddress = $(".new-address");
	$(".address-list input:radio").each(function() {
		if ($("#newAddress").attr("checked") == true)
			addNewAddress.show();
		$(this).click(function() {
			if ($("#newAddress").attr("checked") == true) {
				addNewAddress.show();
			} else {
				addNewAddress.hide();
			}
		});
	});
});
// 校验收货地址信息
function validateAddress(button) {

	var address = getAddressData();
	var flag = true;
	var msgs = $(".sp-mark-collection");
	if (address.name == '') {
		msgs.eq(0).show();
		flag = false;
	} else {
		msgs.eq(0).hide();
	}
	if (address.deliProvinceSid === '') {
		msgs.eq(1).show();
		flag = false;
	}
	if (address.deliCitySid == '' || address.deliCitySid === '请选择') {
		msgs.eq(1).show();
		flag = false;
	} else {
		msgs.eq(1).hide();
	}
	if (address.address == '') {
		msgs.eq(2).show();
		flag = false;
	} else {
		msgs.eq(2).hide();
	}
	if (!/^\d{11,12}$/.test(address.tel)) {
		msgs.eq(3).show();
		flag = false;
	} else {
		msgs.eq(3).hide();
	}
	return flag;
}

<%-- 保存支付和配送方式 --%>
function commitPaySendtype(button){
	// 获取支付方式、配送方式、配送时间的值
	var payType = $('input[name="payType"]:checked').val();
	var paymentModeName, sendType, sendTypeName, sentTime;
	if('4'==payType){
		paymentModeName = '货到付款';
		sendType = '4';
		sendTypeName = '由上品选择合适的配送方式';
		sentTime = $('input[name="time2"]:checked').val();
	}else{
		paymentModeName = '在线支付';
		sendType = $('input[name="sentType"]:checked').val();
		//alert($('.payDetail '));
		sendTypeName = $('input[name="sentType"]:checked').val();
		sentTime = $('input[name="time1"]:checked').val();
	}
	
	$.ajax({
		url:'${ctx}/order/savePayAndSendType.json',
		type:'post',
		dataType:'json',
		data:{
			'paymentModeSid': payType,
			'paymentModeName' : paymentModeName,
			'sendType' : sendType,
			'sendTypeName' : sendTypeName,
			'memo' : sentTime
		},
		timeout: 30000,
		error: function(){
			$.popdialog(button,"validate_sendtype","保存配送方式失败，请重试");
			return;
		},
		success: function(response){
			var result = response.result;
			var status = result.status;
			var message = result.message;
			var order = response.order;
			if(status != '1'){
				$.popdialog(button,"validate_sendtype","保存配送方式失败，请重试");
				//$.popdialog(button,"validate_sendtype",message);
				return;
			}else if(status == '1'){
				$("#validate_sendtype").attr("value", "true");
				$(".payDetail .info").show();
				$(".payDetail .item").hide();
				
				$(".sendtype-list").children().eq(0).append(order.sendTypeName);	
				$(".sendtype-list").children().eq(1).append(${sendCost} "元");	
				$(".sendtype-list").children().eq(2).append(order.memo);	
			} 
			return;
		}
	});




}
</script>
</body>
</html>