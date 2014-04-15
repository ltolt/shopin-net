<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglibs.jsp" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>为爱疯抢:购物订单排行榜 ipad mini免费拿--上品折扣网</title>
<link href="http://images.shopin.net/s/css/reset.css" rel="stylesheet">
<link href="http://images.shopin.net/s/css/layout.css" rel="stylesheet">
<link href="http://images.shopin.net/s/css/master.css" rel="stylesheet">
<style>
.S_box { background:#ec403e}
.topbanner li { height:255px;}
.topbanner .li1 { background:url(http://images.shopin.net/s/images/2013shuang12cj/top1.jpg) no-repeat center 0}
.topbanner .li2 { background:url(http://images.shopin.net/s/images/2013shuang12cj/top2.jpg) no-repeat center 0}
.S_wrap { width:1004px; margin:0 auto;}
.S_wrap .S_in { padding-top:100px; background:#fff; border-left:solid 1px #f5e3a2; border-right:solid 1px #f5e3a2;}
.S_ft { height:14px; padding-bottom:30px; background:url(http://images.shopin.net/s/images/2013shuang12cj/ft.png) no-repeat 0 0}
.explain { padding:0 30px; font:600 14px/30px 'microsoft yahei',simhei; border-top:solid 1px #ebebeb}
.explain h4 { padding-left:30px; margin:20px 0 5px; font-size:20px; background:url(http://images.shopin.net/s/images/2013shuang12cj/icon.png) no-repeat 0 center}
.explain ol, .explain p, .S_img { padding-left:40px}
.explain ol { list-style:inside decimal}
.S_img { margin:5px 0 40px}
.S_in .bg { top:-40px}
.rankingList { font:normal 14px/24px 'microsoft yahei';}
.rankInnr { float:left; height:auto; position:relative; left:50%;}
.rankInnr ul { position:relative; left:-50%;}
.rankInnr ul.tc { border-bottom:solid 1px #EBEBEB}
.rankInnr .text { margin:20px 0 10px -280px; zoom:1}
.rankingList li div { display:inline-block; *display:inline; *zoom:1;}
.rank { width:90px}
.num { width:130px}
.order { width:150px; text-align:center}
.amount { width:90px; text-align:center}
.paytime { width:150px}
</style>
</head>

<body>
<div class="S_box">
	<div class="topbanner"><ul><li class="li1"></li><li class="li2"></li></ul></div>
    <div class="S_wrap pr">
    	<div class="S_in">
        	<div class="bg pa"><img src="http://images.shopin.net/s/images/2013shuang12cj/hd.jpg" width="1003" height="95"></div>
        	<div class="rankingList">
            	<div class="rankInnr">
                	<ul class="tc mb">
                        <li>
                            <div class="rank tr">排名　</div>
                            <div class="num">手机号码</div>
                            <div class="order">订单号 </div>
                            <div class="amount">订单金额</div>
                            <div class="paytime">付款时间</div>
                        </li>
                    </ul>
                    <ul class="addAddressBox">
<c:forEach items="${orderlist}" var="item">
    <li>
        <div class="rank tr">${item.mingci}：</div>
        <div class="num">${item.receptPhone}</div>
        <div class="order">${item.orderNo}</div>
        <div class="amount"><fmt:parseNumber value="${item.saleMoneySum}"/></div>
        <div class="paytime">${item.payTime}</div>
    </li>
</c:forEach>
                    </ul>
                    <div class="text">* 排行榜实时更新，奖项以用户当日累计实际购物金额排名，以上排名为订单购物金额仅供参考</div>
                </div>
            </div>
            <div class="cl mt pb"></div>
        	<div class="explain oz">
            	<h4>活动说明：</h4>
                <p>12月12日（00：00-23:00）当日累计实际购物金额最高的前5名用户，将获赠 iPad mini MD528CH/A (16G WiFi版 黑色)1台</p>
                <h4>活动细则：</h4>
                <ol> 
                	<li>奖品图片仅供参考，请以奖品实物为准；</li>
                	<li>仅在12月12日00：00-12月12日23：00下单并在线支付成功，付款金额才会被记入本次活动的排行榜，货到付款订单不计入本活动排行榜；</li>
                	<li>如不同用户当日累计购物金额相同，则按照当日购物金额最高的订单付款时间先后顺序进行排序；</li>
                	<li>活动结束后20个工作日内，上品折扣网将于网站首页”网站公告“公布获奖名单；</li>
                	<li>活动结束后20个工作日内，上品折扣网客服人员将电话通知中奖用户获奖信息，核对完毕后发出相应奖品，如在此之前中奖用户发生恶意退货现象，则取消获奖资格，奖品顺延；如中奖用户收到奖品后发生非商品问题的退货现象，奖品需退回；</li>
                	<li>在法律许可的合法范畴，本活动最终解释权归上品折扣所有。</li>
                </ol>
                <h4>温馨提示：</h4>
                <p>活动奖品将发放给上品折扣网会员本人， 如果收货人非会员本人，请您完善个人信息，避免错失奖品。</p>
                <h4>如何完善个人信息：</h4>
                <p>第一步：登录或注册后，点击进入“我的上品”</p>
                <div class="S_img"><img src="http://images.shopin.net/s/images/2013shuang12cj/img1.png" width="810" height="134"></div>
                <p>第二步：点击“修改个人信息“填写真实姓名、手机号码、性别、生日后保存修改</p>
                <div class="S_img"><img src="http://images.shopin.net/s/images/2013shuang12cj/img2.png" width="810" height="372"></div>
            </div>
        </div>
        <div class="S_ft"></div>
    </div>
</div>
<script language="javascript">  
 $(function(){
  	setInterval(function shoppingList(){
		 	$.ajax({
				url : '${ctx}/help/2013shuang12cj.json?timestamp='+new Date().getTime(),
				type : 'get',
				dataType : 'json',
				timeout : 30000,
				success : function(response) {
				var orderList = response.orderlist;
				var htmls="";
				for(var order in orderList){
					htmls+="<li><div class='rank tr'>"+orderList[order]["mingci"] +"：</div><div class='num'>"+orderList[order]["receptPhone"]+"</div><div class='order'>"+orderList[order]["orderNo"]+"</div><div class='amount'>"+orderList[order]["saleMoneySum"]+"</div><div class='paytime'>"+orderList[order]["payTime"]+"</div></li>";
				}
				htmls+="";
				$(".addAddressBox").attr("innerHTML",htmls);
				}
			});
			},5000); 
}); 
</script>
</body>
</html>
