AddNavSort = Ext.extend(Ext.Window ,{
	form : null,
	resource : null,
	constructor:function(a){
		if(a==null){
			a={};
		}
		Ext.apply(this,a);
		this.initComponents();
		AddNavSort.superclass.constructor.call(this,{
			id:'addSort',
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
			title:'新增导航模板',
			renderTo : "mainDiv"
		});	
	},
	initComponents:function(){
		var channelSid = this.channelSid;
		var channelName = this.channelName;
		this.form = new Ext.FormPanel({
				xtype:"form",
				id:"addSortForm",
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
							text:"保存",
							ctCls: 'x-btn-over',
							height:20,
							width:40,
							handler:saveSort
						},
						{
							text:"取消",
							height:20,
							width:40,
							ctCls: 'x-btn-over',
							handler:function(){
								Ext.getCmp('addSort').close();
							}
						}
					]
				}),
				items:[
				       {
				    	   xtype:"textfield",
				    	   fieldLabel:"channelSid",
				    	   value:channelSid,
				    	   id : "channelSid",
				    	   name : "channelSid",
				    	   hidden:true
				       },
					{
						xtype:"textfield",
						fieldLabel:"归属频道",
						value:channelName,
						anchor:"95%",
						id : "belongChannel",
						name : "belongChannel",
						disabled:true
					},
					{
						xtype:"textfield",
						fieldLabel:"模板名称",
						anchor:"95%",
						id : "sortName",
						name : "sortName",
						allowBlank: false
					}
				]
		
		});
		
		
		function saveSort(){
			var form = Ext.getCmp("addSortForm").getForm();
			var shopChannelsSid=Ext.get("channelSid").dom.value;
			var sortName=Ext.get("sortName").dom.value;
			
		    if(form.isValid()){
			  form.submit({
				  waitMsg : "正在提交数据……",
				   url : __ctxPath + "/navSort/addSort",
 		    	method:'post', 
				params : {
					 _method : "POST", 
					 shopChannelsSid:shopChannelsSid,
					 moduleName:sortName
				},
				  success :function(form,action){
					  var shopChannelsSid=Ext.get("channelSid").dom.value;
					  Ext.getCmp('addSort').close();
					  NavSortView.findById(shopChannelsSid);
					  Ext.Msg.alert('信息提示','添加成功');
				  }
			  });
		  }
		
	  	}
		
	}
});
