<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>上品折扣网 - 实体店应季正品保障，全网底价折扣特卖</title>
<link href="${localcss}/reset.css" rel="stylesheet" type="text/css">
<link href="${localcss}/layout.css" rel="stylesheet" type="text/css">
<link href="${localcss}/cart.css" rel="stylesheet" type="text/css">
<script type="text/javascript">

<%--添加商品到藏夹
@param button 收藏按钮
--%>
function addToFavorite() {
	var path = window.location;
    $.ajax({
        url:'${ctx}/favorite/add.json',
        type: 'post',
        dataType: 'json',
        data:{'productSID':$("#productsId").val()},
        timeout: 30000,
        error: function() {
        	alert('添加商品到收藏夹失败,请重试');
             return;
        },
        success: function(response) {
        	  var result = response.result;
              var status = result.status;
              var message = result.message;
              if(message=="${sso}"){
            	  $(".login-success").show();
            		setTimeout(function(){
            			 $(".login-success").hide();
            			var href = "${ctx}/login.html?forward="+path;
            			window.location.href=href;
            		},1000); 
              }else{
                alert(message);
              }
        }
    });
}
</script>
</head>
<%@include file="/common/cart_header.jsp" %>
<body <c:if test="${!empty cartVIPlist && !empty remainTime && remainTime gt 0}"> onLoad="timeCounter('timeCounter', '${remainTime}')" </c:if>>
<div id="container">
		<div class="in oz">
				<div class="cart-step step1 mt"></div>
				<h2 class="cart-title">我的购物车</h2>
				
				<c:if test="${!empty cartVIPlist || !empty cartlist }">
				<div class="cart-table">
						<div class="cart-th oz">
								<ul>
										<li class="w-choice">
												<input  type="checkbox" name="ck"
												 value="" id="ckall" onclick="checkEvent();countAll()" checked>
												全选</li>
										<li class="w-goods">商品</li>
										<li class="w-size">尺码</li>
										<li class="w-color">颜色</li>
										<li class="w-price">单价</li>
										<li class="w-quantity">数量</li>
										<li class="w-action">操作</li>
								</ul>
						</div>
						
						<div class="pd-cart">
						<c:if test="${!empty cartVIPlist && !empty remainTime && remainTime gt 0}">
						<div class="shangou mb">
							<h3>以下商品为闪购商品，为您保留&nbsp;<span class="time" id="timeCounter"></span>，请及时结算。<span class="note">（因闪购商品库存有限，规定时间后购物车将清除闪购商品，普通商品不受影响）</span></h3>
							<div class="cart-td">
								 <c:forEach items="${cartVIPlist}" var="item">
								   <input type="hidden" id="productsId" value="${item.productSid}"></input>
									<ul class="oz sg">
											<li class="w-choice">
													<input id="ck${item.sid}" name="ck" type="checkbox" value="${item.sid}"  onclick="countAll()" checked>
											</li>
												<li class="w-goods"> <a href="${shopin}/product/${item.productSid}.html"><img src="${item.proPicture}" width="56" height="56"></a><div class="w-goods-name"> <a href="${shopin}/product/${item.productSid}.html">${item.name}</a></div>
													<div class="txt-gray"><div>编码：${item.proSku}</div><div>市场价：<del>￥${item.originalPrice}</del></div></div>
											</li>
											<li class="w-size">${item.size}</li>
											<li class="w-color">${item.color}</li>
											<li class="w-price">￥${item.promotionPrice}</li>
											<li class="w-quantity">
												<div class="clear">
													<input id="qty${item.sid}" type="hidden" value="${item.sid}_${item.qty}_${item.storeCount}_${item.promotionPrice}"/>
													<a class="num_min" href="javascript:void(0)" onclick="setAmount.reduce('#pamountsg${item.sid}'); updateQty(pamountsg${item.sid},${item.sid},${item.promotionPrice},1)">-</a>
													
													<input id="pamountsg${item.sid}" onblur="<c:if test='${item.storeCount<2}'>setAmount.modify2('#pamountsg${item.sid}',${item.storeCount});</c:if><c:if test='${item.storeCount>2}'>setAmount.modify2('#pamountsg${item.sid}',2);</c:if> updateQty(pamountsg${item.sid},${item.sid},${item.promotionPrice},1)" type="text" value="${item.qty}" size="8" maxlength="8" class="qtytext">
													<a class="num_plus" href="javascript:void(0)" onclick="<c:if test='${item.storeCount<2}'>setAmount.add2('#pamountsg${item.sid}',${item.storeCount});</c:if><c:if test='${item.storeCount>=2}'>setAmount.add2('#pamountsg${item.sid}',2);</c:if> updateQty(pamountsg${item.sid},${item.sid},${item.promotionPrice},1)">+</a>
												</div>
												<div>库存：${item.storeCount}件</div>
											</li>
													
													
											<li class="w-action"><a href="javascript:void(0);" onclick='setValue(${item.sid},1)' class="delete" id="open_e_${item.sid}">删除</a>&nbsp;&nbsp;<a style="cursor:pointer;" onclick="addToFavorite();">收藏</a></li>
									</ul>
									</c:forEach> 
							</div>
						</div>
						</c:if>
						<div class="delete-list tc undis" id="idPop_e">
								<h4 class="f14 mb">您确认删除此项吗？</h4>
								<div class="btn-apply"><a href="javascript:void(0);" class="submit" onclick='removeItem()'>确定</a><a href="javascript:void(0);" class="cancel" id="close_a">取消</a></div>
						</div>
						<div class="login-success undis" id="time"><h3 class="mt20 tc f14">请您先登录再进行购物车操作。</h3></div>
						<div class="bos">
							<div class="cart-td">
								<c:forEach items="${cartlist}" var="item">
								<input type="hidden" id="productsId" value="${item.productSid}"></input>
									<ul class="oz pt">
											<li class="w-choice">
													<input id="ck${item.sid}" name="ck" type="checkbox" value="${item.sid}"  onclick="countAll()" checked>
											</li>
												<li class="w-goods"> <a href="${shopin}/product/${item.productSid}.html" target="_blank"><img src="${item.proPicture}" width="56" height="56"></a> <div class="w-goods-name"><a href="${shopin}/product/${item.productSid}.html" target="_blank">${item.name}</a></div>
													<div class="txt-gray"><div>编码：${item.proSku}</div><div>市场价：<del>￥${item.originalPrice}</del></div></div>
											</li>
											<li class="w-size">${item.size}</li>
											<li class="w-color">${item.color}</li>
											<li class="w-price">￥${item.promotionPrice}</li>
											<li class="w-quantity">
												<div class="clear">
													<input id="qty${item.sid}" type="hidden" value="${item.sid}_${item.qty}_${item.storeCount}_${item.promotionPrice}"/>
													<a class="num_min" href="javascript:void(0)" onclick="setAmount.reduce('#pamount${item.sid}'); updateQty(pamount${item.sid},${item.sid},${item.promotionPrice},0)">-</a>
													<input id="pamount${item.sid}" onblur="setAmount.modify2('#pamount${item.sid}',${item.storeCount}); updateQty(pamount${item.sid},${item.sid},${item.promotionPrice},0)" type="text" value="${item.qty}" size="8" maxlength="8" class="qtytext">
													<a class="num_plus" href="javascript:void(0)" onclick="setAmount.add2('#pamount${item.sid}',${item.storeCount}); updateQty(pamount${item.sid},${item.sid},${item.promotionPrice},0)">+</a>
												</div>
												<div>库存：${item.storeCount}件</div>
											</li>
													
													
											<li class="w-action"><a href="javascript:void(0);" onclick='setValue(${item.sid},0)' class="delete" id="open_e_${item.sid}">删除</a>&nbsp;&nbsp;<a style="cursor:pointer;"  onclick="addToFavorite();">收藏</a></li>
									</ul>
								</c:forEach>	
							</div>
						</div>
					</div>
						
						<div class="cart-tf oz">
								<!-- <div class="fl f12 fn">
								<input type="checkbox" value="" id="ckall" onclick="checkEvent('ck','ckall')" checked>
												全选</div> -->
								<div class="tr fr">
										<ul>
												<li>商品总数量：<span id="total" class="txt-red">${total}</span>个</li>
												<li>总金额（不包含运费）：<span id="amount" class="txt-red">${amount}</span>元</li>
										</ul>
								</div>
						</div>
				</div>
				<div class="btn-cart mt clear oz">
				<a class="goon fl" href="${ctx }/index.html">继续购物</a>
				<a class="checkout fr" onclick="tobuy()">立即结算</a>
				</div>
				<div class="txt-gray mt mb25 clear">上品小助手提醒您：选好商品后，请尽快付款！由于该宝贝同时在实体店销售，如果您未能及时付款，有可能被别人抢走哦！
				</div>
				<div class="cl"></div>
				</c:if>
				
				<c:if test="${empty cartVIPlist && empty cartlist }">
				<div class="tc no-cart">购物车内暂时没有商品，您可以 <a href="${ctx }/index.html" class="txt-blue f20 fb">去首页</a> 挑选喜欢的商品</div>
				</c:if>
		</div>
</div>
<%@include file="/common/footer.jsp" %>
<script src="${localjs}/jquery132min.js"></script> 
<script src="${localjs}/mousemove.js"></script> 
<script src="${localjs}/pamount.js"></script> 
<script src="${localjs}/check.js"></script>   
<script src="${localjs}/time.js"></script>
<script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>
<script src="${js}/jquery/jquery-format-0.1.js" type="text/javascript"></script>
<script src="${localjs}/mask.js"></script>
<script>
$(document).ready(function() {
	$(".delete").each(function() {
	  var id = $(this).attr("id");
	  new Pop({ oPop: "idPop_e", zIndex: 1001, mode: ["center", "center"], idOpen: id, idClose: ["close_a"],
		  cover: true, beCover: false, zIndexCover: 1000, colorCover: "#000", opactiyCover: 0.5 });
	});
	
});
//列表排序
$(".sort dd").click(function(){
	$(this).addClass("cur").siblings().removeClass("cur");
});
$(".sort dd, .range dd").hover(function(){
		$(this).addClass("over");
	},function(){
		$(this).removeClass("over");
	});
var range = $(".range dd");
	range.click(function(){
		if($(this).hasClass("cur")){$(this).toggleClass("descend")}else{true};
		$(this).addClass("cur").siblings().removeClass("cur");
	});
</script> 
<script>
//商品筛选
$(function(){
//筛选
	var $category = $('.attrs ul:not(".brandAttrs ul")');
	$.each($category, function(i, n){
		$('li:gt(6)', n).hide().parent().next(".attrMore").show();
	})
	var $toggleBtn = $('.attrs .attrMore a:not(".brandAttrs .attrMore a")');            
	//  获取“显示全部品牌”按钮
	$toggleBtn.click(function(){
		if($(this).text() == '收起') {
			$(this)
				.removeClass("retract")
				.html("更多<i></i>").parent().prev().children('li:gt(6)').hide();
		}else{
			$(this)
				.addClass("retract")
				.html("收起<i></i>").parent().prev().children('li:gt(6)').show();
		}
	});
	//品牌筛选
	var $categoryBrand = $(".brandAttrs ul");
	$.each($categoryBrand, function(i, n){
		$('li:gt(20)', n).hide().parent().next(".attrMore").show();
	})
	var $toggleBtnBrand = $('.brandAttrs .attrMore a');             //  获取“显示全部品牌”按钮
	$toggleBtnBrand.click(function(){
		if($(this).text() == '收起') {
			$(this)
				.removeClass("retract")
				.html("更多<i></i>").parent().prev().children('li:gt(20)').hide();
		}else{
			$(this)
				.addClass("retract")
				.html("收起<i></i>").parent().prev().children('li:gt(20)').show();
		}
	});
	//当前选取并添加至您已选择
	var $currSelect = $(".attr .attrValues li a:not('.colorAttr .attr .attrValues li a')"),$attrName = $(".attrName span").text();
	$currSelect.click(function(){
		$(this).parent().parent().parent().parent().hide();
		$(".selectAttrs ul").append("<li><a>"+$(this).parent().parent().parent().prev().children().html()+"："+$(this).text()+"<i></i></a></li>");
	});
	$(".selectAttrs li").live("click",function(){
		$(this).remove();
		if($(this).children().text() == $attrName){$(this.$attrName).show()}else{return};
		});
	});
</script> 
<script>
//选择颜色
$(function(){
	$(".attrValues a").click(function(){
		$(this).addClass("hover").siblings().removeClass("hover");
		});
	});
</script> 

<script type="text/javascript">

<%--
页面加载,绑定商品数量输入框的onkeyup事件,增加属性值product(SID),old(购物车中原来数量),max(库存数)
--%>
$(document).ready(
   function(){
     $(".pt input[type='hidden']").each(
        function(){
       // 	alert($("#ck").attr("checked"));
          cartIsEmpty=false;
          var str=$(this).val();
          var arr=str.split("_");
          $(this).attr('sid',arr[0]);
          $(this).attr('old',arr[1]);
          $(this).attr('max',arr[2]);
          $(this).attr('price',arr[3]);
        }
    );
     
      $(".sg input[type='hidden']").each(
            function(){
           // 	alert($("#ck").attr("checked"));
              cartIsEmpty=false;
              var str=$(this).val();
              var arrsg=str.split("_");
              $(this).attr('VIPsid',arrsg[0]);
              $(this).attr('VIPold',arrsg[1]);
              $(this).attr('VIPmax',arrsg[2]);
              $(this).attr('VIPprice',arrsg[3]);
              
            }
        );
     
    
  
  });

<%--计算普通购物车中商品的总金额--%>
function countAmount(){
  var amount=0;
  $(".pt input[type='hidden']").each(
      function(){
    	  
    		 if($("#ck"+$(this).attr("sid")).attr("checked")==true){
		         amount+=parseInt($("#pamount"+$(this).attr("sid")).val())*parseFloat($(this).attr('price'));
		         $(this).attr("value",$(this).attr("old"));
    	 }
      }
   );
   return amount;
}
<%--计算闪购购物车中商品的总金额--%>
 
function countVIPAmount(){
  var VIPamount=0;
  $(".sg input[type='hidden']").each(
      function(){
    	  
    		 if($("#ck"+$(this).attr("VIPsid")).attr("checked")==true){
		         VIPamount+=parseInt($("#pamountsg"+$(this).attr("VIPsid")).val())*parseFloat($(this).attr("VIPprice"));
		       //  $(this).attr("value",$(this).attr("old"));
    	 }
      }
   );
   return VIPamount;
}
 
<%--计算普通购物车中商品的总数量--%>
function countQty(){
  var qty=0;
  $(".pt input[type='hidden']").each(
      function(){
    		if($("#ck"+$(this).attr("sid")).attr("checked")==true){
         		qty+=parseInt($("#pamount"+$(this).attr("sid")).val());
    	  }
      }
   );
  return qty;
}
<%--计算闪购购物车中商品的总数量--%>
 
function countVIPQty(){
  var VIPqty=0;
  $(".sg input[type='hidden']").each(
      function(){
    		if($("#ck"+$(this).attr("VIPsid")).attr("checked")==true){
         		VIPqty+=parseInt($("#pamountsg"+$(this).attr("VIPsid")).val());
    	  }
      }
   );
  return VIPqty;
}
 
<%--重新计算上品价的总金额,总数量--%>
function countAll(){
    var cart_total_amount = $.formatMoney(""+(countVIPAmount()+countAmount()));
    var cart_total_qty = countQty()+countVIPQty() ;
	
    $("#total").html(cart_total_qty);
    $("#amount").html(cart_total_amount);
    
}




<%--修改购物车中商品的数量
	@param button 当前点击的按钮元素
--%>
function updateQty(button,productSID,price,cartType){
	 //alert($("#ck"+productSID).checked);
    var value=$(button).val();
    if(value==''||value=='0'||isNaN(value)||!/^\d+$/.test(value)){
        $.popdialog(button,productSID+"_update",'数量输入不正确,应为大于零的数字,并小于库存数量');
        return;
    }
    $.ajax({
          url:'${ctx}/cart/updateqty.json',
          type: 'post',
          dataType: 'json',
          data:{'proDetailSID':productSID,
                'price':price,
                'qty':value,
                'cartType':cartType
              },
          timeout: 30000,
          error: function(){
              $.popdialog(button,productSID+"_update",'更新数量失败,请重试');
              return;
          },
          success: function(response){
              var result=response.result;
              var status=result.status;
              //alert(status);
              if(status&&status=='1'){
            	  countAll();
              } 
              return;
          }
   }); 
}


<%--从购物车中删除商品
@param button 删除按钮
--%>
$(function(){
	var ITEM_SID = -1;
	var CART_TYPE = -1;
	$(".delete").click(function(){
		$(".delete-list").show();
		});
	$(".delete-list .cancel").click(function(){
		$(".delete-list").hide();
		});
	});
function setValue(proDetailSID,cartType) {
	ITEM_SID = proDetailSID;
	CART_TYPE = cartType;
}
function removeItem(){
    $.ajax({
          url:'${ctx}/cart/remove.json',
          type: 'post',
          dataType: 'json',
          data:{'proDetailSID':ITEM_SID,
        	  	'cartType': CART_TYPE
          },
          timeout: 30000,
          error: function(){
              $.popdialog(button,proDetailSID+"_remove",'从购物车中删除商品失败,请重试');
              return;
          },
          success: function(response){
              var result=response.result;
              var status=result.status;
              var message=result.message;
              if(status&&status=='1'){
              }
              window.location.href = '${ctx}/cart/show.html';
              return;
          }
   });
}

<%--去结算购物车--%>

function tobuy(){
    var str = '';
    var ids = $('input[name="ck"]:checked');
    //处理未选择的请求
    if(ids.length==0){
    	alert('您还没有选择要购买的商品');
   //     $.popdialog(button,"buy_warn",'没有选择要购买的商品,请选择后确认');
        return;
    }
    
    for(var i = 0;i<ids.length;i++){
        if(i<ids.length-1){ 
            str += ids[i].value + '_';
        }else{
            str += ids[i].value;
        }
    }
  	 setcookie_("cart_item_details",str);
  	 var url = '${ctx}/order/confirm.html?itemdetails='+str;
     window.location = url; 
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
  
  function setcookie_(c_name, value) {
  var exdate = new Date();
		exdate.setDate(exdate.getDate() + 10);
		document.cookie = "changesid"
				+ "="
				+ escape("web2")
				+ ";domain=.shopin.net"
				+ "; path=/"
				+ (";expires=" + exdate.toGMTString());

				
		var exdate_ = new Date();
		exdate_.setDate(exdate_.getDate() + 1);
		document.cookie = c_name
				+ "="
				+ escape(value)
				+ ";domain=.shopin.net"
				+ "; path=/"
				+ (";expires=" + exdate_.toGMTString());
	}


<%-- --%>
</script>
<!--[if IE 6]>
<script type="text/javascript" src="DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript"> 
DD_belatedPNG.fix('.png');
</script> 
<![endif]-->
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
</div>
</body>
</html>
