UpdateItemForm = Ext.extend(Ext.Window ,{
	form : null,
	resource : null,
	constructor:function(a){
		if(a==null){
			a={};
		}
		Ext.apply(this,a);
		this.initComponents();
		UpdateItemForm.superclass.constructor.call(this,{
			id:'updateSort',
			modal:true,
			resizable:false,
			width:document.documentElement.clientWidth-885,
			height:document.documentElement.clientHeight-330,
			items:[{
				columnWidth:1,
				items:[
				       this.form
				       ]
			}],
			title:'导航模板维护',
			renderTo : "mainDiv"
		});	
	},
	initComponents:function(){
		var sid = this.sid;
		var moduleName = this.moduleName;
		var channelSid=this.channelSid;
		var channelFlush = this.channelSid;
		
		
		var data = new  Ext.data.JsonStore({
			url:__ctxPath +"/channel/channeltree",	
			autoLoad: true,
			fields : [	"id","text"]
		});
		data.on('load',function(){Ext.getCmp('channelSid').setValue(channelSid);});
		
		this.form = new Ext.FormPanel({
				xtype:"form",
				id:"updateSortForm",
				labelWidth:80,
				labelAlign:"left",
				layout:"form",
				autoScroll : true,
       			containerscroll: true,
				height:document.documentElement.clientHeight-362,
				width:document.documentElement.clientWidth-900,
				bbar:new Ext.Toolbar({
				height:30,
				buttonAlign:'center',
					items:[
						{
							text:"修改",
							ctCls: 'x-btn-over',
							height:20,
							width:40,
							handler:updateSort
						},
						{
							text:"取消",
							height:20,
							width:40,
							ctCls: 'x-btn-over',
							handler:function(){
								Ext.getCmp('updateSort').close();
							}
						}
					]
				}),
				items:[
				       {
				    	   xtype:"textfield",
				    	   fieldLabel:"sid",
				    	   value:sid,
				    	   id : "sid",
				    	   name : "sid",
				    	   hidden:true
				       },
				       {
				    	   xtype:"textfield",
				    	   fieldLabel:"channelFlush",
				    	   value:channelFlush,
				    	   id : "channelFlush",
				    	   name : "channelFlush",
				    	   hidden:true
				       },
					{
				    	 xtype: 'combo',
						fieldLabel:"归属频道",
						anchor:"95%",
						id : "channelSid",
						hiddenName: "isValid",
						triggerAction : "all",
						editable : false,
						displayField : "text",
						valueField : "id",
						store : data,
						mode : 'local'
					},
					{
						xtype:"textfield",
						fieldLabel:"模板名称",
						anchor:"95%",
						id : "sortName",
						name : "sortName",
						value:moduleName,
						allowBlank: false
					}
				]
		
		});
		
		function updateSort(){
			var form = Ext.getCmp("updateSortForm").getForm();
			var sortName=Ext.get("sortName").dom.value;
			var sid=Ext.get("sid").dom.value;
		    if(form.isValid()){
			  form.submit({
				  waitMsg : "正在提交数据……",
				   url : __ctxPath + "/navSort/updateSort",
				   params : {
						 _method : "POST", 
						 shopChannelsSid:Ext.getCmp("channelSid").getValue(),
					},
				  success :function(form,action){
					  var shopChannelsSid=Ext.getCmp("channelFlush").getValue();
					  Ext.getCmp('updateSort').close();
					  NavSortView.findById(shopChannelsSid);
					  Ext.Msg.alert('信息提示','操作成功');
				  }
			  });
		  }
	  	}
		
	}
});