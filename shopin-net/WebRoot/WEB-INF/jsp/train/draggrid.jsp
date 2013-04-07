<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html debug="true">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>通过拖拽改变行的顺序</title>
<script type="text/javascript">
   
 
 
 


</script>
</head>
<body>
<h1 style="margin:20px 0px 0px 20px;">通过拖拽改变行的顺序</h1>
<br/>
<div style="padding-left:20px;">
  <p>
    <div id="panel1"></div>
    <br/>
    <div>事件:</div>
    <textarea id="op" rows="10" style="width:800px;"></textarea>
  </p>
</div>
  <script type="text/javascript">
        var app = {};
        Ext.onReady(function(){
			Ext.QuickTips.init();
        	Ext.Msg.minWidth=300;
        	
        	var store = new Ext.data.Store({
        		url:'${ctx}/listClass.html',
        		baseParams:{},
        		reader:new Ext.data.JsonReader({
        			totalProperty:'results',
        			root:'rows',
        			id:'id'
        		},[
        		   {name:'id',type:'int'},
        		   {name:'nodename'},
        		   {name:'fatherNodeSid'},
        		   ]
        		
        		),
        		listeners:{
        			scope:this,
        			load:function(){
        				if(grid){
        					grid.getSelectionModel().selectFirstRow();
        				}
        				
        			}
        		}
        		
        		
        		
        	});
        	
        	var grid = new Ext.grid.GridPanel({
        		height:350,
        		width:600,
        		enableDragDrop:true,
        		store:store,
        		title:'通过拖拽改变行的顺序',
        		frame:true,
        		enableDrag:true,
        		columns:[{
        			id:'id',
        			header:'编号',
        			width:80,
        			dataIndex:'id'
        		},{
        			header:'分类名',
        			width:75,
        			dataIndex:'nodename'
        		},{
        			header:'父节点名',
        			width:80,
        			dataIndex:'fatherNodeSid',
        		}],
        		stripeRows:true,
        		autoExpandColumn:1
        		
        	
        	});
        	
        	grid.render('panel1');
        	store.load();
        	
        	
        });
  </script>














</body>
</html>