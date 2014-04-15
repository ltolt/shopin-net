<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>纤丝鸟保暖内衣</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<base target="_blank" />
<style type="text/css">
	.hd_nav { position:relative;}
	.hd_nav img{ display:block; border:none;}
	#ibacktop { width:21px; height:75px; cursor:pointer; position:absolute;}
</style>
<script type="text/javascript" src="http://images.shopin.net/js/lazyload.js"></script>
<script type="text/javascript">
$(document).ready(function(){
$(".hd_nav img").lazyload({
          placeholder : "http://images.shopin.net/images/ad/lazyblank.gif",        
          effect : "fadeIn"
});
});
</script>
</head>

<body>
<div class="hd_nav">
	<div><img src="http://images.shopin.net/images/ad/qsn/qsn_01.jpg" width="950" height="362" /></div>
    <div style="height:577px; overflow:hidden;"><img src="http://images.shopin.net/images/ad/qsn/qsn_02.jpg" width="950" height="577" border="0" usemap="#Map" />
      <map name="Map" id="Map">
        <area shape="rect" coords="37,60,410,564" href="http://shopin.net/product/1502917.html" />
        <area shape="rect" coords="471,132,896,577" href="http://shopin.net/product/1502918.html" />
      </map>
    </div>
    <div style="height:555px; overflow:hidden;"><img src="http://images.shopin.net/images/ad/qsn/qsn_03.jpg" width="950" height="555" border="0" usemap="#Map2" />
      <map name="Map2" id="Map2">
        <area shape="rect" coords="22,63,466,532" href="http://shopin.net/product/1497825.html" />
        <area shape="rect" coords="518,120,931,538" href="http://shopin.net/product/1497825.html" />
      </map>
    </div>
    <div style="height:550px; overflow:hidden;"><img src="http://images.shopin.net/images/ad/qsn/qsn_04.jpg" width="950" height="550" border="0" usemap="#Map3" />
      <map name="Map3" id="Map3">
        <area shape="rect" coords="26,82,559,547" href="http://shopin.net/product/1448081.html" />
        <area shape="rect" coords="566,128,929,549" href="http://shopin.net/product/1448092.html" />
      </map>
    </div>
    <div style="height:506px; overflow:hidden;"><img src="http://images.shopin.net/images/ad/qsn/qsn_05.jpg" width="950" height="506" border="0" usemap="#Map4" />
      <map name="Map4" id="Map4">
        <area shape="rect" coords="44,88,420,503" href="http://shopin.net/product/1447979.html" />
        <area shape="rect" coords="423,88,925,502" href="http://shopin.net/product/1447979.html" />
      </map>
    </div>
    <div><a href="http://shopin.net/product/1408994.html"><img src="http://images.shopin.net/images/ad/qsn/qsn_06.jpg" width="950" height="458" /></a></div>
    <div><a href="http://shopin.net/product/939452.html"><img src="http://images.shopin.net/images/ad/qsn/qsn_07.jpg" width="950" height="510" /></a></div>
    <div><a href="http://shopin.net/product/753090.html"><img src="http://images.shopin.net/images/ad/qsn/qsn_08.jpg" width="950" height="525" /></a></div>
</div>


<script type="text/javascript">
    $(function(){
    $(document.body).append("<div id='ibacktop'><img src='http://images.shopin.net/images/totop.gif' width='21' height='75' /></div>"); 
	var rollThis = function(){
		var poTop = $(document).scrollTop() + $(window).height() - 100 + "px";
		var poLeft = $(".hd_nav").offset();
		var poLeft = poLeft.left + 950 + "px";
		$("#ibacktop").css({top:poTop,left:poLeft})
		}
	$(window).resize(function(){
		rollThis();
		});
	$(window).scroll(function(){
		rollThis();
		});
	rollThis();
	$("#ibacktop").click(function(){
		$('body,html').animate({scrollTop:0},1000);
		return false;
	});
	})
</script>
</body>
</html>