<%@ page import="java.util.List" %>
<%@ page import="net.shopin.view.OrderDetailVO" %>
<%@ page import="net.shopin.view.OrderVO" %>
<%@ page import="java.util.Iterator" %>
<%--
  Description:订单提交后页面  
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<%--如果订单状态不是1,重定向到订单详细页--%>
<c:if test="${'1'!=order.orderStatus}">
    <c:redirect url="/myshopin/order/${order.orderId}.html" context="${ctx}"></c:redirect>
</c:if>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>订购成功</title>
<link href="${css}/master.css" rel="stylesheet" type="text/css" />
<link href="${css}/mycart.css" rel="stylesheet" type="text/css" />
<script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>

<c:if test="${'1'==order.paymentModeSid}">
<script type="text/javascript">
      <%--使用会员账户支付--%>
      function payByAccount(button){
          $.ajax({
            url:'${ctx}/accountpay.json',
            type: 'post',
            dataType: 'json',
            data:{
                orderId:'${order.orderId}'
            },
            timeout: 30000,
            error: function(){
                $.popdialog(button,"order_pay_commit",'使用会员账户支付失败');
                return;
            },
            success: function(response){
                var result=response.result;
                var status=result.status;
                var message=result.message;
                $.popdialog(button,"order_pay_commit",message);
                if(status=='1'){
                    window.setTimeout(function(){window.location='${ctx}/myshopin/order/${order.orderId}.html'},5000);
                }
                return;
            }
        });
      }
</script>
</c:if>
<c:if test="${'2'==order.paymentModeSid}">
<%--银行卡支付 --%>
<script type="text/javascript">
    function bankPay(v_pmode){
       var orderSid='${order.orderId}';
       var paynum='${order.saleTotalSum}';
       var form=$("#order_form");
//       alert(form.length);
       if(form.length==0){
           form=$("<form id='order_form' action='${ctx}/toBankpay.html' method='post' target='_blank'></form>");
           form.append("<input type='hidden' name='orderSid' value='"+orderSid+"'/>");
           form.append("<input type='hidden' name='paynum' value='"+paynum+"'/>");
           form.append("<input type='hidden' name='v_pmode'/>");
           $("body").append(form);
       }
       form.children("input[name='v_pmode']").eq(0).val(v_pmode);
       $("#order_form").get(0).submit();
    }
</script>
</c:if>
<style type="text/css">
    .pays-bk .pay-minfo1{ float:left; border:1px solid #ff6601;
        background-color:#fff4e6; width:820px; margin-bottom:10px; text-indent:5px;
        margin-top:0px; padding-top:10px; height:350px}
    .pays-bk .pay-minfo1 .pay-minfotit1{font-family:"黑体"; font-size:20px; line-height:30px;
        color:#333; height:40px; border-bottom:1px solid #ffcc00; margin-bottom:5px;
        margin-left:5px; margin-right:5px; text-align:center;}
    .pays-bk .pay-minfo1 .pay-minfotit2{font-family:"宋体"; font-size:12px; line-height:24px;
        color:#333; height:24px; margin-bottom:5px; margin-left:5px; margin-right:5px; }
    .table_css{border:1px solid #ff9900;border-collapse:collapse;}
    .td_css{border:1px solid #ff9900;}
</style>
</head>

<body>
<div>
    <div>
    <ul class="banner-channels">
    	<ol><img src="${images}/y-p001.gif" title="我的购物车" />
    	</ol>
        <div class="cart-step">
		   <img src="${images}/y_num001.gif" title="第一步" border="0" /><font color="#f60">挑选商品(1.选择颜色 2.选择尺寸)</font> <img src="${images}/y_arr_001-c.gif" title="" width="23" height="8" />
		   <img src="${images}/y_num002-c.gif" title="第二步" border="0" /><font color="#f60">我的购物车</font><img src="${images}/y_arr_001-c.gif" title="" width="23" height="8" />
		   <img src="${images}/y_num003-c.gif" title="第三步" border="0" /><font color="#f60">确认结算</font><img src="${images}/y_arr_001-c.gif" title="" width="23" height="8" />
		   <img src="${images}/y_num004-c.gif" title="第四步" border="0" /><font color="#f60">订购成功</font>		</div>
    </ul>
    </div>
<%--commit-content开始--%>
    <div id=pays-content>
		<div class="pay-kong1"></div>
        <div class="pays-bk0412"><c:if test="${order.paymentModeSid!='4'}">尊敬的顾客：为保证上品折扣实体和网络顾客的公平“抢购权益”，请您在订单提交后1小时内支付款项。<br></c:if>
　　　　<!--10：00-22：00之间提交的网络订单，请在订单提交后1小时内支付款项。
<br>
　　　　22：00-次日9：00之间提交的网络订单，请在次日10：00前支付款项。
<br>
　　　　过时未支付订单中的商品将不被保留库存，其他顾客可参与抢购。--></div>
		<div class="pays-bk">
			   <!-- 99click转化明细代码  开始-->
            <input type="hidden" id="orderid99" value="${order.orderNo}" />
            <input type="hidden" id="ordertotal99" value="${order.saleMoneySum}" />
            <!-- 99click转化明细代码  结束-->
			        <li style="padding-bottom:25px; text-align:center;">您的订单号：<strong><font color="#cc0000">${order.orderNo}</font></strong>&nbsp;&nbsp;
                订单总金额：<strong><font color="#cc0000"><fmt:formatNumber type="currency" value="${order.saleTotalSum}"/></font></strong>&nbsp;&nbsp;
                商品总金额：<strong><font color="#cc0000"><fmt:formatNumber type="currency" value="${order.saleMoneySum}"/></font></strong>&nbsp;&nbsp;
                运费：<strong><font color="#cc0000"><fmt:formatNumber type="currency" value="${order.sendCost}"/></font></strong>
                <c:if test="${not empty offPriceRecord.offPrice}">
                减免运费：<strong><font color="#cc0000"><fmt:formatNumber type="currency" value="${offPriceRecord.offPrice}"/></font></strong>
                </c:if>
            </li>
            <c:choose>
                <c:when test="${order.paymentModeSid=='1'}">
                    <div class="pays-titimg">
                        <center><img src="${images}/bt_s2-13.gif" onClick="payByAccount(this);"
                                     border="0" style="cursor:pointer"/></center>
                    </div>
                </c:when>
                <c:when test="${order.paymentModeSid=='3'}">
                    <div class="pays-titimg">
                        <form action="${ctx}/toAlipay.html" id="alipay_form" method="post" target="_blank">
                            <input type="hidden" name="sid" value="${order.orderId}"/>

                            <center><img src="${images}/y-p003.gif" border="0" style="cursor:pointer"
                                         onclick="javascript:document.getElementById('alipay_form').submit();"/>
                            </center>
                        </form>
                    </div>
                </c:when>
                <c:when test="${order.paymentModeSid=='7'}">
                    <div class="pays-titimg">
                        <form action="${ctx}/toIcbcBank.html" id="icbc_form" method="post" target="_blank">
                            <input type="hidden" name="sid" value="${order.orderId}"/>
                            <input name="time" type="hidden" value="1015"/>
                            <center><img src="${images}/w-26.gif" border="0" style="cursor:pointer"
                                         onclick="javascript:document.getElementById('icbc_form').submit();"/></center>
                        </form>
                    </div>
                </c:when>
                <c:when test="${order.paymentModeSid=='11'}">
                    <div class="pays-titimg">
                        <form action="${ctx}/toIcbcBank.html" id="icbc_form" method="post" target="_blank">
                            <input type="hidden" name="sid" value="${order.orderId}"/>
                            <input name="time" type="hidden" value="1015"/>
                            <center><img src="${images}/w-26.gif" border="0" style="cursor:pointer"
                                         onclick="javascript:document.getElementById('icbc_form').submit();"/></center>
                        </form>
                    </div>
                </c:when>
                <c:when test="${order.paymentModeSid=='13'}">
                    <div class="pays-titimg">
                        <form action="${ctx}/toCmbPay.html" id="cmb_form" method="post" target="_blank">
                            <input type="hidden" name="sid" value="${order.orderId}"/>
                            <center><img src="${images}/w_87.gif" border="0" style="cursor:pointer"
                                         onclick="javascript:document.getElementById('cmb_form').submit();"/></center>
                        </form>
                    </div>
                </c:when>
                <c:when test="${order.paymentModeSid=='14'}">
            <div class="pays-titimg1">
                <ul class="pay06071">
                	<form action="${ctx}/toChinaPayEasement.html" id="chinapay_form2" method="post"
                          target="_blank">
                        <input type="hidden" name="sid" value="${order.orderId}"/>
                        <li><span><input type="radio" name="pay"
                                         onclick="javascript:document.getElementById('chinapay_form2').submit();"><img
                                src="${images}/w_93.gif" border="0"
                                align="absmiddle" style="cursor:pointer;"
                                onclick="javascript:document.getElementById('chinapay_form2').submit();"></span>
                        </li>
                    </form>
                    <form action="${ctx}/toChinaPay.html" id="chinapay_form" method="post" target="_blank">
                        <input type="hidden" name="sid" value="${order.orderId}"/>
                        <li><span><input type="radio" name="pay"
                                         onclick="javascript:document.getElementById('chinapay_form').submit();"><img
                                src="http://images.shopin.net/images/w_92.gif" border="0" align="absmiddle"
                                style="cursor:pointer;"
                                onclick="javascript:document.getElementById('chinapay_form').submit();"></span>
                        </li>
                    </form>  
                </ul>
            </div>
        </c:when>
		  <c:when test="${order.paymentModeSid=='15'}">
            <div class="pays-titimg">
                <form action="${ctx}/toYeePay.html" id="yeepay_form" method="post">
                    <input type="hidden" name="sid" value="${order.orderId}"/>

                    <img src="${images}/bank/epay-icon.gif" border="0" style="cursor:pointer"
                         onclick="javascript:document.getElementById('yeepay_form').submit();"/>
                </form>
            </div>
        </c:when>
                <c:when test="${order.paymentModeSid=='4'}">
                    <li style="text-align:center; margin-bottom:25px;">
                        您还需支付<strong><font color="#cc0000"><c:if test="${not empty offPriceRecord.offPrice}"><fmt:formatNumber type="currency" value="${order.saleTotalSum*1-offPriceRecord.offPrice*1}"/></c:if><c:if test="${empty offPriceRecord.offPrice}"><fmt:formatNumber type="currency" value="${order.saleTotalSum}"/></c:if></font></strong>
                        元现金，
                        快递人员会在送货上门时收取，请当面付款后验货。
                    </li>
                </c:when>
                <c:when test="${order.paymentModeSid=='10'}">
                    <div class="pays-titimg">
                        <form action="${ctx}/toTenpay.html" id="tenpay_form" method="post" target="_blank">
                            <input type="hidden" name="sid" value="${order.orderId}"/>
                            <center><img src="${images}/11031.gif" border="0" style="cursor:pointer"
                                         onclick="javascript:document.getElementById('tenpay_form').submit();"/>
                            </center>
                        </form>
                    </div>
                </c:when>
                 <c:when test="${order.paymentModeSid=='17'}">
                    <div class="pays-titimg">
                        <form action="${ctx}/toAlipaykj.html" id="alipaykj_form" method="post" target="_blank">
                            <input type="hidden" name="sid" value="${order.orderId}"/>

                            <center><img src="${images}/w_94.png" border="0" style="cursor:pointer"
                                         onclick="javascript:document.getElementById('alipaykj_form').submit();"/>
                            </center>
                        </form>
                    </div>
                </c:when>
                <c:when test="${order.paymentModeSid=='18'}">
                    <div class="pays-titimg">
                        <form action="${ctx}/toAlipaykj.html" id="alipaykj_form" method="post" target="_blank">
                            <input type="hidden" name="sid" value="${order.orderId}"/>

                            <center><img src="${images}/w_96.png" border="0" style="cursor:pointer"
                                         onclick="javascript:document.getElementById('alipaykj_form').submit();"/>
                            </center>
                        </form>
                    </div>
                </c:when>
                 <c:when test="${order.paymentModeSid=='19'}">
                    <div class="pays-titimg">
                        <form action="${ctx}/toAlipaykj.html" id="alipaykj_form" method="post" target="_blank">
                            <input type="hidden" name="sid" value="${order.orderId}"/>

                            <center><img src="${images}/w_98.png" border="0" style="cursor:pointer"
                                         onclick="javascript:document.getElementById('alipaykj_form').submit();"/>
                            </center>
                        </form>
                    </div>
                </c:when>

            </c:choose>
      </div>
        <c:if test="${'4'!=order.paymentModeSid}">
        <div class="clear" >&nbsp;</div>
        </c:if>
        <c:if test="${order.paymentModeSid=='2'}">
        <div class="pay-kong1"></div>

        <div class="pays-bk" style="border:0px">
            <div class="pay-minfo1">
				<div class="pay-minfotit1">
				<b><img src="${images}/bank.jpg" hspace="5" align="absmiddle">请选择以下银行卡支付</b>				</div>
  <div class="pay-minfotit2">
					<ul class="bankstyle">
						<li>
							<span class="banktd"><a href="#" onClick="bankPay('3');"><img src="${images}/bank/CMB_OUT.gif" alt="招商银行"></a></span>
						 	<span class="banktd"><a href="#" onClick="bankPay('4');"><img src="${images}/bank/CCB_OUT.gif" alt="建设银行"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('9');"><img src="${images}/bank/ICBC_OUT.gif" alt="工商银行"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('14');"><img src="${images}/bank/SPABANK_OUT.gif" alt="平安银行"></a></span>
						</li>
						<li>
							<span class="banktd"><a href="#" onClick="bankPay('22');"><img src="${images}/bank/SXY_OUT.gif" alt="首信会员帐户"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('28');"><img src="${images}/bank/CMBC_OUT.gif" alt="民生银行卡"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('33');"><img src="${images}/bank/CIB_OUT.gif" alt="兴业银行卡"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('40');"><img src="${images}/bank/SDB_OUT.gif" alt="深圳发展银行"></a></span>
						</li>
						<li>
							<span class="banktd"><a href="#" onClick="bankPay('43');"><img src="${images}/bank/ABC_OUT.gif" alt="农业银行"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('44');"><img src="${images}/bank/GDB_OUT.gif" alt="广东发展银行"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('50');"><img src="${images}/bank/BO_OUT.gif" alt="北京银行"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('60');"><img src="${images}/bank/HX_OUT.gif" alt="华夏银行"></a></span>
						</li>
						<li>
							<span class="banktd"><a href="#" onClick="bankPay('67');"><img src="${images}/bank/COMM_OUT.gif" alt="交通银行"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('69');"><img src="${images}/bank/SPDB_OUT.gif" alt="浦发银行"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('72');"><img src="${images}/bank/WH_OUT.gif" alt="网汇通"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('83');"><img src="${images}/bank/BH_OUT.gif" alt="渤海银行"></a></span>
						</li>
						<li>
							<span class="banktd"><a href="#" onClick="bankPay('74');"><img src="${images}/bank/CEB_OUT.gif" alt="光大银行"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('75');"><img src="${images}/bank/BJY_OUT.gif" alt="北京农村商业银行"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('84');"><img src="${images}/bank/CITIC_OUT.gif" alt="中信银行"></a></span>
							<span class="banktd"><a href="#" onClick="bankPay('85');"><img src="${images}/bank/BOC_OUT.gif" alt="中国银行"></a></span>
						</li>
						<li>
							<a href="#" onClick="bankPay('16');">ChinaPay [上海农村商业银行 、中国银行（上海）</a></td>
						</li>
						<li>
							<a href="#" onClick="bankPay('13');">广东银联[广州市商业银行（广州市）、广州市农村信用合作社联合社（广州市、深圳） 、 顺德农村信用合作社 中国银行（广州除深圳）]</a>
						</li>
					</ul>
			  </div>
			</div>
        </div>
        </c:if>
		<div class="clear">&nbsp;</div>
		<div class="pays-bk1">
			<div class="pays-tit">&nbsp;&nbsp;您的订单内容</div>
			<div class="pays-tcon">商品清单</div>
			<div class="pays-tcontent" style="padding-left:10px">
				<table width="96%" border="0" cellspacing="0" cellpadding="0"
                         class="table_css" style="margin:15px 0;">
					<tr>
						<td width="11%" bgcolor="#ffecd0" class="td_css">商品编码</td>
						<td width="29%" bgcolor="#ffecd0" class="td_css">商品名称</td>
						<td width="11%" bgcolor="#ffecd0" class="td_css">市场正价</td>
						<td width="11%" bgcolor="#ffecd0" class="td_css">上品价</td>
                        <td width="11%" bgcolor="#ffecd0" class="td_css">为您节省</td>
						<td width="11%" bgcolor="#ffecd0" class="td_css">颜色</td>
						<td width="9%" bgcolor="#ffecd0" class="td_css">尺寸</td>
						<td width="9%" bgcolor="#ffecd0" class="td_css">购买数量</td>
					</tr>
                    <c:forEach items="${order.orderDetails}" var="item">
					<tr>
						<td bgcolor="#ffecd0" class="td_css">${item.proSku}</td>
						<td bgcolor="#ffecd0" class="td_css"><a href="${ctx}/product/${item.proSid}.html" target="_blank">${item.proName}</a></td>
						<td bgcolor="#ffecd0" class="td_css"><del><fmt:formatNumber type="currency" value="${item.proPrice}"/></del></td>
						<td bgcolor="#ffecd0" class="td_css"><fmt:formatNumber type="currency" value="${item.salePrice}"/></td>
                        <td bgcolor="#ffecd0" class="td_css"><fmt:formatNumber type="currency" value="${item.proPrice*1-item.salePrice*1}"/></td>
						<td bgcolor="#ffecd0" class="td_css">${item.proColorName}</td>
						<td bgcolor="#ffecd0" class="td_css">${item.proSize}</td>
						<td bgcolor="#ffecd0" class="td_css">${item.saleSum}</td>
					</tr>
                    </c:forEach>
				</table>
						   <!-- 99click转化明细 商品清单代码修改  开始-->
                <%
                    String str="";
                    OrderVO vo = (OrderVO)request.getAttribute("order");
                    for(Iterator it=vo.getOrderDetails().iterator();it.hasNext();){
                        OrderDetailVO o = (OrderDetailVO)it.next();
                        if(it.hasNext()){
                            str += o.getProSid()+","+o.getSalePrice()+","+o.getSaleSum()+";";
                        }else{
                             str += o.getProSid()+","+o.getSalePrice()+","+o.getSaleSum();
                        }
                    }
                %>
                <input type="hidden" id="c_gid" value="<%=str %>" />
            <!-- 99click转化明细 商品清单代码修改  结束-->
						
			</div>
			<div class="pays-tcon">收货人信息</div>
			<div class="pays-tinfo">
				<li>姓名：${order.receptName}</li>
				<li>地址：${order.inceptProvince}${order.inceptCity}${order.receptAddress}</li>
				<li>邮编：${order.inceptPostcode}</li>
				<li>手机：${order.receptPhone}</li>
			</div>
			<div class="pays-tcon">配送方式</div>
			<div class="pays-tinfo">
				<li>配送方式：${order.sendTypeName}</li>
				<li>时间要求：${order.memo}</li>
			</div>
            <c:if test="${order.invoiceBit!=null&&order.invoiceBit=='1'}">
                <div class="pays-tcon">发票信息</div>
                <div class="pays-tinfo">
                    <li>发票抬头：${order.invoiceName}</li>
                    <li>发票内容：${order.invoiceDesc}</li>
                </div>
            </c:if>
		</div>
		<div class="pays-ths">
            <a href="/index.html" target="_blank">
            <img src="${images}/y-p002.gif" border="0" style="cursor:pointer"/></a>
            <br /><span style="color:#f15930">非常感谢您的惠顾，期待您的下次光临!</span>
		</div>
		<div  style="width:820px; margin:0 auto; margin-top:30px;">
		<ul style="float: left;">
			<li>
			    温馨提示：因上品折扣网与实体卖场同步销售，由于数据同步差异，个别商品偶有无货，遇此现象我们会及时电话或短信通知您。
			</li>
			<li>
			　　　　　由此给您带来的不便深表歉意！感谢您的支持！
			</li>
		</ul>
		</div>

	</div>
<%--cart-content结束--%>
</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>
<div style="display:none;">
<!-- Google Code for &#35746;&#21333; Conversion Page -->
<script type="text/javascript">
<!--
var google_conversion_id = 1028537178;
var google_conversion_language = "zh_CN";
var google_conversion_format = "1";
var google_conversion_color = "ff66ff";
var google_conversion_label = "rCdlCOaMpgEQ2va46gM";
var google_conversion_value = 0;
if (200.0) {
  google_conversion_value = 200.0;
}
//-->
</script>

<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1028537178/?value=200.0&amp;label=rCdlCOaMpgEQ2va46gM&amp;guid=ON&amp;script=0"/>
</noscript>
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
    <script src='http://service.linktech.cn/purchase_cps.php?a_id=<%=ltinfo%>&m_id=shopin&mbr_id=${order.membersSid}(${order.membersSid})&o_cd=${order.orderNo}&p_cd=${order.orderNo}&price=${order.saleMoneySum}&mbr_name=A100060164<%=openid%>&it_cnt=1&c_cd=01'></script>
	<script src='http://www.shopin.net/extend/updateOrder.html?sid=${order.orderId}&ltinfo=<%=ltinfo%>&ltype=linktech@<%=openid%>'></script>
    <%
        } if (ltinfo.length() > 0&&"linktech".equals(ltype) && (qqlog.length() == 0 || !qqlog.equals(openid))) {
    %>
    <script src='http://service.linktech.cn/purchase_cps.php?a_id=<%=ltinfo%>&m_id=shopin&mbr_id=${order.membersSid}(${order.membersSid})&o_cd=${order.orderNo}&p_cd=${order.orderNo}&price=${order.saleMoneySum}&it_cnt=1&c_cd=01'></script>
    <%
        } if (ltinfo.length() == 0 && qqlog.length() > 0 && qqlog.equals(openid)) {
    %>
    <script src='http://service.linktech.cn/purchase_cps.php?a_id=A100060164<%=openid%>&m_id=shopin&mbr_id=${order.membersSid}(${order.membersSid})&o_cd=${order.orderNo}&p_cd=${order.orderNo}&price=${order.saleMoneySum}&c_cd=qq_login&it_cnt=1'></script>
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
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-15677805-1']);
  _gaq.push(['_trackPageview']);
  _gaq.push(['_addTrans',
    '${order.orderNo}',           // order ID - required
    'Acme Clothing',  // affiliation or store name
    '${order.saleMoneySum}0',          // total - required
    '1.29',           // tax
    '5',              // shipping
    'San Jose',       // city
    'California',     // state or province
    'USA'             // country
  ]);
  _gaq.push(['_addItem',
    '${order.orderNo}',           // order ID - required
    'DD44',           // SKU/code - required
    'T-Shirt',        // product name
    'Green Medium',   // category or variation
    '1',          // unit price - required
    '1'               // quantity - required
  ]);
  _gaq.push(['_trackTrans']); //submits transaction to the Analytics servers
  
  _gaq.push(['_setAccount', 'UA-4728126-8']);
  _gaq.push(['_trackPageview']);
  _gaq.push(['_addTrans',
    '${order.orderNo}',           // order ID - required
    'shopin store center',  // affiliation or store name
    '${order.saleMoneySum}0',          // total - required
    '1.29',           // tax
    '${order.sendCost}',              // shipping
    '${order.inceptCity}',       // city
    '${order.inceptProvince}',     // state or province
    'CN'             // country
  ]);
  <c:forEach items="${order.orderDetails}" var="item">
	_gaq.push(['_addItem',
    '${order.orderNo}',           // order ID - required
    '${item.proSku}',           // SKU/code - required
    '${item.proName}',        // product name
    '${item.proColorName}${item.proSize}',   // category or variation
    '${item.salePrice}0',          // unit price - required
    '${item.saleSum}0'               // quantity - required
  ]);
 </c:forEach>
  _gaq.push(['_trackTrans']); //submits transaction to the Analytics servers

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

<!--百度默认跟踪代码: 结束-->
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fe0a537ff2f1696dc1ba1f057955404e7' type='text/javascript'%3E%3C/script%3E"));
</script>
<!-- 百度默认跟踪代码: 结束-->
	<!-- 99click转化明细引入para.js代码  开始-->
<script language="JavaScript" src="http://images.shopin.net/js/para.js"></script>
<!-- 99click转化明细引入para.js代码  结束 -->
</body>
</html>
