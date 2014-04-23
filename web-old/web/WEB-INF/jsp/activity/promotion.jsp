<%--
  Created by IntelliJ IDEA.
  User: yanwt
  Date: 2010-2-4
  Time: 17:40:53
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head><title>${promotion.promotionDesc}-上品折扣网shopin.net- 商场名牌1-3折限量秒杀,正品保障,网上购物!服装品牌,名品折扣,名牌打折,团购价!上品折扣官方购物网站</title>

    <link type="text/css" href="${css}/channels.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${css}/freetab.css"/>
    <link rel="stylesheet" href="${css}/template.css"/>
    <link rel="stylesheet" href="${css}/activities.css"/>
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
                    var text = "";
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
                    $(".remainTime").eq(i).html(text);
                } else {//剩余时间小于或等于0的时候，就停止间隔函数
                    $(".flash-font12").html("${promotion.promotionTitle}:活动已结束");
                    window.clearInterval(InterValObj);
                }
            });
        }

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
                    event: 1
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
                    event: 1
                });
            });

            //link tab,tab样式在freetab.css里调
            $(".linkTab").each(function() {
                $(this).freetab({
                    nav: "tab_nav",
                    navType: "a",
                    //鼠标事件，0-onclick;1-onmouseover
                    event: 1
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
                mouseWheel:true,
                //more or less
                visible: 5
            });

            //tab样式在freetab.css里调
            $(".tab5").freetab({
                nav: "tab_nav",
                content: "tab_content",
                //鼠标事件，0-onclick;1-onmouseover
                event: 1
            });


        });


    </script>
</head>
<body>
<!--[if !ie]>中间内容开始<![endif]-->
<c:if test="${not empty promotion.promotionBpict}">
    <div class="pro-img"><a href="#current"><img src="${images}/${promotion.promotionBpict}" alt="活动图片"/></a></div>
</c:if>
<div class="remainSeconds"
     style="display:none">${promotion.remainSeconds}</div>
<div class="flash-font12">还剩
    <span class="remainTime"><span class="flash-font16">0</span>天<span class="flash-font16">0</span>小时<span
            class="flash-font16">0</span>分<span class="flash-font16">0</span>秒
    </span>
    结束
</div>
<div id="content">
    <div class="layout grid-m">
        <div class="col-main">
            <c:forEach var="column" items="${columns}" varStatus="status">
                <div class="main-wrap">
                        ${column.template}
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>