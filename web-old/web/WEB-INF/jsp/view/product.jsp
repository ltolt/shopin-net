<%--
  Description:Product Page(商品展示页)
  User: Peter Wei
  Date: 2010-1-17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head><title>[立即抢购]${product.productName}-100%正品,1-6折天天低价,1小时抢购!实体店供货,10天退换,全国送货上门!-上品折扣官方购物网站-www.shopin.net</title>
<link rel="stylesheet" href="${css}/yproduct_list.css"/>
<link rel="stylesheet" href="${css}/y_product1.4.css" type="text/css"/>
<link rel="stylesheet" href="${css}/freetab.css"/>
<style>
    #nav_item{width:72px;height: 372px; overflow:hidden; clear:both;}
    #nav_item li{width:62px;height:62px;overflow:hidden; margin-bottom:12px; text-align:center; margin-left:8px; cursor:pointer;border: 1px solid #e4e4e4;}

    .smallImgUp,.smallImgDown{width:72px;clear:both;height:15px; cursor:pointer; overflow:hidden;}
    .smallImgDown{margin-top:10px;}

    #nav_item li img{margin:0px; padding:0px;}
    #winSelector{position: absolute;cursor: crosshair;filter: alpha(opacity=60);-moz-opacity: 0.6;opacity: 0.6;background-color: #e6eaf3;border: 1px solid White;}
    #vertical.bigImg {width:400px;height:400px;overflow:hidden;position:relative;text-align:center;vertical-align:middle;}
    #horizontal.bigImg{width:507px;height:456px; }
    #vertical #winSelector{width: 220px;height:200px; }
    #vertical #midimg{width: 400px;height: 400px;}

    #bigView{position: absolute; width:400px; height:400px; overflow:hidden; top:0px !important;left:0px; border:1px solid #dadada;}
    #bigView img{position: absolute;}

    #onlickImg{
        border:1px solid #F83B00;
        display: block;
        width:64px;
        height:64px;
        overflow:hidden;

    }

    .hideclass {
        display: none;
    }
</style>
<script type="text/javascript" src="${js}/goodsview1.5.js"></script>
<script type="text/javascript" src="${js}/jquery/jquery.freetab-0.1.js"></script>
<script type="text/javascript" src="${js}/jquery/jcarousellite_1.0.1.js"></script>
<script type="text/javascript" src="${js}/jquery/jquery.easing.1.1.js"></script>
<script type="text/javascript" src="${js}/jquery/jquery-popdialog-0.1.js"></script>
<script type="text/javascript" src="${js}/jquery/jquery.lazyload.mini.js"></script>
<script type="text/javascript">
jQuery(document).ready(function($) {
		$("img").lazyload({
			  threshold : 400 ,
        placeholder : "${images}/grey.gif",
        effect : "fadeIn"
    });

    $("#colorDetail").html($(".productColor li:first").text());

    //颜色tab选中
    $(".productColor li").click(function() {
        var curIndex = $(".productColor li").index(this);
        //change color tab style
        $(".productColor li").removeClass();
        $(this).addClass("current");

        //清除其它tab_item的样式和标题，点击当前tab时，当前的item不变
        $(".tab_item").find(".productSize").css("display","none");
        $(".tab_item").find(".productSize").eq(curIndex).show();
       // $("#productSize"+$(this).attr("colorId")).find(".productSize li").css("display","");
        $("#sizeDetail").html("请选择");
        //如果当前已选中尺码，库存数量不变
        var sizeFlag = isSelected($(".tab_item").eq(curIndex).find(".productSize li"));
        if (!sizeFlag) {
            $("#proDetailSid").val("");
        }
        //切换主图
        changeMainPic(this);
        $("#storeTotal").html("");
        $("#buyTotal").html("");

    })

    //切换主图
    var changeMainPic = function(colorTab) {
        var colorId = $(colorTab).attr("colorId");
        if ($("#nav_item li[proColorSid='" + colorId + "']").find("img").length > 0) {
            $("#current").attr("src", $("#nav_item li[proColorSid='" + colorId + "']").find("img").attr("src").replace("64x64", "400x400"));
            $("#colorDetail").html($(colorTab).text());
        } else {
            $("#colorDetail").html($(colorTab).text() + " 暂无图片");
            $("#current").attr("src", "${images}/nophoto.jpg");
        }
    }

    //判断尺码是否选中
    var isSelected = function(s) {
        var flag = false;
        s.each(function() {
            if ($(this).attr("class").indexOf("current") != -1) {
                flag = true;
            }
        });
        return flag;
    }

    //尺码选中
    $(".productSize li").click(function() {
        var curIndex = $(".productSize li").index(this);
        //change size item styles
        $(".productSize li").removeClass();
        $(this).addClass("current");

        //change size title
        $("#sizeDetail").html($(this).text());

        var stock = getStock($(this).attr("pro_detail_id"), ${product.proPrice.promotionPrice});
        //alert(stock);
        var storediv = "库存<span style='color:blue;font-weight:bold;'>" + stock + "</span>件。"
        $("#storeTotal").html(storediv);
        var count = getAddToCart($(this).attr("pro_detail_id"));
        //alert(stock);
        var buydiv = "有<span style='color:#CC0000; font-weight:bold'>" + count + "</span>个人在同时抢。"
        $("#buyTotal").html(buydiv);
        $("#proDetailSid").val($(this).attr("pro_detail_id"));

    })
});

function setDefaultPic(colorId, colorText) {
    if ($("#nav_item li[proColorSid='" + colorId + "']").find("img").length > 0) {
        $("#colorDetail").html(colorText);
        $("#current").attr("src", $("#nav_item li[proColorSid='" + colorId + "']").find("img").attr("src").replace("64x64", "400x400"));
    } else {
        $("#colorDetail").html(colorText + " 暂无图片");
        $("#current").attr("src", "${images}/nophoto.jpg");
    }
}

//获取商品库存
function getStock(proDetilSid, price) {
    var stock = 0;
    $.ajax({
        url:'${ctx}/product/getStock.json',
        type: 'post',
        dataType: 'json',
        async :false,
        data:{'proDetilSid':proDetilSid,
            'price':price},
        timeout: 30000,
        error: function() {
            $.popdialog($("#pro_qty_area"), "check_store", "获取库存出错");
            return;
        },
        success: function(response) {
            var result = response.result;
            //alert(result);
            stock = result;
        }
    });
    return stock;
}
//获取商品库存
function getAddToCart(proDetilSid) {
    var count = 0;
    $.ajax({
        url:'${ctx}/product/getAddToCart.json',
        type: 'post',
        dataType: 'json',
        async :false,
        data:{'proDetilSid':proDetilSid},
        timeout: 30000,
        error: function() {
            $.popdialog($("#pro_qty_area"), "check_addToCart", "获取购买数量出错");
            return;
        },
        success: function(response) {
            var result = response.result;
            //alert(result);
            count = result;
        }
    });
    return count;
}
<%--放入购物车--%>
function addToCart(button) {
    var productSID = $.trim($("#proDetailSid").val());
    var price = $.trim($("#product_promotion_price").val());
    var proQuantity = $.trim($("#proQuantity").val());
    var positionId = $.trim($("#pro_positionId").val());
    var channelId = $.trim($("#pro_channelId").val());
    
    if (productSID == '') {
        $.popdialog(button, productSID + "_add_to_cart", '请先选择颜色和尺码');
        return;
    }
    if (proQuantity == '' || isNaN(proQuantity)) {
        $.popdialog(button, productSID + "_add_to_cart_qty", '输入数量不正确');
        return;
    }

    $.ajax({
        url:'${ctx}/cart/add.json',
        type: 'post',
        dataType: 'json',
        data:{'proDetailSID':productSID,
            'promotionPrice':price,
            'proQuantity':proQuantity,
            'positionId' :positionId,
            'channelId'  :channelId
        },
        timeout: 30000,
        error: function() {
            $.popdialog(button, productSID + "_add_to_cart", '将商品放入购物车失败,请重试');
            return;
        },
        success: function(response) {
            var result = response.result;
            var status = result.status;
            var message = result.message;
            if (status && status == '1') {
                $.ajax({
                    url:'${ctx}/stat/cart.json',
                    type: 'post',
                    dataType: 'json',
                    data:{'sid':'${sid}',
                        'userId':'${userId}',
                        'productId':productSID,
                        'buyQuantity':proQuantity,
                        'source' :positionId},
                    timeout: 3000,
                    error: function() {
                    },
                    success: function(response) {
                    }
                });
                window.location = "${ctx}/cart/show.html";
            } else {
                $.popdialog(button, productSID + "_add_to_cart", message);
            }
            return;
        }
    });
}
function buy(button) {
    var productSID = $.trim($("#proDetailSid").val());
    var price = $.trim($("#product_promotion_price").val());
    var proQuantity = $.trim($("#proQuantity").val());
    var positionId = $.trim($("#pro_positionId").val());
    var channelId = $.trim($("#pro_channelId").val());
    if (productSID == '') {
        $.popdialog(button, productSID + "_add_to_cart", '请先选择颜色和尺码');
        return;
    }
    if (proQuantity == '' || isNaN(proQuantity)) {
        $.popdialog(button, productSID + "_add_to_cart_qty", '输入数量不正确');
        return;
    }
    $.ajax({
        url:'${ctx}/cart/add.json',
        type: 'post',
        dataType: 'json',
        data:{'proDetailSID':productSID,
            'promotionPrice':price,
            'proQuantity':proQuantity,
            'positionId' :positionId,
            'channelId'  :channelId
        },
        timeout: 30000,
        error: function() {
            $.popdialog(button, productSID + "_add_to_cart", '快速购买失败,请重试');
            return;
        },
        success: function(response) {
            var result = response.result;
            var status = result.status;
            var message = result.message;
            if (status && status == '1') {
                window.location = "${ctx}/order/confirm.html";
            } else {
                $.popdialog(button, productSID + "_add_to_cart", message);
            }
            return;
        }
    });
}
<%--添加商品到藏夹
@param button 收藏按钮
--%>
function addToFavorite(button) {
    $.ajax({
        url:'${ctx}/favorite/add.json',
        type: 'post',
        dataType: 'json',
        data:{'productSID':'${product.sid}'},
        timeout: 30000,
        error: function() {
            $.popdialog(button, "${product.sid}_favor", '添加商品到收藏夹失败,请重试');
            return;
        },
        success: function(response) {
            var result = response.result;
            var status = result.status;
            var message = result.message;
            $.popdialog(button, "${product.sid}_favor", message);
        }
    });
}

<%--发表评论--%>
function comment(button) {
    var content = $.trim($("#proview_content").val());
    if (content == '') {
        $.popdialog(button, "proview_alert", "评论内容不能为空");
        return;
    }
    $.ajax({
        url:'${ctx}/member/commentAdd.json',
        type: 'post',
        dataType: 'json',
        data:{'productListSid':'${product.sid}',
            'content':content},
        timeout: 30000,
        error: function() {
            $.popdialog(button, "proview_alert", '添加评论失败，请重试');
            return;
        },
        success: function(response) {
            var result = response.result;
            var status = result.status;
            var message = result.message;
            $.popdialog(button, "proview_alert", message);
        }
    });
}
var SysSecond = new Array();
var SysSecond2 = new Array();

//情人节活动
var SysSecond3 = new Array();

var endDate = new Date("2012/2/9 23:59:59"); 
var nowDate = new Date();

//alert(endDate.toLocaleDateString() + "--" + nowDate.toLocaleDateString() + " //"  + ( (endDate - nowDate)/ (24 * 60 * 60 *1000) ) );

var InterValObj;
jQuery(document).ready(function($) {
    $(".remainSeconds").each(function() {
        var curIndex = $(".remainSeconds").index(this);
        SysSecond[curIndex] = parseInt($(this).html());

    });
    $(".remainSeconds2").each(function() {
        var curIndex = $(".remainSeconds2").index(this);
        SysSecond2[curIndex] = parseInt($(this).html());

    });
    //情人节活动
    $(".remainSeconds3").each(function() {
        var curIndex = $(".remainSeconds3").index(this);
        SysSecond3[curIndex] = parseInt( ( (endDate - nowDate)/1000 ) );

    });
    InterValObj = window.setInterval(SetRemainTime, 1000); //间隔函数，1秒执行
});

//时间倒计时
function SetRemainTime() {
    $.each(SysSecond, function(i, n) {
        //alert(i);
        //alert(n);
        if (n > 0) {
            n = n - 1;
            SysSecond[i] = n;
            var second = Math.floor(n % 60);             // 计算秒
            var minute = Math.floor((n / 60) % 60);      //计算分
            var hour = Math.floor((n / 3600) % 24);      //计算小时
            var day = Math.floor((n / 3600) / 24);        //计算天
            var start = "<span class='flash-font16'>";
            var end = "</span>";
            var text = "限时抢购:";
            if (day > 0) {
                text = text + start + day + end + "天";
            }
            if (hour > 0) {
                text = text + start + hour + end + "小时";
            }
            if (minute > 0) {
                text = text + start + minute + end + "分";
            }
            if (second > 0) {
                text = text + start + second + end + "秒";
            }
            text = text + "结束";
            $(".remainTime").eq(i).html(text);
        } else {
            $(".remainTime").html("活动已结束");
            //window.clearInterval(InterValObj);
        }
    });
    $.each(SysSecond2, function(i, n) {
        //alert(i);
        //alert(n);
        SysSecond2[i] = n - 1;
        n = 604800 - n;
        if (n > 0) {
            var second = Math.floor(n % 60);             // 计算秒
            var minute = Math.floor((n / 60) % 60);      //计算分
            var hour = Math.floor((n / 3600) % 24);      //计算小时
            var day = Math.floor((n / 3600) / 24);        //计算天
            var start = "<span class='flash-font16'>";
            var end = "</span>";
            var text = "本周新降价：已降";
            if (day > 0) {
                text = text + start + day + end + "天";
            }
            if (hour > 0) {
                text = text + start + hour + end + "小时";
            }
            if (minute > 0) {
                text = text + start + minute + end + "分";
            }
            if (second > 0) {
                text = text + start + second + end + "秒";
            }
            text = text + "";
            $(".remainTime").eq(i).html(text);
        } else {
            //$(".remainTime").html("降价已结束");
            //window.clearInterval(InterValObj);
        }
    });
    
    //情人节活动
    $.each(SysSecond3, function(i, n) {
        //alert(i);
        //alert(n);
        if (n > 0) {
            n = n - 1;
            SysSecond3[i] = n;
            var second = Math.floor(n % 60);             // 计算秒
            var minute = Math.floor((n / 60) % 60);      //计算分
            var hour = Math.floor((n / 3600) % 24);      //计算小时
            var day = Math.floor((n / 3600) / 24);        //计算天
            var start = "<span class='flash-font16'>";
            var end = "</span>";
            var text = "限时抢购:";
            if (day > 0) {
                text = text + start + day + end + "天";
            }
            if (hour > 0) {
                text = text + start + hour + end + "小时";
            }
            if (minute > 0) {
                text = text + start + minute + end + "分";
            }
            if (second > 0) {
                text = text + start + second + end + "秒";
            }
            text = text + "结束";
            $(".remainTime").eq(i).html(text);
        } else {
            $(".remainTime").html("活动已结束");
            //window.clearInterval(InterValObj);
        }
    });
}
</script>
</head>

<body>
<%--记录商品详细页 来源的页面,主页,频道页,活动页,品牌页,商品列表页--%>
<input type="hidden" id="pro_positionId" value="${position}"/>
<input type="hidden" id="pro_channelId" value="${channel}"/>

<!--产品详细开始-->
<div class="layout grid-m">
    <div id="icontent">
        <div class="menu-tit">
            <div class="channel-smenu" style="font-weight: bold;padding-left:40px; width:300px;float:left;">
                <c:forEach var="navigation"
                           items="${breadcrumbNavigation.list}"
                           varStatus="status"><a
                        href="${ctx}/${navigation.url}">${navigation.name}</a><c:if test="${!status.last}"> >> </c:if></c:forEach>
            </div>
            <div class=tit-m2>
                <img src="${images}/y_num001.gif" alt="第一步" border="0" align="absmiddle"/><span style="color:#FF6600;">挑选商品(1.选择颜色 2.选择尺寸)</span>
                <img src="${images}/y_arr_001.gif" alt="" width="23" height="8" align="middle"/>
                <img src="${images}/y_num002.gif" alt="第二步" border="0" align="absmiddle"/>我的购物车
                <img src="${images}/y_arr_001.gif" alt="" width="23" height="8" align="middle"/>
                <img src="${images}/y_num003.gif" alt="第三步" border="0" align="absmiddle"/>确认结算
                <img src="${images}/y_arr_001.gif" alt="" width="23" height="8" align="middle"/>
                <img src="${images}/y_num004.gif" alt="第四步" border="0" align="absmiddle"/>订购成功
            </div>
        </div>
        <!--产品标题开始-->
        <div class="p-tit">
            <h1>${product.productName}</h1>
        </div>
		<c:if test="${tmall=='tmall'}">
            <div class="product1008201">很遗憾，该商品已被抢空，请关注其他商品，及时提交订单。</div>
        </c:if>
        <c:if test="${product.proSelling==0}">
            <div class="product1008201">很遗憾，该商品已被抢空，请关注其他商品，及时提交订单。</div>
        </c:if>
        <!--产品标题结束-->
        <!--产品细节小图开始-->
        <div class="leftpic">
            <div class="DanpinLeft">
                <div class="smallImg">
                    <div class="smallImgUp"><img src="${images}/smallImgUp02.gif" alt="" title=""/></div>
                    <ul id="nav_item">
                        <c:forEach var="pic" items="${product.proPics}" varStatus="status">
                            <li class="track" <c:if test="${status.index==0}">id="onlickImg"</c:if> <c:if test="${pic.pictureMastBit=='1'&&pic.proPictureSizeSid=='0'}">proColorSid="${pic.proColorSid}"</c:if>>
                                <img <c:if test="${pic.sid*1>2541777||pic.sid*1<42295}">bigview="true"</c:if> src="${images}${pic.proPictDir}${fn:replace(pic.proPictName, "jpg", "resize_to.64x64.jpg")}" alt="${pic.proPictName}"/>
                            </li>
                        </c:forEach>
                    </ul>
                    <div class="smallImgDown"><img src="${images}/smallImgDown01.gif" alt="" title=""/></div>
                </div>
            </div>
        </div>
        <!--产品细节小图结束-->
        <!--产品大图开始-->
        <div class="bigpic">
            <div style="border:1px solid #759090;">
				<div id="vertical" class="bigImg">
                 <ul>
					<li proColorSid="6619">
                        <c:forEach var="pic" items="${product.proPics}" begin="0" end="1" varStatus="status">
                            <c:if test="${pic.pictureMastBit=='1'}">
                                <img id="current"<c:if test="${pic.sid*1>2541777||pic.sid*1<42295}"> bigview="true"  src="${images}${pic.proPictDir}${fn:replace(pic.proPictName, "jpg", "resize_to.400x400.jpg")}"</c:if><c:if test="${pic.sid*1<=2541777}">src="${images}${pic.proPictDir}${pic.proPictName}"</c:if> border="0" />
                            </c:if>
                            <c:if test="${pic.pictureMastBit!='1'}">
                                <c:if test="${status.index==0}">
                                    <img id="current"<c:if test="${pic.sid*1>2541777||pic.sid*1<42295}">  bigview="true" src="${images}${pic.proPictDir}${fn:replace(pic.proPictName, "jpg", "resize_to.400x400.jpg")}"</c:if><c:if test="${pic.sid*1<=2541777}">src="${images}${pic.proPictDir}${pic.proPictName}"</c:if>  border="0" />
                                </c:if>
                            </c:if>
                        </c:forEach>
                    </li>
				</ul>
                <div id="winSelector" style="display: none;" ></div>
				</div>
                <div id="bigView" style="display:none" ><img src="" alt="" /></div>
                <div class="<c:if test="${product.proPrice.offValue>5}">new</c:if>zhekou">
                    ${product.proPrice.offValue}折
                </div>
            </div>
            <div class="bigpicbottom">温馨提示：图片仅供参考 以实物颜色为准
            </div>
            <div class="y-bution">
                <div class="y-butionbj" onClick="addToFavorite(this)" style="cursor:pointer;">
                    <img src="${images}/w-33.gif" alt="加入收藏"/></div>
                <div class="y-butionbj" style="cursor:pointer;">
                    <a class="shareto_button"><img src="http://images.shopin.net/images/lg-share-cn.gif" width="125" height="21" alt="分享" style="border:0"/></a>
                </div>
            </div>
        </div>
        <!--产品大图结束-->
        <!--产品详细开始-->
        <div class="rightintro">
            <!--产品价格信息开始-->
            <div class="btw">
                <ul class="rightjl">
                    <input type="hidden" id="product_promotion_price" value="${product.proPrice.promotionPrice}"/>

                    <p class="hjbt"><span><del>市场正价：${product.proPrice.originalPrice}元</del></span></p>
                    
                    <!-- 情人节活动  begin-->
                    <c:set var="arrayvalue" value="129274C,129276C,129141C,129330C,15218642-1,16218642-2,11215540-3,12215540-6,62211737-2,61211737-3,65212722-3,66212722-1,13194-9920,13195-9630,A25040,A25041,112122136,112222147,bm2157,bl2157,371589,72003,372013,72026,52131009,52131009,,52131034,52131034,211804,211213,213745,213137,1015091103,1037711103,1038371103,1038381103,1050431103,1051001103,1051011103,01113112,51113111,01123118,51123103,01123117,51113116,51123117" />   
	                <c:set var="delim" value=","/>   
					<c:set var="array" value="${fn:split(arrayvalue, delim)}"/>
					<c:set var="pSKU" value="${fn:toLowerCase(product.productName)}" />
					<c:set var="isLove" value="false" />
					
					<c:forEach var="item" items="${array}" varStatus="status"> 
						<c:set var="itemSKU" value="${fn:toLowerCase(item)}" />
						<c:set var="isEQ" value="${fn:indexOf(pSKU, itemSKU)}" />
						<c:if test="${isEQ != -1}" >
							<c:set var="isLove" value="true" />
						</c:if>
					</c:forEach>
					<!-- 情人节活动  end-->
					
                    <c:choose>
                        <c:when test="${product.proPrice.remainSeconds>0}">
                            <p class="hjbt">
	                            <c:choose>
	                            
	                           	 	<c:when test="${isLove == 'true'}">
	                           	 		<div class="remainSeconds3" style="display:none">${product.proPrice.remainSeconds}</div>
	                           	 		<c:choose>
	                                    	<c:when test="${product.proPrice.remainSeconds<691200}">
	                                    		<span class="xsqg3 remainTime"></span>
	                                    		<span>活动价： <span class="shopinjg1">${product.proPrice.promotionPrice}</span>元 </span>
	                                    	</c:when>
	                                    	<c:when test="${product.proPrice.remainSeconds>=691200 && product.proPrice.remainSeconds<1382400}">
	                                    		<span class="xsqg3 remainTime"></span>
	                                    		<span>限时抢购价： <span class="shopinjg1">${product.proPrice.promotionPrice}</span>元 </span>
	                                    	</c:when>
	                                    	<c:otherwise>
	                                    		<span>限时抢购价： <span class="shopinjg1">${product.proPrice.promotionPrice}</span>元 </span>
	                                    	</c:otherwise>
	                                    </c:choose>
	                            	</c:when>
	                                <c:when test="${product.proPrice.promotionPrice*1<product.proPrice.currentPrice*1}">
	                                    <div class="remainSeconds" style="display:none">${product.proPrice.remainSeconds}</div>
	                                    <c:choose>
	                                    	<c:when test="${product.proPrice.remainSeconds<691200}">
	                                    		<span class="xsqg remainTime"></span>
	                                    		<span>活动价： <span class="shopinjg1">${product.proPrice.promotionPrice}</span>元 </span>
	                                    	</c:when>
	                                    	<c:when test="${product.proPrice.remainSeconds>=691200 && product.proPrice.remainSeconds<1382400}">
	                                    		<span class="xsqg2 remainTime"></span>
	                                    		<span>限时抢购价： <span class="shopinjg1">${product.proPrice.promotionPrice}</span>元 </span>
	                                    	</c:when>
	                                    	<c:otherwise>
	                                    		<span>限时抢购价： <span class="shopinjg1">${product.proPrice.promotionPrice}</span>元 </span>
	                                    	</c:otherwise>
	                                    </c:choose>
	                                </c:when>
	                                <c:otherwise>
	                                    <div class="remainSeconds2" style="display:none">${product.proPrice.remainSeconds}</div>
										<c:if test="${product.proPrice.remainSeconds<=604800}">
	                                    	<span class="xsqg1 remainTime"></span>
										</c:if>
	                                    <span>上品折扣价： <span class="shopinjg1">${product.proPrice.promotionPrice}</span>元 </span>
	                                </c:otherwise>
	                            </c:choose>
                            </p>
                        </c:when>
                        <c:when test="${product.proPrice.remainSeconds<=0}">
                            <p class="hjbt">
                                <span>上品折扣价：<span class="shopinjg1">${product.proPrice.promotionPrice}</span>元</span>
                            </p>
                        </c:when>
                        <c:otherwise>
                            <p class="hjbt">
                                <span>上品折扣价：<span class="shopinjg1">${product.proPrice.currentPrice}</span>元</span>
                            </p>
                        </c:otherwise>
                    </c:choose>
                    <p class="hjbt">
                        <span>为您节省：<span class="shopinjg"><fmt:formatNumber value="${product.proPrice.originalPrice*1-product.proPrice.promotionPrice*1}" pattern="##.##" minFractionDigits="2" /></span>元</span>
                    </p>
                </ul>
            </div>
            <!--产品价格信息结束-->
            
			<c:if test="${tmall!='tmall'}">

	            <c:if test="${product.proSelling==1}">
	                <!--颜色选择结束-->
	                <div class="sk">
	                    <p class="skHj">
	                        <img src="${images}/w_51.gif" style="margin-right:5px;"><span style="font-weight: bold;">第1步：</span>请选择色码<a href="http://www.shopin.net/help/color.html" target="_blank"><img src="http://images.shopin.net/images/w_72.gif" alt="什么是图片颜色？" hspace="10" border="0" align="absmiddle"></a>
	                    </p>
	                    <ul class="productColor tab_nav">
	                        <c:forEach var="detail" items="${details}" varStatus="status">
	                            <li colorId="${detail.colorSid}"
	                                <c:if test="${status.index==0}">class="current"</c:if> >${detail.proColor}</li>
	                        </c:forEach>
	                    </ul>
	                </div>
	                <!--颜色选择结束-->
	                <!--尺码开始-->
	                <div class="sk tab_item">
	                    <p class="skHj">
	                        <span class="skHj03191"><img src="${images}/w_51.gif" style="margin-right:5px;"><span style="font-weight: bold;">第2步：</span>请选择尺码<a href="http://www.shopin.net/help/color.html#s1" target="_blank"><img src="http://images.shopin.net/images/w_72.gif" alt="什么是吊牌规格？" hspace="10" border="0" align="absmiddle"></a></span>
	                        <!--<span class="skHj03192"><a href="${ctx}/view/sizeChart.html" target="_blank">参考：服装鞋类标准尺码对照表</a></span>-->
	                        <br/>
	                    </p>
	                    <c:forEach var="detail" items="${details}" varStatus="status">
	                        <ul <c:if test="${status.index!=0}">style="display: none;"</c:if> class="productSize">
	                            <c:forEach var="proStan" items="${detail.proStans}" varStatus="status">
	                                <li pro_sum="${proStan.proSum}" pro_detail_id="${proStan.proDetailSid}">${proStan.proStanName}</li>
	                            </c:forEach>
	                        </ul>
	                    </c:forEach>
	                </div>
	                <!--尺码结束-->
	                <div class="sk">
	                    您选择：<span style="font-weight: bold;color:#F83B00;" id="colorDetail">${detail[0].proColorDesc}</span>
	                    尺码：<span style="font-weight: bold;color:#F83B00;" id="sizeDetail">请选择</span>
	                    <span id="storeTotal"> </span> <span id="buyTotal"> </span>
	                </div>
	                <!--产品选择开始-->
	                <div class="sk" id="pro_qty_area">
	                    <div>
	                        <p>
	                            <span style="font-weight: bold;"><img src="${images}/w_51.gif" style="margin-right:5px;">第3步：</span>购买数量
	                            <input type="text" value="1" style="width:60px;" id="proQuantity"/>
	                        </p>
	                    </div>
	                </div>
	                <div class="buybutton">
	                    <input type="hidden" id="proDetailSid" name="proDetailSid" value="">
	                    <table>
	                    <tr><td width="140"><a href="javascript:void(0);"><img src="${images}/y-p006.jpg" onClick="buy(this)" border="0" width="108" height="38"/></a></td>
	                    <td><a href="javascript:void(0);"><img src="${images}/y-p007.jpg" border="0" onClick="addToCart(this)" width="124" height="38"/></a></td></tr>
	                    </table>
	                </div>
	                <!--产品选择结束-->
	            </c:if>
			 </c:if>
        </div>
    </div>
</div>
<!--产品详细结束-->
<div style="position:absolute; left:965px;" id="bctop">
	<a hidefocus="true" href="javascript:scroll(0,0)">
		<img border="0" alt="回到顶部" src="http://images.shopin.net/images/ad/06201.gif" width="23" height="69">
	</a>
</div> 
<!--[if !ie]>主体内容开始<![endif]-->
<div id="content">
<div class="layout grid-s230">
<div class="col-main">
    <div class="main-wrap">
        <div class="content2">
            <!--商品属性开始-->
            <div class="content8-1-2">
                <div class="hot"><strong>商品属性</strong></div>
                <div class="c-bj"></div>
                <ul class="tab-list">
                    <p><span class="ff6600">【产品名称】</span>${product.productName}</p>

                    <p><span class="ff6600">【所属品牌】</span>${product.brand.brandName}</p>

                    <p><span class="ff6600">【商品编码】</span>${product.proSku}</p>
                    <!-- 显示商品描述信息开始 -->
                    <c:if test="${not empty product.proPageDesc}">
                		${product.proPageDesc}
            		</c:if>
            		<!-- 显示商品描述信息结束 -->
            		
                    <!--c:if test="${empty product.proPageDesc}"-->
                    <div class="bigimgbottom">
                        <c:forEach var="pic" items="${product.proPics}" varStatus="status">
                            <c:if test="${status.index<=6&&status.index!=1}">
                                <c:if test="${pic.sid*1>2541777}">
                                    <img src="${images}${pic.proPictDir}${fn:replace(pic.proPictName, "jpg", "resize_to.640x640.jpg")} " alt="${pic.proPictName}"/>
                                </c:if>
                                <c:if test="${pic.sid*1<=2541777}">
                                    <img src="${images}${pic.proPictDir}${pic.proPictName} " alt="${pic.proPictName}"/>
                                </c:if>
                            </c:if>
                            <c:if test="${status.index>6}">
                                <c:if test="${pic.sid*1>2541777}">
                                    <c:if test="${pic.pictureMastBit=='1'&&pic.proPictureSizeSid=='0'}"><img src="${images}${pic.proPictDir}${fn:replace(pic.proPictName, "jpg", "resize_to.640x640.jpg")} " alt="${pic.proPictName}"/></c:if>
                                </c:if>
                                <c:if test="${pic.sid*1<=2541777}">
                                    <c:if test="${pic.pictureMastBit=='1'&&pic.proPictureSizeSid=='0'}"><img src="${images}${pic.proPictDir}${pic.proPictName} " alt="${pic.proPictName}"/></c:if>
                                </c:if>
                            </c:if>
                        </c:forEach>
                        <c:forEach var="pic" items="${product.proPics}" varStatus="status" begin="1" end="1">
                            <c:if test="${pic.sid*1<=2541777}">
                                <img src="${images}${pic.proPictDir}${pic.proPictName} " alt="${pic.proPictName}"/>
                            </c:if>
                            <c:if test="${pic.sid*1>2541777}">
                                <img src="${images}${pic.proPictDir}${fn:replace(pic.proPictName, "jpg", "resize_to.640x640.jpg")} " alt="${pic.proPictName}"/>
                            </c:if>
                        </c:forEach>
                    </div>
                    <!--/c:if-->
                    
                </ul>
            </div>

            <!--  商品属性结束-->
        </div>
    </div>
    <div class="main-wrap">
        <div class="content2">
            <!--  商品尺码开始-->
            <div class="content8-1-2">
                <div class="hot"><strong>商品尺码表</strong></div>
                <div style="clear:both;"></div>
                <div class="c-bj"></div>
                <ul>
                    <img src="${images}/sizeref/${brand.sid}-${product.productCateSid}.jpg" border="0" onerror="javascript:this.src='${images}/sizeref/default.jpg'"/>
                </ul>
            </div>
            <!--  商品尺码结束-->
        </div>
    </div>
    <!--产品搭配开-->
    <c:if test="${fn:length(recommends)>0}">
        <div class="main-wrap">
            <div id="ycontent-yright">
                <div class="newsbrand">
                    <div class="hot">
                        <strong>同品类推荐</strong><span class="hot-1"><a href="${ctx}/list--${product.productCateSid}.html">更多>></a></span>
                    </div>
                    <ul class="listbrand">
                        <ul class="img-list">
                            <c:forEach var="product" items="${recommends}" varStatus="status">
                                <li>
                                    <a href="${ctx}/product/${product.sid}.html"><img src="${images}/${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}"/>

                                        <p>${product.productName}</p>
                                    </a>

                                    <h3><em>${product.proPrice.originalPrice}</em> ￥${product.proPrice.promotionPrice}
                                    </h3>
                                </li>
                            </c:forEach>
                        </ul>
                    </ul>
                </div>
            </div>
        </div>
    </c:if>
    <!--产品搭配结束-->
    <div class="main-wrap">
        <div class="content2">
            <!--review start-->
            <div class="content8-1-3" id="review_list">
                <div class="hot"><strong>商品评论</strong><span class="hot-spannew">共${fn:length(proReviews)}条，查看全部>></span>
                </div>
                <div class="c-bj"></div>
                <c:if test="${fn:length(proReviews)==0}">该商品暂无用户评论</c:if>
                <c:if test="${fn:length(proReviews)>0}">
                    <c:forEach var="proReview" items="${proReviews}" varStatus="status">
                        <div class="review-contents">
                            <li class="review-tit"><span class="review-time">${proReview.time}</span>&nbsp;&nbsp;
                                <span class="cus-name">买手：${proReview.members.memName}</span></li>
                            <li class="review-con">${proReview.content}</li>
                            <c:forEach var="reply" items="${proReview.replies}" varStatus="status">
                                <li class="review-answ">${reply.members.memName} 回复:${reply.content}</li>
                            </c:forEach>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
            <!--review end-->
        </div>
    </div>
    <div class="main-wrap">
        <div class="content2">
            <!--我要评论开始-->
            <div class="content8-1-3">
                <div class="hot"><strong>我要评论(请先登录再评论)</strong><span class="hot-spannew">共${fn:length(proReviews)}条，查看全部>></span>
                </div>
                <div class="review-contents">
                    <textarea name="我要评论内容" cols="80" rows="5" id="proview_content"></textarea>
                </div>
                <div>
                    <span id="l-input"><a href="${ctx}/login.html" target="_blank">登录</a> | <a href="${ctx}/goRegister.html" target="_blank">免费注册</a></span>
                    <span id="l-login"><img src="${images}/y_004.gif" border="0" style="cursor:pointer" onClick="comment(this);"/></span>
                </div>
            </div>
            <!--我要评论结束-->
        </div>
    </div>
    <div class="main-wrap">
        <div class="content2">
            <!--抢购记录开始-->
            <div class="content8-1-3">
                <div class="hot"><strong>抢购记录</strong></div>
                <div class="c-bj"></div>
                <div class="review-contents">
                    <c:if test="${fn:length(records)==0}">该商品暂无销售记录</c:if>
                    <c:if test="${fn:length(records)>30}">
                        <div id="sales">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bk">
                                <tr>
                                    <td width="25%" align="center" class="bk">订购人</td>
                                    <td width="10%" align="center" class="bk">订购数量</td>
                                    <td width="25%" align="center" class="bk">出售时间</td>
                                </tr>
                                <c:forEach var="record" items="${records}" varStatus="status" end="29">
                                    <tr>
                                        <td align="center"
                                            <c:if test="${status.index%2==0}">bgcolor="#F6F6F6"</c:if>>
                                            <c:if test="${fn:length(record.memName)>4}">${fn:substring(record.memName, 0, fn:length(record.memName)-4)}****</c:if><c:if test="${fn:length(record.memName)<=4&&fn:length(record.memName)>=2}">${fn:substring(record.memName, 0, fn:length(record.memName)-2)}****</c:if><c:if test="${fn:length(record.memName)<2}">${fn:substring(record.memName, 0, 1)}****</c:if></td>
                                        <td align="center"
                                            <c:if test="${status.index%2==0}">bgcolor="#F6F6F6"</c:if>>${record.saleNum}</td>
                                        <td align="center"
                                            <c:if test="${status.index%2==0}">bgcolor="#F6F6F6"</c:if>>${record.saleTime}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                        <div id="allsales" class="hideclass">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bk">
                                <tr>
                                    <td width="25%" align="center" class="bk">订购人</td>
                                    <td width="10%" align="center" class="bk">订购数量</td>
                                    <td width="25%" align="center" class="bk">出售时间</td>
                                </tr>
                                <c:forEach var="record" items="${records}" varStatus="status">
                                    <tr>
                                        <td align="center"
                                            <c:if test="${status.index%2==0}">bgcolor="#F6F6F6"</c:if>>
                                            <c:if test="${fn:length(record.memName)>4}">${fn:substring(record.memName, 0, fn:length(record.memName)-4)}****</c:if><c:if test="${fn:length(record.memName)<=4&&fn:length(record.memName)>=2}">${fn:substring(record.memName, 0, fn:length(record.memName)-2)}****</c:if><c:if test="${fn:length(record.memName)<2}">${fn:substring(record.memName, 0, 1)}****</c:if></td>
                                        <td align="center"
                                            <c:if test="${status.index%2==0}">bgcolor="#F6F6F6"</c:if>>${record.saleNum}</td>
                                        <td align="center"
                                            <c:if test="${status.index%2==0}">bgcolor="#F6F6F6"</c:if>>${record.saleTime}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </c:if>
                    <c:if test="${fn:length(records)>30}">
                        <div id="showbtn" class="qgjl"><a href="javascript:showall();">【全部抢购记录】</a></div>
                    </c:if>
                    <c:if test="${fn:length(records)<=30}">
                        <div id="sales">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bk">
                                <tr>
                                    <td width="25%" align="center" class="bk">订购人</td>
                                    <td width="10%" align="center" class="bk">订购数量</td>
                                    <td width="25%" align="center" class="bk">出售时间</td>
                                </tr>
                                <c:forEach var="record" items="${records}" varStatus="status">
                                    <tr>
                                        <td align="center"
                                            <c:if test="${status.index%2==0}">bgcolor="#F6F6F6"</c:if>>
                                            <c:if test="${fn:length(record.memName)>4}">${fn:substring(record.memName, 0, fn:length(record.memName)-4)}****</c:if><c:if test="${fn:length(record.memName)<=4&&fn:length(record.memName)>=2}">${fn:substring(record.memName, 0, fn:length(record.memName)-2)}****</c:if><c:if test="${fn:length(record.memName)<2}">${fn:substring(record.memName, 0, 1)}****</c:if></td>

                                        <td align="center"
                                            <c:if test="${status.index%2==0}">bgcolor="#F6F6F6"</c:if>>${record.saleNum}</td>
                                        <td align="center"
                                            <c:if test="${status.index%2==0}">bgcolor="#F6F6F6"</c:if>>${record.saleTime}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </c:if>
                </div>
            </div>
            <!--抢购记录结束-->
        </div>
    </div>
</div>
<!--[if !ie]>左侧分类开始<![endif]-->
<div class="col-sub">
    <!--品牌介绍左侧开始-->
    <div id="ybrand-yleft">
        <ul class="ypaddingbottom22px">
            <li class="ybrand"><span class=ybrand-f></span> <span class="ybrand-ti">品牌介绍</span></li>
            <li>
                <div class="ybrand1">
                    <a href="${ctx}/brands/${brand.sid}.html">
                        <c:if test="${empty brand.brandpic2}">
                            <img src="${images}/defBrand.jpg" alt="${brand.brandName}"/>
                        </c:if>
                        <c:if test="${!empty brand.brandpic2}">
                            <img src="${images}/${brand.brandpic2}" alt="${brand.brandName}"/>
                        </c:if>
                    </a>
                    <a href="${ctx}/brands/${brand.sid}.html"><h3>${brand.brandName}</h3>
                    </a>
                </div>
            </li>
            <li class="yline24-dian"><span style="color:#ff6600">品牌名称：</span>${brand.brandName}</li>
            <%--<li class="yline24-dian">
                <span style="color:#ff6600">创建时间：</span><fmt:formatDate value="${brand.brandCreateTime}" pattern="yyyy-M-d"/>
            </li>
            <li class="yline24-dian"><span style="color:#ff6600">创建国家：</span>${brand.brandCreateCountry}</li>
            <li class="yline24-dian"><span style="color:#ff6600">品牌特点：</span>${brand.brandSpecialty}</li>
            <li class="yline24-dian"><span style="color:#ff6600">适合人群：</span>${brand.brandSuitability}</li>--%>
            <li style="width:85%;margin:auto;">${brand.brandDesc}</li>
        </ul>
        <c:if test="${fn:length(sameBrands)>0}">
            <ul class="ypaddingbottom22px">
                <li class="ybrand">
                    <span class=ybrand-f><a href="${ctx}/list-${product.brand.sid}.html">更多&gt;&gt;</a></span>
                    <span class="ybrand-ti">同品牌产品</span></li>
                <c:forEach var="product" items="${sameBrands}" varStatus="status">
                    <c:if test="${status.index==0}">
                        <li class="ybrand3">
                            <a href="${ctx}/product/${product.sid}.html"><img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}"/></a>

                            <h3><a href="${ctx}/product/${product.sid}.html">${product.productName}</a></h3>
                        </li>
                        <li class="ybrand2">
                            <span class="ybrand-t2">￥${product.proPrice.promotionPrice}</span><span class=ybrand-t3><del>
                            ￥${product.proPrice.originalPrice}</del></span></li>
                    </c:if>
                    <c:if test="${status.index>0}">
                        <li class="p-left-fontline">
                            <a href="${ctx}/product/${product.sid}.html"><span class="ybrand03201">${product.productName}</span><span class="ybrand03202"><span style="font-weight: bold;font-family: Arial;color:#FF6600;">${product.proPrice.promotionPrice}</span>元</span></a>
                        </li>
                    </c:if>
                </c:forEach>
            </ul>
        </c:if>
        <div id="viewhistory"></div>

        <!--
        <ul class="ypaddingbottom22px">
            <li class="ybrand"><span class=ybrand-f>|更多&gt;&gt;</span><span class=ybrand-f1>订阅</span><span
                    class="ybrand-ti"> 打折快报</span></li>
            <li class="sidebar-titlecontent"><a href="#">01.08-01.30 NIKE运动系列3折热卖</a></li>
            <li class="sidebar-titlecontent"><a href="#">01.08-01.30 NIKE运动系列动系折热</a></li>
            <li class="sidebar-titlecontent"><a href="#">01.08-01.30 NIKE运动系列3折热卖</a></li>
            <li class="sidebar-titlecontent"><a href="#">01.08-01.30 NIKE运动系列3折动系卖</a></li>
        </ul>
        -->
    </div>
    <!--品牌介绍左侧结束-->
		<div style="margin:15px 8px 0 0; float:left; width:232px;">
			<a href="http://www.shopin.net/channel-store.html" target="_blank"><img src="http://images.shopin.net/images/jmg_ad.jpg" width="234" height="330" /></a>
		</div>	
</div>
<!--[if !ie]>左侧分类结束<![endif]-->
</div>
</div>

<script type="text/javascript">
//回到顶部
$(function(){
var y = $("#bctop").css("bottom");
var sy = $(window).height();
var dy = $(window).scrollTop();
var cy = $(document).height();
$("#bctop").css("bottom",cy - sy - dy + 30 + "px");
})
$(window).scroll( function() {
	var y = $("#bctop").css("bottom");
	var sy = $(window).height();
	var dy = $(window).scrollTop();
	var cy = $(document).height();
	$("#bctop").css("bottom",cy - sy - dy + 30 + "px");
	} );
</script>

<!--[if !ie]>主体内容结束<![endif]-->
<!--
<script type="text/javascript">
var w = 90;
var h = 100;
var str = "";
var obj = document.getElementById("divStayTopLeft");
if (obj)str = obj.innerHTML;
if( typeof document.compatMode != 'undefined' && document.compatMode != 'BackCompat'){
document.writeln('<DIV  style="z-index:9;right:0px; bottom:0;height:'+h+'px;width:'+w+'px;overflow:hidden; position:fixed; _position:absolute; _margin-top:expression(document.documentElement.clientHeight-this.style.pixelHeight+document.documentElement.scrollTop);">');
}
else {
document.writeln('<DIV  style="z-index:9;right:0;bottom:0;height:'+h+'px;width:'+w+'px;overflow:hidden;POSITION:fixed;*position:absolute; *top:expression(eval(document.body.scrollTop)+eval(document.body.clientHeight)-this.style.pixelHeight);">');
}
document.writeln('<div style="clear:both;margin:auto;height:69px;font-size:16px;overflow:hidden;font-weight:bold;text-align:left;"><a href="javascript:scroll(0,0)" hidefocus="true"><img src="http://images.shopin.net/images/ad/06201.gif" alt="回到顶部" style="border: 0px;" /></a></div> ');
document.write('<div style="clear:both;margin:auto;overflow:hidden;text-align:left;">'+str+'</div>');
document.writeln('</DIV>');
</script>
-->
<script language="JavaScript" type="text/javascript">
    //初始化主图
    <c:forEach var="detail" items="${details}" varStatus="status" end="1">
    <c:if test="${status.index==0}">
    setDefaultPic('${detail.colorSid}', "${detail.proColor}");
    </c:if>
    </c:forEach>
    function showall() {
        $("#sales").addClass("hideclass");
        $("#allsales").removeClass("hideclass")
        $("#showbtn").addClass("hideclass");
    }
</script>
<script language="JavaScript" type="text/javascript">
    var langtaojin_client_id = "6192";
</script>
<script language="JavaScript" src="http://track.langtaojin.com/tracking/referrer.js"></script>
<noscript>
    <img height="1" width="1" border="0" src="http://track.langtaojin.com/tracking/noscript.gif?client_id=6192"/>
</noscript>
<script type="text/javascript" src="http://images.shopin.net/js/shareto_button.js" charset="utf-8"></script>

</body>
</html>
