UpdateBrandLink=Ext.extend(Ext.Window ,{
xtype:"window",
	title:"修改品牌链接",
	width:400,
	height:200,
	modal:true,
	id:"UpdateBrandLink",
	initComponent: function(){
		
		var record=this.record;
		
		
		this.items=[
			{
				xtype:"form",
				title:"修改品牌链接",
				labelWidth:50,
				labelAlign:"left",
				layout:"form",
				height:170,
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
							Ext.getCmp('UpdateBrandLink').close();	
						}
					}
				],
				items:[
				       
                   
					{
						xtype:"textfield",
						fieldLabel:"名称",
						anchor:"90%",
						id:"brandName",
						disabled:true
						
					},
					{
						xtype:"textfield",
						fieldLabel:"链接",
						anchor:"90%",
						id:"brandLink"
						
					}
				]
			}
		]
		UpdateBrandLink.superclass.initComponent.call(this);
		 Ext.getCmp('brandName').setValue(record[0].get("brandName"));
		 Ext.getCmp('brandLink').setValue(record[0].get("brandLink"));
	},
	updateResources : function(record){
		var brandLink=Ext.get("brandLink").dom.value;
		var sid=record[0].get("sid");
		Ext.Ajax.request({
			 url : __ctxPath + "/navigation/updatebrandlink",
 		    method:'post', 
				params : {
					 _method : "POST", 
					 brandLink: brandLink,
					 sid:sid
					 
				},
				success : function() {
					Ext.Msg.alert('信息提示','保存成功');
					Ext.getCmp('navbrandslist').getStore().reload();
					Ext.getCmp('UpdateBrandLink').close();	
					
				},
				failure:function(){
					Ext.Msg.alert('信息提示','保存失败，请与管理员联系');
				}
		});
	}
})