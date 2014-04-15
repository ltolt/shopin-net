<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>上品折扣携手交通银行</title>
<style>
#header, .backgroundffffff { width:950px; margin:0 auto}
#page { width:auto; position:static;}
.tc { text-align:center}
.wrapper { width:950px; padding:10px 0; margin:10px auto; background:#eff0e8}
.explain { position:relative; margin-top:6px;}
.explain .btn { position:absolute; left:50%; top:335px; margin-left:-100px; zoom:1; width:200px;}
.explain .btn a { width:79px; height:30px; display:inline-block; *display:inline; *zoom:1; margin:0 10px; text-indent:-999em; overflow:hidden; background-image:url(http://images.shopin.net/images/ad/2013jiaohang/btn.png); background-repeat:no-repeat}

.xize { background-position: 0 0}
.shenq { background-position: 0 -30px}
.terms { height:195px; padding:3px; margin:0 0 15px; overflow:hidden; overflow-y:scroll; text-align:left; font:normal 12px/20px simsun;}
/*dialog*/
.dialog { display:none; overflow:hidden; width:450px; padding:10px 15px; position:absolute; z-index:1000; background:#fff; border:2px solid #c8c8c8\9; border-radius:10px; box-shadow:0 0 10px #666;}
#mask { display:none; width:100%; height:100%; position:absolute; z-index:999; top:0px; left:0px; background:#000; opacity:.3; filter:alpha(opacity=30);}
.dialogLine { height:1px; line-height:1px; font-size:0; overflow:hidden; background:#acacac;}
.dialogTitle { height:38px; font:normal 16px/38px 'microsoft yahei'; color:#4d4d4d}
.dialogTitle a { float:right; width:14px; height:14px; margin-top:8px; text-align:center; font:normal 12px/14px 'Century'; border:1px solid #dcdcdc; color:#acacac}
.dialogTitle a:hover, .dialogTitle a:visited { text-decoration:none; color:#acacac}
.dialogContact { padding:10px 8px; padding-right:0}
.alertDet { width:78px; height:30px; cursor:pointer; background:url(http://images.shopin.net/images/ad/aoyunhui/btn.png); border:0}
</style>
<script>
$(function(){
	$(".xize").click(function(){
		$('#mask').show();
		$("#mask").css("height",$(document).height());
		center($('#terms'));
		return false;
	})
	
	$(".close,.alertDet").click(function(){
			$(".dialog,#mask").hide();
		return false;
	});

	function center(obj) {
		var screenWidth = $(window).width(), screenHeight = $(window).height();	//当前浏览器窗口的宽高
		var scrolltop = $(document).scrollTop();	//获取当前窗口距离页面顶部高度
		var objLeft = (screenWidth - obj.width())/2 ;
		var objTop = (screenHeight - obj.height())/2 + scrolltop;
		obj.css({left: objLeft + 'px', top: objTop + 'px','display': 'block'});
	};
});
</script>
</head>

<body>
	<div class="wrapper tc">
		<img src="http://images.shopin.net/images/ad/2013jiaohang/top.png" width="910" height="381">
		<div class="explain"><img src="http://images.shopin.net/images/ad/2013jiaohang/sm.png"><div class="btn"><a class="xize" href="javascript:void(0);">条款细则</a><a class="shenq" href="https://creditcardapp.bankcomm.com/creditcardapply/front/cardapply/record/recordAct.jspx?trunkCode=B052015346986&type=Act_0520437132" target="_blank">立即申请</a></div></div>
	</div>

<!--dialog-->
<div class="dialog" id="terms">
		<div class="dialogTitle"><a class="close" href="javascript:void(0);" title="关闭">X</a>
				<h3>条款与细则：</h3>
		</div>
		<p class="dialogLine"></p>
		<div class="dialogContact">
			<div class="terms">
					1、活动期间，凡在上品折扣网官方网站http://www.shopin.net/上单笔任意消费满300元即可全额使用100元刷卡金进行抵扣，若单笔消费小于300元则无法抵扣。<br><br>
					2、可抵扣刷卡金的消费在支付时须（持本活动核发的交通银行银联信用卡）在支付页面选择选择“银联在线支付”进行支付，刷卡金有效期30天（含）。<br><br>
					3、新客户指从未持有任何交通银行信用卡主卡的客户；信用卡核卡日期以随卡寄送的信用卡卡函中注明的核卡日期为准。<br><br>
					4、活动期间，每位客户仅限获得一次奖励，且不可参与“刷100送50”等其他同期新客户发卡营销活动及不能作为被推荐人参加一“荐”钟情活动。<br><br>
					5、活动刷卡金将于信用卡主卡核发后15个工作日内，导入持卡人的交通银行信用卡刷卡金专用账户，有效期为刷卡金导入之日起的30天（含）。刷卡金导入后交通银行将通过短信告知持卡人，持卡人也可自行登录交通银行信用卡网上银行、手机银行查询刷卡金的账户及明细信息。<br><br>
					6、活动刷卡金不能直接用于刷卡消费，而是以自动返还的方式，用于全部抵扣刷卡金有效期内本条款细则指定消费的交易金额，并于本条款细则指定消费的交易入账后的三日内计入持卡人账户。<br><br>
					7、持卡人获赠的刷卡金需在有效期内使用，如持卡人未在有效期内使用刷卡金，则视为其自动放弃该奖励，且刷卡奖励自动作废。如符合获赠条件的持卡人于活动期间内申请销卡，交通银行有权取消或扣回该持卡人的获赠奖励。刷卡金的获得、查询和使用规则以《刷卡金业务条款及细则》为准，详见交通银行信用卡网站。<br><br>
					8、如持卡人发生任何虚假交易、违法交易、不正常交易、分单交易、最后被取消/退回/未入账交易、不良账户和不正常状态账户，或者持卡人在活动期间申请销卡，交通银行保留拒绝该等持卡人参加本活动及取消其获赠任何奖励的权利。<br><br>
					9、交通银行有权在中国法律法规允许的范围内修改本活动条款及细则（包括但不限于延迟或提前终止本活动、更换同等价值礼品等），并于交通银行信用卡网站或其他相关渠道公告后生效，敬请持卡人留意。持卡人如对本活动条款及细则有任何疑问，可要求交通银行予以释明。
			</div>
	   <div style="text-align:center"> <input type="button" class="alertDet" value="确定"></div>
		</div>
</div>
<div id="mask" class="mask"></div>
</body>
</html>
