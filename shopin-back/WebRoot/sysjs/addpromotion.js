AddPromotionWindow=Ext.extend(Ext.Window ,{
	gridpanel : null,
	constructor:function(a){
		if(a==null){
			a={};
		}
		Ext.apply(this,a);
		this.initComponents();
		NaviView.superclass.constructor.call(this,{
			id:'AddPromotion',
			layout:'fit',
			border:true,
			modal:true,
			width:document.documentElement.clientWidth-500,
			height:document.documentElement.clientHeight-60,			
			items:[this.gridpanel],
			title:'添加活动',
			renderTo : "mainDiv"
		});	
	},
	initComponents:function(){
		
		var navSid=this.navSid;
		
		/*  store的url统一为：__ctxPath + "/action"
		  baseParams包含真正的action和_method，对应shopin-back-demo系统controller的注解
		*/
		var store = new  Ext.data.JsonStore({
			url : __ctxPath + "/navigation/queryPromotion",
			root : "list",
			baseParams : {
				_method : "POST"
				
			},
			totalProperty : "list",
			remoteSort : true,
			fields : [
			    "sid",
				"promotionTitle",
				"promotionLink"
			]
		});
		var selectModel = new Ext.grid.CheckboxSelectionModel();
		var columnModel = new Ext.grid.ColumnModel({
			columns:[
			         	selectModel,
			         	{
						header:"活动名称",
						sortable:true,
						resizable:true,
						dataIndex:"promotionTitle",
						width:100
					},
					{
						header:"活动链接",
						sortable:true,
						resizable:true,
						dataIndex:"promotionLink",
						width:100
						
					},
					{
						header:"活动Sid",
						sortable:true,
						resizable:true,
						dataIndex:"sid",
						width:100,
						hidden:true
						
					}

			         
			         ]
			
			
			
		});

		
		this.gridpanel= new Ext.grid.GridPanel({
			id : "promotions",
			width:document.documentElement.clientWidth-200,
            height:document.documentElement.clientHeight-400,
			border : false,
			title : "活动",
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
			    buttonAlign:'life',
				items:[
						'活动名称:',
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
					text:'保存活动',
					height:30,
					width:80,
					align:'center',
					ctCls: 'x-btn-over',
					iconCls: 'button_add',
					handler:addnavpro
					
				}]
			})
					
		});
		
		
		
		
		 function addnavpro(){
               var row = null;
                 row = Ext.getCmp("promotions").getSelectionModel().getSelections();
                 if (row.length < 1) {
                     Ext.Msg.alert(" 提示消息", "请选择活动！");
                 }
                 else {
                	 
                	 for(i=0;i<row.length;i++){
                		
                		 var promotionSid=row[i].get("sid");
                		 
                		 Ext.Ajax.request({
							 url: __ctxPath + "/navigation/saveNavPromotion",
							 method:'post',
							 params:{
								 _method : "POST",
								 navSid: navSid,
								 promotionSid:promotionSid
							 },
							 success:function(){
								 Ext.Msg.alert('信息提示','保存成功');
//								 Ext.getCmp('AddPromotion').hide();
								var store = Ext.getCmp('promotionslist').getStore().reload();
                                   
							 },
							 failure:function(){
								 Ext.Msg.alert('信息提示','保存失败，请与管理员联系');
							 }
						 });
                	 }
                	 
                 }
				   
				   
			   }
	   
      function query(){
		var proNmae=Ext.getCmp('queryName').getValue();
		store.load( {
		params:{
			proNmae:proNmae
		}		
		}
		);
		   
		   
	   }

	}

})