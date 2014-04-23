<%--
  Description:订单提交后页面
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>订购成功</title>
    <link href="${css}/master.css" rel="stylesheet" type="text/css"/>
    <link href="${css}/mycart.css" rel="stylesheet" type="text/css"/>
    <script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>

    <c:if test="${'1'==order.paymentModeSid}">
        <script type="text/javascript">
            <%--使用会员账户支付--%>
            function payByAccount(button) {
                $.ajax({
                    url:'${ctx}/accountpay.json',
                    type: 'post',
                    dataType: 'json',
                    data:{
                        orderId:'${order.orderId}'
                    },
                    timeout: 30000,
                    error: function() {
                        $.popdialog(button, "order_pay_commit", '使用会员账户支付失败');
                        return;
                    },
                    success: function(response) {
                        var result = response.result;
                        var status = result.status;
                        var message = result.message;
                        $.popdialog(button, "order_pay_commit", message);
                        if (status == '1') {
                            window.setTimeout(function() {
                                window.location = '${ctx}/myshopin/order/${order.orderId}.html'
                            }, 5000);
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
            function bankPay(v_pmode) {
                var orderSid = '${order.orderId}';
                var paynum = '${order.saleTotalSum}';
                var form = $("#order_form");
                //       alert(form.length);
                if (form.length == 0) {
                    form = $("<form id='order_form' action='${ctx}/toBankpay.html' method='post' target='_blank'></form>");
                    form.append("<input type='hidden' name='orderSid' value='" + orderSid + "'/>");
                    form.append("<input type='hidden' name='paynum' value='" + paynum + "'/>");
                    form.append("<input type='hidden' name='v_pmode'/>");
                    $("body").append(form);
                }
                form.children("input[name='v_pmode']").eq(0).val(v_pmode);
                $("#order_form").get(0).submit();
            }
        </script>
    </c:if>
    <style type="text/css">
        .pays-bk .pay-minfo1 {
            float: left;
            border: 1px solid #ff6601;
            background-color: #fff4e6;
            width: 820px;
            margin-bottom: 10px;
            text-indent: 5px;
            margin-top: 0px;
            padding-top: 10px;
            height: 230px
        }

        .pays-bk .pay-minfo1 .pay-minfotit1 {
            font-family: "宋体";
            font-size: 12px;
            line-height: 24px;
            color: #333;
            height: 24px;
            border-bottom: 1px solid #ffcc00;
            margin-bottom: 5px;
            margin-left: 5px;
            margin-right: 5px;
        }

        .pays-bk .pay-minfo1 .pay-minfotit2 {
            font-family: "宋体";
            font-size: 12px;
            line-height: 24px;
            color: #333;
            height: 24px;
            margin-bottom: 5px;
            margin-left: 5px;
            margin-right: 5px;
        }

        .table_css {
            border: 1px solid #ff9900;
            border-collapse: collapse;
        }

        .td_css {
            border: 1px solid #ff9900;
        }
    </style>
</head>

<body>
<div>
    <div>
        <ul class="banner-channels">
            <ol><img src="${images}/y-p001.gif" title="我的购物车"/>
            </ol>
            <div class="cart-step">
                <img src="${images}/y_num001.gif" title="第一步" border="0"/><font color="#f60">挑选商品</font> <img
                    src="${images}/y_arr_001-c.gif" title="" width="23" height="8"/>
                <img src="${images}/y_num002-c.gif" title="第二步" border="0"/><font color="#f60">我的购物车</font><img
                    src="${images}/y_arr_001-c.gif" title="" width="23" height="8"/>
                <img src="${images}/y_num003-c.gif" title="第三步" border="0"/><font color="#f60">确认结算</font><img
                    src="${images}/y_arr_001-c.gif" title="" width="23" height="8"/>
                <img src="${images}/y_num004-c.gif" title="第四步" border="0"/><font color="#f60">订购成功</font></div>
        </ul>
    </div>
    <%--commit-content开始--%>
    <div id=pays-content>
        <div class="pay-kong1"></div>
        <div class="pays-bk0316">
            <li>您的订单${order.orderNo}已支付成功！预计3个工作日内从北京发货，详情请<a href="${ctx}/myshopin/order/${order.orderId}.html" target="_blank"
                                                              style="color:#FF6600;text-decoration: underline;">查看订单状态&gt;&gt;</a>
            </li>
            <li>您的收货地址为：<br/>
                <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="F2F2F2"
                       style="margin:5px 0;">
                    <tr>
                        <td>${order.inceptProvince}${order.inceptCity}${order.receptAddress}　　${order.receptName}　　${order.inceptPostcode}</td>
                    </tr>
                </table>
            </li>
            <li>您可以在“<a href="${ctx}/myshopin/orders.html" target="_blank" style="color:#FF6600;text-decoration: underline;">我的订单</a>”中查看或取消您的订单，由于系统需进行订单预处理，您可能不会立刻查询到刚提交的订单。
            </li>
            <li>您对刚刚完成的订单结算过程满意吗？请告诉我们您的意见。</li>
        </div>
        <br/>

        <div class="pay-kong1"></div>
        <div class="pays-bk1">
            <div class="pays-tcon">商品清单</div>
            <div class="pays-tcontent">
                <table width="96%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td width="11%" bgcolor="#ffecd0" class="td_css">商品编码</td>
                        <td width="29%" bgcolor="#ffecd0" class="td_css">商品名称</td>
                        <td width="11%" bgcolor="#ffecd0" class="td_css">上品价</td>
                        <td width="11%" bgcolor="#ffecd0" class="td_css">颜色</td>
                        <td width="9%" bgcolor="#ffecd0" class="td_css">尺寸</td>
                        <td width="9%" bgcolor="#ffecd0" class="td_css">购买数量</td>
                    </tr>
                    <c:forEach items="${order.orderDetails}" var="item">
                        <tr>
                            <td bgcolor="#ffecd0" class="td_css">${item.proSku}</td>
                            <td bgcolor="#ffecd0" class="td_css"><a href="${ctx}/product/${item.proSid}.html"
                                                                    target="_blank">${item.proName}</a></td>
                            
                            <td bgcolor="#ffecd0" class="td_css"><fmt:formatNumber type="currency"
                                                                                   value="${item.salePrice}"/></td>
                            <td bgcolor="#ffecd0" class="td_css">${item.proColor}</td>
                            <td bgcolor="#ffecd0" class="td_css">${item.proSize}</td>
                            <td bgcolor="#ffecd0" class="td_css">${item.saleSum}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>


        </div>
        <div class="pays-ths"><br/>
            <br/>
            <br/>
            <img src="${images}/w-27.gif" width="108" height="28" style="cursor:pointer"
                 onclick="javascript:window.location='${ctx}'"/>　　　　　　

            <img src="${images}/w-28.gif" width="108" height="28" style="cursor:pointer"
              onclick="javascript:window.location='${ctx}/myshopin/orders.html'"/><br/>
            <br/>
            <br/>
            <br/>
            <br/>
        </div>
        <div class="clear">&nbsp;</div>

    </div>
    <%--cart-content结束--%>
</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>
</body>
</html>
