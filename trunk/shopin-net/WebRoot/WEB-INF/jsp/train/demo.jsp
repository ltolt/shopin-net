<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  <script type="text/javascript">
  
     $(function(){
  	   	
    	$('#btn').on('click',function(){
    		var name=prompt("请输入您的名字")
    		  if (name!=null && name!="")
    		    {
    		       $('#d1').append(name + 'sb<br/>');
    		    }
    	}); 
    	 
    	 
    	 
    	 
     });
  </script>
</head>
<body>
   <button id="btn">click</button>
   <div id="d1"></div>
</body>
</html>