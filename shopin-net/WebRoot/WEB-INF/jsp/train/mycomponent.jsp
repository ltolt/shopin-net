<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自定义组件</title>
<script type="text/javascript">
  MyComponent = Ext.extend(Ext.Component,{
	  //默认构造参数 可被后来的自定义设置覆盖
	  propA:1,
	  initComponent:function(){
		  //下面的语句应在调用父类代码之前
		  Ext.apply(this,{
			  propA:2
		  });
		//调用父类构造函数(必须)
		MyComponent.superclass.initComponent.apply(this,arguments);
		//调用父类代码之后 可设置事件处理和渲染组件等的任务
		
	  }
	  
  });
  //注册成xtype以便能够延迟加载
  Ext.reg('mycomponent',MyComponent);
  
  var mycomponent = new MyComponent({
	  propA:3
  });
  //或者延迟加载:
	  {
	  items:[{
		xtype:'mycomponent',
		propA:2
	  }]
	  
	  }
  


</script>


</head>
<body>

</body>
</html>