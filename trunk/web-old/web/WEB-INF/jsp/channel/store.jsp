<%--
  Description:Lady List(女装)   
  User: Peter Wei 
  Date: 2010-1-8
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head><title>仓储直供-聚划算，闪购，限时抢，团购，网上购物,名品打折网,品牌折扣网，女装，女鞋，内衣，童装，运动，上品折扣网shopin.net，商场名牌1-3折，专柜正品，品质保障</title>

    <link href="${css}/reset.css" rel="stylesheet" type="text/css" />
    <link href="${css}/slideshow.css" rel="stylesheet" type="text/css" />
    <!--
    <link href="${css}/storage20120217.css" rel="stylesheet" type="text/css" />
    -->
    <link href="${css}/storage0220.css" rel="stylesheet" type="text/css" />
    <link type="text/css" rel="stylesheet" href="${css}/master.css">
    <link type="text/css" rel="stylesheet" href="${css}/channels.css">
	<script src="${js}/jquery/jquery.json-2.3.min.js" type="text/javascript"></script>

    <script type="text/javascript">
         $(function(){
   $(".tab-bd .item:not(:first)").hide();
    function tabs(tabTit,on,tabCon){
	$(tabCon).each(function(){
	  $(this).children().eq(0).show();
	  });
	$(tabTit).each(function(){
	  $(this).children().eq(0).addClass(on);
	  });
     $(tabTit).children().mousemove(function(){
        $(this).addClass(on).siblings().removeClass(on);
         var index = $(tabTit).children().index(this);
         $(tabCon).children().eq(index).show().siblings().hide();
    });
     }
  tabs(".tab-hd","cur",".tab-bd");
   });


           function doSubmitCustomerBrand(){
            var email = $.trim($("#email").val());
            var handPhone=$.trim($("#handPhone").val());
            var brands=$.trim($("#custombrands").val());
            var arr=null
            var phonereg = /^(((13[0-9]{1})|(18[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
           var valid = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(email);
            if(!valid){
                alert("邮箱地址不正确");
                $("#handPhone").attr("value","");
                return false;
            }
            if(handPhone==""||!phonereg.test(handPhone)){
                alert("手机号码填写不正确");
                $("#custombrands").attr("value","");
                return false;
            }
            if(brands==""||brands=="请输入品牌名称，不同品牌之间以英文字母逗号区隔"){
                alert("请填写品牌名称");
                return false;
            }else{
               arr = brands.split(",");
            }
            var user=new Object();
            user.email = email;
            user.handPhone=handPhone;
            var brandList = new Array();

            for(var i=0;i<arr.length;i++){
                var brand = new Object();
                brand.brandName = $.trim(arr[i]);
                brand.brandSid = '';
                if(brand.brandName!=""){
                  brandList.push(brand);
                }
            }
           user.brands=brandList;
             $.ajax({
                url:"http://www.shopin.net/bd/lovebrandselect.json",
                dataType: 'json',
                type:'post',
                 data:{
                     'email':email,'handPhone':handPhone
                    ,'brands':$.toJSON(brandList)
                 },
                success: function(response){
                    var rs =response.result;
                    if(rs!=null&&rs.status==-1){
                        alert(rs.message);
                    }else if(status==0){
                        alert("提交成功，感谢您的参与！");
						reset();
                    }
                  },
                  error:function(response){
                     alert("系统繁忙，请稍后再试！")
					 window.location.reload();
                  }
                  });
        }
		function reset(){
			$("#email").attr("value","");
				$("#handPhone").attr("value","");
				$("#custombrands").attr("value","");
				scrollTo(0,0); 
		}

    </script>
    <script type="text/javascript">
       $(function(){
           $(".tab-bd .item:not(:first)").hide();
            function tabs(tabTit,on,tabCon){
            $(tabCon).each(function(){
              $(this).children().eq(0).show();
              });
            $(tabTit).each(function(){
              $(this).children().eq(0).addClass(on);
              });
             $(tabTit).children().mousemove(function(){
                $(this).addClass(on).siblings().removeClass(on);
                 var index = $(tabTit).children().index(this);
                 $(tabCon).children().eq(index).show().siblings().hide();
            });
             }
          tabs(".tab-hd","cur",".tab-bd");
           });
         function getStockAndCart(proSid,price) {
            setTimeout(function(){getStockAndCartLazy(proSid,price);}, 5000);
         }

        function getStockAndCartLazy(proSid,price) {
            var stock=getStock(proSid, price);
            var online=getAddToCart(proSid, price);
            $("#bk"+proSid).html(stock+"件库存,"+online+"个人在同时抢");
             //alert(stock+"件库存,"+online+"个人在同时抢");
         }

		  function getShare(proSid,price) {
            setTimeout(function(){getShareLazy(proSid,price);}, 5000);
         }

		 function getShareLazy(proSid,price) {
            var stock=getStock(proSid, price);
            var online=getAddToCart(proSid, price);
            $("#sh_"+proSid).html(online);
             //alert(stock+"件库存,"+online+"个人在同时抢");
         }
        function getStock(proSid, price) {
            var stock = 0;
            $.ajax({
                url:'${ctx}/countProduct/getStock.json',
                type: 'post',
                dataType: 'json',
                async :false,
                data:{'proSid':proSid,
                    'price':price},
                timeout: 30000,
                error: function() {
                    return;
                },
                success: function(response) {
                    var result = response.result;
                    stock = result;
                }
            });
            return stock;
        }
        function getAddToCart(proSid, price) {
            var stock = 0;
            $.ajax({
                url:'${ctx}/countProduct/getAddToCart.json',
                type: 'post',
                dataType: 'json',
                async :false,
                data:{'proSid':proSid,
                    'price':price},
                timeout: 30000,
                error: function() {
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
    </script>
	<script type="text/javascript" src="${js}/jwidget/jwidget_1.0.0-min.js"></script>
<script type="text/javascript" src="${js}/jquery/jquery.freetab-0.1.js"></script>
<script type="text/javascript" src="${js}/jquery/jcarousellite_1.0.1.js"></script>
<script type="text/javascript" src="${js}/jquery/jquery.easing.1.1.js"></script>
<script type="text/javascript">
    //var jq = jQuery.noConflict();
    jQuery(document).ready(function($) {
        //jwidget slides
        jWidget.ui.SlideView("slider", {effect: 'scrolly',autoPlayInterval:10000});


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
            //more or less
            visible: 2
        });

    });

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
                var text = "还剩";
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
<!--首屏开始--> 

<ul class="clear st_adlist st_xsqg">
<li class="fl st_titadlist"><span>限时抢购</span></li>
<li class="fr"><a href="#">每周四10点更新</a></li>
</ul>
<div style="clear:both"></div>
<c:forEach var="column" items="${columns}" varStatus="s">

          <c:if test="${not empty column.template}">

               ${column.template}
          <c:if test="${fn:length(columns)-4 eq s.index}">
              <div class="st_sale">
                  <!--[if !ie]>限时特卖会开始<![endif]-->
                  <ul class="flash">
                      <li>
                          <!-- 图片轮播 开始 -->
                          <div id="slider" class="slider">
                              <ul>
                                  <c:forEach var="p" items="${promotions}" varStatus="status">
                                      <li style="height:350px">

                                          <div class="remainSeconds"
                                               style="display:none">${p.remainSeconds}</div>
                                          <ul>
                                              <li class="flash-title"><span class="flash-font162"><img src="${images}/w_41.gif"></span> <span
                                                      class="flash-font12 remainTime">还剩 <span
                                                      class="flash-font16">10</span>天<span class="flash-font16">12</span>小时<span
                                                      class="flash-font16">23</span>分<span
                                                      class="flash-font16">46</span>秒 结束</span></li>
                                              <li><a href="${p.promotionLink}" target="_blank"><img
                                                      src="${images}/${p.promotionSpict}"
                                                      alt="${p.promotionTitle}"/></a></li>
                                          </ul>
                                      </li>
                                  </c:forEach>
                              </ul>
                              <ul id="slider_nav" class="slider_nav">
                                  <c:forEach var="p" items="${promotions}" varStatus="status">
                                      <li>${status.index+1}</li>
                                  </c:forEach>
                              </ul>
                          </div>
                          <!-- 图片轮播 结束 -->
                      </li>
                  </ul>
                  <!--[if !ie]>限时特卖会结束<![endif]-->
              </div>
              <!--主题活动结束-->
          </c:if>
          </c:if>
      </c:forEach>


<script type="text/javascript" src="http://images.shopin.net/js/shareto_button.js" charset="utf-8"></script>

<div class="st_hope">
		<h5>您希望在上品折扣买到哪些品牌？</h5>
		<%--<form id="custombrand">--%>
			<textarea class="st_hope_textarea" id="custombrands" value="请输入品牌名称，不同品牌之间以英文字母逗号区隔" value="请输入品牌名称，不同品牌之间以英文字母逗号区隔" onfocus="if(this.value == '请输入品牌名称，不同品牌之间以英文字母逗号区隔')this.value=''" onblur="if(this.value == '')this.value='请输入品牌名称，不同品牌之间以英文字母逗号区隔'">请输入品牌名称，不同品牌之间以英文字母逗号区隔</textarea>
			<button onClick="doSubmitCustomerBrand()"><img src="http://images.shopin.net/images/st_1.gif" /></button>
			<label>您的E-MAIL：<input class="st_hope_text" type="text" id="email"/></label><label>您的手机号：<input class="st_hope_text" type="text" id="handPhone"/></label>
		<%--</form>--%>
	</div>
<script type="text/javascript">
<!-- 
var bd_cpro_rtid="nHTdn1f";
//-->
</script>
<script type="text/javascript" src="http://cpro.baidu.com/cpro/ui/rt.js"></script>
<noscript>
<div style="display:none;">
<img height="0" width="0" style="border-style:none;" src="http://eclick.baidu.com/rt.jpg?t=noscript&rtid=nHTdn1f" />
</div>
</noscript>


<!-- Google Code for &#31934;&#26126;&#36141;&#39057;&#36947; Remarketing List -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1028537178;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "CxdaCJykgAMQ2va46gM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1028537178/?label=CxdaCJykgAMQ2va46gM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>


</body>
</html>
