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
<link rel="stylesheet" href="${css}/y_product.css" type="text/css"/>
<link rel="stylesheet" href="${css}/freetab.css"/>
<style>
        .hideclass {
            display: none;
        }
</style>
<script type="text/javascript" src="${js}/jquery/jquery.freetab-0.1.js"></script>
<script type="text/javascript" src="${js}/jquery/jcarousellite_1.0.1.js"></script>
<script type="text/javascript" src="${js}/jquery/jquery.easing.1.1.js"></script>
<script type="text/javascript" src="${js}/jquery/jquery-popdialog-0.1.js"></script>
<script type="text/javascript">
jQuery(document).ready(function($) {
    //getViewHistory();
<c:if test="${fn:length(product.proPics)>=1}">
    //滚动商品图片加载
    $("#nav_item").jCarouselLite({
        //control button
        btnNext: ".next",
        btnPrev: ".prev",
        //speed and effect
        speed: 800,
        auto:false,
        //easing: "backin",
        easing: "easeinout",
        //more or less
        visible: <c:if test="${fn:length(product.proPics)<5}">${fn:length(product.proPics)}</c:if>
                <c:if test="${fn:length(product.proPics)>=5}">5</c:if>,
        //vertical
        vertical: true,
        afterEnd: function(a) {
            //alert($(a).html());
            //$("#current").attr("src", $(a).find("img:first").attr("src"));
        }
    });
</c:if>
    //点击商品小图片
    $("#nav_item img").click(function() {
        $("#current").attr("src", $(this).attr("src"));
        return false;
    })

    //init color title
    $("#colorDetail").html($(".productColor li:first").text());
    //init size title
    //$(".sizeDetail").html($(".productSize li:first").text());

    //颜色tab选中
    $(".productColor li").click(function() {
        var curIndex = $(".productColor li").index(this);
        //alert(curIndex);
        //change color tab style
        $(".productColor li").removeClass();
        $(this).addClass("current");
        //清除其它tab_item的样式和标题，点击当前tab时，当前的item不变
        $(".tab_item").find(".productSize li").removeClass();
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
        if ($("#nav_item li[proColorSid='" + colorId + "']").find("img").length>0) {
            $("#colorDetail").html($(colorTab).text());
            $("#current").attr("src", $("#nav_item li[proColorSid='" + colorId + "']").find("img").attr("src"));
        } else {
            $("#colorDetail").html($(colorTab).text() + " 暂无图片");
            $("#current").attr("src","${images}/nophoto.jpg");
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
        var storediv ="库存<span style='color:blue;font-weight:bold;'>"+ stock+"</span>件。"
        $("#storeTotal").html(storediv);
        var count = getAddToCart($(this).attr("pro_detail_id"));
        //alert(stock);
        var buydiv = "有<span style='color:#CC0000; font-weight:bold'>"+count+"</span>个人在同时抢。"
        $("#buyTotal").html(buydiv);
        $("#proDetailSid").val($(this).attr("pro_detail_id"));

    })

    //颜色tab加载
    $(".rightintro").freetab({
        nav: "tab_nav",
        //鼠标事件，0-onclick;1-onmouseover
        event: 0
    });
});

function setDefaultPic(colorId,colorText) {
    if ($("#nav_item li[proColorSid='" + colorId + "']").find("img").length > 0) {
        $("#colorDetail").html(colorText);
        $("#current").attr("src", $("#nav_item li[proColorSid='" + colorId + "']").find("img").attr("src"));
    } else {
        $("#colorDetail").html(colorText + " 暂无图片");
        $("#current").attr("src", "${images}/nophoto.jpg");
    }
}
function getViewHistory() {
    $.ajax({
        url:'${ctx}/stat/viewhistory.json?id='+Math.round(Math.random()*100000),
        type: 'get',
        dataType: 'json',
        async :false,
        data:{},
        timeout: 30000,
        error: function() {
            return;
        },
        success: function(response) {
            var result = response.viewhistory;
            createInterface(result);
        }
    });
    return;
}

function createInterface(data) {
    var Ldiv = "<ul class='ypaddingbottom22px'><li class='ybrand'><span class='ybrand-ti'>最近浏览过的</span></li>";

    var Idiv = "";
    for (var i = 0; i < data.length; i++) {
        if (i == 0) {
            Idiv += "<li class='ybrand3'><a href='${ctx}/product/"+data[i].proSid+".html'><img src='"+data[i].proPic+"'/></a><h3><a href='${ctx}/product/"+data[i].proSid+".html'>"+data[i].proName+"</a></h3></li><li class='ybrand2'><span class='ybrand-t2'>￥"+data[i].promotionPrice+"</span><span class=ybrand-t3><del>￥"+data[i].originalPrice+"</del></span></li>";
        } else {
            Idiv += "<li class='p-left-fontline'><a href='${ctx}/product/"+data[i].proSid+".html'><span class='ybrand03201'>"+data[i].proName+"</span><span class='ybrand03202'><span style='font-weight: bold;font-family: Arial;color:#FF6600;'>"+data[i].promotionPrice+"</span>元</span></a></li>";
        }
    }
    Ldiv += Idiv + "</ul>";

    $("#viewhistory").html(Ldiv);
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
            'positionId' :positionId
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
                    error: function() {},
                    success: function(response) {}
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
            'positionId' :positionId
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
<%--复制内容到剪切板--%>
function copyToClipBoard(button) {
    var txt = "还在找${product.productName}的打折信息吗？"
            + "快来<a href='${ctx}/product/${product.sid}.html' target='_blank'>这里</a>吧";
    if (window.clipboardData) {
        window.clipboardData.clearData();
        window.clipboardData.setData("Text", txt);
        $.popdialog(button, "copy_to_clip_board",
                '按Ctrl+V粘贴到QQ、MSN或E-mail给好友');
    } else {
        $.popdialog(button, "copy_to_clip_board", "很抱歉，您的浏览器不支持该功能");
    }
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
var InterValObj;
jQuery(document).ready(function($) {
    $(".remainSeconds").each(function() {
        var curIndex = $(".remainSeconds").index(this);
        SysSecond[curIndex] = parseInt($(this).html());

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
}
</script>
</head>

<body>
<%--记录商品详细页 来源的页面,主页,频道页,活动页,品牌页,商品列表页--%>
<input type="hidden" id="pro_positionId" value="${position}"/>

<!--产品详细开始-->
<div class="layout grid-m">
    <div id="icontent">
        <div class="menu-tit">
        <div class="channel-smenu" style="font-weight: bold;padding-left:40px; width:300px;float:left;"><c:forEach var="navigation"
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
        <c:if test="${product.proSelling==0}">
            <div class="product1008201">很遗憾，该商品已被抢空，请关注其他商品，及时提交订单。</div>
        </c:if>
        <!--产品标题结束-->
        <!--产品细节小图开始-->
        <div class="leftpic">
            <c:if test="${fn:length(product.proPics)>5}">
                <div><a href="javascript:void(0);" class="prev"><img src="${images}/y_arr_002.gif"/></a></div>
            </c:if>
            <div id="nav_item">
                <ul>
                    <c:forEach var="pic" items="${product.proPics}" varStatus="status">
                        <li <c:if test="${pic.pictureMastBit=='1'&&pic.proPictureSizeSid=='0'}">proColorSid="${pic.proColorSid}"</c:if>>
                            <a href="javascript:void(0);"><img src="${images}${pic.proPictDir}${pic.proPictName}" alt="${pic.proPictName}" width="85" height="70"/></a>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <c:if test="${fn:length(product.proPics)>5}">
                <div><a href="javascript:void(0);" class="next"><img src="${images}/y_arr_003.gif"/></a></div>
            </c:if>
        </div>
        <!--产品细节小图结束-->
        <!--产品大图开始-->
        <div class="bigpic">
            <div style="border:1px solid #759090;">
                <c:forEach var="pic" items="${product.proPics}" begin="0" end="1" varStatus="status">
                    <c:if test="${pic.pictureMastBit=='1'}">
                        <img id="current" src="${images}${pic.proPictDir}${pic.proPictName}" border="0" width="400" height="400"/>
                    </c:if>
                    <c:if test="${pic.pictureMastBit!='1'}">
                       <c:if test="${status.index==0}">
                           <img id="current" src="${images}${pic.proPictDir}${pic.proPictName}" border="0" width="400" height="400"/>
                       </c:if>
                    </c:if>
                    </c:forEach>
                    <div class="<c:if test="${product.proPrice.offValue>5}">new</c:if>zhekou">
                            ${product.proPrice.offValue}折
                    </div>
            </div>
            <div class="bigpicbottom">温馨提示：图片仅供参考 以实物颜色为准
            </div>
            <div class="y-bution">
                <div class="y-butionbj" onClick="addToFavorite(this)" style="cursor:pointer;">
                    <img src="${images}/w-33.gif" alt="加入收藏"/></div>
                   <div class="y-butionbj" style="cursor:pointer;"><a class="shareto_button" ><img src="http://images.shopin.net/images/lg-share-cn.gif" width="125" height="21" alt="分享" style="border:0"/></a></div>

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
                    <c:choose>
                        <c:when test="${product.proPrice.remainSeconds>0}">
                            <p class="hjbt">
                                <div class="remainSeconds" style="display:none">${product.proPrice.remainSeconds}</div>
                                <span class="xsqg remainTime"></span>
                            <span>活动价： <span class="shopinjg1">${product.proPrice.promotionPrice}</span>元 </span>
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
                        <span>为您节省：<span class="shopinjg">${product.proPrice.originalPrice*1-product.proPrice.promotionPrice*1}</span>元</span>
                    </p>
                </ul>
            </div>
            <!--产品价格信息结束-->
            <c:if test="${product.proSelling==1}">
                <!--颜色选择结束-->
                <div class="sk">
                    <p class="skHj"><img src="${images}/w_51.gif" style="margin-right:5px;"><span style="font-weight: bold;">第1步：</span>请选择色码<a href="http://www.shopin.net/help/color.html" target="_blank"><img src="http://images.shopin.net/images/w_72.gif" alt="什么是图片颜色？" hspace="10" border="0" align="absmiddle"></a> </p>
<ul class="productColor tab_nav">
                        <c:forEach var="detail" items="${details}" varStatus="status">
                            <li colorId="${detail.colorSid}" <c:if test="${status.index==0}">class="current"</c:if> >${detail.proColor}</li>
                        </c:forEach>
                    </ul>
                </div>
                <!--颜色选择结束-->
                <!--尺码开始-->
                <c:forEach var="detail" items="${details}" varStatus="status">
                    <div <c:if test="${status.index!=0}">style="display: none;"</c:if> class="sk tab_item" >
                        <p class="skHj">
                            <span class="skHj03191"><img src="${images}/w_51.gif" style="margin-right:5px;"><span style="font-weight: bold;">第2步：</span>请选择尺码<a href="http://www.shopin.net/help/color.html#s1" target="_blank"><img src="http://images.shopin.net/images/w_72.gif" alt="什么是吊牌规格？" hspace="10" border="0" align="absmiddle"></a></span>
                            <!--<span class="skHj03192"><a href="${ctx}/view/sizeChart.html" target="_blank">参考：服装鞋类标准尺码对照表</a></span>--><br/>
          </p>
                        <ul class="productSize">
                            <c:forEach var="proStan" items="${detail.proStans}" varStatus="status">
                                <li pro_sum="${proStan.proSum}" pro_detail_id="${proStan.proDetailSid}">${proStan.proStanName}</li>
                            </c:forEach>
                        </ul>
      </div>
                </c:forEach>
                <!--尺码结束-->
                <div class="sk">
                     您选择：<span style="font-weight: bold;color:#F83B00;" id="colorDetail">${detail[0].proColorDesc}</span> 尺码：<span style="font-weight: bold;color:#F83B00;" id="sizeDetail">请选择</span> <span id="storeTotal"> </span> <span id="buyTotal"> </span>
                </div>
                <!--产品选择开始-->
                <div class="sk" id="pro_qty_area">
                    <div>
                        <p>
                        <span style="font-weight: bold;"><img src="${images}/w_51.gif" style="margin-right:5px;">第3步：</span>购买数量 <input type="text" value="1" style="width:60px;" id="proQuantity"/>
                        </p>
                    </div>
                </div>
                <div class="buybutton">
                    <input type="hidden" id="proDetailSid" name="proDetailSid" value="">
                    <a href="javascript:void(0);"><img src="${images}/y-p006.jpg" onClick="buy(this)" border="0"/></a><a href="javascript:void(0);"><img src="${images}/y-p007.jpg" border="0" onClick="addToCart(this)"/></a>
                </div>
                <!--产品选择结束-->
            </c:if>
        </div>
    </div>
</div>
<!--产品详细结束-->
<!--[if !ie]>主体内容开始<![endif]-->
<div id="content">
<div class="layout grid-s230">
<div class="col-main">
    <!--产品搭配开-->
    <c:if test="${fn:length(recommends)>0}">
        <div class="main-wrap">
            <div id="ycontent-yright">
                <div class="newsbrand">
                    <div class="hot"><strong>同品类推荐</strong><span class="hot-1"><a href="${ctx}/list--${product.productCateSid}.html">更多>></a></span></div>
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
            <!--商品属性开始-->
            <div class="content8-1-2">
                <div class="hot"><strong>商品属性</strong></div>
                <div class="c-bj"></div>
                <ul class="tab-list">
                    <p><span class="ff6600">【产品名称】</span>${product.productName}</p>

                    <p><span class="ff6600">【所属品牌】</span>${product.brand.brandName}</p>

                    <p><span class="ff6600">【商品编码】</span>${product.proSku}</p>
                </ul>
            </div>
            <!--  商品属性结束-->
        </div>
    </div>
<%--    <c:if test="${! empty product.proDesc}">
    <div class="main-wrap">
        <!--  商品描述开始-->
        <div class="content2">
            <div class="content8-1-2">
                <div class="hot"><strong>商品描述</strong></div>
                <div class="c-bj"></div>
                <ul class="tab-list">

                    <p><span class="ff6600">【整体描述】</span>${product.proDesc}</p>

                </ul>
            </div>
        </div>
        <!--  商品描述结束-->
    </div>
    </c:if>--%>
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
                <%--<ul class="tab-list">
                    <p><span>【测量方法】</span>（允差一厘米左右）</p>

                    <p><span>【身&nbsp;&nbsp;&nbsp;&nbsp;长】</span></p>

                    <p><span>【胸&nbsp;&nbsp;&nbsp;&nbsp;围】</span></p>

                    <p><span>【肩&nbsp;&nbsp;&nbsp;&nbsp;宽】</span></p>

                    <p><span>【肩&nbsp;&nbsp;&nbsp;&nbsp;宽】</span></p>
                </ul>--%>
            </div>
            <!--  商品尺码结束-->
        </div>
    </div>
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
                                        <c:if test="${status.index%2==0}">bgcolor="#F6F6F6"</c:if>><c:if test="${fn:length(record.memName)>4}">${fn:substring(record.memName, 0, fn:length(record.memName)-4)}****</c:if><c:if test="${fn:length(record.memName)<=4&&fn:length(record.memName)>=2}">${fn:substring(record.memName, 0, fn:length(record.memName)-2)}****</c:if><c:if test="${fn:length(record.memName)<2}">${fn:substring(record.memName, 0, 1)}****</c:if></td>
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
                                        <c:if test="${status.index%2==0}">bgcolor="#F6F6F6"</c:if>><c:if test="${fn:length(record.memName)>4}">${fn:substring(record.memName, 0, fn:length(record.memName)-4)}****</c:if><c:if test="${fn:length(record.memName)<=4&&fn:length(record.memName)>=2}">${fn:substring(record.memName, 0, fn:length(record.memName)-2)}****</c:if><c:if test="${fn:length(record.memName)<2}">${fn:substring(record.memName, 0, 1)}****</c:if></td>
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
                                        <c:if test="${status.index%2==0}">bgcolor="#F6F6F6"</c:if>><c:if test="${fn:length(record.memName)>4}">${fn:substring(record.memName, 0, fn:length(record.memName)-4)}****</c:if><c:if test="${fn:length(record.memName)<=4&&fn:length(record.memName)>=2}">${fn:substring(record.memName, 0, fn:length(record.memName)-2)}****</c:if><c:if test="${fn:length(record.memName)<2}">${fn:substring(record.memName, 0, 1)}****</c:if></td>

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
            <li class="ybrand"><span class=ybrand-f><a href="${ctx}/list-${product.brand.sid}.html">更多&gt;&gt;</a></span>
                <span class="ybrand-ti">同品牌产品</span></li>
            <c:forEach var="product" items="${sameBrands}" varStatus="status">
            <c:if test="${status.index==0}">
            <li class="ybrand3">
                <a href="${ctx}/product/${product.sid}.html"><img src="${images}${product.proPicture.proPictDir}${product.proPicture.proPictName}" alt="${product.productName}"/></a>
                <h3><a href="${ctx}/product/${product.sid}.html">${product.productName}</a></h3>
            </li>
            <li class="ybrand2"><span class="ybrand-t2">￥${product.proPrice.promotionPrice}</span><span class=ybrand-t3><del>￥${product.proPrice.originalPrice}</del></span></li>
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
</div>
<!--[if !ie]>左侧分类结束<![endif]-->
</div>
</div>
<!--[if !ie]>主体内容结束<![endif]-->
<script language="JavaScript" type="text/javascript">
//初始化主图
<c:forEach var="detail" items="${details}" varStatus="status" end="1">
<c:if test="${status.index==0}">
    setDefaultPic('${detail.colorSid}',"${detail.proColor}");
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
<img height="1" width="1" border="0" src="http://track.langtaojin.com/tracking/noscript.gif?client_id=6192" />
</noscript>
<script type="text/javascript" src="http://images.shopin.net/js/shareto_button.js" charset="utf-8"></script>
</body>
</html>
