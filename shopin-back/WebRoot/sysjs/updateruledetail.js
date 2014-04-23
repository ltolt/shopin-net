UpdatePhotoDetailForm=Ext.extend(Ext.Window ,{
	detailpanel : null,
	  formpanel   : null,
	  constructor : function(a){
		  if(a == null) {
				a = {};
			}
			Ext.apply(this, a);
			this.initComponents();
			AddPhotoDetailForm.superclass.constructor.call(this,{
				id : 'UpdatePhotoDetailForm',
				layout:'border',
				items:[
				       this.formpanel
				       ],
		        modal : true,
		        autoScroll:true,
				height : document.documentElement.clientHeight-40,
				width : document.documentElement.clientWidth-200,
				title : "修改规则明细"       
			});
	  },
	  initComponents: function(){
		
		  
		  var ruleSid=this.ruleSid;
	         var row=this.row;
		// 品类树数据源的URL
		  var proClassUrl = __ctxPath;
		  // 品类树
	  	  var proClassTree = new TreeSelector("o",proClassUrl,"品类","productClassSid"); 
	  	  proClassTree.addListener("expand",function(){
	      Ext.getCmp("oTree").addListener("click",function(){
	    	  Ext.Ajax.request({
	    		    url : __ctxPath + "/proConSearch/proClassTree",
	    		    
	    		    method:'post', 
	    		    
					params : {
						 _method : "POST", 
						 node : Ext.getCmp("productClassSid").getValue()
					},
					success : function() {
						// alert('success');
						
					},
					failure:function(){
						// alert('false');
					}
	    		  
	    	  });
	    	  
	    	  
	      });		   
	  		  
	  		  
	  	  });    
	  	  
	/*  	proClassTree.getCmp("loader").load({
	  	    	 callback : function(){
	  	    		Ext.getCmp("o").setValue(row[0].get("productClassSid"));
	  	    	 }
	  	     });*/
	  	         
	  	         var selectModel = new Ext.grid.CheckboxSelectionModel();
	  			 var mapstore = new Ext.data.ArrayStore({
	  			 fields : ['productClassSid', 'productClassName','brandSid', 'brandName'],
	  			proxy: new Ext.data.MemoryProxy()
	  			 });
	  	  
		 
		    var brandInfoStore = new Ext.data.JsonStore({	
				url : __ctxPath + "/ruleMql/brand",
				root : "result",
				baseParams : {
					_method : "POST"
					
				},
				
				remoteSort : true,
				autoLoad:true,
				fields : [
					"sid",
					"brandName"
				]
			});
		    
//		    brandInfoStore.load({
//	  	    	 callback : function(){
//	  	    		Ext.getCmp("brand").setValue(row[0].get("brandSid"));
//	  	    	 }
//	  	     });
		  	
	      
	             
	             var shopInfoStore = new Ext.data.JsonStore({
		             	url : __ctxPath + "/ruleMql/shop",
		             	root : "result",
		              	baseParams : {
			             	_method : "POST"
				
		         	},
			
		               	remoteSort : true,
		                autoLoad:true,
			            fields : [
			                  	"sid",
			              	"shopName"
			                ]
		     });
	             
	          
	             
//	             shopInfoStore.load({
//		  	    	 callback : function(){
//		  	    		Ext.getCmp("shop").setValue(row[0].get("shopSid"));
//		  	    	 }
//		  	     });
		
	             this.detailpanel=new Ext.FormPanel({
	     			
	 				id:"detailpanel",
	 				name:"detailpanel",
	 				region: '', 
	 				frame : true,	
	 				height:document.documentElement.clientHeight-75,
	 				layoutConfig : {
	 					padding : "2"
	 				},
	 				items:[{
	 					layout:'column',
	 					items:[{
	 						columnWidth:.5,
	 			    		layout:'form',
	 			    		items:[
	 			    			{
	 								xtype:"textfield",
	 								fieldLabel:"折扣区间最小值",
	 								anchor:"50%",
	 								//allowBlank: false,
	 								name : 'offMin',
	 					        	id : 'offMin',
	 		                        xtype: 'numberfield'
	 							},
	 							{
	 								xtype:"textfield",
	 								fieldLabel:"折扣区间最大值",
	 								anchor:"50%",
	 								//allowBlank: false,
	 								name : 'offMax',
	 					        	id : 'offMax',
	 		                        xtype: 'numberfield',
	 		                        validationEvent : 'blur',
	 							       validationOnChange : false,
	 							       validator : function(value){
	 							       		var aa = Ext.getCmp('detailpanel').form.findField("offMin").getValue();
	 							       		 if(value<aa){
	 							       		 	Ext.Msg.alert("","折扣区间最大值应大于等于折扣区间最小值");
	 							       		 }
	 							       }
	 							},
	 							{
	 								xtype:"textfield",
	 								fieldLabel:"价格区间最小值",
	 								anchor:"50%",
	 								//allowBlank: false,
	 								name : 'priceMin',
	 					        	id : 'priceMin',
	 		                        xtype: 'numberfield'
	 							},
	 							{
	 								xtype:"textfield",
	 								fieldLabel:"价格区间最大值",
	 								anchor:"50%",
	 								//allowBlank: false,
	 								name : 'priceMax',
	 					        	id : 'priceMax',
	 		                        xtype: 'numberfield',
	 		                        validationEvent : 'blur',
	 							       validationOnChange : false,
	 							       validator : function(value){
	 							       		var aa = Ext.getCmp('detailpanel').form.findField("priceMin").getValue();
	 							       		 if(value<aa){
	 							       		 	Ext.Msg.alert("","价格区间最大值应大于等于价格区间最小值");
	 							       		 }
	 							       }
	 							},
	 							{
	 								xtype:"textfield",
	 								fieldLabel:"库存区间最小值",
	 								anchor:"50%",
	 								//allowBlank: false,
	 								name : 'stockMin',
	 					        	id : 'stockMin',
	 		                        xtype: 'numberfield'
	 								
	 							},
	 							{
	 								xtype:"textfield",
	 								fieldLabel:"库存区间最大值",
	 								anchor:"50%",
	 								//allowBlank: false,
	 								name : 'stockMax',
	 					        	id : 'stockMax',
	 		                        xtype: 'numberfield',
	 		                        validationEvent : 'blur',
	 							       validationOnChange : false,
	 							       validator : function(value){
	 							       		var aa = Ext.getCmp('detailpanel').form.findField("stockMin").getValue();
	 							       		 if(value<aa){
	 							       		 	Ext.Msg.alert("","库存区间最大值应大于等于库存区间最小值");
	 							       		 }
	 							       }
	 								
	 							}
	 			    		]
	 					},
	 					{
	 						columnWidth:.5,
	 			    		layout:'form',
	 			    		items:[
	 {
	 						xtype:"textfield",
	 						fieldLabel:"销售编码",
	 						anchor:"50%",
	 						name : 'saleCode',
	 						id : 'saleCode',
	 					//	allowBlank: false,
	 					    xtype: 'textfield'
	 						
	 					},
	 					{
	 						xtype:"textfield",
	 						fieldLabel:"销售数量",
	 						anchor:"50%",
	 						name : 'saleSum',
	 						id : 'saleSum',
	 					//	allowBlank: false,
	 					    xtype: 'textfield'
	 					},
	 					{
	 						xtype:"datefield",
	 						fieldLabel:"变价时间",
	 						anchor:"50%",
	 						name : 'priceUpdateTime',
	 						id : 'priceUpdateTime',
	 						//allowBlank: false,
	 					    format:"Y-m-d H:i:s"
	 					},
	 					{
	 						xtype:"combo",
	 						id:'shop',
	 						triggerAction:"all",
	 						fieldLabel:"门店",
	 						store:shopInfoStore,						
	 						name : 'shopName',
	 						hiddenName:"shopSid",
	 						autoWidth:true,
	 						mode:'local',
	 						multiSelect:true,
	 						triggerAction : "all",
	 						valueField: 'sid',
	 						displayField:'shopName',
	 						anchor:"30%",
	 					//allowBlank: false,
	 						listeners:{
	 							select:function(e,f,g){
	 								
	 								shopName=Ext.get("shop").dom.value;
	 								 shopSid = Ext.getCmp('shop').getValue();
	 								// alert(brandSid);
	 								 
	 							}
	 						}
	 					},
	 					
	 					proClassTree,
	 					{
	 						xtype:"combo",
	 						triggerAction:"all",
	 						fieldLabel:"品牌",
	 						id:'brand',
	 						name:"brandSid",
	 					    hiddenName:"brandSid",
	 						autoWidth:true,
	 						mode:'local',
	 						allowBlank: false,
	 						triggerAction : "all",
	 						valueField: 'sid',
	 						displayField:'brandName',
	 						store:brandInfoStore,
	 						anchor:"30%",
	 						listeners:{
	 							select:function(e,f,g){
	 								brandName=Ext.get("brand").dom.value;
	 								 brandSid = Ext.getCmp('brand').getValue();
	 								// alert(brandSid);
	 								 
	 							}
	 						}
	 					}]
	 					},
	 					{
	 						columnWidth:.5,
	 			    		layout:'form',
	 			    		items:[
	 			    			{
	 								xtype:"grid",
	 								title:"品牌-品类对应关系",
	 								id:"mapgrid",
	 								height:139,
	 								anchor:"60%",
	 								store:mapstore,
	 								sm : selectModel,
	 								columns:[
	 								     	selectModel,
	 									
	 									{
	 										header:"品类",
	 										sortable:true,
	 										resizable:true,
	 										dataIndex:"productClassName",
	 										width:100
	 								},
	 								{
	 										header:"品牌",
	 										sortable:true,
	 										resizable:true,
	 										dataIndex:"brandName",
	 										width:100
	 								}
	 									],
	 									bbar:[
	 		                                 {
	 			                               xtype:"button",
	 			                               text:"保存对应关系",
	 			                               ctCls: 'x-btn-over',
	 			                               iconCls: 'button_save',
	 			                               handler:  function(){
	 				                              var  productClassSid= Ext.getCmp("productClassSid").getValue();
	 				                              var  productClassName= Ext.getCmp("o").getValue();
	 				                              brandName=Ext.get("brand").dom.value;
	 				    						 brandSid = Ext.getCmp('brand').getValue();
	 				                              var json="['"+productClassSid +"','"+productClassName +"','"+brandSid+"','"+brandName+"']";
	 				                              var defaultData = {
	 				                            		  productClassSid: productClassSid,
	 				                            		  productClassName: productClassName,
	 				                            		  brandSid: brandSid,
	 				                            		  brandName: brandName 
	 				                                  };
	 				                            var p = new mapstore.recordType(defaultData); 
	 			                                     mapstore.add(p);
	 			                                    	mapstore.load();
	 			                                     }

	 		                                     },
	 		                                     {
	 		      	                               xtype:"button",
	 		      	                               text:"删除对应关系",
	 		      	                             ctCls: 'x-btn-over',
	 		      	                            iconCls: 'button_cancel',
	 		      	                               handler:  function(){
	 		      	                            	   
	 		      	                            	 var row = null;
	 		      	                               row = Ext.getCmp("mapgrid").getSelectionModel().getSelections();
	 		      	                               if (row.length < 1) {
	 		      	                                   Ext.Msg.alert(" 提示消息", "至少选择一条数据！");
	 		      	                               }
	 		      	                               else {
	 		      	                                   for (var i = 0; i < row.length; i++) {
	 		      	                                	mapstore.remove(row[i]);
	 		      	                                
	 		      	                                   }
	 		      	                               }
	 		      	                            	 
	 		      	                                     }
	 		                                           }
	 		                                         

	 										]	
	 							}
	 							
	 			    		]
	 					},
	 					  {
	 							name : "productClassSid",
	 							id : "productClassSid",
	 							xtype : "hidden"
	 						},
	 						{
	 							name : "brandSid",
	 							id : "brandSid",
	 							xtype : "hidden"
	 						}]
	 				}],
	 				
	 				bbar:new Ext.Toolbar({
	 					buttonAlign: 'center',
	 					height:40,
	 					items:[
	 					{
	 							xtype:"button",
	 							text:"保存明细",
	 							repeat:false,
	 							preesed:true,
	 							height:30,
	 							width:80,
	 							ctCls: 'x-btn-over',
	 							iconCls: 'button_save',
	 							allowDepress:true,
	 							 handler: this.savedetail.createCallback(mapstore,row)
	 						},
	 					{
	 						xtype:'button',
	 						preesed:true,
	 						height:30,
	 						width:80,
	 						ctCls: 'x-btn-over',
	 						iconCls: 'button_cancel',
	 						text:'取消',
	 						handler:function(){
	 							Ext.getCmp('UpdatePhotoDetailForm').close();
	 							
	 						}
	 					}]
	 				})
	 			}
	 		);
	     		
	     		this.formpanel = new Ext.Panel({
	     			  id : 'formpanel',
	     			  region:'center',
	     			  height:'100%',
	     			  width:'100%',
	     			  layout : "column",
	     			  items:[{
	     							columnWidth : 1,
	     							items : [this.detailpanel]
	     						}
	     			         ]
	     		  });
		Ext.getCmp('offMin').setValue(row[0].get("offMin"));
		Ext.getCmp('offMax').setValue(row[0].get("offMax"));
		Ext.getCmp('priceMin').setValue(row[0].get("priceMin"));
		Ext.getCmp('priceMax').setValue(row[0].get("priceMax"));
		Ext.getCmp('stockMin').setValue(row[0].get("stockMin"));
		Ext.getCmp('stockMax').setValue(row[0].get("stockMax"));
		Ext.getCmp('saleCode').setValue(row[0].get("saleCode"));
		Ext.getCmp('saleSum').setValue(row[0].get("saleSum"));
		Ext.getCmp('priceUpdateTime').setValue(row[0].get("priceUpdateTime"));
		
	},
savedetail : function(mapstore,row){
	 var form = Ext.getCmp('detailpanel').getForm();
	 var size = mapstore.getCount();
	if(form.isValid()){
	 if(size==0){
		 Ext.Msg.alert('信息提示','请保存品牌——品类对应关系');
	}else{
	var priceUpdateTime = "";
	var offMax = Ext.getCmp('detailpanel').form.findField("offMax").getValue();
	var offMin = Ext.getCmp('detailpanel').form.findField("offMin").getValue();
	var priceMin = Ext.getCmp('detailpanel').form.findField("priceMin").getValue();
	var priceMax = Ext.getCmp('detailpanel').form.findField("priceMax").getValue();
	var stockMin = Ext.getCmp('detailpanel').form.findField("stockMin").getValue();
	var stockMax = Ext.getCmp('detailpanel').form.findField("stockMax").getValue();
	var saleCode = Ext.getCmp('detailpanel').form.findField("saleCode").getValue();
	var saleSum = Ext.getCmp('detailpanel').form.findField("saleSum").getValue();
	var priceUpdateTime = Ext.getCmp('detailpanel').form.findField("priceUpdateTime").getValue();
	var shopName=Ext.get("shop").dom.value;
	var shopSid = Ext.getCmp('shop').getValue();
	mapstore.each(function(r){
		var	productClassSid=r.get('productClassSid');
		var	productClassName=r.get('productClassName');
		var	brandSid=r.get('brandSid');
		var	brandName=r.get('brandName');
		var json="['"+offMin+"','"+offMax+"','"+priceMin+"','"+priceMax+"','"+stockMin+"','"+stockMax+"','"+productClassSid+"','"+productClassName+"','"+brandSid+"','"+brandName+"','"+shopSid+"','"+shopName+"','"+saleCode+"','"+saleSum+"','"+priceUpdateTime+"']";
		if(priceUpdateTime != ""){
			priceUpdateTime = priceUpdateTime.format('Y-m-d H:i:s')
		}
		  var defaultData = {
				  ruleSid:row[0].get("ruleSid"),
	              sid:row[0].get("sid"),
                  productClassSid: productClassSid,
                  productClassName: productClassName,
                  brandSid: brandSid,
                  brandName: brandName ,
                  offMax:offMax,
                  offMin:offMin,
                  priceMin:priceMin,
                  priceMax:priceMax,
                  stockMin:stockMin,
                  stockMax:stockMax,
                  saleCode:saleCode,
                  saleSum:saleSum,
                  shopSid:shopSid,
                  shopName:shopName,
                  priceUpdateTime:priceUpdateTime
                };
		  var detailstore = Ext.getCmp('detailgrid').getStore();
         var p = new detailstore.recordType(defaultData); 
         detailstore.remove(row[0]);
         detailstore.add(p);
         
      
        
         
	})
//     Ext.getCmp('detailgrid').getStore().load();
	Ext.getCmp('UpdatePhotoDetailForm').close();
	}
	
}

}

})