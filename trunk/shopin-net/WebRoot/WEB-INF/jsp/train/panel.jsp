<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网站商品品类管理</title>
<script type="text/javascript">
  Ext.onReady(function(){
	  
	  var store  = new Ext.data.Store({
		  url:'${ctx}/',
		  reader:new Ext.data.JsonReader({
			  root:'result',
			  id:'sid',
			  fields:[
			          'name'
			          
			          ]
		  
			  
		  })
		  
		  
	  });
	  store.load();
	  
	  var cm = new Ext.grid.ColumnModel({
		  columns:[
		           new Ext.grid.RowNumberer(),
		           {
		        	   header:'sid',
		        	   dataIndex:'sid',
		        	   
		           },{
		        	   header:'name',
		        	   dataIndex:'name',
		        	   width:60
		           }
		           
		           ],
		           defaults : {
						sortable : true,
						menuDisable : true,
						width : 100
					}
		  
	  });
	  
	  var gridpanel = new Ext.grid.GridPanel({
		  id:'productlist',
		  height:800,
		  border:false,
		  title:'品类商品信息',
		  store:store,
		  trackMouseOver : true,
		  disableSelection : false,
		  loadMask:true,
		  cm:cm,
		  
		  
	  });
	  
	  
	  
	  
	  //品类根节点
	  var root = new Ext.tree.AsyncTreeNode({id:1,text:'网站分类',leaf:false});
	  var loader = new Ext.tree.TreeLoader({
			 url:'${ctx}/catetreeload.html'		 
		 });
	  loader.on('beforeload',function(loader,node){
			 loader.baseParams.nodeId = node.id;
		 });
	  
	   var contextmenu = new Ext.menu.Menu({
		  id:'menu',
		  items:[]
	  });
	  contextmenu.add({
		  text:'添加品类',
		  iconCls : "btn-add",
		  handler:create
	  });
	
	var addCateform = new Ext.FormPanel({
		    layout:'form',
			bodyStyle : "padding:10px 10px 10px 10px",
			border : false,
			id:'addcateform',
			defaults:{
				anchor:'95%,95%'
			},
			defaultType : "textfield",
			items:[{
				id:'parentId',
				name:'parentId',
				xtype:'hidden',
				value:''
			},{
				id:'cataname',
				name:'catename',
				fieldLabel:'分类名称',
				allowBlank:false
			}]
	  });
	  
	
	  
	  var addCateWin = new Ext.Window({
			id:'addcatewin',
			layout:'fit',
			items:addCateform,
			modal:true,
			height:300,
			width:400,
			title:'添加品类',
			buttonAlign : "center",
			buttons : [{
				text:'save',
				handler:saveCate
			}] 
	  });
	  function saveCate(){
		  alert('addcate');
		  alert(addCateform.getForm().isValid());
		  if(addCateform.getForm().isValid()){
			  addCateform.getForm().submit({
				  url:'${ctx}/addChildCate.html',
				  method : "post",
				  waitMsg : "正在提交数据……",
				  success : function(c, d) {
						Ext.MessageBox.show({
							title : "操作信息",
							msg : "保存成功！",
							buttons : Ext.MessageBox.OK,
							icon : Ext.MessageBox.INFO
						});
						addCateWin.close();
					},
					failure : function() {
						alert('failure');
					}
				  
			  });
			  
		  }
	  }
	  
	  function create(){
		 	addCateWin.show();	  
	  }
	  
	  
	  //品类管理树
	  var catetreepanel = new Ext.tree.TreePanel({
		  title:'网站品类管理',
		  height:800,
		  loader:loader
	  });
	   
	   catetreepanel.on('contextmenu',function(node,e){
		     e.preventDefault();
			 node.select();
			 Ext.getCmp('parentId').setValue(node.id);
			 contextmenu.showAt(e.getXY());
		  
	  }); 
	  catetreepanel.setRootNode(root);
	   
	  
	  
	  
	   //panel的layout:column布局
	  var panel = new Ext.Panel({
		  id:'catemanage',
		  layout:'column',
		  items:[{
			columnWidth:0.2,
			items:[catetreepanel]
		  },{
			  columnWidth:0.8,
			  items:[gridpanel]
		  }],
		  title:'网站品类管理',
		  renderTo:'main-div'
	  });
	  
	  
	  
	  
	  
	  
	  
	  
  });
   




</script>


</head>
<body>
<div id="main-div"/>
</body>
</html>