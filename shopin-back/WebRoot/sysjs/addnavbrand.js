AddNavBrandWindow=Ext.extend(Ext.Window ,{
	gridpanel : null,
	constructor:function(a){
		if(a==null){
			a={};
		}
		Ext.apply(this,a);
		this.initComponents();
		NaviView.superclass.constructor.call(this,{
			id:'AddNavBrand',
			layout:'fit',
			border:true,
			modal:true,
			width:document.documentElement.clientWidth-500,
			height:document.documentElement.clientHeight-60,			
			items:[this.gridpanel],
			title:'添加品牌',
			renderTo : "mainDiv"
		});	
	},
	initComponents:function(){
		
		var navSid=this.navSid;

		/*  store的url统一为：__ctxPath + "/action"
		  baseParams包含真正的action和_method，对应shopin-back-demo系统controller的注解
		*/
		var store = new  Ext.data.JsonStore({
			url : __ctxPath + "/navigation/queryBrand",
			root : "result",
			baseParams : {
				_method : "POST"
				
			},
			totalProperty : "result",
			remoteSort : true,
			fields : [
			    "sid",
				"brandName",
				"brandpic2"
			]
		});
		//store.load();
		var selectModel = new Ext.grid.CheckboxSelectionModel();
		var columnModel = new Ext.grid.ColumnModel({
			columns:[
			         	selectModel,
			         	{
						header:"中文名称",
						sortable:true,
						resizable:true,
						dataIndex:"brandName",
						width:100
					},
					{
						header:"图片地址",
						sortable:true,
						resizable:true,
						dataIndex:"brandpic2",
						width:100,
						hiden:true
					},
					{
						header:"品牌Sid",
						sortable:true,
						resizable:true,
						dataIndex:"sid",
						width:100
						
					}

			         
			         ]
			
			
			
		});

		
		this.gridpanel= new Ext.grid.GridPanel({
			id : "brandslist",
			width:document.documentElement.clientWidth-200,
            height:document.documentElement.clientHeight-400,
			border : false,
			title : "品牌",
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
						'品牌名称:',
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
					text:'保存品牌',
					height:30,
					width:80,
					align:'center',
					ctCls: 'x-btn-over',
					iconCls: 'button_add',
					handler:addnavbrand
					
				}]
			})
					
		});
		
		
		
		
		 function addnavbrand(){
               var row = null;
                 row = Ext.getCmp("brandslist").getSelectionModel().getSelections();
                 if (row.length < 1) {
                     Ext.Msg.alert(" 提示消息", "请选择品牌！");
                 }
                 else {
                	 
                	 for(i=0;i<row.length;i++){
                		 var brandSid=row[i].get("sid");
                		 var brandName=row[i].get("brandName");
                		 var brandpic2=row[i].get("brandpic2");
                		 Ext.Ajax.request({
							 url: __ctxPath + "/navigation/saveNavBrand",
							 method:'post',
							 params:{
								 _method : "POST",
								 navSid: navSid,
								 brandSid:brandSid,
								 brandName:brandName,
								 brandPic:brandpic2
							 },
							 success:function(){
								 Ext.Msg.alert('信息提示','保存成功');
//								 Ext.getCmp('AddNavBrand').hide();
								 Ext.getCmp('navbrandslist').getStore().reload();
                                   
							 },
							 failure:function(){
								 Ext.Msg.alert('信息提示','保存失败，请与管理员联系');
							 }
						 });
                	 }
                	 
                 }
				   
				   
			   }
	   
      function query(){
		var brandName=Ext.getCmp('queryName').getValue();
		store.load( {
		params:{
			brandName:brandName
		}		
		}
		);
		   
		   
	   }

	}

})