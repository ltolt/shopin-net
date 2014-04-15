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
<body>
<%@include file="/common/cart_header.jsp" %>
<div id="container">
		<div class="in oz">
				<div class="cart-step step2 mt"></div>
				<h2 class="confirm-title">填写并确认订单信息</h2>
				
				<input type="hidden" id="validate_address" value="${validate_address}"/>
				<input type="hidden" id="validate_send_pay_type" value="${validate_sendtype}"/>
				<input type="hidden" id="validate_invoice" value="${validate_invoice}"/>
				<input type="hidden" id="validate_productlist" value="${validate_productlist}"/>
				
				
				<div class="confirm-table address mb">
				<div class="confirm-th oz txt-edit">
						<h3 class="fl mr15">收货人信息</h3><a class="oc-btnReceiving" href="javascript:void(0);">修改>></a>
				</div>
				<div class="confirm-td clear">
					<div class="address-list info" <c:if test="${order.receptName==null}">style="display:none"</c:if>>
						<ul class="address-info">
								<li>收货姓名：${order.receptName}</li>
								<li>联系电话：${order.receptPhone}</li>
								<li>邮政编码：${order.inceptPostcode} </li>
								<li>收货地址： ${order.receptAddress}</li>
						</ul>
					</div>
					<div class="address-list item" <c:if test="${order.receptName!=null}">style="display:none"</c:if>>
						<ul class="addAddressBox">
								<c:forEach items="${addresslist}" var="item" varStatus="status">
									<li id="li${item.sid}" <c:if test="${status.first}">class="selected"</c:if>>
										<input id="addressInfo${item.sid}" name="address" type="radio" value="${item.sid}" >
										${item.recipientName} &nbsp;&nbsp; ${item.province}${item.city}${item.address} &nbsp;&nbsp;${item.mobile}
										<span class="edit">
											<a href="javascript:void(0);" onclick="showAddressEdit(${item.sid});"
												class="address-edit">编辑</a>
											&nbsp;&nbsp;&nbsp; 
											<a href="javascript:void(0);" value=""
												class="address-del" onclick="addressDel(${item.sid});">删除</a>
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
								<li class="newAddress"><input id="newAddress" name="address" type="radio" value=""> 使用新地址</li>
								<div class="new-address clear undis">
								<input type="hidden" id="addressSid" value="" />
								<ul><li class="li1"><span class="txt-red">*</span>&nbsp;收货人：</li><li><input name="" id="receptName" type="text"><span class="point">此项必填，请填写收货人</span></li></ul>
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
								<ul><li class="li1"><span class="txt-red">*</span>&nbsp;详细地址：</li>
									<li><input type="text" size="50" name="" id="detailAddr"></li></ul>
								<ul>
										<li class="li1"><span class="txt-red">*</span>&nbsp;手机：</li>
										<li><input name="" type="text" id="phone"></li></ul>
								<ul>
										<li class="li1">邮编：</li>
										<li><input name="" id="mailCode" type="text"></li></ul>
								<ul><li><input type="button" value="保存收货人信息" onClick="commitAddress(this);" class="btn-save"></li></ul>
								</div>
								<div class="save-invoice mt4 ml"><a onClick="selectAddress(this);" href="javascript:void(0);"><span>配送到这个地址</span></a></div>
						</ul>
					</div>
				</div>
				<div class="delete-list tc undis">
			<h3 class="f14 mb">您确认删除此项吗？</h3>
			<div class="btn-apply"><a href="javascript:void(0);" onclick="addressDelSubmit()" class="submit">确定</a><a href="javascript:void(0);" class="cancel">取消</a></div>
			</div>
		</div>
			<div class="confirm-table distr mb">
				<div class="confirm-th oz txt-edit">
						<h3 class="fl mr15">支付及配送方式</h3><a class="oc-btndistr" href="javascript:void(0);">修改>></a>
				</div>
		<div class="distrCont">
			<div class="confirm-td distr-list ml clear undis">
				<div class="distr-th"><h4>支付方式</h4></div>
				<div class="mb15">
						<ul class="confirm-pay payment">
								<li class="selected"><label><input name="payType" type="radio" value="100" checked>在线支付        <em>即时到帐，支持绝大数银行借记卡、部分银行信用卡及支付宝</em>&nbsp;&nbsp;<a href="">查看银行及限额</a></label></li>
								<li><label><input name="payType" type="radio" value="4">货到付款        <em>送货上门后再收款，支持现金、POS机刷卡、支票支付</em>&nbsp;&nbsp;<a href="">查看服务及配送范围</a></label></li>
						</ul>
				</div>
				<div class="distr-th oz txt-edit">
					<a href="" class="fr">查看运费及送达时间详情>></a><h4 class="fl mr15">配送方式</h4>(大件类超重物品根据商品实际重量需另行加收运费，敬请理解)
				</div>
				<div class="payDetail">
					<div class="item">
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
					</div>
					<div class="item undis">
						<ul>
							<li>默认配送方式：由上品选择合适的配送方式      运费：${sendcost}&nbsp;元</li>
						</ul>
						<ul class="distr-time pr moren"><u>配送时间：</u>
							<li><input name="time2" type="radio" value="工作日、双休日与假日均可送货" checked>工作日、双休日与假日均可送货</li>
							<li><input name="time2" type="radio" value="只双休日、假日送货(工作日不用送)">只双休日、假日送货(工作日不用送)</li>
							<li><input name="time2" type="radio" value="只工作日送货(双休日、假日不用送) (注：写字楼/商用地址客户请选择)">只工作日送货(双休日、假日不用送) (注：写字楼/商用地址客户请选择) </li>
							<li><input name="time2" type="radio" value="学校地址/地址白天没人，请尽量安排其他时间送货 (注：特别安排可能会超出预计送货天数)">学校地址/地址白天没人，请尽量安排其他时间送货 (注：特别安排可能会超出预计送货天数) </li>
						</ul>
					</div>
			</div>
			<div class="save-invoice ml60 mt"><a href="javascript:void(0);" onClick="javascript:commitPaySendtype(this);" class="btn-distr"><span>保存支付及配送方式</span></a></div>
		</div>
			<div class="confirm-td distr-detail txt-gray1">
				<p>支付方式：${order.paymentModeName } </p>
				<p>配送方式：${order.sendTypeName }</p>
				<p>运费：${order.sendCost }</p>
				<p class="txt-red">${order.memo }</p>
			</div>
		</div>
		</div>
		<div class="confirm-table fapiao mb">
				<div class="confirm-th oz txt-edit">
						<h3 class="fl mr15">发票信息</h3><a href="javascript:void(0);">修改>></a>
				</div>
				<div class="confirm-td fapiaoCon clear">
						<ul id="fapiaoInfo">
							<li><span class="mr15">不需发票</span></li>
						</ul>
						<ul class="undis">
								<li class="fapiaoselected">发票抬头：
									<i><input name="fapiao" type="radio" value="个人" checked>个人</i>
									<i><input name="fapiao" type="radio" value="单位">单位 <input type="text" name="fapiaofield" id="fapiaofield" class="input-invoice"></i>
								</li>
								<li>发票内容：
									<i><input name="fn" type="radio" value="体育用品" checked>体育用品</i>
									<i><input name="fn" type="radio" value="服装">服装</i>
									<i><input name="fn" type="radio" value="包">包</i>
									<i><input name="fn" type="radio" value="鞋">鞋</i>
									<i><input name="fn" type="radio" value="礼品">礼品</i>
								</li>
								<li class="save-invoice ml60 mt4"><a class="savefapiao" onclick="saveInvoice(this);" href="javascript:void(0);"><span>保存发票信息</span></a></li>
						</ul>
				</div>
		</div>
				<div class="confirm-table mb">
						<div class="confirm-th oz txt-edit">
								<a href="../cart/show.html" class="fr">返回购物车修改>></a><h3 class="fl mr15">商品清单</h3>
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
										<li class="w-goods"> <a href="../product/${item.productSid}.html" target="_blank"><img src="${item.proPicture}" } width="56" height="56"></a> <a href="../product/${item.productSid}.html" target="_blank">${item.name}</a>
												<div class="txt-gray"><div>编码：${item.proSku}</div><div>市场价：<del>￥${item.originalPrice}</del></div></div>
										</li>
										<li class="w-size">${item.size}</li>
										<li class="w-color">${item.color}</li>
										<li class="w-price">￥${item.promotionPrice}</li>
										<li class="w-quantity">${item.qty}</li>
										<li class="w-action"><a href="" onclick="delProduct(${item.sid});">删除</a>&nbsp;&nbsp;</li>
									</ul>
									<input id="saleCount" type="hidden" value="${item.qty}">
								</c:forEach>
						<div class="confirm-total oz clear"><ul class="fl">
								<li><b>使用上品购物券：</b><input type="text" name="textfield" id="voucher" class="input-invoice"><a href="" class="btn-confirm">确定</a>&nbsp;&nbsp;<a href="#">查看我的购物券</a></li></ul>
						<ul class="fr"><li><span class="li1"><u class="txt-red">${totalCount}</u> 件商品，总商品金额：</span><span>￥${totalMoney}</span></li>
								<li><span class="li1">运费：</span><span>￥${sendCost }</span></li>
								<li><span class="li1">购物券优惠：</span><span>￥0.00</span></li>
								<li><span class="li1">应付总额：</span><span>￥${orderamount}</span></li>
								</ul>
						</div>
						<div class="account-total f14 fb clear">
						<div class="btn-cart fr"><a class="order" href="javascript:void(0);" onClick="commitOrder(this);">提交订单</a></div><div class="fr mr15">应付总额：<span class="f16 txt-red">￥${orderamount}</span>&nbsp;元</div>
						</div>
						</div>
				</div>
				
				<div class="cl"></div>
		</div>
</div>
</div>
<%@include file="/common/footer.jsp" %>
<script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>
<script language="javascript">  
$(function(){
	//编辑收货信息按钮 三模块通用
	$(".txt-edit a").click(function(){
		$(this).parent().next().children().toggle();
		if($(this).text()=='修改>>'){
			$(this).text("取消>>");
		}else{
			$(this).text("修改>>");
		};
	});
	//点击当前项 选中radio
	$(".address-list li").click(function(){
		$(this).children("input:radio").attr("checked", 'checked');
		$(this).addClass("selected").siblings().removeClass("selected");
	});
	//点击删除收货地址
	$(".address-list .address-del").click(function(){
		$(this).children("input:radio").attr("checked", 'checked');
		$(this).addClass("selected").siblings().removeClass("selected");
	});
	
	//点击显示添加新地址
	$(".address-edit,.newAddress,.address .txt-edit a").click(function(){
		$(".new-address").show();
		$(".newAddress").addClass("selected");
		$(".newAddress").children("input:radio").attr("checked", 'checked');
	});
	//确认收货地址 隐藏当前层 隐藏 添加新地址窗口 修改按钮文本
	$(".address-list .save-invoice").click(function(){
		$(".address-list").toggle();
		$(".new-address").hide();
		$(".address .txt-edit a").text("修改>>");
	});
	//支付方式选择
	var radioTit = $(".payment");
			radioCon = $(".payDetail");
		$(radioTit).children().click(function(){
		$(this).addClass("selected").siblings().removeClass("selected");
		$(this).children().children("input:radio").attr("checked", 'checked');
		var index = $(radioTit).children().index(this);
			$(radioCon).children().eq(index).show().siblings().hide();
		});
	//配送方式 隐藏当前层 隐藏 添加新地址窗口 修改按钮文本
	/* $(".btn-distr").click(function(){
		$(".distrCont").children().toggle();
		$(".distr .txt-edit a").text("修改>>");
	}); */
	//选择发票
	$(".savefapiao").click(function(){
		$(".fapiaoCon").children().toggle();
		$(".fapiao .txt-edit a").text("修改>>");
	});
	//删除地址弹出确认框
	/* $(".address-del").click(function(){
		$(".delete-list").show();
	}); */
	$(".delete-list .cancel").click(function(){
		$(".delete-list").hide();
	});

});
function addAddress(){
	$(".addAddressBox").prepend("<li class='selected'><input name='address' type='radio' value='' checked> 胡晶  湖南长沙市长沙县星沙街道沙镇城西安置小区加油站附近   15874045521<span class='edit'><a href='javascript:void(0);' class='address-edit'>编辑</a>&nbsp;&nbsp;&nbsp;<a href='javascript:void(0);' class='address-del'>删除</a></span></li>");
	$(".newAddress").removeClass("selected");
	$(".new-address").hide();
};
</script>
<script>
$(".tWeixin").hover(function(){
		$(".tCode").show();
		},function(){
  $(".tCode").hide();
});
</script>
<script type="text/javascript">
//获取地址信息
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
// 删除地址,显示删除提示
function addressDel(sid) {
	$(".delete-list").show();
	$(".delete-list").val(sid);
}
//确认删除地址
function addressDelSubmit(){
	var sid = $(".delete-list").val();
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
				$("#li"+sid).remove();
				$(".delete-list").hide();
				$.popdialog(button, "del_address_commit", "成功删除地址信息");
			}else{
				$.popdialog(button, "del_address_commit", "删除地址信息失败");
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
//提交或修改配送地址
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
			phone : address.tel,
		},
		timeout : 30000,
		error : function() {
			$.popdialog(button, "cart_address_commit", "保存地址信息失败");
			return ;
		},
		success : function(response) {
			console.log(response);
			var result = response.success;
			var sid = response.sid;
			address.sid = sid;
			if (result) {
				$('#li'+address.sid).remove();
				$(".addAddressBox").prepend("<li id='li"+address.sid+"' class='selected'><input id='addressInfo"+address.sid
				+"'name='address' type='radio' value='"+address.sid+"' checked> "+address.name
				+"&nbsp;&nbsp;&nbsp;&nbsp;"+address.provinceName+address.cityName+address.address
				+"&nbsp;&nbsp;&nbsp;&nbsp;"+address.tel+"<span class='edit'><a href='javascript:void(0);'onclick='showAddressEdit("+address.sid
				+");' class='address-edit'>编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:void(0);' onclick='addressDel("+address.sid+");'>删除</a></span>"
				+"<input id='addr_sid"+address.sid+"' type='hidden' value='"+address.sid+"'/>"
				+"<input id='addr_province"+address.sid+"' type='hidden' value='"+address.provinceName+"'/>"
				+"<input id='addr_city"+address.sid+"' type='hidden' value='"+address.cityName+"'/>"
				+"<input id='addr_address"+address.sid+"' type='hidden' value='"+address.address+"'/>"
				+"<input id='addr_receptName"+address.sid+"' type='hidden' value='"+address.name+"'/>"
				+"<input id='addr_mailCode"+address.sid+"' type='hidden' value='"+address.postcode+"'/>"
				+"<input id='addr_mobile"+address.sid+"' type='hidden' value='"+address.tel+"'/>"
				+"<input id='addr_provinceSid"+address.sid+"' type='hidden' value='"+address.deliProvinceSid+"'/>"
				+"<input id='addr_citySid"+address.sid+"' type='hidden' value='"+address.deliCitySid+"'/>"
				+"</li>");
				$(".newAddress").removeClass("selected");
				$(".new-address").hide(); 
				$.popdialog(button, "cart_address_commit", "保存地址信息成功");
				return ;
			} else {
				$.popdialog(button, "cart_address_commit", "保存地址信息失败");
				return ;
			}
		}
	});
}

function validateAddress(button){
	return true;
}

function selectAddress(button){
	var sid = $("input:[name=address][type=radio][checked]").val();
	var url = '${ctx}/order/selectAddress.json';
	$.ajax({
		url : url,
		type : 'post',
		dataType : 'json',
		data : {
			receptName : $("#addr_receptName"+sid).val(),
			inceptProvinceSid : $("#addr_provinceSid"+sid).val(),
			inceptProvince : $("#addr_province"+sid).val(),
			inceptCitySid : $("#addr_citySid"+sid).val(),
			inceptCity : $("#addr_city"+sid).val(),
			receptAddress : $("#addr_address"+sid).val(),
			inceptPostcode : $("#addr_mailCode"+sid).val(),
			receptPhone : $("#addr_mobile"+sid).val(),
		},
		timeout : 30000,
		error : function() {
			$.popdialog(button, "cart_invoice_commit", "保存配送地址失败，请稍后重试");
			return ;
		},
		success : function(response) {
			console.log(response);
			var result = response.result;
			var order = response.orderVO;
			var status = result.status;
			if (status==1) {
				$("#validate_send_pay_type").attr("value", "false");
				$(".address-info").children().eq(0).text("收货姓名："+order.receptName);	
				$(".address-info").children().eq(1).text("联系电话："+order.receptPhone);
				$(".address-info").children().eq(2).text("邮政编码："+order.inceptPostcode);
				$(".address-info").children().eq(3).text("收货地址："+order.inceptProvince+order.inceptCity+order.receptAddress);
			} else {
				$.popdialog(button, "cart_invoice_commit", "保存配送地址信息失败");
				return ;
			}
		}
	});
}
function saveInvoice(button){
	var  invoiceHeader = $("input:[name=fapiao][checked]").val();
	if ((invoiceHeader)=="单位"){
		invoiceHeader = invoiceHeader+":"+$("input:[name= fapiaofield ]").val();
	}
	var invoiceDesc = $("input:[name=fn][checked]").val();
	$.ajax({
		url : '${ctx}/order/saveInvoice.json',
		type : 'post',
		dataType : 'json',
		data : {
			invoice_bit : 1,
			invoiceName : invoiceHeader,
			invoiceDesc : invoiceDesc,
		},
		error : function() {
			$.popdialog(button, "cart_invoice_commit", '保存发票信息失败,请重试');
            return;
		},
		timeout : 30000,
		success : function(response) {
			var result = response.result;
			var status = result.status;
			if (status==1) {
				$("#fapiaoInfo").children().eq(0).text(invoiceHeader+"  "+invoiceDesc);	
			} else {
				$.popdialog(button, "cart_invoice_commit", "保存发票信息失败,请重试");
				return ;
			}
		}
	});
}
function delProduct(proDetailSid){
	$.ajax({
		url : '${ctx}/order/delProduct.json',
		type : 'post',
		dataType : 'json',
		data : {
			'productDetailSid' : proDetailSid
		},
		timeout : 30000,
		error : function() {
			
		},
		success : function(response) {
			console.log("商品已删除"+proDetailSid);
		}
	});
}
function commitOrder(button){

	//alert("enter commitOrder function()");
	if(!validateOrder(button)) {
		return ;
	}
	
	
	//alert("end");
	//return ;
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
			var url = '${ctx}/order/confirm.html'
			window.location = url;
			return ;
		},
		success : function(response) {
			var result = response.result;
			var status = result.status;
			var message = result.message;
			if(status == '1') {
				var orderNo = response.orderNo;
				var url = '${ctx}/orderPay/' + orderNo + '.html';
				window.location = url;
			} else {
				$.popdialog(button, "order_confirm_commit", message);
			}
			return ;
		}
	});
}

function validateOrder(button){
	if ($("#validate_address").val() == 'false') {
		$.popdialog(button, "validate_info", "您还没有填写收货地址");
		return false;
	}
	
	if ($("#validate_send_pay_type").val() == 'false') {
		$.popdialog(button, "validate_info", "您还没有选择支付与配送方式");
		return false;
	}
	
	if ($("#validate_productlist").val() == 'false') {
		$.popdialog(button, "validate_info", "您还没有购买商品");
		return false;
	}
	
	return true;
    
}

<%--定义一个向Cookie写入的函数--%>
function setcookie(cookieName, cookieValue, seconds, path, domain, secure) {
	cookiedomain = 'shopin.net', cookiepath = '/';
	var expires = new Date();
	if(cookieValue == '' || seconds < 0) {
	  cookieValue = '';
	  seconds = -2592000;
	}
	expires.setTime(expires.getTime() + seconds * 1000);
	domain = !domain ? cookiedomain : domain;
	path = !path ? cookiepath : path;
	document.cookie = escape( cookieName) + '=' + escape(cookieValue)
	  + (expires ? '; expires=' + expires.toGMTString() : '')
	  + (path ? '; path=' + path : '/')
	  + (domain ? '; domain=' + domain : '')
	  + (secure ? '; secure' : '');
}

<%-- 获取购物券 --%>
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

<%-- 保存支付和配送方式 --%>
function commitPaySendtype(button){
	// 获取支付方式、配送方式、配送时间的值
	var payType = $('input[name="payType"]:checked').val();
	var paymentModeName, sendType, memo;
	if('4'==payType){
		paymentModeName = '货到付款';
		sendType = '4';
		memo = $('input[name="time2"]:checked').val();
	}else{
		paymentModeName = '在线支付';
		sendType = $('input[name="sentType"]:checked').val();
		memo = $('input[name="time1"]:checked').val();
	}
	
	$.ajax({
		url:'${ctx}/order/savePayAndSendType.json',
		type:'post',
		dataType:'json',
		data:{
			'paymentModeSid': payType,
			'paymentModeName' : paymentModeName,
			'sendType' : sendType,
			'memo' : memo
		},
		timeout: 30000,
		error: function(){
			$.popdialog(button,"validate_sendtype","保存支付及配送方式失败，请重试");
			return;
		},
		success: function(response){
			var result = response.result;
			var status = result.status;
			var message = result.message;
			var order = response.orderVO;
			if(status == '1'){
				$("#validate_send_pay_type").attr("value", "true");
				
				$(".distrCont").children().toggle();
				$(".distr .txt-edit a").text("修改>>");
		
				$(".distrCont .distr-detail").children().eq(0).text("支付方式：" + order.paymentModeName);	
				$(".distrCont .distr-detail").children().eq(1).text("配送方式："+order.sendTypeName);	
				$(".distrCont .distr-detail").children().eq(2).text("运费："+order.sendCost + "元");	
				$(".distrCont .distr-detail").children().eq(3).text(order.memo);	
			}else{
				$.popdialog(button,"validate_sendtype",message);
				return;	
			} 
			return;
		}
	});
}

</script>
<!--[if IE 6]>
<script type="text/javascript" src="DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript"> 
DD_belatedPNG.fix('.png');
</script> 
<![endif]-->
</body>
</html>
