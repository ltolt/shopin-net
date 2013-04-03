<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>高级组件事件</title>
<script type="text/javascript">
    Ext.onReady(function(){

        Employee = function(name){
    		//这里是employee的构造函数
    		this.name = name;
    		this.addEvents({
    			'fired':true ,
    			'quit':true , 
    			'init':true ,
    		});
    		this.init();//调用init方法
        }
    	Ext.extend(Employee,Ext.util.Observable,{
    		init:function(){
    			alert('init');
    			this.fireEvent('quit');
    		}
    	});
		function quitHandler(employee){
			alert(employee.name);
		} 
    	
    	var mike = new Employee('mike');
    	mike.on('quit',quitHandler);
    	
    	
    });
   	
	



</script>

</head>
<body>

</body>
</html>