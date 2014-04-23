ChannelView= Ext.extend(Ext.Panel,{
	treepanel : null,
	gridpanel : null,
	constructor:function(a){
		if(a==null){
			a={};
		}
		Ext.apply(this,a);
		this.initComponents();
		ChannelView.superclass.constructor.call(this,{
			id:'channelview',
			layout:'column',
			border:true,
			width:document.documentElement.clientWidth,
			height:document.documentElement.clientHeight-40,
			items:[{
				
				columnWidth:0.2,
				items:[
				       this.treepanel
				       ]
			},{
				
				columnWidth:0.8,
				items:[
				       this.gridpanel
				       ]
			}],
			title:'频道管理',
			renderTo : "mainDiv"
		});	
	},
	initComponents:function(){
		var e;
		var channelSid;
		var pageName;
		var loader = new Ext.tree.TreeLoader({
			 url:__ctxPath +"/channel/channeltree"		 
		 });
		 loader.on('beforeload', function(treeloader, node) {
				treeloader.baseParams = {
					//	action : "/shopChannels/channeltree",
					//	_method : "POST"
				};
			});

		this.treepanel = new Ext.tree.TreePanel({
			id:'channelTree',
			title:'频道管理',
			collapsible : true,
			split : true,
			height : 1000,
			border : true,
			loader : loader,
			root:new Ext.tree.AsyncTreeNode({id:0,text:'频道管理',leaf:false}),
			rootVisible : false,
			listeners:{
				'click':function(node){
					pageName=node.attributes.pageName;
					channelSid=node.attributes.id;
					store.load({
					url : __ctxPath + "/flashPageLayout/queryPageLayout",
					params:{
						
						//_method : "POST",
						channelSid:channelSid
							}
					});  
					
				}
			}
		});
		/*
		  store的url统一为：__ctxPath + "/action"
		  baseParams包含真正的action和_method，对应shopin-back-demo系统controller的注解
		*/
		var store = new  Ext.data.JsonStore({
			url : __ctxPath + "/flashPageLayout/queryPageLayout",
			root : "list",
			baseParams : {
//				action : "/pageLayout/queryPageLayout",
				_method : "POST"
				//channelSid:'1'
			},
			totalProperty : "totalRecords",
			remoteSort : true,
			fields : [
				"sid",
				"title",
				"pageType",
				"seq"
				
			]
		});
		//store.load();
		var selectModel = new Ext.grid.CheckboxSelectionModel();
		var columnModel = new Ext.grid.ColumnModel({
			columns:[
			         	////selectModel,
			         	{
							header : "是否有效",
							width : 30,
							dataIndex : "pageType",
							renderer : function(c){
								if(c=="1"){
									return "<font color='green'>已生效</font>";
								}
								if(c=="0"){
									return "<font color='red'>未生效</font>";
								}
							}
						},
			         	{
			         		header : "编号",
							dataIndex : "sid",
							width:30
							
			         	},{
							header : "标题",
							dataIndex : "title",
						    width : 30	
						},
						
						{
							header : "管理",
							dataIndex : "sid",
							sortable : false,
							width : 30,
							renderer : function(r, q, o, u, p) {
								var t = o.data.sid;
								var s = "";
								s += '<a href="#" title="查看" onclick="ChannelView.create(\'' + o.data.sid + '\')">查看</a>';
								return s;
							}
						}
			         
			         ]
			
			
			
		});

		
		this.gridpanel= new Ext.grid.GridPanel({
			id : "channellist",
			//autoHeight : true,
			height:200,
			border : false,
			title : "频道信息",
			store:store,

			cm : columnModel,
			sm : selectModel,
			trackMouseOver : true,
			//disableSelection : false,
			loadMask : true,
			viewConfig : {
				forceFit : true,
				enableRowBody : false,
				showPreview : false
			},
			bbar:new Ext.Toolbar({
			   	allowDepress: true,     //是否允许按钮被按下的状态
    			enableToggle: true, 
    			height:40,
    			buttonAlign:'right',
				items:[
                 
				{
					xtype:'button',
					preesed:true,
					align:'center',
					height:30,
					width:80,
					ctCls: 'x-btn-over',
					text:'页面预览',
					iconCls: 'button_find',
					handler:pageSearch
					
				},'-',{
					xtype : 'tbspacer'
				},{
					xtype:'button',
					align:'center',
					ctCls: 'x-btn-over',
					iconCls: 'button_save',
					height:30,
					width:80,
					text:'保存选中',
					handler:saveSelect
				}]
			})
					
		});
		
		this.gridpanel.on('rowdblclick', function (grid) {
			   
				var t =grid.getSelectionModel().getSelected().get('sid');
				ChannelView.create(t);
		});
		
		 function saveSelect(){
		   var chanellselect= Ext.getCmp('channellist').getSelectionModel().getSelected();
		   
		   
		   if(chanellselect==undefined){
				Ext.Msg.alert("","请选择频道和要预览的页面");
			}else{
				
			   //var pagesid=channelSid;
			   var pageType = chanellselect.get('pageType');
			  // alert("pageType="+pageType);
				 Ext.Ajax.request({
						 url: __ctxPath + "/flashPageLayout/saveSelectPageLayout",
						 method:'post',
						 params:{
							 _method : "POST",
							 channelSid: channelSid,
							 pageType:pageType,
							 sid:chanellselect.get('sid')
						 },
						 success:function(){
							 Ext.Msg.alert('信息提示','保存成功');
							 Ext.getCmp('channellist').store.reload();
						 },
						 failure : function(){
							 Ext.Msg.alert('信息提示','保存失败，请与管理员联系');
						 }
					 });
			}
		   
		   
		   
	   }

	   function pageSearch(){
		   var chanellselect= Ext.getCmp('channellist').getSelectionModel().getSelected();
		   
		   
		   if(chanellselect==undefined){
				Ext.Msg.alert("","请选择频道和要预览的页面");
			}else{
				
				  
				   var pagesid=chanellselect.get('sid');
				   var pagename=pageName;
				   
				 window.open(" http://172.16.103.135/"+pagename+"-preview/"+pagesid+".html");
				 
				
		
			}
		   
		   
		   
	   }

	
		
	}
});


//
ChannelView.create = function(u){
	
	
	new PageLayoutList({
		channelSid:u
	}).show();
	
	
}




















