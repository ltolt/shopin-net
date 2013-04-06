<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Table layout </title>
<script type="text/javascript">
   Ext.onReady(function(){
	   //tablelayout方式的布局
	   var table = new Ext.Panel({
		   title:'table layout',
		   layout:'table',
		   renderTo:'a',
		   defaults:{
			   //对每一个面板都有效
			   bodyStyle:'padding:20px'
		   },
		   layoutConfig:{
			   //这里指定总列数
			   columns:3
		   },
		   items:[{
			   html:'<p>cell a content</p>',
			   rowspan:2
		   },{
			   html:'<p>cell b content</p>',
			   colspan:2
		   },{
			   html:'<p>cell c content</p>'
		   },{
			   html:'<p>cell d conent</p>'
		   }
		          ]
		   
	   });		   
	   
	   
   });
</script> 
</head>
<body>
<div id="a"></div>
</body>
</html>