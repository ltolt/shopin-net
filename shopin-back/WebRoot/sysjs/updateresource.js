UpdateResourceForm=Ext.extend(Ext.Window ,{
xtype:"window",
	title:"修改资源信息",
	width:421,
	modal:true,
	height:189,
	id:"UpdateResourceForm",
	initComponent: function(){
		
		var record=this.record;
		
		var str=record[0].get('resourceName');
		this.items=[
			{
				xtype:"form",
				title:"修改资源信息:"+str,
				labelWidth:50,
				labelAlign:"left",
				layout:"form",
				height:156,
				autoScroll:true,
				width:400,
				bbar:[
					{
						xtype:"button",
						text:"保存",
						height:20,
						width:40,
						ctCls: 'x-btn-over',
						repeat:false,
						allowDepress:true,
						handler:this.updateResources.createCallback(record)
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
							Ext.getCmp('UpdateResourceForm').close();	
						}
					}
				],
				items:[
				       
                   
					{
						xtype:"textfield",
						fieldLabel:"资源名",
						anchor:"100%",
						id:"resourceName",
						dataIndex:"resourceName"
					},
					{
						xtype:"textfield",
						fieldLabel:"URL",
						anchor:"100%",
						id:"url",
						dataIndex:"url"
					}
				]
			}
		]
		UpdateResourceForm.superclass.initComponent.call(this);
		 Ext.getCmp('resourceName').setValue(record[0].get("resourceName"));
		 Ext.getCmp('url').setValue(record[0].get("url"));
	},
	updateResources : function(record){
		var resourcesName=Ext.get("resourceName").dom.value;
		var url=Ext.get("url").dom.value;
		var sid=record[0].get("sid");
		Ext.Ajax.request({
			 url : __ctxPath + "/resources/updateResources",
 		    method:'post', 
				params : {
					 _method : "POST", 
					 resourcesName:resourcesName,
					 url: url,
					 sid:sid
					 
				},
				success : function() {
					Ext.Msg.alert('信息提示','保存成功');
					Ext.getCmp('resourceslist').getStore().load();
					Ext.getCmp('UpdateResourceForm').close();	
					
				},
				failure:function(){
					Ext.Msg.alert('信息提示','保存失败，请与管理员联系');
				}
		});
	}
})