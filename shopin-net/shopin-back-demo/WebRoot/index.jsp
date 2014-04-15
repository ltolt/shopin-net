<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网站后台管理</title>


<script type="text/javascript" src="${ctx}/order/OrderListView.js"></script>
<script type="text/javascript" src="${ctx}/order/OrderRefundListView.js"></script>
<script type="text/javascript" src="${ctx}/order/SaleOrderListView.js"></script>
<script type="text/javascript" src="${ctx}/order/ReturnApplyView.js"></script>
<script type="text/javascript" src="${ctx}/order/SapSaleRecordView.js"></script>
<script type="text/javascript" src="${ctx}/order/PosRecordView.js"></script>
<script type="text/javascript" src="${ctx}/order/pad/ReturnApplyForPadView.js"></script>
<script type="text/javascript" src="${ctx}/order/pad/SaleOrderForPadListView.js"></script>
<script type="text/javascript" src="${ctx}/order/logistics/OrderListForLogisView.js"></script>
<script type="text/javascript" src="${ctx}/order/logistics/ReturnApplyForLogisView.js"></script>
<script type="text/javascript" src="${ctx}/order/logistics/SaleOrderListForLogisView.js"></script>
<script type="text/javascript" src="${ctx}/order/financial/ReturnApplyForFinancialView.js"></script>
<script type="text/javascript" src="${ctx}/order/service/ReturnApplyForServiceView.js"></script>
<script type="text/javascript" src="${ctx}/order/service/OrderListForServiceView.js"></script>
<script type="text/javascript" src="${ctx}/order/admin/OrderListViewForAdmin.js"></script>
<script type="text/javascript" src="${ctx}/order/admin/ReturnApplyViewForAdmin.js"></script>

<script type="text/javascript" src="${ctx}/financial/ReturnApplyForFinan1View.js"></script>
<script type="text/javascript" src="${ctx}/financial/PayOrderView.js"></script>
<script type="text/javascript" src="${ctx}/financial/SaleForFinanView.js"></script>

<script type="text/javascript" src="${ctx}/sysjs/flashpromotion.js"></script>
<script type="text/javascript" src="${ctx}/sysjs/addflashpromotion.js"></script>
<script type="text/javascript" src="${ctx}/sysjs/updateflashpromotion.js"></script>
<script type="text/javascript" src="${ctx}/sysjs/flashmanagepage.js"></script>
<script type="text/javascript" src="${ctx}/sysjs/addflashproduct.js"></script>
<script type="text/javascript" src="${ctx}/sysjs/TreeSelector.js"></script>
<script type="text/javascript" src="${ctx}/js/ext3.4/ux/fileuploadfield/FileUploadField.js"></script>
<link rel="stylesheet" type="text/css" href="${ctx}/js/ext3.4/ux/fileuploadfield/css/fileuploadfield.css"/>


<script type="text/javascript" src="${ctx}/solr/HotKeyConfigForm.js"></script>
<script type="text/javascript" src="${ctx}/solr/HotKeyConfigView.js"></script>
<script type="text/javascript" src="${ctx}/solr/HotKeyForm.js"></script>
<script type="text/javascript" src="${ctx}/solr/HotKeyView.js"></script>
<script type="text/javascript" src="${ctx}/solr/IndexDetailForm.js"></script>
<script type="text/javascript" src="${ctx}/solr/IndexDetailView.js"></script>
<script type="text/javascript" src="${ctx}/solr/IndexRegularForm.js"></script>
<script type="text/javascript" src="${ctx}/solr/IndexRegularView.js"></script>
<script type="text/javascript" src="${ctx}/solr/ReindexAllView.js"></script>
<script type="text/javascript" src="${ctx}/solr/SearchKeyForm.js"></script>
<script type="text/javascript" src="${ctx}/solr/SearchKeyView.js"></script>
<script type="text/javascript" src="${ctx}/js/ext3.4/ux/Ext.ux.grid.RowActions.js"></script>
<script type="text/javascript" src="${ctx}/js/ext3.4/ux/Toast.js"></script>
<script type="text/javascript" src="${ctx}/search/ProductSortWeightView.js"></script>
<script type="text/javascript" src="${ctx}/search/ProductSortWeightForm.js"></script>
<script type="text/javascript" src="${ctx}/search/ProductHitView.js"></script>
<script type="text/javascript" src="${ctx}/search/ProductHitForm.js"></script>
<script type="text/javascript" src="${ctx}/search/SolrKeywordView.js"></script>
<script type="text/javascript" src="${ctx}/search/SolrKeywordForm.js"></script>

<script type="text/javascript">
__ctxPath = "${pageContext.request.contextPath}";
flashImage="http://172.16.103.163/";
var username = '<%=session.getAttribute("username")%>';
var resources = '<%=session.getAttribute("resources")%>';
var rsCodes = resources.split(",");
var PAGE_START_0 = 0;
var PAGE_SIZE_20 = 15;
var PAGE_SIZE_SEARCH = 12;

function isGranted(resource) {
	return true;
}
function isAuthorized(resource){
	rsCodes = this.rsCodes;
	
		if (rsCodes != null && rsCodes.length > 0) {
			for (i = 0; i < rsCodes.length; i++) {
				if (rsCodes[i] == resource) {
					return true;
				}
			}
		} else {
				return false;
		}
		
}

  Ext.onReady(function(){
	  //根节点
	  var myroot1 = new Ext.tree.TreeNode({
		  cls:'feeds-node',
		  text:''
	  });
	  var myroot2 = new Ext.tree.TreeNode({
		  cls:'feeds-node',
		  text:''
	  });
	  var myroot3 = new Ext.tree.TreeNode({
		  cls:'feeds-node',
		  text:''
	  });
	  var myroot4 = new Ext.tree.TreeNode({
			cls : 'feeds-node',
			text : ''
		});
	  var myroot5 = new Ext.tree.TreeNode({
		  cls:'feeds-node',
		  text:''
	  });
	  var mypage= new Ext.tree.TreeNode({
		 id:'mypage',
		 iconCls:'button_tree',
		 text:'选品管理',
		 listeners:{
			 'click':function(node,event){
				 var id = "mypage";
				 var oldId = Ext.getCmp(id);
				 if(oldId == undefined){
					 Ext.getCmp('modeltreepanel').add({
						 title:'网站页面管理',
						 id:id,
						 closable:true, 
						 html:'<iframe width="100%" height="100%" align="center" frameborder="0" src="${ctx}/jsp/channel.jsp"></iframe>'
					 });
					 
				 }
				 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
			 }
			 
		 }
	  });
	  
	  var navpage= new Ext.tree.TreeNode({
			 id:'navpage',
			 iconCls:'button_tree',
			 text:'左侧导航管理',
			 listeners:{
				 'click':function(node,event){
					 var id = "navpage";
					 var oldId = Ext.getCmp(id);
					 if(oldId == undefined){
						 Ext.getCmp('modeltreepanel').add({
							 title:'左侧导航管理',
							 id:id,
							 closable:true, 
							 html:'<iframe width="100%" height="100%" align="center" frameborder="0" src="${ctx}/jsp/navigation.jsp"></iframe>'
						 });
						 
					 }
					 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
				 }
				 
			 }
		  });
	  // add by zhangshenglong
	  var navsort= new Ext.tree.TreeNode({
			 id:'navsort',
			 iconCls:'button_tree',
			 text:'频道分类导航',
			 listeners:{
				 'click':function(node,event){
					 var id = "channelsort";
					 var oldId = Ext.getCmp(id);
					 if(oldId == undefined){
						 Ext.getCmp('modeltreepanel').add({
							 title:'频道分类导航',
							 id:id,
							 closable:true, 
							 html:'<iframe width="100%" height="100%" align="center" frameborder="0" src="${ctx}/jsp/navsort.jsp"></iframe>'
						 });
						 
					 }
					 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
				 }
				 
			 }
		  });
	  
	  
	  
	  
	  
	  var photorule= new Ext.tree.TreeNode({
			 id:'photorule',
			 iconCls:'button_tree',
			 text:'拍照规则管理',
			 listeners:{
				 'click':function(node,event){
					 var id = "photorule";
					 var oldId = Ext.getCmp(id);
					 if(oldId == undefined){
						 Ext.getCmp('modeltreepanel').add({
							 title:'拍照规则管理',
							 id:id,
							 closable:true, 
							 html:'<iframe width="100%" height="100%" align="center" frameborder="0" src="${ctx}/jsp/photorule.jsp"></iframe>'
						 });
						 
					 }
					 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
				 }
				 
			 }
		  });
	  
	  var resource= new Ext.tree.TreeNode({
			 id:'resource',
			 iconCls:'button_tree',
			 text:'资源管理',
			 listeners:{
				 'click':function(node,event){
					 var id = "resource";
					 var oldId = Ext.getCmp(id);
					 if(oldId == undefined){
						 Ext.getCmp('modeltreepanel').add({
							 title:'资源管理',
							 id:id,
							 closable:true, 
							 html:'<iframe width="100%" height="100%" align="center" frameborder="0" src="${ctx}/jsp/resource.jsp"></iframe>'
						 });
						 
					 }
					 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
				 }
				 
			 }
		  });
	  
	  var role= new Ext.tree.TreeNode({
			 id:'role',
			 iconCls:'button_tree',
			 text:'角色管理',
			 listeners:{
				 'click':function(node,event){
					 var id = "role";
					 var oldId = Ext.getCmp(id);
					 if(oldId == undefined){
						 Ext.getCmp('modeltreepanel').add({
							 title:'角色管理',
							 id:id,
							 closable:true, 
							 html:'<iframe width="100%" height="100%" align="center" frameborder="0" src="${ctx}/jsp/role.jsp"></iframe>'
						 });
						 
					 }
					 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
				 }
				 
			 }
		  });
	  
	  //闪购系统维护
	  var flashpromotionmanage= new Ext.tree.TreePanel({
				title : '闪购系统维护',
				id:'falshsystemmaintain',
				split : true,
				margins : '0 0 5 5',
				rootVisible : false,
				lines : false,
				autoScroll : true,
				root : {
					cls : 'feeds-node',
					text : '',
					expanded : true,
					children : [ 
								{
						  text: "闪购活动管理",
						  iconCls:'button_tree',
						  leaf: true,
						  listeners:{
								 'click':function(node,event){
									 var id = "FlashPromotionView";
									 var oldId = Ext.getCmp(id);
									 if (oldId == undefined) {
									 	if(isAuthorized(id)){
											 Ext.getCmp('modeltreepanel').add(new FlashPromotionView({
											 closable:true
										 }));
											 }else{
												 Ext.ux.Toast.msg("提示信息", "您没有此权限!");
											 }
										 
									 }
									 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
								 }
						  }
					  }
					]

				}
			});
		  	  var ordermanage = new Ext.tree.TreePanel(
				{
					title : '订单管理',
					id:'ordermanage',
					split : true,
					margins : '0 0 5 5',
					rootVisible : false,
					lines : false,
					autoScroll : true,
					root : {
						cls : 'feeds-node',
						text : '',
						expanded : true,
						children : [{
							text : "业务字典管理",
							id:'bizdictmanage',
							iconCls : 'button_tree',
							expanded : true,
							children : [
									{
										id : 'businesstype',
										iconCls : 'button_tree',
										leaf : true,
										text : '业务类型',
										listeners : {
											'click' : function(node, event) {
												var id = "businesstype";
												var oldId = Ext.getCmp(id);
												
												if (oldId == undefined) {
													if(isAuthorized(id)){
											  			Ext.getCmp('modeltreepanel').add(
																	{
																		title : '业务类型',
																		id : id,
																		closable : true,
																		html : '<iframe width="100%" height="100%" align="center" frameborder="0" src="${ctx}/jsp/businesstype.jsp"></iframe>'
																	});
											 		}else{
												 		Ext.ux.Toast.msg("提示信息", "您没有此权限!");
											 		}
													

												}
												Ext.getCmp('modeltreepanel')
														.setActiveTab(
																Ext.getCmp(id));
											}

										}
									},
									{
										id : 'itemtype',
										iconCls : 'button_tree',
										leaf : true,
										text : '类型项',
										listeners : {
											'click' : function(node, event) {
												var id = "itemtype";
												var oldId = Ext.getCmp(id);
												if(true){
												if (oldId == undefined) {
													if(isAuthorized(id)){
											  			Ext.getCmp('modeltreepanel').add(
																	{
																		title : '类型项',
																		id : id,
																		closable : true,
																		html : '<iframe width="100%" height="100%" align="center" frameborder="0" src="${ctx}/jsp/itemtype.jsp"></iframe>'
																	});
											 		}else{
												 		Ext.ux.Toast.msg("提示信息", "您没有此权限!");
												 	}

												}
												}
												Ext.getCmp('modeltreepanel')
														.setActiveTab(
																Ext.getCmp(id));
											}

										}
									}

							]
							},
							{
							text : "OMS管理",
							id:'omsmanage',
							iconCls : 'button_tree',
							expanded : true,
							children : [{
							  text: "订单列表",
							  id:'orderlists',
							  iconCls:'button_tree',
							  leaf: true,
							  listeners:{
									 'click':function(node,event){
										 var id = "OrderListView";
										 var oldId = Ext.getCmp(id);
										 if (oldId == undefined) {
										 	if(isAuthorized(id)){
											  Ext.getCmp('modeltreepanel').add(new OrderListView({
												  closable:true
												}));
											 }else{
												 Ext.ux.Toast.msg("提示信息", "您没有此权限!");
											 }
										 }
										 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
									 }
							  }
						  },{
							  text: "销售单列表",
							  id:'salelists',
							  iconCls:'button_tree',
							  leaf: true,
							  listeners:{
									 'click':function(node,event){
										 var id = "SaleOrderListView";
										 var oldId = Ext.getCmp(id);
										 if (oldId == undefined) {
										 	if(isAuthorized(id)){
											  Ext.getCmp('modeltreepanel').add(new SaleOrderListView({
												  closable:true
												}));
											 }else{
												 Ext.ux.Toast.msg("提示信息", "您没有此权限!");
											 }
										 }
										 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
									 }
							  }
						  },{
							  text: "SAP销售单记录",
							  id:'sapsalesofsinglerecord',
							  iconCls:'button_tree',
							  leaf: true,
							  listeners:{
									 'click':function(node,event){
										 var id = "SapSaleRecordView";
										 var oldId = Ext.getCmp(id);
										 if (oldId == undefined) {
										 	if(isAuthorized(id)){
											  Ext.getCmp('modeltreepanel').add(new SapSaleRecordView({
												  closable:true
												}));
											 }else{
												 Ext.ux.Toast.msg("提示信息", "您没有此权限!");
											 }
					
										 }
										 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
									 }
							  }
						  },{
							  text: "退货单列表",
							  id:'mrblists',
							  iconCls:'button_tree',
							  leaf: true,
							  listeners:{
									 'click':function(node,event){
										 var id = "OrderRefundListView";
										 var oldId = Ext.getCmp(id);
										 if (oldId == undefined) {
										 	if(isAuthorized(id)){
											  Ext.getCmp('modeltreepanel').add(new OrderRefundListView({
												  closable:true
												}));
											 }else{
												 Ext.ux.Toast.msg("提示信息", "您没有此权限!");
											 }
										 }
										 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
									 }
							  }
						  },{
							  text: "退货申请单列表",
							  id:'returnapplylists',
							  iconCls:'button_tree',
							  leaf: true,
							  listeners:{
									 'click':function(node,event){
										 var id = "ReturnApplyView";
										 var oldId = Ext.getCmp(id);
										 if (oldId == undefined) {
										 	if(isAuthorized(id)){
											  Ext.getCmp('modeltreepanel').add(new ReturnApplyView({
												  closable:true
												}));
											 }else{
												 Ext.ux.Toast.msg("提示信息", "您没有此权限!");
											 }
								
										 }
										 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
									 }
							  }
						  },{
							  text: "POS销售记录",
							  id:'possalesrecord',
							  iconCls:'button_tree',
							  leaf: true,
							  listeners:{
									 'click':function(node,event){
										 var id = "PosRecordView";
										 var oldId = Ext.getCmp(id);
										 if (oldId == undefined) {
										 	if(isAuthorized(id)){
											  Ext.getCmp('modeltreepanel').add(new PosRecordView({
												  closable:true
												}));
											 }else{
												 Ext.ux.Toast.msg("提示信息", "您没有此权限!");
											 }
									
										 }
										 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
									 }
							  }
						  }
							
							] 
							}
							,						
							{
							text : "PAD管理",
							id:'padmanage',
							iconCls : 'button_tree',
							expanded : true, 
							children : [{
							  text: "PAD销售单列表",
							  id:'padsalelists',
							  iconCls:'button_tree',
							  leaf: true,
							  listeners:{
									 'click':function(node,event){
										 var id = "SaleOrderForPadListView";
										 var oldId = Ext.getCmp(id);
										 if (oldId == undefined) {
										 	if(isAuthorized(id)){
											  Ext.getCmp('modeltreepanel').add(new SaleOrderForPadListView({
												  closable:true
												}));
											 }else{
												 Ext.ux.Toast.msg("提示信息", "您没有此权限!");
											 }
										 }
										 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
									 }
							  }
						  },{
							  text: "PAD退货申请单表",
							  id:'padreturnapplylists',
							  iconCls:'button_tree',
							  leaf: true,
							  listeners:{
									 'click':function(node,event){
										 var id = "ReturnApplyForPadView";
										 var oldId = Ext.getCmp(id);
										 if (oldId == undefined) {
										 	if(isAuthorized(id)){
											  Ext.getCmp('modeltreepanel').add(new ReturnApplyForPadView({
												  closable:true
												}));
											 }else{
												 Ext.ux.Toast.msg("提示信息", "您没有此权限!");
											 }
										 }
										 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
									 }
							  }
						  }
							
							] 
							},
							{
							text : "物流管理",
							id:'logismanage',
							iconCls : 'button_tree',
							expanded : true,
							children : [{
							  text: "物流订单列表",
							  id:'logisorderlists',
							  iconCls:'button_tree',
							  leaf: true,
							  listeners:{
									 'click':function(node,event){
										 var id = "OrderListForLogisView";
										 var oldId = Ext.getCmp(id);
										 if (oldId == undefined) {
										 	if(isAuthorized(id)){
											  Ext.getCmp('modeltreepanel').add(new OrderListForLogisView({
												  closable:true
												}));
											 }else{
												 Ext.ux.Toast.msg("提示信息", "您没有此权限!");
											 }
											
										 }
										 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
									 }
							  }
						  },{
							  text: "物流销售单表",
							  id:'logissalelists',
							  iconCls:'button_tree',
							  leaf: true,
							  listeners:{
									 'click':function(node,event){
										 var id = "SaleOrderListForLogisView";
										 var oldId = Ext.getCmp(id);
										 if (oldId == undefined) {
										 	if(isAuthorized(id)){
											  Ext.getCmp('modeltreepanel').add(new SaleOrderListForLogisView({
												  closable:true
												}));
											 }else{
												 Ext.ux.Toast.msg("提示信息", "您没有此权限!");
											 }
						
										 }
										 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
									 }
							  }
						  },{
							  text: "物流退货申请单表",
							  id:'logisreturnapplylists',
							  iconCls:'button_tree',
							  leaf: true,
							  listeners:{
									 'click':function(node,event){
										 var id = "ReturnApplyForLogisView";
										 var oldId = Ext.getCmp(id);
										 if (oldId == undefined) {
										 	if(isAuthorized(id)){
											  Ext.getCmp('modeltreepanel').add(new ReturnApplyForLogisView({
												  closable:true
												}));
											 }else{
												 Ext.ux.Toast.msg("提示信息", "您没有此权限!");
											 }
						
										 }
										 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
									 }
							  }
						  }
							
							]   
							  },{
								  	text : "顾客操作模拟",
								  	id:'adminmanage',
									iconCls : 'button_tree',
									expanded : true,
									children : [{
									text: "顾客订单表",
									id:'adminorderlists',
									iconCls:'button_tree',
									leaf: true,
									listeners:{
										 'click':function(node,event){
											 var id = "OrderListViewForAdmin";
											 var oldId = Ext.getCmp(id);
											 if (oldId == undefined) {
											 if(isAuthorized(id)){
											  Ext.getCmp('modeltreepanel').add(new OrderListViewForAdmin({
												  closable:true
												}));
											 }else{
												 Ext.ux.Toast.msg("提示信息", "您没有此权限!");
											 }
											
											 }
											 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
										 }
									}
								},{
									text: "顾客退货申请单表",
									id:'adminreturnapplylists',
									iconCls:'button_tree',
									leaf: true,
									listeners:{
										 'click':function(node,event){
											 var id = "ReturnApplyViewForAdmin";
											 var oldId = Ext.getCmp(id);
											 if (oldId == undefined) {
											 if(isAuthorized(id)){
											  Ext.getCmp('modeltreepanel').add(new ReturnApplyViewForAdmin({
												  closable:true
												}));
											}else{
												 Ext.ux.Toast.msg("提示信息", "您没有此权限!");
											}
											 }
											 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
										 }
									}
								}]},{
							  	text : "财务管理",
							  	id:'financemanage',
								iconCls : 'button_tree',
								expanded : true,
								children : [{
							  text: "财务退货申请单表",
							  id:'financereturnapplylists',
							  iconCls:'button_tree',
							  leaf: true,
							  listeners:{
									 'click':function(node,event){
										 var id = "ReturnApplyForFinanView";
										 var oldId = Ext.getCmp(id);
										 if (oldId == undefined) {
										 if(isAuthorized(id)){
											  Ext.getCmp('modeltreepanel').add(new ReturnApplyForFinanView({
												  closable:true
												}));
											}else{
												 Ext.ux.Toast.msg("提示信息", "您没有此权限!");
											}
										 }
										 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
									 }
							  }
						  }
								
								]
							  },{
							  	text : "客服管理",
							  	id:'servicemanage',
								iconCls : 'button_tree',
								expanded : true,
								children : [{
							  text: "客服订单表",
							  id:'serviceorderlists',
							  iconCls:'button_tree',
							  leaf: true,
							  listeners:{
									 'click':function(node,event){
										 var id = "OrderListForServiceView";
										 var oldId = Ext.getCmp(id);
										 if (oldId == undefined) {
										 if(isAuthorized(id)){
											  Ext.getCmp('modeltreepanel').add(new OrderListForServiceView({
												  closable:true
												}));
											}else{
												 Ext.ux.Toast.msg("提示信息", "您没有此权限!");
											}
										 }
										 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
									 }
							  }
						  },{
							  text: "客服退货申请单表",
							  id:'servicereturnapplylists',
							  iconCls:'button_tree',
							  leaf: true,
							  listeners:{
									 'click':function(node,event){
										 var id = "ReturnApplyForServiceView";
										 var oldId = Ext.getCmp(id);
										 if (oldId == undefined) {
										 if(isAuthorized(id)){
												 	 Ext.getCmp('modeltreepanel').add(new ReturnApplyForServiceView({
														 closable:true
													 }));
												 	}else{
												 		Ext.ux.Toast.msg("提示信息", "您没有此权限!");
												 	}
										 }
										 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
									 }
							  }
						  }]
							  }
						]

					}
				});
		//财务管理
		var financemanage = new Ext.tree.TreePanel({
						title : '财务管理',
						id:'financemanage',
						split : true,
						margins : '0 0 5 5',
						rootVisible : false,
						lines : false,
						autoScroll : true,
						root : {
							cls : 'feeds-node',
							text : '',
							expanded : true,
							children : [{
								text : "财务管理",
								iconCls : 'button_tree',
								expanded : true,
								children : [{
									  text: "财务退货退款确认表",
									  iconCls:'button_tree',
									  leaf: true,
									  listeners:{
											 'click':function(node,event){
												 var id = "ReturnApplyForFinan1View";
												 var oldId = Ext.getCmp(id);
												 if (oldId == undefined) {
												 	if(isAuthorized(id)){
												 	 Ext.getCmp('modeltreepanel').add(new ReturnApplyForFinan1View({
														 closable:true
													 }));
												 	}else{
												 		Ext.ux.Toast.msg("提示信息", "您没有此权限!");
												 	}
												 }
												 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
											}
									}
								},{
									  text: "订单支付",
									  iconCls:'button_tree',
									  leaf: true,
									  listeners:{
											 'click':function(node,event){
												 var id = "PayOrderView";
												 var oldId = Ext.getCmp(id);
												 if (oldId == undefined) {
												 	if(isAuthorized(id)){
												 	  Ext.getCmp('modeltreepanel').add(new PayOrderView({
														 closable:true
													 }));
												 	}else{
												 		Ext.ux.Toast.msg("提示信息", "您没有此权限!");
												 	}
													
												 }
												 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
											 }
									  }
								  },{
									  text: "销售单POS流水查询",
									  iconCls:'button_tree',
									  leaf: true,
									  listeners:{
											 'click':function(node,event){
												 var id = "SaleForFinanView";
												 var oldId = Ext.getCmp(id);
												 if (oldId == undefined) {
												 	if(isAuthorized(id)){
												 	  Ext.getCmp('modeltreepanel').add(new SaleForFinanView({
														 closable:true
													 }));
												 	}else{
												 		Ext.ux.Toast.msg("提示信息", "您没有此权限!");
												 	}
													
												 }
												 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
											 }
									  }
								  }]
							}]
						}
		});
		 //搜索管理
		 var searchmanage = new Ext.tree.TreePanel({
		  title: "搜索管理",
		  id:'searchmanage',
		  split: true,
		  margins: "0 0 5 5",
		  rootVisible: false,
		  lines: false,
		  autoScroll: true,
		  root: {
			  cls:'feeds-node',
			  text:'',
			  expanded: true,
			  children: [{
				  text: "热词管理",
				  id:'hotwordmanage',
				  iconCls:'button_tree',
				  expanded: true,
				  children: [{
					  text: "热词词库",
					  id:'hotwordthesaurus',
					  iconCls:'button_tree',
					  leaf: true,
					  listeners:{
							 'click':function(node,event){
								 var id = "HotKeyView";
								 var oldId = Ext.getCmp(id);
								 if (oldId == undefined) {
								 	if(isAuthorized(id)){
								 	 Ext.getCmp('modeltreepanel').add(new HotKeyView({
										 closable:true
									 }));
								 	}else{
								 		Ext.ux.Toast.msg("提示信息", "您没有此权限!");
								 	}
									
								 }
								 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
							 }
					  }
				  }, {
					  text: "热词配置",
					  id:'hotwordconfigmg',
					  iconCls:'button_tree',
					  leaf: true,
					  listeners:{
							 'click':function(node,event){
								 var id = "HotKeyConfigView";
								 var oldId = Ext.getCmp(id);
								 if (oldId == undefined) {
								 if(isAuthorized(id)){
								 	 Ext.getCmp('modeltreepanel').add(new HotKeyConfigView({
										 closable:true
									 }));
								 	}else{
								 		Ext.ux.Toast.msg("提示信息", "您没有此权限!");
								 	}
									 
								 }
								 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
							 }
					  }
				  }]
			  },{
				  text: "索引规则管理",
				  id:'indexrulemanage',
				  iconCls:'button_tree',
				  expanded: true,
				  children: [{
					  text: "索引规则定义",
					  id:'indexruledefine',
					  iconCls:'button_tree',
					  leaf: true,
					  listeners:{
							 'click':function(node,event){
								 var id = "IndexRegularView";
								 var oldId = Ext.getCmp(id);
								 if (oldId == undefined) {
								 	if(isAuthorized(id)){
								 	 Ext.getCmp('modeltreepanel').add(new IndexRegularView({
										 closable:true
									 }));
								 	}else{
								 		Ext.ux.Toast.msg("提示信息", "您没有此权限!");
								 	}
								 }
								 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
							 }
					  }
				  }, {
					  text: "索引规则明细",
					  id:'indexruledetil',
					  iconCls:'button_tree',
					  leaf: true,
					  listeners:{
							 'click':function(node,event){
								 var id = "IndexDetailView";
								 var oldId = Ext.getCmp(id);
								 if (oldId == undefined) {
								 	if(isAuthorized(id)){
								 	 Ext.getCmp('modeltreepanel').add(new IndexDetailView({
										 closable:true
									 }));
								 	}else{
								 		Ext.ux.Toast.msg("提示信息", "您没有此权限!");
								 	}
								 }
								 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
							 }
					  }
				  }]
			  }, {
				  text: "商品排序管理",
				  id:'commoditysortmanage',
				  iconCls:'button_tree',
				  expanded: true,
				  children: [{
					  text: "商品排序权重配置",
					  id:'commoditysortconfig',
					  iconCls:'button_tree',
					  leaf: true,
					  listeners:{
							 'click':function(node,event){
								 var id = "productSortWeightView";
								 var oldId = Ext.getCmp(id);
								 if (oldId == undefined) {
								 	if(isAuthorized(id)){
								 	 Ext.getCmp('modeltreepanel').add(new ProductSortWeightView({
										 closable:true
									 }));
								 	}else{
								 		Ext.ux.Toast.msg("提示信息", "您没有此权限!");
								 	}
								 }
								 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
							 }
					  }
				  }, {
					  text: "商品点击管理",
					  id:'commodclikmanage',
					  iconCls:'button_tree',
					  leaf: true,
					  listeners:{
							 'click':function(node,event){
								 var id = "productHitView";
								 var oldId = Ext.getCmp(id);
								 if (oldId == undefined) {
								 	if(isAuthorized(id)){
								 	 Ext.getCmp('modeltreepanel').add(new ProductHitView({
										 closable:true
									 }));
								 	}else{
								 		Ext.ux.Toast.msg("提示信息", "您没有此权限!");
								 	}
								 }
								 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
							 }
					  }
				  }]
			  }, {
				  text: "索引重建",
				  id:'indexreestablish',
				  iconCls:'button_tree',
				  leaf: true,
				  listeners:{
						 'click':function(node,event){
							 var id = "ReindexAllView";
							 var oldId = Ext.getCmp(id);
							 if (oldId == undefined) {
							 	if(isAuthorized(id)){
								 	 Ext.getCmp('modeltreepanel').add(new ReindexAllView({
										 closable:true
									 }));
								 	}else{
								 		Ext.ux.Toast.msg("提示信息", "您没有此权限!");
								 	}
							 }
							 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
						 }
				  }
			  }, {
				  text: "索引关键词",
				  id:'indexkeywords',
				  iconCls:'button_tree',
				  leaf: true,
				  listeners:{
						 'click':function(node,event){
							 var id = "solrKeywordView";
							 var oldId = Ext.getCmp(id);
							 if (oldId == undefined) {
							 	if(isAuthorized(id)){
								 	 Ext.getCmp('modeltreepanel').add(new SolrKeywordView({
										 closable:true
									 }));
								 	}else{
								 		Ext.ux.Toast.msg("提示信息", "您没有此权限!");
								 	}
							 }
							 Ext.getCmp('modeltreepanel').setActiveTab(Ext.getCmp(id));
						 }
				  }
			  }]
		  }
	  });
	//权限管理
		var userRole = new Ext.tree.TreeNode(
				{
					id:'userRole',
					iconCls :'button_tree',
					leaf : true,
					text :'用户角色',
					listeners : {
						'click' : function(node, event) {
							var id = "userRole";
							var oldId = Ext.getCmp(id);
							if (oldId == undefined) {
								Ext
										.getCmp('modeltreepanel')
										.add(
												{
													title : '角色 列表',
													id : id,
													closable : true,
													html : '<iframe width="100%" height="100%" align="center" frameborder="0" src="${ctx}/jsp/userRole.jsp"></iframe>'
												});
							}
							Ext.getCmp('modeltreepanel').setActiveTab(
									Ext.getCmp(id));
						}

					}
				});
		var roleResource = new Ext.tree.TreeNode(
				{
					id:'roleResource',
					iconCls : 'button_tree',
					leaf : true,
					text : '权限资源',
					listeners : {
						'click' : function(node, event) {
							var id = "roleResource";
							var oldId = Ext.getCmp(id);
							if (oldId == undefined) {
								Ext.getCmp('modeltreepanel')
										.add(
												{
													title : '资源列表',
													id : id,
													closable : true,
													html : '<iframe width="100%" height="100%" align="center" frameborder="0" src="${ctx}/jsp/roleResource.jsp"></iframe>'
												});

							}
							Ext.getCmp('modeltreepanel').setActiveTab(
									Ext.getCmp(id));
						}

					}
				});	 
		 
	 var rolechilds=Array();
	 if(isAuthorized(role.id)){rolechilds.push(role);}
	 if(isAuthorized(resource.id)){rolechilds.push(resource);}
	 
	 
	 var pagechilds=Array();
	 if(isAuthorized(mypage.id)){pagechilds.push(mypage);}
	 if(isAuthorized(navpage.id)){pagechilds.push(navpage);}
	 if(isAuthorized(navsort.id)){pagechilds.push(navsort)}
	
	 
	 
	 var outhchilds = Array();
	 if(isAuthorized(userRole.id)){outhchilds.push(userRole);}
	 if(isAuthorized(roleResource.id)){outhchilds.push(roleResource);}
	 var photorules = Array();
	 if(isAuthorized(photorule.id)){photorules.push(photorule)}
	  myroot1.appendChild(pagechilds);
	  myroot2.appendChild(photorules);
	  myroot3.appendChild(rolechilds);
	  myroot4.appendChild(outhchilds);
	  //网站页面管理
	  var pagemanage = new Ext.tree.TreePanel({
		  title:'网站页面管理',
		  id:'webpagemanage',
		  split:true,
		  margins:'0 0 5 5',
		  rootVisible:false,
		  lines:false,
		  autoScroll:true,
		  root:myroot1
	  });
	  
	//拍照规则
	  var photorulemanage = new Ext.tree.TreePanel({
		  title:'拍照规则管理',
		  id:'photorulemanage',
		  split:true,
		  margins:'0 0 5 5',
		  rootVisible:false,
		  lines:false,
		  autoScroll:true,
		  root:myroot2
	  });
	
	  var resourcemanage = new Ext.tree.TreePanel({
		  title:'网站权限管理',
		  id:'webouthmanage',
		  split:true,
		  margins:'0 0 5 5',
		  rootVisible:false,
		  lines:false,
		  autoScroll:true,
		  root:myroot3
	  });
	  //权限管理 
		var outhmanage = new Ext.tree.TreePanel( {
			title : '权限管理',
			id : 'outhmanage',
			split : true,
			margins : '0 0 5 5',
			rootVisible : false,
			lines : false,
			autoScroll : true,
			root : myroot4
		});
		
	  var allResources = Array();
	  if(isAuthorized(pagemanage.id)){allResources.push(pagemanage);}
	  if(isAuthorized(photorulemanage.id)){allResources.push(photorulemanage);}
	  if(isAuthorized(resourcemanage.id)){allResources.push(resourcemanage);}
	  if(isAuthorized(searchmanage.id)){allResources.push(searchmanage);}
	  if(isAuthorized(ordermanage.id)){allResources.push(ordermanage);}
	  if(isAuthorized(financemanage.id)){allResources.push(financemanage);}
	  if(isAuthorized(flashpromotionmanage.id)){allResources.push(flashpromotionmanage);}
	  if(isAuthorized(outhmanage.id)){allResources.push(outhmanage);}

	  var navigtion = new  Ext.Panel({
		  id:'navi-tree',
		  region:'west',
		  margins:'2 2 2 2',
		  layout:'accordion',
		  collapsible: true,
		  title:'后台管理',
		  width:150,
		  minSize: 75,
		  maxSize: 150,
		  split:true,
		  layoutConfig:{animate:true},

		  items:[allResources]

	  });
	  
	  
	  new Ext.Viewport({
		  layout:'border',
		  items:[
		         {
		        	 region:'north',//顶部面板
		        	 xtype:'panel',
		        	 id:'northpanel',
		        	 height:60,
		        	 layout:'hbox',
		        	 items:[
		        	        {
		        	        	flex:8,
		        	        	html:'<iframe width="100%" height="100%" align="center" frameborder="0" src="'+'${ctx}'+'/systemhead.jsp'+'"></iframe>',
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
		 			activeTab: 0,
		 			items:[
		 			       {
		 			    	   title:'欢迎',
		 			    	  html:'<p align="center" width="100%" height="100%"><font size=12>欢迎进入后台管理系统</font></p>'
		 			       }]
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


<%-- 解决上传图片后返回值的编码格式，否则返回failure--%>
<script type="text/javascript">

        Ext.USE_NATIVE_JSON = true;
        window.JSON = {
            "stringify":Ext.util.JSON.doEncode,
            "parse":function(json){
                var str = json;
                var spos = str.indexOf(">");
                var epos = 0;
                if(spos != -1){
                     epos = str.indexOf("<",spos);
                    str = str.substr(spos+1,epos-spos-1);
                }
                return eval("("+str+")");
            },

            "toString":function(){
                return '[object JSON]';
            }

        };

    </script>

</head>
<body>

</body>
</html>