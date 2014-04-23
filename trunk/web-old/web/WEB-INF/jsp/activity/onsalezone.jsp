<%--
  Description:超值抢购
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
    <title>超值抢购</title>
    <link type="text/css" href="${css}/value-buying.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${css}/freetab.css"/>
    <link rel="stylesheet" href="${css}/template.css"/>
    <script type="text/javascript" src="${js}/jquery/jquery.freetab-0.1.js"></script>
    <script type="text/javascript" src="${js}/jquery/jcarousellite_1.0.1.js"></script>
    <script type="text/javascript" src="${js}/jquery/jquery.easing.1.1.js"></script>
    <style type="text/css">

            /*  some style
               ---------------
            */

    </style>
    <script type="text/javascript">
        //var jq = jQuery.noConflict();
        jQuery(document).ready(function($) {

            //tab
            //free tab2,tab2样式在freetab.css里调
            $(".tab2").each(function() {
                $(this).freetab({
                    nav: "tab_nav",
                    content: "tab_content",
                    //tab导航和tab content是通过class方式查找，如通过id则为'id'。
                    selectType: 'class',
                    //鼠标事件，0-onclick;1-onmouseover
                    event: 0
                });
            });
            //free tab1,tab1样式在freetab.css里调
            <!--li class为except的则不在导航列表中-->
            $(".tab1").each(function() {
                $(this).freetab({
                    nav: "tab_nav",
                    content: "tab_content",
                    //tab导航和tab content是通过class方式查找，如通过id则为'id'。
                    selectType: 'class',
                    //鼠标事件，0-onclick;1-onmouseover
                    event: 0
                });
            });

            //link tab,tab样式在freetab.css里调
            $(".linkTab").each(function() {
                $(this).freetab({
                    nav: "tab_nav",
                    navType: "a",
                    //鼠标事件，0-onclick;1-onmouseover
                    event: 0
                })
            });

            //滚动展示商品
            $(".roll_item").jCarouselLite({
                //control button
                btnNext: ".next",
                btnPrev: ".prev",
                speed: 1000,
                //easing: "backin",
                easing: "easeinout",
                //more or less
                visible: 2
            });

        });

        var SysSecond = new Array();
        var InterValObj;
        jQuery(document).ready(function($) {
            //SysSecond = parseInt($("#remainSeconds").html()); //这里我是在服务端算好了剩余的秒数，并保存到客户端，如果过期则返回0
            $(".remainSeconds").each(function() {
                var curIndex = $(".remainSeconds").index(this);
                SysSecond[curIndex] = parseInt($(this).html());

            });
            InterValObj = window.setInterval(SetRemainTime, 1000); //间隔函数，1秒执行
        });

        //抢购时间倒计秒数
        function SetRemainTime() {

            $.each(SysSecond, function(i, n) {
                //alert(i);
                //alert(n);
                if (n > 0) {
                    n = n - 1;
                    SysSecond[i]=n;
                    var second = Math.floor(n % 60);             // 计算秒
                    var minute = Math.floor((n / 60) % 60);      //计算分
                    var hour = Math.floor((n / 3600) % 24);      //计算小时
                    var day = Math.floor((n / 3600) / 24);        //计算天
                    var text = "仅剩";
                    if (day > 0) {
                        text = text + day + "天";
                    }
                    if (hour > 0) {
                        text = text + hour + "小时";
                    }
                    if (minute > 0) {
                        text = text + minute + "分";
                    }
                    if (second > 0) {
                        text = text + second + "秒";
                    }
                    $(".remainTime").eq(i).html(text);
                } else {//剩余时间小于或等于0的时候，就停止间隔函数
                    $(".remainTime").eq(i).html("活动已停止");
                    //window.clearInterval(InterValObj);
                }
            });
        }
    </script>
</head>

<body>
<!--[if !ie]>页头开始<![endif]-->
<!--[if !ie]>页头结束<![endif]-->
<div class="tonglan"><img src="${images}/del/d-17.gif" alt="上品折扣"/></div>
<!--[if !ie]>主体内容开始<![endif]-->
<div id="content">
    <div class="layout grid-valuebuying">
        <div class="col-main">

            <div class="main-wrap">
                ${columns[0].template}
            </div>
            <div class="main-wrap">
                ${columns[1].template}
            </div>
            <!--[if !ie]>超值抢购开始<![endif]-->
            <div class="main-wrap">
                <div id="content-right1">
                    <ul class="content2">
                        <li class="content2-top">
                            <ul class="content2-title">
                                <li><img src="${images}/i-74.gif" alt="超值抢购"/></li>
                                <li class="content2-title3"><a href="#current">更多>></a></li>
                            </ul>
                        </li>
                        <li class="content8 content830" style="height:auto;">

                            <ul class="value-list img-list">
                                <c:forEach var="product" items="${products}" varStatus="status">
                                <c:if test="${status.index%4==0&&status.index>3}">
                            </ul>
                            <ul class="value-list img-list">
                                </c:if>
                                <li>
                                    <div class="sku-img"><a href="${ctx}/product/${product.sid}.html"><img
                                            src="${images}/${product.proPicture.proPictDir}${product.proPicture.proPictName}"
                                            alt="${product.proSku}"/>

                                        <div class="zhekou">
                                                ${product.proPrice.offValue}折
                                        </div>
                                    </a>
                                    </div>
                                    <div><a href="${ctx}/product/${product.sid}.html">
                                        <p>${product.productName}</p>
                                    </a>

                                        <h3>
                                            <em>${product.proPrice.originalPrice}</em>￥${product.proPrice.promotionPrice}
                                        </h3>

                                        <div class="remainSeconds"
                                             style="display:none">${product.proPrice.remainSeconds}</div>
                                        <div id="remainTime" class="value-time remainTime">仅剩1天12小时23分46秒</div>
                                    </div>
                                </li>
                                </c:forEach>
                            </ul>
                        </li>
                    </ul>
                    <!--翻页开始-->
                    <div class="yahoo2"> ${page} </div>
                    <!--翻页结束-->
                </div>
            </div>
            <!--[if !ie]>超值抢购结束<![endif]-->
            <div class="main-wrap">
                <div>&nbsp;</div>
            </div>
        </div>

        <!--[if !ie]>左侧分类开始<![endif]-->
        <div class="col-sub">

            <div id="content-left1">
                <div><img src="${images}/i-67.gif" alt="上品抢购节目表"/><span class="content-left1-more"><a href="#"
                                                                                                      target="_blank">更多</a></span>
                </div>
                <ul class="content-left-list">
                    <ol>活动进行时</ol>
                    <c:forEach var="promotion" items="${promotions}" varStatus="status">
                        <li><a href="#current"><span><fmt:formatDate value="${promotion.promotionBeginTime}"
                                                                     pattern="M.d"/>-<fmt:formatDate
                                value="${promotion.promotionEndTime}" pattern="M.d"/></span> ${promotion.promotionTitle}
                        </a>
                        </li>
                    </c:forEach>
                </ul>
                <ul class="content-left-list">
                    <ol>活动预告</ol>
                    <c:forEach var="promotion" items="${promotionsOnTheWay}" varStatus="status">
                        <li><a href="#current"><span><fmt:formatDate value="${promotion.promotionBeginTime}"
                                                                     pattern="M.d"/>-<fmt:formatDate
                                value="${promotion.promotionEndTime}" pattern="M.d"/></span> ${promotion.promotionTitle}
                        </a>
                        </li>
                    </c:forEach>
                </ul>
                <ul class="content-left-list">
                    <ol>精彩活动回顾</ol>
                    <c:forEach var="promotion" items="${pastPromotions}" varStatus="status">
                        <li><a href="#current"><span><fmt:formatDate value="${promotion.promotionBeginTime}"
                                                                     pattern="M.d"/>-<fmt:formatDate
                                value="${promotion.promotionEndTime}" pattern="M.d"/></span> ${promotion.promotionTitle}
                        </a>
                        </li>
                    </c:forEach>
                </ul>
                <div class="margintop3px"><img src="${images}/i-68.gif" alt="最近浏览过的..."/></div>
                <ul class="content-left-imglist">
                    <li><a href="#" target="_blank"><span><img src="${images}/del/d-15.jpg" alt="产品图片"/></span></a></li>
                    <li><a href="#" target="_blank"><img src="${images}/del/d-15.jpg" alt="产品图片"/></a></li>
                </ul>
                <ul class="content-left-list1">
                    <li><a href="#" target="_blank">
                        <ul>
                            <li class="content-left-list2">美丽迎新好礼正当</li>
                            <li class="content-left-list1-price"><span>81259</span>元</li>
                        </ul>
                    </a></li>
                    <li><a href="#" target="_blank">
                        <ul>
                            <li class="content-left-list2">美丽迎新好礼正当</li>
                            <li class="content-left-list1-price"><span>81259</span>元</li>
                        </ul>
                    </a></li>
                    <li><a href="#" target="_blank">
                        <ul>
                            <li class="content-left-list2">美丽迎新好礼正当</li>
                            <li class="content-left-list1-price"><span>81259</span>元</li>
                        </ul>
                    </a></li>
                    <li><a href="#" target="_blank">
                        <ul>
                            <li class="content-left-list2">美丽迎新好礼正当</li>
                            <li class="content-left-list1-price"><span>81259</span>元</li>
                        </ul>
                    </a></li>
                </ul>
            </div>

        </div>
        <!--[if !ie]>左侧分类结束<![endif]-->
    </div>
</div>
<!--[if !ie]>主体内容结束<![endif]-->
</body>
</html>
