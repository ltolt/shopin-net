<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>上品折扣网 - 实体店应季正品保障，全网底价折扣特卖</title>
<link href="${localcss}/reset.css" rel="stylesheet" type="text/css">
<link href="${localcss}/layout.css" rel="stylesheet" type="text/css">
<link href="${localcss}/cart.css" rel="stylesheet" type="text/css">
</head>
<%@include file="/common/cart_header.jsp" %>
<body>
<div id="container">
		<div class="in oz">
				<div class="cart-step step4 mt"></div>
				<div class="buy-success mt mb pr">
				<div class="ml78">
				<h2 class="mt20 pr"><i class="ico-success"></i>感谢您，订单已提交成功！</h2>
				<p>您的订单号：${order.orderNo }<u>|</u>${order.paymentModeName }：
				<span class="txt-red fb">￥${waitpay }</span> <u>|</u>${order.sendTypeName }&nbsp;&nbsp;&nbsp;${order.memo }</p>
				<p class="txt-edit"><a href="">查看订单 >></a></p>
				<div class="mt20 pay-success mb25">
				<h3>送达时间：</h3>
				<p class="mb">常规情况下，您的订单提交并付款后，我们会在上品商业旗下多家实体店进行货品调拨，所有货品统一调拨至物流中心后再配送至您指定的地点。（调拨时间通常为1-3天后开始配送发货）</p>
				<h3>温馨提示：</h3>
				<p>由于我们商品都是出自实体店，并且网络跟实体店是同步销售的，为了保证网络库存更准确，在您下订单之前选好您想购买的商品，一旦订单生成之后就没有办法修改。请您谅解！</p>
				</div>
				</div>
				</div>
		</div>
</div>
<%@include file="/common/footer.jsp" %>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>  
<script src="${localjs}/mousemove.js"></script> 
<script src="${localjs}/pamount.js"></script> 
<script src="${localjs}/jquery132min.js"></script>
<script language="javascript">  
    $(function(){
		$(".confirm-pay li").click(function(){
		$(this).children("input:radio").attr("checked", "checked"); 
		$(this).addClass("selected").siblings().removeClass("selected");
		});
		});
	</script>
		<script language="javascript">  
    $(function(){
			$(".address-list li").click(function(){
			$(this).children("input:radio").attr("checked", "checked"); 
			$(this).addClass("selected").siblings().removeClass("selected");
			});
			});
		</script>
<script>
$(function(){
	$(".payDetail .item:not(:first)").hide();
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
<script>
$(function(){
	var $receivingBtn = $(".oc-btnReceiving")
	$receivingBtn.click(function(){
		$(".address ul").addClass("selected").siblings().removeClass("selected");
	});
$(".address-edit").click(function(){
$(".new-address").show();
});
$(".address-del").click(function(){
		$(".delete-list").show();
});
$(".delete-list .cancel").click(function(){
		$(".delete-list").hide();
});
//收货人信息
var editBtn = $(".address .txt-edit a");
var editCon = $(".address-list");
editBtn.click(function(){
	editCon.toggle();
	if($(this).text()=='修改>>'){
			$(this).text("取消>>");
		}else{
			$(this).text("修改>>");
		};
});
//支付配送
var payBtn = $(".distr .txt-edit a");
var payCon = $(".distr-list");
payBtn.click(function(){
	payCon.toggle();
	if($(this).text()=='修改>>'){
			$(this).text("取消>>");
			$(".distr-detail").hide();
		}else{
			$(this).text("修改>>");
		};
});
$(".btn-distr").click(function(){
$(".distr-list").show();
$(".distr-detail").hide();
});

//添加新地址
var addNewAddress = $(".new-address");
$(".address-list input:radio").each(function(){
     if($("#newAddress").attr("checked") == true)
		 	addNewAddress.show();
     $(this).click(function(){
				if($("#newAddress").attr("checked") == true){
					addNewAddress.show();
					}else{
						addNewAddress.hide();
						};
     });
    });

});
</script>
<script>
$(".tWeixin").hover(function(){
		$(".tCode").show();
		},function(){
  $(".tCode").hide();
});

</script>
<!--[if IE 6]>
<script type="text/javascript" src="DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript"> 
DD_belatedPNG.fix('.png');
</script> 
<![endif]-->
</body>
</html>
