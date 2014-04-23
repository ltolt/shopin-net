<%--
  Description:订单提交后页面
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<%--如果订单状态不是1,重定向到订单详细页--%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>订购失败</title>
    <link href="${css}/master.css" rel="stylesheet" type="text/css"/>
    <link href="${css}/mycart.css" rel="stylesheet" type="text/css"/>
    <script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>
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
        <div class="pay-kong1"></div>
        <div class="pay-kong1"></div>
        <div class="pays-bk0316">

            <center>
                <li>您的订单支付过程中出现错误，请您稍候重试！</li>
            </center>

        </div>
        <br/>


        <div class="pays-ths"><br/>
            <br/>
            <br/>
            　　　　　
            <br/>
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
