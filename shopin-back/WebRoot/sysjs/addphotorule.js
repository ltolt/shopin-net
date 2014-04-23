AddPhotoRuleForm=Ext.extend(Ext.Window ,{
	xtype:"window",
	title:"增加新规则",
	modal:true,
	id:'AddPhotoRuleWindow',
	height : document.documentElement.clientHeight,
	width : document.documentElement.clientWidth-60,
	autoDestroy:false,
	autoScroll:false,
	initComponent: function(){
		
		  var detaildata= Array();
	        
	        var selectModel = new Ext.grid.CheckboxSelectionModel();
			 var detailstore = new Ext.data.ArrayStore({
			 fields : ["offMin",
						"offMax",
						"priceMin",
						"priceMax",
						"stockMin",
						"stockMax",
						"productClassSid",
						"productClassName",
						"brandSid",
						"brandName",
						"shopSid",
						"shopName",
						"saleCode",
						"saleSum",
						"priceUpdateTime"],
			proxy: new Ext.data.MemoryProxy()
			// data :detaildata
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
						xtype:"combo",
						triggerAction:"all",
						fieldLabel:"渠道",
						id:'channel',
    		        	name:"channelSid",
	    			    hiddenName:"channelSid",
	    			    typeAhead: true,
		      		  	//multiSelect:true,
    					mode:'local',
    					allowBlank: false,
    					selectOnFocus:true,
    					triggerAction : "all",
    					valueField: 'sid',
    					displayField:'channelName',
						anchor:"25%",
						store:channelInfoStore,
						onSelect:function(record, index){
    							if(this.fireEvent('beforeselect', this, record, index) !== false){
    								record.set('check',!record.get('check'));
    								var str=[];//页面显示的值
    								var strvalue=[];//传入后台的值
    								var strchannel=[];
    								this.store.each(function(rc){
    									if(rc.get('check')){
    										str.push(rc.get('channelName'));
    										strvalue.push(rc.get('sid'));
    										strchannel.push(rc.get('channelName')+'_'+rc.get('sid'))
    									}
    								});
    								Ext.getCmp('channelSids').setValue(strvalue);
    								this.setValue(str.join());
    								this.value=strvalue.join();
    								//this.collapse();
    								this.fireEvent('select', this, record, index);
    							}
						    							
						}
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
						fieldLabel : "创建人",
						id : "createUser",
						name : "createUser",
						value: username,
						xtype : "textfield",
						hidden:true
						

					},
					{
						fieldLabel : "创建时间",
						id : "createTime",
						name : "createTime",
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
						sm : selectModel,
						store:detailstore,
						viewConfig : {
									  forceFit: true
									 },
						columns:[
//							new Ext.grid.RowNumberer({
//				         		header : "序号",
//				         		align:"center",
//							 	width : 40,
//							 	renderer:function(value,metadata,record,rowIndex){
//							  	return 1 + rowIndex;
//							  }
//				         	}),
                           //selectModel,
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
								header:"门店sid",
								sortable:true,
								resizable:true,
								id:"shopSid",
								dataIndex:"shopSid",
								width:100,
								hidden:true
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
							height:30,
							buttonAlign:'right',
							items:[
								{
									text:"新建规则明细",
									height:28,
									width:80,
									ctCls: 'x-btn-over',
									iconCls: 'button_add',
									handler:function(){
										AddPhotoRuleForm.creat()
									}
								},
								{
									xtype : 'tbspacer'
								},
								{
									xtype:'button',
									text:"删除规则明细",
									height:28,
									width:80,
									ctCls: 'x-btn-over',
									iconCls: 'button_del',
									 handler:  function(){
	      	                               var row = null;
	      	                               row = Ext.getCmp("detailgrid").getSelectionModel().getSelections();
	      	                               if (row.length < 1) {
	      	                                   Ext.Msg.alert(" 提示消息", "至少选择一条数据！");
	      	                               }
	      	                               else {
	      	                               	
	      	                               	Ext.Msg.show({
												title:'提示消息',
												icon: Ext.MessageBox.QUESTION,
												msg:'确认删除?',
												buttons: Ext.MessageBox.YESNO,
												fn:function(btn){
													if(btn=='yes'){
														 for (var i = 0; i < row.length; i++) {
							      	                      	detailstore.remove(row[i]);
														   }
													    detailstore.load();
													}
												}
												});
	      	                               }
									 }
									 
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
						xtype:'button',
						text:"保存",
						height:30,
						width:80,
						ctCls: 'x-btn-over',
						iconCls: 'button_save',
						handler:function(){
							 var form = Ext.getCmp('rulepanel').getForm();
							 var size = detailstore.getCount();
							 if(form.isValid()){
							 var brandName = "";
							 var brandSid = "";
							 var shopSid = "";
							 var shopName = "";
							 var offMin = "";
							 var offMax = "";
							 var priceMin = "";
							 var priceMax = "";
							 var stockMin = "";
							 var stockMax = "";
							 var productClassName = "";
							 var priceUpdateTime = "";
							 var saleSum = "";
							 var saleCode = "";
							 var productClassSid = "";
							 var productClassName = "";
							 
					//	    var form = Ext.getCmp('rulepanel').getForm();
					//	    var channelSid= form.findField('channelSids').getValue();
							var createUser =  Ext.get("createUser").dom.value;
							var ruleName = Ext.get("ruleName").dom.value;
							var channelName = Ext.get("channel").dom.value;
							var activeBeginTime = Ext.get("activeBeginTime").dom.value;
							var activeEndTime = Ext.get("activeEndTime").dom.value;
							var createTime = Ext.get("createTime").dom.value;
							var channelSids = Ext.get("channelSids").dom.value;
					///		alert(channelSids);
							detailstore.each(function(record){
								 brandName +=record.get('brandName') + "-";
								 shopSid +=record.get('shopSid') + "-";
								 shopName +=record.get('shopName') + "-";
								 brandSid +=record.get('brandSid') + "-";
								 offMin +=record.get('offMin') + "-";
								 offMax +=record.get('offMax') + "-";
								 priceMin +=record.get('priceMin') + "-";
								 priceMax +=record.get('priceMax') + "-";
								 stockMin +=record.get('stockMin') + "-";
								 stockMax +=record.get('stockMax') + "-";
								 saleSum +=record.get('saleSum') + "-";
								 saleCode +=record.get('saleCode') + "-";
								 priceUpdateTime +=record.get('priceUpdateTime') + ",";
								 productClassName +=record.get('productClassName') + "-";
								 productClassSid +=record.get('productClassSid') + "-";
								 
							 });
							 if(size == 0){
								 Ext.Msg.alert('信息提示','请添加规则明细');
							 }else{
							 Ext.Ajax.request({
								 url: __ctxPath + "/ruleMql/saveRule",
								 method:'post',
								 params:{
									 _method : "POST",
									 createUser: createUser,
									 activeEndTime:activeEndTime,
									 activeBeginTime:activeBeginTime,
									 channelName:channelName,
				   					 channelSid:channelSids,
									 ruleName:ruleName,
									 createTime:createTime,
									 
									 offMin:offMin,
    								 offMax:offMax,
									 shopSid:shopSid,
									 shopName:shopName,
									 brandSid:brandSid,
									 brandName:brandName,
									 priceMin:priceMin,
									 priceMax:priceMax,
									 stockMin:stockMin,
									 stockMax:stockMax,
									 shopName:shopName,
									 saleCode:saleCode,
									 saleSum:saleSum,
									 priceUpdateTime:priceUpdateTime,
									 productClassSid:productClassSid,
									 productClassName:productClassName,
									 size:size
									 
								 },
								 success:function(){
									 Ext.Msg.alert('信息提示','保存成功');
									 Ext.getCmp('rulelist').getStore().load();
									 	Ext.getCmp('AddPhotoRuleWindow').close();
								 },
								 failure:function(){
									 Ext.Msg.alert('信息提示','保存失败，请与管理员联系');
								 }
							 });
					}
						}
						}
						
						
					}
				]
				})
			}
		]
		AddPhotoRuleForm.superclass.initComponent.call(this);
		
	 AddPhotoRuleForm.creat = function (){
			   
			   new AddPhotoDetailForm({
				   detaildata:detaildata
				}).show();
			   
			   
		   }
	}
	
  })
  
  
  