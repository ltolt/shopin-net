<%--
  Description:购物车
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>我的购物车-上品折扣网www.shopin.net</title>
<link href="${css}/master.css" rel="stylesheet" type="text/css" />
<link href="${css}/mycart.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .table_css{border:1px solid #ff9900;border-collapse:collapse;}
    .td_css{border:1px solid #ff9900;}
</style>
<script type="text/javascript" src="${js}/piaoqian.js"></script>
<script src="${js}/ifocus.js" type="text/javascript"></script>
<script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>
<script src="${js}/jquery/jquery-format-0.1.js" type="text/javascript"></script>
<script type="text/javascript">
      <%--
      页面加载,绑定商品数量输入框的onkeyup事件,增加属性值product(SID),old(购物车中原来数量),max(库存数)
      --%>
      $(document).ready(
         function(){
          $("#cart_table input[type='text']").each(
              function(){
                cartIsEmpty=false;
                var str=$(this).prev().val();
                var arr=str.split("_");
                $(this).attr('product',arr[0]);
                $(this).attr('old',arr[1]);
                $(this).attr('max',arr[2]);
                $(this).attr('price',arr[3]);
                $(this).attr('oldprice',arr[4]);
                $(this).attr('productListSID',arr[5]);
                $(this).attr('value',arr[1]);
                $(this).bind("keyup",function(){
                   value=$.trim($(this).val());
                   value=value.replace(/\D/gi,"");
                   if(value==''||value=='0'||parseInt(value)>parseInt($(this).attr("max"))){
                       value=$(this).attr("old");
                   }
                   $(this).attr("value",value);
                });
              }
          );
        });

      <%--计算购物车中商品的总金额--%>
      function countAmount(){
        var amount=0;
        $("#cart_table input[type='text']").each(
            function(){
               amount+=parseInt($(this).attr("old"))*parseFloat($(this).attr("price"));
               $(this).attr("value",$(this).attr("old"));
            }
         );
         return $.formatMoney(""+amount);
      }

      <%--计算购物车中商品的打折前的总金额--%>
      function countAmountOld(){
        var amount=0;
        $("#cart_table input[type='text']").each(
            function(){
              amount+=parseInt($(this).attr("old"))*parseFloat($(this).attr("oldprice")); 
            }
         );
        return $.formatMoney(""+amount);
      }
      
      <%--计算购物车中商品的总数量--%>
      function countQty(){
        var qty=0;
        $("#cart_table input[type='text']").each(
            function(){
               qty+=parseInt($(this).attr("old")); 
            }
         );
        return qty;
      }

      <%--重新计算正价的总金额,上品价的总金额,总数量--%>
      function countAll(){
          var cart_total_amount=countAmount();
          var cart_total_amount_old=countAmountOld();
          var cart_total_qty=countQty();
          $("#cart_table .cart_total_amount_old").each(function(){
              $(this).html(cart_total_amount_old);
          });
          $(".cart_total_amount").each(function(){
              $(this).html(cart_total_amount);
          });
          $(".cart_total_qty").each(function(){
              $(this).html(cart_total_qty);
          });
          if(cart_total_qty==0){
             $("#clear_button").css("display","none");
          }else{
             $("#clear_button").css("display","block"); 
          }
      }

      <%--修改购物车中商品的数量
          @param button 当前点击的按钮元素
      --%>
      function updateQty(button){
          var input=$(button).prev();
          var productSID=input.attr("product");
          var value=$.trim(input.attr("value"));
          var price=input.attr("price");
          var old=input.attr("old");
          var max=input.attr("max");
          if(value==''||value=='0'||isNaN(value)||!/^\d+$/.test(value)){
              $.popdialog(button,productSID+"_update",'数量输入不正确,应为大于零的数字,并小于库存数量');
              return;
          }
          if(value==old){
              $.popdialog(button,productSID+"_update",'数量没有变化');
              return;
          }
          $.ajax({
                url:'${ctx}/cart/updateqty.json',
                type: 'post',
                dataType: 'json',
                data:{'proDetailSID':productSID,
                      'price':price,
                      'qty':value
                    },
                timeout: 30000,
                error: function(){
                    $.popdialog(button,productSID+"_update",'更新数量失败,请重试');
                    return;
                },
                success: function(response){
                    var result=response.result;
                    var status=result.status;
                    var shopcount=response.shopcount;
                    if(status&&status=='1'){
                      input.attr("old",value);
                      countAll();
                    }
                    $.popdialog(button,productSID+"_update",result.message);
                    if(shopcount!=='undefined'){
                       $(button).parent().prev().prev().html(shopcount); 
                    }
                    return;
                }
         });
      }

      <%--添加商品到收藏夹
      @param button 收藏按钮 
      --%>
      function addToFavorite(button){
          var input=$(button).parent().prev().children("input[type='text']");
          var productSID=input.attr("product");
          var price=input.attr("price");
          var productListSID=input.attr("productListSID");
          $.ajax({
                url:'${ctx}/favorite/add.json',
                type: 'post',
                dataType: 'json',
                data:{'productSID':productListSID},
                timeout: 30000,
                error: function(){
                    $.popdialog(button,productSID+"_favor",'添加商品到收藏夹失败,请重试');
                    return;
                },
                success: function(response){
                    var result=response.result;
                    var status=result.status;
                    var message=result.message;
                    $.popdialog(button,productSID+"_favor",message);
                }
         });
      }
      
      <%--从购物车中删除商品
      @param button 删除按钮
      --%>
      function remove(button){
          var input=$(button).parent().prev().children("input[type='text']");
          var productSID=input.attr("product");
          $.ajax({
                url:'${ctx}/cart/remove.json',
                type: 'post',
                dataType: 'json',
                data:{'proDetailSID':productSID},
                timeout: 30000,
                error: function(){
                    $.popdialog(button,productSID+"_remove",'从购物车中删除商品失败,请重试');
                    return;
                },
                success: function(response){
                    var result=response.result;
                    var status=result.status;
                    var message=result.message;
                    $.popdialog(button,productSID+"_remove",message);
                    if(status&&status=='1'){
                        input.parent().parent().remove();
                        countAll();
                    }
                    return;
                }
         });

      }

      <%--清空购物车
      @param button 删除按钮
      --%>
      function clearCart(button){
          $.ajax({
                url:'${ctx}/cart/clear.json',
                type: 'post',
                dataType: 'json',
                data:{},
                timeout: 30000,
                error: function(){
                    $.popdialog(button,"div_clear",'清空购物车失败,请重试');
                    return;
                },
                success: function(response){
                    var result=response.result;
                    var status=result.status;
                    var message=result.message;
                    if(status&&status=='1'){
                        $("#cart_table input[type='text']").each(
                         function(){
                           $(this).parent().parent().remove();
                         });
                        countAll();
                        $.popdialog(button,"div_clear",'清空购物车成功');
                        $(button).remove();
                    }
                    else{
                       $.popdialog(button,"div_clear",message);
                    }
                }
         });
      }
</script>
     <%
        Cookie[] cookies = request.getCookies();
        String cid = "";
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("cid")) cid = cookies[i].getValue();
        }
        if (cid.startsWith("ad-baidu")) {
    %>
<noscript>
<img height="1" width="1" border="0" alt="" style="display:none"
src="http://analytics.adsage.cn/atac.gif?acc=936&cid=1062&csid=2627&ver=1.0"/>
</noscript>
<script type="text/javascript" src="http://analytics.adsage.cn/atac.js"></script>
<script type="text/javascript">
<!--
    ataTracker.setAccount("936");
    ataTracker.setConversion("1062", "2627");
    ataTracker.track();
//-->
</script>

		<%
        }
    %>
</head>

<body>
<div>
    <div>
    <ul class="banner-channels">
    	<ol><img src="${images}/y-cart001.gif" title="我的购物车" /></ol>
		<div class="cart-step">
		   <img src="${images}/y_num001.gif" title="第一步" border="0" />挑选商品(1.选择颜色 2.选择尺寸) <img src="${images}/y_arr_001.gif"  width="23" height="8" />
		   <img src="${images}/y_num002.gif" title="第二步" border="0" />我的购物车<img src="${images}/y_arr_001.gif"  width="23" height="8" />
		   <img src="${images}/y_num003.gif" title="第三步" border="0" />确认结算<img src="${images}/y_arr_001.gif"  width="23" height="8" />
		   <img src="${images}/y_num004.gif" title="第四步" border="0" />订购成功
		</div>
    </ul>
    </div>
<!--[if !ie]>cart-content开始<![endif]-->
	<div id=cart-content>
		<div class="cart-tit">我挑选的商品</div>
		<div class="cart-count">
			<table id='cart_table' width="100%" border="0"
                   cellpadding="0" cellspacing="1" class="table_css">
				<tr>
					<td width="8%" height="32" bgcolor="#ffecd0" class="td_css">商品编码</td>
					<td width="16%" bgcolor="#ffecd0" class="td_css">商品图片</td>
                    <%--<td width="18%" bgcolor="#ffecd0" class="td_css">商品名称</td>--%>
					<td width="8%" bgcolor="#ffecd0" class="td_css">市场正价</td>
					<td width="6%" bgcolor="#ffecd0" class="td_css">上品价</td>
                    <td width="6%" bgcolor="#ffecd0" class="td_css">优惠额</td>
					<td width="6%" bgcolor="#ffecd0" class="td_css">颜色</td>
                    <td width="8%" bgcolor="#ffecd0" class="td_css">尺寸</td>
                    <td width="10%" bgcolor="#ffecd0" class="td_css">正在抢购次数</td>
                    <td width="5%" bgcolor="#ffecd0" class="td_css">库存量</td>
                    <td width="12%" bgcolor="#ffecd0" class="td_css">购买数量</td>
					<td width="10%" bgcolor="#ffecd0" class="td_css">操作</td>
				</tr>
                
                <c:forEach items="${cartlist}" var="item">
                 <tr>
                    <td height="32" bgcolor="#ffecd0" class="td_css">${item.proSku}</td>
                    <td bgcolor="#ffecd0" class="td_css"><a href="${ctx}/product/${item.productSid}.html" target="_blank"><img src="${images}${item.proPicture}" alt="${item.name}"> </a></td>
					<%--<td bgcolor="#ffecd0" class="td_css"><a href="${ctx}/product/${item.productSid}.html" target="_blank">${item.name}</a></td>--%>
					<td bgcolor="#ffecd0" class="td_css">
                        <del><fmt:formatNumber type="currency" value="${item.originalPrice}" /></del>
                    </td>
					<td bgcolor="#ffecd0" class="td_css">
                        <fmt:formatNumber type="currency" value="${item.promotionPrice}" />
                    </td>
                    <td bgcolor="#ffecd0" class="td_css">
                        <fmt:formatNumber type="currency" value="${item.originalPrice*1-item.promotionPrice*1}" />
                    </td>
					<td bgcolor="#ffecd0" class="td_css">${item.color}</td>
                    <td bgcolor="#ffecd0" class="td_css">${item.size}</td>
                    <td bgcolor="#ffecd0" class="td_css">${item.shopCount}</td>
                    <td bgcolor="#ffecd0" class="td_css">${item.storeCount}</td>
                    <td bgcolor="#ffecd0" class="td_css">
                        <input type="hidden" value="${item.sid}_${item.qty}_${item.storeCount}_${item.promotionPrice}_${item.originalPrice}_${item.productSid}"/>
                        <input type="text" style="width:20px"/>
                        <img src="${images}/bt_s1-8.gif" style="cursor:pointer" onClick="updateQty(this)">
					</td>
					<td bgcolor="#ffecd0" class="td_css">
                        <img src="${images}/bt_s1-9.gif" style="cursor:pointer" onclick='addToFavorite(this)'/>
                        <img src="${images}/bt_s1-7.gif" style="cursor:pointer" onclick='remove(this)'/>
                    </td>
                 </tr>
                </c:forEach>
				
            </table>
		</div>
		<div class="cart-add">
			<div class="cart-addselect">
                <img src="${images}/bt_s1-16.gif" style="cursor:pointer" <c:if test="${total==0}">style="display:none"</c:if> onClick="clearCart(this);"/>
            </div>
			<div class="cart-addcount">
                商品总数量：<font class="cart_total_qty" color="#ff0000" >${total}</font><font color="#ff0000">个</font>
                总金额(不包含运费)：<font class="cart_total_amount" color="#ff0000" >${amount}</font><font color="#ff0000">元</font>
            </div>
		</div>
		<div class="cart-cartgo">
			<span><a href="${ctx}/index.html"><img src="${images}/y-cart002.gif" border="0" title="继续购物"/></a></span>&nbsp;&nbsp;&nbsp;&nbsp;
			<span><a href="${ctx}/order/confirm.html"><img src="${images}/y-cart003.gif" border="0" title="去结算"/></a></span>
		</div>
		<div class="cart-reminder">
			<img src="${images}/y-cart004.gif" border="0"/>
			<div class="cart-reminderfont">上品小助手提醒您：<font color="#FF6600">选好商品后，请尽快付款！由于该宝贝同时在实体店销售，如果您未能及时付款，有可能被别人抢走哦！</font></div>
		</div>
	</div>
<!--[if !ie]>cart-content结束<![endif]-->
</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>
<!-- google统计代码开始-->
<div style="display: none;">
<!-- Google Code for &#36141;&#29289;&#36710; Remarketing List -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1028537178;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "666666";
var google_conversion_label = "F96SCPTRgQIQ2va46gM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1028537178/?label=F96SCPTRgQIQ2va46gM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
</div>
<!-- 结束-->
</body>
</html>
