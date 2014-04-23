NaviView= Ext.extend(Ext.Panel,{
	treepanel : null,
	gridpanel : null,
	channelpanel:null,
	tablepanel : null,
	constructor:function(a){
		if(a==null){
			a={};
		}
		Ext.apply(this,a);
		this.initComponents();
		NaviView.superclass.constructor.call(this,{
			id:'naviview',
			layout:'column',
			border:false,
			modal:true,
			width:document.documentElement.clientWidth,
			height:document.documentElement.clientHeight,			
			items:[{
				
				columnWidth:0.1,
				items:[
				       this.channelpanel
				       ]
			},
			{
				
				columnWidth:0.15,
				items:[
				       this.treepanel
				       ]
			},{
				
				columnWidth:0.75,
				items:[
				       this.tablepanel
				       ]
			}],
			title:'导航管理',
			renderTo : "mainDiv"
		});	
	},
	initComponents:function(){
		var navSid;
		var channelSid;
		var channeName;
 		 
		var loader = new Ext.tree.TreeLoader({
			 url:__ctxPath +"/channel/channeltree"		 
		 });
		 loader.on('beforeload', function(treeloader, node) {
				treeloader.baseParams = {
					//	action : "/shopChannels/channeltree",
					//	_method : "POST"
				};
			});
	//频道树
		this.channelpanel = new Ext.tree.TreePanel({
			id:'channelTree',
			title:'频道管理',
			collapsible : true,
			split : true,
			height : document.documentElement.clientHeight-30,
			border : true,
			loader : loader,
			root:new Ext.tree.AsyncTreeNode({id:0,text:'频道管理',leaf:false}),
			rootVisible : false,
			listeners:{
				 'click':function(node){
				 	channeName = node.text;
				 	channelSid = node.id;
					
				 	Ext.getCmp("navTree").root.reload();
					//	navtree(node.id,node.text)
			 	}
			 }
		});
		
		 var treeloader = new Ext.tree.TreeLoader({
			 url:__ctxPath +'/navigation/selectList'	 
		 });
		 treeloader.on('beforeload', function(loader, node) {
				loader.baseParams = {
						_method : "POST",
						channelSid:channelSid
				};
			});
		//左侧导航树
		 this.treepanel = new Ext.tree.TreePanel({
				id:'navTree',
				title:'一级导航管理',
				modal:true,
				collapsible : true,
				split : true,
				height : document.documentElement.clientHeight-30,
				border : false,
				layout:"fit",
				loader : treeloader,
				root:new Ext.tree.AsyncTreeNode({id:0,text:'频道',leaf:false}),
				rootVisible : true,
				listeners:{
					'click':function(node){
						navSid = node.id ;
						
					    Ext.getCmp("navbrandslist").getStore().load({
						params : {
						navSid:navSid
						}});
					    
					    Ext.getCmp("promotionslist").getStore().load({
							params : {
							navSid:navSid
						}});
					    
					}
				}
				
			});
  
		 var contextMenu = new Ext.menu.Menu({
				items: [
					{text: '添加导航',handler: insertNavHandler},
					{text: '修改导航',handler: editNavHandler},
					{text: '删除导航',handler: deleteNavHandler}
				]
			});

		this.treepanel.on('contextmenu', treeContextHandler);
		
		function treeContextHandler(node) {
			node.select();
			contextMenu.show(node.ui.getAnchor());
		}
		
		
		function insertNavHandler() {
			var selectedNode = Ext.getCmp('navTree').getSelectionModel().getSelectedNode(); 
			
			var proClassUrl = __ctxPath;
			var insertForm =new Ext.Window({
				width:400,
				id:'insertNavForm',
				modal:true,
				heght:800,
				
				buttonAlign:'center',
				items:[{
					xtype:'form',
					width:500,
					border:false,
					//height:100,
					title:'添加导航',
					frame:true,
					items:[
					new NavigationTree("o",proClassUrl,"导航名称","classSid","name"),
					{
						xtype:'textfield',
						fieldLabel:'样式',
						id:'con'
						
					},
					{
						name : "classSid",
						id : "classSid",
						xtype : "hidden"
					},
					{
						name : "name",
						id : "name",
						xtype : "hidden"
					},
					{
						xtype:'textfield',
						fieldLabel:'更多品牌链接',
						id:'linkBrand'
						//allowBlank:false
						
					}
					]
				}],
				buttons:[{
					text:'保存',
					handler:function(){
						var name = Ext.get('name').dom.value;
						Ext.Ajax.request({
							url:__ctxPath + "/navigation/insertNav",
							params : {
									_method : "POST",
									pageLayoutSid:selectedNode.id,
									name:Ext.get('name').dom.value,
									icon:Ext.get('con').dom.value,
									linkBrand:Ext.get('linkBrand').dom.value,
									classSid:Ext.get('classSid').dom.value,
									channelSid:channelSid
								},
							success:function(response){
								Ext.Msg.alert("信息","添加导航成功！",function(){
									Ext.getCmp("navTree").root.reload();  
									Ext.getCmp('insertNavForm').close();
									});
							},
							failure:function(response){
								Ext.Msg.alert("警告","添加导航失败，请稍后再试！");
							}

						});
					}
				}]
			}).show();
		}
		function editNavHandler() {
			var selectedNode = Ext.getCmp('navTree').getSelectionModel().getSelectedNode(); 
			
			var editForm =new Ext.Window({
				width:400,
				id:'editForm',
				heght:800,
				buttonAlign:'center',
				items:[{
					xtype:'form',
					width:500,
					//height:100,
					title:'修改导航',
					frame:true,
					items:[
					{
						xtype:'textfield',
						fieldLabel : "导航名称",
						id : "editName",
						value:selectedNode.text,
						disabled:true
					},
					{
						xtype:'textfield',
						fieldLabel:'样式',
						id:'editicons',
						value:selectedNode.attributes.icons
					},
					{
						name : "editClassSid",
						id : "editclassSid",
						xtype : "hidden"
					},
					{
						xtype:'textfield',
						fieldLabel:'更多品牌链接',
						id:'editLinkBrand',
						value:selectedNode.attributes.linkBrand
						
					}]
					}],
					buttons:[{
						text:'保存修改',
						handler:function(){
				　　　　　　　　　　　Ext.Ajax.request({
				　　　　　　　　　　　　　　url:　 __ctxPath + "/navigation/updateNav",
								  params : {
										_method : "POST",
										sid:selectedNode.id,
										icon:Ext.get('editicons').dom.value,
										linkBrand:Ext.get('editLinkBrand').dom.value,
										channelSid:channelSid
									},
				　　　　　　　　　　　　　　
				　　　　　　　　　　　　　　　success:　function(response)　{
				　　　　　　　　　　　　　　　　　　　Ext.Msg.alert("信息",　"修改成功！",　function()　{
												Ext.getCmp("navTree").root.reload();
												Ext.getCmp('editForm').close();　
												
				　						});
				　　　　　　　　　　　　　　　},
				　　　　　　　　　　　　　　　　failure:　function(response)　{
				　　　　　　　　　　　　　　　　　　　Ext.Msg.alert("警告",　"修改失败，请稍后再试！");
				　　　　　　　　　　　　　　　}
				　　　　　　　　　　　});
				　　　　　　　
						}
					}]
			}).show();
			
		}
		function deleteNavHandler() {
			var treeNode = Ext.getCmp('navTree').getSelectionModel().getSelectedNode();
				treeNode.remove();
				Ext.Msg.show({
					title:'提示消息',
					icon: Ext.MessageBox.QUESTION,
					msg:'确认删除?',
					buttons: Ext.MessageBox.YESNO,
					fn:function(btn){
						if(btn=='yes'){
							Ext.Ajax.request({
							   url: __ctxPath + "/navigation/deleteNav",
							   _method:'POST',
							   params: { 
									_method : "POST",
									sid:treeNode.id
								   },
							   success: function(){
									      Ext.Msg.alert('信息提示','删除成功');
									      Ext.getCmp("navTree").root.reload();
									     },
							     
						      failure: function(){
							          Ext.Msg.alert('信息提示','删除失败，请与管理员联系');
				             	}
				             	
				         	});
						}
						}
					
				});
		}
		
		
		
		/*品牌维护面板开始*/
		var store = new  Ext.data.JsonStore({
			url : __ctxPath + "/navigation/queryNavBrand",
			root : "list",
			baseParams : {
				_method : "POST",
				navSid:navSid
				
			},
			totalProperty : "list",
			remoteSort : true,
			fields : [
			          "sid",
				      "brandName",
				      "brandSid",
				      "brandPic",
				      "brandLink"
			 
			]
		});
		//store.load();
		var selectModel = new Ext.grid.CheckboxSelectionModel();
		var columnModel = new Ext.grid.ColumnModel({
			columns:[
			         	selectModel,
			         	{
						header:"中文名称",
						sortable:true,
						resizable:true,
						dataIndex:"brandName",
						width:100
					},
					{
						header:"品牌链接",
						sortable:true,
						resizable:true,
						dataIndex:"brandLink",
						width:100
					},
					{
						header:"sid",
						sortable:true,
						resizable:true,
						dataIndex:"sid",
						width:100,
						hidden:true
					}

			         
			         ]
			
			
			
		});

		
		this.gridpanel= new Ext.grid.GridPanel({
			id : "navbrandslist",
			width:document.documentElement.clientWidth-200,
            height:document.documentElement.clientHeight-400,
			border : false,
			title : "品牌维护",
			store:store,
			containerscroll: true,
			cm : columnModel,
			sm : selectModel,
			autoScroll : true,
			viewConfig : {
				forceFit : true,
				enableRowBody : false,
				showPreview : false
			},
			bbar:new Ext.Toolbar({
			    height:35,
			    buttonAlign:'right',
				items:[
                 
				{
					xtype:'button',
					preesed:false,
					text:'增加品牌',
					height:30,
					width:80,
					align:'center',
					ctCls: 'x-btn-over',
					iconCls: 'button_add',
					handler:function(){
							   new AddNavBrandWindow({
								   navSid:navSid
								}).show();
						
					}
					
				},
				{
					xtype:'button',
					preesed:true,
					height:30,
					ctCls: 'x-btn-over',
					iconCls: 'button_del',
					text:'删除品牌',
					handler:delnavbrand
					
				},
				{
					xtype:'button',
					preesed:true,
					height:30,
					ctCls: 'x-btn-over',
					iconCls: 'button_edit',
					text:'编辑品牌链接',
					handler:editbrandlink
					
				}]
			})
					
		});
		
		
		
		
	
		
	   function editbrandlink(){
		   

		   var record  = Ext.getCmp('navbrandslist').getSelectionModel().getSelections();
			
			 if(record == null || record.length == 0||record.length>1){
				Ext.Msg.alert("","请选择一条要修改的资源");
			}else{
		   
			new UpdateBrandLink({
				
				record:record
				
			}).show();
			
	   }	   
		   }
       
	   
        function delnavbrand(){
		   
        	var record  = Ext.getCmp('navbrandslist').getSelectionModel().getSelections();
			
			 if(record == null || record.length == 0){
				Ext.Msg.alert("","请选择要删除的");
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
							   
							   url: __ctxPath + "/navigation/deleteNavBrand",
							   _method:'POST',
							   params: { 
									_method : "POST",
									sid: record[i].get('sid')
									
								   },
							   success: function(){
							      Ext.Msg.alert('信息提示','删除成功');
							      store.reload();
							     },
							     failure: function(){
							          Ext.Msg.alert('信息提示','删除失败，请与管理员联系');
				             	}
				             	
				         	});
						}
						}
					}
				});
				
			}
		   
		    
	    }
		/*品牌维护面板结束*/

		
		/*活动维护面板开始*/

		var prostore = new  Ext.data.JsonStore({
			url : __ctxPath + "/navigation/queryNavPromotion",
			root : "list",
			baseParams : {
				_method : "POST",
				navSid:navSid
				
			},
			totalProperty : "list",
			remoteSort : true,
			fields : [
			          "promotionTitle",
				      "promotionLink",
				      "sid"
			 
			]
		});
		//prostore.load();
		var proselectModel = new Ext.grid.CheckboxSelectionModel();
		var procolumnModel = new Ext.grid.ColumnModel({
			columns:[
			         	proselectModel,
			         	{
						header:"活动名称",
						sortable:true,
						resizable:true,
						dataIndex:"promotionTitle",
						width:100
					},
					{
						header:"活动链接",
						sortable:true,
						resizable:true,
						dataIndex:"promotionLink",
						width:100
					},
					{
						header:"sid",
						sortable:true,
						resizable:true,
						dataIndex:"sid",
						width:100,
						hidden:true
					}

			         
			         ]
			
			
			
		});

		
		this.progridpanel= new Ext.grid.GridPanel({
			id : "promotionslist",
			width:document.documentElement.clientWidth-200,
            height:document.documentElement.clientHeight-400,
			border : false,
			title : "活动维护",
			store:prostore,
		
			containerscroll: true,
			cm : procolumnModel,
			sm : proselectModel,
			autoScroll : true,
			viewConfig : {
				forceFit : true,
				enableRowBody : false,
				showPreview : false
			},
			bbar:new Ext.Toolbar({
			    height:35,
			    buttonAlign:'right',
				items:[
                 
				{
					xtype:'button',
					preesed:true,
					text:'增加活动',
					height:30,
					width:80,
					align:'center',
					ctCls: 'x-btn-over',
					iconCls: 'button_add',
					handler:function(){
							   new AddPromotionWindow({
								   navSid:navSid
								}).show();
							   
					}
					
				},
				{
					xtype:'button',
					preesed:true,
					height:30,
					ctCls: 'x-btn-over',
					iconCls: 'button_del',
					text:'删除活动',
					handler:delpromotion
					
				}]
			})
					
		});
		
		
		
		
	
	   
       
        function delpromotion(){
		   
        	var record  = Ext.getCmp('promotionslist').getSelectionModel().getSelections();
			
			 if(record == null || record.length == 0){
				Ext.Msg.alert("","请选择要删除的");
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
							   
							   url: __ctxPath + "/navigation/deleteNavPromotion",
							   _method:'POST',
							   params: { 
									_method : "POST",
									promotionSid: record[i].get('sid'),
									navSid:navSid
									
									
								   },
							   success: function(){
							      Ext.Msg.alert('信息提示','删除成功');
							      prostore.reload();
							     },
							     failure: function(){
							          Ext.Msg.alert('信息提示','删除失败，请与管理员联系');
				             	}
				             	
				         	});
						}
						}
					}
				});
				
			}
		   
		    
	    }
 
		/*活动维护面板结束*/
		
		this.tablepanel= new Ext.TabPanel({
			activeTab:0,    //设置默认选择的选项卡
	      //  renderTo:'mainDiv',
	      //  width:200,
	      //  height:150,
	        width:document.documentElement.clientWidth-290,
			height:document.documentElement.clientHeight-30,
	        items:[
	            
	            	this.gridpanel,
	            
	            	this.progridpanel
	        ]
	    }); 
	}
});







