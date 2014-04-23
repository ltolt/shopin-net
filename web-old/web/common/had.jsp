

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
    Date startDate = sdf.parse("2012-08-10 00:00:00");
    Date endDate = sdf.parse("2012-08-30 09:59:59");
	
	if(startDate.before(today) && today.before(endDate)){
%>

<div style="display:block; width:100%;background:#d35907 url(http://images.shopin.net/images/ad/qiuzhuang/yt-02.jpg) no-repeat center 0; text-align:center; position:relative;" id="js_ads_banner_top">
	<a href="http://www.shopin.net/help/qiuzhuang.html" target="_blank"><img src="http://images.shopin.net/images/ad/qiuzhuang/yt-01.jpg" width="954" height="147" align="top"></A>
</div>
	
<%}%>
<%
   //时间段 开始时间 startDate 结束时间 endDate
    Date startDate1 = sdf.parse("2012-08-30 10:00:00");
    Date endDate1 = sdf.parse("2012-08-31 23:59:59");
    if(startDate1.before(today) && today.before(endDate1)){
%>

<div style="display:block; width:100%;background:url(http://images.shopin.net/images/ad/jinqiu/yt02.jpg) no-repeat center center; text-align:center; position:relative;" id="js_ads_banner_top">
	<a href="http://www.shopin.net/help/jinqiu.html" target="_blank"><img src="http://images.shopin.net/images/ad/jinqiu/yt01.jpg" width="954" height="147" align="top"></a>
</div>

<%}%> 