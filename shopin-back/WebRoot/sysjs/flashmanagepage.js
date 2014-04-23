//栏目列表扩展
Flashmanagepage = Ext.extend(Ext.Window,{
	treepanel : null,
	gridpanel : null,
	constructor : function(a){
		if(a == null) {
			a = {};
		}
		Ext.apply(this, a);
		//////alert(this.channelSid);
		this.initComponents();
		//////alert(this.channelSid);
		Flashmanagepage.superclass.constructor.call(this,{
			id:'pagelayoutwin',
			layout:'column',
			items:[{
				columnWidth:0.2,
				items:[
				       this.treepanel
				       ]
			},{
				columnWidth:0.8,
				items:[
				       this.gridpanel
				       ]
			}],
			modal : true,
			height : document.documentElement.clientHeight-100,
			width : document.documentElement.clientWidth-100,
			title : "闪购栏目列表"
		});
	},
	initComponents : function(){
		////alert(this.channelSid + "!-----------");
		 var sid = this.PageLayoutSid;
		var loader = new Ext.tree.TreeLoader({
			 url:__ctxPath +"/flashPageLayout/tree?pageLayoutSid=" + sid		 
		 });
		 loader.on('beforeload', function(loader, node) {
			    ////alert(node.id);
			    loader.baseParams = {
						_method : "POST",
						nodeId : node.id
					    //pageLayoutSid:this.channelSid	
				};
			});

		//var pageLayoutSid="";
		this.treepanel = new Ext.tree.TreePanel({
			id:'flashTree',
			title:'闪购栏目管理',
			collapsible : true,
			split : true,
			height : document.documentElement.clientHeight-73,
			region:'west',
			autoScroll : true,
       		animate : true,
       		containerscroll: true,
       		enableDragDrop:true,
			border : true,
			loader : loader,
			root:new Ext.tree.AsyncTreeNode({id:sid,text:'栏目',leaf:false}),
			rootVisible : true,
			//selModel: new Ext.tree.MultiSelectionModel(),
			listeners:{
				'click':function(node){
//					alert(node.getDepth()+1);
					pageName=node.attributes.pageName;
					pageLayoutSid=node.attributes.id;
					store.removeAll();
					store.load({
					params:{
						_method : "POST",
						pageLayoutSid:pageLayoutSid
							}
					});  
					
				}
			}
		});
		
		 var pageTemplateStore = new Ext.data.JsonStore({
          	url : __ctxPath + "/flashPageLayoutTemplate/queryAllTemplates",
          	root : "list",
           	baseParams : {
	             	_method : "POST"
		
      	          },
	
            	remoteSort : true,
             autoLoad:true,
	            fields : [
	                  	"sid",
	              		"name"
	                ]
               });
		
		var contextMenu = new Ext.menu.Menu({
								items: [
									{ text: '添加栏目',handler: insertPageLayoutHandler},
									{text: '编辑栏目', handler: editPageLayoutHandler},
									{text: '删除栏目',handler: deletePageLayoutHandler}
								]
							});
		this.treepanel.on('contextmenu', treeContextHandler);

		function treeContextHandler(node) {
					node.select();
					contextMenu.show(node.ui.getAnchor());
		}
		
		function insertPageLayoutHandler() {
			var selectedNode = Ext.getCmp('flashTree').getSelectionModel().getSelectedNode(); 
		//	alert(selectedNode.getDepth())
			if(selectedNode.getDepth()==0){
			var insertForm =new Ext.Window({
				modal : true,
				width:400,
				heght:800,
				id:'insertForm',
				buttonAlign:'center',
				items:[{
					xtype:'form',
					width:500,
					id:"addForm",
					title:'添加栏目',
					frame:true,
					items:[{
						xtype:'textfield',
						fieldLabel:'栏目标题',
						id:'title',
						//value:selectedNode.text,
						allowBlank:false
					},{
						xtype:'textfield',
						fieldLabel:'栏目链接',
						//name:'link',
						id:'titleLink'
						
					},
					{
						xtype:'combo',
						fieldLabel:'栏目模板',
						name:'model',
						id:'pageTemplate',
    					mode:'local',
    					hiddenName:"pageTemplateSid",
    					valueField: 'sid',
    					displayField:'name',
    					allowBlank: false,
						store:pageTemplateStore,
						anchor:"50%",
						triggerAction : 'all'
					},
//					{
//						xtype:'combo',
//						fieldLabel:'商品链接',
//						name:'link'
//						
//					},
					{
						xtype:'datetimefield',
						fieldLabel:'开始时间',
						name:'stratTime',
						id:'stratTime',
						format:"H:i"
						
						
					},{
						xtype:'datetimefield',
						fieldLabel:'结束时间',
						name:'endTime',
						id:'endTime',
						format:"H:i",
						validationEvent : 'blur',
				         validationOnChange : false,
				         validator : function(value){
				       		var aa = Ext.getCmp('addForm').form.findField("stratTime").getValue();
				       		var gedt = Ext.util.Format.date(aa, 'Y-m-d H:i:s');
				       		if(value<gedt){
				       		 
				       		 	Ext.Msg.alert("信息提示","结束时间应大于开始时间");
				       		 }
				       }
						
					}]
					}],
					buttons:[{
						text:'保存',
						handler:function(){
				              
				　　　　　　　　　　　Ext.Ajax.request({
				　　　　　　　　　　　　　　url:　 __ctxPath + "/flashPageLayout/insertFlashPageLayout",
				
								  params : {
										
										_method : "POST",
										pageLayoutSid:selectedNode.id,
										title:Ext.get('title').dom.value,
										titleLink:Ext.get('titleLink').dom.value,
										pageLayoutTemplateSid:Ext.getCmp('pageTemplate').getValue(),
										startTime:Ext.get('stratTime').dom.value,
										endTime:Ext.get('endTime').dom.value,
										nodeLevel:"1"
									},
				　　　　　　　　　　　　　　
				　　　　　　　　　　　　　　　success:　function(response)　{
				　　　　　　　　　　　　　　　　　　　Ext.Msg.alert("信息",　"数据更新成功！",　function()　{　
//					
//					                             var path=selectedNode.getPath("id");
//					                             var tree=Ext.getCmp("flashTree");
//					                             tree.expandPath(path,'id',function(bSucess,oLastNode){  
//					                                 tree.getSelectionModel().select(oLastNode);  
//					                               }); 
				                                Ext.getCmp("flashTree").root.reload();  
					                             Ext.getCmp('insertForm').close();
												
				　						});
				　　　　　　　　　　　　　　　},
				　　　　　　　　　　　　　　　　failure:　function(response)　{
				　　　　　　　　　　　　　　　　　　　Ext.Msg.alert("警告",　"数据更新失败，请稍后再试！");
				　　　　　　　　　　　　　　　}
				　　　　　　　　　　　});
				　　　　　　　
						}
					}]
			}).show();
			
		}else if(selectedNode.getDepth()==1){
			
			var insertForm =new Ext.Window({
				width:400,
				heght:800,
				modal : true,
				id:"insertForm",
				buttonAlign:'center',
				items:[{
					xtype:'form',
					width:500,
					id:"addForm",
					title:'添加栏目',
					frame:true,
					items:[{
						xtype:'textfield',
						fieldLabel:'栏目标题',
						id:'title',
						//value:selectedNode.text,
						allowBlank:false
					},{
						xtype:'textfield',
						fieldLabel:'栏目链接',
						//name:'link',
						id:'titleLink'
						
					}]
					}],
					buttons:[{
						text:'保存',
						handler:function(){
				
				　　　　　　　　　　　Ext.Ajax.request({
				　　　　　　　　　　　　　　url:　 __ctxPath + "/flashPageLayout/insertFlashPageLayout",
				
								  params : {
										
										_method : "POST",
										pageLayoutSid:selectedNode.id,
										title:Ext.get('title').dom.value,
										titleLink:Ext.get('titleLink').dom.value,
										nodeLevel:"2"
									},
				　　　　　　　　　　　　　　
				　　　　　　　　　　　　　　　success:　function(response)　{
				　　　　　　　　　　　　　　　　　　　Ext.Msg.alert("信息",　"数据更新成功！",　function()　{　
					                                   Ext.getCmp("flashTree").root.reload();  
                                                        Ext.getCmp('insertForm').close();
												
				　						});
				　　　　　　　　　　　　　　　},
				　　　　　　　　　　　　　　　　failure:　function(response)　{
				　　　　　　　　　　　　　　　　　　　Ext.Msg.alert("警告",　"数据更新失败，请稍后再试！");
				　　　　　　　　　　　　　　　}
				　　　　　　　　　　　});
				　　　　　　　
						}
					}]
			}).show();
		}
		else{
			Ext.Msg.alert("信息提示","此栏目下已有栏目商品或品牌，不可以添加子栏目");
		}
		}	
			
		
		
		function editPageLayoutHandler() {
			var selectedNode = Ext.getCmp('flashTree').getSelectionModel().getSelectedNode(); 
			if(selectedNode.getDepth()==1){
				var insertForm =new Ext.Window({
				width:400,
				modal : true,
				heght:800,
				id:"insertForm",
				buttonAlign:'center',
				items:[{
					xtype:'form',
					width:500,
					id:"editForm",
					title:'编辑栏目',
					frame:true,
					items:[{
						xtype:'textfield',
						fieldLabel:'栏目标题',
						id:'title',
						value:selectedNode.text,
						allowBlank:false
					},{
						xtype:'textfield',
						fieldLabel:'栏目链接',
						value:selectedNode.attributes.titleLink,
						//name:'link',
						id:'titleLink'
						
					},
					{
						xtype:'combo',
						fieldLabel:'栏目模板',
						name:'model',
						id:'pageTemplate',
    					mode:'local',
    					hiddenName:"pageTemplateSid",
    					valueField: 'sid',
    					displayField:'name',
    					store:pageTemplateStore,
    					value:selectedNode.attributes.pageLayoutTemplateSid,
    					allowBlank: false,
    					triggerAction : 'all',
						
						anchor:"50%"
					},
//					{
//						xtype:'combo',
//						fieldLabel:'商品链接',
//						name:'link'
//						
//					},
					{
						xtype:'datetimefield',
						fieldLabel:'开始时间',
						name:'stratTime',
						id:'stratTime',
						value:selectedNode.attributes.startTime,
						format:"H:i"
						
					},{
						xtype:'datetimefield',
						fieldLabel:'结束时间',
						name:'endTime',
						id:'endTime',
						value:selectedNode.attributes.endTime,
						format:"H:i"
						
					}]
					}],
					
					buttons:[{
						text:'保存',
						handler:function(){
							var form = Ext.getCmp('editForm').getForm();
							if(form.isValid){
				　　　　　　　　　　　Ext.Ajax.request({
				　　　　　　　　　　　　　　url:　 __ctxPath + "/flashPageLayout/updateFlashPageLayout",
				
								  params : {
										_method : "POST",
										sid:selectedNode.id,
										title:Ext.get('title').dom.value,
										titleLink:Ext.get('titleLink').dom.value,
										pageLayoutTemplateSid:Ext.getCmp('pageTemplate').getValue(),
										startTime:Ext.get('stratTime').dom.value,
										endTime:Ext.get('endTime').dom.value
									},
				　　　　　　　　　　　　　　
				　　　　　　　　　　　　　　　success:　function(response)　{
				　　　　　　　　　　　　　　　　　　　Ext.Msg.alert("信息",　"数据更新成功！",　function()　{　
					                                 Ext.getCmp("flashTree").root.reload();  
                                                        Ext.getCmp('insertForm').close();
					                              
				　						});
				　　　　　　　　　　　　　　　},
				　　　　　　　　　　　　　　　　failure:　function(response)　{
				　　　　　　　　　　　　　　　　　　　Ext.Msg.alert("警告",　"数据更新失败，请稍后再试！");
				　　　　　　　　　　　　　　　}
				　　　　　　　　　　　});
						}else{
							Ext.Msg.alert("警告",　"必填项为空！");
						}
				　　　　　　　
						}
					}]
			}).show();
			}else{
			var insertForm =new Ext.Window({
				width:400,
				heght:800,
				modal : true,
				id:"insertForm",
				buttonAlign:'center',
				items:[{
					xtype:'form',
					width:500,
					id:"editForm",
					title:'编辑栏目',
					frame:true,
					items:[{
						xtype:'textfield',
						fieldLabel:'栏目标题',
						//name:'title',
						value:selectedNode.text,
						id:'title',
						allowBlank:false
					},{
						xtype:'textfield',
						fieldLabel:'栏目链接',
						//name:'titleLink',
						value:selectedNode.attributes.titleLink,
						id:'titleLink',
						allowBlank:false
						
					}]
					}],
					buttons:[{
						text:'保存',
						handler:function(){
							 var form = Ext.getCmp('editForm').getForm();
							 
							 if(form.isValid){
							　Ext.Ajax.request({
				　　　　　　　　　　　　　　url:　 __ctxPath + "/flashPageLayout/updateFlashPageLayout",
				
								  params : {
										_method : "POST",
										sid:selectedNode.id,
										title:Ext.get('title').dom.value,
										titleLink:Ext.get('titleLink').dom.value
									
									},
				　　　　　　　　　　　　　　
				　　　　　　　　　　　　　　　success:　function(response)　{
				　　　　　　　　　　　　　　　　　　　Ext.Msg.alert("信息",　"数据更新成功！",　function()　{　 
				                                      Ext.getCmp("flashTree").root.reload();  
                                                      Ext.getCmp('insertForm').close();
				　						});
				　　　　　　　　　　　　　　　},
				　　　　　　　　　　　　　　　　failure:　function(response)　{
				　　　　　　　　　　　　　　　　　　　Ext.Msg.alert("警告",　"数据更新失败，请稍后再试！");
				　　　　　　　　　　　　　　　}
				　　　　　　　　　　　});
						}else{
							Ext.Msg.alert("警告",　"必填项为空！");
						}
						}
					}]
			}).show();
			
			}
		}
		
		function deletePageLayoutHandler() {
			var treeNode = Ext.getCmp('flashTree').getSelectionModel().getSelectedNode();
				
				if(treeNode.leaf==true){
				Ext.Msg.show({
					title:'提示消息',
					icon: Ext.MessageBox.QUESTION,
					msg:'确认删除?',
					buttons: Ext.MessageBox.YESNO,
					fn:function(btn){
						if(btn=='yes'){
							Ext.Ajax.request({
							   url: __ctxPath + "/flashPageLayout/delete/"+treeNode.id,
							   _method:'POST',
							   params: { 
									_method : "POST"
								   },
							   success: function(){
							      Ext.Msg.alert('信息提示','删除成功');
							      Ext.getCmp("flashTree").root.reload();
							     },
							     failure: function(){
							          Ext.Msg.alert('信息提示','删除失败，请与管理员联系');
				             	}
				             	
				         	});
						}
						}
					
				});
		}else{
			Ext.Msg.alert('信息提示',"此节点下含有子节点，无法删除");
		}
		}
		
		/*
		  store的url统一为：__ctxPath + "/action"
		  baseParams包含真正的action和_method，对应shopin-back-demo系统controller的注解
		*/
		var store = new  Ext.data.JsonStore({
			url:__ctxPath + "/flashProBestDetail/products",
			root : "result",
			baseParams : {
				_method : "POST"
			},
			totalProperty : "result.totalRecords",
        	idProperty: 'id',
			remoteSort : true,
			dirty:true,
			fields : [
				"id",
				"proSku",
				"proBrand",
				"productName",
				"proOldPrice",
				"proCurPrice",
//				"proPmtPrice",
				"proStock"
//				"shopName",
			//	"orderNumber"
			
			]
		});
		var selectModel = new Ext.grid.CheckboxSelectionModel();
		var columnModel = new Ext.grid.ColumnModel({
//			
			columns:[
			         	selectModel,
			         	new Ext.grid.RowNumberer({
			         		header : "序号",
			         		align:"center",
						 	width : 40,
						 	renderer:function(value,metadata,record,rowIndex){
						  	return 1 + rowIndex;
						  }
			         	}),
//			         		{
//			         		header : "顺序号",
//							width : 15,
//							dataIndex : "orderNumber",
//							hidden:true
//							
//			         	},
			         	{
							header : "编号",
							width : 15,
							dataIndex : "id",
							hidden:true
						},
			         	{
							header : "款号",
							width : 15,
							align:"center",
							dataIndex : "proSku"
						},{
							header : "品牌",
							width : 15,
							align:"center",
							dataIndex : "proBrand"
						},
			         	{
							header : "商品名称",
							width : 15,
							align:"center",
							dataIndex : "productName"
						},
			         	{
			         		header : "原价",
			         		align:"center",
							dataIndex : "proOldPrice",
							width:15
							
			         	},{
							header : "现价",
							align:"center",
							dataIndex : "proCurPrice",
						    width : 15	
						},
//						{
//							header : "活动价",
//							align:"center",
//							dataIndex : "proPmtPrice",
//						    width : 15
//						},
						{
							header : "库存",
							align:"center",
							dataIndex : "proStock",
						    width : 15
						}
//						{
//							header : "门店",
//							align:"center",
//							dataIndex : "shopName",
//						    width : 15
//						}
			         ]
		});

		var selectRowPid = null;
		this.gridpanel= new Ext.grid.GridPanel({
			id : "productslist",
			//autoHeight : true,
			height:document.documentElement.clientHeight-150,
			border : false,
			title : "商品信息",
			region:'center',
			autoScroll : true,
       		containerscroll: true,
       		
       		trackMouseOver : true,
			disableSelection : false,
			enableDragDrop : true,
			ddGroup : 'GridDD',
			enableHdMenu: false,
			stripeRows: false,
			
			store:store,
			cm : columnModel,
			sm : new Ext.grid.CheckboxSelectionModel(),
			//sm : selectModel,
			trackMouseOver : true,
			loadMask : true,
			
		
		
			viewConfig : {
				forceFit : true,
				enableRowBody : false,
				showPreview : false
			},
			bbar:new Ext.Toolbar({
				height:40,
				buttonAlign:'right',
				items:[
				{
					xtype:'button',
					preesed:true,
					height:30,
					width:80,
					align:'center',
					ctCls: 'x-btn-over',
					iconCls: 'button_add',
					text:'增加栏目商品',
					handler:addproduct
					
				},'-',{
					xtype : 'tbspacer'
				},{
					xtype:'button',
					align:'center',
					height:30,
					width:80,
					ctCls: 'x-btn-over',
					iconCls: 'button_del',
					text:'删除栏目商品',
					handler:deleteproduct
				},"-",{
					xtype : 'tbspacer'
				},{
					xtype:'button',
					align:'center',
					height:30,
					width:80,
					ctCls: 'x-btn-over',
					iconCls: 'button_save',
					text:'保存显示顺序',
					handler:function(){
						var modified = store.modified;
						//alert(modified);
						updateData(modified);
					}
				}]
			})
						
		});
		
		
		var cindex = null;
		var rows = null;
	//	var orderNumber=[] ;
	//	var selectProduct = null;
		var grid = Ext.getCmp('productslist');
				grid.addListener('afterrender', afterrender);
				function afterrender() {
					
					var ddrow = new Ext.dd.DropTarget(grid.container, {
								ddGroup : 'GridDD',
								copy : false,
								notifyDrop : function(dd, e, data) {
									selectRowPid=Ext.getCmp('productslist').getSelectionModel().getSelected();
									var sm = grid.getSelectionModel();
									 rows = sm.getSelections();
									var store = grid.getStore();
									cindex = dd.getDragData(e).rowIndex;
									if (cindex == undefined || cindex < 0) {
										e.cancel = true;
										return;
									}
									
									for (i = 0; i < rows.length; i++) {
										var rowData = rows[i];
										if (!this.copy) {
											store.remove(rowData);
											store.insert(cindex, rowData);
											grid.getView().refresh();
										}
								
									}
									
								}
							});
				
				}
		function updateData(modified){

		 var toRowPid=null; 
		 toRowPid= Ext.getCmp('productslist').getSelectionModel().getSelected();

		var json = [];
		Ext.each(modified, function(item) {
			json.push(item.data);
			});
		
		if(selectRowPid!=null&&toRowPid!=null){
			Ext.Ajax.request({
				url:__ctxPath + "/flashProBestDetail/drag",
				params : {
						_method : "POST",
						selectRowPid:selectRowPid.get('id'),
						toRowPid:toRowPid.get('id'),
						pageLayoutSid:pageLayoutSid
					},
					success:function(response){
						Ext.Msg.alert("信息","数据更新成功！",function(){store.reload();});
						},
					failure:function(response){
						Ext.Msg.alert("警告","数据更新失败，请稍后再试！");
						}
					});
			} else {
					Ext.Msg.alert("警告","没有任何需要更新的数据！");
					}
		}
	
				
	
				
		function addproduct(){
			var selectNode = Ext.getCmp('flashTree').getSelectionModel().getSelectedNode();
			///alert("proLink="+selectNode.attributes.proLinktype);
			//alert("parentLink==="+selectNode.attributes.parentLinktype);
			//alert("selectNode.id="+selectNode.id);
			if(selectNode == undefined){
				Ext.Msg.alert("","请选择要操作的栏目");
		//	}else if(selectNode.leaf==true&& (selectNode.attributes.proLinktype==0||selectNode.attributes.parentLinktype==0)){
			}else if(selectNode.leaf==true){
					new AddFlashProductForm({
					pageLayoutSid:selectNode.id
					}).show();
			}else{
					Ext.Msg.alert("","您选择的栏目不可以增加栏目商品");
				
			}
		}
		
	function deleteproduct(){
			
			var record  = Ext.getCmp('productslist').getSelectionModel().getSelections();
			
			 if(record == null || record.length == 0){
				Ext.Msg.alert("","请选择要删除的栏目的商品");
			}else{
				
				Ext.Msg.show({
					title:'提示消息',
					icon: Ext.MessageBox.QUESTION,
					msg:'确认删除?',
					buttons: Ext.MessageBox.YESNO,
					fn:function(btn){
						if(btn=='yes'){
							
							for (var i = 0; i < record.length; i++) {
							
							Ext.Ajax.request({
							   
							   url: __ctxPath + "/flashProBestDetail/deleteproducts",
							   _method:'POST',
							   params: { 
									productsListSid: record[i].get('id'),
									pageLayoutSid:pageLayoutSid
								   },
							   success: function(){
							      Ext.Msg.alert('信息提示','删除成功');
							      store.load({params:{
										//action : "/proBestDetail/products",
										_method : "POST",
										pageLayoutSid:pageLayoutSid
											}
									}); 
							       
							       
							     },
							     failure: function(){
							          Ext.Msg.alert('信息提示','删除失败，请与管理员联系');
				             	}
				             	
				         	});
						};
//					var select = Ext.getCmp('productslist').getSelectionModel().getSelected();
//					//选中行的行号	
//					var Index = Ext.getCmp('productslist').store.indexOf(select);
//					var num = Ext.getCmp('productslist').store.getCount();
//					
//						for (var i = 0; i < (num - 1 - Index); i++) {
//							//根据行号获取删除行以下的数据
//							var orderNum =Ext.getCmp('productslist').store.getAt(i+1+Index).get('orderNumber');
//							var proSku =Ext.getCmp('productslist').store.getAt(i+1+Index).get('proSku');
//							var productsListSid = Ext.getCmp('productslist').store.getAt(i+1+Index).get('sid');
//							Ext.Ajax.request({
//							   
//							   url: __ctxPath + "/proBestDetail/updateProducts",
//							   _method:'POST',
//							   params: { 
//									productsListSid: productsListSid,
//									orderNum:orderNum,
//									pageLayoutSid:pageLayoutSid
//								   }
//							  
//				             	
//				         	});
//						}
						}
					}
				});
				
			}
		}

		
	}
});
Flashmanagepage.clickNode =  function(b){
	if(b!=null){
		////alert(b.sid);
	}
	
}

