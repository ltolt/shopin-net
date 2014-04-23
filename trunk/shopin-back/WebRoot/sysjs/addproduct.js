//增加栏目商品窗口扩展
AddProductForm = Ext.extend(Ext.Window,{
	  searchpanel : null,
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
			AddProductForm.superclass.constructor.call(this,{
				id : 'addproductwin',
				layout:'border',
				items:[
				       this.searchpanel,this.gridpanel
				       ],
		        modal : true,
				height : document.documentElement.clientHeight,
				width : document.documentElement.clientWidth-40,
				title : "栏目商品"       
			});
	  },
	  
	  initComponents : function() {
	  
	  	  var pageLayoutSid = this.pageLayoutSid;
	  	  //品类树数据源的URL
		  var proClassUrl = __ctxPath ;
		  //品类树
	  	  var proClassTree = new TreeSelector("o",proClassUrl,"品类","productClassSid"); 
	  	  proClassTree.addListener("expand",function(){
	      Ext.getCmp("oTree").addListener("click",function(){
	    	  Ext.Ajax.request({
	    		    url : __ctxPath + "/flashpcs/proClassTree",
	    		    method:'post', 
					params : {
						 _method : "POST", 
						 node : Ext.getCmp("productClassSid").getValue()
					},
					success : function() {
						//alert('success');
						
					},
					failure:function(){
						//alert('false');
					}
	    		  
	    	  });
	    	  
	    	  
	      });		   
	  		  
	  		  
	  	  });
	  	  
	  	var pageLayoutSid = this.pageLayoutSid;
	  	
	  	var store = new Ext.data.SimpleStore({
						fields : ['id', 'search'],
						data : [['0', '来广营'],['1', '仓储店'], ['2', '亚运村'], ['3', '五棵松'],['4', '中关村'],['5', '三里河']]
					});
		  this.searchpanel = new Ext.FormPanel({
			    id:'searchpanel',
			    region: 'north', 
			    height : 120,	
			    frame : true,			   
				border : false,
				layoutConfig : {
					padding : "2"
				},
			    items:[{
			    	layout:'column',
			    	items:[{
			    		columnWidth:.2,
			    		layout:'form',
			    		items:[
			    			{
								fieldLabel : "销售编码",
								id : "saleCode",
								name : "saleCode",
								xtype : "textfield",
								//allowBlank: false,
								anchor:'95%'
							},
							{
								fieldLabel : "款号",
								id : "proSku",
								name : "proSku",
								xtype : "textfield",
								anchor:'95%'
							},{
								fieldLabel : "品牌",
								id : "brandName",
								name : "brandName",
								xtype : "textfield",
								anchor:'95%'
							},{
								id : "action",
								name : "action",
								xtype : "hidden",
								value : "/flashpcs/search"
							}, {
								id : "_method",
								name : "_method",
								xtype : "hidden",
								value : "POST"
							},{
								name : "productClassSid",
								id : "productClassSid",
								xtype : "hidden"
							},
							{
								name : "pageLayoutSid",
								id : "pageLayoutSid",
								value:pageLayoutSid,
								xtype : "hidden"
							}
			    		]
			    	},{
			    		columnWidth:.3,
			    		layout:'form',
			    		items:[proClassTree]
			    			
			    	},{
			    		columnWidth:.3,
			    		layout:'form',
			    		items:[{
			    			xtype: 'combo',
			    			fieldLabel: '门店',
			    			name : 'shopName',
							mode : 'local',
							store : store,
							displayField : 'search'
			    			 
			    		}]
			    			
			    	},{
			    		columnWidth:.2,
			    		layout:'form',
			    		items:[{
			    			 xtype: 'compositefield',
			    			 fieldLabel: '折扣区间',
			    			 combineErrors: false,
			    			 items:[
			    			        {
			    			        	   name : 'offMin',
			    			        	   id : 'offMin',
			                               xtype: 'numberfield',
			                               width: 50,
			                               allowBlank: false
			    			        },{
			    			        	   xtype: 'displayfield',
			                               value: '--'
			    			        },
			    			        {
			    			        	   name : 'offMax',
			    			        	   id : 'offMax',
			                               xtype: 'numberfield',
			                               width: 50,
			                               allowBlank: false,
			                               validationEvent : 'blur',
									       validationOnChange : false,
									       validator : function(value){
									       		var aa = Ext.getCmp('searchpanel').form.findField("offMin").getValue();
									       		 if(value<aa){
									       		 	Ext.Msg.alert("","输入值应大于等于最小值");
									       		 }
									       }
			    			        }]
			    		
			    		
			    			}]
			    	},{
			    		columnWidth:.3,
			    		layout:'form',
			    		items:[{
			    			 xtype: 'compositefield',
			    			 fieldLabel: '库存区间',
			    			 combineErrors: false,
			    			 items:[
			    			        {
			    			        	   name : 'stockMin',
			    			        	   id : 'stockMin',
			                               xtype: 'numberfield',
			                               width: 50,
			                               allowBlank: false
			    			        },{
			    			        	   xtype: 'displayfield',
			                               value: '--'
			    			        },
			    			        {
			    			        	   name : 'stockMax',
			    			        	   id : 'stockMax',
			                               xtype: 'numberfield',
			                               width: 50,
			                               allowBlank: false,
			                               validationEvent : 'blur',
									       validationOnChange : false,
									       validator : function(value){
									       		var aa = Ext.getCmp('searchpanel').form.findField("stockMin").getValue();
									       		 if(value<aa){
									       		 	Ext.Msg.alert("","输入值应大于等于最小值");
									       		 }
									       } 
			    			        }]
			    		
			    		
			    			}]
			    	},{
			    		columnWidth:.3,
			    		layout:'form',
			    		items:[{
			    			 xtype: 'compositefield',
			    			 fieldLabel: '价格区间',
			    			 combineErrors: false,
			    			 items:[
			    			        {
			    			        	   name : 'priceMin',
			    			        	   id : 'priceMin',
			                               xtype: 'numberfield',
			                               width: 50
			                           //    allowBlank: false
			    			        },{
			    			        	   xtype: 'displayfield',
			                               value: '--'
			    			        },
			    			        {
			    			        	   name : 'priceMax',
			    			        	   id : 'priceMax',
			                               xtype: 'numberfield',
			                               width: 50,
			                               validationEvent : 'blur',
									       validationOnChange : false,
									       validator : function(value){
									       		var aa = Ext.getCmp('searchpanel').form.findField("priceMin").getValue();
									       		 if(value<aa){
									       		 	Ext.Msg.alert("","输入价格应大于等于最小价格");
									       		 }
									       }
			                            //   allowBlank: false
			    			        }]
			    		
			    		
			    			}]
			    	},{
			    		columnWidth:.3,
			    		layout:'form',
			    		items:[{
			    			 xtype: 'compositefield',
			    			 fieldLabel: '销售金额',
			    			 combineErrors: false,
			    			 items:[
			    			        {
			    			        	   name : 'saleMoneyMin',
			    			        	   id:'saleMoneyMin',
			                               xtype: 'numberfield',
			                               width: 50
			                            //   allowBlank: false
			    			        },{
			    			        	   xtype: 'displayfield',
			                               value: '--'
			    			        },
			    			        {
			    			        	   name : 'saleMoneyMax',
			                               xtype: 'numberfield',
			                               width: 50,
			                             //  allowBlank: false
			                               validationEvent : 'blur',
									       validationOnChange : false,
									       validator : function(value){
									       		var aa = Ext.getCmp('searchpanel').form.findField("saleMoneyMin").getValue();
									       		 if(value<aa){
									       		 	Ext.Msg.alert("","输入金额应大于等于最小金额");
									       		 }
									       }
			    			        }]
			    		
			    		
			    			}]
			    	},{
			    		columnWidth:.3,
			    		layout:'form',
			    		items:[{
			    			 xtype: 'compositefield',
			    			 fieldLabel: '上架时间',
			    			 combineErrors: false,
			    			 items:[
			    			        {
			                               xtype: 'datefield',
			    			        	   name : 'proSellingBeginTime',
			    			        	   id : 'proSellingBeginTime',
			                               format:"Y-m-d H:i:s"
			                            //   width: 25,
			                              // allowBlank: false
			    			        },{
			    			        	   xtype: 'displayfield',
			                               value: '--'
			    			        },
			    			        {
			                               xtype: 'datefield',
			    			        	   name : 'proSellingEndTime',
			    			        	   id : 'proSellingEndTime',
			                               format:"Y-m-d H:i:s",
			                             //  width: 25,
			                              // allowBlank: false
			                               validationEvent : 'blur',
									       validationOnChange : false,
									       validator : function(value){
									       		var aa = Ext.getCmp('searchpanel').form.findField("proSellingBeginTime").getValue();
									       		var gedt = Ext.util.Format.date(aa, 'Y-m-d H:i:s');
									       		if(value<gedt){
									       		 	//Ext.Msg.alert("","结束时间应大于开始时间");
									       		 	alert("结束时间应大于开始时间");
									       		 }
									       } 
			    			        }]
			    		
			    		
			    			}]
			    	},{
			    		columnWidth:.3,
			    		layout:'form',
			    		items:[{
			    			 xtype: 'compositefield',
			    			 fieldLabel: '变价时间',
			    			 combineErrors: false,
			    			 hidden:true,
			    			 items:[
			    			        {
			    			        	   name : 'proBeginTime',
			    			        	   id : 'proBeginTime',
			                               xtype: 'datefield',
			                                format:"Y-m-d H:i:s"
			                            //   width: 25,
			                             ///  allowBlank: false
			    			        },{
			    			        	   xtype: 'displayfield',
			                               value: '--'
			    			        },
			    			        {
			    			        	   name : 'proEndTime',
			    			        	   id : 'proEndTime',
			                               xtype: 'datefield',
			                               format:"Y-m-d H:i:s",
			                             //  width: 25
			                            //   allowBlank: false
			                               validationEvent : 'blur',
									       validationOnChange : false,
									       validator : function(value){
									       		var aa = Ext.getCmp('searchpanel').form.findField("proBeginTime").getValue();
									       		var format = Ext.util.Format.date(aa, 'Y-m-d');
									       		if(value<format){
									       		 	//Ext.Msg.alert("","结束时间应大于开始时间");
									       		 	alert("结束时间应大于开始时间");
									       		 }
									       }
			    			        }]
			    		
			    		
			    			}]
			    	}
			    	]
			           }],
			           buttons : [
								{
								    text   : '查询商品',
								    handler: this.search.createCallback(this)
								}
			                      
			                      
			                      
			                      ]
				
			  
		  });
		  
		  /*
		  store的url统一为：__ctxPath + "/action"
		  baseParams包含真正的action和_method，对应shopin-back-demo系统controller的注解
		*/
		
		 
//		  var tree = new Ext.tree.TreePanel({  
//	       	loader : loader, 
//			collapsible : true,
//			split : true,
//			height : 260,
//			autoScroll : true,
//       		animate : true,
//       		containerscroll: true,
//       		enableDragDrop:true,
//			//border : true,
//	        root:new Ext.tree.AsyncTreeNode({id:0,text:'频道栏目',leaf:false})
//	       // rootVisible : false
//	        
//			
// 		   });
// 		var sid =pageLayoutSid;
//		var loader = new Ext.tree.TreeLoader({
//			 url:__ctxPath +'/action'		 
//		 });
//		 var sid = this.channelSid;
//		 loader.on('beforeload', function(loader, node) {
//			    ////alert(node.id);
//			    loader.baseParams = {
//						action : "/pageLayout/tree?pageLayoutSid=2",
//						_method : "POST",
//						nodeId : node.id
//					    //pageLayoutSid:this.channelSid	
//				};
//			});
//    tree.on('click',function(node){  
//         //this.searchpanel.findById('combotree').hiddenField.value = node.id;    
//          this.searchpanel.findById('combotree').setRawValue(node.text);   //给combo设置显示的值  
//                 });     
//    this.searchpanel.findById('combotree').on('expand',function(){  
//        tree.render('tree');  
//    });
//		   
//		
//    
		var store = new  Ext.data.JsonStore({
			//url : __ctxPath + "/action",
			root : "result",
//			baseParams : {
//				action : "/pcs/search",
//				_method : "POST"
//			},
			//totalProperty : "data.totalRecords",
			//remoteSort : true,
			fields : [
				"sid",
				"proSku",
				"brandName",
				"productName",
				"proOldPrice",
				"proCurPrice",
				"proPmtPrice",
				"proStock",
				"shopName",
				"totalSumMoney",
				"totalSaleSum",
				"proSellingTime",
				"productImages"
			]
		});
		  
		var selectModel = new Ext.grid.CheckboxSelectionModel();
		var columnModel = new Ext.grid.ColumnModel({
			columns:[
			         	selectModel,
			         	{
							header : "款号",
							width : 15,
							dataIndex : "proSku",
							sortable: true
						},{
							header : "品牌",
							width : 15,
							dataIndex : "brandName",
							sortable: true
						},
			         	{
							header : "商品名称",
							width : 15,
							dataIndex : "productName",
							sortable: true
						},
			         	{
			         		header : "原价",
							dataIndex : "proOldPrice",
							width:15,
							sortable: true
							
			         	},{
							header : "现价",
							dataIndex : "proCurPrice",
						    width : 15,
						    sortable: true
						},{
							header : "活动价",
							dataIndex : "proPmtPrice",
						    width : 15,
						    sortable: true
						},{
							header : "库存",
							dataIndex : "proStock",
						    width : 15,
						    sortable: true
						},{
							header : "门店",
							dataIndex : "shopName",
						    width : 15,
						    sortable: true
						},{
							header:'已售金额',
							dataIndex:'totalSumMoney',
							width:15,
							sortable: true
						},{
							header:'已售数量',
							dataIndex:'totalSaleSum',
							width:15,
							sortable: true
						},{
							header:'上架时间',
							dataIndex:'proSellingTime',
							width:15,
							sortable: true
						}
			         ]
		});

		
		  this.selectpanel = new Ext.grid.GridPanel({
			    id : "productlist",
				autoHeight : false,
				height:document.documentElement.clientHeight-150,
				border : true,
				title : "待选择商品",
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
				},
				bbar:new Ext.Toolbar({
					height:40,
					buttonAlign:'center',
					items:[
//					{
//						xtype:'button',
//						preesed:true,
//						align:'center',
//						height:30,
//						width:80,
//						ctCls: 'x-btn-over',
//						 iconCls: 'button_find',
//						text:'全选',
//						handler:function(){
//						var model =	Ext.getCmp('productlist').getSelectionModel();
//						model.selectAll();// 选中表中所有记录
//				    }
//						
//					},'-',{
//						 xtype : 'tbspacer'
//					},
					{
						 xtype:'button',
						 align:'center',
						 height:30,
						 width:80,
						 id:'aaa',
						 ctCls: 'x-btn-over',
						 iconCls: 'button_add',
						 text:'加入已选择列表',
						 handler:function(){
						
							 
							 var store = Ext.getCmp('productlist').getStore();
							 var array = Ext.getCmp('productlist').getSelectionModel().getSelections();
							 if(array==""){
								 Ext.Msg.alert('信息提示','请选择商品');
							 }
							 else{
								
							//alert('json=' + json);
							 var str = "{'success':'true','result':[";
							 var n = [];
							 var p = [];
							 var s = [];
							 for(var i=0;i<array.length;i++){
							 	//if(array[i].get('sid')!=array[i+1].get('sid')){
							 	var Index = Ext.getCmp('productlist').store.indexOf(array[i]);
							 		 p.push(Index);
							 //	}
								 if(n.indexOf(array[i].get('sid')) == -1){
									 n.push(array[i].get('sid'));
									 s.push(array[i]);
									 str += "{'sid':'" + array[i].get('sid') + "','proSku':'" + array[i].get('proSku') 
									 + "','productName':'" +array[i].get('productName') + "'},";
									
									 }
								 	 
								 
								// alert(store.getById(array[i].get('sid')));
							 }
							 str += "]}";
							// alert("n=" + n);
							 p.sort(function(a,b){return a<b?1:-1});
							// alert("p=" + p);
							// alert("str = " +  str);
							 for(var j=0;j<s.length;j++){
//								 var index =  Ext.getCmp('rproductlist').getStore().filterBy('sid',n[j]);
//								 Ext.getCmp('rproductlist').getStore().filterBy(function(record){
//									 return record.get('sid')==n[j];
//								 });
								//	aa = Ext.getCmp('productlist').store.getAt(p[j])
								
								 store.each(function(record){
									 if(record==s[j]){
										 Ext.getCmp('rproductlist').getStore().add(s[j]);
									 }
									  if(record.get('sid')==n[j]){
									  Ext.getCmp('productlist').store.remove(record);
									 } 
								 });
								
								 //alert( "index = " + index);
								 
								 //store.remove(index);
							 }
							// alert( "ssss = " + s);
//							  for(var j=0;j<n.length;j++){
//								 store.each(function(record){
//									 if(record.get('sid')==n[j]){
//									  Ext.getCmp('productlist').store.remove(record);
//									 	
//									 }
//									 
//								 });
//							 }
							 
						 }
						 } 
						 
					}]
				})
		  });
		  
		  this.selectpanel.on('rowdblclick', function (selectpanel) {
			     
			     var store = Ext.getCmp('productlist').getStore();
				 var title = Ext.getCmp('productlist').getSelectionModel().getSelected().get('productName');
				 var productSid = Ext.getCmp('productlist').getSelectionModel().getSelected().get('sid');
			
				 
				 Ext.Ajax.request({
					 url: __ctxPath + "/flashpcs/queryPic",
					 method:'post',
					 params:{
						 _method : "POST",
						 productSid:productSid
					 },
					 success:function(response){
						 var json = response.responseText;
						 var picUrl= Ext.decode(json).productImages;
						 var winProductInfo=new Ext.Window({  
		                     title:title,  
		                     width:200,  
		                     height:200,  
		                     closeAction:'hide',  
		                     plain:true,//true则主体背景透明，false则和主体背景有些差别  
		                     collapsible:true,//是否可收缩  
		                     modal:true,//是否为模式窗体  
		                    items:[
		                        new Ext.Panel({   
		                        border:false,  
		                     
		                        layout:'fit',  
		                       
		                        items:[  
		                            {  
		                                xtype:'box',
		                                id:'CategoryImage',  
		                                width:100,  
		                                height:165,  
		                                autoEl:{  
		                                    tag:'image',  
		                                    src:image + picUrl  
		                                }  
		                            }  
		                        ]  
		                    })]
		             }); 
						 
						  winProductInfo.show();
						 
						
					 }
				 });
				
				 
				
				
		});
		//var aa = {'sid':'827','proSku':'YDOF3003-T','productName':'2009套头衫YDOF3003-T'};
		// var str = {'success':'true','result':[]};
		  var rstore = new  Ext.data.JsonStore({
				//url : __ctxPath + "/action",
		  	//	data:str,
				root : "result",
//				baseParams : {
//					action : "/pcs/search",
//					_method : "POST"
//				},
				//totalProperty : "data.totalRecords",
				//remoteSort : true,
				fields : [
					"sid",
					"proSku",
					"productName"
				]
			});
			  
			var rselectModel = new Ext.grid.CheckboxSelectionModel();
			var rcolumnModel = new Ext.grid.ColumnModel({
				columns:[
				         	//rselectModel,
				         	{
								header : "款号",
								width : 15,
								dataIndex : "proSku"
							},
				         	{
								header : "商品名称",
								width : 15,
								dataIndex : "productName"
							}
				         ]
			});

			
		  
		  this.resultpanel= new Ext.grid.GridPanel({
			    id : "rproductlist",
				autoHeight : false,
				height:document.documentElement.clientHeight-150,
				border : true,
				title : "已选择商品",
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
				},
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
						text:'保存',
						handler:function(){
							 var productSids = "";
							 
							 rstore.each(function(record){
								 productSids += record.get('sid') + ",";
							 });
							// alert('str = ' + productSids);
							 if(productSids == ""){
								 Ext.Msg.alert('信息提示','没有可保存的商品，请选择商品');
							 }else{
							 
							 Ext.Ajax.request({
								 url: __ctxPath + "/flashpcs/saveproducts",
								 method:'post',
								 params:{
									 _method : "POST",
									 pageLayoutSid: pageLayoutSid,
									 productSids:productSids
								 },
								 success:function(){
									 Ext.Msg.alert('信息提示','保存成功');
									 rstore.removeAll();
									// store.removeAll();
								 },
								 failure:function(){
									 Ext.Msg.alert('信息提示','保存失败，请与管理员联系');
								 }
							 });
						}
							
						}
					}]
				})
				
				
		  });

    
    
		
    
		

		  this.resultpanel.on('rowdblclick', function (resultpanel) {
		  		 var p = [];
			     var rstore = Ext.getCmp('rproductlist').getStore();
			     var store = Ext.getCmp('productlist').getStore();
				 var array = Ext.getCmp('rproductlist').getSelectionModel().getSelections();
				 
				 for(var i=0;i<array.length;i++){
					 var Index = rstore.indexOf(array[i]);
				 		 p.push(Index);
					 }
				 	// alert(p);
				//var t =resultpanel.getSelectionModel().getSelected().get('sid');
				 p.sort(function(a,b){return a<b?1:-1});
				for(var j=0;j<p.length;j++){
					 var t =rstore.getAt(p[j]);
					 rstore.each(function(record){
						//alert(t);
						 if(record==t){
							 rstore.remove(record);
						 }
						 
					 });
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
			  items:[
						{
							columnWidth : 0.75,
							items : [
								this.selectpanel
							]
						}, {
							columnWidth : 0.05,
							items:[
							       
							       ]
						},
						{
							columnWidth : 0.2,
							items : [
								this.resultpanel
							]
						}
			         
			         ]
		  });
	  },
	 
	  search : function(a){
		 // alert('search');
		  var form = Ext.getCmp('searchpanel').getForm();
		 // var aa = Ext.getCmp('searchpanel').form.findField("priceMin").getValue();
		//var aa = Ext.get("searchpanel").dom.value;
		  //alert(form.isValid());
		  if(form.isValid()){
			  form.submit({
				  waitMsg : "正在提交数据……",
				  url : __ctxPath + "/flashpcs/search",
				  success : function(form,action){
					  //alert('success');
					  var e = Ext.util.JSON.decode(action.response.responseText);
					  json = action.response.responseText;
					  //alert(action.response.responseText);
					  Ext.getCmp('productlist').getStore().loadData(e);
				  }
			  });
		  }
		  else{
		  	alert("必填项不能为空");
		  }
	  }
	
	  
});




