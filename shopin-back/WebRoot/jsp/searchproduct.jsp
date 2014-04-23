<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加商品</title>
 <script type="text/javascript">
    Ext.onReady(function(){
    	//Ext.state.Manager.setProvider(new Ext.state.SessionProvider({state:Ext.appState}));
 		var searchbar = new Ext.form.FieldSet({
 			title:'筛选条件',
 			layout:'form',
 			items:[{
 				xtype:'container',
 				layout:'hbox',
 				items:[{
 					xtype:'container',
 					layout:'form',
 					bodyStyle: "background-color:#dfe8f6;padding:10 0 10 10",
 					items:[{
 						
							  xtype:'textfield'
							  ,fieldLabel:'类型'
							  ,name:'AddForm_sMaterialType'
							  ,labelStyle: "text-align: right;"
//							  ,value:sMaterialType
						  
 					}]
 					
 				}]
 			}]
 		
 			
 		});
    	
    	
    	 //tablelayout方式的布局
 	   var table = new Ext.Panel({
 		   title:'table layout',
 		   layout:'table',
 		   //renderTo:document.body,
 		   defaults:{
 			   //对每一个面板都有效
 			   bodyStyle:'padding:20px'
 		   },
 		   layoutConfig:{
 			   //这里指定总列数
 			   columns:2
 		   },
 		   items:[
 	         
 	        	searchbar
 	        	//colspan:2
 		   ,{
 			   html:'<p>cell c content</p>'
 		   },{
 			   html:'<p>cell d conent</p>'
 		   }
 		          ]
 		   
 	   });		  
    	 
 	  new Ext.Window({
  		title:'商品选择',
	    layout:'fit',
  		width:document.documentElement.clientWidth,
  		height:document.documentElement.clientHeight-40,
  		plain:true,
  		items:[table]
  		
  	}).show(Ext.getBody());
    	
    	
    });   
 
 
 
 
 </script>
</head>
<body>

</body>
</html>

