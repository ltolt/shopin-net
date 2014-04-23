<%--
  Description:会员订单修改
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>修改订单</title>
<script type="text/javascript" src="${js}/input.js"></script>
<link href="${css}/myshopin.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%--面包屑内容开始--%>
<div id="breadcrumb">
    <a href="${ctx}">首页</a><span>></span>我的上品<span>></span>修改订单
</div>
<%--面包屑内容结束--%>
<div style="width:950px;float:left">
    <%--左侧分类开始--%>
    <jsp:include page="myshopin_left.jsp"/>
    <%--左侧分类结束--%>
    <%--右侧分类开始--%>
	<div id="content-rightweihzi">
         <div class="pc01">
            <li><img src="${images}/l-4.gif" alt="" /></li>
            <li><img src="${images}/l-5.gif" alt="" /></li>
            <li><img src="${images}/l-6.gif" alt="" /></li>
            <li><img src="${images}/l-5.gif" alt="" /></li>
            <li><img src="${images}/l-7.gif" alt="" /></li>
            <li><img src="${images}/l-5.gif" alt="" /></li>
            <li><img src="${images}/l-8.gif" alt="" /></li>
            <li><img src="${images}/l-5.gif" alt="" /></li>
            <li><img src="${images}/l-9.gif" alt="" /></li>
        </div>
         <div class="banner"><em style="color:red">订单:S111111111</em></div>
         <div id="content-right">
            <ul class="biaoge">
                <li class="biaoge-top-modify">
                    <strong>收货人信息</strong><span><a href="#">修改</a></span>
                </li>
            </ul>
            <ul class="biaoge1">
                <li>姓名：张三</li>
                <li>地址：北京市海淀区北四环路52号中芯大厦10层上品折扣</li>
                <li>邮编：111111</li>
                <li>电话：13222222222</li>
            </ul>
            <ul class="biaoge">
                <li class="biaoge-top-modify"><strong>发票信息&nbsp;&nbsp;</strong><span><a href="#">修改</a></span></li>
            </ul>
                    <ul class="biaoge1">
                <li>订单编号：93847600383</li>
                <li>支付方式：在线支付</li>
            </ul>
         </div>
	     <div id="content-right">
    	<ul class="biaoge">
        	<li class="biaoge-top-modify"><strong>配送信息&nbsp;&nbsp;</strong><span><a href="#">修改</a></span></li>
        </ul>
		<ul class="biaoge1">
			<li>配送方式：快速送货上门&nbsp;<strong>运费：<span>5.0</span>元</strong></li>
			<li>时间要求：（注：如对送货时间有特别的要求请注明）</li>
			<li>工作日、双休日与节假日均可送货</li>
			<li>工作日、双休日与节假日均可送货</li>
			<li>工作日、双休日与节假日均可送货</li>
			<li>工作日、双休日与节假日均可送货</li>
        </ul>
		<ul class="biaoge">
        	<li class="biaoge-top-modify"><strong>货物拆分</strong></li>
        </ul>
				<ul class="biaoge1">
			<li>A.如果部分产品无货，请发有货部分。</li>
			<li>B.如果部分产品无货，请发有货部分。</li>
        </ul>

    </div>
    	 <div id="content-right">
		<ul class="biaoge">
        	<li class="biaoge-top-modify"><strong>支付信息&nbsp;&nbsp;</strong><span><a href="#">修改</a></span></li>
        </ul>
				<ul class="biaoge1">
			<li>支付方式：货到付款</li>
        </ul>

    </div>
	     <div id="content-right">
				<ul class="biaoge">
        	<li class="biaoge-top-modify"><strong>商品清单&nbsp;&nbsp;</strong><span><a href="#">修改</a></span></li>
        </ul>
						<ul class="biaoge3">
			<li>订单编号</li>
			<li>12345678</li>
			<li>12345678</li>
        </ul>
						<ul class="biaoge4">
			<li>商品名称</li>
			<p><a href="#">Et专柜正品流行女款背心</a></p>
			<p><a href="#">Et专柜正品流行女款背心</a></p>
        </ul>
								<ul class="biaoge3">
			<li>市场正价</li>
			<p>￥236.00</p>
			<p>￥236.00</p>
        </ul>
								<ul class="biaoge3">
			<li>上品价</li>
			<li>90.00</li>
			<li>90.00</li>
        </ul>
										<ul class="biaoge3">
			<li>存库量</li>
			<li>5</li>
			<li>5</li>
        </ul>
								<ul class="biaoge3">
			<li>颜色</li>
			<li>橘红色</li>
			<li>橘红色</li>
        </ul>
												<ul class="biaoge3">
			<li>尺寸</li>
			<li>160</li>
			<li>160</li>
        </ul>
														<ul class="biaoge3">
			<li>购买数量</li>
			<li>60</li>
			<li>60</li>
        </ul>
														<ul class="biaoge5">
			<li><strong>商品总金额：<span>￥799</span>元</strong>预计发货时间：09年09月09日</li>
        </ul>
    </div>
         <div class="banner">
        <ul>
           <li><strong>商品总金额：<span>￥799</span>元</strong></li>
           <li><strong>商品总金额：<span>￥799</span>元</strong></li>
           <li><strong>运费：<span>￥5.0</span>元</strong></li>
        </ul>
        </div>
    </div>
    <%--右侧分类结束--%>
</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>
</body>
</html>
