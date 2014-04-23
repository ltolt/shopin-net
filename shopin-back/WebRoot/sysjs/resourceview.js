ResourceView= Ext.extend(Ext.Panel,{
	gridpanel : null,
	constructor:function(a){
		if(a==null){
			a={};
		}
		Ext.apply(this,a);
		this.initComponents();
		ResourceView.superclass.constructor.call(this,{
			id:'photoruleview',
			layout:'column',
			border:true,
			width:document.documentElement.clientWidth,
			height:document.documentElement.clientHeight-40,
			items:[{
				
				columnWidth:1,
				items:[
				       this.gridpanel
				       ]
			}],
			title:'资源管理',
			renderTo : "mainDiv"
		});	
	},
	initComponents:function(){
		
		
		var ruleSid;

		/*  store的url统一为：__ctxPath + "/action"
		  baseParams包含真正的action和_method，对应shopin-back-demo系统controller的注解
		*/
		var store = new  Ext.data.JsonStore({
			url : __ctxPath + "/resources/queryResources",
			root : "list",
			baseParams : {
				_method : "POST"
				
			},
			totalProperty : "list",
			remoteSort : true,
			fields : [
				"sid",
				"resourceName",
				"url"
			]
		});
		store.load();
		var selectModel = new Ext.grid.CheckboxSelectionModel();
		var columnModel = new Ext.grid.ColumnModel({
			columns:[
			         	selectModel,
			         	{
						header:"资源sid",
						sortable:true,
						resizable:true,
						dataIndex:"sid",
						width:100
					},
					{
						header:"资源名",
						sortable:true,
						resizable:true,
						dataIndex:"resourceName",
						width:100
					},
					{
						header:"资源url",
						sortable:true,
						resizable:true,
						dataIndex:"url",
						width:100
					}
			         
			         ]
			
			
			
		});

		
		this.gridpanel= new Ext.grid.GridPanel({
			id : "resourceslist",
			//autoHeight : true,
			height:document.documentElement.clientHeight-73,
			border : false,
			title : "资源信息",
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
			tbar:new Ext.Toolbar({
			    height:35,
			//    buttonAlign:'life',
				items:[
						'资源查询（区分大小写）:',
						{
						xtype:"textfield",
						fieldLabel:"标签",
						anchor:"100%",
						id : "queryName",
						name : "queryName"
						
					},
					" ",
					" ",
					{   xtype:"button",
						height:28,
						width:80,
						ctCls: 'x-btn-over',
						text:"查询",
						handler:query
					}
				]
			}),
			bbar:new Ext.Toolbar({
			    height:35,
			    buttonAlign:'right',
				items:[
                 
				{
					xtype:'button',
					preesed:true,
					text:'增加新资源',
					height:30,
					width:80,
					align:'center',
					ctCls: 'x-btn-over',
					iconCls: 'button_add',
					handler:addresource
					
				},
				{
					xtype:'button',
					preesed:true,
					height:30,
					ctCls: 'x-btn-over',
					iconCls: 'button_edit',
					text:'修改资源',
					handler:updateresource
						
						
					
				},
				{
					xtype:'button',
					preesed:true,
					height:30,
					ctCls: 'x-btn-over',
					iconCls: 'button_del',
					text:'删除资源',
					handler:delresource
					
				}]
			})
					
		});
		
		
		
		
	   function addresource(){
		   
		   new AddResourceForm({
		
			}).show();
		   
		   
	   }
	   
      function query(){
		var resourceName=Ext.getCmp('queryName').getValue();
		store.load( {
		params:{
			resourceName:resourceName
		}		
		}
		);
		   
		   
	   }
	   
	   function updateresource(){
		   var record  = Ext.getCmp('resourceslist').getSelectionModel().getSelections();
			
			 if(record == null || record.length == 0||record.length>1){
				Ext.Msg.alert("","请选择一条要修改的资源");
			}else{
		   
			new UpdateResourceForm({
				
				record:record
				
			}).show();
			
	   }
				}
       
        function delresource(){
		   
        	var record  = Ext.getCmp('resourceslist').getSelectionModel().getSelections();
			
			 if(record == null || record.length == 0){
				Ext.Msg.alert("","请选择要删除的资源");
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
							   
							   url: __ctxPath + "/resources/deleteResources",
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
			
	}
	
	
});





















