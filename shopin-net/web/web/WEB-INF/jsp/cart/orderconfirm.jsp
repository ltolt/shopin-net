<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Access-Control-Allow-Origin" content="*">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
<title>上品折扣网 - 实体店应季正品保障，全网底价折扣特卖</title>
<link href="${localcss}/reset.css" rel="stylesheet" type="text/css">
<link href="${localcss}/layout.css" rel="stylesheet" type="text/css">
<link href="${localcss}/cart.css" rel="stylesheet" type="text/css">
<style type="text/css">
.check{display:none}
.return-list{display:none}
</style>
</head>

<body>
<%@include file="/common/cart_header.jsp" %>
<div id="container">
    <div class="in oz">
        <div class="cart-step steps2 mt"></div>
        <h2 class="confirm-title">填写并确认订单信息</h2>
        <input type="hidden" id="validate_address" value="${validate_address}"/>
        <input type="hidden" id="validate_send_pay_type" value="${validate_send_pay_type}"/>
        <input type="hidden" id="validate_productlist" value="${validate_productlist}"/>
        <div class="confirm-table address mb">
            <div class="confirm-th oz txt-edit">
                <h3 class="fl mr15">收货人信息</h3><a class="oc-btnReceiving" href="javascript:void(0);" <c:if test="${addressFlag=='0'}">style="display:none"</c:if> >使用其它地址>></a>
                <span id="getAddressNum" style="display:none" class="txt-red">(最多保存6个地址)</span>
            </div>
            <div class="confirm-td clear">
                <div class="address-list info"<c:if test="${addressFlag=='0'}">style="display:none"</c:if>>
                    <ul class="address-info">
                        <li>收货姓名：${order.receptName}</li>
                        <li>联系电话：${order.receptPhone}</li>
                        <li>邮政编码：${order.inceptPostcode} </li>
                        <li>收货地址： ${order.receptAddress}</li>
                    </ul>
                </div> 	
                <div class="address-list undis" <c:if test="${addressFlag=='0'}">style="display:block"</c:if>>
				<span id="getAddressListSize"  style=display:none>${addresslistsize} </span>
                    <ul class="addAddressBox">
                        <c:forEach items="${addresslist}" var="item" varStatus="status">
                        <li id="li${item.sid}" <c:if test="${status.first}"> class="selected"</c:if>>
                            <input id="addressInfo${item.sid}" name="address" type="radio" value="${item.sid}" <c:if test="${status.first}"> checked</c:if>>
                            ${item.recipientName} &nbsp;&nbsp; ${item.province}${item.city}${item.address} &nbsp;&nbsp;${item.mobile}
                            <span class="edit">
                            	<a href="javascript:showAddressEdit(${item.sid});" class="address-edit">编辑</a>&nbsp;&nbsp;&nbsp;
                            	<a href="javascript:void(0);" class="address-del" onclick="addressDel(${item.sid});">删除</a>
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
                        <li class="newAddress" id="showHidden" <c:if test="${addressFlag=='0'}"> class="selected"</c:if>><input id="newAddress" name="address" type="radio" value="使用新地址" <c:if test="${addressFlag=='0'}"> checked</c:if>> 使用新地址</li>
                        <div class="new-address clear " <c:if test="${addressFlag=='1'}"> class="undis" style="display:none"</c:if>>
                            <input type="hidden" id="addressSid" value="" />
                            <div class="list">
                                <div class="li1"><span class="txt-red">*</span>&nbsp;收货人：</div>
                                <div><input name="" id="receptName" type="text"></div>
                                <div class="check"><span  class="point">此项必填，请填写收货人姓名</span></div>
                            </div>
                            <div class="list">
                                <div class="li1"><span class="txt-red">*</span>&nbsp;所在地区：</div>
                                <div>
                                    <label for="select2"></label>
                                    <select name="select2" onChange="selectProvince()" id="provincelist">
                                        <option>请选择</option>
                                        <c:forEach items="${provincelist}" var="pro">
                                        <option value="${pro.sid}">${pro.province}</option>
                                        </c:forEach>
                                    </select>
                                    <select name="select" id="citylist">
                                        <option>请选择</option>
                                    </select>
                                </div>
                                <div class="check"><span  class="point">请选择省份和城市</span></div>
                            </div>
                            <div class="list">
                                <div class="li1"><span class="txt-red">*</span>&nbsp;详细地址：</div>
                                <div><input type="text" size="50" id="detailAddr"></div>
                                <div class="check"><span  class="point">此项必填，请填写收货地址</span></div>
                            </div>
                            <div class="list">
                                <div class="li1"><span class="txt-red">*</span>&nbsp;手机：</div>
                                <div><input name="" type="text" id="phone"></div>
                                <div class="check"><span  class="point">手机号码填写不正确，为便于送货时及时联系您，请填写正确手机号码</span></div>
                            </div>
                            <div class="list">
                                <div class="li1">邮编：</div>
                                <div><input name="" type="text" id="postcode"></div>
								<div class="check"><span  class="point">不是正确的邮政编码！</span></div>
                            </div>
                            <div class="list">
                                <div><input type="button" value="保存收货人信息" onClick="commitAddress(this);" class="btn-save undis"></div>
                                <div class="load-list1 mt4 fr tc undis">正在保存信息，请稍候！</div>
                            </div>
                        </div>
                        <div class="save-invoice btn-distri mt4 ml" id="addressSaveBtn" <c:if test="${addressFlag=='0'}">style="display:none"</c:if>><a onClick="selectAddress(this);" href="javascript:void(0);" id="addressButton"><span>配送到这个地址</span></a></div>
                    </ul>
                </div>
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
                            <li class='<c:if test="${order.paymentModeSid==1}">selected</c:if>' ><label><input name="payType" type="radio" value="1"  <c:if test="${order.paymentModeSid==1}">checked</c:if>>在线支付        <em>即时到帐，支持绝大数银行借记卡、部分银行信用卡及支付宝</em>&nbsp;&nbsp;<a href="http://www.shopin.net/help/h_pay1.html"  target="_blank">查看银行及限额</a></label></li>
                            <li class='<c:if test="${order.paymentModeSid==4}">selected</c:if>' ><label><input name="payType" type="radio" value="4"  <c:if test="${order.paymentModeSid==4}">checked</c:if>>货到付款        <em>送货上门后再收款，支持现金支付，暂不支持POS机刷卡</em>&nbsp;&nbsp;<a href="http://www.shopin.net/help/h_log.html"  target="_blank">查看服务及配送范围</a></label></li>
                        </ul>
                    </div>
                    <div class="distr-th oz">
                        <a href="http://www.shopin.net/help/h_log.html" class="fr"  target="_blank">查看运费及送达时间详情>></a><h4 class="fl mr15">配送方式</h4>(大件类超重物品根据商品实际重量需另行加收运费，敬请理解)
                    </div>
                    <div class="payDetail">
                        <div class="item <c:if test="${order.paymentModeSid ==4}">undis</c:if>" id="pay1">
                            <ul>
                                <li>配送方式：
                                    <c:forEach items="${sentTypeMap}" var="item" varStatus="status">
                                    <i><input name="sentType" type="radio" value="${item.key }" <c:if test="${item.value==order.sendTypeName}">checked</c:if> >${item.value }</i>
                                    </c:forEach>
                                </li>
                            </ul>
                            <ul class="distr-time pr"><u>配送时间：</u>
                                <li><input name="time1" type="radio" value="工作日、双休日与假日均可送货" <c:if test="${order.memo=='工作日、双休日与假日均可送货'}">checked</c:if> >工作日、双休日与假日均可送货</li>
                                <li><input name="time1" type="radio" value="只双休日、假日送货(工作日不用送)" <c:if test="${order.memo=='只双休日、假日送货(工作日不用送)'}">checked</c:if>>只双休日、假日送货(工作日不用送)</li>
                                <li><input name="time1" type="radio" value="只工作日送货(双休日、假日不用送) (注：写字楼/商用地址客户请选择)" <c:if test="${order.memo=='只工作日送货(双休日、假日不用送) (注：写字楼/商用地址客户请选择)'}">checked</c:if>>只工作日送货(双休日、假日不用送) (注：写字楼/商用地址客户请选择)</li>
                                <li><input name="time1" type="radio" value="学校地址/地址白天没人，请尽量安排其他时间送货 (注：特别安排可能会超出预计送货天数)" <c:if test="${order.memo=='学校地址/地址白天没人，请尽量安排其他时间送货 (注：特别安排可能会超出预计送货天数)'}">checked</c:if>>学校地址/地址白天没人，请尽量安排其他时间送货 (注：特别安排可能会超出预计送货天数)</li>
                            </ul>
                        </div>
                        <div class="item <c:if test="${order.paymentModeSid !=4}">undis</c:if>"  id="pay2">
                            <ul>
                                <li>默认配送方式：由上品选择合适的配送方式</li>
                            </ul>
                            <ul class="distr-time pr moren"><u>配送时间：</u>
                                <li><input name="time2" type="radio" value="工作日、双休日与假日均可送货" <c:if test="${order.memo=='工作日、双休日与假日均可送货'}">checked</c:if> >工作日、双休日与假日均可送货</li>
                                <li><input name="time2" type="radio" value="只双休日、假日送货(工作日不用送)" <c:if test="${order.memo=='只双休日、假日送货(工作日不用送)'}">checked</c:if>>只双休日、假日送货(工作日不用送)</li>
                                <li><input name="time2" type="radio" value="只工作日送货(双休日、假日不用送) (注：写字楼/商用地址客户请选择)"  <c:if test="${order.memo=='只工作日送货(双休日、假日不用送) (注：写字楼/商用地址客户请选择)'}">checked</c:if>>只工作日送货(双休日、假日不用送) (注：写字楼/商用地址客户请选择) </li>
                                <li><input name="time2" type="radio" value="学校地址/地址白天没人，请尽量安排其他时间送货 (注：特别安排可能会超出预计送货天数)" <c:if test="${order.memo=='学校地址/地址白天没人，请尽量安排其他时间送货 (注：特别安排可能会超出预计送货天数)'}">checked</c:if>>学校地址/地址白天没人，请尽量安排其他时间送货 (注：特别安排可能会超出预计送货天数) </li>
                            </ul>
                        </div>
                    </div>
                    <div class="save-invoice ml60 mt"><a id="commitPaySendtype" href="javascript:void(0);" class="btn-distr"><span>保存支付及配送方式</span></a></div>
                </div>
                <div class="confirm-td distr-detail txt-gray1">
                    <p>支付方式：${order.paymentModeName } </p>
                    <p>配送方式：${order.sendTypeName }</p>
                    <p>运费：${order.sendCost }&nbsp;元</p>
                    <p class="txt-red">${order.memo }</p>
                </div>
            </div>
        </div>
        <div class="confirm-table fapiao mb">
            <div class="confirm-th oz txt-edit">
                <h3 class="fl mr15">发票信息</h3><a class="fapiao" href="javascript:void(0);">修改>></a>
            </div>
            <div class="confirm-td fapiaoCon clear">
                <ul id="fapiaoInfo">
                    <div id="invoiceBitTrue" <c:if test="${order.invoiceBit==null||order.invoiceBit=='0' }">style="display:none;"</c:if> >
                        <li><span class="mr15">发票抬头：<i id="invoiceName">${order.invoiceName }</i></span></li>
                        <li><span class="mr15">发票内容：<i id="invoiceDesc">${order.invoiceDesc }</i></span></li>
                    </div>
                    <div id="invoiceBitFalse" <c:if test="${order.invoiceBit!=null&&order.invoiceBit=='1' }">style="display:none;"</c:if>>
                        <li><span class="mr15">不需要发票</span></li>
                    </div>
                </ul>
                <ul class="undis">
                    <li class="fapiaoselected">发票抬头：
                        <i><input name="fapiao" type="radio" value="个人" <c:if test="${order.invoiceName=='' || order.invoiceName=='个人'}">checked</c:if>>个人</i>
                        <i><input name="fapiao" type="radio" value="单位" <c:if test="${order.invoiceName !='个人'}">checked</c:if>>单位 <input type="text" name="fapiaofield" id="fapiaofield" class="input-invoice" value ='<c:if test="${order.invoiceName !='个人'}">${order.invoiceName }</c:if>'></i>
                    </li>
                    <li>发票内容：
                        <i><input name="fn" type="radio" value="体育用品" <c:if test="${order.invoiceDesc=='' || order.invoiceDesc=='体育用品'}">checked</c:if>>体育用品</i>
                        <i><input name="fn" type="radio" value="服装" <c:if test="${order.invoiceDesc=='服装'}">checked</c:if>>服装</i>
                        <i><input name="fn" type="radio" value="包" <c:if test="${order.invoiceDesc=='包'}">checked</c:if>>包</i>
                        <i><input name="fn" type="radio" value="鞋" <c:if test="${order.invoiceDesc=='鞋'}">checked</c:if>>鞋</i>
                        <i><input name="fn" type="radio" value="礼品" <c:if test="${order.invoiceDesc=='礼品'}">checked</c:if>>礼品</i>
                    </li>
                    <li class="save-invoice ml60 mt4" ><a class="savefapiao" onclick="saveInvoice(this);" href="javascript:void(0);"><span>保存发票信息</span></a></li>
                </ul>
            </div>
        </div>
        <div class="confirm-table mb">
            <div class="confirm-th oz txt-edit">
                <a id="modifycart" href="javascript:void(0)" class="fr">返回购物车修改>></a><h3 class="fl mr15">商品清单</h3>
            </div>
            <div class="confirm-td pr clear">
                <div class="conf irm-list clear">
                    <ul class="list-th oz">
                        <li class="w-goods">商品</li>
                        <li class="w-size">尺码</li>
                        <li class="w-color">颜色</li>
                        <li class="w-price">单价</li>
                        <li class="w-quantity">数量</li>
                        <li class="w-action">操作</li>
                    </ul>
                    <c:forEach items="${cartItem}" var="item" varStatus="status">
                    <ul class="list-td oz" id="delPro${item.sid}">
                        <li class="w-goods">
                            <a href="../product/${item.productSid}.html" target="_blank">
                            <img src="${item.proPicture}" } width="56" height="56"></a>
                            <a href="../product/${item.productSid}.html" target="_blank">${item.name}</a>
                            <div class="txt-gray"><div>编码：${item.proSku}</div><div>市场价：<del>￥${item.originalPrice}</del></div></div>
                        </li>
                        <li class="w-size">${item.size}</li>
                        <li class="w-color">${item.color}</li>
                        <li class="w-price">￥${item.promotionPrice}</li>
                        <li class="w-quantity">${item.qty}</li>
                        <li class="w-action"><%-- <a href="javascript:void(0);" onclick="delProduct(${item.sid},${item.qty},${item.promotionPrice});">删除</a>&nbsp;&nbsp; --%><a onclick="addToFavorite(${item.productSid});" href="javascript:void(0);">收藏</a></li></li>
                    </ul>
                    <input id="saleCount" type="hidden" value="${item.qty}">
                    </c:forEach>
                    <div class="confirm-total oz clear">
                        <ul class="fr">
                            <li><span class="li1"><u class="txt-red" id="totalCount">${totalCount}</u> 件商品，总商品金额：</span>￥<span id="totalMoney">${totalMoney}</span></li>
                            <li><span class="li1">运费：</span>￥<span id="sendCost">${order.sendCost }</span></li>
                        </ul>
                    </div>
                    <div class="account-total f14 fb clear">
                        <span id="getItemdetails" style=display:none>${itemdetails}</span>
                        <div class="btn-cart fr"><a class="order" id="commitOrderButton"  href="javascript:void(0);">提交订单</a></div>
                    <div class="load-list mt4 fr tc undis">正在提交订单，请稍候！</div>
                    <div class="fr mr15">合计：￥<span class="f16 txt-red" id="orderamount">${orderamount}</span>&nbsp;元</div>
                </div>
            </div>
        </div>
        <div class="cl"></div>
    </div>
</div>
</div>
<%@include file="/common/footer.jsp"%>
<div class="delete-list tc undis" style="padding:40px">
    <h3 class="f14 mb">您确认删除该地址吗？</h3>
    <input class="submit_btn" type="button" onclick='addressDelSubmit(this)' value="确定"><input type="button" class="cancel_btn" value="取消">
</div>
<script src="${localjs}/jquery.skygqbox.1.3.js"></script>
<script src="${js}/jquery/jquery-format-0.1.js" type="text/javascript"></script>
<script> 
var addrsize ="${ addresslistsize<6}";
	if(addrsize=="true")
			$("#showHidden").css("display","");
		else
			 $("#showHidden").css("display","none");
var exdate = new Date();
exdate.setDate(exdate.getDate() + 10);
document.cookie = "changesid"
	+ "="
	+ escape("web2")
	+ ";domain=.shopin.net"
	+ "; path=/"
	+ (";expires=" + exdate.toGMTString());
</script>
<script language="javascript">  
$(function(){
	var addressButton = $("#addressButton");
	selectAddress(addressButton);
	$("#commitPaySendtype").click(function commitPaySendtype(){
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
			if (sendType == null) {
				var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>请选择配送方式!</p>";
				$(msg).skygqbox({autoClose:1000});
				return;
			}
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
				var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>保存支付及配送方式失败，请重试!</p>";
				$(msg).skygqbox({autoClose:1000});
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
					$(".distrCont .distr-detail").children().eq(2).text("运费： "+order.sendCost + " 元");	
					$(".distrCont .distr-detail").children().eq(3).text(order.memo);	
					$("#sendCost").text(order.sendCost);
					var sendCost = order.sendCost;
					var orderamount = $("#totalMoney").html()-(-sendCost);
					$("#orderamount").html(orderamount.toFixed(2));
				}else{
					var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>"+message+"</p>";
					$(msg).skygqbox({autoClose:1000});
					return;	
				} 
				return;
			}
		});
	});

	$("#commitOrderButton").click(function commitOrder(){
	if ($("#validate_address").val() == 'false') {
		var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>您还没有填写收货地址!</p>";
		$(msg).skygqbox({autoClose:1000});
		return ;
	}
	
	if ($("#validate_send_pay_type").val() == 'false') {
		var msg2 = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>您还没有选择支付与配送方式!</p>";
		$(msg2).skygqbox({autoClose:1000});
		return ;
	}
	
	if ($("#validate_productlist").val() == 'false') {
		var msg3 = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>您还没有购买商品!</p>";
		$(msg3).skygqbox({autoClose:1000});
		return ;
	}
	
	var itemdetails = $("#getItemdetails").html();
	// 如果校验通过，则隐藏提交订单按钮
	$(".load-list").show();
	$(".order").hide();
				
	$.ajax({
		url : '${ctx}/order/commit.json?itemdetails='+itemdetails,
		type : 'post',
		dataType : 'json',
		timeout : 30000,
		error : function() {
			// 保存订单失败，提示失败信息
			$(".load-list").hide();
			$(".order").show();
			var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>保存订单失败!</p>";
			$(msg).skygqbox({autoClose:1000});
		},
		success : function(response) {
			var result = response.result;
			var status = result.status;
			var message = result.message;
			var proDetailSid = response.proDetailSid;
			if(status == '1') {
				var orderNo = response.orderNo;
				var url = '${ctx}/orderPay/' + orderNo + '.html';
				window.location = url;
			}else if(status=='11'){
				// 校验不通过
				$(".load-list").hide();
				$(".order").show();
				$("#point").text(message);
				var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>收货人信息中联系电话没有填写，请您填写完整！</p>";
				$(msg).skygqbox({autoClose:1000});
			}else {
				// 校验通过，但是保存订单时出现问题，重新显示提交订单按钮
				$(".load-list").hide();
				$(".order").show();
				if(typeof(proDetailSid) == "undefined"){
					$("#point").text("您提交订单过快，订单可能已经生成，请查看我的上品！");
				}else{
					$("#point").text("提示：库存不足！");
				}
				$("#delPro"+proDetailSid).addClass("warn");
				var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>库存不足！</p>";
				$(msg).skygqbox({autoClose:1000});
				/* $.popdialog(button, "order_confirm_commit", message); */
			}
			return ;
		}
	});
});
	//编辑支付方式及配送方式
	$(".txt-edit .oc-btndistr").click(function(){
		$(this).parent().next().children().toggle();
		if($(this).text()=='修改>>'){
			$(this).text("取消>>");
		}else{
			$(this).text("修改>>");
		}
	});
	//编辑发票
	$(".txt-edit .fapiao").click(function(){
		$(this).parent().next().children().toggle();
		if($(this).text()=='修改>>'){
			$(this).text("取消>>");
		}else{
			$(this).text("修改>>");
		}
	});
	//返回购物车修改
	$(".txt-edit a#modifycart").click(function(){
		window.location = '${ctx}/cart/show.html';
	});
	//使用其他地址后保存新地址  删除后不能使用删除的地址，取消的话逻辑有问题
	//使用其它地址
	$(".txt-edit a.oc-btnReceiving").click(function(){
		$(this).parent().next().children().toggle();
		$("#getAddressNum").show();
		if($(this).text()=='使用其它地址>>'){
			$(".confirm-table address").addClass("warn");
			$(this).text("");
		}else{
			$(this).text("使用其它地址>>");
		}
	});
	//点击当前项 选中radio
	$(".address-list li").click(function(){
		$(this).children("input:radio").attr("checked", 'checked');
		$(this).addClass("selected").siblings().removeClass("selected");
		if($(this).attr('class')=='selected'){
			$(".new-address").hide();
			$(".save-invoice").show();
		}else{return;}
	});
	
	//点击删除收货地址
	$(".address-list .address-del").click(function(){
		$(this).children("input:radio").attr("checked", 'checked');
		$(this).addClass("selected").siblings().removeClass("selected");
	});
	
	//点击显示添加新地址
	$(".newAddress").click(function(){
		$(".new-address").show();
		//清空地址信息
		$(" .btn-save").parent().show(); 	
		$("#addressSid").val("");
		$("#receptName").val("");
		$("#provincelist").val("请选择");
		$("#citylist").val("请选择");
		$("#detailAddr").val("");
		$("#phone").val("");
		$("#postcode").val("");
		$(".load-list1").hide();
		if($(".btn-save").parent().show()){
		$("#addressSaveBtn").hide();
		}else{return;};
	;
	});
	//确认收货地址 隐藏当前层 隐藏 添加新地址窗口 修改按钮文本
	$(".address-list .save-invoice").click(function(){
		$(".address-list").toggle();
		$(".new-address").hide();
		//$(".address .txt-edit a").text("使用其它地址>>");
	});
	//$(".address-list .btn-save").click(function(){
		//$(".save-invoice").show();
		//$(".load-list1").show();
		//$(this).parent().hide(); 	
	//});
	
	//支付方式选择
		var radioTit = $(".payment");
		radioCon = $(".payDetail");
		
		var index = $(radioTit).children().index(this)
		
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
	/* $(".savefapiao").click(function(){
		$(".fapiaoCon").children().toggle();
		$(".fapiao .txt-edit a").text("修改>>");
	}); */
	//删除地址弹出确认框
	$(".address-del").click(function(){
		$(".delete-list").skygqbox({title:'删除地址'});
	});
	//取消
	$(".cancel_btn,.closeBtn").click(function(){
		$.skygqbox.hide();
	});

	$(".return-list").click(function(){
		var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>库存不足！</p>";
		$(msg).skygqbox({autoClose:1000});
	});
});
function addAddress(){
	$(".newAddress").removeClass("selected");
	$(".new-address").hide();
	$(".btn-distri").show();
	if($(".save-invoice").hide()){
		$(".btn-save").show();
		}else{return;};
	;
};
function showNewAddress(){
	$(".new-address").show();
	$(".save-invoice").hide();
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
var createSize = 1;
var getAddressListSize = $("#getAddressListSize").html();
function addressDelSubmit(button){
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
			if(response.success){
				createSize--;
				$("#showHidden").css("display","");
				$("#li"+sid).remove();
				$.skygqbox.hide();
				$("ul li:first-child").children("input:radio").attr("checked", 'checked');
				$("ul li:first-child").addClass("selected"); 
				var radioValue = $("input:radio[name='address']:checked").val();
				if(radioValue=="使用新地址"){
						//$("#getAddressNum").show();
						$(".new-address").show();
						//清空地址信息
						$(" .btn-save").parent().show(); 	
						$("#addressSid").val("");
						$("#receptName").val("");
						$("#provincelist").val("请选择");
						$("#citylist").val("请选择");
						$("#detailAddr").val("");
						$("#phone").val("");
						$("#postcode").val("");
						$(".load-list1").hide();
						if($(".btn-save").parent().show()){
						$("#addressSaveBtn").hide();
						}else{return;};
				}
			}else{
				var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>删除地址信息失败！</p>";
				$(msg).skygqbox({autoClose:1000});
			}
			
		}
	});
}
function showAddressEdit(sid) {
	$(".new-address").show();
	$("#addressSaveBtn").hide();
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
	$("#postcode").val($("#addr_mailCode" + sid).val());
}
//校验收货地址信息
function validateAddress(button) {
	var address = getAddressData();
		if ('' == address) {
		var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>您还没有填写收货人信息！</p>";
		$(msg).skygqbox({autoClose:1000});
		return false;
	}
	var flag = true;
	var msgs = $(".check");
	if (address.name == '') {
		msgs.eq(0).show();
		flag = false;
	} else {
		msgs.eq(0).hide();
	}
	if (address.provinceName === '请选择') {
		msgs.eq(1).show();
		flag = false;
	}
	if (address.cityName === '请选择') {
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
	if (!/^1[0-9]\d{9}$/.test(address.tel)) {
		msgs.eq(3).show();
		flag = false;
	} else {
		msgs.eq(3).hide();
	}
	if(address.postcode.length!=0&&!(/^[0-9]{6}$/.test(address.postcode))){  
       msgs.eq(4).show();
		flag = false;
	 }else {
		msgs.eq(4).hide();
	} 
	if (!flag) {
		$(".load-list1").hide();
		$(".btn-save").parent().show();
	}
	return flag;
}
//提交或修改配送地址
function commitAddress(button) {
	$(".load-list1").show();
	$(".btn-save").parent().hide();
	if (!validateAddress(button)) {
		return;
	}
	
	var address = getAddressData();
	if(address.sid==""){
		createSize++;
	}
	if((parseInt(getAddressListSize)+createSize)>6){
		$("#showHidden").css("display","none");
	}
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
			mailCode : address.postcode,
			phone : address.tel
		},
		timeout : 30000,
		error : function() {
			$(".load-list1").hide();
			$(".btn-save").parent().show();
			var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>保存地址信息失败！</p>";
			$(msg).skygqbox({autoClose:1000});
			return ;
		},
		success : function(response) {
			var result = response.success;
			var sid = response.sid;
			address.sid = sid;
			if (result) {
				$('#li'+address.sid).remove();
				$(".load-list1").hide();
				$(".btn-save").parent().show();
				$(".addAddressBox").prepend("<li id='li"+address.sid+"' class='selected'><input id='addressInfo"+address.sid
				+"'name='address' type='radio' value='"+address.sid+"' checked> "+address.name
				+"&nbsp;&nbsp;&nbsp;&nbsp;"+address.provinceName+address.cityName+address.address
				+"&nbsp;&nbsp;&nbsp;&nbsp;"+address.tel+"<span class='edit'><a href='javascript:showAddressEdit("+address.sid
				+");' class='address-edit'>编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='javascript:void(0);' class='address-del' onclick='addressDel("+address.sid+");'>删除</a></span>"
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
				$("#newAddress").removeAttr("checked");
				$(".save-invoice").show();
				//删除地址弹出确认框
				$(".address-del").click(function(){
					$(".delete-list").skygqbox({title:'删除地址'});
				});
				
				//点击当前项 选中radio
				$(".address-list li").click(function(){
					$(this).children("input:radio").attr("checked", 'checked');
					$(this).addClass("selected").siblings().removeClass("selected");
					 if($(this).attr('class')=='selected'){
						$(".new-address").hide();
						$(".save-invoice").show();
					}else{return;} 
				}); 
				//if(address.tel!=""){
					//$(".return-list").hide();
					//$.skygqbox.hide();
				//}
				var addressButtonTest = $("#addressButton");
				$(".txt-edit a.oc-btnReceiving").parent().next().children().toggle();
				selectAddress(addressButtonTest);
				return ;
			} else {
				$(".load-list1").hide();
				$(".btn-save").parent().show();
				var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>保存地址信息失败！</p>";
				$(msg).skygqbox({autoClose:1000});
				return ;
			}
		}
	});
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
			receptPhone : $("#addr_mobile"+sid).val()
		},
		timeout : 30000,
		error : function() {
			var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>保存配送地址失败，请重试！</p>";
			$(msg).skygqbox({autoClose:1000});
			return ;
		},
		success : function(response) {
			var result = response.result;
			var order = response.orderVO;
			var status = result.status;
			if (status==1) {
				$("#validate_address").attr("value", "true");
				$("#validate_send_pay_type").attr("value", "false");
				var radioValue = $("input:radio[name='address']:checked").val();
				if(radioValue=="使用新地址"){
					$("#getAddressNum").show();
				}else{
					$("#getAddressNum").hide();
					$(".txt-edit a.oc-btnReceiving").show();
					$(".txt-edit a.oc-btnReceiving").text("使用其它地址>>");
				}
				$(".txt-edit a.oc-btndistr").text("取消>>");
				$(".txt-edit a.oc-btndistr").parent().next().children()[0].style.display="block";
				$(".txt-edit a.oc-btndistr").parent().next().children()[1].style.display="none";
				$(".address-info").children().eq(0).text("收货姓名："+order.receptName);	
				$(".address-info").children().eq(1).text("联系电话："+order.receptPhone);
				if(order.inceptPostcode ==''||order.inceptPostcode==null){
				$(".address-info").children().eq(2).text("邮政编码："+order.inceptPostcode).hide();
				}else{
				$(".address-info").children().eq(2).text("邮政编码："+order.inceptPostcode).show();
				}
				$(".address-info").children().eq(3).text("收货地址："+order.inceptProvince+order.inceptCity+order.receptAddress);
				var date = new Date();
				var currenttimes = date.getTime();
				var startDate = new Date(2014,0,25,12,0,0);
				var starttimes = startDate.getTime();
				var endDate = new Date(2014,1,7,10,0,0);
				var endtimes = endDate.getTime();
				//2014春节期间暂时取消货到付款
				if(currenttimes >= starttimes && currenttimes < endtimes){
					$(".confirm-pay li:eq(1)").hide();
					$("input[name=\"payType\"]:eq(0)").attr("checked",'checked');					
					$(".payDetail").children()[0].style.display="block";
					$(".payDetail").children()[1].style.display="none";
				}else{
					if(order.codFlag){
						$(".confirm-pay li:eq(1)").show();
						var payType = $('input[name="payType"]:checked').val();
						if(payType == 4){
						$(".payDetail").children()[0].style.display="none";
							$(".payDetail").children()[1].style.display="block";
						}
					}else{
						$(".confirm-pay li:eq(1)").hide();
						$("input[name=\"payType\"]:eq(0)").attr("checked",'checked');
						//不显示货到付款时，默认选中在线支付，并添加selected样式
						//$("input[name=\"payType\"]:eq(0)").addClass("selected");
						
						$(".payDetail").children()[0].style.display="block";
						$(".payDetail").children()[1].style.display="none";
					}
				}
				
				
			} else {
				var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>保存配送地址失败！</p>";
				$(msg).skygqbox({autoClose:1000});
				return ;
			}
		}
	});
}
function saveInvoice(button){
	var  invoiceHeader = $("input:[name=fapiao][checked]").val();
	if ((invoiceHeader)=="单位"){
		if($("input:[name= fapiaofield ]").val()==''){
			var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>请填写单位名称！</p>";
			$(msg).skygqbox({autoClose:1000});
			//alert("请填写单位名称!");
			return ;
		}else{
			invoiceHeader = $("input:[name= fapiaofield ]").val();
		}
	}
	var invoiceDesc = $("input:[name=fn][checked]").val();
	$.ajax({
		url : '${ctx}/order/saveInvoice.json',
		type : 'post',
		dataType : 'json',
		data : {
			invoiceBit : 1,
			invoiceName : invoiceHeader,
			invoiceDesc : invoiceDesc
		},
		error : function() {
			var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>保存发票信息失败,请重试！</p>";
			$(msg).skygqbox({autoClose:1000});
			return;
		},
		timeout : 30000,
		success : function(response) {
			var result = response.result;
			var status = result.status;
			if (status==1) {
				
				$("#invoiceBitTrue").show();
				$("#invoiceBitFalse").hide();
				
				$("#invoiceName").html(invoiceHeader);
				$("#invoiceDesc").html(invoiceDesc);
				$(".fapiaoCon").children().toggle();
				$(".fapiao .txt-edit a").text("修改>>");
			} else {
				var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>保存发票信息失败,请重试！</p>";
				$(msg).skygqbox({autoClose:1000});
				return ;
			}
		}
	});
}
function delProduct(proDetailSid,qty,price){
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
			$("#delPro"+proDetailSid).remove();
			var count = $("#totalCount").html()-qty;
			var money = $("#totalMoney").html()-qty*price;
			var orderPay = $("#sendCost").html()-1+money+1;
			$("#totalCount").html(count);
			$("#totalMoney").html(money.toFixed(2));
			$("#orderamount").html(orderPay.toFixed(2));
			if(response.validate_productlist==false)
			$("#validate_productlist").val(false);
		}
	});
}
<%--添加商品到藏夹
@param button 收藏按钮
--%>
function addToFavorite(productSid) {
	$.ajax({
		url:'${ctx}/favorite/add.json',
		type: 'post',
		dataType: 'json',
		data:{'productSID':productSid},
		timeout: 30000,
		error: function() {
			var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>添加商品到收藏夹失败,请重试！</p>";
			$(msg).skygqbox({autoClose:1000});
			//alert('添加商品到收藏夹失败,请重试');
			return;
		},
		success: function(response) {
			var result = response.result;
			var status = result.status;
			var message = result.message;
			var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>" + message + "</p>";
			$(msg).skygqbox({autoClose:1000});
			//alert(message);
		}
	});
}


function validateOrder(button){
	if ($("#validate_address").val() == 'false') {
		var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>您还没有填写收货地址！</p>";
		$(msg).skygqbox({autoClose:1000});
		return false;
	}
	
	if ($("#validate_send_pay_type").val() == 'false') {
		var msg2 = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>您还没有选择支付与配送方式！</p>";
		$(msg2).skygqbox({autoClose:1000});
		return false;
	}
	
	if ($("#validate_productlist").val() == 'false') {
		var msg3 = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>您还没有购买商品！</p>";
		$(msg3).skygqbox({autoClose:1000});
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
</script>
<div style="display:none">
<!--Baidu 开始 Date:2013-11-21 By:ShuLF-->
<script type="text/javascript">
(function (d) {
window.bd_cpro_rtid="rjDdn1T";
var s = d.createElement("script");s.type = "text/javascript";s.async = true;s.src = location.protocol + "//cpro.baidu.com/cpro/ui/rt.js";
var s0 = d.getElementsByTagName("script")[0];s0.parentNode.insertBefore(s, s0);
})(document);
</script>
<!--Baidu 结束-->
<!--谷歌再营销 开始 Date:13-11-26 By:ShuLF-->
<script type="text/javascript">
var google_conversion_id = 990409835;
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js"></script>
<!--谷歌再营销 结束-->
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/990409835/?value=0&amp;guid=ON&amp;script=0"/>
</div>
</div>
</body>
</html>
