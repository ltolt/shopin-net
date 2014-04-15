<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
  	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date today = new Date();
%>
 
 <%
   //时间段 开始时间 startDate 结束时间 endDate
  Date startDate = sdf.parse("2012-11-04 00:00:00");
	Date endDate = sdf.parse("2012-11-04 19:59:59");
	
	if(startDate.before(today) && today.before(endDate)){
%>
<!--来个内容-->
<html>
<head>
<meta charset="utf-8">
<title>上品12周年庆,折扣航母震撼启航,每天3小时夜场再享折上惊喜价,鞋,羽绒服,红蜻蜓,JC,沙驰,奥卡索,雅鹿,波司登,1折起,最后一天,2012.11.4,仅3小时</title>
</head>
<body>
<h2 style="font:600 28px/40px 'microsoft yahei';padding:30px 0; text-align:center">
活动即将开始，敬请期待！　　　　　　　<br>
今晚20：00-23：00 折上惊喜价
</h2>
</body>
</html>
<!--来个内容-->
<%}%>
<%
   //时间段 开始时间 startDate 结束时间 endDate
    Date startDate1 = sdf.parse("2012-11-04 20:00:00");
	Date endDate1 = sdf.parse("2012-11-04 23:00:00");
	if(startDate1.before(today) && today.before(endDate1)){
%>
<!--来个内容-->
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>上品12周年庆,折扣航母震撼启航,每天3小时夜场再享折上惊喜价,鞋,羽绒服,红蜻蜓,JC,沙驰,奥卡索,雅鹿,波司登,1折起,最后一天,2012.11.4,仅3小时</title>
<style>
img{ vertical-align:top}
.mt{margin-top:10px}
.hd{ height:26px; margin:20px 0 10px 12px; background:url(http://images.shopin.net/images/ad/dianqing1210/t8-1030.png) no-repeat 165px 0;}
.countdown{float:left;margin-left:510px;_display:inline;font:600 18px/26px 'microsoft yahei';}
.countdown span{ display:inline-block; overflow:hidden/9; _padding:1px!important; margin:0 5px; width:24px; height:24px; line-height:24px; text-align:center; background:#000; color:#fff}
.tab-bd { margin:4px 0; padding:0 0 0 3px}
.tab-bd li { float:left; width:230px; height:185px; padding:4px 3px; overflow:hidden; _display:inline; background:url(http://images.shopin.net/images/ad/dianqing1210/box.png)}
.sp-hd { height:22px; margin-top:16px; font:600 14px/20px 'microsoft yahei'; *line-height:16px; _line-height:18px; border-bottom:1px dashed #b90218; color:#b90218}
.sp-hd em { float:left; width:10px; height:10px; line-height:10px; overflow:hidden; margin:4px 5px 0; background:#b90218}
.brandList { width:100%}
.brandList li { float:left; width:128px; margin:0 0 10px 7px; _display:inline; text-align:center; line-height:24px;}
.brandList li a { font-weight:600; color:#b90218}
.brandList li img { display:block; width:126px; height:86px; border:1px solid #eee}
</style>
</head>

<body>
	<img class="mt" src="http://images.shopin.net/images/ad/dianqing1210/top-e1-shutdown-24.jpg"><img src="http://images.shopin.net/images/ad/dianqing1210/top-e2-1104.jpg">
  <h2 class="hd">
    <div id="remainTime" class="countdown">
      <script language="javascript" type="text/javascript">
        function _fresh(){
        var endtime=new Date("2012/11/04,23:00:00");//定义结束时间
        var nowtime = new Date();
        var leftsecond=parseInt((endtime.getTime()-nowtime.getTime())/1000);
        __d=parseInt(leftsecond/3600/24);
        __h=parseInt((leftsecond/3600)%24);
        __m=parseInt((leftsecond/60)%60);
        __s=parseInt(leftsecond%60);
        var c=new Date();
        var q=((c.getMilliseconds())%10);
        document.getElementById("remainTime").innerHTML="剩余："+"<span>"+__d+"</span>"+"天"+"<span>"+__h+"</span>"+"小时"+"<span>"+__m+"</span>"+"分"+"<span>"+__s+"</span>"+"秒";
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
  </h2>
  <ul class="tab-bd">
<li><a href="http://www.shopin.net/shoes/brands/319.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-01.jpg" alt="红蜻蜓"></a></li>
<li><a href="http://www.shopin.net/shoes/brands/184.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-02.jpg" alt="cele"></a></li>
<li><a href="http://www.shopin.net/shoes/brands/237.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-03.jpg" alt="JC COLLEZIONE"></a></li>
<li><a href="http://www.shopin.net/shoes/brands/220.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-04.jpg" alt="satchi"></a></li>
<li><a href="http://www.shopin.net/shoes/brands/545.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-05.jpg" alt="FORLERIA"></a></li>
<li><a href="http://www.shopin.net/shoes/brands/185.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-06.jpg" alt="Comoni"></a></li>
<li><a href="http://www.shopin.net/shoes/brands/187.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-07.jpg" alt="菲尔图"></a></li>
<li><a href="http://www.shopin.net/shoes/brands/313.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-08.jpg" alt="CROCODILE"></a></li>
<li><a href="http://www.shopin.net/lady/brand/list-289-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-09.jpg" alt="PIERRE CARDIN（女装）"></a></li>
<li><a href="http://www.shopin.net/lady/brand/list-1671-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-10.jpg" alt="B.SIQI"></a></li>
<li><a href="http://www.shopin.net/lady/brand/list-1472-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-11.jpg" alt="JIMANNO"></a></li>
<li><a href="http://www.shopin.net/lady/brand/list-2269-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-12.jpg" alt="柯里卡"></a></li>
<li><a href="http://www.shopin.net/brand/list-1297-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-13.jpg" alt="无色无味"></a></li>
<li><a href="http://www.shopin.net/lady/brand/list-59-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-14.jpg" alt="秋水伊人"></a></li>
<li><a href="http://www.shopin.net/lady/brand/list-1818-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-15.jpg" alt="huayin"></a></li>
<li><a href="http://www.shopin.net/lady/brand/list-112-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-16.jpg" alt="HOPE SHOW"></a></li>
<li><a href="http://www.shopin.net/brands/920.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-17.jpg" alt="ASICS"></a></li>
<li><a href="http://www.shopin.net/brands/1230.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-18.jpg" alt="FILA"></a></li>
<li><a href="http://www.shopin.net/brands/1549.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-19.jpg" alt="K1X"></a></li>
<li><a href="http://www.shopin.net/brands/921.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-20.jpg" alt="PONY"></a></li>
<li><a href="http://www.shopin.net/outdoor/brands/602.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-21.jpg" alt="布来亚克"></a></li>
<li><a href="http://www.shopin.net/outdoor/brands/593.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-22.jpg" alt="KAILAS"></a></li>
<li><a href="http://www.shopin.net/outdoor/brand/list-612-1066-0.05-0.3-100-2000---1.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-23.jpg" alt="DUNLOP"></a></li>
<li><a href="http://www.shopin.net/outdoor/brands/605.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-24.jpg" alt="Kolumb"></a></li>
<li><a href="http://www.shopin.net/man/brands/361.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-25.jpg" alt="JOEONE"></a></li>
<li><a href="http://www.shopin.net/brands/412.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-26.jpg" alt="帕古茨"></a></li>
<li><a href="http://www.shopin.net/man/brands/452.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-27.jpg" alt="罗蒙"></a></li>
<li><a href="http://www.shopin.net/man/brands/432.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-28.jpg" alt="BOSSSUNWEN"></a></li>
<li><a href="http://www.shopin.net/man/brands/764.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-29.jpg" alt="吉诺里兹"></a></li>
<li><a href="http://www.shopin.net/man/brands/332.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-30.jpg" alt="S T Dupont"></a></li>
<li><a href="http://www.shopin.net/brands/1413.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-31.jpg" alt="雅鹿"></a></li>
<li><a href="http://www.shopin.net/brand/list-289-1740-------1.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-32.jpg" alt="皮尔卡丹"></a></li>
<li><a href="http://www.shopin.net/brands/2300.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-33.jpg" alt="OURSHINE"></a></li>
<li><a href="http://www.shopin.net/brands/2040.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-34.jpg" alt="聊黛部儿"></a></li>
<li><a href="http://www.shopin.net/list-1410-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-35.jpg" alt="鹿王"></a></li>
<li><a href="http://www.shopin.net/list-1409-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-36.jpg" alt="雪莲"></a></li>
<li><a href="http://www.shopin.net/list-291-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-37.jpg" alt="GOLDLION"></a></li>
<li><a href="http://www.shopin.net/list-1370-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-38.jpg" alt="GOOD LUCK GLADIUS"></a></li>
<li><a href="http://www.shopin.net/list-1309-1720------0-1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-39.jpg" alt="蒙丹米尔"></a></li>
<li><a href="http://www.shopin.net/list-1387-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-40.jpg" alt="正亚"></a></li>
<li><a href="http://www.shopin.net/list-2402-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-41.jpg" alt="洋宾燕"></a></li>
<li><a href="http://www.shopin.net/list-1422-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-1104-42.jpg" alt="KELIYA"></a></li>
  </ul>
  <img class="mt" src="http://images.shopin.net/images/ad/dianqing1210/t9-1030.png">
  <h3 class="sp-hd"><em></em>鞋</h3>
  <ul class="brandList mt">
<li><a href="http://www.shopin.net/shoes/brands/229.html" target="_blank"><img src="http://images.shopin.net/images/brand/229_2.jpg" alt="思姆">2折起</a></li>
<li><a href="http://www.shopin.net/shoes/brands/1092.html" target="_blank"><img src="http://images.shopin.net/images/brand/1092_2.jpg" alt="特丽雅">￥135起</a></li>
<li><a href="http://www.shopin.net/shoes/brands/1724.html" target="_blank"><img src="http://images.shopin.net/images/brand/1724_2.jpg" alt="BOOSARR">靴子￥152起</a></li>
<li><a href="http://www.shopin.net/shoes/brands/215.html" target="_blank"><img src="http://images.shopin.net/images/brand/215_2.jpg" alt="KIN DON">2折起</a></li>
<li><a href="http://www.shopin.net/shoes/brands/1198.html" target="_blank"><img src="http://images.shopin.net/images/brand/1198_2.jpg" alt="KUUKI">1-4折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/1650.html" target="_blank"><img src="http://images.shopin.net/images/brand/1650_2.jpg" alt="迪宝·阿治奥">3折起</a></li>
<li><a href="http://www.shopin.net/shoes/brands/368.html" target="_blank"><img src="http://images.shopin.net/images/brand/368_2.jpg" alt="富贵鸟">1折起</a></li>
<li><a href="http://www.shopin.net/shoes/brands/289.html" target="_blank"><img src="http://images.shopin.net/images/brand/289_2.jpg" alt="PIERRE CARDIN（女鞋）">1-4折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/2259.html" target="_blank"><img src="http://images.shopin.net/images/brand/2259_2.jpg" alt="炫姿">4折封</a></li>
<li><a href="http://www.shopin.net/shoes/brands/863.html" target="_blank"><img src="http://images.shopin.net/images/brand/863_2.jpg" alt="HANG TEN（鞋）">2折起</a></li>
<li><a href="http://www.shopin.net/shoes/brands/2135.html" target="_blank"><img src="http://images.shopin.net/images/brand/2135_2.jpg" alt="Josiny">2折起</a></li>
<li><a href="http://www.shopin.net/shoes/brands/317.html" target="_blank"><img src="http://images.shopin.net/images/brand/317_2.jpg" alt="宾度（女鞋）">2-6折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/2032.html" target="_blank"><img src="http://images.shopin.net/images/brand/2032_2.jpg" alt="麦科威诗">1-4折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/962.html" target="_blank"><img src="http://images.shopin.net/images/brand/962_2.jpg" alt="适步">2折起</a></li>
<li><a href="http://www.shopin.net/shoes/brands/1548.html" target="_blank"><img src="http://images.shopin.net/images/brand/1548_2.jpg" alt="哥雷夫">2-5折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/226.html" target="_blank"><img src="http://images.shopin.net/images/brand/226_2.jpg" alt="古莎西">2-5折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/1091.html" target="_blank"><img src="http://images.shopin.net/images/brand/1091_2.jpg" alt="倩女">2-4折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/287.html" target="_blank"><img src="http://images.shopin.net/images/brand/287_2.jpg" alt="MONTAGUT（男鞋）">5折封</a></li>
<li><a href="http://www.shopin.net/shoes/brands/259.html" target="_blank"><img src="http://images.shopin.net/images/brand/259_2.jpg" alt="梅尔代格">1-4折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/227.html" target="_blank"><img src="http://images.shopin.net/images/brand/227_2.jpg" alt="帕拉帝奴">4折封</a></li>
<li><a href="http://www.shopin.net/shoes/brands/366.html" target="_blank"><img src="http://images.shopin.net/images/brand/366_2.jpg" alt="SAFIYA">1折起</a></li>
<li><a href="http://www.shopin.net/shoes/brands/1454.html" target="_blank"><img src="http://images.shopin.net/images/brand/1454_2.jpg" alt="MeiRie’S">2-4折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/1929.html" target="_blank"><img src="http://images.shopin.net/images/brand/1929_2.jpg" alt="Sagreottino">3折封</a></li>
<li><a href="http://www.shopin.net/shoes/brands/216.html" target="_blank"><img src="http://images.shopin.net/images/brand/216_2.jpg" alt="京花">长靴￥89起</a></li>
<li><a href="http://www.shopin.net/shoes/brands/325.html" target="_blank"><img src="http://images.shopin.net/images/brand/325_2.jpg" alt="SINA COVA（鞋）">2-4折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/1439.html" target="_blank"><img src="http://images.shopin.net/images/brand/1439_2.jpg" alt="camel active">2-7折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/2325.html" target="_blank"><img src="http://images.shopin.net/images/brand/2325_2.jpg" alt="雅乐士">3折起</a></li>
<li><a href="http://www.shopin.net/shoes/brands/332.html" target="_blank"><img src="http://images.shopin.net/images/brand/332_2.jpg" alt="S T Dupont（鞋）">2-6折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/1817.html" target="_blank"><img src="http://images.shopin.net/images/brand/1817_2.jpg" alt="红诗缇">5折封</a></li>
<li><a href="http://www.shopin.net/shoes/brands/467.html" target="_blank"><img src="http://images.shopin.net/images/brand/467_2.jpg" alt="CROCS">新品3-6折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/1357.html" target="_blank"><img src="http://images.shopin.net/images/brand/1357_2.jpg" alt="MISS SIXTY">3.6折起</a></li>
<li><a href="http://www.shopin.net/shoes/brands/2304.html" target="_blank"><img src="http://images.shopin.net/images/brand/2304_2.jpg" alt="大洋洲·袋鼠">2-4折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/374.html" target="_blank"><img src="http://images.shopin.net/images/brand/374_2.jpg" alt="骆驼牌（鞋）">2折起</a></li>
<li><a href="http://www.shopin.net/shoes/brands/313.html" target="_blank"><img src="http://images.shopin.net/images/brand/313_2.jpg" alt="CROCODILE（男鞋）">2-4折</a></li>
<li><a href="http://www.shopin.net/shoes/brands/1093.html" target="_blank"><img src="http://images.shopin.net/images/brand/1093_2.jpg" alt="富铤">1-4折</a></li>
  </ul>
  <h3 class="sp-hd"><em></em>女装</h3>
  <ul class="brandList mt">
<li><a href="http://www.shopin.net/lady/brand/list-2195-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/2195_2.jpg" alt="IVY.KKI">2折起</a></li>
<li><a href="http://www.shopin.net/lady/brand/list-1212-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1212_2.jpg" alt="阿尤">2-5折</a></li>
<li><a href="http://www.shopin.net/brands/107.html" target="_blank"><img src="http://images.shopin.net/images/brand/107_2.jpg" alt="木真了">4.5折封</a></li>
<li><a href="http://www.shopin.net/brands/52.html" target="_blank"><img src="http://images.shopin.net/images/brand/52_2.jpg" alt="红袖坊">4.5折封</a></li>
<li><a href="http://www.shopin.net/brands/2076.html" target="_blank"><img src="http://images.shopin.net/images/brand/2076_2.jpg" alt="GAOTIAN">低至1折</a></li>
<li><a href="http://www.shopin.net/brands/408.html" target="_blank"><img src="http://images.shopin.net/images/brand/408_2.jpg" alt="IVRESSE">百元蜂抢</a></li>
<li><a href="http://www.shopin.net/lady/brands/50.html" target="_blank"><img src="http://images.shopin.net/images/brand/50_2.jpg" alt="百图">2.5折起</a></li>
<li><a href="http://www.shopin.net/brands/2360.html" target="_blank"><img src="http://images.shopin.net/images/brand/2360_2.jpg" alt="蜜雪儿MYSHEROS">3折蜂抢</a></li>
<li><a href="http://www.shopin.net/brands/1299.html" target="_blank"><img src="http://images.shopin.net/images/brand/1299_2.jpg" alt="温娜尔">3.5折蜂抢</a></li>
<li><a href="http://www.shopin.net/lady/brand/list-1904-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1904_2.jpg" alt="T.B2 Trend Lady">2折封</a></li>
<li><a href="http://www.shopin.net/lady/brands/82.html" target="_blank"><img src="http://images.shopin.net/images/brand/82_2.jpg" alt="AOS">3折封</a></li>
<li><a href="http://www.shopin.net/lady/brand/list-153-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/153_2.jpg" alt="纳纹">2-4折</a></li>
<li><a href="http://www.shopin.net/brands/51.html" target="_blank"><img src="http://images.shopin.net/images/brand/51_2.jpg" alt="三和众">低至1折</a></li>
<li><a href="http://www.shopin.net/brands/2088.html" target="_blank"><img src="http://images.shopin.net/images/brand/2088_2.jpg" alt="LOOIES">5折封</a></li>
<li><a href="http://www.shopin.net/brands/1403.html" target="_blank"><img src="http://images.shopin.net/images/brand/1403_2.jpg" alt="诺恩">百元蜂抢</a></li>
<li><a href="http://www.shopin.net/brands/1882.html" target="_blank"><img src="http://images.shopin.net/images/brand/1882_2.jpg" alt="DONGMING">2.7折起</a></li>
<li><a href="http://www.shopin.net/brand/list-1578-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1578_2.jpg" alt="L.COASSION">2-4折</a></li>
<li><a href="http://www.shopin.net/brands/104.html" target="_blank"><img src="http://images.shopin.net/images/brand/104_2.jpg" alt="曼德露">2折起</a></li>
<li><a href="http://www.shopin.net/brands/1894.html" target="_blank"><img src="http://images.shopin.net/images/brand/1894_2.jpg" alt="爱玲捷">1.5折起</a></li>
<li><a href="http://www.shopin.net/brand/list-2273-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/2273_2.jpg" alt="达芭娜Dabana">4折封</a></li>
<li><a href="http://www.shopin.net/brand/list-852-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/852_2.jpg" alt="菲迪雅丝">低至1.5折</a></li>
<li><a href="http://www.shopin.net/brand/list-98-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/98_2.jpg" alt="亨夫">百元蜂抢</a></li>
<li><a href="http://www.shopin.net/brands/146.html" target="_blank"><img src="http://images.shopin.net/images/brand/146_2.jpg" alt="OASIS">2-4折</a></li>
<li><a href="http://www.shopin.net/brands/2412.html" target="_blank"><img src="http://images.shopin.net/images/brand/2412_2.jpg" alt="SHAERYI莎尔依">4.5折封</a></li>
<li><a href="http://www.shopin.net/brands/1294.html" target="_blank"><img src="http://images.shopin.net/images//brand/1294_2.jpg" alt="沐蕾迪">2折起</a></li>
<li><a href="http://www.shopin.net/brands/103.html" target="_blank"><img src="http://images.shopin.net/images/brand/103_2.jpg" alt="福太太">4.5折封</a></li>
<li><a href="http://www.shopin.net/brands/58.html" target="_blank"><img src="http://images.shopin.net/images/brand/58_2.jpg" alt="裙皇公主">2折起</a></li>
<li><a href="http://www.shopin.net/brands/857.html" target="_blank"><img src="http://images.shopin.net/images/brand/857_2.jpg" alt="三COLOUR">2-4折</a></li>
<li><a href="http://www.shopin.net/brands/1449.html" target="_blank"><img src="http://images.shopin.net/images/brand/1449_2.jpg" alt="JUST MODE">3折起</a></li>
<li><a href="http://www.shopin.net/brands/148.html" target="_blank"><img src="http://images.shopin.net/images/brand/148_2.jpg" alt="蓝茜婷">2.5折蜂抢</a></li>
<li><a href="http://www.shopin.net/brands/1213.html" target="_blank"><img src="http://images.shopin.net/images/brand/1213_2.jpg" alt="谷子">2.5折起</a></li>
<li><a href="http://www.shopin.net/brands/2215.html" target="_blank"><img src="http://images.shopin.net/images/brand/2215_2.jpg" alt="BABYF.O.X">3折起</a></li>
<li><a href="http://www.shopin.net/brands/1044.html" target="_blank"><img src="http://images.shopin.net/images/brand/1044_2.jpg" alt="夕阳红">4.5折抢</a></li>
  </ul>
  <h3 class="sp-hd"><em></em>户外</h3>
  <ul class="brandList mt">
<li><a href="http://www.shopin.net/outdoor/brands/1976.html" target="_blank"><img src="http://images.shopin.net/images/brand/1976_2.jpg" alt="LONSDALE">2.7-7折</a></li>
<li><a href="http://www.shopin.net/outdoor/brands/626.html" target="_blank"><img src="http://images.shopin.net/images/brand/626_2.jpg" alt="Shehe">低至1.9折</a></li>
<li><a href="http://www.shopin.net/outdoor/brands/617.html" target="_blank"><img src="http://images.shopin.net/images/brand/617_2.jpg" alt="salomon">4.3-7折</a></li>
<li><a href="http://www.shopin.net/outdoor/brand/list-1775-1066-0.1-0.55-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1775_2.jpg" alt="必又美">5.4折封</a></li>
<li><a href="http://www.shopin.net/outdoor/brands/1473.html" target="_blank"><img src="http://images.shopin.net/images/brand/1473_2.jpg" alt="ACOME">3.6折起</a></li>
<li><a href="http://www.shopin.net/outdoor/brands/2221.html" target="_blank"><img src="http://images.shopin.net/images/brand/2221_2.jpg" alt="OURSKY">2.6折起</a></li>
<li><a href="http://www.shopin.net/brands/598.html" target="_blank"><img src="http://images.shopin.net/images/brand/598_2.jpg" alt="lafuma">3折起</a></li>
  </ul>
  <h3 class="sp-hd"><em></em>男装</h3>
  <ul class="brandList mt">
<li><a href="http://www.shopin.net/brands/2047.html" target="_blank"><img src="http://images.shopin.net/images/brand/2047_2.jpg" alt="马里萨">1-3折</a></li>
<li><a href="http://www.shopin.net/brands/330.html" target="_blank"><img src="http://images.shopin.net/images/brand/330_2.jpg" alt="卡尔蒂尼">2-4折</a></li>
<li><a href="http://www.shopin.net/brands/329.html" target="_blank"><img src="http://images.shopin.net/images/brand/329_2.jpg" alt="蒙漫侬">5折封</a></li>
<li><a href="http://www.shopin.net/brands/611.html" target="_blank"><img src="http://images.shopin.net/images/brand/611_2.jpg" alt="Freddi Giouanni">2-4折</a></li>
<li><a href="http://www.shopin.net/brands/465.html" target="_blank"><img src="http://images.shopin.net/images/brand/465_2.jpg" alt="尼诺里拉（男装）">5折封</a></li>
<li><a href="http://www.shopin.net/brands/1205.html" target="_blank"><img src="http://images.shopin.net/images/brand/1205_2.jpg" alt="圣吉卡丹">2-4折</a></li>
<li><a href="http://www.shopin.net/brands/848.html" target="_blank"><img src="http://images.shopin.net/images/brand/848_2.jpg" alt="欧罗仕达">2-4折</a></li>
<li><a href="http://www.shopin.net/brands/1466.html" target="_blank"><img src="http://images.shopin.net/images/brand/1466_2.jpg" alt="MEKELLAR">1-4折</a></li>
<li><a href="http://www.shopin.net/brands/416.html" target="_blank"><img src="http://images.shopin.net/images/brand/416_2.jpg" alt="Jollylamb">1-4折</a></li>
<li><a href="http://www.shopin.net/man/brands/1979.html" target="_blank"><img src="http://images.shopin.net/images/brand/1979_2.jpg" alt="Lerario">1折起</a></li>
<li><a href="http://www.shopin.net/man/brands/453.html" target="_blank"><img src="http://images.shopin.net/images/brand/453_2.jpg" alt="诗丹贝克">1-3折</a></li>
<li><a href="http://www.shopin.net/man/brands/335.html" target="_blank"><img src="http://images.shopin.net/images/brand/335_2.jpg" alt="绅士">4折封</a></li>
<li><a href="http://www.shopin.net/man/brands/138.html" target="_blank"><img src="http://images.shopin.net/images/brand/138_2.jpg" alt="洛萨里奥">1-4折</a></li>
<li><a href="http://www.shopin.net/man/brands/1741.html" target="_blank"><img src="http://images.shopin.net/images/brand/1741_2.jpg" alt="麦德仕">1-4折</a></li>
<li><a href="http://www.shopin.net/man/brands/829.html" target="_blank"><img src="http://images.shopin.net/images/brand/829_2.jpg" alt="凯欧柯曼">1-3折</a></li>
<li><a href="http://www.shopin.net/man/brands/435.html" target="_blank"><img src="http://images.shopin.net/images/brand/435_2.jpg" alt="AMURS">1-4折</a></li>
<li><a href="http://www.shopin.net/man/brands/370.html" target="_blank"><img src="http://images.shopin.net/images/brand/370_2.jpg" alt="胡里奥">1折起</a></li>
<li><a href="http://www.shopin.net/man/brands/454.html" target="_blank"><img src="http://images.shopin.net/images/brand/454_2.jpg" alt="巴赛帝亚">1-3折</a></li>
<li><a href="http://www.shopin.net/man/brands/434.html" target="_blank"><img src="http://images.shopin.net/images/brand/434_2.jpg" alt="Dave Hill">3折封</a></li>
<li><a href="http://www.shopin.net/man/brands/1582.html" target="_blank"><img src="http://images.shopin.net/images/brand/1582_2.jpg" alt="CAESAR">2-3折</a></li>
<li><a href="http://www.shopin.net/man/brands/410.html" target="_blank"><img src="http://images.shopin.net/images/brand/410_2.jpg" alt="wumu">2折起</a></li>
<li><a href="http://www.shopin.net/man/brands/424.html" target="_blank"><img src="http://images.shopin.net/images/brand/424_2.jpg" alt="柒">全场4.5折</a></li>
<li><a href="http://www.shopin.net/man/brands/1589.html" target="_blank"><img src="http://images.shopin.net/images/brand/1589_2.jpg" alt="普顿">5折封</a></li>
<li><a href="http://www.shopin.net/man/brands/428.html" target="_blank"><img src="http://images.shopin.net/images/brand/428_2.jpg" alt="ASCHARY">4折封</a></li>
<li><a href="http://www.shopin.net/man/brands/1924.html" target="_blank"><img src="http://images.shopin.net/images/brand/1924_2.jpg" alt="ORMA">2折起</a></li>
<li><a href="http://www.shopin.net/man/brands/418.html" target="_blank"><img src="http://images.shopin.net/images/brand/418_2.jpg" alt="LUISVIGIN">5折封</a></li>
<li><a href="http://www.shopin.net/man/brands/1290.html" target="_blank"><img src="http://images.shopin.net/images/brand/1290_2.jpg" alt="萨贝尼">3折封</a></li>
<li><a href="http://www.shopin.net/man/brands/448.html" target="_blank"><img src="http://images.shopin.net/images/brand/448_2.jpg" alt="虎都">1-5折</a></li>
<li><a href="http://www.shopin.net/man/brands/289.html" target="_blank"><img src="http://images.shopin.net/images/brand/289_2.jpg" alt="PIERRE CARDIN（男装）">2折起</a></li>
<li><a href="http://www.shopin.net/man/brands/461.html" target="_blank"><img src="http://images.shopin.net/images/brand/461_2.jpg" alt="Sagbatore">1折起</a></li>
<li><a href="http://www.shopin.net/man/brands/469.html" target="_blank"><img src="http://images.shopin.net/images/brand/469_2.jpg" alt="绅贵">4折封</a></li>
<li><a href="http://www.shopin.net/man/brands/456.html" target="_blank"><img src="http://images.shopin.net/images/brand/456_2.jpg" alt="爱登堡">5折封</a></li>
<li><a href="http://www.shopin.net/man/brands/833.html" target="_blank"><img src="http://images.shopin.net/images/brand/833_2.jpg" alt="卡瓦文迪 ">5折封</a></li>
<li><a href="http://www.shopin.net/man/brands/2048.html" target="_blank"><img src="http://images.shopin.net/images/brand/2048_2.jpg" alt="Y·DC">3折封</a></li>
<li><a href="http://www.shopin.net/man/brands/451.html" target="_blank"><img src="http://images.shopin.net/images/brand/451_2.jpg" alt="颐尊">2.5折起</a></li>
  </ul>
  <h3 class="sp-hd"><em></em>羊绒衫/羊毛衫</h3>
  <ul class="brandList mt">
<li><a href="http://www.shopin.net/list-1436-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1436_2.jpg" alt="宾缘">3折封</a></li>
<li><a href="http://www.shopin.net/list-2019-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/2019_2.jpg" alt="TUHUANG">2-4折</a></li>
<li><a href="http://www.shopin.net/list-1370-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1370_2.jpg" alt="GOOD LUCK GLADIUS">2-5折</a></li>
<li><a href="http://www.shopin.net/list-1479-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1479_2.jpg" alt="蒙利得">2-4折</a></li>
<li><a href="http://www.shopin.net/list-1423-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1423_2.jpg" alt="尼特维尔">1-4折</a></li>
<li><a href="http://www.shopin.net/list-1365-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1365_2.jpg" alt="春竹">3折起</a></li>
<li><a href="http://www.shopin.net/list-287-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/287_2.jpg" alt="MONTAGUT">3-5折</a></li>
<li><a href="http://www.shopin.net/list-1591-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1591_2.jpg" alt="Baykal">3-5折</a></li>
<li><a href="http://www.shopin.net/list-2388-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/2388_2.jpg" alt="扬帆SETSAIL">2折起</a></li>
<li><a href="http://www.shopin.net/list-2385-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/2385_2.jpg" alt="埃迪瑪aidima">新品半价</a></li>
<li><a href="http://www.shopin.net/list-1974-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1974_2.jpg" alt="SUNGOD">2折起</a></li>
<li><a href="http://www.shopin.net/list-1937-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1937_2.jpg" alt="CARRUN">2折起</a></li>
<li><a href="http://www.shopin.net/list-289-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/289_2.jpg" alt="pierre cardin皮尔卡丹">2折起</a></li>
<li><a href="http://www.shopin.net/list-1832-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1832_2.jpg" alt="U.S. POLO ASSN">5折封</a></li>
<li><a href="http://www.shopin.net/list-323-1720-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/323_2.jpg" alt="PLAYBOY">3折封</a></li>
  </ul>
  <h3 class="sp-hd"><em></em>羽绒服</h3>
  <ul class="brandList mt">
<li><a href="http://www.shopin.net/brands/1411.html" target="_blank"><img src="http://images.shopin.net/images/brand/1411_2.jpg" alt="波司登">4-7折</a></li>
<li><a href="http://www.shopin.net/brands/2040.html" target="_blank"><img src="http://images.shopin.net/images/brand/2040_2.jpg" alt="聊黛部儿">2-4折</a></li>
<li><a href="http://www.shopin.net/list-1584-1740-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1584_2.jpg" alt="MODO GAGA">4.5折封</a></li>
<li><a href="http://www.shopin.net/list-1509-1740-------1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1509_2.jpg" alt="JOSSY JO">2-5折</a></li>
  </ul>
  <h3 class="sp-hd"><em></em>童装</h3>
  <ul class="brandList mt">
<li><a href="http://www.shopin.net/children/brands/46.html" target="_blank"><img src="http://images.shopin.net/images/brand/46_2.jpg" alt="巴布豆">3折起</a></li>
<li><a href="http://www.shopin.net/children/brands/2059.html" target="_blank"><img src="http://images.shopin.net/images/brand/2059_2.jpg" alt="汪小荷">2-5折</a></li>
<li><a href="http://www.shopin.net/children/brands/99.html" target="_blank"><img src="http://images.shopin.net/images/brand/99_2.jpg" alt="空中天使">2折起</a></li>
<li><a href="http://www.shopin.net/children/brands/786.html" target="_blank"><img src="http://images.shopin.net/images/brand/786_2.jpg" alt="大力水手">5折封</a></li>
<li><a href="http://www.shopin.net/children/brands/751.html" target="_blank"><img src="http://images.shopin.net/images/brand/751_2.jpg" alt="ABCKIDS">2-6折</a></li>
<li><a href="http://www.shopin.net/children/brands/9.html" target="_blank"><img src="http://images.shopin.net/images/brand/9_2.jpg" alt="小汽车">5折封</a></li>
<li><a href="http://www.shopin.net/children/brands/1402.html" target="_blank"><img src="http://images.shopin.net/images/brand/1402_2.jpg" alt="OSHKOSH B'gosh">2-5折</a></li>
  </ul>
  <h3 class="sp-hd"><em></em>箱包配饰</h3>
  <ul class="brandList mt">
<li><a href="http://www.shopin.net/list-1183-1103---100-699--0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1183_2.jpg" alt="丹奴比奥">百元起</a></li>
<li><a href="http://www.shopin.net/handbags/brand/list-192-1069-0.2-0.5-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/192_2.jpg" alt="GOLF">2-5折</a></li>
<li><a href="http://www.shopin.net/handbags/brands/1227.html" target="_blank"><img src="http://images.shopin.net/images/brand/1227_2.jpg" alt="Battuta Gioiello">5折</a></li>
<li><a href="http://www.shopin.net/handbags/brand/list-465-1098.html" target="_blank"><img src="http://images.shopin.net/images/brand/465_2.jpg" alt="尼诺里拉">3-5折</a></li>
<li><a href="http://www.shopin.net/handbags/brand/list-323-1069---99-399---1.html" target="_blank"><img src="http://images.shopin.net/images/brand/323_2.jpg" alt="花花公子">￥99-￥399</a></li>
<li><a href="http://www.shopin.net/list-2356-1069------0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/2356_2.jpg" alt="特莱玟">￥69起</a></li>
<li><a href="http://www.shopin.net/handbags/brand/list-472-1069-0.2-0.5-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/472_2.jpg" alt="KSTYLE">2-5折</a></li>
<li><a href="http://www.shopin.net/handbags/brand/list-470-1069-0.05-0.3-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/470_2.jpg" alt="LAFITE">3折封</a></li>
<li><a href="http://www.shopin.net/handbags/brand/list-485-1069---55-999---1.html" target="_blank"><img src="http://images.shopin.net/images/brand/485_2.jpg" alt="LOUIECATTON">￥55起</a></li>
<li><a href="http://www.shopin.net/list-1095-1069---1-199--0-1-.html" target="_blank"><img src="http://images.shopin.net/images/brand/1095_2.jpg" alt="黑田">百元疯抢</a></li>
<li><a href="http://www.shopin.net/handbags/brands/289.html" target="_blank"><img src="http://images.shopin.net/images/brand/289_2.jpg" alt="皮尔卡丹">5折封</a></li>
<li><a href="http://www.shopin.net/handbags/brands/2249.html" target="_blank"><img src="http://images.shopin.net/images/brand/2249_2.jpg" alt="TUSCANS">2-6折</a></li>
<li><a href="http://www.shopin.net/handbags/brands/287.html" target="_blank"><img src="http://images.shopin.net/images/brand/287_2.jpg" alt="MONTAGUT">5折封</a></li>
<li><a href="http://www.shopin.net/handbags/brands/475.html" target="_blank"><img src="http://images.shopin.net/images/brand/475_2.jpg" alt="艾狄米娜">3折起</a></li>
<li><a href="http://www.shopin.net/handbags/brands/487.html" target="_blank"><img src="http://images.shopin.net/images/brand/487_2.jpg" alt="CAMEL">2折起</a></li>
<li><a href="http://www.shopin.net/handbags/brands/474.html" target="_blank"><img src="http://images.shopin.net/images/brand/474_2.jpg" alt="马克西姆">低至2折</a></li>
<li><a href="http://www.shopin.net/handbags/brands/203.html" target="_blank"><img src="http://images.shopin.net/images/brand/203_2.jpg" alt="oodfumiture">百元起</a></li>
<li><a href="http://www.shopin.net/handbags/brands/486.html" target="_blank"><img src="http://images.shopin.net/images/brand/486_2.jpg" alt="F8派">4.5折封</a></li>
<li><a href="http://www.shopin.net/handbags/brands/785.html" target="_blank"><img src="http://images.shopin.net/images/brand/785_2.jpg" alt="OLIVE OYL">3-7折</a></li>
<li><a href="http://www.shopin.net/handbags/brands/444.html" target="_blank"><img src="http://images.shopin.net/images/brand/444_2.jpg" alt="扎内蒂">低至2折</a></li>
<li><a href="http://www.shopin.net/handbags/brands/586.html" target="_blank"><img src="http://images.shopin.net/images/brand/586_2.jpg" alt="POLO">2折起</a></li>
<li><a href="http://www.shopin.net/handbags/brands/1481.html" target="_blank"><img src="http://images.shopin.net/images/brand/1481_2.jpg" alt="SUSINO">￥40起</a></li>
<li><a href="http://www.shopin.net/list-1348-1069------0-1-.html" target="_blank"><img src="http://images.shopin.net/images//brand/1348_2.jpg" alt="仙美时">￥170疯抢</a></li>
<li><a href="http://www.shopin.net/handbags/brands/788.html" target="_blank"><img src="http://images.shopin.net/images/brand/788_2.jpg" alt="PUCCA">3-7折</a></li>
<li><a href="http://www.shopin.net/handbags/brands/1226.html" target="_blank"><img src="http://images.shopin.net/images/brand/1226_2.jpg" alt="JANE HOLLI">2-5折</a></li>
<li><a href="http://www.shopin.net/handbags/brands/1110.html" target="_blank"><img src="http://images.shopin.net/images/brand/1110_2.jpg" alt="LALPINA">3-5折</a></li>
  </ul>
  <h3 class="sp-hd"><em></em>内衣</h3>
  <ul class="brandList mt">
<li><a href="http://www.shopin.net/underwear/brand/list-752-1068-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/752_2.jpg" alt="MAND.YAMAN">2折起</a></li>
<li><a href="http://www.shopin.net/underwear/brand/list-856-1068-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/856_2.jpg" alt="博尼">￥25起</a></li>
<li><a href="http://www.shopin.net/underwear/brand/list-1179-1068-0.1-0.5-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1179_2.jpg" alt="世王">5折蜂抢</a></li>
<li><a href="http://www.shopin.net/underwear/brand/list-289-1068-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/289_2.jpg" alt="PIERRE CARDIN（内衣）">3折起</a></li>
<li><a href="http://www.shopin.net/underwear/brands/1476.html" target="_blank"><img src="http://images.shopin.net/images/brand/1476_2.jpg" alt="丽织纺">￥89起</a></li>
<li><a href="http://www.shopin.net/underwear/brand/list-1356-1068-0.1-0.5-----1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1356_2.jpg" alt="芬蝶">5折封</a></li>
  </ul>
</body>
</html>
<!--来个内容-->
<%}%>

<%
   //时间段 开始时间 startDate 结束时间 endDate
    Date startDate2 = sdf.parse("2012-11-04 23:00:01");
	Date endDate2 = sdf.parse("2012-11-04 23:59:59");
	if(startDate2.before(today) && today.before(endDate2)){
%>
<!--来个内容-->
<html>
<head>
<meta charset="utf-8">
<title>上品12周年庆,折扣航母震撼启航,每天3小时夜场再享折上惊喜价,鞋,羽绒服,红蜻蜓,JC,沙驰,奥卡索,雅鹿,波司登,1折起,最后一天,2012.11.4,仅3小时</title>
</head>
<body>
<h2 style="font:600 28px/40px 'microsoft yahei';padding:30px 0; text-align:center">
亲爱的会员，您好！<br>本次店庆活动已全部结束！<br>非常感谢您的支持！<br>
</h2>
</body>
</html>
<!--来个内容-->
<%}%>

<%
   //时间段 开始时间 startDate 结束时间 endDate
    Date startDate3 = sdf.parse("2012-11-05 00:00:00");
	Date endDate3 = sdf.parse("2012-11-05 23:59:59");
	if(startDate3.before(today) && today.before(endDate3)){
%>
<!--来个内容-->
<html>
<head>
<meta charset="utf-8">
<title>上品12周年庆,折扣航母震撼启航,每天3小时夜场再享折上惊喜价,鞋,羽绒服,红蜻蜓,JC,沙驰,奥卡索,雅鹿,波司登,1折起,最后一天,2012.11.4,仅3小时</title>
</head>
<body>
<h2 style="font:600 28px/40px 'microsoft yahei';padding:30px 0; text-align:center">
亲爱的会员，您好！<br>本次店庆活动已全部结束！<br>非常感谢您的支持！<br>
</h2>
</body>
</html>
<!--来个内容-->
<%}%>