<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ext 事件 分析 </title>
<style type="text/css">
#outer{
width:15em;
boder:3px solid #f33;
color:#f00;
padding:0.5em;
}
</style>

<script type="text/javascript">
  Ext.onReady(function(){
	  var el = Ext.get('btn');
	  //el相当于观察者模式下的那个目标
	  el.on('click',function(){
		  alert('clicked');
	  });
	  //现在我们是注册(Register),第一个参数是事件，第二个参数是
	  //处理函数，简单的说是事件具体执行的过程 
	  //当前是匿名函数如果要多个事件使用同一个处理函数，最直接的方法是顶一个函数
	  
	  //每次触发EventHandler必定会有事件参数被传入，以获取这次
	  //触发事件的相关消息 ， 例如 目标 鼠标坐标信息等
	  function handleClick(e){
		  //e不是一个标准的浏览器事件对象 是由
		  //Ext.EventObject.setEvent方法包装了一个
		  //标准浏览器事件对象的统一事件对象
		  //可通过e.browserEvent访问标准浏览器事件对象(Raw Event)
		  //这时事件对象根据浏览器的不同而不同
		  e.preventDefault();
		  var target = e.getTarget();
		  alert(target.id);
		  alert(e.browserEvent);
	  }
	  
	  
	  var mydiv = Ext.get('outer');
	  mydiv.on('click',handleClick);
	  //或者可以这样写
	  //Ext.EventManager.on('mydiv','click',handleClick);
	  //Ext.EventManager.addListener('mydiv','click',handleClick);
	  
	  
	  
	  
	  
	  
	  
	  
  });

</script>



</head>
<body>
  <div id="outer">
    click me 
  </div>

  <button id="btn">clicke me </button>
</body>
</html>