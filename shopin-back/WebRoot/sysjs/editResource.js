//增加栏目商品窗口扩展
EditResourceWindow = Ext.extend(Ext.Window,{
	  gridpanel   : null,
	  selectpanel : null,
	  resultpanel : null,
	  json : null,
	  constructor : function(a){
		  if(a == null) {
				a = {};
			}
			Ext.apply(this, a);
			this.initComponents();
			EditResourceWindow.superclass.constructor.call(this,{
				id : 'editRoesourceWin',
				layout:'border',
				items:[
				      this.gridpanel
				       ],
		        modal : true,
				height : document.documentElement.clientHeight,
				width : document.documentElement.clientWidth-40,
				title : "修改资源"       
			});
	  },
	  
	  initComponents : function() {
	  	
	  	var sid = this.sid;
	  	var roleName = this.roleName;
	  	
	  	var resource = this.resource;
		var store = new  Ext.data.JsonStore({
			url : __ctxPath + "/resources/selectResources",
			root : "list",
			baseParams : {
				_method : "POST",
				sid:sid
			},
			remoteSort : true,
		    autoLoad:true,
			fields : [
				"sid",
				"resourceName",
				"url"
				
			]
		});
	//	store.load();
		
		var selectModel = new Ext.grid.CheckboxSelectionModel();
		var columnModel = new Ext.grid.ColumnModel({
			columns:[
			         	selectModel,
			         	{
							header : "sid",
							width : 15,
							dataIndex : "sid",
							sortable: true
						},{
							header : "资源名",
							width : 15,
							dataIndex : "resourceName",
							sortable: true
						},
			         	{
							header : "资源URL",
							width : 15,
							dataIndex : "url",
							sortable: true
						}
			         ]
		});

		
		  this.selectpanel = new Ext.grid.GridPanel({
			    id : "productlist",
				autoHeight : false,
				height:document.documentElement.clientHeight-80,
				border : true,
				title : roleName+"的资源",
				store:store,
				cm : columnModel,
				sm : selectModel,
				autoScroll:true,
				trackMouseOver : true,
				//disableSelection : false,
				loadMask : true,
				viewConfig : {
					forceFit : true,
					enableRowBody : false,
					showPreview : false
				}
				
		  });
		  
		//var aa = {'sid':'827','proSku':'YDOF3003-T','productName':'2009套头衫YDOF3003-T'};
		// var str = {'success':'true','result':[]};
		  var rstore = new  Ext.data.JsonStore({
			url : __ctxPath + "/resources/selectOthers",
			root : "list",
			baseParams : {
				_method : "POST",
				sid:sid
			},
			remoteSort : true,
		  //  autoLoad:true,
			fields : [
				"sid",
				"resourceName",
				"url"
				
			]
			});
			
			rstore.load();
			var rselectModel = new Ext.grid.CheckboxSelectionModel();
			var rcolumnModel = new Ext.grid.ColumnModel({
				columns:[
				         	//rselectModel,
				         	{
							header : "sid",
							width : 15,
							dataIndex : "sid",
							sortable: true
						},{
							header : "资源名",
							width : 15,
							dataIndex : "resourceName",
							sortable: true
						},
			         	{
							header : "资源URL",
							width : 15,
							dataIndex : "url",
							sortable: true
						}
				         ]
			});

			
		  
		  this.resultpanel= new Ext.grid.GridPanel({
			    id : "rproductlist",
				autoHeight : false,
				height:document.documentElement.clientHeight-80,
				border : true,
				title : "备选资源",
				store:rstore,
				autoScroll:true,
				cm : rcolumnModel,
				sm : rselectModel,
				trackMouseOver : true,
				//disableSelection : false,
				loadMask : true,
				viewConfig : {
					forceFit : true,
					enableRowBody : false,
					showPreview : false
				}
				
		  });
		
		
		  
			/*Ext.apply(Ext.form.VTypes,{
			    password:function(val,field){//val指这里的文本框值，field指这个文本框组件，大家要明白这个意思
			      if(field.confirmTo){//confirmTo是我们自定义的配置参数，一般用来保存另外的组件的id值
			          var pwd=Ext.get(field.confirmTo);//取得confirmTo的那个id的值
			          return (val>pwd.getValue());
			      }
			      return true;
			    }*/
		//});
		 
		  this.gridpanel = new Ext.Panel({
			  id : 'selectproduct',
			  region:'center',
			  height:'100%',
			  width:'100%',
			  layout : "column",
			  bbar:new Ext.Toolbar({
					buttonAlign: 'center',
					height:40,
					items:[
					{
						xtype:'button',
						preesed:true,
						height:30,
						width:80,
						ctCls: 'x-btn-over',
						iconCls: 'button_save',
						text:'确定',
						handler:save
					},{
						xtype:'button',
						preesed:true,
						height:30,
						width:80,
						ctCls: 'x-btn-over',
						iconCls: 'button_del',
						text:'取消',
						handler:function(){
							Ext.getCmp("editRoesourceWin").close();
						}
					}]
			  }),
			  items:[
						{
							columnWidth : 0.45,
							items : [
								this.selectpanel
							]
						}, {
							columnWidth : 0.05,
							items:[
								{
									xtype:'button',
									ctCls: 'x-btn-over',
									height:20,
									width:50,
									text:'>>',
									handler:function(){
										var t = Ext.getCmp('productlist').getSelectionModel().getSelected();
								 		store.each(function(record){
										if(record == t){
											 store.remove(record);
											 rstore.add(record);
										 }
										 })
									}
								}]
								
						},
						 {
							columnWidth : 0.05,
							items:[
								{
									xtype:'button',
									ctCls: 'x-btn-over',
									height:20,
									width:50,
									text:'<<',
									handler:function(){
										var t = Ext.getCmp('rproductlist').getSelectionModel().getSelected();
								 		rstore.each(function(record){
										if(record == t){
											 rstore.remove(record);
											 store.add(record);
										 }
										 })
									}
								}]
								
						},
						{
							columnWidth : 0.45,
							items : [
								this.resultpanel
							]
						}
			         
			         ]
		  });
		  
		  function save(){
		  	var resourceName = [];
		 // 	var resourceSid = "";
		  	var resourceSid = [];
					  	store.each(function(record){
					 // 		resourceSid += record.get("sid")+",";
					  		resourceSid.push(record.get("sid"));
					  		resourceName.push(record.get("resourceName"));
					  	})
					  	//	alert(aa.length);
					  		Ext.getCmp('updateRoleForm').form.findField("resource").setValue(resourceName);
					  		Ext.getCmp('updateRoleForm').form.findField("resourceSid").setValue(resourceSid);
							Ext.getCmp("editRoesourceWin").close();
						}
	  }
	
	  
});




