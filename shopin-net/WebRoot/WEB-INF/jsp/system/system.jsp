<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网站后台管理</title>
<script type="text/javascript">
  Ext.onReady(function(){
	  //根节点
	  var myroot1 = new Ext.tree.TreeNode({
		  cls:'feeds-node',
		  text:''
	  });
	  var mypage= new Ext.tree.TreeNode({
		 id:'mypage',
		 iconCls:'button_tree',
		 text:'网站页面管理',
		 listeners:{
			 'click':function(node,event){
				 var id = "mypage";
				 var oldId = Ext.getCmp(id);
				 if(oldId == undefined){
					 Ext.getCmp('modeltreepanel').add({
						 title:'网站页面管理',
						 id:id,
						 closable:true, 
						 html:'<iframe width="100%" height="100%" align="center" frameborder="0" src="${ctx}/system/pagemanage.html"></iframe>'
					 });
					 
				 }
				 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
			 }
			 
		 }
	  });
	  myroot1.appendChild(mypage);
	  
	  //网站页面管理
	  var pagemanage = new Ext.tree.TreePanel({
		  title:'网站页面管理',
		  split:true,
		  margins:'0 0 5 5',
		  rootVisible:false,
		  lines:false,
		  autoScroll:true,
		  root:myroot1
	  });
	  
	  
	  var navigtion = new  Ext.Panel({
		  id:'navi-tree',
		  region:'west',
		  margins:'2 2 2 2',
		  layout:'accordion',
		  collapsible: true,
		  title:'后台管理',
		  width:225,
		  minSize: 175,
		  maxSize: 400,
		  split:true,
		  layoutConfig:{animate:true},
		  items:[pagemanage]
	  });
	  
	  
	  new Ext.Viewport({
		  layout:'border',
		  items:[
		         {
		        	 region:'north',//顶部面板
		        	 xtype:'panel',
		        	 id:'northpanel',
		        	 height:90,
		        	 layout:'hbox',
		        	 items:[
		        	        {
		        	        	flex:8,
		        	        	html:'<iframe width="100%" height="100%" align="center" frameborder="0" src="'+'${ctx}'+'/system/systemhead.html'+'"></iframe>',
		        	        	autoHeight:true,
		        	        	border:false,
		        	        	margins:'0 0 5 0'
		        	        }
		        	        ] 
		        	 
		        	 
		         },
		         navigtion,
		         {
		        	 region:'center',//中间面板
		        	 xtype: 'tabpanel', 
		        	 enableTabScroll : true,
		        	 defaults : {
		 				autoScroll : true
		 			},
		 			frame:true, 
		 			id:'modeltreepanel',
		 			items:[]
		         },{
					region:'south',//底部面板
					xtype: 'panel', 
					frame:true,
					html:'<p align="center"><span >Copyright (C) 2012 shopin All rights reserved; 本系统由上品折扣信息系统部提供技术支持</span></p>' 
		         }
		         
		         
		         ]
	  
		  
		  
		  
	  });
	  
	  
	  
	  
	  
	  
	  
	  
	  
  });





</script>


</head>
<body>

</body>
</html>