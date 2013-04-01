<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网站商品品类管理</title>
<script type="text/javascript" src="${ctx}/extjs/addnode.js"></script>
<script type="text/javascript">
Ext.onReady(function(){
	 Ext.BLANK_IMAGE_URL = "${ctx}/js/ext3.4/resources/images/default/s.gif";
	 Ext.QuickTips.init();//开启提示功能,在其他功能加载前完成加载 所以写在第一行
	 
	/*  var store = Ext.create('Ext.data.TreeStore',{
		 proxy:{
			 type:'ajax',
			 url:'${ctx}/catetreeload.html'
		 },
			 root:{
				 text:'cate',
				 id:'10000',
				 expanded:true
			 },
		 folderSort:true,
		 sorters:[{
			property:'text',
			direction:'ASC'
		 }]
		 
	 }); */
	/*  var tree4 = Ext.create('Ext.tree.Panel',{
		 //store: store,
		 rootVisible:false,
		/*  viewConfig: {

	            plugins: {

	                ptype: 'treeviewdragdrop'

	            }

	        }, */
	      /*   renderTo: 'tree-div4',
	        height: 300,
	        width: 250,
	        title: '网站品类',
	        useArrows: true,
	        dockedItems: [{
	            xtype: 'toolbar',
	            items: [{
	                text: '全部展开',
	                handler: function(){
	                	tree4.expandAll();
	                }
	            }, {
	                text: '全部折叠',
	                handler: function(){
	                	tree4.collapseAll();
	                }
	            }]
	        }]
	 });  */ 
	 
	 //右键菜单效果
	 //自定义菜单 
	 var contextmenu = new Ext.menu.Menu({
		 id:'theContextMenu',
		 items:[
		        {
		        	text:'点击',
		        	handler:function(){
		        		//alert('clicked');
		        		new NodeAddForm({title:'cateadd'}).show();
		        	}
		        }
		        ]
	 
		 
	 });
	 
	 
	 //异步加载节点
	 var root3 = new Ext.tree.AsyncTreeNode({id:1,text:'网站分类',leaf:false});
	 var loader = new Ext.tree.TreeLoader({
		 url:'${ctx}/catetreeload.html'		 
	 });
	 loader.on('beforeload',function(loader,node){
		 alert(node.id);
		 loader.baseParams.nodeId = node.id;
	 });
	 var tree3 = new Ext.tree.TreePanel({
		 title:'网站分类',
		 width:300,
		 height:300,
		 loader:loader
	 });
	//绑定菜单到tree
	 tree3.on("contextmenu",function(node,e){
		 e.preventDefault();
		 node.select();
		 contextmenu.showAt(e.getXY());
	 });
	 
	 
	 tree3.setRootNode(root3);
	 tree3.render("tree-div3");
	 
	 //定义根节点
	 //通过设置checked 属性来现实Treepanel中的复选框
	 var root = new Ext.tree.TreeNode({id:0, text:"根节点",checked:false ,iconCls:"me-iconCls"});
	 var level_1_1 = new Ext.tree.TreeNode({id:'1',text:"一级_1",checked:false,iconCls:"me-iconCls"});
	 var level_1_2 = new Ext.tree.TreeNode({id:'2',text:"一级_2",checked:false,iconCls:"me-iconCls"});
	 root.appendChild([level_1_1,level_1_2]);
	 
	 var root2 = new Ext.tree.TreeNode({id:11, text:"根节点",checked:false ,iconCls:"me-iconCls"});
	 var level_2_1 = new Ext.tree.TreeNode({id:12,text:"一级_1",checked:false,iconCls:"me-iconCls"});
	 var level_2_2 = new Ext.tree.TreeNode({id:13,text:"一级_2",checked:false,iconCls:"me-iconCls"});
	 var level_2_1_1=new Ext.tree.TreeNode({id:4,checked:true,text:'二级_1',iconCls:"me-iconCls"});
	 var level_2_1_2=new Ext.tree.TreeNode({id:5,checked:true,text:'二级_2',iconCls:"me-iconCls"});
	 level_2_1.appendChild([level_2_1_1,level_2_1_2]);
	 root2.appendChild([level_2_1,level_2_2]);
	 
	 //定义tree2
	 var tree2 = new Ext.tree.TreePanel({
		 width:600,
		 height:300,
		 title:'树2',
		 bbar:[{
			text:'Selected',
			icon:'${ctx}/images/checked.gif',
			cls:'x-btn-text-icon',
			tooltip:'获取被选择的节点的现实文本',
			tooltipType:'qtip',
			handler:function(){
				var nodes = tree2.getChecked();//获取所有节点
				for(var i = 0 ;i<nodes.length;i++){
					alert(nodes[i].text);
				}
				
			}
			 
		 },{
			 text:'Clear all',
			 icon:'${ctx}/images/unchecked.gif',
			 cls:'x-btn-text-icon',
			 tooltip:'清除',
			 tooltipType:'qtip',
			 handler:function(){
				 var nodes = tree2.getChecked();
				 var selModel =tree2.getSelectionModel();
				 for(var i = 0;i<nodes.length;i++){
					 nodes[i].ui.checkbox.checked = false;//将选中的数据取消
					 nodes[i].ui.onCheckChange();//与模型数据同步
				 }
				 
			 }
		 },{
			 text:'Select All',
			 icon:'${ctx}/images/checked.gif',
			 cls:'x-btn-text-icon',
			 tooltip:'全选',
			 tooltipType:'qtip',
			 handler:function(){
				 tree2.iteratorCheck(tree2.getRootNode(),true);
			 }
			 
		 },{ //在同级节点之前添加节点
			 text:'插入节点',
			 icon:'${ctx}/images/drop-add.gif',
			 cls:'x-btn-text-icon',
			 tooltip:'插入节点',
			 tooltipType:'qtip',
			 handler:function(){
				 Ext.MessageBox.prompt('输入','请输入新节点的名称',function(btn,txt){
					 if(btn == 'ok'){
						 var newNode = new Ext.tree.TreeNode({text:txt});
						 var selNode = tree2.getSelectionModel().getSelectedNode();
						 if(!selNode){
							 Ext.Msg.alert('错误','在添加新节点之前请先选择参照节点!');
						 }else if(selNode.id == tree2.getRootNode().id){
							 Ext.Msg.alert('错误','根节点不能添加同级节点!');
						 }else{
							 selNode.parentNode.insertBefore(newNode,selNode);
						 }
						 
					 }
					 
				 });
								 
			 }
		 },{ //在同级节点之后插入节点
			 text:'插入节点',
			 icon:'${ctx}/images/drop-add.gif',
			 cls:'x-btn-text-icon',
			 tooltip:'插入节点',
			 tooltipType:'qtip',
			 handler:function(){
				 Ext.MessageBox.prompt('输入','请输入新节点的名称',function(btn,txt){
					 if(btn == 'ok'){
						 var newNode = new Ext.tree.TreeNode({text:txt});
						 var selNode = tree2.getSelectionModel().getSelectedNode();
						 if(!selNode){
							 Ext.Msg.alert('错误','在添加新节点之前请先选择参照节点!');
						 }else if(selNode.id == tree2.getRootNode().id){
							 Ext.Msg.alert('错误','根节点不能添加同级节点!');
						 }else{
							 selNode.parentNode.insertBefore(newNode,selNode.nextSibling);
						 }
						 
					 }
					 
				 });
								 
			 }
			 
		 },{
			 text:'添加子节点',
			 icon:'${ctx}/images/drop-add.gif',
			 cls:'x-btn-text-icon',
			 tooltip:'添加子节点',
			 tooltipType:'qtip',
			 handler:function(){
				 Ext.MessageBox.prompt('输入','请输入新节点的名称',function(btn,txt){
					 if(btn == 'ok'){
						 var newNode = new Ext.tree.TreeNode({text:txt});
						 var selNode = tree2.getSelectionModel().getSelectedNode();
						 if(!selNode){
							 Ext.Msg.alert('错误','在添加新节点之前请先选择参照节点!');
						 
						 }else{
							 selNode.appendChild(newNode);//增加新节点
							 selNode.expand();//展开子节点
						 }
						 
					 }
					 
				 });
								 
				 
			 }
			 
		 },{//删除节点  自杀式删除
			 text:'删除节点',
			 icon:'${ctx}/images/drop-add.gif',
			 cls:'x-btn-text-icon',
			 tooltip:'删除节点',
			 tooltipType:'qtip',
			 handler:function(){
				 var selNode = tree2.getSelectionModel().getSelectedNode();
				 if(!selNode){
					 Ext.Msg.alert("","请选中节点");
				 }else if(selNode.id == tree2.getRootNode().id){
					 Ext.Msg.alert("","根节点不能删除");
				 }
				 else{
					 selNode.remove();
				 }
			 }
			 
		 },{
			 text:'节点信息',
			 icon:'${ctx}/images/drop-add.gif',
			 cls:'x-btn-text-icon',
			 tooltip:'节点信息',
			 tooltipType:'qtip',
			 handler:function(){
				 var selNode = tree2.getSelectionModel().getSelectedNode(); 
				 if(!selNode){
					 Ext.Msg.alert('警告','没有选中任何节点!');
					 return;
				 }
				 var parentNode = selNode.parentNode;
				 var firstChild = selNode.firstChild;
				 var lastChild = selNode.lastChild;
				 var previousSibling = selNode.previousSibling;
				 var nextSibling = selNode.nextSibling;
				 Ext.MessageBox.alert("INFO", (parentNode ? "父节点：" + parentNode.text : "无父节点")
						 + "<br>" + (firstChild ? "第一个子节点：" + firstChild.text : "无第一个子节点")
						 + "<br>" + (lastChild ? "最后一个子节点：" + lastChild.text : "无最后一个子节点")
						 + "<br>" + (previousSibling ? "上一个兄弟节点：" + previousSibling.text : "无上一个"+
						 "兄弟节点")
						 + "<br>" + (nextSibling ? "下一个兄弟节点：" + nextSibling.text : "无下一个兄弟节点")
						 + "<br>节点路径：" + selNode.getPath("text")
						 ); 	
			 
			 }
			 
		 }]
		 
	 });
	 //修改节点的信息
	 var editor = new Ext.tree.TreeEditor(tree2,{allowBlank:false});
	 //处理事件 
	 //节点信息被修改之后触发的事件
	 editor.on('complete',function(editor,value,startValue){
		 alert('原职' + startValue + ",新值" + value);
		 alert('被修改节点:' + editor.editNode);
		 
	 });
	 //treepanel 插入新节点时触发的事件
	 tree2.on('insert',function(tree,parent,node,refNode){
		 alert('inserted');
	 });
	 //删除节点是触发
	 tree2.on('remove',function(tree,parent,node){
		 alert('removed');
	 });
	 //添加子节点时触发 
	 tree2.on('append',function(tree,parent,node){
		 alert('append');
		 
	 });
	 
	 /*触发复选框状态改变事件
	 */
	 tree2.on('checkchange',function(node){
		 var children = node.childNodes;
		 for(var i = 0;i<children.length;i++){
			 children[i].ui.checkbox.checked = node.ui.checkbox.checked;
			 children[i].ui.onCheckChange();
		 }
		 
	 });
	 /*递归遍历所有节点
	 */
	 tree2.iteratorCheck = function(node,checked){
		if(node.hasChildNodes()){
			node.eachChild(function(currentNode){
				tree2.iteratorCheck(currentNode,checked);
				
			});
		} 
		node.ui.checkbox.checked = checked;
		node.ui.onCheckChange();
	 }
	 
	 
	 tree2.setRootNode(root2);
	 tree2.render("tree-div2");
	 tree2.expandAll();
	 //定义TreePanel
	 var tree = new Ext.tree.TreePanel({
		 width:200,
		 height:300,
		 title:'树',
		 //selModel:new Ext.tree.MultiSelectionModel(),//支持多选的选择模型
		 //lines:true
		 //树的默认的选择模型是Ext.tree.DefaultSelectionModel
		 bbar:[{
			icon:'${ctx}/images/drop-add.gif',
			cls:'x-btn-text-icon',
			text:'上',
			tooltip:'向上选择一个节点',
			tooltipType:'qtip',
			handler:function(){
				var model = tree.getSelectionModel();//获取选中的模型
				model.selectPrevious();
			}
		 },{
			 icon:'${ctx}/images/drop-add.gif',
			 cls:'x-btn-text-icon',
			 text:'下',
			 tooltip:'向下选择一个节点',
			 tooltipType:'qtip',
			 handler:function(){
				 var model = tree.getSelectionModel();////获取选中的模型
				 model.selectNext();
			 }
		 },{
			 icon:'${ctx}/images/drop-yes.gif',
			 cls:'x-btn-text-icon',
			 text:'值',
			 tooltip:'获取被选择的节点的显示文本',
			 tooltipType:'qtip',
			 handler:function(){
				 var model = tree.getSelectionModel();////获取选中的模型
				 var selectdNode = model.getSelectedNode();//获取选择的节点
				 if(selectdNode){
					 Ext.MessageBox.alert("",selectdNode.text);
				 }
			 }
		 },{
			 icon:'${ctx}/images/folder.gif',
			 cls:'x-btn-text-icon',
			 text:'选',
			 tooltip:'自定义选择任何节点',
			 tooltipType:'qtip',
			 handler:function(){
				 Ext.Msg.prompt("路径","请输入要选择的节点路径 从根节点开始如/根节点/一级_1",
						 function(btn,txt){
					 if(btn == 'ok'){
						 tree.selectPath(txt,"text");
					 }
					 
				 });
				 
			 }
		 },{
			 icon:'${ctx}/images/folder.gif',
			 cls:'x-btn-text-icon',
			 text:'ID',
			 tooltip:'根据ID进行选择', 
			 tooltipType:'qtip',
			 handler:function(){
				 Ext.Msg.prompt("路径","请输入要选择的节点的ID",function(btn,txt){
					if(btn == 'ok'){
						var model = tree.getSelectionModel();
						var selNode = tree.getNodeById(txt);//根据ID获取节点对象
						model.select(selNode);//选择该节点对象
						
						
					} 
					 
				 });
				 
			 }
		 
		 
		 }]
		 
	 });
	 tree.setRootNode(root); 
	 tree.render("tree-div");	 
	 
	/*  
	 var store = Ext.create('Ext.data.TreeStore',{
		 proxy:{
			 type:'ajax',
			 url:'${ctx}/classtree.html'
		 },
		 root:{
			 
			 
		 }
		 
	 });
	 
	 var tree = Ext.create('Ext.tree.Panel',{
		 store:store,
		 
		 
	 });
	  */
	 
	 
 });




</script> 


</head>
<body>
 网站商品品类管理
<div id="tree-div">
<div id="tree-div2" style=""/>
<div id="tree-div3"/>
<div id="tree-div4"/>
</div>
</body>
</html>