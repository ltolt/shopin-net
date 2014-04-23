<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商品列表</title>
<link href="css/shopin-inbc.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<style>

		#gallery img {
			border: none;
		}

		#gallery_nav {
			float: left;
			width: 80px;
			text-align: center;
		}

		#gallery_output {
			float: left;
			width: 210px;
			height: 210px;
			overflow: hidden;
		}

		#gallery_output img {
			display: block;
			margin: 5px auto 0 auto;
		}

	</style>
	<script type="text/javascript" src="jquery.min.js"></script>
	<script language="javascript">
	
		$(document).ready(function() {
			$("#gallery_output img").not(":first").hide();

			$("#gallery a").click(function() {
				if ( $("#" + this.rel).is(":hidden") ) {
					$("#gallery_output img").slideUp();
					$("#" + this.rel).slideDown();
				}
			});
		});

	</script>
	<script type="text/javascript">
/*
EASY TABS 1.2 Produced and Copyright by Koller Juergen
www.kollermedia.at | www.austria-media.at
Need Help? http:/www.kollermedia.at/archive/2007/07/10/easy-tabs-12-now-with-autochange
You can use this Script for private and commercial Projects, but just leave the two credit lines, thank you.
*/

//EASY TABS 1.2 - MENU SETTINGS
//Set the id names of your tablinks (without a number at the end)
var tablink_idname = new Array("tablink","anotherlink")
//Set the id names of your tabcontentareas (without a number at the end)
var tabcontent_idname = new Array("tabcontent","anothercontent") 
//Set the number of your tabs in each menu
var tabcount = new Array("5","6")
//Set the Tabs wich should load at start (In this Example:Menu 1 -> Tab 2 visible on load, Menu 2 -> Tab 5 visible on load)
var loadtabs = new Array("1","5")  
//Set the Number of the Menu which should autochange (if you dont't want to have a change menu set it to 0)
var autochangemenu = 1;
//the speed in seconds when the tabs should change
var changespeed = 3;
//should the autochange stop if the user hover over a tab from the autochangemenu? 0=no 1=yes
var stoponhover = 0;
//END MENU SETTINGS


/*Swich EasyTabs Functions - no need to edit something here*/
function easytabs(menunr, active) {if (menunr == autochangemenu){currenttab=active;}if ((menunr == autochangemenu)&&(stoponhover==1)) {stop_autochange()} else if ((menunr == autochangemenu)&&(stoponhover==0))  {counter=0;} menunr = menunr-1;for (i=1; i <= tabcount[menunr]; i++){document.getElementById(tablink_idname[menunr]+i).className='tab'+i;document.getElementById(tabcontent_idname[menunr]+i).style.display = 'none';}document.getElementById(tablink_idname[menunr]+active).className='tab'+active+' tabactive';document.getElementById(tabcontent_idname[menunr]+active).style.display = 'block';}var timer; counter=0; var totaltabs=tabcount[autochangemenu-1];var currenttab=loadtabs[autochangemenu-1];function start_autochange(){counter=counter+1;timer=setTimeout("start_autochange()",1000);if (counter == changespeed+1) {currenttab++;if (currenttab>totaltabs) {currenttab=1}easytabs(autochangemenu,currenttab);restart_autochange();}}function restart_autochange(){clearTimeout(timer);counter=0;start_autochange();}function stop_autochange(){clearTimeout(timer);counter=0;}

window.onload=function(){
var menucount=loadtabs.length; var a = 0; var b = 1; do {easytabs(b, loadtabs[a]);  a++; b++;}while (b<=menucount);
if (autochangemenu!=0){start_autochange();}
}
</script>
</head>

<body>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" background="images/top_002.gif">
	<tr>
		<td width="9" height="37"><img src="images/top_001.gif" width="9" height="37" /></td>
		<td align="center" class="top_title">本页面所列商品由上品折扣网提供&nbsp;&nbsp;&nbsp;客服热线：4006090600</td>
		<td width="167"><img src="images/top_003.gif" width="167" height="37" /></td>
	</tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" background="images/body_004.gif">
	<tr>
		<td><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/body_003.gif">
			<tr>
				<td width="23"><img src="images/body_001.gif" width="23" height="36" /></td>
				<td class="top_title">&nbsp;<span class="p-title">Kappa[Kappa]专柜正品时尚男款卫衣 K2093WM111-8420 </span></td>
				<td width="14"><img src="images/body_002.gif" width="14" height="36" /></td>
			</tr>
		</table></td>
	</tr>
	<tr>
		<td align="center"><table width="99%" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td height="35" class="p-title1">&nbsp;Kappa[Kappa]专柜正品时尚男款卫衣 K2093WM111-8420 </td>
			</tr>
		</table>
			<table width="99%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="320"><table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="90"><table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td align="center"><img src="images/arrow-001.gif" width="49" height="8" /></td>
								</tr>
								<tr>
									<td align="center"><table width="100%" border="0" cellspacing="3" cellpadding="0">
										<tr>
											<td align="center">
                                            	<div id="gallery">
                                                	<div id="gallery_nav">
                                                        <a rel="img1" href="javascript:;"><img src="images/del/pic.gif" width="77" height="77" class="bk" /></a>
                                                        <a rel="img2" href="javascript:;"><img src="images/del/pic.gif" width="77" height="77" class="bk" /></a>
				</div>
			</div></td>
									  </tr>
										
								  </table></td>
					      </tr>
								<tr>
									<td align="center"><img src="images/arrow-002.gif" width="49" height="8" /></td>
								</tr>
							</table></td>
							<td align="center"><div id="gallery_output">
				<img id="img1" src="images/del/pro1.jpg" width="210" height="210" />
                <img id="img2" src="images/del/pro.jpg" width="210" height="210" />
			</div></td>
                            
					  </tr>
						<tr>
							<td colspan="2" align="center"><table width="90%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td align="center"><a href="mycount.jsp"><img src="images/mall.jpg" width="110" height="30" border="0" /></a></td>
									<td align="center"><a href="mycart.jsp"><img src="images/add.jpg" width="110" height="30" border="0" /></a></td>
								</tr>
							</table></td>
							</tr>
				  </table></td>
					<td align="center" valign="top"><table width="90%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="26%" align="right" height="8"></td>
						</tr>
					</table>
						<table width="99%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="20%" align="right">市场价：</td>
							<td width="30%" align="left"><del>685.00</del></td>
							<td width="20%">工行价：</td>
							<td width="30%" align="left"><span class="top_title">265.00</span></td>
						</tr>
						<tr>
							<td align="right">为您省：</td>
							<td align="left" class="top_title"><span class="brand">420.00</span></td>
							<td class="top_title">&nbsp;</td>
							<td class="top_title">&nbsp;</td>
						</tr>
					</table>
						<table width="90%" border="0" cellpadding="0" cellspacing="0" class="bk_bottom">
							<tr>
								<td width="26%" align="right" height="8">								</td>
							</tr>
						</table>
						<table width="90%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="26%" align="right" height="8"></td>
							</tr>
						</table>
						<table width="99%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="20%" align="right"><strong>请选择</strong>：</td>
								<td>&nbsp;</td>
							</tr>
						</table>
						<table width="99%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="20%" align="right">颜色：</td>
								<td align="left" class="brand">蓝色</td>
							</tr>
						</table>
						<table width="99%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="center">&nbsp;</td>
							</tr>
						</table>
						<table width="90%" border="0" cellpadding="0" cellspacing="0" class="bk_bottom">
							<tr>
								<td width="26%" align="right" height="8"></td>
							</tr>
						</table>
						<table width="90%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="26%" align="right" height="8"></td>
							</tr>
						</table>
						<table width="99%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="20%" align="right">尺码：</td>
								<td align="left" class="brand">L(165/84A)</td>
								<td width="40%" align="right"><a href="size.jsp">详细尺码对照表</a></td>
							</tr>
						</table>
						<table width="99%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="center">&nbsp;</td>
							</tr>
						</table>
						<table width="90%" border="0" cellpadding="0" cellspacing="0" class="bk_bottom">
							<tr>
								<td width="26%" align="right" height="8"></td>
							</tr>
						</table>
						<table width="90%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="26%" align="right" height="8"></td>
							</tr>
						</table>
						<table width="99%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="20%" align="right">数量：</td>
								<td width="27%" align="left" class="brand"><select name="select" id="select">
									<option selected="selected">2</option>
									<option>数量</option>
								</select>
								</td>
								<td width="53%" align="left">库存<span class="brand">3</span>件</td>
							</tr>
						</table>
						<table width="99%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="20%" align="right">共计：</td>
								<td height="28" align="left" class="brand"><strong>530.00元</strong></td>
							</tr>
						</table></td>
				</tr>
			</table>
			<table width="90%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="26%" align="right" height="8"></td>
				</tr>
			</table>
			<table width="573" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="left" class="product_title1">&nbsp;商品属性</td>
				</tr>
				<tr>
					<td><img src="images/underline.gif" width="573" height="7" /></td>
				</tr>
				<tr>
					<td align="left">【产品名称】菲格咪妮专柜正品卫衣外套外套N9-F088S<br />
						【材    质】菲格咪妮专柜正品卫衣外套外套N9-F088S<br />【重    量】菲格咪妮专柜正品卫衣外套外套N9-F088S<br />【所属品牌】菲格咪妮<br />
						【商品编码】N9-F088S
</td>
				</tr>
			</table>
			<table width="90%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="26%" align="right" height="8"></td>
				</tr>
			</table>	
			<table width="573" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="left" class="product_title1">&nbsp;商品描述</td>
				</tr>
				<tr>
					<td align="left"><img src="images/underline.gif" width="573" height="7" /></td>
				</tr>
				<tr>
					<td align="left">【特    点】卫衣外套<br />
						【整体描述】卫衣外套<br />【洗涤说明】卫衣外套
 </td>
				</tr>
			</table>
			<table width="90%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="26%" align="right" height="8"></td>
				</tr>
			</table>
			<table width="573" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td align="left" class="product_title1">&nbsp;商品尺码表</td>
				</tr>
				<tr>
					<td align="left"><img src="images/underline.gif" width="573" height="7" /></td>
				</tr>
				<tr>
					<td align="left"><img src="images/del/chima.gif" width="505" height="169" /></td>
				</tr>
				<tr>
					<td align="left">【测量方法】(允差一厘米左右)<br />【身    长】皮尔卡丹专柜正品休闲女长款羽女长款羽绒服<br />【胸    围】皮尔卡丹专柜正品休闲女长款羽女长款羽绒服<br />【肩    宽】皮尔卡丹专柜正品休闲女长款羽女长款羽绒服<br />【肩    宽】皮尔卡丹专柜正品休闲女长款羽女长款羽绒服
</td>
				</tr>
			</table>
			<table width="90%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="26%" align="right" height="8"></td>
				</tr>
			</table>
			<table width="573" border="0" cellpadding="0" cellspacing="0" background="images/body_008.gif">
				<tr>
					<td width="12" class="product_title1"><img src="images/body_006.gif" width="12" height="30" /></td>
					<td align="center" class="product_title1">相关推荐</td>
					<td width="10" class="product_title1"><img src="images/body_007.gif" width="10" height="30" /></td>
				</tr>
			</table>
			<table width="90%" border="0" align="center" cellpadding="0" cellspacing="2">
				<tr>
					<td width="33%" height="146" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="center" class="bk"><a href="product.jsp"><img src="images/del/pro.jpg" width="140" height="140" border="0" /></a></td>
							</tr>
							<tr>
								<td align="center"><span class="text"><a href="product.jsp">纳纹专柜正品流行女款</a><br />
									市场价：<del>￥599.00</del><br />
									工行价：<span class="top_title">￥120.00</span></span></td>
							</tr>
							
					</table></td>
					<td width="33%" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="center" class="bk"><img src="images/del/pro.jpg" width="140" height="140" border="0" /></td>
							</tr>
							<tr>
								<td align="center"><span class="text"><a href="#">纳纹专柜正品流行女款</a><br />
									市场价：<del>￥599.00</del><br />
									工行价：<span class="top_title">￥120.00</span></span></td>
							</tr>
							
					</table></td>
					<td width="33%" align="center"><table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td align="center" class="bk"><img src="images/del/pro.jpg" width="140" height="140" border="0" /></td>
							</tr>
							<tr>
								<td align="center"><span class="text"><a href="#">纳纹专柜正品流行女款</a><br />
									市场价：<del>￥599.00</del><br />
									工行价：<span class="top_title">￥120.00</span></span></td>
							</tr>
							
					</table></td>
				</tr>
			</table>
			<table width="90%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="26%" align="right" height="8"></td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td><img src="images/body_005.gif" width="600" height="14" /></td>
	</tr>
</table>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0" background="images/body_004.gif">
	<tr>
		<td><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/body_008.gif">
			<tr>
				<td width="12"><img src="images/body_006.gif" width="12" height="30" /></td>
				<td align="center" class="product_title1">上品折扣网售后服务规定</td>
				<td width="10"><img src="images/body_007.gif" width="10" height="30" /></td>
			</tr>
		</table></td>
	</tr>
	<tr>
		<td align="center"><!--Start of the Tabmenu 1 -->
<div class="menu">
<ul>
<li><a href="#" onmouseover="easytabs('1', '1');" onfocus="easytabs('1', '1');" onclick="return false;"  title="" id="tablink1">退换货规定</a></li>
<li>|</li>
<li><a href="#" onmouseover="easytabs('1', '2');" onfocus="easytabs('1', '2');" onclick="return false;"  title="" id="tablink2">退换货流程 </a></li>
<li>|</li>
<li><a href="#" onmouseover="easytabs('1', '3');" onfocus="easytabs('1', '3');" onclick="return false;"  title="" id="tablink3">发票制度 </a></li>
<li>|</li>
<li><a href="#" onmouseover="easytabs('1', '4');" onfocus="easytabs('1', '4');" onclick="return false;"  title="" id="tablink4">上品折扣网顾客服务方式 </a>
<li>|</li>
<li><a href="#" onmouseover="easytabs('1', '5');" onfocus="easytabs('1', '5');" onclick="return false;"  title="" id="tablink5">声明 </a>

</li>
</ul>
</div>
<!--End of the Tabmenu 1 -->


<!--Start Tabcontent 1 -->
<div id="tabcontent1"><h2 align="center" class="p-title">退换货规定</h2><br />
		<span class="SlideTab"><strong>细则一、退换货总则</strong><br />
				<strong>退换货必读：</strong><br />
“上品折扣网”依据《中华人民共和国消费者权益保护法》、国家相关规定制定网上商品销售后的退换货规定。鞋类商品的退换货依据《北京市商业企业鞋类商品经营管理办法》执行。<br />
凡“上品折扣网”售出的商品，从顾客收到货品之日起10日内(以发票日期为准，如无发票以网络发货日期为准)退换商品须凭有效购物凭证(上品折扣网开据的销售单或网上订单信息)、如已开据发票须同时提供发票。在符合以上细则的前提下，欲换货商品不影响二次销售，未经穿着使用，吊牌齐全，我们将提供退换货的服务。 <br />
<strong>细则二、以下情况不予办理退货：</strong><br />
①任何非由上品折扣网出售的商品；<br />
②任何已使用过的商品、有质量问题的商品除外； <br />
③任何因非正常使用、保管和保养导致出现质量问题的商品；<br />
④特殊商品，无质量问题不予退换(a、涉及人身健康的商品：内衣裤、文胸、泳装、睡衣、袜类、饰品、化妆品等；b、经过裁剪修改的成衣及面料等)；<br />
⑤超过三包期限的商品。 <br />
事先未在“上品客服处”登记退换货需求，直接将商品退回，无论何种原因，物流中心将一律拒收。 <br />
<strong>细则三、退换货相关费用：</strong><br />
①因商品质量问题产生的退换货，运费由“上品折扣网”承担(上品折扣网承担的运费金额同顾客购买时支付的运费金额相同)；<br />
②因顾客原因(如：调换尺码、颜色、款式等)造成的无理由退换货，顾客承担退换货的配送费(包邮商品如产生退换货，需买家另外承担货品第一次购买时的邮寄费用)；<br />
③退货完成后，上品折扣网系统会自动生成退单，同时客服人员会审核退单，并且标示运费由哪方承担；物流中心在收到顾客“快递”的退换货品后1-3个工作日内，办理退还运费及相应退货商品金额。</span><br />
</div>
<!--End Tabcontent 1-->

<!--Start Tabcontent 2-->
<div id="tabcontent2"><span class="SlideTab">
					<h2 align="center" class="p-title">退换货流程</h2>
					<strong>1、网络换货流程：</strong><br />
					①顾客在收到商品后如需要办理换货，请您务必在收到该商品10日内先通过电话或邮件、MSN、QQ等方式与上品折扣网客服中心联系，经客服人员审核后符合标准的，将为您办理换货服务，即帮助您再重新购买您所要调换的商品，原购买商品作退货退款处理。上品折扣网顾客服务中心将在收到您退回的商品后为您调换同款商品。 <br />
					<strong>2、门店换货流程：</strong><br />
					①顾客也可以在上品折扣网的发货地直接进行退换货，即顾客可以携带商品、销售单、发票、商品自身配饰到北京上品优价中关村店顾客服务中心直接办理换货。 <br />
					<strong>3、 网络退货流程：</strong><br />
					①顾客在上品折扣网购买商品后，因各种原因需要退货，请及时与上品折扣网客户服
					务中心取得联系，说明所退商品的具体情况，联系方式如换货流程中规定； <br />
					②所退商品经过客服人员审核，符合退换货的标准，会立刻在系统中为您打开此商品的销售状态，由顾客在“我的账户”里申请该商品的退款； <br />
					③申请退款完成后，上品折扣网系统会自动生成退单，同时客服人员会审核退单，并且标示运费由哪方承担(如因顾客原因退货，运费是由顾客承担)； <br />
					④请顾客将所要退的商品连同所收到的销售单寄回(如已开发票，请将发票一同寄回；如果商品自身带有任何配饰也请一并寄回)。上品折扣网会在收到货后完成该商品的退款，通常您的退款将在15个工作日内到达您的支付帐号(视不同银行而定)。 <br />
					<strong>4、门店退货流程：</strong><br />
					①顾客收到货后10日内可以选择到北京上品折扣网的发货地直接退货，其退款仍退回该客户的网上账户，而不能在现场领回现金。退货时，顾客可携带商品、销售单、发票、商品
					
					自身配饰等到上品优价百货中关村门店顾客服务中心办理退货。经客服人员审核后为顾客办理退货，门店收到商品后，客服人员会打开系统中此商品的订单状态，并且由物流主管协助您在现场申请网上退款，并为顾客提供网络商品在门店退货收货的证明，上品折扣网会在收到网上退款申请后完成退款，通常您的退款将在15个工作日内到达您的支付帐号(视不同银行而定)。</span></div>
<!--End Tabcontent 2 -->

<!--Start Tabcontent 3-->
<div id="tabcontent3"><h2 align="center" class="p-title">发票制度</h2>
							<span class="SlideTab"><br />
								①索取发票
								顾客在上品折扣网上购买商品时如需发票，请在提交订单时点击“索取发票”，按提示内容填写发票抬头、发票内容即可，发票将随您订购的商品一同送达； <br />
								②发票抬头：
								发票抬头不能为空，您可填写个人或单位名称； <br />
								③发票内容
								发票的内容栏可以选择如下内容：礼品、服装、体育用品、办公用品(单张发票的金额不得超过1000元)，箱包皮具等； <br />
								④开具商品发票的注意事项：
								a.发票金额为商品总金额，不包含运费、礼券等；
								b.礼券的金额无法开具发票。 </span></div>
<!--End Tabcontent 3-->

<!--Start Tabcontent 4-->
<div id="tabcontent4"><h2 align="center" class="p-title">上品折扣网顾客服务方式</h2>
							<span class="SlideTab">　<strong>1、上品折扣网营业时间：</strong>　<br />
								上品折扣网7*24小时营业，您在任何时间均可订购商品。客户服务中心人工服务时间目前是周一到周日10：00-22：00。其他时间您可以通过在线客服系统/邮件/传真等留言。 <br />
								<strong>2、联系方式：如有任何问题，请随时联系我们：</strong><br />
								①客服热线：4006090600 <br />
								②在线客服：<br />
								
								旺旺：上品折扣网1　　　旺旺：上品折扣网2 <br />
								③客服mail：service@shopin.cn，我们在收到邮件后的1-3个工作日内解决您的问题 <br />
								④客服传真：(010)51721300转115<br />
								<strong>3、北京邮寄退/换货地址：</strong><br />
								优价百货中关村店：北京市海淀区北四环西路52号中芯大厦3层上品优价网顾客服务中心  邮编：100052 </span></div>
<!--End Tabcontent 4-->
<!--Start Tabcontent 5-->
<div id="tabcontent5"><h2 align="center" class="p-title">声明</h2>
							<span class="SlideTab">　　
								上品折扣网郑重承诺，在本网站所售出的所有商品均为该品牌的正规经销商、代理商所出售的真品，不允许有任何假冒伪劣商品在上品折扣网出售，同时上品折扣网秉承“诚信待
								
								人，服务顾客”的宗旨为广大顾客提供知名品牌的折扣和优惠价格商品。对于任何来自外部的欺诈性行为，上品折扣网将保留依法追究法律责任的权利。 </span></div>
<!--End Tabcontent 5--></td>
	</tr>
	<tr>
		<td><img src="images/body_005.gif" width="600" height="14" /></td>
	</tr>
</table>
</body>
</html>
