AddResourceForm=Ext.extend(Ext.Window ,{
    xtype:"window",
    id:"AddResourceForm",
	title:"增加资源信息",
	modal:true,
	width:421,
	height:189,
	initComponent: function(){
		
		
		this.items=[
			{
				xtype:"form",
				title:"增加资源信息",
				labelWidth:50,
				labelAlign:"left",
				layout:"form",
				id:"resourcepanel",
				height:156,
				autoScroll:true,
				width:400,
				bbar:[
					{
						xtype:"button",
						ctCls: 'x-btn-over',
						height:20,
						width:40,
						text:"保存",
						repeat:false,
						allowDepress:true,
						handler:this.saveResources.createCallback()
					},
					{
						xtype:"button",
						text:"取消",
						repeat:false,
						height:20,
						width:40,
						ctCls: 'x-btn-over',
						allowDepress:true,
						handler:function(){
							Ext.getCmp('AddResourceForm').close();	
						}
					}
				],
				items:[
					{
						xtype:"textfield",
						fieldLabel:"资源名",
						anchor:"100%",
						id : "resourcesName",
						name : "resourcesName",
						allowBlank: false
					},
					{
						xtype:"textfield",
						fieldLabel:"URL",
						anchor:"100%",
						id : "URL",
						name : "URL",
						allowBlank: false
					}
				]
			}
		]
		AddResourceForm.superclass.initComponent.call(this);
	},
	saveResources : function(){
		
		 var form = Ext.getCmp('resourcepanel').getForm();
		 if(form.isValid()){
		var resourcesName=Ext.get("resourcesName").dom.value;
		var url=Ext.get("URL").dom.value;
		Ext.Ajax.request({
			 url : __ctxPath + "/resources/saveResources",
 		    method:'post', 
				params : {
					 _method : "POST", 
					 resourcesName:resourcesName,
					 url: url
				},
				success : function() {
					Ext.Msg.alert('信息提示','保存成功');
					Ext.getCmp('resourceslist').getStore().load();
					Ext.getCmp('AddResourceForm').close();	
					
				},
				failure:function(){
					Ext.Msg.alert('信息提示','保存失败，请与管理员联系');
				}
		});
	}
	}
})