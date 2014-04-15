<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>店庆重重好礼</title>
<style>
img { vertical-align:top}
.mt { margin-top:10px}
.mb { margin-bottom:10px}
/*subnav*/
.atySubnav { position:absolute; right:-11px; z-index:99; width:106px; height:330px; background:url(http://images.shopin.net/images/ad/dqsongli/subnav.png) no-repeat; top:50%; margin-top:-165px; _margin-top:expression(document.documentElement.scrollTop+10)px; left:50%; margin-left:485px}
.atySubnav ul { padding:63px 7px 0}
.atySubnav ul li { text-indent:-999em; overflow:hidden}
.atySubnav ul li a { outline:none; display:block; line-height:24px; margin-bottom:2px; zoom:1}
.atySubnav ul li.gotop { margin-top:10px}
.ztad { text-align:center; margin-top:10px}
</style>
</head>

<body>
<img class="mt" src="http://images.shopin.net/images/ad/20135dianqing/top1.jpg"><img src="http://images.shopin.net/images/ad/20135dianqing/top2.jpg"><img src="http://images.shopin.net/images/ad/20135dianqing/top3.jpg">
<img src="http://images.shopin.net/images/ad/dqsongli/t1.png">
<img src="http://images.shopin.net/images/ad/dqsongli/img1.jpg" border="0" usemap="#Map">
<map name="Map">
		<area shape="rect" coords="219,368,315,394" href="http://e.weibo.com/offprice" target="_blank" title="新浪微博">
		<area shape="rect" coords="327,368,424,394" href="http://t.qq.com/shangpinzhekou" target="_blank" title="腾讯微博">
		<area shape="rect" coords="441,368,537,394" href="#">
</map>
<img src="http://images.shopin.net/images/ad/dqsongli/img2.png" border="0" usemap="#Map2">
<map name="Map2">
		<area shape="rect" coords="19,48,925,303" href="http://www.shopin.net/help/20135dianqing.html#a" target="_blank">
</map>
<img src="http://images.shopin.net/images/ad/dqsongli/t2.png">
<!--img src="http://images.shopin.net/images/ad/dqsongli/img3.png" border="0" usemap="#Map2">
<map name="Map2">
		<area shape="rect" coords="390,191,560,236" href="#">
</map>
<img src="http://images.shopin.net/images/ad/dqsongli/t3.png"-->
<img src="http://images.shopin.net/images/ad/dqsongli/img4.jpg"><img class="mb" src="http://images.shopin.net/images/ad/dqsongli/img5.png">
<div id="atySubnav" class="atySubnav png">
	<ul>
    <li><a href="http://www.shopin.net/help/20135dianqing.html#a" target="_blank" title="60大品牌专场">60大品牌专场</a></li>
    <li><a href="http://www.shopin.net/help/20135mingxing.html" target="_blank" title="店庆明星商品">店庆明星商品</a></li>
    <li><a href="http://www.shopin.net/help/2013yechang-yx.html" target="_blank" title="超爆折扣夜场">超爆折扣夜场</a></li>
    <li><a href="http://www.shopin.net/help/signup.html" target="_blank" title="13元超爆单品">13元超爆单品</a></li>
		<li class="gotop"><a href="#top" title="回顶部">回顶部</a></li>
  </ul>
</div>
<script>
$.fn.smartFloat = function() {
    var position = function(element) {
         var top = element.position().top, pos = element.css("position");
         $(window).scroll(function() {
             var scrolls = $(this).scrollTop(), clientHeight = document.documentElement.clientHeight, eleHeight = element.height();
                 if (window.XMLHttpRequest) {
                     element.css({
                         position: "fixed",
                         top: '50%'      
                     });
                 }else {
                     element.css({
                         top: scrolls+clientHeight-clientHeight/2 //ie垂直居中
                     });
                 }
         });
     };
     return $(this).each(function() {
         position($(this));
     });
 };
 $("#atySubnav").smartFloat();
 $(function(){
	 var scWidth = $(window).width();
	 if (scWidth < 1024){
				$("#atySubnav").hide();
		 }else{
			 return false;
			 };
	 $(".subnav-close").click(function(){
		 $("#atySubnav").hide();
		 })
	 })
</script>
</body>
</html>
