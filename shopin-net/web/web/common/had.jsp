<!--页面内容一-->
<div id="js_ads_banner_top" class="headad" style="height:160px;background:#e93759; text-align:center; position:relative;">
  <a href="http://www.shopin.net/help/201313dianqing.html" target="_blank"><img src="http://images.shopin.net/images/ad/ganen1113/2013dianqing.jpg" width="950" height="160"></a> 
</div>
<!--指定首页显示开始-->
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+""+request.getRequestURI();
String where =request.getRequestURI();
if(where!=null && where.endsWith("index.html")){
 %>
<style>
#js_ads_banner_top{ display:none}
.firstAd{height:600px;margin:0 auto;background:url(http://images.shopin.net/images/ad/firstAd2.jpg) center 0 no-repeat #e93759;text-indent:-9999em}
.firstAd a{display:block;width:100%;height:600px}
 </style>
<div class="firstAd" id="js_ads_banner_top_slide">
<a href="http://www.shopin.net/help/201313dianqing.html" target="_blank">2013店庆</a>
</div>
<script type="text/javascript">
  //顶部伸展广告
  if ($("#js_ads_banner_top_slide").length){
    var $slidebannertop = $("#js_ads_banner_top_slide"),$bannertop = $("#js_ads_banner_top");
    setTimeout(function(){$bannertop.slideUp(1000);$slidebannertop.slideDown(1000);},2500);
    setTimeout(function(){$slidebannertop.slideUp(1000,function (){$bannertop.slideDown(1000);});},8500);
  }
</script>
<%
}
%>
<!--指定首页显示结束-->
