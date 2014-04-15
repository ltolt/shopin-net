<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
  <head>
        <title>${notice.title}-上品折扣网shopin.net- 商场名牌2-5折限量秒杀,正品保障,网上购物!服装品牌,名品折扣,名牌打折,团购价!上品折扣官方购物网站</title>
        <link href="${localcss}/reset.css" rel="stylesheet" type="text/css">
		<link href="${localcss}/layout.css" rel="stylesheet" type="text/css">
		<link href="${localcss}/cart.css" rel="stylesheet" type="text/css">
      
  </head>
  <body>
     <div class="in oz">
		<div class="breadCrumbs">
						当前位置：<a href="index.html" target="_blank">首页</a> > <a href="" target="_blank">网站公告</a>
				</div>
</div>
<div id="container" class="in oz shopin">
<div class="news-content">
<center><h2>
${notice.title}
</h2>
</center>
${notice.content}
</div>
</div>
  
  
  
  </body>
</html>