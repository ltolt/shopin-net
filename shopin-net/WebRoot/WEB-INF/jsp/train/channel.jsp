<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>频道管理</title>
  <script type="text/javascript" src="${ctx}/extjs/channelview.js"></script>
  <script type="text/javascript">
			__ctxPath = "${pageContext.request.contextPath}";
		</script> 
  <script type="text/javascript">
    Ext.onReady(function(){
    	new ChannelView();
    });
  
  </script>



</head>
<body>
   <div id="mainDiv"></div>
</body>
</html>