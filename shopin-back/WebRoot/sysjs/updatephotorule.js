UpdatePhotoRuleForm=Ext.extend(Ext.Window ,{
xtype:"window",
	title:"修改规则",
	id:"UpdatePhotoRuleWin",
	modal:true,
	height : document.documentElement.clientHeight,
	width : document.documentElement.clientWidth-60,
	autoDestroy:false,
	autoScroll:false,
	initComponent: function(){
		
		
		var json = this.json;
		var ruleSid=Ext.decode(json).obj.sid;
		  var detaildata= Array();
		  var selectModel = new Ext.grid.CheckboxSelectionModel();
		  
		 	
		  	var detailstore = new Ext.data.JsonStore({
		  		
		  		
				url : __ctxPath + "/ruleMql/findDetails",
				root : "list",
				baseParams : {
					_method : "POST",
					 sid:Ext.decode(json).obj.sid
					
				},
				
				remoteSort : true,
				autoLoad:true,
				 fields : ["sid",
				           "ruleSid",
				           "brandSid",
				           "productClassSid",
				           "productClassName",
				           "brandName",
				           "offMin",
							"offMax",
							"priceMin",
							"priceMax",
							"stockMin",
							"stockMax",
							"shopSid",
							"shopName",
							"saleCode",
							"saleSum",
							"priceUpdateTime"]
			});
		 
		
		var channelInfoStore = new Ext.data.JsonStore({
	  		
	     		
		             	url : __ctxPath + "/ruleMql/channel",
		             	root : "result",
		              	baseParams : {
			             	_method : "POST"
				
		         	},
			
		               	remoteSort : true,
		                autoLoad:true,
			            fields : [
			                  	"sid",
			              	"channelName"
			                ]
		     });
		     
		
		
		this.items=[
			{
				xtype:"form",
				id:'rulepanel',
				labelWidth:100,
				labelAlign:"left",
				layout:"form",
				height : document.documentElement.clientHeight-40,
				width : document.documentElement.clientWidth-80,
				items:[
					{
						fieldLabel:"规则名称",
						xtype:"textfield",
						anchor:"25%",
						id : "ruleName",
						name : "ruleName",
						allowBlank: false
				},
					{
						xtype:"datefield",
						fieldLabel:"有效起始时间",
						name : 'activeBeginTime',
						id : 'activeBeginTime',
						format:"Y-m-d H:i:s",
						anchor:"20%"
					},
					{
						xtype:"datefield",
						name : 'activeEndTime',
						id : 'activeEndTime',
						fieldLabel:"有效结束时间",
						format:"Y-m-d H:i:s",
						anchor:"20%",
						validationEvent : 'blur',
				        validationOnChange : false,
				        validator : function(value){
				       		var aa = Ext.getCmp('rulepanel').form.findField("activeBeginTime").getValue();
				       		var gedt = Ext.util.Format.date(aa, 'Y-m-d H:i:s');
				       		if(value<gedt){
				       		 	//Ext.Msg.alert("","结束时间应大于开始时间");
				       		 	alert("结束时间应大于开始时间");
				       		 }
				       } 
					},
					{
						name : "channelSids",
						id : "channelSids",
						xtype : "hidden"
					},
					{
						fieldLabel : "修改人",
						id : "updateUser",
						name : "updateUser",
						value: username,
						xtype : "textfield",
						hidden:true
						

					},
					{
						fieldLabel : "修改时间",
						id : "updateTime",
						name : "updateTime",
						value: new Date(),
						format:"Y-m-d H:i:s",
						xtype : "datefield",
						hidden:true
					},
					{
						id : "action",
						name : "action",
						xtype : "hidden",
						value : "/ruleMql/saveRule"
					},
					{
						id : "_method",
						name : "_method",
						xtype : "hidden",
						value : "POST"	
					},
					{
						xtype:"grid",
						title:"规则明细表",
						height:document.documentElement.clientHeight-100,
						width : document.documentElement.clientWidth-80,
						id:"detailgrid",
						store:detailstore,
						sm : selectModel,
						viewConfig:{
							forceFit:true
						},
						columns:[
                            selectModel,
							{
								header:"销售编码",
								sortable:true,
								resizable:true,
								id:"saleCode",
								dataIndex:"saleCode",
								width:100
							},
							{
								header:"销售数量",
								sortable:true,
								resizable:true,
								id:"saleSum",
								dataIndex:"saleSum",
								width:100
							},
							{
								header:"品牌",
								sortable:true,
								resizable:true,
								id:"brandName",
								dataIndex:"brandName",
								width:100
							},
							{
								header:"品牌sid",
								sortable:true,
								resizable:true,
								id:"brandSid",
								dataIndex:"brandSid",
								width:100,
								hidden:true
							},
							{
								header:"品类",
								sortable:true,
								resizable:true,
								id:"productClassName",
								dataIndex:"productClassName",
								width:100
							},
							{
								header:"品类sid",
								sortable:true,
								resizable:true,
								id:"productClassSid",
								dataIndex:"productClassSid",
								width:100,
								hidden:true
							},
							{
								header:"门店",
								sortable:true,
								resizable:true,
								id:"shopName",
								dataIndex:"shopName",
								width:100
							},
							{
								header:"折扣最小值",
								sortable:true,
								resizable:true,
								id:"offMin",
								name:"offMin",
								dataIndex:"offMin",
								width:100
							},
							{
								header:"折扣最大值",
								sortable:true,
								resizable:true,
								id:"offMax",
								dataIndex:"offMax",
								width:100
							},
							{
								header:"价格最小值",
								sortable:true,
								resizable:true,
								id:"priceMin",
								dataIndex:"priceMin",
								width:100
							},
							{
								header:"价格最大值",
								sortable:true,
								resizable:true,
								id:"priceMax",
								dataIndex:"priceMax",
								width:100
							},
							{
								header:"库存最小值",
								sortable:true,
								resizable:true,
								id:"stockMin",
								dataIndex:"stockMin",
								width:100
							},
							{
								header:"库存最大值",
								sortable:true,
								resizable:true,
								id:"stockMax",
								dataIndex:"stockMax",
								width:100
							},
							{
								header:"价格更新时间",
								sortable:true,
								resizable:true,
								id:"priceUpdateTime",
								dataIndex:"priceUpdateTime",
								width:100,
								format:"Y-m-d H:i:s"
							}
						],
						tbar:new Ext.Toolbar({
						    height:35,
						    buttonAlign:'right',
							items:[
								{
								text:"修改规则明细",
								height:30,
								ctCls: 'x-btn-over',
								iconCls: 'button_edit',
								handler:updatedetail
								}
							]	
						})
					}
					
				],
				bbar:new Ext.Toolbar({
				height:30,
				buttonAlign:'center',
				items:[
					{
						text:"保存修改",
						height:30,
						width:80,
						ctCls: 'x-btn-over',
						iconCls: 'button_save',
						handler:function(){
							
							var size = detailstore.getCount();
						
							var detailSid="";
							var brandSid="";
							 var brandName = "";
							 var offMin = "";
							 var offMax = "";
							 var priceMin = "";
							 var priceMax = "";
							 var stockMin = "";
							 var stockMax = "";
							 var shopName ="";
							 var shopSid ="";
							 var productClassName = "";
							 var priceUpdateTime = "";
							 var saleSum = "";
							 var saleCode = "";
							 var productClassSid = "";
							 var productClassName = "";
							var updateUser =  Ext.get("updateUser").dom.value;
							var ruleName = Ext.get("ruleName").dom.value;
							//var channelName = Ext.get("channel").dom.value;
							var activeBeginTime = Ext.get("activeBeginTime").dom.value;
							var activeEndTime = Ext.get("activeEndTime").dom.value;
							var updateTime = Ext.get("updateTime").dom.value;
							var channelSids = Ext.get("channelSids").dom.value;
							detailstore.each(function(record){
								
								 detailSid+=record.get('sid') + "-";
								 brandName +=record.get('brandName') + "-";
								 brandSid +=record.get('brandSid') + "-";
								 offMin +=record.get('offMin') + "-";
								 offMax +=record.get('offMax') + "-";
								 priceMin +=record.get('priceMin') + "-";
								 priceMax +=record.get('priceMax') + "-";
								 stockMin +=record.get('stockMin') + "-";
								 stockMax +=record.get('stockMax') + "-";
								 shopName +=record.get('shopName') + "-";
								 shopSid +=record.get('shopSid') + "-";
								 saleSum +=record.get('saleSum') + "-";
								 saleCode +=record.get('saleCode') + "-";
								 priceUpdateTime +=record.get('priceUpdateTime') + ",";
								 productClassName +=record.get('productClassName') + "-";
								 productClassSid +=record.get('productClassSid') + "-";
								 
							 });
							 if(detailstore == ""){
								 Ext.Msg.alert('信息提示','请添加规则明细');
							 }else{
							 
							 Ext.Ajax.request({
								  
								 url: __ctxPath + "/ruleMql/updateRule",
								 method:'post',
								 params:{
									 _method : "POST",
									 sid:ruleSid,
									 updateUser: updateUser,
									 activeEndTime:activeEndTime,
									 activeBeginTime:activeBeginTime,
									// channelName:channelName,
				   					 //channelSid:channelSids,
									 ruleName:ruleName,
									 updateTime:updateTime,
									 detailSid:detailSid,
									 offMin:offMin,
									 brandName:brandName,
									 brandSid:brandSid,
    								 offMax:offMax,
									 priceMin:priceMin,
									 priceMax:priceMax,
									 stockMin:stockMin,
									 stockMax:stockMax,
									 shopName:shopName,
									 shopSid:shopSid,
									 saleCode:saleCode,
									 saleSum:saleSum,
									 priceUpdateTime:priceUpdateTime,
									 productClassSid:productClassSid,
									 productClassName:productClassName,
									 size:size
									 
								 },
								 success:function(){
									 Ext.Msg.alert('信息提示','保存成功');
									Ext.getCmp("rulelist").getStore().reload();
									Ext.getCmp('UpdatePhotoRuleWin').close();
								
								 },
								 failure:function(){
									 Ext.Msg.alert('信息提示','保存失败，请与管理员联系');
								 }
							 });
					}
						
						}
						
						
					}
				]
				})
			}
			
			
			  
		]
		
		 
		  
		 
 UpdatePhotoRuleForm.superclass.initComponent.call(this);
		  var form = Ext.getCmp('rulepanel').getForm();
		 Ext.getCmp('ruleName').setValue(Ext.decode(json).obj.ruleName);
		 var date=Ext.decode(json).obj.activeBeginTime;
		var  activeBeginTime = new Date(Date.parse());  
		 Ext.getCmp("activeBeginTime").setValue(Ext.decode(json).obj.activeBeginTime);
		  Ext.getCmp('activeEndTime').setValue(Ext.decode(json).obj.activeEndTime);
		
		
   function updatedetail(){
	   
	      var row = null;
         row = Ext.getCmp("detailgrid").getSelectionModel().getSelections();  
         if(row==""||row.length>1){
        	 Ext.Msg.alert(" 提示消息", "请选择一条数据！");
         }else{
        	
			   new UpdatePhotoDetailForm({
				   row:row
				}).show();
			   
			   
		   }
   }
	}
  })
  
  
  