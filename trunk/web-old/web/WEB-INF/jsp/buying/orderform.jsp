<%--
  Description:订单表单
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>订单-上品折扣网www.shopin.net</title>
<link href="css/master.css" rel="stylesheet" type="text/css" />
<link href="css/mycart.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/input.js"></script>
<script type="text/javascript" src="js/piaoqian.js"></script>
<script src="js/ifocus.js" type="text/javascript"></script>
<script type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>

<body>
<div id="page">
<!--[if !ie]>页头开始<![endif]-->
    <div id="header">
        <div id="logo"><img src="images/logo.jpg" alt="上品折扣网-www.shopin.net" /></div>
        <div id="shopin-site">
            <select>
              <option>北京站</option>
              <option>上海站</option>
            </select>
        </div>
        <div id="banner"><img src="images/i-1.gif" alt="正品保障" /></div>
        <ul id="loginbar">
        	<li>您好，欢迎来上品！<a href="#">登录</a> | <a href="#">免费注册</a> | <a href="#">新手上路</a> | <a href="#">我的上品</a> | <a href="#">帮助</a></li>
            <li class="line10">服务热线 <span>400 609 0600 </span>(10:00-22:00)<a href="#"><img src="images/i-2.gif" alt="客服在线" /></a></li>
      	</ul>
      	<ul id="main-nav">
          <li class="width25">&nbsp;</li>
          <li><a href="#">首页</a></span></li>
          <li><a href="#" id="Focus">女人</a></li>
          <li><a href="#">男士</a></li>
          <li><a href="#">运动户外</a></li>
          <li><a href="#">鞋</a></li>
          <li><a href="#">内衣</a></li>
          <li><a href="#">箱包配饰</a></li>
          <li><a href="#">童装</a></li>
          <li><a href="#">所有品类</a></li>
          <li><a href="#">品牌专业店</a></li> 
          <li class="width25">&nbsp;</li>
      </ul>
      	<div class="subnav">
          <ul>
            <li class="topnav">
                <ul>
                    <li><a href="#">限时抢购</a></li>
                    <li><span>|</span><li>
                    <li><a href="#">买手推荐</a></li>
                    <li><span>|</span><li>
                    <li><a href="#">新品上架</a></li>
                    <li><span>|</span><li>
                    <li><a href="#">品牌风云榜</a></li>
                    <li><span>|</span><li>
                    <li><a href="#">会员专享</a></li>
                    <li><span>|</span><li>
                    <li><a href="#">资讯社区</a></li>
                    <li><span>|</span><li>
                    <li><a href="#">上品知道</a></li>
                </ul>
             </li>
            <li class="search">
              <form>
                <input name="input" type="text" class="s-input" value="请输入品牌/货号"/>
                <div id="t_select">
                    <div id="t_selected" onClick="shlist();" onMouseOver="cws(true);" onMouseOut="cws(false);" onblur="hlist()">全部</div>
			    <div id="t_select-list" onMouseOver="cws(true);" onMouseOut="cws(false);">
                      <div class=""onclick="changesever(this);" ><a href="#">全部</a></div>
                      <div class=""onclick="changesever(this);" ><a href="#">女人</a></div>
                      <div class=""onclick="changesever(this);" ><a href="#">男土</a></div>
                      <div class=""onclick="changesever(this);" ><a href="#">运动户外</a></div>
                      <div class=""onclick="changesever(this);" ><a href="#">鞋</a></div>
                      <div class=""onclick="changesever(this);" ><a href="#">内衣</a></div>
                      <div class=""onclick="changesever(this);" ><a href="#">箱包配饰</a></div>
                      <div class=""onclick="changesever(this);" ><a href="#">童装</a></div>
                  </div>
                </div>
                <input type="image" src="images/i-4.gif"　class="searchbutton" />
              	<h3><span><a href="#">高级搜索</a></span>　<a href="#">暇步士</a> <a href="#">婷美</a> <a href="#">猫人</a> <a href="#">暇步士</a> <a href="#">婷美</a></h3> 
              </form>
            </li>
          </ul>  
          
          <ul class="shop">
            <li><img src="images/i-5.gif" alt="购物车" /></li>
            <li class="shop3">
                <p><a href="#">购物车有 <span>2 </span>件商品</a></p>
                <p><a href="#">去结算>></a> 　<a href="#">我的订单(<span>2</span>)</a></p>
            </li>
           </ul>
      </div>
   	</div>
    <ul class="banner-channels">
    	<ol><img src="images/y-count001.gif" alt="我的购物车" />
    	</ol>
   <div class="cart-step">
		   <img src="images/y_num001.gif" alt="第一步" border="0" /><font color="#f60">挑选商品</font> <img src="images/y_arr_001-c.gif" alt="" width="23" height="8" />
		   <img src="images/y_num002-c.gif" alt="第二步" border="0" /><font color="#f60">我的购物车</font><img src="images/y_arr_001-c.gif" alt="" width="23" height="8" />
		   <img src="images/y_num003-c.gif" alt="第三步" border="0" /><font color="#f60">确认结算</font><img src="images/y_arr_001-c.gif" alt="" width="23" height="8" />
		   <img src="images/y_num004.gif" alt="第四步" border="0" />订购成功		</div>
    </ul>

<!--[if !ie]>页头结束<![endif]-->
<!--[if !ie]>cart-content开始<![endif]-->
    <div id=cart-content>
		<div class="pay-kong"></div>
		<div class="pay-bk">
			<div class="pay-tit">请选择配送方式：</div>
			<div class="pay-content">
				<div class="pay-content1">
					<div class="pay-but-select">快递</div>
					<div class="pay-but">自提</div>
					<div class="pay-but">邮局快包</div>
				</div>
				<div class="pay-content1">
					<div class="pay-speed">快递至：</div>
					<div class="speed-site">
						<select>
						  <option>北京</option>
						  <option>上海</option>
						</select>
        			</div>
 					<div class="pay-speedf">运费：</div><div class="pay-speedf1">5.0</div><div class="pay-speedf">元</div> <div class="pay-speedf">&nbsp;&nbsp;&nbsp;&nbsp;<a href="#">查看配送规定</a></div>
				</div>
			</div>
		</div>
		<div class="pay-kong"></div>
		<div class="pay-bk1">
			<div class="pay-tit">请填写个人信息：</div>
			<div class="pay-info">
				<div class="pay-infotit">
				<b>收货人信息</b>(打“<font color="#ff0000">*</font>”号请务必填写)
				</div>
				<div class="pay-infotit">
					<div class="pay-infoc">收件人姓名：</div>
					<div class="pay-infoc1">
						<input type="text" class="pay-infos" name="textfield" id="textfield" />
					</div>
					<div class="pay-infoc5"><font color="#ff0000">*</font></div>
				
				
				</div>
				<div class="pay-infotit">
					<div class="pay-infoc">收件人地址：</div>
					<div class="pay-infoc2">
						<select name="select" class="pay-infos1" id="select">
							<option>北京</option>
						</select>
					</div>
					<div class="pay-infoc3">省</div>
					<div class="pay-infoc2">
						<select name="select" class="pay-infos1" id="select">
							<option selected="selected">北京</option>
						</select>
					</div>
					<div class="pay-infoc3">市</div>
					<div class="pay-infoc4">
						<input type="text" class="pay-infos2" name="textfield" id="textfield" />
					</div>
				</div>
				<div class="pay-infotit">
					<div class="pay-infoc">邮编：</div>
					<div class="pay-infoc1">
						<input type="text" class="pay-infos" name="textfield" id="textfield" />
					</div>
					<div class="pay-infoc5">(有助于更快分配送货地址)</div>
				
				</div>
				<div class="pay-infotit">
					<div class="pay-infoc">收件人电话：</div>
					<div class="pay-infoc1">
						<input type="text" class="pay-infos" name="textfield" id="textfield" />
					</div>
					<div class="pay-infoc5"><font color="#ff0000">*</font>(请尽量填写手机号，以便联系)</div>
				
				</div>
				<div class="pay-infotit">
					<div class="pay-infoc">邮箱：</div>
					<div class="pay-infoc1">
						<input type="text" class="pay-infos" name="textfield" id="textfield" />
					</div>
					<div class="pay-infoc5"><font color="#ff0000">*</font>(请输入您常用的邮箱，方便日后管理账户信息、收取订单通知)</div>
				</div>
				<div class="pay-infotit1">
					<div class="pay-infoc7">备注：</div>
					<div class="pay-infoc6">
						<textarea name="textfield" cols="60" rows="5" class="pay-infos3" id="textfield"></textarea>
					</div>
				</div>
			</div>
			<div class="pay-info">
				<div class="pay-infotit">
					<div class="pay-infotit2"><b>需要发票？</b></div>
					<div class="pay-content1">
						<div class="pay-but-select">不需要</div>
						<div class="pay-but">需&nbsp;&nbsp;要</div>
					</div>	
				</div>		
			</div>
			<div class="pay-info">
				<div class="pay-infotit">
					<div class="pay-infotit2">发票抬头：</div>
					<div class="pay-infoc4">
						<input type="text" class="pay-infos2" name="textfield" id="textfield" />
					</div>
				</div>		
			</div>
			<div class="pay-info">
				<div class="pay-infotit">
					<div class="pay-infotit2">发票内容：</div>
					<div class="pay-infoc4">
						<input type="text" class="pay-infos2" name="textfield" id="textfield" />
					</div>
				</div>		
			</div>

		</div>
		<div class="pay-kong"></div>
		<div class="pay-bk2">
			<div class="pay-mtit">请选择支付方式：</div>
			<div class="pay-minfo">
				<div class="pay-minfotit">
				<b>货到付款</b>&nbsp;&nbsp;&nbsp;&nbsp;我们的快递人员将在送货上门时，收取您购买商品的相关费用。
				</div>
			</div>
			<div class="pay-minfo1">
				<div class="pay-minfotit1">
				<b>银行卡支付</b>&nbsp;&nbsp;&nbsp;&nbsp;利用您手中的银行卡，轻松实现刷卡购物。
				</div>
				<div class="pay-minfotit2">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="25%">招商银行</td>
							<td width="25%">建设银行</td>
							<td width="25%">工商银行</td>
							<td width="25%">平安银行</td>
						</tr>
						<tr>
							<td>首信会员帐户</td>
							<td>民生银行卡</td>
							<td> 兴业银行卡</td>
							<td>深圳发展银行</td>
						</tr>
						<tr>
							<td>农业银行 </td>
							<td> 广东发展银行</td>
							<td>北京银行 </td>
							<td>华夏银行</td>
						</tr>
						<tr>
							<td>交通银行</td>
							<td>浦发银行</td>
							<td> 网汇通 </td>
							<td>渤海银行</td>
						</tr>
						<tr>
							<td>光大银行</td>
							<td>北京农村商业银行</td>
							<td>中信银行</td>
							<td>中国银行</td>
						</tr>
						<tr>
							<td colspan="2">ChinaPay [上海农村商业银行 、中国银行（上海）</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td colspan="4">广东银联[广州市商业银行（广州市）、广州市农村信用合作社联合社（广州市、深圳） 、 顺德农村信用合作社 中国银行（广州除深圳）] </td>
						</tr>
					</table>
				</div>
				
			</div>
			<div class="pay-minfo">
				<div class="pay-minfotit">
				<b>第三方非银行帐户支付</b>（目前已开通支付宝）</div>
			</div>
		</div>
		<div class="pay-kong"></div>
		<div class="pay-money">
			<div class="pay-moneyt">订单总金额：<font color="#cc0000">185.00</font>元&nbsp;&nbsp;商品总金额：<font color="#CC0000">180.00</font>元&nbsp;&nbsp;运费：<font color="#cc0000">5.0</font>元</div>
			<div class="pay-moneyt"><img src="images/y-m005.gif" border="0"  /></div>
		</div>
		<div class="pay-kong"></div>
		<div class="pay-list">
			<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#ff9900">
				<tr>
					<td bgcolor="#ffecd0"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
						<tr>
							<td width="50%" class="pay-listt">商品清单</td>
							<td width="50%" class="pay-listt1"><a href="#">修改</a>&nbsp;&nbsp;</td>
						</tr>
					</table>
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="pay-listc">
							<tr>
								<td width="8%">商品编码</td>
								<td width="21%">商品名称</td>
								<td width="9%">市场正价</td>
								<td width="9%">上品价</td>
								<td width="8%">库存量</td>
								<td width="9%">颜色</td>
								<td width="6%">尺寸</td>
								<td width="9%">重量</td>
								<td width="9%">购买数量</td>
								<td width="12%">配送方式</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF">12345678</td>
								<td bgcolor="#FFFFFF"><a href="#">Et Boite专柜正品流行女款背心</a></td>
								<td bgcolor="#FFFFFF"><del>398.0</del></td>
								<td bgcolor="#FFFFFF">90.0</td>
								<td bgcolor="#FFFFFF">1</td>
								<td bgcolor="#FFFFFF">橘红色</td>
								<td bgcolor="#FFFFFF">160</td>
								<td bgcolor="#FFFFFF">0.5公斤</td>
								<td bgcolor="#FFFFFF">1</td>
								<td rowspan="2" bgcolor="#FFFFFF">快递</td>
							</tr>
							<tr>
								<td bgcolor="#FFFFFF">12345678</td>
								<td bgcolor="#FFFFFF"><a href="#">Et Boite专柜正品流行女款背心</a></td>
								<td bgcolor="#FFFFFF"><del>100.0</del></td>
								<td bgcolor="#FFFFFF">90.0</td>
								<td bgcolor="#FFFFFF">3</td>
								<td bgcolor="#FFFFFF">橘红色</td>
								<td bgcolor="#FFFFFF">160</td>
								<td bgcolor="#FFFFFF">1公斤</td>
								<td bgcolor="#FFFFFF">2</td>
							</tr>
							<tr>
								<td><b>总计</b></td>
								<td>&nbsp;</td>
								<td><b>498.0</b></td>
								<td><strong><font color="#cc0000">180.0</font></strong></td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td><strong>3</strong></td>
								<td><strong>运费：5.0元</strong></td>
							</tr>
						</table></td>
				</tr>
			</table>
		</div>
		<div class="pay-kong"></div>
	</div>

<!--[if !ie]>cart-content结束<![endif]-->
<!--[if !ie]>底部内容开始<![endif]-->
  <ul id="shangpin">
    <li class="shangpin-logo"><img src="images/i-44.gif" alt="上品商业" /></li>
           <li><a href="#"><img src="images/i-1.jpg" alt="亚运村店" /><p>亚运村店</p></a></li>
           <li><a href="#"><img src="images/i-2.jpg" alt="王府井店" /><p>王府井店</p></a></li>
           <li><a href="#"><img src="images/i-3.jpg" alt="中关村店" /><p>中关村店</p></a></li>
           <li><a href="#"><img src="images/i-4.jpg" alt="五棵松店" /><p>五棵松店</p></a></li>
           <li><a href="#"><img src="images/i-5.jpg" alt="首体店" /><p>首体店</p></a></li>
           <li><a href="#"><img src="images/i-6.jpg" alt="朝阳店" /><p>朝阳店</p></a></li>
  </ul>
    <ul class="about">
   	  <li class="about-list">
       	<ul>
          <ol>关于上品</ol>
              <li><a href="#">联系我们</a></li>
              <li><a href="#">友情链接</a></li>
        </ul>
      </li>
      <li class="about-list width133">
        <ul>
              <ol>购物指南</ol>
              <li><a href="#">新用户注册</a></li>
              <li><a href="#">怎么下订单</a></li>
              <li><a href="#">常见问题</a></li>
              <li><a href="#">顾客投诉板</a></li>
            </ul>
      </li>
        <li class="about-list width129">
        	<ul>
              <ol>支付方式</ol>
              <li><a href="#">网上支付</a></li>
              <li><a href="#">银行汇款</a></li>
              <li><a href="#">电话支付</a></li>
              <li><a href="#">邮局汇款</a></li>
              <li><a href="#">货到付款</a></li>
            </ul>
        </li>
        <li class="about-list width168">
        	<ul>
              <ol>配送方式</ol>
              <li><a href="#">支付方式</a></li>
              <li><a href="#">网上支付常见问题</a></li>
              <li><a href="#">配送范围/时间/运费</a></li>
            </ul>
        </li>
      <li class="about-list width224">
        	<ul>
              <ol>退换货服务</ol>
              <li class="dian2"><a href="#">退货政策</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"><img src="images/i-11.gif" hspace="6" align="absmiddle" />退货政策</a></li>
              <li class="dian2"><a href="#">退货流程</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"><img src="images/i-11.gif" hspace="6" align="absmiddle" />换货流程</a></li>
              <li><a href="#">补发货流程</a></li>
              <li><a href="#">错货处理流程</a></li>
              <li><a href="#">如何退款</a></li>
            </ul>
      </li>
        <li class="about-list width200">
        	<ul>
              <ol>客服中心</ol>
              <li><a href="#">客服联系方式</a></li>
              <li><a href="#">客服热线：4006090600</a></li>
              <li><a href="#">在线客服：QQ QQ  旺旺</a></li>
              <li><a href="#">客服mail:service@shopin.cn</a></li>
              <li><a href="#">客服传真：(010)51721200</a></li>
            </ul>
        </li>
    </ul>
    <ul class="bottomnav">
    	<li><a href="#">关于我们</a></li>
        <li><a href="#">网站地图</a></li>
      <li><a href="#">联系我们</a></li>
        <li><a href="#">人才招聘</a></li>
        <li><a href="#">品牌招商</a></li>
        <li><a href="#">友情链接</a></li>
        <li><a href="#">联盟合作</a></li>
    </ul>
    <ul class="shopin-icon">
    	<li><a href="#"><img src="images/i-47.gif" alt="上品折扣低价的秘密" /></a></li>
        <li><a href="#"><img src="images/i-48.gif" alt="正品保障10天保退换" /></a></li>
        <li><a href="https://www.alipay.com/aip/aip_validate_list.htm?trust_id=AIP11033240" target="_blank"><img src="https://img.alipay.com/img/logo/aip/logo154x50.jpg"></a></li>
  </ul>
    <div class="bottomnav1"><a href="#">使用条件</a> | <a href="#">隐私声明</a> <a href="#">京ICP备0944499号</a><img src="images/i-49.gif" alt="ICP" align="absmiddle" />Copyright 2008-2010, 版权所有 <a href="http://www.shopin.net">SHOPIN.NET</a></div>
<!--[if !ie]>底部内容结束<![endif]-->
</div></div>

</body>
</html>
