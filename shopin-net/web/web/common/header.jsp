<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<script type="text/javascript">
var path = window.location;
var leiVar="";
var index = -1;
var pathUrl = "http://www.shopin.net/";
jQuery(document).ready(function($) {
	if(path!=pathUrl){
		$("#login").attr("href","${ctx}/login.html?forward="+path);
		$("#register").attr("href","${ctx}/goRegister.html?forward="+path);
	}else{
		$("#login").attr("href","${ctx}/login.html");
		$("#register").attr("href","${ctx}/goRegister.html");
	}
	
	$("#select").hide();
	//热词搜索
	$.ajax({
		url: "${searchDomain }/popSearch.json",
		dataType: "jsonp",
		data: {
			chnSid: "${channel.sid }" // 频道SID
			},
		jsonp: "callback",
		jsonpCallback: "success_jsonpCallback",
		error: function() {
			return;
			},
		timeout: 30000,
		success: function(resp) {
			if (resp.success) {
				for (i in resp.result) {
					var k = resp.result[i];
//					var a = "<a target='_blank' href=${searchDomain}/search.html?keyword=" + k + ">" + k + "</a>";
					var a = "<a href='javascript:void(0);' onclick='searchKeyWordNewWindow(\""+k+"\")'>" + k +"</a>";
					$("#hotSearchKey").append(a);
				}
			}
		}
	});
});
</script>
<div id="topNav">
	<div class="in clear">
		<span id="hello" class="fl">您好，欢迎光临上品折扣！</span>
		<ul class="fr">
			<li class="login"><a class="hl" id="login" href="" target="_blank">登录</a>
			<a class="hl" id="register" href="" target="_blank">免费注册</a>
			</li>
			<li class="pr">
				<a href="${ctx}/help/newreg.html" target="_blank">新手上路</a>
				<a href="${sso }/myshopin/index.html" target="_blank">我的上品</a>
				<a href="${ctx}/help/customer.html" target="_blank">帮助</a>
				<em>关注我们：</em>
 <a class="tSina" href="http://weibo.com/shopinnet" target="_blank" title="新浪微博"></a><a class="tQq" href="http://t.qq.com/shangpinzhekou" target="_blank" title="腾讯微博"></a><a class="tWeixin"   href="javascript:void(0);" title="上品微信"></a>
								<div class="tCode"><img src="/images/img_code1.gif" width="180" height="180">
										<p>公司微信号为：shopin2000</p>
								</div>
			</li>
		</ul>
	</div>
</div>
<jsp:include page="/common/had.jsp"/>
<c:if test="${!empty ads0 }">
 <div id="had" style="height:0px; visibility:hidden; line-height:0; font-size:0; display:none;"><a href="${ads0.link}" target="_blank"><img src="${images}/${ads0.pic}" alt="${ads0.memo }" width="950" height="147"></a></div>
</c:if>
<div id="header">
	<div class="in pr" style="z-index:5">
		<h1 id="logo"><a href="http://www.shopin.net/index.html"><img src="${localimg}/logo.png" width="323" height="53" alt="上品折扣网 - 国内领先名品折扣商城"></a></h1>
		<div id="search" class="pr">
			<ul id="select">
			</ul>
			<span class="searchTxt fl"><input id="search-key" type="text" value="请输入搜索内容"></span><input class="searchBtn fl fb f14" type="button" value="搜&nbsp;索" onclick="javascript:dosearch();">
			<div id="hotSearchKey" class="hotWords zm cl">热门搜索：</div>
		</div>
		<div id="cart" class="pr"><span class="shopping"><span id="shopping-amount" class="png">0</span></span><a href="${ctx}/cart/show.html" target="_blank" title="去购物车结算"><img src="${localimg}/cart.png" width="181" alt="去购物车结算"></a></div>
	</div>
</div>
<div id="navBar">
	<div class="in">
		
		<div id="categorys" <c:if test="${!empty index}"> class="categorys homenav" </c:if> <c:if test="${empty index}"> class="categorys subnav pa" </c:if>>
			<div class="allcate"><a <c:if test="${empty index}"> class="hover" </c:if>>全部商品分类</a></div>

			<c:if test="${!empty navigations}">
			
			<ul <c:if test="${empty index}"> class="undis" </c:if>>
			
				<c:forEach var="n" items="${navigations}" varStatus="status" begin="0" end="7">
				<c:if test="${!empty n}">
				<li>
					<div class="catehd">
						<span class="${n.icon}">
						<c:forEach var="nav" items="${n.navList }" varStatus="status">
						    
							<a href="${searchDomain}/search.html?keyword=${nav.keyWord}&cates=${nav.cates}">${nav.name}</a><c:if test="${!status.last}">&nbsp;</c:if>
					    </c:forEach>
						</span>
					</div>
					<div class="submenubox undis">
						<div class="subcate">
							
							<c:forEach var="sub" items="${n.subList}">
							<c:if test="${!empty sub}">
							<dl>
								<dt><a href="${searchDomain}/search.html?keyword=${sub.keyWord}&cates=${sub.cates}">${sub.name}</a></dt>
								<dd>
									
									<c:forEach var="secondSub" items="${sub.subList}">
									<c:if test="${!empty secondSub}">
										<em><a href="${searchDomain}/search.html?keyword=${secondSub.keyWord}&cates=${secondSub.cates}">${secondSub.name }</a></em>
									</c:if>
									</c:forEach>
									
								</dd>
							</dl>
							</c:if>
							</c:forEach>
							
						</div>
						<div class="colright">
							<div class="merchantpromotion">
								<h3>促销活动</h3>
								<div class="colimg">
									
									<c:forEach var="p" items="${n.promotions}" varStatus="status" end="0">
									<c:if test="${!empty p}">
										<a href="${p.promotionLink}" target="_blank"><img class="colimg" src="${ftpimages}/${fn:replace(p.promotionSpict, 'jpg', 'resize_to.220x120.jpg')}" alt="${p.promotionTitle}"></a>
									</c:if>
									</c:forEach>
									
								</div>
							</div>
							<div class="featuredbrand">
								<h3>推荐品牌</h3>
								<ul>
									
									<c:forEach var="b" items="${n.brandList}" varStatus="status" end="5">
									<c:if test="${!empty b}">
										<li><a href="${searchDomain}/brandlist.html?brandSid=${b.sid}" title="_blank" target="_blank"><img src="${images}${b.brandpic2}" alt="${b.brandName}"></a></li>
									</c:if>
									</c:forEach>
								</ul>
								<div class="cl"></div>
							</div>
							<div class="colmore"><a href="${n.brandLink }" target="_blank">更多品牌&nbsp;&gt;&gt;</a></div>
						</div>
						<div class="cl"></div>
					</div>
				</li>
				</c:if>
				</c:forEach>
				
			</ul>
			</c:if>
			
		</div>
		<ul class="nav oz f14">
			<c:forEach var="c" items="${channelList}" varStatus="status">
				<li><a href="${ctx}/${c.channelUrl}" <c:if test="${channel.sid==c.sid }"> class="cur" </c:if>>${c.displayName}</a></li>
			</c:forEach>
		</ul>
	</div>
</div>
<script src="${localjs}/slider.js"></script>
<script src="${localjs}/allCate.js"></script>

<script type="text/javascript">
//跳转搜索页转码，解决IE乱码问题
function searchKeyWordNewWindow(keyword) {
	var forword = "${searchDomain }/search.html?keyword=" + encodeURI(keyword);
	window.location.href = forword;
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
					//alert("请求失败" + XMLHttpRequest.status + "" + XMLHttpRequest.readyState + "" + textStatus);
					index = -1;
					return;
				},
				success : function(response) {
					//alert("成功");
					index = -1;
					var result = response.result;
					var status = result.status;
					var message = result.message;
					if("" == message) {
						$("#select").html("");
					} else if (status && status == '1') {
						//alert(result + "----" + message);
						var dataObj = eval("(" + message
								+ ")");//转换为json对象
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
	    //window.location.href = '${searchDomain}/search.html?keyword=' + text;
	    searchKeyWord(text);
	}
	
	 $(document).click(function(event) {
		 $("#select").hide();
		 }); 
//	$("#search-key").blur(function() {
//		setTimeout(function(){
//			$("#select").hide();
//		},100);
//	});
	//搜索
	function dosearch() {
		var keyword = $("#search-key").val();
		if (keyword == "请输入搜索内容") {
			$("#search-key").focus();
			return;
		}
		if (keyword != null && keyword != "" && keyword != "请输入搜索内容") {
			//var href = '${searchDomain}/search.html?keyword=' + keyword;
			//window.location.href = href;
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
			//alert('上箭头');
			index = index-1;
			if(index < 0) {
				index = size-1;
			}
			$("#select a").eq(index).addClass("selectA").siblings().removeClass("selectA");
			var text = $("#select a").eq(index).text();
			$('#search-key').val(text);
		}
		if (event.keyCode == 40) {
			//alert("下箭头");
			//var cur = $("#select").find(".selectA");
		    //index = $("#select a").index(cur);
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
	//选择颜色
		$(".tWeixin").hover(function(){
			$(".tCode").show();
			},function(){
	  		$(".tCode").hide();
			});

</script>
<!--延时加载-->
<script type="text/javascript" src="${localjs}/jquery.lazyload.js"></script>
<script type="text/javascript">
$(function() {
	$("#container img").lazyload({
		placeholder:"${localimg}/s.gif",
		effect:"fadeIn",
		threshold:10
	});
});
</script>
<script src="${localjs}/tab.js"></script>