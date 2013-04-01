<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ext observable</title>
<script type="text/javascript" src="${ctx}/extjs/employee.js"></script>
<script type="text/javascript">
 Ext.onReady(function(){
   
	 var newEmployee = new Employee({
		  name:'k',
		  listeners:{
			  quit:function(){
				  //使用default,则this将会是促发事件的对象
				  alert(this.name + "has quit");
			  }
			  
		  }
		  
	  });


	 
 });
 




</script>
</head>
<body>

</body>
</html>