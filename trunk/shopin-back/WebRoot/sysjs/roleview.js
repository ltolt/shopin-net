RoleView= Ext.extend(Ext.Panel,{
	gridpanel : null,
	constructor:function(a){
		if(a==null){
			a={};
		}
		Ext.apply(this,a);
		this.initComponents();
		RoleView.superclass.constructor.call(this,{
			id:'photoruleview',
			layout:'column',
			border:true,
			modal:true,
			width:document.documentElement.clientWidth,
			height:document.documentElement.clientHeight-40,
			items:[{
				
				columnWidth:1,
				items:[
				       this.gridpanel
				       ]
			}],
			title:'角色管理',
			renderTo : "mainDiv"
		});	
	},
	initComponents:function(){
		var name = "";
		var ruleName;
		var ruleSid;
		
            
            
		var roleStore = new  Ext.data.JsonStore({
				url : __ctxPath + "/roles/selectList",
		  	//	data:str,
				root : "list",
				baseParams : {
					_method : "POST"
					
				},
				//totalProperty : "data.totalRecords",
				remoteSort : true,
				fields : [
					"sid",
					"roleName",
					"memo"
				]
			});
		roleStore.load();
		
		var selectModel = new Ext.grid.CheckboxSelectionModel();
		var columnModel = new Ext.grid.ColumnModel({
			columns:[
			         	selectModel,
			         	{
						header:"角色sid",
						id:"sid",
						sortable:true,
						resizable:true,
						dataIndex:"sid",
						width:100
					},
					{
						header:"角色名",
						id:"roleName",
						sortable:true,
						resizable:true,
						dataIndex:"roleName",
						width:100
					},
					{
						header:"备注",
						id:"roleMemo",
						sortable:true,
						resizable:true,
						dataIndex:"memo",
						width:100
					}
			         
			         ]
			
		});

		
		this.gridpanel= new Ext.grid.GridPanel({
			
			id : "rolepanel",
			height:document.documentElement.clientHeight-73,
			border : false,
			title : "角色管理",
			autoScroll : true,
       		containerscroll: true,
			store:roleStore,
			cm : columnModel,
			sm : selectModel,
			viewConfig : {
				forceFit : true,
				enableRowBody : false,
				showPreview : false
			},
			tbar:new Ext.Toolbar({
			    height:40,
			//    buttonAlign:'life',
				items:[
						'角色查询（区分大小写）',
						{
						xtype:"textfield",
						id:"roleName",
						fieldLabel:"标签",
						height:35
					},
					" ",
					" ",
					{
						text:"查询",
						height:28,
						width:80,
						ctCls: 'x-btn-over',
						handler:searchRoles
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
					text:'添加角色',
					height:30,
					ctCls: 'x-btn-over',
					iconCls: 'button_add',
					handler:RoleView.addrule
					
				},
				{
					xtype:'button',
					preesed:true,
					height:30,
					ctCls: 'x-btn-over',
					iconCls: 'button_edit',
					text:'修改角色',
					handler:RoleView.updaterole
					
				},
				{
					xtype:'button',
					preesed:true,
					height:30,
					ctCls: 'x-btn-over',
					iconCls: 'button_del',
					text:'删除角色',
					handler:delrole
					
				}]
			})
					
		});
		
	   
        function delrole(){
		   
        	var record  = Ext.getCmp('rolepanel').getSelectionModel().getSelections();
			 if(record == null || record.length == 0){
				Ext.Msg.alert("","请选择要删除的角色");
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
							   
							   url: __ctxPath + "/roles/delRoles",
							   _method:'POST',
							   params: { 
									_method : "POST",
									roleSid: record[i].get('sid')
									
								   },
							   success: function(){
							      Ext.Msg.alert('信息提示','删除成功');
							      roleStore.load(); 
							       
							       
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

	    function searchRoles(){
	    	var name = "";
	    	    name = Ext.getCmp('roleName').getValue();
   			
   			roleStore.load({
				params:{
					name : name
				}
			});
	    
        }
	}
});


  RoleView.updaterole = function(){
		   var record  = Ext.getCmp('rolepanel').getSelectionModel().getSelected();
		   if(record != null){
		   new UpdateRoleForm({
		   			sid:record.get('sid'),
		   			roleName:record.get('roleName'),
		   			memo:record.get('memo')
			}).show();
		   
		   }else{
		   	Ext.Msg.alert("","请选择要修改的角色");
		   }
		   
	   }
  RoleView.addrule = function(){
		   
		   new AddRoleForm({
		
			}).show();
		   
		   
	   }
















