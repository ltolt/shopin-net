<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>退货申请</title>
    <link href="${css}/message.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        <!--
        .STYLE3 {
            color: #FFFFFF;
            font-weight: bold;
        }

        -->
    </style>
    <script>
        var error="${error}";
        if(error!=null&&error!='null'&&error!=""){
            alert(error);
        }
        var orderNo = '${orderNo}';
        if(orderNo!='' && orderNo!=null){
            alert("订单号为"+orderNo+"的订单不存在!");
        }
    </script>
</head>

<body>
<div id="page1">
    <div class="biaoti1"><img src="${images}/0414m4.gif" alt="在线留言"/></div>
    <div class="faq0414-2">
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;">
            <form id="orderFrom">
                <tr>
                    <td height="60" colspan="3" align="left" valign="middle" class="tabletitle1">问题类型：商品售后服务 -- 退货申请
                    </td>
                </tr>
                <tr>
                    <td width="13%" height="70" align="left" valign="middle">我的订单号是</td>
                    <td width="1%" height="30" align="left" valign="middle">&nbsp;</td>
                    <td width="86%" align="left" valign="middle" ><label>
                        <input  type="text" class="faq0414-2kuang" name="orderId" id="orderId"
                               />
                    </label><a href="${ctx}/myshopin/orders.html" target="_blank">查看我的订单</a></td>
                </tr>
                <tr>
                    <td height="80" colspan="3" align="center" valign="middle"><label>
                        <img alt="提交" style="cursor:pointer;" src="${images}/0414m15.gif" onclick="doSubmitRefundOrderSearch()"/>
                    </label></td>
                </tr>
            </form>
        </table>

    </div>
</div>
<script type="text/javascript">
    function doSubmitRefundOrderSearch() {
        var tid=${vo.tid};
        var id = $.trim($("#orderId").val());
        if (id == null || id == "") {
            alert('请输入有效的订单编号');
            return;
        } else {
            var url = "${ctx}/refund/apply/" + id + ".html?typeId=" +tid;
            window.location.href=url;
//           $("#orderFrom").action=url;
//            $("#orderFrom").submit();
        }
    }
</script>
</body>
</html>