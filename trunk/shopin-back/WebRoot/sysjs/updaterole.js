UpdateRoleForm = Ext.extend(Ext.Window ,{
	form : null,
	resource : null,
	constructor:function(a){
		if(a==null){
			a={};
		}
		Ext.apply(this,a);
		this.initComponents();
		UpdateRoleForm.superclass.constructor.call(this,{
			id:'updaRoleWindow',
			layout:'column',
			border:true,
			modal:true,
			resizable:false,
			width:document.documentElement.clientWidth-685,
			height:document.documentElement.clientHeight-80,
			items:[{
				
				columnWidth:1,
				items:[
				       this.form
				       ]
			}],
			title:'修改角色',
			renderTo : "mainDiv"
		});	
	},
	initComponents:function(){
	
		var sid = this.sid;
		var roleName = this.roleName;
		var memo = this.memo;
		var resource = "";
		this.form = new Ext.FormPanel({
				xtype:"form",
				title:"修改角色",
				id:"updateRoleForm",
				labelWidth:100,
				labelAlign:"left",
				layout:"form",
				autoScroll : true,
       			containerscroll: true,
				height:document.documentElement.clientHeight-112,
				width:document.documentElement.clientWidth-700,
				bbar:new Ext.Toolbar({
				height:30,
				buttonAlign:'center',
					items:[
						{
							text:"保存",
							ctCls: 'x-btn-over',
							height:20,
							width:40,
							handler:saveRole
						},
						{
							text:"取消",
							height:20,
							width:40,
							ctCls: 'x-btn-over',
							handler:function(){
								Ext.getCmp('updaRoleWindow').close();
							}
						}
					]
				}),
				items:[
					{
						xtype:"textfield",
						fieldLabel:"roleSid",
						id:"sid",
						anchor:"60%",
						hidden:true
					},
					{
						xtype:"textfield",
						fieldLabel:"角色名",
						id:"roleName",
						name:"roleName",
						anchor:"60%"
					},
					{
						id : "action",
						name : "action",
						xtype : "hidden",
						value : "/roles/updateRoles"
					}, {
						id : "_method",
						name : "_method",
						xtype : "hidden",
						value : "POST"
					},
					{
						xtype:"textfield",
						fieldLabel:"备注",
						id:"memo",
						name:"memo",
						anchor:"60%"
					},
					{
						xtype:"button",
						text:"编辑资源",
						allowDepress:false,
						handler:editResource
					},
					{
						xtype:"textarea",
						fieldLabel:"资源",
						id:"resource",
						name:"resource",
						height:80,
						width:200
					},
					{
						xtype:"textarea",
						fieldLabel:"资源sid",
						id:"resourceSid",
						name:"resourceSid",
						height:80,
						width:200,
						hidden:true
					},
					{
						xtype:"button",
						text:"编辑频道",
						allowDepress:false,
						handler:editChannel
					},
					{
						xtype:"textarea",
						fieldLabel:"频道",
						id:'channel',
						name:'channel',
						height:80,
						width:200
					},
					{
						xtype:"textarea",
						fieldLabel:"频道sid",
						id:'channelSid',
						name:'channelSid',
						height:80,
						width:200,
						hidden:true
					}
				]
			});
		Ext.getCmp('roleName').setValue(roleName);
		Ext.getCmp('memo').setValue(memo);
		Ext.getCmp('sid').setValue(sid);
		Ext.getCmp('resource').setValue(resource);
		
		
		function saveRole(){
			var form = Ext.getCmp('updateRoleForm').getForm();
		    if(form.isValid()){
			  form.submit({
				  waitMsg : "正在提交数据……",
				  url : __ctxPath + "/roles/updateRoles",
				  success : function(form,action){
					Ext.Msg.alert('信息提示','修改成功');
					Ext.getCmp('rolepanel').getStore().load();
					Ext.getCmp('updaRoleWindow').close();
				  }
			  });
		  }
		
	  	}
		
		function editResource(){
			new EditResourceWindow({
					sid:sid,
					roleName:roleName
			}).show();
		}
		
		function editChannel(){
			new EditChannelWindow({
					sid:sid,
					roleName:roleName
				//	roleName:roleName
			}).show();
		}
		
	}
});