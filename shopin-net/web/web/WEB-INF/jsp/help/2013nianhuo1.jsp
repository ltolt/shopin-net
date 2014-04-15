<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
  	String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date today = new Date();
%>
 <%
    Date startDate = sdf.parse("2013-01-20 19:59:59");
		Date endDate = sdf.parse("2013-01-20 23:59:59");
		if(startDate.before(today) && today.before(endDate)){
	%>
<!--内容一-->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>网络独享,年货夜市,终极秒杀,全场直降20%，品牌:JIMANNO,秋水伊人,红袖,le saunda,红蜻蜓,1.15晚8点准时开抢,3折封,仅2天，超值限量抢！</title>
<style>
img{ vertical-align:top}
.cl{clear:both}
.clear:after { height:0; clear:both; content:"."; visibility:hidden; display:block}
.zm{_zoom:1}
.mt{margin-top:10px}
.tc{text-align:center}
/*main*/
.box { width:950px; margin:10px auto; padding-bottom:10px; background:#681779}
.wrap { padding:0 20px 10px; border-bottom:2px solid #fbe990}
/*timeline*/
.timeline { height:80px; margin:20px auto; overflow:hidden; background:url(http://images.shopin.net/images/ad/2013nianhuo/two/timeline.png) no-repeat;}
.timeline li { float:left; width:84px; height:80px; overflow:hidden; text-indent:-999em; background-image:url(http://images.shopin.net/images/ad/2013nianhuo/two/timeline.png); background-repeat:no-repeat}
.timeline li.strigula { width:13px; background-position:0 0}
/*line*/
.timeline li.strigula.end { background-position:0 -200px}
/*17号*/
.timeline li.date17.tostart { background-position:-13px -200px}
.timeline li.date17.current { background-position:-13px 0}
.timeline li.date17.end { background-position:-13px -100px}
/*18号*/
.timeline li.date18.tostart { background-position:-97px -200px}
.timeline li.date18.current { background-position:-97px 0}
.timeline li.date18.end { background-position:-97px -100px}
/*19号*/
.timeline li.date19.tostart { background-position:-181px -200px}
.timeline li.date19.current { background-position:-181px 0}
.timeline li.date19.end { background-position:-181px -100px}
/*20号*/
.timeline li.date20.tostart { background-position:-265px -200px}
.timeline li.date20.current { background-position:-265px 0}
.timeline li.date20.end { background-position:-265px -100px}
/*21号*/
.timeline li.date21.tostart { background-position:-349px -200px}
.timeline li.date21.current { background-position:-349px 0}
.timeline li.date21.end { background-position:-349px -100px}
/*22号*/
.timeline li.date22.tostart { background-position:-433px -200px}
.timeline li.date22.current { background-position:-433px 0}
.timeline li.date22.end { background-position:-433px -100px}
/*23号*/
.timeline li.date23.tostart { background-position:-517px -200px}
.timeline li.date23.current { background-position:-517px 0}
.timeline li.date23.end { background-position:-517px -100px}
/*24号*/
.timeline li.date24.tostart { background-position:-601px -200px}
.timeline li.date24.current { background-position:-601px 0}
.timeline li.date24.end { background-position:-601px -100px}
/*25号*/
.timeline li.date25.tostart { background-position:-685px -200px}
.timeline li.date25.current { background-position:-685px 0}
.timeline li.date25.end { background-position:-685px -100px}
/*26号*/
.timeline li.date26.tostart { background-position:-769px -200px}
.timeline li.date26.current { background-position:-769px 0}
.timeline li.date26.end { background-position:-769px -100px}
/*27号*/
.timeline li.date27.tostart { background-position:-853px -200px}
.timeline li.date27.current { background-position:-853px 0}
.timeline li.date27.end { background-position:-853px -100px}
/*countdown*/
.countdown { height:24px; padding:20px 0; text-align:center; font:bold 14px/24px 'microsoft yahei',Tahoma, arial; color:#fff; background:url(http://images.shopin.net/images/ad/2013nianhuo/two/ctbg.png) no-repeat center center}
.countdown span { width:24px; height:24px; margin:0 5px; display:inline-block; overflow:hidden/9; _display:inline; _zoom:1; font-size:18px; color:#8d0c50; background:#fff}
.countdown span.ms { width:42px}
/*category*/
.hd { height:36px; text-align:center; font:600 24px/36px 'microsoft yahei',simsun; color:#fff; background:url(http://images.shopin.net/images/ad/2013nianhuo/tbg.png)}
/*salist*/
.salist li { position:relative; _display:inline; float:left; width:302px; height:235px; overflow:hidden; margin:10px 0 0 11px; cursor:pointer}
.salist .titlebar, .salist .titlebox { position:absolute; left:0; bottom:0; z-index:99}
.salist .titlebar { width:100%; height:63px; background:#000; opacity:.7; -moz-opacity:.7; filter:alpha(opacity=70); _zoom:1}
.salist .titlebox { width:282px; height:43px; padding:10px}
.salist .titlebox span { float:left; height:43px; overflow:hidden; word-wrap:break-word; zoom:1}
.salist .titlebox .brand-logo { width:70px}
.salist .titlebox .brand-sale { width:128px;font:600 14px/22px 'microsoft yahei','airal';color:#ff4603}
.salist .titlebox .brand-sale p { height:21px; overflow:hidden}
.salist .titlebox .brand-text { width:84px; text-align:right; font:600 18px/50px 'microsoft yahei','airal'; color:#ffb024}
.salist li:hover .titlebox, .salist li.hover .titlebox { background:#fe4504; color:#fff!important}
.salist li:hover .brand-sale, .salist li.hover .brand-sale { color:#fff}
/*lolist*/
.lolist { padding:0 11px; overflow:hidden}
.lolist ul { margin-left:-5px; _zoom:1}
.lolist li { float:left; width:126px; margin:10px 0 0 7px; _display:inline; text-align:center}
.lolist li a { color:#fff}
.lolist li img { width:126px; height:86px; display:block}
/*line*/
.line {height:1px;line-height:1px;margin:20px 0;font-size:1px;background:url(http://images.shopin.net/images/ad/2013nianhuo/two/line.gif)}
/*prolist*/
.prolist { overflow:hidden}
.prolist li { float:left; width:222px; margin:10px 0 0 12px; _display:inline; text-align:center}
.prolist li a, .prolist li a h5, .prolist li a:hover h5, .prolist li del, .prolist li strong { color:#fff}
.prolist li h5 { height:26px; overflow:hidden; font:normal 12px/30px simsun}
.prolist li strong { margin-left:11px}
</style>
<!--[if lte IE 6]>
<script>
$(function(){
	$(".salist li").hover(function(){
		$(this).addClass("hover");
		},function(){
			$(this).removeClass("hover");
	});
});
</script>
<![endif]-->
</head>

<body>
<div class="box">
	<img src="http://images.shopin.net/images/ad/2013nianhuo/two/top3.jpg" width="950" height="209"><img src="http://images.shopin.net/images/ad/2013nianhuo/two/top4.jpg" width="950" height="209">
	<div class="timeline">
		<ul>
			<li class="strigula"></li>
			<li class="date17 end">1.17</li>
			<li class="date18 end">1.18</li>
			<li class="date19 end">1.19</li>
			<li class="date20 current">1.20</li>
			<li class="date21 tostart">1.21</li>
			<li class="date22 tostart">1.22</li>
			<li class="date23 tostart">1.23</li>
			<li class="date24 tostart">1.24</li>
			<li class="date25 tostart">1.25</li>
			<li class="date26 tostart">1.26</li>
			<li class="date27 tostart">1.27</li>
			<li class="strigula end"></li>
		</ul>
	</div>
	<img class="mt" src="http://images.shopin.net/images/ad/2013nianhuo/two/t1.png" width="950" height="55">
	<div id="remainTime1" class="countdown">
	<script>
	function ShowTimes(){
	var AfterTime= new Date("January 20 23:59:59 2013");
	LeaveTime = AfterTime - new Date();
	LeaveDays=Math.floor(LeaveTime/(1000*60*60*24));//天
	LeaveHours=Math.floor(LeaveTime/(1000*60*60)%24);//时
	LeaveMinutes=Math.floor(LeaveTime/(1000*60)%60);//分
	LeaveSeconds=Math.floor(LeaveTime/1000%60);//秒
	var c=new Date();
	var q=c.getMilliseconds();
		if(q<10){
				q="00"+c.getMilliseconds();
			}
			if(q>=10 && q<100){
				q="0"+c.getMilliseconds();
			}
		remainTime1.innerHTML="剩余："+"<span>"+LeaveDays+"</span>"+"天"+"<span>"+LeaveHours+"</span>"+"小时"+"<span>"+LeaveMinutes+"</span>"+"分"+"<span>"+LeaveSeconds+"</span>"+"秒"+"<span class='ms'>"+q+"</span>";
	}
	setInterval(ShowTimes,10);
	</script>
</div>
	<div class="salist">
		<ul>
<li><a href="http://www.shopin.net/promotion/5070.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013nianhuo/five/1.jpg" width="302" height="235"></a><div class="titlebar"></div><div class="titlebox"><span class="brand-logo"><img src="http://images.shopin.net/images/brand/69_2.jpg" width="63" height="43"></span><span class="brand-sale"><p>优雅魅力 狂欢大促</p>性感蕾丝&红运套装</span><span class="brand-text">￥30起</span></div></li>
<li><a href="http://www.shopin.net/promotion/6005.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013nianhuo/five/2.jpg" width="302" height="235"></a><div class="titlebar"></div><div class="titlebox"><span class="brand-logo"><img src="http://images.shopin.net/images/brand/2391_2.jpg" width="63" height="43"></span><span class="brand-sale"><p>傲人曲线 曼妙身姿</p>聚拢文胸&底裤</span><span class="brand-text">百元封</span></div></li>
<li><a href="http://www.shopin.net/promotion/6310.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013nianhuo/five/3.jpg" width="302" height="235"></a><div class="titlebar"></div><div class="titlebox"><span class="brand-logo"><img src="http://images.shopin.net/images/brand/174_2.jpg" width="63" height="43"></span><span class="brand-sale"><p>品质保暖 岁末特惠</p>男女款保暖套装</span><span class="brand-text">￥88起</span></div></li>
<li><a href="http://www.shopin.net/promotion/5992.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013nianhuo/five/4.jpg" width="302" height="235"></a><div class="titlebar"></div><div class="titlebox"><span class="brand-logo"><img src="http://images.shopin.net/images/brand/1488_2.jpg" width="63" height="43"></span><span class="brand-sale"><p>保暖贴身 超值独享</p>新年鸿运套装</span><span class="brand-text">百元限量抢</span></div></li>
<li><a href="http://www.shopin.net/promotion/6631.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013nianhuo/five/5.jpg" width="302" height="235"></a><div class="titlebar"></div><div class="titlebox"><span class="brand-logo"><img src="http://images.shopin.net/images/brand/1818_2.jpg" width="63" height="43"></span><span class="brand-sale"><p>简约时尚 折扣升级</p>时尚大衣 羽绒服</span><span class="brand-text">低至1折</span></div></li>
<li><a href="http://www.shopin.net/promotion/5387.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013nianhuo/five/6.jpg" width="302" height="235"></a><div class="titlebar"></div><div class="titlebox"><span class="brand-logo"><img src="http://images.shopin.net/images//brand/2300_2.jpg" width="63" height="43"></span><span class="brand-sale"><p>炫彩羽绒 个性保暖</p>长短款 连帽款</span><span class="brand-text">2.9折起</span></div></li>
<li><a href="http://www.shopin.net/promotion/6312.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013nianhuo/five/7.jpg" width="302" height="235"></a><div class="titlebar"></div><div class="titlebox"><span class="brand-logo"><img src="http://images.shopin.net/images/brand/2040_2.jpg" width="63" height="43"></span><span class="brand-sale"><p>爆款羽绒 御寒显瘦</p>高贵獭兔毛领</span><span class="brand-text">￥199起</span></div></li>
<li><a href="http://www.shopin.net/promotion/6213.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013nianhuo/five/9.jpg" width="302" height="235"></a><div class="titlebar"></div><div class="titlebox"><span class="brand-logo"><img src="http://images.shopin.net/images/brand/1295_2.jpg" width="63" height="43"></span><span class="brand-sale"><p>爱家恋床 优享生活</p>四件套 冬被 颈枕</span><span class="brand-text">￥59抢</span></div></li>
<li><a href="http://www.shopin.net/promotion/6041.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013nianhuo/five/8.jpg" width="302" height="235"></a><div class="titlebar"></div><div class="titlebox"><span class="brand-logo"><img src="http://images.shopin.net/images//brand/2381_2.jpg" width="63" height="43"></span><span class="brand-sale"><p>保暖家纺 惠力升级</p>纯棉四件套 冬被</span><span class="brand-text">￥99秒杀</span></div></li>
		</ul>
	</div>
	
	<div class="tc mt">	<a href="http://www.shopin.net/promotion/6459.html" target="_blank"><img src="http://images.shopin.net/images/ad/2013nianhuo/five/10.jpg" width="930" height="196"></a></div>
	
	<img class="mt" src="http://images.shopin.net/images/ad/2013nianhuo/two/t2.png" width="950" height="55">
	<div class="prolist">
		<ul>
<li><a href="http://www.shopin.net/product/2124878.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/12/16/Pic2124878_161777_0.resize_to.220x220.jpg" /><h5>WAYONLY真二件套带帽棉服外套</h5></a><del>￥1298</del><strong>￥168</strong></li>
<li><a href="http://www.shopin.net/product/1592514.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/11/28/Pic1592514_1252_0.resize_to.220x220.jpg" /><h5>秋水伊人经典黑白条纹长款大衣</h5></a><del>￥1038</del><strong>￥262</strong></li>
<li><a href="http://www.shopin.net/product/store/2163342.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/12/24/Pic2163342_77360_0.resize_to.220x220.jpg" /><h5>木真了精致刺绣桑蚕丝外套</h5></a><del>￥1080</del><strong>￥280</strong></li>
<li><a href="http://www.shopin.net/product/1723775.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/05/08/Pic1723775_123143_0.resize_to.220x220.jpg" /><h5>huayin时尚潘多拉领镂空连衣裙</h5></a><del>￥698</del><strong>￥209</strong></li>
<li><a href="http://www.shopin.net/product/2149807.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/12/05/Pic2149807_136521_0.resize_to.220x220.jpg" /><h5>JIMANNO卡其色军装风长款棉服</h5></a><del>￥6899</del><strong>￥1540</strong></li>
<li><a href="http://www.shopin.net/product/2063154.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/09/Pic2063154_3351_0.resize_to.220x220.jpg" /><h5>HOPE SHOW鸿运可拆卸毛领羊毛大衣</h5></a><del>￥1499</del><strong>￥299</strong></li>
<li><a href="http://www.shopin.net/product/2170408.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/01/01/Pic2170408_202975_0.resize_to.220x220.jpg" /><h5>nazely舒适含羊毛有袋开衫</h5></a><del>￥1480</del><strong>￥296</strong></li>
<li><a href="http://www.shopin.net/product/1669932.html" target="_blank"><img src="http://images.shopin.net/images/63/2012/03/01/Pic1669932_104934_0.resize_to.220x220.jpg" /><h5>B.SIQI时尚暗纹印花小西服</h5></a><del>￥990</del><strong>￥180</strong></li>
<li><a href="http://www.shopin.net/product/1713309.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/04/01/Pic1713309_97522_0.resize_to.220x220.jpg" /><h5>卡美多黑色羊皮深口单鞋</h5></a><del>￥998</del><strong>￥399</strong></li>
<li><a href="http://www.shopin.net/product/1363505.html" target="_blank"><img src="http://images.shopin.net/images/61/2011/08/18/Pic1363505_11123_0.resize_to.220x220.jpg" /><h5>红蜻蜓时尚牛皮单鞋</h5></a><del>￥699</del><strong>￥179</strong></li>
<li><a href="http://www.shopin.net/product/2022156.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/12/31/Pic2022156_14456_0.resize_to.220x220.jpg" /><h5>富贵鸟羊皮兔毛单鞋</h5></a><del>￥859</del><strong>￥269</strong></li>
<li><a href="http://www.shopin.net/product/774967.html" target="_blank"><img src="http://images.shopin.net/images/60/2010/10/13/Pic774967_8845_0.resize_to.220x220.jpg" /><h5>菲尔图灰色羊绒裸靴</h5></a><del>￥760</del><strong>￥199</strong></li>
<li><a href="http://www.shopin.net/product/3254.html" target="_blank"><img src="http://images.shopin.net/images/58/2010/03/22/Pic3254_1190_0.resize_to.220x220.jpg" /><h5>桑扶兰蕾丝花边上薄下厚聚拢文胸</h5></a><del>￥288</del><strong>￥50</strong></li>
<li><a href="http://www.shopin.net/product/3714.html" target="_blank"><img src="http://images.shopin.net/images/60/2012/07/17/Pic3714_1277_0.resize_to.220x220.jpg" /><h5>桑扶兰蕾丝花边田园三角内裤</h5></a><del>￥128</del><strong>￥30</strong></li>
<li><a href="http://www.shopin.net/product/2154890.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/12/12/Pic2154890_214268_0.resize_to.220x220.jpg" /><h5>仙子宜岱永恒经典3/4手掌式按摩集中杯</h5></a><del>￥318</del><strong>￥69</strong></li>
<li><a href="http://www.shopin.net/product/2133545.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/28/Pic2133545_200267_0.resize_to.220x220.jpg" /><h5>WAYONLY性感镂空印花内裤</h5></a><del>￥240</del><strong>￥25</strong></li>
<li><a href="http://www.shopin.net/product/1978361.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/08/10/Pic1978361_187557_0.resize_to.220x220.jpg" /><h5>LIFE HOME粉色浪漫纯棉四件套</h5></a><del>￥1280</del><strong>￥181</strong></li>
<li><a href="http://www.shopin.net/product/1952164.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/07/20/Pic1952164_187557_0.resize_to.220x220.jpg" /><h5>LIFE HOME专柜正品舒压颈枕</h5></a><del>￥320</del><strong>￥48</strong></li>
<li><a href="http://www.shopin.net/product/2039262.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/18/Pic2039262_200215_0.resize_to.220x220.jpg" /><h5>笛舒雅彩条纹四件套</h5></a><del>￥699</del><strong>￥71</strong></li>
<li><a href="http://www.shopin.net/product/2036715.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/18/Pic2036715_200215_0.resize_to.220x220.jpg" /><h5>笛舒雅繁华盛放三件套</h5></a><del>￥799</del><strong>￥159</strong></li>
<li><a href="http://www.shopin.net/product/1725720.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/04/01/Pic1725720_134904_0.resize_to.220x220.jpg" /><h5>帕古茨立领时尚夹克套外</h5></a><del>￥2480</del><strong>￥288</strong></li>
<li><a href="http://www.shopin.net/product/703096.html" target="_blank"><img src="http://images.shopin.net/images/58/2010/11/05/Pic703096_67356_0.resize_to.220x220.jpg" /><h5>杰思.路易真皮夹克外头</h5></a><del>￥12800</del><strong>￥2800</strong></li>
<li><a href="http://www.shopin.net/product/2121162.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/09/Pic2121162_155255_0.resize_to.220x220.jpg" /><h5>爱尔爱司修身时尚呢大衣</h5></a><del>￥1799</del><strong>￥379</strong></li>
<li><a href="http://www.shopin.net/product/2088220.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/01/Pic2088220_137250_0.resize_to.220x220.jpg" /><h5>帕古茨时尚羊毛大衣</h5></a><del>￥4160</del><strong>￥772</strong></li>
		</ul>
	</div>
	<img class="mt" src="http://images.shopin.net/images/ad/2013nianhuo/two/t3.png" width="950" height="55">
	<div class="prolist">
		<ul>
<li><a href="http://www.shopin.net/product/2078409.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/19/Pic2078409_205519_0.resize_to.220x220.jpg" /><h5>OURSHINE时尚短款连帽羽绒服</h5></a><del>￥608</del><strong>￥396</strong></li>
<li><a href="http://www.shopin.net/product/2123192.html" target="_blank"><img src="http://images.shopin.net/images/68/2013/01/06/Pic2123192_211107_0.resize_to.220x220.jpg" /><h5>飘莱中长款毛领收腰羽绒服</h5></a><del>￥866</del><strong>￥399</strong></li>
<li><a href="http://www.shopin.net/product/2009153.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/29/Pic2009153_157401_0.resize_to.6220x220.jpg" /><h5>聊黛部儿长款羽绒服</h5></a><del>￥910</del><strong>￥339</strong></li>
<li><a href="http://www.shopin.net/product/1490202.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/11/07/Pic1490202_208896_0.resize_to.220x220.jpg" /><h5>咔姿莱长款獭兔毛领羽绒服</h5></a><del>￥2980</del><strong>￥399</strong></li>
<li><a href="http://www.shopin.net/product/570059.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/20/Pic570059_211479_0.resize_to.220x220.jpg" /><h5>蒙丹米尔镶钻女低领圆套衫</h5></a><del>￥1280</del><strong>￥199</strong></li>
<li><a href="http://www.shopin.net/product/1500371.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/10/30/Pic1500371_77560_0.resize_to.220x220.jpg" /><h5>KELIYA100%超细美丽诺羊毛男衫</h5></a><del>￥698</del><strong>￥255</strong></li>
<li><a href="http://www.shopin.net/product/2086465.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/11/29/Pic2086465_206468_0.resize_to.220x220.jpg" /><h5>戎立特女士樽领烫钻羊绒衫</h5></a><del>￥698</del><strong>￥238</strong></li>
<li><a href="http://www.shopin.net/product/2036737.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/09/18/Pic2036737_200223_0.resize_to.220x220.jpg" /><h5>蒙派男士印染格纹羊毛衫</h5></a><del>￥896</del><strong>￥55</strong></li>
<li><a href="http://www.shopin.net/product/2130064.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/12/19/Pic2130064_211970_0.resize_to.220x220.jpg" /><h5>IUGGIRL时尚复古印花精选中筒靴</h5></a><del>￥438</del><strong>￥171</strong></li>
<li><a href="http://www.shopin.net/product/2150027.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/12/05/Pic2150027_11123_0.resize_to.220x220.jpg" /><h5>红蜻蜓头层牛皮长筒棉靴</h5></a><del>￥939</del><strong>￥299</strong></li>
<li><a href="http://www.shopin.net/product/1483372.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/10/31/Pic1483372_9709_0.resize_to.220x220.jpg" /><h5>卡曼尼红色内里加绒棉靴</h5></a><del>￥980</del><strong>￥148</strong></li>
<li><a href="http://www.shopin.net/product/2060279.html" target="_blank"><img src="http://images.shopin.net/images/66/2012/10/02/Pic2060279_182693_0.resize_to.220x220.jpg" /><h5>炫姿棕色保暖中筒棉靴</h5></a><del>￥756</del><strong>￥259</strong></li>
<li><a href="http://www.shopin.net/product/815039.html" target="_blank"><img src="http://images.shopin.net/images/60/2011/10/25/Pic815039_148234_0.resize_to.220x220.jpg" /><h5>plandoo女士时尚鸿运羊毛舒绒保暖套装</h5></a><del>￥258</del><strong>￥75</strong></li>
<li><a href="http://www.shopin.net/product/1420672.html" target="_blank"><img src="http://images.shopin.net/images/66/2011/09/17/Pic1420672_92287_0.resize_to.220x220.jpg" /><h5>北极绒女士炫彩保暖套装</h5></a><del>￥428</del><strong>￥99</strong></li>
<li><a href="http://www.shopin.net/product/2142637.html" target="_blank"><img src="http://images.shopin.net/images/61/2012/11/29/Pic2142637_212688_0.resize_to.220x220.jpg" /><h5>plandoo男士炫丽彩色印花柔暖套装</h5></a><del>￥368</del><strong>￥99</strong></li>
<li><a href="http://www.shopin.net/product/2090181.html" target="_blank"><img src="http://images.shopin.net/images/68/2012/10/23/Pic2090181_206873_0.resize_to.220x220.jpg" /><h5>和人纺男士羊毛聚暖保暖套装</h5></a><del>￥498</del><strong>￥99</strong></li>
		</ul>
	</div>
</div>
</body>
</html>
<!--内容一-->
<%}%>
	<%
    Date startDate1 = sdf.parse("2013-01-21 00:00:00");
		Date endDate1 = sdf.parse("2013-01-21 19:59:59");
		if(startDate1.before(today) && today.before(endDate1)){
	%>
<!--内容二-->
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>网络独享,年货夜市,终极秒杀,全场直降20%，品牌:JIMANNO,秋水伊人,红袖,le saunda,红蜻蜓,1.15晚8点准时开抢,3折封,仅2天，超值限量抢！</title>
</head>

<body>
<div style=" margin:20px 0;text-align:center"><img src="http://images.shopin.net/images/ad/2013nianhuo/activtyEnd.jpg" width="950" height="411"></div>
</body>
</html>
<!--内容二-->
<%}%>