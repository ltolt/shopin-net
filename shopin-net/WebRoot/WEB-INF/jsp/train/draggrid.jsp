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
        		   {name:'fathername'},
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
        			dataIndex:'fathername',
        		}],
        		stripeRows:true,
        		autoExpandColumn:1,
        		tbar:[{
        			text:'上移',
        			iconCls:'up',
        			scope:this,
        			handler:function(){
        				buttonMove(-1);
        			}
        		},{
        			text:'下移',
        			iconCls:'down',
        			scope:this,
        			handler:function(){
        				buttonMove(1);
        			}
        		},'-',{
        			text:'保存',
        			iconCls:'save',
        			scope:this,
        			handler:function(){
        				var ds = grid.getStore();
        				var sortIndex = [];
        				for(var i = 0;i<ds.getCount();i++){
        					sortIndex.push(ds.data.items[i].id);
        					Ext.get('op').dom.value +="--------\n" + sortIndex + "\n";
        					Ext.Ajax.request({
        						url:'${ctx}/saveClass.html',
        						params:{
        							sortIndex:sortIndex
        							
        						},
        						success:function(response,op){
        							var msg = response.responseText;
        							var obj = Ext.decode(msg);
        							if(obj){
        								if(obj.success){
        									msg='新的顺序保存成功'
        								}else{
        									msg = obj.data;
        								}
        							}
        							Ext.Msg.alert('信息',msg);
        						},
        						failure:function(response,op){
        							Ext.Msg.alert('信息',response.responseText);
        						}
        						
        					});
        				}
        			}
        		}]
        		
        	
        	});
        	
        	grid.render('panel1');
        	function buttonMove(toward){
        		var sm = grid.getSelectionModel();
        		var data = sm.getSelections();
        		if(sm.hasSelection()){
        			var 
        		}
        		
        	}
        	
        	store.load();
        	
        	
        });
  </script>














</body>
</html>