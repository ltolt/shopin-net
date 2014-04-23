FlashPromotionView= Ext.extend(Ext.Panel,{
	gridpanel : null,
	constructor:function(a){
		if(a==null){
			a={};
		}
		Ext.apply(this,a);
		this.initComponents();
		FlashPromotionView.superclass.constructor.call(this,{
			id:'FlashPromotionView',
			layout:'border',
			title: "活动管理",
			border:true,
			width:document.documentElement.clientWidth,
			height:document.documentElement.clientHeight,
			items:[
			       this.gridpanel
			]
	//		renderTo : "mainDiv"
		});
		
	},
	initComponents:function(){
		var page = 1;
		var PAGE_START_0 = 0;
		var PAGE_SIZE_20 = 20;

		/*  store的url统一为：__ctxPath + "/action"
		  baseParams包含真正的action和_method，对应shopin-back-demo系统controller的注解
		*/
		var store = new  Ext.data.JsonStore({
			url : __ctxPath + "/promotions/selectPromotionListByKey",
			root : "result.list",
			totalProperty: "result.totalRecords",
			baseParams : {
				_method : "POST",
				currentPage : page,
				pageSize: PAGE_SIZE_20,
				start : PAGE_START_0,
				limit : PAGE_SIZE_20
			},
//			remoteSort : true,
			fields : [
				
			   "sid",
			   "pageLayoutSid",
			   "pageTemplateSid",
			   "promotionTitle",
			   "promotionLink",
			   "promotionDesc",
			   "promotionSpict",
			   "promotionBpict",
			   "promotionStatus",
			   "promotionBeginTime",
			   "promotionEndTime",
			   "seq",
			   "promotionTypeSid",
			   "promotionVpict",
			   "promotionCpict",
			   "promotionCgpict"
			]
		});
		
		//自动加载grid列表
		store.load();
		
		var selectModel = new Ext.grid.CheckboxSelectionModel({singleSelect:true});
		var columnModel = new Ext.grid.ColumnModel({
			columns:[ 
			         	new Ext.grid.RowNumberer(),
			         	selectModel,
						{
							header: "活动标题：",
							dataIndex: "promotionTitle",
							width:120
							
						},{
							header: "描述：",
							dataIndex: "promotionDesc",
							width:120
						},{
							header:'开始时间',
							width:130,
							dataIndex:"promotionBeginTime"
						
						},{
							header: "结束时间",
							width:130,
							dataIndex: "promotionEndTime"
						
						},{
							header: "活动状态",
							width : 80,
							dataIndex: "promotionStatus",
							renderer:function(val){
								if(val == 1){
									return "有效";
								}else if(val == 0){
									return "无效";
								}
							}
						},{
							header : "活动链接",
							dataIndex : "promotionLink",
							width : 150
						},{
							header : "显示顺序",
							dataIndex : "seq",
							sortable : true, 
							width : 80
						},{
							header : "首页轮播焦点图",
							width : 150,
							dataIndex : "promotionSpict"
						},{
							header : "闪购大图(活动大图)",
							width : 150,
							dataIndex : "promotionBpict"
						},{
							header : "闪购正在进行图",
							width : 150,
							dataIndex : "promotionVpict"
						},{
							header : "闪购最后疯抢图",
							width : 150,
							dataIndex : "promotionCpict"
						},{
							header : "闪购预告图",
							width : 150,
							dataIndex : "promotionCgpict"
						}
			         ]
			
		});

		//装载活动类型
		var promotionTypeStore = new Ext.data.JsonStore({
         	url : __ctxPath + "/promotions/selectPromotionType",
         	root : "list",
          	baseParams : {
             	_method : "POST"
          	},
           	remoteSort : true,
            autoLoad:true,
            fields : [
                  	"sid",
              		"promotionTypeName"
                ]
		});
		
		//装载活动状态
		var promotionStateData = [{
			"state":"全部","value":""
		},{
			"state":"有效","value":"1"
		},{
			"state":"无效","value":"0"
		}];
		var stateStore = new Ext.data.JsonStore({
			fields : ["state", "value"],
			data : promotionStateData
		});	
		
		this.gridpanel= new Ext.grid.EditorGridPanel({
			id : "promotionPanel",
			region: "center",
			store:store,
			containerscroll: true,
			cm : columnModel,
			sm : selectModel,
			clicksToEdit: 1,
			loadMask : true,
			autoScroll : true,
			columnLines: true,
			viewConfig : {
				forceFit : false,
				enableRowBody : false,
				showPreview : false
			},
			tbar:new Ext.Toolbar({
			    height:30,
				width:"100%",
				columns:5,
				items:[
				    '活动id：',
				    {
				    	xtype:"textfield",
						id:"promotionSid",
						name : "proSid",
						fieldLabel:"标签",
						width:100,
						height:35
				    },
					'活动标题：',
						{
						xtype:"textfield",
						id:"promotionTitle",
						name : "title",
						fieldLabel:"标签",
						width:100,
						height:35
					},
					" "," "," "," ",
					'开始时间：',
						{
						id : "proStartTime",
						name : "startTime",
						width:150,
						xtype: "datefield",	
						format:"Y-m-d H:i:s"
					},
					" "," "," "," ",
					'结束时间：',
						{
						id : "proEndTime",
						name : "endTime",
						width:150,
						xtype: "datefield",	
						format:"Y-m-d H:i:s"
					},
					" ",
			         "活动状态：",
			         {
			        	 id : "proStatus",
			        	 name : "proStatus",
			        	 xtype : "combo",
			        	 width:80,
			        	 editable : false,
			        	 triggerAction : "all",
			        	 emptyText:"请选择",
			        	 displayField : "state",
			        	 valueField : "value",
						 store : stateStore,
						 mode : "local"
			         },
			         " ",
			         "活动类型：",
			     	{
		        		xtype:"combo",
		        		fieldLabel:"活动类型",
		        		width:100,
		        		id:'promotionTypeSid',
		        		hiddenName:"promotionTypeSid",
		        		valueField: 'sid',
		        		mode:'local',
		        		displayField:'promotionTypeName',
		        		store:promotionTypeStore,
		        		triggerAction : 'all',
		        		listeners:{
		        			select:function(e,f,g){}
		        		}
			        },
					" "," "," "," ",
					{
						
						text:"查询",
						height:20,
						width:80,
						ctCls: 'x-btn-over',
						handler:searchPromotions
					},"","",
					{
						text:"重置",
						height:20,
						width:80,
						ctCls: "x-btn-over",
						handler: function(){
							var sid = name = Ext.getCmp('promotionSid').setValue(null);
							var title = name = Ext.getCmp('promotionTitle').setValue(null);
				   			var startTime = name = Ext.getCmp('proStartTime').setValue(null);
				   			var endTime = name = Ext.getCmp('proEndTime').setValue(null);
				   			var proStatus = name = Ext.getCmp('proStatus').setValue(null);
				   			var promotionTypeSid = name =Ext.getCmp('promotionTypeSid').setValue(null);
				   			store.setDefaultSort('sid', 'desc');
						}
					}
				]
			})
			,
			
			bbar:new Ext.PagingToolbar({
				//pageSize : PAGE_SIZE_20,
				items: [
				        "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp",
                        {
                            xtype: 'button',
                            text: '活动预览',
                            ctCls: 'x-btn-over',
                            iconCls: 'button_find',
                            handler :previewPromotion
                        },
                        {
                            xtype: 'button',
                            text: '增加活动',
                            ctCls: 'x-btn-over',
                            iconCls: 'button_add',
                            handler:addflashpromotion
                        },
                        {
                            xtype: 'button',
                            text: '修改活动',
                            ctCls: 'x-btn-over',
                            iconCls: 'button_edit',
                            handler:updateflashpromotion
                        },
                        {
                            xtype: 'button',
                            text: '审核活动',
                            ctCls: 'x-btn-over',
                            iconCls: 'button_save',
                            handler: enablePromotion
                        },
                        {
                            xtype: 'button',
                            text: '作废活动',
                            ctCls: 'x-btn-over',
                            iconCls: 'button_cancel',
                            handler : disablePromotion
                        }
                    ],
				store : store,
				displayInfo : true,
				displayMsg : "当前显示{0}至{1}，共{2}条记录",
				emptyMsg : "当前没有记录",
				listeners: {
					beforechange: function(bbar, params) {
						page = Math.ceil((params.start + params.limit) / params.limit);
						var sid = name = Ext.getCmp('promotionSid').getValue();
				    	var title = name = Ext.getCmp('promotionTitle').getValue();
			   			var startTime = name = Ext.get('proStartTime').dom.value;;
			   			var endTime = name = Ext.get('proEndTime').dom.value;
			   			var proStatus = name = Ext.getCmp('proStatus').getValue();
			   			var promotionTypeSid = name =Ext.getCmp('promotionTypeSid').getValue();
			   			Ext.apply(params,{
			   				proSid:sid == "" ? null:sid,
			   				title:title == "" ? null:title,
							startTime:startTime == "" ? null:startTime,
							endTime:endTime == "" ? null:endTime,
							proStatus:proStatus == "" ? null:proStatus,
							promotionTypeSid:promotionTypeSid == "" ? null:promotionTypeSid
			   			});
					}
				}
			})
					
		});
		
	   function addflashpromotion(){
		   
		   new AddFlashPromotion({
		
			}).show();
		   
	   }
	   
	    function updateflashpromotion(){
		   var record  = Ext.getCmp('promotionPanel').getSelectionModel().getSelected();
	 //   alert(record.get('sid'));
	    if(record!=null){
		   new UpdateFlashPromotion({
			record:record
			}).show();
	    }else{
	    	alert("请选择要修改的活动");
	    }
		   
	   }
	    this.gridpanel.on('rowdblclick', function (grid) {
			  
			var t =grid.getSelectionModel().getSelected().get('pageLayoutSid');
			
			FlashPromotionView.create(t);
	});
		
		
	   
		
       function searchPromotions(){
    	    var sid = name = Ext.getCmp('promotionSid').getValue();
	    	var title = name = Ext.getCmp('promotionTitle').getValue();
   			var startTime = name = Ext.get('proStartTime').dom.value;;
   			var endTime = name = Ext.get('proEndTime').dom.value;
   			var proStatus = name = Ext.getCmp('proStatus').getValue();
   			var promotionTypeSid = name =Ext.getCmp('promotionTypeSid').getValue();
   			if(endTime != "" && startTime != "" && endTime < startTime) {
   				Ext.Msg.alert("错误", "开始时间应小于结束时间");
   			} else {
   				store.setDefaultSort('sid', 'desc');
   	   			store.load({
   					params:{
   						currentPage: page,
   						proSid:sid == "" ? null:sid,
   						title:title == "" ? null:title,
   						startTime:startTime == "" ? null:startTime,
   						endTime:endTime == "" ? null:endTime,
   						proStatus:proStatus == "" ? null:proStatus,
   						promotionTypeSid:promotionTypeSid == "" ? null:promotionTypeSid
   					},
   					callback: function(r,options,success){
   						if(success == false){
   							Ext.Msg.alert("提示","查询数据为空");
   							store.removeAll();
   						}
   					}
   				});
   			}
        }
       //活动预览
		function previewPromotion() {
			var record  = Ext.getCmp('promotionPanel').getSelectionModel().getSelected();
			if(record != null){
				var href = 'http://172.16.103.145/promotion/'+ record.get('sid') + '.html';
				window.open(href);
			}else{
		   		Ext.Msg.alert("","请选择要预览的活动");
			}
		}
       //审核活动
       function enablePromotion() {
    		var record  = Ext.getCmp('promotionPanel').getSelectionModel().getSelected();
    		if(record != null){
    			Ext.Msg.show({
    				title:'提示消息',
    				icon:Ext.MessageBox.QUESTION,
    				msg:'确认审核？',
    				buttons: Ext.MessageBox.YESNO,
    				fn:function(btn){
    					if(btn=='yes'){
    						Ext.Ajax.request({
    						   url: __ctxPath + "/promotions/updatePromotionStatus",
    						   _method:'POST',
    						   params: { 
    								_method : "POST",
    								sid: record.get('sid'),
    								promotionStatus:1
    							   },
    						   success: function(){
    						      Ext.Msg.alert('信息提示','审核成功');
    						      store.reload(); 
    						     },
    						     failure: function(){
    						          Ext.Msg.alert('信息提示','审核失败，请与管理员联系');
    			             	}
    			         	});
    					}
    				}
    			});  
    		}else{
    	   		Ext.Msg.alert("","请选择要审核的活动");
    		}
    	}

       //作废活动
    	function disablePromotion() {
    		var record  = Ext.getCmp('promotionPanel').getSelectionModel().getSelected();
    		if(record != null){
    			Ext.Msg.show({
    				title:'提示消息',
    				icon:Ext.MessageBox.QUESTION,
    				msg:'确认作废？',
    				buttons: Ext.MessageBox.YESNO,
    				fn:function(btn){
    					if(btn=='yes'){
    						Ext.Ajax.request({
    						   url: __ctxPath + "/promotions/updatePromotionStatus",
    						   _method:'POST',
    						   params: { 
    								_method : "POST",
    								sid : record.get('sid'),
    								promotionStatus:0
    							   },
    						   success: function(){
    						      Ext.Msg.alert('信息提示','作废成功');
    						      store.reload(); 
    						     },
    						     failure: function(){
    						          Ext.Msg.alert('信息提示','作废失败，请与管理员联系');
    			             	}
    			         	});
    					}
    				}
    			});
    		}else{
    	   		Ext.Msg.alert("","请选择要作废的活动");
    		}
    	}
	}
});


FlashPromotionView.create = function(u){
	
	
	new Flashmanagepage({
		PageLayoutSid:u
	}).show();
	
	
}
