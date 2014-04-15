<%--
  Created by IntelliJ IDEA.
  User: yanwt
  Date: 2010-3-1
  Time: 13:49:13
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
  <head>
    <title>客服中心-帮助中心</title>
  	
	<script type="text/javascript" src="js/input.js"></script>
	<link href="http://images.shopin.net/css/help.css" rel="stylesheet" type="text/css" />
	<link href="${localcss}/reset.css" rel="stylesheet" type="text/css">
	<link href="${localcss}/layout.css" rel="stylesheet" type="text/css">
	<link href="${localcss}/cart.css" rel="stylesheet" type="text/css">
</head>
	<body>
	<ul id="l-page">
        <!--[if !ie]>左侧分类开始<![endif]-->
        <li id="content-left">
            <ul class="top-left3">
                <li class="top01"><a href="h_service.html"><span>客服中心</span></a></li>
                <li class="top01"><a href="h_payment.html"><span>购物指南</span></a></li>
                <li class="top01"><a href="h_pay.html"><span>支付方式</span></a></li>
                <li class="top01"><a href="h_log.html"><span>配送服务</span></a></li>
                <li class="top01"><a href="h_return.html"><span>退货服务</span></a></li>
              <li class="top01"><a href="h_service.html"><span>顾客投诉板</span></a></li>
            </ul>
        </li>
        <!--[if !ie]>左侧分类结束<![endif]-->
        <!--[if !ie]>右侧分类开始<![endif]-->
        <li id="content-rightweihzi">
			<div class="daohang"><span><strong>客服中心</strong></span></div>
			<div class="wenzi">
			  <p>&nbsp;&nbsp;&nbsp;&nbsp;1、上品折扣网营业时间：</p>
			  <p>&nbsp;&nbsp;&nbsp;&nbsp;上品折扣网7*24小时营业，您在任何时间均可订购商品。</p>
			  <p>&nbsp;&nbsp;&nbsp;&nbsp;客户服务中心人工服务时间目前是周一到周日9：00-21：00。</p>
			  <p>&nbsp;&nbsp;&nbsp;&nbsp;其他时间您可以通过邮件留言。</p>
			  <p>&nbsp;&nbsp;&nbsp;&nbsp;2、联系方式：如有任何问题，请随时联系我们：</p>  
			  <p>&nbsp;&nbsp;&nbsp;&nbsp;①客服热线：400 898 0808 </p>
			  <!--<p>&nbsp;&nbsp;&nbsp;&nbsp;②在线客服：<a href="http://chat16.live800.com/live800/chatClient/chatbox.jsp?companyID=100703&configID=9937&jid=3886034846&enterurl=http%3A//www.shopin.net/index.html&skillId=699&timestamp=1276408002500" target="_blank"><img src="http://images.shopin.net/images/kefu0220-1.gif" border="0" alt="客服在线"></a></p>-->
			  <p>&nbsp;&nbsp;&nbsp;&nbsp;②客服mail(我们在收到邮件后的1-3个工作日内解决您的问题)</p>
			  <p style="padding-left:35px;">咨询：<a href="mailto:question@shopin.cn">question@shopin.cn</a></p>
			  <p style="padding-left:35px;">查询：<a href="mailto:Web-order@shopin.cn">Web-order@shopin.cn</a></p>
			  <p style="padding-left:35px;">投诉：<a href="mailto:service@shopin.cn">service@shopin.cn</a></p>
		  </div>
			<!-- 投诉板    
			
			<div class="wenzi">
				<form action="/service.html" method="post">
				<table width="620" border="0" cellspacing="0" cellpadding="5">
				  <tr>
					<td height="10" colspan="2" bgcolor="#CCCCCC"><strong>　　　　　　　　　　　　　　　　　　　顾客投诉板</strong></td>
				  </tr>
				  <tr>
					<td height="10" colspan="2">&nbsp;</td>
				  </tr>
				  <tr>
					<td width="10%">姓名</td>
					<td width="90%"><input name="user" type="text" size="40" /></td>
				  </tr>
				  <tr>
					<td>E-mail:</td>
					<td><input name="email" type="text" size="40" /></td>
				  </tr>
				  <tr>
					<td>内容：</td>
					<td><textarea name="content" cols="70" rows="5"></textarea></td>
				  </tr>
				  <tr>
					<td rowspan="2">&nbsp;</td>
					<td height="50" valign="middle">　　　　　　　　　　　　
					  <input type="submit" name="Submit" value=" 提交 " />　　
					  <input type="reset" name="Submit2" value=" 重置 " /></td>
				  </tr>
				  <tr>
					<td height="50" valign="middle">&nbsp;</td>
				  </tr>
				  <tr>
					<td colspan="2">&nbsp;</td>
					</tr>
				</table>
				</form>
				</div>
  -->
  
  
  
  
        </li>
    	<!--[if !ie]>右侧分类结束<![endif]-->
	
	</ul>
	</body>  

</html>