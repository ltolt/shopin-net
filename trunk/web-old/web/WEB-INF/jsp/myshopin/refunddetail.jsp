<%--
  Description:会员退货订单
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>订单退货信息</title>
<script type="text/javascript" src="${js}/input.js"></script>
<script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>
<script src="${js}/jquery/jquery-format-0.1.js" type="text/javascript"></script>
<link href="${css}/order-detail.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .table_css{border:1px solid #ff9900;border-collapse:collapse;margin-top:10px;}
    .td_css{border:1px solid #ff9900;}
	.isknav td {padding:4px;}
</style>    
<c:if test="${order!=null}">
<script type="text/javascript">
    <%--
        页面加载,
        绑定商品数量输入框的onkeyup事件,
        增加属性值productDetailSID,qty
    --%>
    $(document).ready(function(){
       $("#product_table input[name='refund_qty']").each(
          function(){
            var str=$(this).prev().val();
            var arr=str.split("_");
            $(this).attr('productDetailSid',arr[0]);
            $(this).attr('qty',arr[1]);
            $(this).attr('refund',arr[2]);
            $(this).attr('allowRefunNum',arr[3]);
            $(this).attr('limit',''+(parseInt(arr[1])-parseInt(arr[2])));
            <%--商品数量已经全部退完,不能填写退货数量--%>
            if(arr[1]==arr[2]){
                 $(this).attr('readonly','true');
            }
            if(arr[3]==''){
                $(this).attr('readonly','true');
            }
            $(this).bind("keyup",function(){
               var value=$.trim($(this).val());
               value=value.replace(/\D/gi,"");
               if(value==''){
                       value="0";
               }
               $(this).attr("value",value);
            });
          }
      );
    });

    <%--获得退货商品数据--%>
    function getRefundData(){
       var list=[];
       $("#product_table input[name='refund_qty']").each(function(){
           var input=$(this);
           var qty=$.trim(input.val());
           if(qty!=''&&qty!='0'){
              var product={};
              product['productDetailSid']=input.attr("productDetailSid");
              product['allowRefunNum']=input.attr("allowRefunNum");
              product['qty']=qty;
              product['limit']=input.attr("limit");
              product['ele']=input;
              list.push(product);
           }
       });
       return list;
    }

    <%--校验商品数据--%>
    function validateRefundData(){
        var button=$("#refund_button");
        var list=getRefundData();
        if(list.length==0){
            $.popdialog(button,"refund_commit_info","您还没有填写退货数量");
            return false;
        }
        var flag=true;
        for(var i=0;i<list.length;i++){
           var product=list[i];
           var productDetailSid=product['productDetailSid'];
           var allowRefunNum=product['allowRefunNum'];
           var qty=product['qty'];
           var limit=product['limit'];
           var ele=product['ele'];
           <%--校验数量是否是数字--%>
           if(!/^\d+$/.test(qty)){
               $.poptip(ele,productDetailSid+"_refund_qty","退货数量不正确,必须为数字");
               flag=false;
           }
           <%--校验数量是否小于购买数量--%>
            if (parseInt(qty) > parseInt(limit)) {
                var message = "退货数量不正确,不能大于剩余数量";
                if (limit == '0') {
                    message = "您已经退完该商品全部数量";
                }
                $.poptip(ele, productDetailSid + "_refund_qty", "退货数量不正确,不能大于剩余数量");
                flag = false;
            }
            if (parseInt(qty) > parseInt(allowRefunNum)) {
                var message = "退货数量不正确,不能大于允许退货数量";
                $.poptip(ele, productDetailSid + "_refund_qty", "退货数量不正确,不能大于允许退货数量");
                flag = false;
            }
        }
        if(!flag){
           $.popdialog(button,"refund_commit_info","退货数量填写不正确");
           return flag;
        }
        var radios=$(":radio[name='refund_direction'][checked]");
        if(radios.length==0){
           $.popdialog(button,"refund_commit_info","请选择退货返款方式");
           return flag;
        }
        return flag;
    }

    <%--得到退货商品提交请求的数据--%>
    function getCommitRefundData(){
        var list=getRefundData();
        var arr=[];
        for(var i=0;i<list.length;i++){
           var product=list[i];
           var productDetailSid=product['productDetailSid'];
           var qty=product['qty'];
           arr.push(productDetailSid+"_"+qty);
        }
        return arr;
    }

    <%--提交退货--%>
    function doRefund(){
        var button=$("#refund_button");
        if(!validateRefundData()){
            return;
        }
        var refund=getCommitRefundData();
        var refund_direction=$(":radio[name='refund_direction'][checked]").eq(0).val();
        var refundDesc='';//$("#refund_refundDesc").val();
      <c:choose>
        <c:when test="${order.paymentModeSid ne 4}">
        var bankUser =  "";
        var bankProvince = "";
        var bankCity ="";
        var bankName = "";
        var bankAddress = "";
        var bankCardNumber = "";
        </c:when>
        <c:otherwise>
              //一下是银行信息
        var bankUser =  $.trim($("#bankUser").val());
        var bankProvince = $.trim($("#bankProvince").val());
        var bankCity =$.trim($("#bankCity").val());
        var bankName = $.trim($("#bankName").val());
        var bankAddress = $.trim($("#bankAddress").val());
        var bankCardNumber = $.trim($("#bankCardNumber").val());
        //校验银行信息
        if(bankUser==null||bankUser==""){
            alert("请填写开户姓名");
            return;
        }
        if(bankProvince==null||bankProvince==""){
            alert("请填写开户省（市）");
            return;
        }
        if(bankCity == null || bankCity==""){
            alert("请填写开户城市");
            return;
        }
        if(bankName ==null ||bankName==""){
            alert("请填写银行名称");
            return;
        }
        if(bankAddress==null ||bankAddress=="") {
            alert("请填写开户行（具体到支行）");
            return;
        }
        if(bankCardNumber == null || bankCardNumber == ""){
            alert("请填写银行卡号！");
            return;
        }
        </c:otherwise>
      </c:choose>



        $.ajax({
                url:'${ctx}/refund/commit.json',
                type: 'post',
                dataType: 'json',
                data:{'orderId':'${order.orderId}',
                    'refund':refund,
                    'refundDesc':refundDesc,
                    'refundDirection':refund_direction,

                    'bankUser':bankUser,
                    'bankProvince':bankProvince,
                    'bankCity':bankCity,
                   'bankName':bankName,
                   'bankAddress':bankAddress,
                   'bankCardNumber':bankCardNumber
                },
                timeout: 30000,
                error: function(){
                    return;
                },
                success: function(response){
                    var result=response.result;
                    var status=result.status;
                    var message=result.message;
                    $.popdialog(button,"refund_commit_info",message);
                    if(status=='1'){
                        window.setTimeout(function(){window.location.reload();},2000);
                    }
                    return;
                }
          });
    }

    <%--撤销退货单--%>
    function cancelRefund(button){
        var refundSid=$(button).prev().val();
        $.ajax({
                url:'${ctx}/refund/cancel.json',
                type: 'post',
                dataType: 'json',
                data:{'refundSid':refundSid},
                timeout: 30000,
                error: function(){
                    return;
                },
                success: function(response){
                    var result=response.result;
                    var status=result.status;
                    var message=result.message;
                    $.popdialog(button,"refund_cancel_info",message);
                    if(status=='1'){
                       var tr=$(button).parent().parent();
                       tr.next().remove();
                       tr.remove();
                    }
                    return;
                }
          });
    }
</script>
</c:if>
<style type="text/css">
    .refund_span{padding-left:5px;padding-right:5px}    
</style>
</head>

<body>

<%--面包屑内容开始--%>
<div id="breadcrumb">
    <a href="${ctx}">首页</a><span>></span>我的上品<span>></span>订单管理&nbsp;&gt;&nbsp;退货
</div>
<%--面包屑内容结束--%>
<div style="width:950px;float:left">
    <%--左侧分类开始--%>
    <jsp:include page="myshopin_left.jsp"/>
    <%--左侧分类结束--%>
    <%--右侧分类开始--%>
	<div id="content-rightweihzi">
         <div class="banner"><em style="color:red">退货订单:${order.orderNo}</em></div>
         <div id="content-right" class="order_detail_show">
            <ul class="biaoge" id="order_address_title">
                <li class="biaoge-top-modify">
                    <strong>退货地址</strong> <a href="${ctx}/help/h_return.html">退货政策</a>
                </li>
            </ul>
            <ul class="biaoge1"  id="order_address">
                <li>地址：北京朝阳区香宾路66-1号上品折扣来广营店B3物流中心</li>
                <li>邮编：100102</li>
				<li>收货电话：400 898 0808</li>
				<li>收货人：物流中心</li>
				<li>所退商品包装要完好(包括：商品包装盒、鞋盒、吊牌、验证码、包装纸、商品包装、发票、赠品等商品及附件、包装全貌)。切忌在鞋盒或包装盒外直接打胶带、直接将快递面单贴在商品包装(建议在商品里包装盒外再套一层包装盒)外，否则物流中心直接拒收。</li>
				<li>请您不要使用平邮、包裹发送退货物品，否则物流中心可直接拒收。</li>
				<li>注意：上品折扣网物流中心不接收到付形式的快递，发送退货物品运费由顾客承担。</li>
				<li style="color:#FF0000;">自退货申请“审核通过日”起，在以下时间内，物流中心未收到您退回的商品，过期将不再受理退货服务。</li>
				<li style="color:#FF0000;">免责：北京地区超过10日、外埠超过20日，则默认您的退货申请已自行取消。<br/></li>
				<li style="color:#FF0000;">提示：当您的“退货申请”审核通过后，请务必于1-2个工作日内将退货以快递形式寄回。</li>
            </ul>
<%--            <ul class="biaoge" id="order_address_title">
                <li class="biaoge-top-modify">
                    <strong>收货人信息</strong>
                </li>
            </ul>
            <ul class="biaoge1"  id="order_address">
                <li>姓名：${order.receptName}</li>
                <li>地址：${order.receptAddress}</li>
                <li>邮编：${order.inceptPostcode}</li>
                <li>电话：${order.receptPhone}</li>
            </ul>--%>
            <ul class="biaoge">
                <li class="biaoge-top-modify"><strong>商品清单&nbsp;&nbsp;</strong></li>
            </ul>
            <div style="padding-left:10px;float:left">
                <table width="680px" id="product_table" 
                        cellpadding="0"  cellspacing="1" class="table_css">
                   <tr>
                       <td width="10%" align="center" bgcolor="#ffecd0" class="td_css">商品编号</td>
                       <td width="10%" align="center" bgcolor="#ffecd0" class="td_css">商品名称</td>
                       <td width="10%" align="center" bgcolor="#ffecd0" class="td_css">商品正价</td>
                       <td width="10%" align="center" bgcolor="#ffecd0" class="td_css">上品价</td>
                       <td width="10%" align="center" bgcolor="#ffecd0" class="td_css">颜色</td>
                       <td width="6%" align="center" bgcolor="#ffecd0" class="td_css">尺寸</td>
                       <td width="8%" align="center" bgcolor="#ffecd0" class="td_css">购买数量</td>
                       <td width="8%" align="center" bgcolor="#ffecd0" class="td_css">已退货数量</td>
                       <td width="10%" align="center" bgcolor="#ffecd0" class="td_css">允许退货数量</td>
                       <td width="10%" align="center" bgcolor="#ffecd0" class="td_css">申请退货数量</td>
                       <td width="10%" align="center" bgcolor="#ffecd0" class="td_css">退货原因</td>
                   </tr>
                   <c:forEach items="${order.orderDetails}" var="item">
                   <tr>
                       <td align="center" height="30" bgcolor="#ffecd0" class="td_css">${item.proSku}</td>
                       <td align="center" bgcolor="#ffecd0" class="td_css"><a href="${ctx}/product/${item.proSid}.html" target="_blank">${item.proName}</a></td>
                       <td align="center" bgcolor="#ffecd0" class="td_css"><del><fmt:formatNumber type="currency" value="${item.originalPrice}"/></del></td>
                       <td align="center" bgcolor="#ffecd0" class="td_css"><fmt:formatNumber type="currency" value="${item.salePrice}"/></td>
                       <td align="center" bgcolor="#ffecd0" class="td_css">${item.proColor}</td>
                       <td align="center" bgcolor="#ffecd0" class="td_css">${item.proSize}</td>
                       <td align="center" bgcolor="#ffecd0" class="td_css">${item.saleSum}</td>
                       <td align="center" bgcolor="#ffecd0" class="td_css">${item.refundNum}</td>
                       <td align="center" bgcolor="#ffecd0" class="td_css">${item.allowRefunNum}</td>
                       <td align="center" bgcolor="#ffecd0" class="td_css">
                            <input type="hidden" value="${item.proDetailSid}_${item.saleSum}_${item.refundNum}_${item.allowRefunNum}"/>
                            <input type="text" name="refund_qty" value="0"
                                    style="width:40px"/>
                       </td>
                       <td align="center" bgcolor="#ffecd0" class="td_css">${item.refunCausebyinner}</td>
                   </tr>
                   </c:forEach>
                </table>
            </div>
            <c:choose>
                <c:when test="${order.paymentModeSid ne 4}">
                      <ul class="biaoge" id="refund_title">
                     <li class="biaoge-top-modify">
                    请选择退货返款方式:
                    <%--<input type="radio" name="refund_direction" value='0' checked="true"/>
                    <label>将退货金额返到我的上品账户</label>--%>
                    <input type="radio" name="refund_direction" value='1' checked="true"/>
                    <label>将退货金额返到我的付款账户</label>
                </li>
                     </ul>
                     <div style="clear:both"></div>
                </c:when>
                <c:otherwise>
                                          <!--银行收款信息-->
            <div class="isknav" style="padding:10px;">
                <div style="display:none"><input type="radio" name="refund_direction" value='4' checked="true" /></div>
            	<p><b>请填写您的银行收款信息：</b></p>
                <table border="0" cellspacing="0" cellpadding="0">
                	<tr>
                    	<td width="80">开户姓名：</td><td><input type="text" style="width:200px;" name="bankUser" id="bankUser"/></td>
                    </tr>
                    <tr>
                        <td width="80">开户省：</td><td><input type="text" style="width:200px;" id="bankProvince" name="bankProvince"/></td>
                    </tr>
                    <tr>
                        <td width="80">开户城市：</td><td><input type="text" style="width:200px;" id="bankCity" name = "bankCity"/></td>
                    </tr>
                    <tr>
                        <td width="80">银行名称：</td><td><input type="text" style="width:200px;"  id="bankName" name="bankName"/></td>
                    </tr>
                    <tr>
                        <td width="80">开户行（具体到支行）：</td><td><input type="text" style="width:200px;" id="bankAddress" name="bankAddress"/></td>
                    </tr>
                    <tr>
                        <td width="80">银行卡号：</td><td><input type="text" style="width:200px;" id="bankCardNumber" name="bankCardNumber" /></td>
                    </tr>
                </table>
                <p style="color:#666">温馨提示：为了保证货款能准确的退到您的账户，请认真填写并核对您的银行账户信息，如填写错误出现退款问题上品有权不承担责任</p>
            </div>
            <!--银行收款信息END-->
                </c:otherwise>
            </c:choose>

            <ul class="biaoge" id="refund_title">
                <li><img src="${images}/bt_s1-22.gif" style="cursor:pointer" id="refund_button" onClick="doRefund();"/></li>
            </ul> 
         </div>

         <div id="content-right" class="order_detail_show">
            <ul class="biaoge" id="refund_title">
                <li class="biaoge-top-modify"><strong>历史退货记录</strong></li>
            </ul>
            <div style="padding-left:10px;float:left">
                <table width="680px" id="refund_table" cellpadding="0"  cellspacing="1" style="margin-top:10px" >
                   <c:choose>
                       <c:when test="${fn:length(refundlist)==0}">
                           <tr><td colspan="3" bgcolor="#ffecd0" align="center" class="td_css">没有退货信息</td></tr>
                       </c:when>
                       <c:when test="${fn:length(refundlist)>0}">
                   <tr>
                       <td width="5%" align="center" bgcolor="#ffecd0" class="td_css">序号</td>
                       <td width="82%" align="center" bgcolor="#ffecd0" class="td_css">退货单信息</td>
                       <td width="13%" align="center" bgcolor="#ffecd0" class="td_css">操作</td>
                   </tr>
                       <c:forEach items="${refundlist}" var="item" varStatus="status">
                   <tr>
                       <td align="center" bgcolor="#ffecd0" class="td_css">${status.index+1}</td>
                       <td align="left" bgcolor="#ffecd0" class="td_css">
                         <span class="refund_span">退货单号:${item.refundNo}</span>
                         <span class="refund_span">时间:${item.refundTime}</span>
                         <span class="refund_span">数量:${item.refundNum}</span>
                         <span class="refund_span">金额:<fmt:formatNumber type="currency" value="${item.refundMoneySum}" /></span><br/>
                         <span class="refund_span">状态:<font color='red'>${item.refundStatusName}</font></span>
                       </td>
                       <td align="center" bgcolor="#ffecd0" class="td_css">
                           <input type="hidden" value="${item.sid}"/>
                           <c:if test="${'0'==item.refundStatus}">
                           <img src="${images}/bt_s1-23.gif" style="cursor:pointer" onClick="cancelRefund(this)"/>
                           </c:if>
                       </td>
                   </tr>
                   <tr>
                       <td bgcolor="#ffecd0" class="td_css"></td>
                       <td  align="left" style="padding-left:20px" bgcolor="#ffecd0" class="td_css">
                           <table width="100%">
                               <tr>
                                   <td align="center" >商品编号</td>
                                   <td align="center" >名称</td>
                                   <td align="center" >颜色</td>
                                   <td align="center" >尺寸</td>
                                   <td align="center" >价格</td>
                                   <td align="center" >退货数量</td>
                               </tr>
                               <c:forEach items="${item.refundsDetails}" var="refunditem">
                                <tr>
                                   <td align="center">${refunditem.proSku}</td>
                                   <td align="center">${refunditem.proName}</td>
                                   <td align="center">${refunditem.proColor}</td>
                                   <td align="center">${refunditem.proSize}</td>
                                   <td align="center"><fmt:formatNumber type="currency" value="${refunditem.refundPrice}"/></td>
                                   <td align="center">${refunditem.refundNum}</td>
                               </tr>
                               </c:forEach>
                           </table>
                       </td>
                       <td bgcolor="#ffecd0" class="td_css"></td>
                   </tr>
                   </c:forEach>
                       </c:when>
                   </c:choose>
                </table>
            </div>
         </div>
    </div>
    <%--右侧分类结束--%>
</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>
</body>
</html>
