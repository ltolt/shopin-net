AddItemForm = Ext.extend(Ext.Window ,{
	form : null,
	form1 : null,
	treepanel : null,
	resource : null,
	constructor:function(a){
		if(a==null){
			a={};
		}
		Ext.apply(this,a);
		this.initComponents();
		AddItemForm.superclass.constructor.call(this,{
			id:'addItem',
			modal:true,
			resizable:false,
			layout:"form",
			width:500,
			height:400,
			items:[{
				columnWidth:1,
				items:[{
					items:[
						this.form
					]
				},{
					layout : "column",
					items:[{
						columnWidth:.3,
						items:[
								this.treepanel
								]
					},{
						columnWidth:.7,
						items:[
								this.form1
								]
					}
					       ]
				}
				       		       
				       ]
			}],
			title:'新增导航明细',
			renderTo : "mainDiv"
		});	
	},
	initComponents:function(){
		var record = this.record;
		var channelName = this.channelName;
		var parentId = "";
		this.form = new Ext.FormPanel({
				xtype:"form",
				id:"form",
				title:'导航信息',
				labelWidth:80,
				labelAlign:"left",
				layout:"form",
				autoScroll : true,
       			containerscroll: true,
       			width:500,
    			height:80,
				items:[
				       {
						xtype:"textfield",
						fieldLabel:"归属频道",
						value:channelName,
						anchor:"90%",
						id : "belongChannel",
						name : "belongChannel",
						disabled:true
					},
					{
						xtype:"textfield",
						fieldLabel:"模板名称",
						value:record[0].get("moduleName"),
						anchor:"90%",
						id : "sortName",
						name : "sortName",
						disabled:true
					}
				]
		});
		
		
		var treeloader = new Ext.tree.TreeLoader({
			 url:__ctxPath +"/navSortItem/getAllNavSortItem"	 
		 });
		 treeloader.on('beforeload', function(loader, node) {
				loader.baseParams = {	
						sortSid:record[0].get("sid"),
						_method : "POST"
				};
			});
		 this.treepanel = new Ext.tree.TreePanel({
				id:'navTree',
				title:'目录',
				modal:true,
				split : true,
				height : 280,
				border : false,
				layout:"fit",
				multiSelect:true,
				loader : treeloader,
				root:new Ext.tree.AsyncTreeNode({id:record[0].get("sid"),text:record[0].get("moduleName"),leaf:false ,expanded:true}),
				useArrows: false,
				rootVisible : true,
				listeners:{
					'click':function(node){
						Ext.getCmp("parentId").setValue(node.attributes.parentId);
						Ext.getCmp("sid").setValue(node.id);
						Ext.getCmp("className").setValue(node.attributes.className);
						Ext.getCmp("url").setValue(node.attributes.url);
						Ext.getCmp("orderBy").setValue(node.attributes.orderBy);
						Ext.getCmp("isTop").setValue(node.attributes.isTop);
					}
				}
			});
		 
		 this.form1 = new Ext.FormPanel({
				xtype:"form",
				id:"addItemForm1",
				title:"信息维护",
				labelWidth:80,
				labelAlign:"left",
				layout:"form",
				autoScroll : true,
	   			containerscroll: true,
    			height:280,
				bbar:new Ext.Toolbar({
				height:30,
				buttonAlign:'center',
					items:[
						{
							text:"新增",
							ctCls: 'x-btn-over',
							iconCls: 'button_add',
							height:20,
							width:40,
							handler:saveItem
						},
						{
							text:"修改",
							ctCls: 'x-btn-over',
							iconCls: 'button_edit',
							height:20,
							width:40,
							handler:updateItem
						},
						{
							text:"取消",
							height:20,
							width:40,
							ctCls: 'x-btn-over',
							handler:function(){
								Ext.getCmp('addItem').close();
							}
						},
						{
							text:"重置",
							height:20,
							width:40,
							ctCls: 'x-btn-over',
							handler:function(){
								Ext.getCmp("className").setValue();
								Ext.getCmp("url").setValue();
								Ext.getCmp("orderBy").setValue();
								Ext.getCmp("isTop").setValue();
							}
						}
					]
				}),
				items:[
				       {
				    	   xtype:"textfield",
				    	   hidden:true,
				    	   fieldLabel:"sid",
				    	   id:"sid",
				    	   name:"sid",
				       },
				       {
				    	   xtype:"textfield",
				    	   fieldLabel:"navSortSid",
				    	   value:record[0].get("sid"),
				    	   hidden:true,
				    	   id:"navSortSid",
				    	   name:"navSortSid",
				       },
				       {
				    	   xtype:"textfield",
				    	   hidden:true,
				    	   fieldLabel:"parentId",
				    	   value:parentId,
				    	   id:"parentId",
				    	   name:"parentId",
				       },
				       {
							xtype:"textfield",
							fieldLabel:"显示名称",
							anchor:"60%",
							id : "className",
							name : "className",
							allowBlank:false,
							emptyText:"请输入显示名称"
						},
						{
							xtype:"textfield",
							fieldLabel:"关联链接",
							anchor:"60%",
							regex:/^[a-zA-z]+:\/\/[^\s]*$/,
							id : "url",
							name : "url",
							allowBlank:false,
							emptyText:"请输入关联链接"
						},
						{
							xtype:"spinnerfield",
							fieldLabel:"显示排序",
							anchor:"40%",
							id : "orderBy",
							name : "orderBy",
						},
						{
							xtype:"checkbox",
							fieldLabel:"是否推荐",
							boxLabel :"推荐",
							inputValue:"1",
							id : "isTop",
							name : "isTop",
						}
						       ]
		
		});
		 
		 function saveItem(){
				var form = Ext.getCmp('addItemForm1').getForm();
				var selectedNode = Ext.getCmp('navTree').getSelectionModel().getSelectedNode(); 
				if(form.isValid()){
					if(selectedNode!=null){
						if(!selectedNode.leaf){
							
							form.submit({
								waitMsg : "正在提交数据……",
								url : __ctxPath + "/navSortItem/insertItem",
								success : function(form) {
									form.reset();
									Ext.getCmp("navTree").root.reload();
									Ext.Msg.alert('信息提示', '操作成功');
								}
							});
						}else{
							Ext.Msg.alert("错误","请选择非子节点！！！");
						}
					}else{
						Ext.Msg.alert("错误","必须选择一个左侧非子节点后方能保存！！！");
					}
				}else{
					Ext.Msg.alert("错误","请检查输入内容");
				}
			
		  	}
		 
		 function updateItem(){
			 var form = Ext.getCmp('addItemForm1').getForm();
			 var selectedNode = Ext.getCmp('navTree').getSelectionModel().getSelectedNode(); 
			 if(form.isValid()){
				 if(selectedNode!=null){
					 if(selectedNode.id!=record[0].get("sid")){
						 form.submit({
							 waitMsg : "正在提交数据……",
							 url : __ctxPath + "/navSortItem/updateItem",
							 success : function(form) {
								 form.reset();
								 Ext.getCmp("navTree").root.reload();
								 Ext.Msg.alert('信息提示', '修改成功');
							 }
						 });
					 }else{
						 Ext.Msg.alert("错误","请选择子节点修改！！！");
					 }
				 }else{
					 Ext.Msg.alert("错误","必须选择一个左侧修改节点！！！");
				 }
			 }
			 
		 }
		
		
	}
});
