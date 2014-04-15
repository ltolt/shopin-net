<!DOCTYPE HTML>
<%--
  Description:brandStore Page(品牌馆展示页)
  Author:shiying
  Date: 2013-08-13
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>上品折扣网 - 实体店应季正品保障，全网底价折扣特卖</title>
<link href="${localcss}/reset.css" rel="stylesheet" type="text/css">
<link href="${localcss}/layout.css" rel="stylesheet" type="text/css">
<link href="${localcss}/master.css" rel="stylesheet" type="text/css">
</head>

<body>
<div id="container">
<div class="in oz">
<div class="breadCrumbs">当前位置：<a href="" target="_blank">品牌馆</a></div>
<p class="allbrandABC"><span>您可以按字母查找：</span><a href="#A">A</a><a href="#B">B</a><a href="#C">C</a><a href="#D">D</a><a href="#E">E</a><a href="#F">F</a><a href="#G">G</a><a href="#H">H</a><a href="#I">I</a><a href="#J">J</a><a href="#K">K</a><a href="#L">L</a><a href="#M">M</a><a href="#N">N</a><a href="#O">O</a><a href="#P">P</a><a href="#Q">Q</a><a href="#R">R</a><a href="#S">S</a><a href="#T">T</a><a href="#U">U</a><a href="#V">V</a><a href="#W">W</a><a href="#X">X</a><a href="#Y">Y</a><a href="#Z">Z</a></p>

<div class="abccon"><a id="A"></a>
<div class="abcconl abccon_A"></div>
<div class="abcconr">
<c:forEach var="A_brands" items="${root['A']}">
<a href="${searchDomain}/brand/list--${A_brands.sid}------1.html?cid=" target="_blank"><img src="${images}${A_brands.brandPict}" width="65" height="45"><p>${A_brands.brandName}</p></a>
</c:forEach>
</div>
</div>

<div class="abccon"><a id="B"></a>
<div class="abcconl abccon_B"></div>
<div class="abcconr">
<c:forEach var="B_brands" items="${root['B']}">

<a href="${searchDomain}/brand/list--${B_brands.sid}------1.html?cid=" target="_blank"><img src="${images}${B_brands.brandPict}" width="65" height="45"><p>${B_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="C"></a>
<div class="abcconl abccon_C"></div>
<div class="abcconr">
<c:forEach var="C_brands" items="${root['C']}">

<a href=" ${searchDomain}/brand/list--${C_brands.sid}------1.html?cid=" target="_blank"><img src="${images}${C_brands.brandPict}" width="65" height="45"><p>${C_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="D"></a>
<div class="abcconl abccon_D"></div>
<div class="abcconr">
<c:forEach var="D_brands" items="${root['D']}">

<a href=" ${searchDomain}/brand/list--${D_brands.sid}------1.html?cid=" target="_blank"><img src="${images}${D_brands.brandPict}" width="65" height="45"><p>${D_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="E"></a>
<div class="abcconl abccon_E"></div>
<div class="abcconr">
<c:forEach var="E_brands" items="${root['E']}">

<a href=" ${searchDomain}/brand/list--${E_brands.sid}------1.html?cid=" target="_blank"><img src="${images}${E_brands.brandPict}" width="65" height="45"><p>${E_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="F"></a>
<div class="abcconl abccon_F"></div>
<div class="abcconr">
<c:forEach var="F_brands" items="${root['F']}">

<a href=" ${searchDomain}/brand/list--${F_brands.sid}------1.html?cid=" target="_blank"><img src="${images}${F_brands.brandPict}" width="65" height="45"><p>${F_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="G"></a>
<div class="abcconl abccon_G"></div>
<div class="abcconr">
<c:forEach var="G_brands" items="${root['G']}">

<a href="${searchDomain}/brand/list--${G_brands.sid}------1.html?cid= " target="_blank"><img src="${images}${G_brands.brandPict}" width="65" height="45"><p>${G_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="H"></a>
<div class="abcconl abccon_H"></div>
<div class="abcconr">
<c:forEach var="H_brands" items="${root['H']}">

<a href=" ${searchDomain}/brand/list--${H_brands.sid}------1.html?cid=" target="_blank"><img src="${images}${H_brands.brandPict}" width="65" height="45"><p>${H_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="I"></a>
<div class="abcconl abccon_I"></div>
<div class="abcconr">
<c:forEach var="I_brands" items="${root['I']}">

<a href=" ${searchDomain}/brand/list--${I_brands.sid}------1.html?cid=" target="_blank"><img src="${images}${I_brands.brandPict}" width="65" height="45"><p>${I_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="J"></a>
<div class="abcconl abccon_J"></div>
<div class="abcconr">
<c:forEach var="J_brands" items="${root['J']}">

<a href="${searchDomain}/brand/list--${J_brands.sid}------1.html?cid= " target="_blank"><img src="${images}${J_brands.brandPict}" width="65" height="45"><p>${J_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="K"></a>
<div class="abcconl abccon_K"></div>
<div class="abcconr">
<c:forEach var="K_brands" items="${root['K']}">

<a href=" ${searchDomain}/brand/list--${K_brands.sid}------1.html?cid=" target="_blank"><img src="${images}${K_brands.brandPict}" width="65" height="45"><p>${K_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="L"></a>
<div class="abcconl abccon_L"></div>
<div class="abcconr">
<c:forEach var="L_brands" items="${root['L']}">

<a href="${searchDomain}/brand/list--${L_brands.sid}------1.html?cid= " target="_blank"><img src="${images}${L_brands.brandPict}" width="65" height="45"><p>${L_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="M"></a>
<div class="abcconl abccon_M"></div>
<div class="abcconr">
<c:forEach var="M_brands" items="${root['M']}">

<a href=" ${searchDomain}/brand/list--${M_brands.sid}------1.html?cid=" target="_blank"><img src="${images}${M_brands.brandPict}" width="65" height="45"><p>${M_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="N"></a>
<div class="abcconl abccon_N"></div>
<div class="abcconr">
<c:forEach var="N_brands" items="${root['N']}">

<a href=" ${searchDomain}/brand/list--${N_brands.sid}------1.html?cid=" target="_blank"><img src="${images}${N_brands.brandPict}" width="65" height="45"><p>${N_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="O"></a>
<div class="abcconl abccon_O"></div>
<div class="abcconr">
<c:forEach var="O_brands" items="${root['O']}">

<a href="${searchDomain}/brand/list--${O_brands.sid}------1.html?cid= " target="_blank"><img src="${images}${O_brands.brandPict}" width="65" height="45"><p>${O_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="P"></a>
<div class="abcconl abccon_P"></div>
<div class="abcconr">
<c:forEach var="P_brands" items="${root['P']}">

<a href=" ${searchDomain}/brand/list--${P_brands.sid}------1.html?cid=" target="_blank"><img src="${images}${P_brands.brandPict}" width="65" height="45"><p>${P_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="Q"></a>
<div class="abcconl abccon_Q"></div>
<div class="abcconr">
<c:forEach var="Q_brands" items="${root['Q']}">

<a href="${searchDomain}/brand/list--${Q_brands.sid}------1.html?cid= " target="_blank"><img src="${images}${Q_brands.brandPict}" width="65" height="45"><p>${Q_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="R"></a>
<div class="abcconl abccon_R"></div>
<div class="abcconr">
<c:forEach var="R_brands" items="${root['R']}">

<a href="${searchDomain}/brand/list--${R_brands.sid}------1.html?cid= " target="_blank"><img src="${images}${R_brands.brandPict}" width="65" height="45"><p>${R_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="S"></a>
<div class="abcconl abccon_S"></div>
<div class="abcconr">
<c:forEach var="S_brands" items="${root['S']}">

<a href=" ${searchDomain}/brand/list--${S_brands.sid}------1.html?cid=" target="_blank"><img src="${images}${S_brands.brandPict}" width="65" height="45"><p>${S_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="T"></a>
<div class="abcconl abccon_T"></div>
<div class="abcconr">
<c:forEach var="T_brands" items="${root['T']}">

<a href=" ${searchDomain}/brand/list--${T_brands.sid}------1.html?cid=" target="_blank"><img src="${images}${T_brands.brandPict}" width="65" height="45"><p>${T_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="U"></a>
<div class="abcconl abccon_U"></div>
<div class="abcconr">
<c:forEach var="U_brands" items="${root['U']}">

<a href="${searchDomain}/brand/list--${U_brands.sid}------1.html?cid=" target="_blank"><img src="${images}${U_brands.brandPict}" width="65" height="45"><p>${U_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="V"></a>
<div class="abcconl abccon_V"></div>
<div class="abcconr">
<c:forEach var="V_brands" items="${root['V']}">

<a href=" ${searchDomain}/brand/list--${V_brands.sid}------1.html?cid=" target="_blank"><img src="${images}${V_brands.brandPict}" width="65" height="45"><p>${V_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="W"></a>
<div class="abcconl abccon_W"></div>
<div class="abcconr">
<c:forEach var="W_brands" items="${root['W']}">

<a href=" ${searchDomain}/brand/list--${W_brands.sid}------1.html?cid=" target="_blank"><img src="${images}${W_brands.brandPict}" width="65" height="45"><p>${W_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="X"></a>
<div class="abcconl abccon_X"></div>
<div class="abcconr">
<c:forEach var="X_brands" items="${root['X']}">

<a href="${searchDomain}/brand/list--${X_brands.sid}------1.html?cid=" target="_blank"><img src="${images}${X_brands.brandPict}" width="65" height="45"><p>${X_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="Y"></a>
<div class="abcconl abccon_Y"></div>
<div class="abcconr">
<c:forEach var="Y_brands" items="${root['Y']}">

<a href="${searchDomain}/brand/list--${Y_brands.sid}------1.html?cid= " target="_blank"><img src="${images}${Y_brands.brandPict}" width="65" height="45"><p>${Y_brands.brandName}</p></a>

</c:forEach>
</div>
</div>
<div class="abccon"><a id="Z"></a>
<div class="abcconl abccon_Z"></div>
<div class="abcconr">
<c:forEach var="Z_brands" items="${root['Z']}">

<a href=" ${searchDomain}/brand/list--${Z_brands.sid}------1.html?cid=" target="_blank"><img src="${images}${Z_brands.brandPict}" width="65" height="45"><p>${Z_brands.brandName}</p></a>

</c:forEach>
</div>
</div>


</div>
</div>
<div id="footer">
	<div class="help">
		<div class="in oz"> 
			<dl class="bn">
				<dt><a href="">关于上品</a></dt>
				<dd><a href="">公司简介</a></dd>
				<dd><a href="">联系我们</a></dd>
			</dl>
			<div class="l"></div>
			<dl>
				<dt><a href="">新手上路</a></dt>
				<dd><a href="">新用户注册</a></dd>
				<dd><a href="">怎么下订单</a></dd>
				<dd><a href="">常见问题</a></dd>
				<dd><a href="">联系客服</a></dd>
				<dd><a href="">标准尺码表参考</a></dd>
			</dl>
			<div class="l"></div>
			<dl>
				<dt><a href="">支付方式</a></dt>
				<dd><a href="">网上支付</a></dd>
				<dd><a href="">网上在线支付帮助</a></dd>
				<dd><a href="">购物劵使用说明</a></dd>
			</dl>
			<div class="l"></div>
			<dl>
				<dt><a href="">配送方式</a></dt>
				<dd><a href="">配送费收取标准</a></dd>
				<dd><a href="">配送时间和范围</a></dd>
				<dd><a href="">跟踪配送信息</a></dd>
				<dd><a href="">验货与签收</a></dd>
			</dl>
			<div class="l"></div>
			<dl>
				<dt><a href="">退货服务</a></dt>
				<dd><a href="">退货政策</a></dd>
				<dd><a href="">退货流程</a></dd>
				<dd><a href="">退货注意事项</a></dd>
				<dd><a href="">退款方式和时间</a></dd>
			</dl>
			<div class="l"></div>
			<dl>
				<dt><a href="">客服中心</a></dt>
				<dd><a href="">常见问题</a></dd>
				<dd><a href="">在线留言</a></dd>
				<dd><a href="">联系客服</a></dd>
			</dl>
		</div>
	</div>
	<div class="bottomLink tc">
		<a href="" target="_blank">关于我们</a>
		<a href="" target="_blank">品牌入驻</a>
		<a href="" target="_blank">网站地图</a>
		<a href="" target="_blank">诚聘英才</a>
		<a href="" target="_blank">友情链接</a>
		<a href="" target="_blank">隐私协议</a>
		<a href="" target="_blank">网站联盟</a>
		<a href="" target="_blank">营业执照信息</a>
		<p>上品商业旗下官方购物网站</p>
	</div>
	<div class="integrity tc bos">
		<ul>
			<li class="int1"><a href="" target="_blank"><img src="${localimg}/s.gif"><p>货到付款</p></a></li>
			<li class="int2"><a href="" target="_blank"><img src="${localimg}/s.gif"><p>诚信网站</p></a></li>
			<li class="int3"><a href="" target="_blank"><img src="${localimg}/s.gif"><p>快乐购物</p></a></li>
			<li class="int4"><a href="" target="_blank"><img src="${localimg}/s.gif"><p>超值折扣</p></a></li>
		</ul>
	</div>
	<div class="in">
		<ul class="shopinIcon oz">
			<li class="int1"><a href="" target="_blank">上品折扣低价的秘密</a></li>
			<li class="l"></li>
			<li class="int2"><a href="" target="_blank">正品保障10天保退换</a></li>
			<li class="l"></li>
			<li class="int3"><a href="" target="_blank">支付宝特约商家</a></li>
			<li class="l"></li>
			<li class="int4"><a href="" target="_blank">财付通</a></li>
			<li class="l"></li>
			<li class="int5"><a href="" target="_blank">银联特约商户</a></li>
			<li class="l"></li>
			<li class="int6"><a id='___szfw_logo___' href='https://search.szfw.org/cert/l/CX20130325002333002811' target='_blank'>诚信网站</a></li>
			<script type='text/javascript'>(function(){document.getElementById('___szfw_logo___').oncontextmenu = function(){return false;}})();</script>
		</ul>
	</div>
	<div class="copy tc mt pt pb">北京市公安局朝阳分局备案编号110105006009 |<!--<a href="#">使用条件</a> | <a href="#">隐私声明</a>--> <a href="http://www.miibeian.gov.cn/" target="_blank">京ICP证090725号</a><img src="${images}/icp.gif" alt="ICP" align="absmiddle" />Copyright 2008-2011, 版权所有 <a href="http://www.shopin.net">SHOPIN.NET</a>
	</div>
</div>
<script src="${localjs}/jquery132min.js"></script>
<script src="${localjs}/slider.js"></script>
<script src="${localjs}/tab.js"></script>
<script src="${localjs}/allCate.js"></script>
<script src="${localjs}/mousemove.js"></script>
<script src="${localjs}/jquery.lazyload.js"></script>
<script>
//列表排序

$(".sort dd").click(function(){
	$(this).addClass("cur").siblings().removeClass("cur");
});
$(".sort dd, .range dd").hover(function(){
		$(this).addClass("over");
	},function(){
		$(this).removeClass("over");
	});
var range = $(".range dd");
	range.click(function(){
		if($(this).hasClass("cur")){$(this).toggleClass("descend")}else{true};
		$(this).addClass("cur").siblings().removeClass("cur");
	});
</script>
<script>
//商品筛选
$(function(){
//筛选
	var $category = $('.attrs ul:not(".brandAttrs ul")');
	$.each($category, function(i, n){
		$('li:gt(6)', n).hide().parent().next(".attrMore").show();
	})
	var $toggleBtn = $('.attrs .attrMore a:not(".brandAttrs .attrMore a")');             //  获取“显示全部品牌”按钮
	$toggleBtn.click(function(){
		if($(this).text() == '收起') {
			$(this)
				.removeClass("retract")
				.html("更多<i></i>").parent().prev().children('li:gt(6)').hide();
		}else{
			$(this)
				.addClass("retract")
				.html("收起<i></i>").parent().prev().children('li:gt(6)').show();
		}
	});
	//品牌筛选
	var $categoryBrand = $(".brandAttrs ul");
	$.each($categoryBrand, function(i, n){
		$('li:gt(20)', n).hide().parent().next(".attrMore").show();
	})
	var $toggleBtnBrand = $('.brandAttrs .attrMore a');             //  获取“显示全部品牌”按钮
	$toggleBtnBrand.click(function(){
		if($(this).text() == '收起') {
			$(this)
				.removeClass("retract")
				.html("更多<i></i>").parent().prev().children('li:gt(20)').hide();
		}else{
			$(this)
				.addClass("retract")
				.html("收起<i></i>").parent().prev().children('li:gt(20)').show();
		}
	});
	//当前选取并添加至您已选择
	var $currSelect = $(".attr .attrValues li a:not('.colorAttr .attr .attrValues li a')"),$attrName = $(".attrName span").text();
	$currSelect.click(function(){
		$(this).parent().parent().parent().parent().hide();
		$(".selectAttrs ul").append("<li><a>"+$(this).parent().parent().parent().prev().children().html()+"："+$(this).text()+"<i></i></a></li>");
	});
	$(".selectAttrs li").live("click",function(){
		$(this).remove();
		if($(this).children().text() == $attrName){$(this.$attrName).show()}else{return};
		});
	});
</script>
<script>
//选择颜色
$(function(){
	$(".attrValues a").click(function(){
		$(this).addClass("hover").siblings().removeClass("hover");
		});
	});
</script> 

<script type="text/javascript">
        jQuery(function() {
            jQuery("img").lazyload({
                placeholder:"${images}/s/images/loading.gif",
            effect:"fadeIn"
          });
            });
</script>
<!--[if IE 6]>
<script type="text/javascript" src="DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript"> 
DD_belatedPNG.fix('.png');
</script> 
<![endif]-->
</body>
</html>
