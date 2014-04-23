PhotoruleView= Ext.extend(Ext.Panel,{
	gridpanel : null,
	constructor:function(a){
		if(a==null){
			a={};
		}
		Ext.apply(this,a);
		this.initComponents();
		PhotoruleView.superclass.constructor.call(this,{
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
			title:'拍照规则管理',
			renderTo : "mainDiv"
		});	
	},
	initComponents:function(){
		
		
		var ruleSid;

		/*  store的url统一为：__ctxPath + "/action"
		  baseParams包含真正的action和_method，对应shopin-back-demo系统controller的注解
		*/
		var store = new  Ext.data.JsonStore({
			url : __ctxPath + "/ruleMql/rule",
			root : "list",
			baseParams : {
				_method : "POST"
				
			},
//			totalProperty : "data.totalRecords",
			remoteSort : true,
			fields : [
				"sid",
				"ruleName",
				"activeBeginTime",
				"activeEndTime",
				"createUser",
				"createTime",
				"updateUser",
				"updateTime"
			]
		});
		store.load();
		var selectModel = new Ext.grid.CheckboxSelectionModel();
		var columnModel = new Ext.grid.ColumnModel({
			columns:[
			         	selectModel,
			         	{
							header : "Sid",
							width : 30,
							dataIndex : "sid"
						},
			         	{
			         		header : "规则名称",
							dataIndex : "ruleName",
							width:30
							
			         	},{
							header : "起始有效时间",
							dataIndex : "activeBeginTime",
						    width : 30	
						},
						
						{
							header : "结束有效时间",
							dataIndex : "activeEndTime",
							width : 30
						},
						{
							header : "创建人",
							dataIndex : "createUser",
							width : 30
						},
						{
							header : "创建日期",
							dataIndex : "createTime",
							width : 30
						},
						{
							header : "修改人",
							dataIndex : "updateUser",
							width : 30
						},
						{
							header : "修改日期",
							dataIndex : "updateTime",
							width : 30
						}
						
			         
			         ]
			
			
			
		});

		
		this.gridpanel= new Ext.grid.GridPanel({
			id : "rulelist",
			autoHeight : true,
			border : false,
			title : "规则信息",
			store:store,

			cm : columnModel,
			sm : selectModel,
			trackMouseOver : true,
			//disableSelection : false,
			loadMask : true,
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
					text:'增加新规则',
					height:30,
					ctCls: 'x-btn-over',
					iconCls: 'button_add',
					handler:addrule
					
				},
				{
					xtype:'button',
					preesed:true,
					height:30,
					ctCls: 'x-btn-over',
					iconCls: 'button_edit',
					text:'修改规则',
					handler:function(){
				           var uptext= Ext.getCmp('rulelist').getSelectionModel().getSelected();
				        	
							if(uptext==undefined){
								Ext.Msg.alert("","请选择一项");
							}else{
								
								
								//alert(uptext.get('sid'));
								
								 Ext.Ajax.request({
									 url: __ctxPath + "/ruleMql/initupdate",
									 root : "obj",
									 method:'post',
									 params:{
										 _method : "POST",
										 sid:uptext.get('sid')
									 },
									 success:function(response){
										 var json = response.responseText;
									
										 updaterule(json);
									 },
									 failure : function(){
										 Ext.Msg.alert('信息提示','系统错误');
									 }
								 });
								
								
								}
							}
					
				},
				{
					xtype:'button',
					preesed:true,
					height:30,
					ctCls: 'x-btn-over',
					iconCls: 'button_del',
					text:'删除规则',
					handler:delrule
					
				}]
			})
					
		});
		
		
		
		
	   function addrule(){
		   
		   new AddPhotoRuleForm({
		
			}).show();
		   
		   
	   }
	   
	   this.gridpanel.on('rowdblclick', function (grid) {
			   
				var t =grid.getSelectionModel().getSelected().get('sid');
				PhotoruleView.create(t);
		});
		
		
       function updaterule(json){
		   
		   new UpdatePhotoRuleForm({
			   json:json
			}).show();
		   
		   
	   }
       
        function delrule(){
		   
        	var record  = Ext.getCmp('rulelist').getSelectionModel().getSelections();
			
			 if(record == null || record.length == 0){
				Ext.Msg.alert("","请选择要删除的规则");
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
							   
							   url: __ctxPath + "/ruleMql/deleterules",
							   _method:'POST',
							   params: { 
									_method : "POST",
									ruleSid: record[i].get('sid')
									
								   },
							   success: function(){
							      Ext.Msg.alert('信息提示','删除成功');
							      store.load({params:{
										action : "/truleNew/rule",
										_method : "POST"
											}
									}); 
							       
							       
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

		PhotoruleView.create = function(u){
		
			new RuleDetailView({
				ruleSid:u
			}).show();
		}
			
	}
	
	
});





















