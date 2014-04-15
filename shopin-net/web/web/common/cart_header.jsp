<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<body>
<script src="${localjs}/jquery132min.js"></script>
<script type="text/javascript">
var index = -1;
jQuery(document).ready(function($) {
	$("#select").hide();
	init_if_login();
});
function init_if_login() {
	 <%--页头初始化--%>
     $.ajax({
         url:'${ctx}/headerinfo.json',
         type: 'post',
         dataType: 'json',
         data:{},
         timeout: 30000,
         error: function(){
             return;
         },
         success: function(response){
             var isLogin=response.isLogin;
             var username=response.username;
             var proqty=response.proqty;
             var orderqty=response.orderqty;
             <%--处理登lu后的显示--%>
             if(isLogin=='1'){   
               var li=$("#hello");
               var login=$(".login");   
               li.html("<span style='color:red'>"+username+"</span>，欢迎来到上品折扣！");
               login.html("<a href='${ctx}/logout.html'>注销</a>");
               
             }
             <%--处理用户购物车商品数量--%>
             $("#header_pro_qty").html(proqty);
             <%--处理用户订单数量--%>
             $("#header_order_qty").html(orderqty);
             return;
         }
     });
}
</script>
<div id="topNav">
		<div class="in oz"> <span id="hello" class="fl">您好，欢迎光临上品折扣！</span>
				<ul class="fr">
						<li class="login"><a class="hl" href="${ctx}/login.html" target="_blank">登录</a>
						<a class="hl" href="${ctx}/goRegister.html" target="_blank">免费注册</a>
						</li>
						<li> <a href="" target="_blank">新手上路</a> 
						<a href="${sso }/myshopin/index.html" target="_blank">我的上品</a>
                        <a href="" target="_blank">帮助</a> <em>关注我们：</em> <a class="tSina" href="http://weibo.com/shopinnet" target="_blank" title="新浪微博"></a><a class="tQq" href="http://t.qq.com/shangpinzhekou" target="_blank" title="腾讯微博"></a>
						<a class="tWeixin" onmouseout="yincang()" onmousemove="showWeixin()"  href="javascript:void(0);" title="上品微信"></a>
								<div class="tCode"><img src="/images/img_code1.gif" width="180" height="180">
										<p>公司微信号为：shopin2000</p>
								</div>
						</li>
				</ul>
		</div>
</div>
<div id="header">
		<div class="in cart">
				<h1 id="logo"><a href="http://www.shopin.net/index.html"><img src="${localimg}/logo.png" width="323" height="53" alt="上品折扣网 - 国内领先名品特卖商城"></a></h1>
				<div id="search" class="pr">
						<ul id="select">
						</ul>
						<span class="searchTxt fl">
						<input id="search-key" type="text" value="请输入搜索内容">
						</span>
						<input class="searchBtn fl fb f14" type="button" value="搜&nbsp;索" onclick="javascript:dosearch();">
				</div>
		</div>
</div>

<script src="${localjs}/slider.js"></script>
<script src="${localjs}/tab.js"></script>
<script src="${localjs}/allCate.js"></script>
<script type="text/javascript">
//跳转搜索页转码 2013 11 14
function searchKeyWordNewWindow(keyword) {
	var forword = "${searchDomain }/search.html?keyword=" + encodeURI(keyword);
	window.open(forword, "_blank");
}
function searchKeyWord(keyword) {
	var forword = "${searchDomain }/search.html?keyword=" + encodeURI(keyword);
	window.location.href = forword;
}
$("#search-key").keyup(
	function(event) {
	if (event.keyCode<41 && event.keyCode>37) {
		return;
	}
	var key = this.value;
		$.ajax({
			url : '${searchDomain }/hotkeyp.json',
			type : 'get',
			dataType: 'jsonp',
			jsonp: "callback",
			jsonpCallback: "success_jsonpCallback",
			data : {
				key : key
			},
			timeout : 30000,
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				index = -1;
				return;
			},
			success : function(response) {
			index = -1;
			var result = response.result;
			var status = result.status;
			var message = result.message;
			if("" == message) {
				$("#select").html("");
			}else if (status && status == '1') {
				var dataObj = eval("(" + message
					+ ")");
				if (dataObj.success) {
					var list = dataObj.data.rs;
					$("#select a").remove();
					for ( var i = 0; i < list.length; i++) {
					$(
						"<a href='javascript:void(0);' onclick='aclickhot(this);'></a>")
						.text(list[i])
						.attr('flag', i)
						.appendTo($("#select"));
					}
					$("#select")[0].size = list.length;
					$("#select").show();
				} else {
					$("#select").hide();
				}
			}
		}
	});
});
$(function(){
	$(".lastSale li").hover(function(){
		$(this).addClass("cur");
		},function(){
		$(this).removeClass("cur");
	});
});
function aclickhot(event){
	var text = $(event).text();
	$('#search-key').val(text);
	$("#select").hide();
	searchKeyWord(text);
}
 $(document).click(function(event) {
	 $("#select").hide();
 }); 
function dosearch() {
	var keyword = $("#search-key").val();
	if (keyword == "请输入搜索内容") {
		$("#search-key").focus();
		return;
	}
	if (keyword != null && keyword != "" && keyword != "请输入搜索内容") {
		searchKeyWord(keyword);
	}
};
$("#search-key").keydown(function(event) {
	if (event.keyCode == 13) {//Enter 
		dosearch();
		$("#search-key").blur();
		$("#select").hide();
	}
	var size = $("#select a").length;
	if (event.keyCode == 38) {
		index = index-1;
		if(index < 0) {
			index = size-1;
		}
		$("#select a").eq(index).addClass("selectA").siblings().removeClass("selectA");
		var text = $("#select a").eq(index).text();
		$('#search-key').val(text);
	}
	if (event.keyCode == 40) {
		index = index+1;
		if(index >= size) {
			index = index%size;
		}
		$("#select a").eq(index).addClass("selectA").siblings().removeClass("selectA");
		var text = $("#select a").eq(index).text();
		$('#search-key').val(text);
	}
});
$("#search-key").focus(function() {
	if (this.value == "请输入搜索内容") {
		this.value = "";
		this.style.color = "#333";
	}
});
$("#search-key").blur(function() {
	if (this.value == "") {
		this.value = "请输入搜索内容";
		this.style.color = "#888";
	} else {
		this.style.color = "#333";
	}
});
</script>
