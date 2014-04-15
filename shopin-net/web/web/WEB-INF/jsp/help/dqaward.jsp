<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>12月20日至1月1日,过新年获大奖,90个免单机会,10张千元shopincard,下单越多中奖机会越多</title>
<style>
/* CSS Document */
img { vertical-align: top }
.mt { margin-top:10px}
#header, .backgroundffffff { width:950px; margin:0 auto}
#page { width:auto; position:static;}
.box { width: 950px; margin: 10px auto }
.sd_title_1 { background: url(http://images.shopin.net/images/ad/miandan1221/title1.png) no-repeat; height:; padding: 52px 0 0 631px }
.sd_main { background: url(http://images.shopin.net/images/ad/miandan1221/bj2.jpg) repeat-y }
.sd_heard { }
.sd_heard_1 { background: url(http://images.shopin.net/images/ad/miandan1221/top1.jpg) no-repeat; height: 158px; overflow: hidden }
.sd_heard_2 { background: url(http://images.shopin.net/images/ad/miandan1221/top2.jpg) no-repeat; height: 201px; overflow: hidden }
.sd_title_1 span { font-size: 18px; color: #FFF; font-weight: bold; width: 61px; height: 19px; display: inline-block; text-align: center }
.sd_mr_luck { display: inline-block }
.sd_mr_lackl { float: left; margin: 0 14px 0 20px; _margin: 0 7px 0 10px; width: 408px; }
.sd_mr_lackr { float: left; width: 503px }
.sd_mr_lackl_mr { }
.sd_mr_lack1_title { background: url(http://images.shopin.net/images/ad/miandan1221/icon.gif) no-repeat 0 0; height: 61px }
.sd_mr_lackr_title { background: url(http://images.shopin.net/images/ad/miandan1221/icon.gif) no-repeat 0 -61px; height: 61px }
.sd_mr_lackl_mr { background: url(http://images.shopin.net/images/ad/miandan1221/bj3.jpg) repeat-x; padding: 10px 15px; width: 359px; height: 385px; font-size: 12px; line-height: 16px; }
.sd_mr_lackl_mr p { color: #fac843; margin: 5px 0 }
.sd_mr_lackl_mr_input { text-align: center; margin: 30px 0 0 }
.sd_mr_lackl_mr_input1 { width: 102px; height: 51px; background: url(http://images.shopin.net/images/ad/miandan1221/icon.gif) no-repeat -0 -122px; border: none; margin: 0 50px 0 0; cursor: pointer }
.sd_mr_lackl_mr_input2 { width: 102px; height: 51px; background: url(http://images.shopin.net/images/ad/miandan1221/icon.gif) no-repeat -0 -173px; border: none; cursor: pointer }
.sd_mr_lack2_mr_l { width: 70px; }
.sd_mr_lack2_mr_l li { width: 70; height: 46px; }
.sd_mr_lack2_mr_r { width: 70px; }
.sd_mr_lack2_mr_r li { width: 70; height: 46px; }
.sd_mr_lack2_mr_l, .sd_mr_lack2_mr_m, .sd_mr_lack2_mr_r { float: left }
.sd_mr_lack2_mr_l li a, .sd_mr_lack2_mr_r li a { display: inline-block; height: 49px; width: 70px }
.sd_mr_lack2_mr_l .day21 { height: 53px; width: 70px }
.sd_mr_lack2_mr_l .day21 a { background: url(http://images.shopin.net/images/ad/miandan1221/nav.jpg); height: 53px; width: 70px }
.day22 a { background: url(http://images.shopin.net/images/ad/miandan1221/nav.jpg) 0 -53px; }
.day23 a { background: url(http://images.shopin.net/images/ad/miandan1221/nav.jpg) 0 -99px; }
.day24 a { background: url(http://images.shopin.net/images/ad/miandan1221/nav.jpg) 0 -145px; }
.day25 a { background: url(http://images.shopin.net/images/ad/miandan1221/nav.jpg) 0 -191px; }
.day26 a { background: url(http://images.shopin.net/images/ad/miandan1221/nav.jpg) 0 -237px; }
.sd_mr_lack2_mr_l .l_day_d { background: url(http://images.shopin.net/images/ad/miandan1221/nav.jpg) 0 -283px no-repeat; height: 120px }
.sd_mr_lack2_mr_l .day21 a:hover, .sd_mr_lack2_mr_l .day21 a.choice { background: url(http://images.shopin.net/images/ad/miandan1221/nava.jpg); height: 53px; width: 70px }
.day22 a:hover, .day22 a.choice { background: url(http://images.shopin.net/images/ad/miandan1221/nava.jpg) 0 -53px; }
.day23 a:hover, .day23 a.choice { background: url(http://images.shopin.net/images/ad/miandan1221/nava.jpg) 0 -99px; }
.day24 a:hover, .day24 a.choice { background: url(http://images.shopin.net/images/ad/miandan1221/nava.jpg) 0 -145px; }
.day25 a:hover, .day25 a.choice { background: url(http://images.shopin.net/images/ad/miandan1221/nava.jpg) 0 -191px; }
.day26 a:hover, .day26 a.choice { background: url(http://images.shopin.net/images/ad/miandan1221/nava.jpg) 0 -237px; }
.sd_mr_lack2_mr_r .day27 { height: 53px; width: 70px }
.sd_mr_lack2_mr_r .day27 a { background: url(http://images.shopin.net/images/ad/miandan1221/nav.jpg)-70px 0; height: 53px; width: 70px }
.day28 a { background: url(http://images.shopin.net/images/ad/miandan1221/nav.jpg) -70px -53px; }
.day29 a { background: url(http://images.shopin.net/images/ad/miandan1221/nav.jpg) -70px -99px; }
.day30 a { background: url(http://images.shopin.net/images/ad/miandan1221/nav.jpg) -70px -145px; }
.day31 a { background: url(http://images.shopin.net/images/ad/miandan1221/nav.jpg) -70px -191px; }
.day01 a { background: url(http://images.shopin.net/images/ad/miandan1221/nav.jpg) -70px -237px; }
.sd_mr_lack2_mr_r .r_day_d { background: url(http://images.shopin.net/images/ad/miandan1221/nav.jpg) -70px -283px no-repeat; height: 120px }
.sd_mr_lack2_mr_r .day27 a:hover, .sd_mr_lack2_mr_r .day27 a.choice { background: url(http://images.shopin.net/images/ad/miandan1221/nava.jpg) -70px 0; height: 53px; width: 70px }
.day28 a:hover, .day28 a.choice { background: url(http://images.shopin.net/images/ad/miandan1221/nava.jpg) -70px -53px; }
.day29 a:hover, .day29 a.choice { background: url(http://images.shopin.net/images/ad/miandan1221/nava.jpg) -70px -99px; }
.day30 a:hover, .day30 a.choice { background: url(http://images.shopin.net/images/ad/miandan1221/nava.jpg) -70px -145px; }
.day31 a:hover, .day31 a.choice { background: url(http://images.shopin.net/images/ad/miandan1221/nava.jpg) -70px -191px; }
.day01 a:hover, .day01 a.choice { background: url(http://images.shopin.net/images/ad/miandan1221/nava.jpg) -70px -237px; }
.sd_mr_card { display: inline-block }
.sd_mr_lack2_mr_m { background: url(http://images.shopin.net/images/ad/miandan1221/backbox.jpg) no-repeat; width: 323px; height: 330px; padding: 37px 20px }
.sd_mr_lack2_mr_m table { width: 323px; text-align: center }
.sd_mr_lack2_mr_m table td { height: 33px }
.c-f95123 { color: #f95123 }
.sd_title_2 { background: url(http://images.shopin.net/images/ad/miandan1221/title2.png); width: 626px; height: 150px; padding: 83px 0 0 324px }
.sd_title_2 #remainTime { width: 284px; height: 38px; line-height: 42px; overflow:hidden; font-size: 16px; font-weight: bold; color: #FFF; text-align: center }
.sd_title_2 #remainTime span { color: #fff000 }
.sd_title_2 p span { text-decoration: underline; margin: 0 0 0 5px }
.sd_luckname_more { background: url(http://images.shopin.net/images/ad/miandan1221/t2-bj.jpg); height: 142px; }
.sd_luckname_mr { float: left; width: 533px; height: 366px; padding-top: 30px; background: url(http://images.shopin.net/images/ad/miandan1221/t2lbj.jpg) }
.sd_luckname_mr table { width:100%; text-align: center;}
.sd_luckname_mr table td { height: 33px; }
.sd_more_mr { float: left; width: 351px; height: 386px; zoom: 1; background: url(http://images.shopin.net/images/ad/miandan1221/t2rbj.jpg) no-repeat; padding: 10px 40px 0 26px; font-size: 12px; line-height: 20px }
.sd_more_mr strong { line-height: 19px }
.c-fac843 { color: #fac843 }
.sd_more_mr_btn { margin-top: 5px; text-align: center }
.sd_more_mr_btn input { background: url(http://images.shopin.net/images/ad/miandan1221/icon.gif) no-repeat scroll 0 -224px transparent; border: medium none; height: 51px; width: 102px; cursor:pointer}
.clearfix { background: none repeat scroll 0 0 transparent; clear: both; content: "."; display: block; font-size: 1px; height: 0 !important; line-height: 0; visibility: hidden; }
.sd_mr_lack2_mr { height: 405px; background: url(http://images.shopin.net/images/ad/miandan1221/bonus.png) no-repeat }
.tabbox { position: relative; }
.tab-hd { position: relative; height: 370px; padding-top: 26px; }
.tab-hd li { width: 70px; height: 54px; line-height: 54px; text-align: center; cursor: pointer; text-indent: -999em; }
.tab-hd .list-li { position: absolute; right: 4px }
.tab-hd li.cur { background-image: url(http://images.shopin.net/images/ad/miandan1221/datebar.png); background-repeat: no-repeat }
.cur.day21 { background-position: 0 -26px }
.cur.day22 { background-position: 0 -80px }
.cur.day23 { background-position: 0 -134px }
.cur.day24 { background-position: 0 -188px }
.cur.day25 { background-position: 0 -242px }
.cur.day26 { background-position: 0 -296px }
.cur.day27 { background-position: right -26px }
.cur.day28 { background-position: right -80px }
.cur.day29 { background-position: right -134px }
.cur.day30 { background-position: right -188px }
.cur.day31 { background-position: right -242px }
.cur.day01 { background-position: right -296px }
.day27 { top: 26px; }
.day28 { top: 80px; }
.day29 { top: 134px; }
.day30 { top: 188px; }
.day31 { top: 242px; }
.day01 { top: 296px; }
.tab-hd .cur a { color: #f00 }
.tab-bd { position: absolute; left: 82px; top: 26px; width: 335px; height: 324px; overflow-x: hidden; overflow-y: auto; background: #eff0e8 }
.tab-bd .item { display: none }
.winlist { width: 100%; padding: 0 0 10px; text-align: center }
.winlist li { margin-top: 20px }
.winlist li.hd { font-weight: bold }
.winlist span { display: inline-block; _display: inline; zoom: 1 }
.winlist .win-name { width: 70px }
.winlist .win-order { width: 101px }
.winlist .win-num { width: 80px }
.winlist .win-money { width: 60px; color: #f95123 }
.winlist li.hd .win-money { color: #000 }
/*popbox*/
#popbox { display:none; position: fixed; _position: absolute; width: 400px; z-index: 100; border: 2px solid #ec560d; background: #fff }
#popbox .pbt { height: 24px; }
#popbox .pbt a { float: right; width: 16px; height: 17px; margin: 6px 20px 0 0; text-indent: -999em; overflow: hidden; background: url(http://images.shopin.net/images/ad/hyqd/box-c.png) }
#popbox .pbd { padding: 0 20px 20px; overflow: hidden; }
#popbox .pinner { margin-top: 13px }
/*popbox form*/
.popboxform li { line-height: 21px; margin-bottom: 6px }
.popboxform label.formlabel { width: 90px; display: inline-block; *display:inline;*zoom:1;
text-align: right; vertical-align: top }
.popboxform .coll { display: inline-block; *display:inline;*zoom:1;}
.popboxform .coll input { vertical-align: middle }
.popboxform .coll .form-text { width: 190px; height: 16px; line-height: 16px; padding: 3px 0 0 3px; font-size: 14px; font-family: simsun; border: 1px solid #8c8c8c; background: url(http://images.shopin.net/images/ad/hyqd/boxbg-it.png) 0 0 }
.popboxform .coll .tips { display: none; color: #f00 }
.popboxform li.vcode .form-text { width: 80px; margin-right: 5px; vertical-align: auto }
.popboxform li.vcode img { vertical-align: middle }
.popboxform .coll i { font-style: normal; color: #f00; margin-left: 6px }
.popboxform .alertSumbit { width: 93px; height: 30px; cursor: pointer; font-weight: bold; background: url(http://images.shopin.net/images/ad/aoyunhui/ok.png); border: 0 }
.popboxform .alertQuizSumbit { width: 93px; height: 30px; cursor: pointer; background: url(http://images.shopin.net/images/ad/aoyunhui/ok.png); border: 0 }
.alertDet { width: 78px; height: 30px; cursor: pointer; background: url(http://images.shopin.net/images/ad/aoyunhui/btn.png); border: 0 }
#mask { position: absolute; top: 0; left: 0; background: #000; opacity: 0.5; filter: alpha(opacity=50); display: none; z-index: 99; }
.popbox-btn { display: inline-block; _float: left; padding-left: 15px; background: url(http://images.shopin.net/images/ad/hyqd/boxbg-sib.png) 0 0 }
.popbox-btn span { display: inline-block; _float: left; height: 30px; line-height: 30px; padding-right: 15px; cursor: pointer; font-weight: 600; color: #fff; background: url(http://images.shopin.net/images/ad/hyqd/boxbg-sib.png) right 0 }
.sign { width: 310px; margin: 0 auto }
.sign h6 { margin: 10px 0 20px; font-weight: 600; color: #f00 }
.sign label.formlabel { width: 110px }
.sign .coll .form-text { width: 140px }
</style>
<script type="text/javascript">
//选项卡
$(function(){
   $(".tab-bd .item:not(:first)").hide();
    function tabs(tabTit,on,tabCon){
	$(tabCon).each(function(){
	  $(this).children().eq(0).show();
	  });
	$(tabTit).each(function(){
	  $(this).children("li").eq(0).addClass(on);
	  });
     $(tabTit).children().mouseover(function(){
        $(this).addClass(on).siblings().removeClass(on);
         var index = $(tabTit).children().index(this);
         $(tabCon).children().eq(index).show().siblings().hide();
    });
     }
  tabs(".tab-hd","cur",".tab-bd");
   });

//登录注册层
function popbox(){
	$('#mask').show();
	$("#mask").css("height",$(document).height());
	$("#mask").css("width",$(window).width());
	center($('.loginBox'));
};
//提示信息
function popboxTips(){
	$('#mask').show();
	$("#mask").css("height",$(document).height());
	$("#mask").css("width",$(window).width());
	center($('.tipsBox'));
};
//居中层
function center(obj) { 
	var screenWidth = $(window).width(), screenHeight = $(window).height(); //当前浏览器窗口的 宽高 
	var scrolltop = $(document).scrollTop();//获取当前窗口距离页面顶部高度 
	var objLeft = (screenWidth - obj.width())/2 ; 
	var objTop = (screenHeight - obj.height())/2; 
	obj.css({left: objLeft + 'px', top: objTop + 'px','display': 'block'}); 
};
//关闭层
function popclose(){
	$("#mask,#popbox").hide();
	return;
};
function signup(){


    var orderno=$.trim($('#orderno').val());
        if(orderno==''){
           $('#orderno_div .tips').show().html('<span style=\'color:#ff0000;font-size:12px\'>订单号不能为空</span>');
           return;
        }else{
          $('#orderno_div .tips').show().html('');
        }
        $.ajax({
                url:'${ctx}/award/saveAward.json',
                type: 'post',
                dataType: 'json',
                data:{'orderNo':orderno},
                timeout: 30000,
                error: function(){
                    //usernameIsValid=false;
                    //$('#orderNo_div .tips').show().html('<span style=\'color:#ff0000;font-size:12px\'></span>');
                },
                success: function(response){
                    var result=response.result;
                    $('#orderno_div .tips').show().html('<span style=\'color:#ff0000;font-size:12px\'>'+result.message+'</span>');
                }

         });
}

function mysign(){

   popboxTips();

}

</script>
</head>

<body>
	<div class="box">
		<a href="http://www.shopin.net/login.html" target="_blank"><img src="http://images.shopin.net/images/ad/miandan1221/top.jpg"></a>
		<div class="sd_title_1">
		  <p><span style=" margin:0 114px 0 0; color:#fac843 "></span><span style=" color:#fac843"></span></p>
		</div>
	 <div class="sd_main">
	      <!--sd_title_1-->
		  <div class="sd_mr_luck">
		       <div class="sd_mr_lackl">
			        <div class="sd_mr_lack1_title">
					</div>
					<div class="sd_mr_lackl_mr">
					     <p><strong>活动对象：</strong>成功购物满300元的用户。</p>
					     <p><strong>活动规则：</strong></p>
						 <p>1、一笔订单限抽取一次，下单越多免单机会越多。</p>
						 <p>2、被抽中的用户上品将为其免单，方式如下：</p>
						 <p>A、北京用户：赠送上品购物券，供再次消费使用。上品购物券限在上品折扣八家实体店进行消费，不找零，不兑现，不抵扣运费。</p>
						 <p>B、外地用户：我们将于7个工作日内将免单金额退还至您的支付账户。</p>
						 <p>3、免单金额为购物满300元免300元，满400元免400元，以此类推。</p>
						 <p>4、中奖订单商品不予退换。</p>
						 <p><strong>奖项公布：</strong></p>
						 <p>1、12.20-12.30和1.1，10:00-22:00，每天每两小时公布1次。</p>
						 <p>2、12.31，10:00-22:00，每天每小时公布1次。</p>
						 <p>3、每日晚22:00之后的订单，当天提交，累计到次日10:00抽取。</p>
						 <div class="sd_mr_lackl_mr_input">
						      <input class="sd_mr_lackl_mr_input1" name="" type="button" value="" onClick="popboxTips();">
							  <input class="sd_mr_lackl_mr_input2" name="" type="button" value="" onClick="window.open('http://www.shopin.net/index.html')">
						 </div>
					</div><!--sd_mr_lackl_mr-->
			   </div><!--sd_mr_lackl-->
			   
			   <div class="sd_mr_lackr">
			        <div class="sd_mr_lackr_title">
					</div>
					<div class="sd_mr_lack2_mr">
						<div class="tabbox">
							<ul class="tab-hd">
							<li class="cur day21"><a href="">21日</a></li>
							<li class="day22"><a href="">22日</a></li>
							<li class="day23"><a href="">23日</a></li>
							<li class="day24"><a href="">24日</a></li>
							<li class="day25"><a href="">25日</a></li>
							<li class="day26"><a href="">26日</a></li>
							<li class="list-li day27"><a href="">27日</a></li>
							<li class="list-li day28"><a href="">28日</a></li>
							<li class="list-li day29"><a href="">29日</a></li>
							<li class="list-li day30"><a href="">30日</a></li>
							<li class="list-li day31"><a href="">31日</a></li>
							<li class="list-li day01"><a href="">01日</a></li>
							</ul>
							<div class="tab-bd">
								<div class="item">
									<ul class="winlist">
                                        <li class="hd"><span class="win-name">姓名</span><span class="win-order">订单号</span><span class="win-num">手机号</span><span class="win-money">订单金额</span></li>
                                           <c:forEach items="${awardlist21}" var="item" varStatus="status">
                                                 <li><span class="win-name">${item.receptName}</span><span class="win-order">${item.orderNo}</span><span class="win-num">${item.receptPhone}</span><span class="win-money">${item.saleMoneySum}</span></li>
                                           </c:forEach>
								    </ul>
								</div>
                                <div class="item">
									<ul class="winlist">
                                        <li class="hd"><span class="win-name">姓名</span><span class="win-order">订单号</span><span class="win-num">手机号</span><span class="win-money">订单金额</span></li>
                                           <c:forEach items="${awardlist22}" var="item" varStatus="status">
                                                 <li><span class="win-name">${item.receptName}</span><span class="win-order">${item.orderNo}</span><span class="win-num">${item.receptPhone}</span><span class="win-money">${item.saleMoneySum}</span></li>
                                           </c:forEach>
								    </ul>
								</div>
                                <div class="item">
									<ul class="winlist">
                                        <li class="hd"><span class="win-name">姓名</span><span class="win-order">订单号</span><span class="win-num">手机号</span><span class="win-money">订单金额</span></li>
                                           <c:forEach items="${awardlist23}" var="item" varStatus="status">
                                                 <li><span class="win-name">${item.receptName}</span><span class="win-order">${item.orderNo}</span><span class="win-num">${item.receptPhone}</span><span class="win-money">${item.saleMoneySum}</span></li>
                                           </c:forEach>
								    </ul>
								</div>
                                <div class="item">
									<ul class="winlist">
                                        <li class="hd"><span class="win-name">姓名</span><span class="win-order">订单号</span><span class="win-num">手机号</span><span class="win-money">订单金额</span></li>
                                           <c:forEach items="${awardlist24}" var="item" varStatus="status">
                                                 <li><span class="win-name">${item.receptName}</span><span class="win-order">${item.orderNo}</span><span class="win-num">${item.receptPhone}</span><span class="win-money">${item.saleMoneySum}</span></li>
                                           </c:forEach>
								    </ul>
								</div>
                                <div class="item">
									<ul class="winlist">
                                        <li class="hd"><span class="win-name">姓名</span><span class="win-order">订单号</span><span class="win-num">手机号</span><span class="win-money">订单金额</span></li>
                                           <c:forEach items="${awardlist25}" var="item" varStatus="status">
                                                 <li><span class="win-name">${item.receptName}</span><span class="win-order">${item.orderNo}</span><span class="win-num">${item.receptPhone}</span><span class="win-money">${item.saleMoneySum}</span></li>
                                           </c:forEach>
								    </ul>
								</div>
                                <div class="item">
									<ul class="winlist">
                                        <li class="hd"><span class="win-name">姓名</span><span class="win-order">订单号</span><span class="win-num">手机号</span><span class="win-money">订单金额</span></li>
                                           <c:forEach items="${awardlist26}" var="item" varStatus="status">
                                                 <li><span class="win-name">${item.receptName}</span><span class="win-order">${item.orderNo}</span><span class="win-num">${item.receptPhone}</span><span class="win-money">${item.saleMoneySum}</span></li>
                                           </c:forEach>
								    </ul>
								</div>
                                <div class="item">
									<ul class="winlist">
                                        <li class="hd"><span class="win-name">姓名</span><span class="win-order">订单号</span><span class="win-num">手机号</span><span class="win-money">订单金额</span></li>
                                           <c:forEach items="${awardlist27}" var="item" varStatus="status">
                                                 <li><span class="win-name">${item.receptName}</span><span class="win-order">${item.orderNo}</span><span class="win-num">${item.receptPhone}</span><span class="win-money">${item.saleMoneySum}</span></li>
                                           </c:forEach>
								    </ul>
								</div>
                                <div class="item">
									<ul class="winlist">
                                        <li class="hd"><span class="win-name">姓名</span><span class="win-order">订单号</span><span class="win-num">手机号</span><span class="win-money">订单金额</span></li>
                                           <c:forEach items="${awardlist28}" var="item" varStatus="status">
                                                 <li><span class="win-name">${item.receptName}</span><span class="win-order">${item.orderNo}</span><span class="win-num">${item.receptPhone}</span><span class="win-money">${item.saleMoneySum}</span></li>
                                           </c:forEach>
								    </ul>
								</div>
                                <div class="item">
									<ul class="winlist">
                                        <li class="hd"><span class="win-name">姓名</span><span class="win-order">订单号</span><span class="win-num">手机号</span><span class="win-money">订单金额</span></li>
                                           <c:forEach items="${awardlist29}" var="item" varStatus="status">
                                                 <li><span class="win-name">${item.receptName}</span><span class="win-order">${item.orderNo}</span><span class="win-num">${item.receptPhone}</span><span class="win-money">${item.saleMoneySum}</span></li>
                                           </c:forEach>
								    </ul>
								</div>
                                <div class="item">
									<ul class="winlist">
                                        <li class="hd"><span class="win-name">姓名</span><span class="win-order">订单号</span><span class="win-num">手机号</span><span class="win-money">订单金额</span></li>
                                           <c:forEach items="${awardlist30}" var="item" varStatus="status">
                                                 <li><span class="win-name">${item.receptName}</span><span class="win-order">${item.orderNo}</span><span class="win-num">${item.receptPhone}</span><span class="win-money">${item.saleMoneySum}</span></li>
                                           </c:forEach>
								    </ul>
								</div>
                                <div class="item">
									<ul class="winlist">
                                        <li class="hd"><span class="win-name">姓名</span><span class="win-order">订单号</span><span class="win-num">手机号</span><span class="win-money">订单金额</span></li>
                                           <c:forEach items="${awardlist31}" var="item" varStatus="status">
                                                 <li><span class="win-name">${item.receptName}</span><span class="win-order">${item.orderNo}</span><span class="win-num">${item.receptPhone}</span><span class="win-money">${item.saleMoneySum}</span></li>
                                           </c:forEach>
								    </ul>
								</div>
                                <div class="item">
									<ul class="winlist">
                                        <li class="hd"><span class="win-name">姓名</span><span class="win-order">订单号</span><span class="win-num">手机号</span><span class="win-money">订单金额</span></li>
                                           <c:forEach items="${awardlist01}" var="item" varStatus="status">
                                                 <li><span class="win-name">${item.receptName}</span><span class="win-order">${item.orderNo}</span><span class="win-num">${item.receptPhone}</span><span class="win-money">${item.saleMoneySum}</span></li>
                                           </c:forEach>
								    </ul>
								</div>
							</div>
						</div>
					</div><!--sd_mr_lack2_mr-->
			   </div><!--sd_mr_lackr-->
		  </div><!--sd_mr_luck-->
		  <div class="sd_mr_card">
			  <div class="sd_title_2">
				  <div id="remainTime">
      <script language="javascript" type="text/javascript">
        function _fresh(){
        var endtime=new Date("2013/01/01,00:00:00");//定义结束时间
        var nowtime = new Date();
        var leftsecond=parseInt((endtime.getTime()-nowtime.getTime())/1000);
        __d=parseInt(leftsecond/3600/24);
        __h=parseInt((leftsecond/3600)%24);
        __m=parseInt((leftsecond/60)%60);
        __s=parseInt(leftsecond%60);
        var c=new Date();
        var q=((c.getMilliseconds())%10);
        document.getElementById("remainTime").innerHTML="距活动开始："+__d+"天&nbsp;"+"<span>"+__h+"小时&nbsp;"+__m+"分&nbsp;"+__s+"秒"+"</span>";
        if(leftsecond<=0){
        document.getElementById("remainTime").innerHTML="活动已结束";//结束后的状态
        clearInterval(sh);
        }
        }
        _fresh()
        var sh;
        sh=setInterval(_fresh,100);
      </script>
    </div>
			  </div><!--sd_title_2-->
			  <div class="sd_luckname_mr">
                  <div style=" width:454px ; height:303px; margin:0 0 0 46px; overflow-y: auto; overflow-x:hidden; ">
			       <table>
					  <tr style="font-weight:bold">
						<td>姓名</td>
						<td>订单号</td>
						<td>手机号</td>
						<td>免单金额</td>
					  </tr>

                       <c:forEach items="${awardlistspe}" var="item" varStatus="status">
                          <tr>
						    <td>${item.receptName}</td>
						    <td>${item.orderNo}</td>
						    <td>${item.receptPhone}</td>
						    <td class="c-f95123">1000</td>
					      </tr>
                       </c:forEach>
					</table>
                  </div>
			  </div><!--sd_luckname_mr-->
			  <div class="sd_more_mr c-fac843">
					<img src="http://images.shopin.net/images/ad/miandan1221/shopincard.png" style="float:right">
					 <p><strong>活动对象：</strong>12.31 00:00-23:59期间成功购物的用户</p>
				   <p><strong>活动规则：</strong></p>
				   <p>1、一笔订单限抽取一次，下单越多免单机会越多。</p>
				   <p>2、1月1日0点，系统自动从中抽取10名幸运用户。</p>
				   <p>3、活动结束后7个工作日内核实中奖信息并发送奖品。形式如下：</p>
				   <p>A、 北京用户：赠送shopin card，此卡是由上品商业发行的储值卡，限在上品折扣八家实体店进行消费，不找零，不兑现，不抵扣运费。</p>
				   <p>B、 外地用户：我们将于7个工作日内退还1000元到您的支付账户。</p>
				   <p>4、中奖订单商品不予退换。</p>
				   <div class="sd_more_mr_btn">
				         <input  class="" name="" type="button" value="" onClick="window.open('http://www.shopin.net/index.html')">
				   </div><!--sd_more_mr_btn-->
			  </div><!--sd_more_mr-->
			  
		  </div><!--sd_mr_card-->
	 </div><!--sd_main-->
	 <div class="sd_down">
		<img src="http://images.shopin.net/images/ad/miandan1221/ddd.jpg">
		<a href="http://www.shopin.net/help/2012kuanian.html" target="_blank"><img class="mt" src="http://images.shopin.net/images/ad/newbig/yt-01.jpg" width="950"></a>
		<p class="mt"><a href="http://www.shopin.net/help/baonuan.html" target="_blank"><img src="http://images.shopin.net/images/ad/baonuan/baonuan.jpg"></a></p>
	 </div><!--sd_down-->
	</div>
<!--提示信息-->
<div id="popbox" class="tipsBox">
	<div class="pbt"><a href="javascript:popclose();" title="关闭">关闭</a></div>
	<div class="pbd">
		<div class="popboxform sign zm">
			<h6></h6>
			<form>
				<ul>
				<li><label class="formlabel">订单号：</label><div class="coll" id="orderno_div"><input class="form-text" type="text" maxlength="20" id="orderno"><i>必填</i><p style="width:165px" class="tips"></p></div></li>
				<li><label class="formlabel"></label><div class="coll"><a class="popbox-btn" href="#"  onClick="signup();"><span>确认</span></a></div></li>
				</ul>
			</form>
		</div>
	</div>
</div>
<div id="mask"></div>
</body>
</html>