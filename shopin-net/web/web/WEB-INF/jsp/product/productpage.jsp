<%--
  Description: Product Page(单品展示页)
  Author:kongm 
  Date: 2013-08-01
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<jsp:include page="/common/meta.jsp" />
<%@ include file="/common/taglibs.jsp"%>
<html>
<head><title>[立即抢购]${product.productName}-100%正品,1-6折天天低价,1小时抢购!实体店供货,10天退换,全国送货上门!-上品折扣官方购物网站-www.shopin.net</title>
<link href="${localcss}/reset.css" rel="stylesheet" type="text/css">
<link href="${localcss}/cart.css" rel="stylesheet" type="text/css">
<link href="${localcss}/layout.css" rel="stylesheet" type="text/css">
<link href="${localcss}/master.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="container">
    <div class="in">
        <div class="breadCrumbs">
            <div class="crumbs fl">当前位置：<a href="${ctx}/index.html" target="_blank">首页</a>-<a href="${searchDomain}/brand/list--${root.brandDisplaySid}------1.html?cid=" target="_blank">${root.brandName}</a>-<a  href="javascript:void(0);" onclick="searchKeyWordNewWindow('${root.categoryName}')">${root.categoryName}</a></div>
        </div>
        <div class="product-list">
            <div class="left">
                <c:choose>
                <c:when test="${saleoff=='1'}">
                <img width="450" height="450" src="http://images.shopin.net/s/images/pic_shouqing.jpg">
                <div class="spec-scroll"><a class="prev">&lt;</a><a class="next">&gt;</a>
                <div class="items">
                    <ul id="nav_item" class="nav_pic">
                        <li><img src="http://images.shopin.net/s/images/pic_shouqing.jpg"></li>
                    </ul>
                </div>
            </div>
                </c:when>
                <c:otherwise>
                <a href="" class="MagicZoom" id="zoom1">
                    <c:forEach var="colorimg" items="${root.proDetail}" varStatus="status">
                    <img style="display: none" id="img"  colorId="${colorimg.colorSid}" width="450" height="450"/>
                    </c:forEach> 
                </a>
                <div class="spec-scroll"><a class="prev">&lt;</a><a class="next">&gt;</a>
                    <div class="items">
                        <ul id="nav_item" class="nav_pic">
                            <c:forEach var="img" items="${root.proPics}" varStatus="status">
                            <li <c:if test="${status.index==0}">id="onlickImg"</c:if> <c:if test="${img.pictureMastBit=='1'&&img.proPictureSizeSid=='0'}">proColorSid="${img.proColorSid}"</c:if>> 
                                <a rel="zoom1" rev="${images}${img.proPictDir}${img.proPictName}">
                                    <img src="${images}${img.proPictDir}${fn:replace(img.proPictName, "jpg", "resize_to.64x64.jpg")}">
                                </a>
                            </li>
                            </c:forEach>	
                        </ul>
                    </div>
                </div>
                </c:otherwise>
                </c:choose>
                <div class="share"><a class="shareto_button"><img src="http://images.shopin.net/images/lg-share-cn.gif" width="130" height="21" alt="分享" style="border:0"/></a> </div>
            </div>
            <div class="right pr <c:if test="${saleoff=='1'}">selPro</c:if>">
            <c:choose>
            <c:when test="${saleoff=='1'}"><div class="selList"></div></c:when>
            <c:otherwise>
            <h2><c:if test="${!empty root.productNameAlias}">${root.productNameAlias}</c:if><c:if test="${empty root.productNameAlias}">${root.productName}</c:if></h2>
            <div class="sub-title">${root.productName}</div>
            <input id="name" type="hidden" value="${root.brandName}&nbsp;${root.productName}">
            <input id="brandName" type="hidden" value="${root.brandName}">
            <input id="shopPrice" class="shopPrice" type="hidden" value="${root.shopPrice}"/>
            <div class="selPrice">
                <ul>
                    <li>上品折扣价：<span class="f14">￥</span><span class="f20">${root.promotionPrice}</span>&nbsp;(${root.offValue*1000/100}折)</li>
                    <li><del>市场正价：${root.originalPrice}元</del><span class="txt-gray pl15"></span></li> 
                </ul>
            </div>
            <div class="selDisc clear">
                <ul class="fl"><li>促销信息：</li></ul>
                <ul class="fr pr"><li><em class="manz">1.3-1.23满200元包邮</em><!--<em><a href="http://www.shopin.net/help/2013shenqidasong.html" target="_blank">1.3-1.15満额赠礼</a></em>--><span class="disct">直降</span>&nbsp;&nbsp;已优惠￥ ${root.originalPrice - root.promotionPrice}&nbsp;&nbsp;</li>
				<div class="manZeng" style="right:131px">
	<b>◆</b><em>◆</em><ul><li>
	<a href="http://www.shopin.net/help/2013shenqidasong.html" target="_blank"><p>包邮活动仅限在线支付方式，仅限中国大陆地区</p></a>
</li></ul></div>
				</ul>
            </div>
            <div class="selList mt">
                <div class="clear mb oz">
                    <h4>全部颜色：</h4>
                    <div class="allColor">
                        <ul id="colorddetails" class="productColor">
                            <c:forEach var="colorimg" items="${root.proDetail }" varStatus="status">
                            <li id="color" colorId="${colorimg.colorSid}"><a rel="zoom1"  colorId="${colorimg.colorSid}"><img alt=""  title="${colorimg.proColor}"></a></li>
                            </c:forEach> 	
                        </ul>
                    </div>
                </div>
                <div class="clear mb oz ">
                <h4 class="fl">选择尺码：</h4>
                <div class="selSize">
                <c:forEach var="sizes" items="${root.proDetail}" varStatus="status">
                    <ul class="productSize" <c:if test="${status.index!=0}">style="display: none;"</c:if>>
                        <c:forEach var="size" items="${sizes.proStans}">
                        <li pro_sum="${size.proSum}" pro_detail_id="${size.proDetailSid}">${size.proStanName}</li>
                        </c:forEach>
                    </ul>
                </c:forEach>
                <a href="#size">尺码对照表>></a> </div>
                </div>
                <div class="clear ptb5 mb oz">
                    <h4 class="fl">数量：</h4>
                    <div class="pamount fl">
                    <span class="decrease" href="javascript:void(0)" onclick="setAmount.reduce('#pamount')">-</span>
                    <c:choose>
                        <c:when test="${root.activityFlg=='10'}">
                        <input id="pamount" onblur="setAmount.modify2('#pamount',2)" type="text" value="1" size="8" maxlength="8" class="ac-input">
                        <span id="flIncrease" class="increase" href="javascript:void(0)" onclick="setAmount.add2('#pamount',2);flashMessage();">+</span>
                        </c:when>
                        <c:otherwise> 
                        <input id="pamount" onkeyup="setAmount.modify('#pamount')" type="text" value="1" size="8" maxlength="8" class="ac-input">
                        <span class="increase" href="javascript:void(0)" onclick="setQuntity()">+</span>
                        </c:otherwise>
                     </c:choose>
                    <span id="storeTotal" class="ml25">(库存：件)</span></div>
                </div>
                <div class=" clear mb pt oz">
                    <div class="btn-product fl"><a class="buy">立即购买</a><a class="mycart">放入购物车</a></div>
                    <div class="fl mt4 pr w210">
                        <div class="fl" onclick="addToFavorite();">
                        <a style="cursor:pointer;" class="favor">收藏该商品</a></div>
                    </div>
                </div>
            </div>
            <div class="chengxin"></div>
            </c:otherwise>
            </c:choose>
            </div>
        </div>
    </div>
    <div class="cl"></div>
    <div class="in">
        <div class="SMsidebar fl">
            <div class="bos oz mt">
                <div class="hotList prolist">
                    <div class="title">品牌推荐</div>
                    <ul>
                        <c:forEach var="samBrand" items="${root.sameBrand}">
                        <li>
                            <a class="proimg" href="${ctx}/product/${samBrand.sid}.html" target="_blank"><img src="${images}${fn:replace(samBrand.proPictureUrl,".jpg","_1.jpg")}" width="58" height="73"></a>
                            <div class="proCate"><a href="${ctx}/product/${samBrand.sid}.html" target="_blank">${samBrand.brandName }</a></div>
                            <h4><a href="${ctx}/product/${samBrand.sid}.html" target="_blank">
                            <c:if test="${!empty samBrand.productName }">
                                ${samBrand.productNameAlias}
                            </c:if>
                            <c:if test="${empty samBrand.productNameAlias }">
                                ${samBrand.productName }
                            </c:if>
                            </a></h4>
                            <div class="proKey"><em>HOT</em></div>
                            <div class="proPrices"><span>上品价：¥${samBrand.promotionPrice }</span></div>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            <div class="bos oz mt">
                <div class="hotList prolist">
                    <div class="title">同类热卖</div>
                    <ul>
                        <c:forEach var="sameCategory" items="${root.sameCategory}">
                        <li>
                            <a class="proimg" href="${ctx}/product/${sameCategory.sid}.html" target="_blank"><img src="${images}${fn:replace(sameCategory.proPictureUrl,".jpg","_1.jpg")}" width="58" height="73"></a>
                            <div class="proCate"><a href="${ctx}/product/${sameCategory.sid}.html" target="_blank">${sameCategory.brandName }</a></div>
                            <h4><a href="${ctx}/product/${sameCategory.sid}.html" target="_blank">
                            <c:if test="${!empty sameCategory.productName }">
                                ${sameCategory.productNameAlias}
                            </c:if>
                            <c:if test="${empty sameCategory.productNameAlias }">
                                ${sameCategory.productName }
                            </c:if>
                            </a></h4>
                            <div class="proKey"><em>HOT</em></div>
                            <div class="proPrices"><span>上品价：¥${sameCategory.promotionPrice }</span></div>
                        </li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
		<div class="mt ml fl w798">
            <div class="box-product">
                <a id="intro"></a><div class="onSale">
                <ul class="tabHd oz">
                    <li class="cur"><a href="#intro">商品介绍</a></li>
                    <li style="background:#57676f"><a style="background:#57676f" href="#record">抢购记录</a></li>
                    <li style="background:#57676f"><a style="background:#57676f" href="#guide">购物指南</a></li>
                </ul>
                </div>
                <div class="tabBd p10">
                    <div class="item">
                    	<div class="clear oz">
							<h2 class="detail">
								商品属性 <i>Property</i>
							</h2>
							<ul class="attributes-list clear oz">
								<li title="${prop.value}">品牌：${root.brandName}</li>
								<li title="￥${root.promotionPrice}">价格：￥${root.promotionPrice}</li>
								<li title="${root.proSku}">款号：${root.proSku}</li>
								<c:forEach items="${root.props}" var="prop">
									<li title="${prop.value}">${prop.key}：${prop.value}</li>
								</c:forEach>
							</ul>
						</div>
                        <a id="size"></a><h2 class="detail">尺码对照表<i>Size</i></h2>
                        <div class="tc mb25"><img src="${images}/sizeref/${root.brandSid}-${root.categorySid}.jpg" border="0" onerror="javascript:this.src='${images}/sizeref/default.jpg'"/></div>
                        <h2 class="detail">商品详情<i>Detail</i></h2>
                        <div class="attributes-pic" id="piccolor" >
                            <c:forEach var="pic" items="${root.proPics }" varStatus="status">
                            <img proColorSid="${pic.proColorSid}" src="${images}${pic.proPictDir}${pic.proPictName}" style="display: none">
                            <br>
                            </c:forEach>
                            <br>
                            <br>
                        </div> 
                    </div>
                </div>
            </div>
				<!--抢购记录-->
				<div class="box-product mb">
					<a id="record"></a>
					<div class="onSale">
						<ul class="tabHd oz">
							<li style="background:#57676f"><a style="background:#57676f" href="#intro">商品介绍</a></li>
							<li class="cur"><a href="#record">抢购记录</a></li>
							<li style="background:#57676f"><a style="background:#57676f" href="#guide">购物指南</a></li>
						</ul>
					</div>
					<div class="tabBd p10">
						<div class="item">
							<div class="buy-list">
								<div class="th">
									<ul class="clear oz">
										<li class="tl">买家</li>
										<li>颜色</li>
										<li>尺码</li>
										<li>购买数量</li>
										<li class="tl">成交时间</li>
									</ul>
								</div>
								<div class="td"></div>
							</div>

						</div>
					</div>
				</div>
				<!--购物指南-->
				<div class="box-product mt">
                <a id="guide"></a><div class="onSale">
                    <ul class="tabHd oz">
                        <li style="background:#57676f"><a style="background:#57676f" href="#intro">商品介绍</a></li>
                        <li style="background:#57676f"><a style="background:#57676f" href="#record">抢购记录</a></li>
                        <li class="cur"><a href="#guide">购物指南</a></li>
                    </ul>
                </div>
                <div class="tabBd p10">
                    <div class="item">
                        <div class="advice">
                            <div class="border clear">
                                <dl>
                                    <dt class="tit1">正品保障</dt>
                                    <dd>上品折扣网www.shopin.net为上品折扣百货连锁店 网络商场，不欺不诈，诚信经营。 </dd>
                                </dl>
                                <dl>
                                    <dt class="tit2">正品保障</dt>
                                    <dd>全国范围内快递送货上门， <br>北京、天津地区开通了货到付款服务。 </dd>
                                </dl>
                                <div class="cl"></div>
                                <div class="more">更多关于上品折扣商品及支付配送方式的各类常见问题，详情请 <a href="${ctx}/help/distime.html" target="_blank">点击这里>></a></div>
                            </div>
                        </div>
                        <div class="advice-note">您可以在<a href="${ctx}/login.html">登录</a>后发布商品咨询（还没有上品折扣网账号？<a href="${ctx}/goRegister.html">立即注册</a>）</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="cl"></div>
</div>
<!--成功添加商品-->
<div id="addSuccess" class="undis">
<div class="cart-success oz">
	<div class="pr list"><i></i>
		<h3>添加成功！</h3>
		<p id="response"></p>
		<p class="clear">
		<div class="load-list undis mb">正在转向订单信息填写页面，请稍候！</div>
		<a onClick="commitCart();" href="javascript:void(0);"  class="btn-tocart fl">去购物车结算</a><a href="javascript:void(0);" class="guang closeBtn">再逛逛</a>
		</p>
	</div>
	<div class="mt">
		<h4 class="fn">购买此商品的用户还买了：</h4>
		<c:forEach var="samBrand" items="${root.sameCategory}" end="3">
			<ul>
                <li><a class="proimg" href="${ctx}/product/${samBrand.sid}.html" target="_blank"><img src="${images}${fn:replace(samBrand.proPictureUrl,".jpg","_1.jpg")}" width="58" height="73"></a></li>
                <li><a href="${ctx}/product/${samBrand.sid}.html" target="_blank">${samBrand.productName}</a></li>
                <li><span class="price">¥${samBrand.promotionPrice}</span></li>
			</ul>
		</c:forEach>
	</div>
</div>
</div>
<!--支付提示-->
<div id="idPop_e" class="undis">
<div class="payment-success oz"> 
	<p class="ml5">请您在新打开的网上银行页面进行支付，支付完成前请不要关闭该窗口。</p>
	<div class="btn-apply mt20 pl25"> <a class="confirm" href="javascript:void(0);" onclick="javascript:window.location='${sso}/myshopin/orders.html'">支付成功</a> <a class="cancel1" href="http://www.shopin.net/help/abcbank.html"  target="_blank">遇到问题</a> </div>
</div>
</div>
<!--确认删除-->
<div class="delete-list tc undis oz" id="idPop_del">
    <div class="p10"><input class="submit_btn" type="button" onclick='removeItem()' value="确认"><input class="cancel_btn" type="button" value="取消"></div>
</div>
<script src="${localjs}/mousemove.js"></script> 
<script src="${localjs}/mz-packed.js"></script> 
<script src="${localjs}/pamount.js"></script> 
<script src="${localjs}/jquery.skygqbox.1.3.js"></script>
<script src="http://images.shopin.net/js/shareto_button.js" charset="utf-8"></script>
<script>
//跳转搜索页转码
function searchKeyWordNewWindow(keyword) {
	var forword = "${searchDomain }/search.html?keyword=" + encodeURI(keyword);
	window.location.href=forword;
}
function searchKeyWord(keyword) {
	var forword = "${searchDomain }/search.html?keyword=" + encodeURI(keyword);
	window.location.href=forword;
}
//闪购商品限购提示
var value = 1;
function flashMessage() {
	var qty = $("#pamount").val();
	if(qty == 2 && value > 2) {
		$("#flashMsg").css("display","block");
		setTimeout(function(){
			$("#flashMsg").css("display","none");
		},1500);
		value = 0;
	}
	value ++;
	return;
}
var name;
var picture;
$(function($) {
	picture= $("#img").eq(0).attr("src"); 
	name=$("#name").val();
	//下方大图部分默认加载为第一个颜色主图的图片
	var detailcolorSid=$(".productColor a").eq(0).attr("colorId");
	$(".attributes-pic img").each(function(i){
		var proColorSid = $(".attributes-pic img").eq(i).attr("proColorSid");
		 if (detailcolorSid==proColorSid) {
			 $(".attributes-pic img").eq(i).show();
		 }else{
			 $(".attributes-pic img").eq(i).hide();
		}
	});
	//解决页面未加载完点击图片跳转问题  
	document.onreadystatechange = function(){ 
		if(document.readyState=="complete"){  
			$(".nav_pic a").each(function(i){
				$(".nav_pic a").eq(i).attr("href", $(".nav_pic a").eq(i).attr("rev"));
			});
			$(".productColor a").each(function(i){
				var colorId = $(".productColor").children().eq(i).attr("colorId");
				if ($("#nav_item li[proColorSid='" + colorId + "']").find("a").length > 0) {
					$(".productColor a").eq(i).attr("rev", $("#nav_item li[proColorSid='" + colorId + "']").find("a").attr("rev").replace("64x64", "400x400"));
					$(".productColor a").eq(i).attr("href", $("#nav_item li[proColorSid='" + colorId + "']").find("a").attr("href").replace("64x64", "400x400"));
				}else{
					$(".productColor a").eq(i).attr("rev", "http://images.shopin.net/images/nophoto.resize_to.400x400.jpg");
				}
			});
			//鼠标移上显示大图
			$("#zoom1").each(function(i){
				var colorId = $(".productColor").children().eq(i).attr("colorId");
				if ($("#nav_item li[proColorSid='" + colorId + "']").find("img").length > 0) {
					$("#zoom1").attr("href", $("#nav_item li[proColorSid='" + colorId + "']").find("a").attr("href").replace("64x64", "400x400"));
				}else{
					$("#zoom1").attr("href", "http://images.shopin.net/images/nophoto.resize_to.400x400.jpg");
				}
			});
        }
   } 
	$("#color").eq(0).addClass("hover");
	$("#img").eq(0).show(); 
});

//选择颜色
$(function(){
	$(".productColor a").click(function(){
		var curIndex = $(".productColor a").index(this);
		picture=this;
		$(".selSize").find(".productSize").css("display","none");
		$(".selSize").find(".productSize").eq(curIndex).show();
		$(".productColor li").eq(curIndex).addClass("hover").siblings().removeClass("hover");
		//下方大图加载所选颜色主图下的图片
		var colorSid;
		colorSid=$(this).attr("colorId");
		$(".attributes-pic img").each(function(i){
			$(".attributes-pic img").eq(i).hide();
			var proColorSid = $(".attributes-pic img").eq(i).attr("proColorSid");
			if (colorSid==proColorSid) {
				$(".attributes-pic img").eq(i).show();
			}else{
				$(".attributes-pic img").eq(i).hide();
			}
		});
	});
});
//选择尺寸
$(function(){
	$(".selSize li").click(function(){
		$(this).addClass("hover").siblings().removeClass("hover");
	});
});

var prodetailSid;
//尺码选中
$(".productSize li").click(function() {
	var activityFlg = '${root.activityFlg}';
	var stock = 0;
	var price = '${root.promotionPrice }';
	var shopPrice = '${root.shopPrice }';
	if(shopPrice != null && shopPrice !="" &&shopPrice >0) {
		price = shopPrice;
	}
	prodetailSid = $(this).attr("pro_detail_id");
	if(activityFlg == "10"){
		//闪购商品
		//stock = getStock($(this).attr("pro_detail_id"),$('.f20').html(),1);
		stock = getStock($(this).attr("pro_detail_id"),price,1);
	}else if(activityFlg == "11"){
		stock = getStock($(this).attr("pro_detail_id"),price,2);
	}else{
		//普通商品
		stock = getStock($(this).attr("pro_detail_id"),price,0);
	}
	var storediv = "(库存：" + stock + "件)";
	$("#storeTotal").html(storediv);
});
var stock = 0;;
//获取商品库存，闪购商品flag为1，普通商品为0或空
function getStock(proDetilSid, price,flag) {
	$.ajax({
		url:'${ctx}/getStock.json',
		type: 'post',
		dataType: 'json',
		async :false,
		data:{'proDetailSid':proDetilSid,'price':price,'flag':flag},
		timeout: 30000,
		error: function() {
			 //$.popdialog($("#pro_qty_area"), "check_store", "获取库存出错");
			 return;
		 },
		success: function(response) {
			var result = response.result;
			stock = result;
		   
		}
	});
	return stock;
}
function setQuntity(){
	setAmount.add2('#pamount',stock);
}
var productSid=${root.sid};
$(".buy").click(function(){
	var price= '${root.promotionPrice}';
	var proQuantity= $("#pamount").val();
	var activityFlg='${root.activityFlg}';
	var shopPrice = '${root.shopPrice}';
	var brandSid = '${root.brandSid}';
	if (prodetailSid == null) {
		var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>请选择颜色和尺码</p>";
		$(msg).skygqbox({autoClose:2000});
		//alert("请选择颜色和尺码");
		return;
	}
	if(stock==0){
		var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>库存不足</p>";
		$(msg).skygqbox({autoClose:2000});
		//alert('库存不足');
		return;
	}
	if(activityFlg=="10"){
		var isLogin=${isLogin};
		if(isLogin=="0"){
			$("#time").show();
			setTimeout(function(){
				$("#time").hide();
				var href = "${ctx}/login.html?forward=/product/"+productSid+".html";
				window.location.href=href;
			},1000);
		}else{
			$.ajax({
				url:'${ctx}/cart/add.json',
				type: 'post',
				dataType: 'json',
				data:{'proDetailSID':prodetailSid,
				'promotionPrice':price,
				'proQuantity':proQuantity,
				'cartType':"1",
				'picUrl':picture,
				'stock':stock,
				'name':name,
				'shopPrice':shopPrice,
				'brandSid':brandSid,
				'brandName':$("#brandName").val()
			},
			timeout: 30000,
			error: function() {
				var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>加入购物车失败</p>";
				$(msg).skygqbox({autoClose:2000});
				//alert("加入购物车失败");
			},
			success: function(response){
				var result=response.result;
				var status=result.status;
				if(status&&status=='1'){
					setcookie("cart_item_details",prodetailSid,86400,"/","shopin.net","");
					var url = '${ctx}/order/confirm.html?itemdetails='+prodetailSid;
					window.location.href = url;
				}else{
					var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>加入购物车失败</p>";
					$(msg).skygqbox({autoClose:2000});
					//alert("加入购物车失败");
				}
			}
		});
	}
	}else{
		$.ajax({
			url:'${ctx}/cart/add.json',
			type: 'post',
			dataType: 'json',
			data:{'proDetailSID':prodetailSid,
			'promotionPrice':price,
			'proQuantity':proQuantity,
			'cartType':"0",
			'picUrl':picture,
			'stock':stock,
			'name':name,
			'shopPrice':shopPrice,
			'brandSid':brandSid,
			'brandName':$("#brandnName").val()
		},
		timeout: 30000,
		error: function() {
			var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>加入购物车失败</p>";
			$(msg).skygqbox({autoClose:2000});
			//alert("加入购物车失败");
		},
	success: function(response){
		var result=response.result;
		var status=result.status;
		if(status&&status=='1'){
			setcookie("cart_item_details",prodetailSid,86400,"/","shopin.net","");
			var url = '${ctx}/order/confirm.html?itemdetails='+prodetailSid;
			window.location.href = url;
		}else{
			var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>加入购物车失败</p>";
			$(msg).skygqbox({autoClose:2000});
			//alert("加入购物车失败");
		}
	}
}
)}
});
function commitCart(){
	$(".load-list").show();
	$(".btn-tocart").hide();
	$(".guang").hide();
	window.location.href="${ctx}/cart/show.html";
}
<%--定义一个向Cookie写入的函数
@param button   @author kongming  new create
--%>
function setcookie(cookieName, cookieValue, seconds, path, domain, secure) {
	cookiedomain = 'www.shopin.net', cookiepath = '/';
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
$(".mycart").click(function() {
	var price= '${root.promotionPrice}';
	var shopPrice = '${root.shopPrice}';
	var proQuantity = $("#pamount").val();
	var activityFlg = '${root.activityFlg}';
	var brandSid = '${root.brandSid}';
	//var proStore = $("#storeTotal").html();
	if (prodetailSid == null) {
		var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>请选择颜色和尺码</p>";
		$(msg).skygqbox({autoClose:2000});
		//alert("请选择颜色和尺码");
		return;
	}
	if(stock==0){
		var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>此款商品已售完</p>";
		$(msg).skygqbox({autoClose:2000});
	   //alert('此款商品已售完');
	   return;
	}
	if(proQuantity != null && stock != null && stock < proQuantity) {
		var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>商品数量不能大于库存</p>";
		$(msg).skygqbox({autoClose:2000});
		//alert("商品数量不能大于库存");
		$("#pamount").val(stock);
		return;
	}
	if(activityFlg=="10"){
		//闪购商品
		var isLogin=${isLogin};
		if(isLogin=="0"){
			$("#time").show();
			setTimeout(function(){
				$("#time").hide();
				var href = "${ctx}/login.html?forward=/product/"+productSid+".html";
				window.location.href=href;
			},1000);
		}else{
			$.ajax({
				//add by jingpeng start
				//根据proDetailSid判断闪购购物车中是否存在该商品,存在返回true,不存在返回false
				url:'${ctx}/cart/proDetailExistInFlashCart.json',
				type: 'post',
				dataType: 'json',
				async:false,
				data:{
					'proDetailSid':prodetailSid
				},
				timeout: 30000,
				error: function() {
					var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>加入购物车失败</p>";
					$(msg).skygqbox({autoClose:2000});
					//alert("加入购物车失败");
				},
				success: function(response) {
					if(response.ifExist == 'false') {
						//闪购购物车中不存在该商品，将该商品添加到闪购购物车
						$.ajax({
							url:'${ctx}/cart/add.json',
							type: 'post',
							dataType: 'json',
							data:{'proDetailSID':prodetailSid,
							'promotionPrice':price,
							'shopPrice':shopPrice,
							'proQuantity':proQuantity,
							'cartType':"1",
							'picUrl':picture,
							'stock':stock,
							'name':name,
							'brandSid' : brandSid,
							'brandName' : $("#brandName").val()
						},
						timeout: 30000,
						error: function() {
							var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>加入购物车失败</p>";
							$(msg).skygqbox({autoClose:2000});
							//alert("加入购物车失败");
						},
						success: function(response){
							var result=response.result;
							var status=result.status;
							if(status&&status=='1'){
								var amout=response.amout;
								var quantity=response.quantity;
								$("#response").html("购物车中共有"+quantity+"件商品，合计￥"+amout+"元");
							}
								 $('#addSuccess').skygqbox({title:'添加成功'});
								//$(".cart-success").show();
							}
						});
					}else if(response.ifExist == 'true'){
						//闪购购物车中已经存在该商品
						var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>该活动商品已存在购物车中</p>";
						$(msg).skygqbox({autoClose:2000});
						//alert("该活动商品已存在购物车中");
						return;
					}
				}
			});
		}
        }else {
			//普通商品
			$.ajax({
				url:'${ctx}/cart/add.json',
				type: 'post',
				dataType: 'json',
				data:{'proDetailSID':prodetailSid,
				'promotionPrice':price,
				'shopPrice':shopPrice,
				'proQuantity':proQuantity,
				'cartType':"0",
				'picUrl':picture,
				'stock':stock,
				'name':name,
				'brandSid' : brandSid,
				'brandName' : $("#brandName").val()
			},
			timeout: 30000,
			error: function() {
				var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>加入购物车失败</p>";
				$(msg).skygqbox({autoClose:2000});
				//alert("加入购物车失败");
			},
			success:function(response){
				var result=response.result;
				var status=result.status;
				if(status&&status=='1'){
					var amout=response.amout;
					var quantity=response.quantity;
					$("#response").html("购物车中共有"+quantity+"件商品，合计￥"+amout+"元");
				}
				$('#addSuccess').skygqbox({title:'添加成功'});
			}
		});
	}; 
});
$(function(){
	$(".btn-tocart").click(function(){
		$(".load-list").show();
		$(this).hide();
	});
});
$(".productColor img").each(function(i){
	var colorId = $(".productColor").children().eq(i).attr("colorId");
	if ($("#nav_item li[proColorSid='" + colorId + "']").find("img").length > 0) {
		$(".productColor img").eq(i).attr("src", $("#nav_item li[proColorSid='" + colorId + "']").find("img").attr("src").replace("64x64", "400x400"));
	}else{
		$(".productColor img").eq(i).attr("src", "http://images.shopin.net/images/nophoto.resize_to.400x400.jpg");
	}
});
$("#img").each(function(i){
	var colorId = $(".productColor").children().eq(i).attr("colorId");
	 if ($("#nav_item li[proColorSid='" + colorId + "']").find("img").length > 0) {
		 $("#img").attr("src", $("#nav_item li[proColorSid='" + colorId + "']").find("img").attr("src").replace("64x64", "400x400"));
	}else{
		$("#img").attr("src", "http://images.shopin.net/images/nophoto.resize_to.400x400.jpg");
	}
});
$(function(){
	$(".hotList li").hover(function(){
		$(this).addClass("over");
	},function(){
		$(this).removeClass("over");
	});
	$(".selDisc em.manz,.manZeng").hover(function(){
	$(".manZeng").show();
	},function(){
    $(".manZeng").hide();
});
});
//弹窗
$(function(){
	//已登录 成功添加到购物车
	$("#addProduct").click(function(){
		$('#addSuccess').skygqbox({title:'添加成功'});
	});
	//确认支付提示
	$("#idPop").click(function(){
		$('#idPop_e').skygqbox({title:'支付'});
	});
	//确认删除
	$("#idDel").click(function(){
		$('#idPop_del').skygqbox({title:'您确认删除此项吗？'});
	});
	//取消
	$(".cancel_btn,.closeBtn").click(function(){
		$.skygqbox.hide();
	});
});
//闪购商品限购提示
function addToShangou(){
	var message = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>该商品为闪购商品，同码同色限购2件。</p>";
	$(message).skygqbox({autoClose:2000});
};
//异步获取抢购记录
$(function(){
	$.ajax({
        url:'${ctx}/product/getSaleRecords.json',
        type: 'post',
        dataType: 'json',
        data:{
        	'id' : "${root.sid}"
        },
        timeout: 30000,
        error: function() {
        	$(".td").html("");
        },
        success: function(response) {
        	var result=response.result;
        	var obj = eval('('+result+')');
        	var flag = obj.success;
        	if(flag == "true") {
            	var records = obj.list;
            	var td = "";
            	for(var i=0; i < records.length; i++) {
            		var content="";
            		var record = records[i];
            		var member = record.memberEmail.substring(0,5) + "***";
            		if(i%2 == 0){
	            		content = "<ul class='clear oz bgc'><li class='tl li1'>"+ member +"</li><li>"+ record.proColor+"</li><li>"+record.proSize +"</li><li>"+record.saleSum+"</li><li class='tl'>"+record.saleTime+"</li></ul>";
            		} else {
            			content = "<ul class='clear oz'><li class='tl li1'>"+ member +"</li><li>"+ record.proColor+"</li><li>"+record.proSize +"</li><li>"+record.saleSum+"</li><li class='tl'>"+record.saleTime+"</li></ul>";
            		}
            		td += content;
            	}
          		$(".td").html(td);
        	} else {
        		$(".td").html("");
        	}
        }
    });
});

//添加商品到藏夹
//@param button 收藏按钮
function addToFavorite() {
	var proPic=$(".productColor img").eq(0).attr("src");
	var path = window.location;
    $.ajax({
        url:'${ctx}/favorite/add.json',
        type: 'post',
        dataType: 'json',
        data:{'productSID':'${root.sid}',
		'proPic':proPic	
    },
	timeout: 30000,
	error: function() {
		var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>添加商品到收藏夹失败,请重试</p>";
			$(msg).skygqbox({autoClose:2000});
		//alert('添加商品到收藏夹失败,请重试');
		return;
	},
	success: function(response) {
		var result = response.result;
		var status = result.status;
		var message = result.message;
		if(message=="${sso}"){
			var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>请您先登录再进行购物车操作</p>";
			$(msg).skygqbox({autoClose:2000});
			//$("#time").show();
			setTimeout(function(){
				//$("#time").hide();
					var href = "${ctx}/login.html?forward="+path;
					window.location.href=href;
				},2200);  
			}else{
				var msg = "<p style='width:300px;padding:20px;line-height:40px;text-align:center'>"+ message +"</p>";
				$(msg).skygqbox({autoClose:2000});
				//alert(message);
			}
      }
  });
}
</script>
</body>
</html>