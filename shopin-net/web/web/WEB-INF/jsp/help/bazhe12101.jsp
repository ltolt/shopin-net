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
  Date startDate = sdf.parse("2012-10-24 00:00:00");
	Date endDate = sdf.parse("2012-10-25 19:59:59");
	
	if(startDate.before(today) && today.before(endDate)){
%>
<!--来个内容-->
<h2 style="font:600 28px/40px 'microsoft yahei';padding:30px 0; text-align:center">
活动即将开始，敬请期待！　　　　　　　<br>
今晚20：00-22：00 折上惊喜价
</h2>
<!--来个内容-->
<%}%>
<%
   //时间段 开始时间 startDate 结束时间 endDate
    Date startDate1 = sdf.parse("2012-10-25 20:00:00");
	Date endDate1 = sdf.parse("2012-10-25 22:00:00");
	if(startDate1.before(today) && today.before(endDate1)){
%>
<!--来个内容-->
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>上品12周年庆,折扣航母震撼启航,每天2小时夜场再享折上八折,运动,休闲,女装,内衣,K1X,FILA,PONY,GXG,ebase,BALENO,2012.10.25,仅2小时</title>
<style>
img{ vertical-align:top}
.mt{margin-top:10px}
.hd{ height:26px; margin:20px 0 10px 12px; background:url(http://images.shopin.net/images/ad/dianqing1210/t8.png) no-repeat 165px 0;}
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
	<img class="mt" src="http://images.shopin.net/images/ad/dianqing1210/top-e1.jpg"><img src="http://images.shopin.net/images/ad/dianqing1210/top-e2.jpg">
  <h2 class="hd">
    <div id="remainTime" class="countdown">
      <script language="javascript" type="text/javascript">
        function _fresh(){
        var endtime=new Date("2012/10/24,22:00:00");//定义结束时间
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
<li><a href="http://www.shopin.net/brands/920.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-01.jpg"></a></li>
<li><a href="http://www.shopin.net/brands/1230.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-02.jpg"></a></li>
<li><a href="http://www.shopin.net/brands/1549.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-03.jpg"></a></li>
<li><a href="http://www.shopin.net/brands/921.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-04.jpg"></a></li>
<li><a href="http://www.shopin.net/brands/535.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-05.jpg"></a></li>
<li><a href="http://www.shopin.net/brands/528.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-06.jpg"></a></li>
<li><a href="http://www.shopin.net/brands/1398.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-07.jpg"></a></li>
<li><a href="http://www.shopin.net/brands/439.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-08.jpg"></a></li>
<li><a href="http://www.shopin.net/brands/438.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-09.jpg"></a></li>
<li><a href="http://www.shopin.net/brands/529.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-10.jpg"></a></li>
<li><a href="http://www.shopin.net/brand/list-2142--0.05-06-----1.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-11.jpg"></a></li>
<li><a href="http://www.shopin.net/brands/1739.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-12.jpg"></a></li>
<li><a href="http://www.shopin.net/casual/brands/1850.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-13.jpg"></a></li>
<li><a href="http://www.shopin.net/casual/brands/2378.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-14.jpg"></a></li>
<li><a href="http://www.shopin.net/casual/brands/1386.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-15.jpg"></a></li>
<li><a href="http://www.shopin.net/casual/brands/519.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-16.jpg"></a></li>
<li><a href="http://www.shopin.net/casual/brands/508.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-17.jpg"></a></li>
<li><a href="http://www.shopin.net/casual/brands/1670.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-18.jpg"></a></li>
<li><a href="http://www.shopin.net/casual/brands/2151.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-19.jpg"></a></li>
<li><a href="http://www.shopin.net/casual/brands/1462.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-20.jpg"></a></li>
<li><a href="http://www.shopin.net/casual/brands/2426.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-21.jpg"></a></li>
<li><a href="http://www.shopin.net/casual/brands/1522.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-22.jpg"></a></li>
<li><a href="http://www.shopin.net/casual/brands/876.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-23.jpg"></a></li>
<li><a href="http://www.shopin.net/casual/brands/2018.html" target="_blank"><img src="http://images.shopin.net/images/ad/dianqing1210/es-24.jpg"></a></li>
  </ul>
  <img class="mt" src="http://images.shopin.net/images/ad/dianqing1210/t9.png">
  <h3 class="sp-hd"><em></em>休闲</h3>
  <ul class="brandList mt">
<li><a href="http://www.shopin.net/casual/brands/851.html" target="_blank"><img src="http://images.shopin.net/images//brand/851_2.jpg" alt="苏格兰飞人">2-5折</a></li>
<li><a href="http://www.shopin.net/casual/brands/505.html" target="_blank"><img src="http://images.shopin.net/images//brand/505_2.jpg" alt="卡斯彼龙">2折起</a></li>
<li><a href="http://www.shopin.net/casual/brands/532.html" target="_blank"><img src="http://images.shopin.net/images//brand/532_2.jpg" alt="JASONWOOD">3-6折</a></li>
<li><a href="http://www.shopin.net/casual/brands/1127.html" target="_blank"><img src="http://images.shopin.net/images//brand/1127_2.jpg" alt="高尔普">5折封</a></li>
<li><a href="http://www.shopin.net/casual/brands/1645.html" target="_blank"><img src="http://images.shopin.net/images//brand/1645_2.jpg" alt="GAINER">3折起</a></li>
<li><a href="http://www.shopin.net/casual/brands/1865.html" target="_blank"><img src="http://images.shopin.net/images//brand/1865_2.jpg" alt="玛卡西尼">3折封</a></li>
<li><a href="http://www.shopin.net/casual/brands/525.html" target="_blank"><img src="http://images.shopin.net/images//brand/525_2.jpg" alt="铁臂阿童木">3-8折</a></li>
<li><a href="http://www.shopin.net/casual/brands/500.html" target="_blank"><img src="http://images.shopin.net/images//brand/500_2.jpg" alt="美特斯邦威">4-6折</a></li>
<li><a href="http://www.shopin.net/casual/brands/1304.html" target="_blank"><img src="http://images.shopin.net/images//brand/1304_2.jpg" alt="G2000">3-7折</a></li>
<li><a href="http://www.shopin.net/casual/brands/510.html" target="_blank"><img src="http://images.shopin.net/images//brand/510_2.jpg" alt="第五街">3-5折</a></li>
<li><a href="http://www.shopin.net/casual/brands/501.html" target="_blank"><img src="http://images.shopin.net/images//brand/501_2.jpg" alt="佐丹奴">3-7折</a></li>
<li><a href="http://www.shopin.net/casual/brands/502.html" target="_blank"><img src="http://images.shopin.net/images//brand/502_2.jpg" alt="I.P.ZONE">3-7折</a></li>
<li><a href="http://www.shopin.net/casual/brands/2341.html" target="_blank"><img src="http://images.shopin.net/images//brand/2341_2.jpg" alt="JAGGY">2折起</a></li>
<li><a href="http://www.shopin.net/casual/brands/131.html" target="_blank"><img src="http://images.shopin.net/images//brand/131_2.jpg" alt="KUHLE">2-5折</a></li>
<li><a href="http://www.shopin.net/casual/brands/289.html" target="_blank"><img src="http://images.shopin.net/images//brand/289_2.jpg" alt="皮尔卡丹">3-8折</a></li>
<li><a href="http://www.shopin.net/casual/brands/1207.html" target="_blank"><img src="http://images.shopin.net/images//brand/1207_2.jpg" alt="PROVIDENCE">6折封</a></li>
<li><a href="http://www.shopin.net/casual/brands/526.html" target="_blank"><img src="http://images.shopin.net/images//brand/526_2.jpg" alt="生活几何">2折起</a></li>
<li><a href="http://www.shopin.net/casual/brands/865.html" target="_blank"><img src="http://images.shopin.net/images//brand/865_2.jpg" alt="TONY WEAR">3折起</a></li>
<li><a href="http://www.shopin.net/casual/brands/499.html" target="_blank"><img src="http://images.shopin.net/images//brand/499_2.jpg" alt="罗宾汉">2-7折</a></li>
  </ul>
  <h3 class="sp-hd"><em></em>女装</h3>
  <ul class="brandList mt">
<li><a href="http://www.shopin.net/lady/brand/list-1671-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1671_2.jpg" alt="B.SIQI">2折起</a></li>
<li><a href="http://www.shopin.net/brand/list-1472-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1472_2.jpg" alt="JIMANNO">3折封顶</a></li>
<li><a href="http://www.shopin.net/brand/list-2269-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/2269_2.jpg" alt="柯里卡">3折封</a></li>
<li><a href="http://www.shopin.net/brand/list-55-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/55_2.jpg" alt="Voca">低至1.5折</a></li>
<li><a href="http://www.shopin.net/brand/list-1047-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1047_2.jpg" alt="圣三利">低至1折</a></li>
<li><a href="http://www.shopin.net/brand/list-1048-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1048_2.jpg" alt="圣媛">2折起</a></li>
<li><a href="http://www.shopin.net/brand/list-408-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/408_2.jpg" alt="IVRESSE  ">百元疯抢</a></li>
<li><a href="http://www.shopin.net/brand/list-1403-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1403_2.jpg" alt="Nuoen诺恩">超值3折封</a></li>
<li><a href="http://www.shopin.net/brand/list-1297-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1297_2.jpg" alt="无色无味">￥99起</a></li>
<li><a href="http://www.shopin.net/lady/brand/list-1818-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1818_2.jpg" alt="huayin">低至1折</a></li>
<li><a href="http://www.shopin.net/lady/brand/list-112-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/112_2.jpg" alt="Hope Show  "> 3.8折封</a></li>
<li><a href="http://www.shopin.net/brand/list-59-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/59_2.jpg" alt="秋水伊人">2.5折起</a></li>
<li><a href="http://www.shopin.net/brand/list-153-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/153_2.jpg" alt="纳纹">2折起</a></li>
<li><a href="http://www.shopin.net/lady/brand/list-2226-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/2226_2.jpg" alt="RBCA">3折疯抢</a></li>
<li><a href="http://www.shopin.net/brand/list-1000-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1000_2.jpg" alt="Veilond">2.5折起</a></li>
<li><a href="http://www.shopin.net/brand/list-861-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/861_2.jpg" alt="优歌YOUGE">1.8折起</a></li>
<li><a href="http://www.shopin.net/brand/list-1866-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1866_2.jpg" alt="衣香丽影YIXIANGLIYING">新款5折封</a></li>
<li><a href="http://www.shopin.net/brand/list-2391-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/2391_2.jpg" alt="WAYONLY">3折封</a></li>
<li><a href="http://www.shopin.net/brand/list-1904-1046-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1904_2.jpg" alt="T.B2 Trend Lady">2折疯抢</a></li>
  </ul>
  <h3 class="sp-hd"><em></em>内衣</h3>
  <ul class="brandList mt">
<li><a href="http://www.shopin.net/brand/list-69-1068-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/69_2.jpg" alt="桑扶兰">2折起</a></li>
<li><a href="http://www.shopin.net/brand/list-2391-1068-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/2391_2.jpg" alt="WAYONLY">低至1折</a></li>
<li><a href="http://www.shopin.net/brand/list-1344-1068-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1344_2.jpg" alt="欣姿芳SORELLA/Lofan">新款5折</a></li>
<li><a href="http://www.shopin.net/brand/list-174-1068-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/174_2.jpg" alt="北极绒">3折起</a></li>
<li><a href="http://www.shopin.net/brand/list-1488-1068-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1488_2.jpg" alt="帕兰朵 PLANDOO">￥49起</a></li>
<li><a href="http://www.shopin.net/underwear/brand/list-1444-1068-------1.html" target="_blank"><img src="http://images.shopin.net/images/brand/1444_2.jpg" alt="俞兆林">5折封</a></li>
  </ul>
  <h3 class="sp-hd"><em></em>儿童</h3>
  <ul class="brandList mt">
<li><a href="http://www.shopin.net/children/brand/list-48-1125.html" target="_blank"><img src="http://images.shopin.net/images/brand/48_2.jpg" alt="菲格咪妮">5折封</a></li>
  </ul>
</body>
</html>
<!--来个内容-->
<%}%>

<%
   //时间段 开始时间 startDate 结束时间 endDate
    Date startDate2 = sdf.parse("2012-10-25 22:00:00");
	Date endDate2 = sdf.parse("2012-10-25 24:00:00");
	if(startDate2.before(today) && today.before(endDate2)){
%>
<!--来个内容-->
<h2 style="font:600 28px/40px 'microsoft yahei';padding:30px 0; text-align:center">
本期活动已经结束！　　　　　　　<br>
明日晚八点，准时相约！
</h2>
<!--来个内容-->
<%}%>