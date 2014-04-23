//增加闪购活动窗口扩展
UpdateFlashPromotion = Ext.extend(Ext.Window,{
	  updatepanel : null,
	  formpanel   : null,
	  selectpanel : null,
	  json : null,
	  constructor : function(a){
		  if(a == null) {
				a = {};
			}
			Ext.apply(this, a);
			this.initComponents();
			UpdateFlashPromotion.superclass.constructor.call(this,{
				id : 'UpdateFlashPromotion',
				layout:'border',
				items:[
				       this.formpanel
				       ],
		        modal : true,
				height : document.documentElement.clientHeight-40,
				width : document.documentElement.clientWidth-200,
				title : "修改活动"       
			});
	  },
	  
	  initComponents : function() {
	  		var sid = this.record.get('sid');
	  		var promotionTitle = this.record.get('promotionTitle');
	  		var pageTemplateSid = this.record.get('pageTemplateSid');
	  		var promotionTypeSid = this.record.get('promotionTypeSid');
	  		var promotionLink = this.record.get('promotionLink');
	  		var promotionDesc = this.record.get('promotionDesc');
	  		var promotionBeginTime = this.record.get('promotionBeginTime');
	  		var promotionEndTime = this.record.get('promotionEndTime');
	  		var promotionSpict = this.record.get('promotionSpict');
	  		var promotionBpict = this.record.get('promotionBpict');
	  		var promotionVpict = this.record.get('promotionVpict');
	  		var promotionCpict = this.record.get('promotionCpict');
	  		var promotionCgpict = this.record.get('promotionCgpict');
	  		var seq = this.record.get('seq');
	  
	  			
	   Ext.form.TextField.override({  
                initComponent: Ext.form.TextField.prototype.initComponent.createInterceptor(function(){  
                    if (this.allowBlank === false && this.fieldLabel && this.fieldLabel.indexOf('*') < 0) {  
                        this.fieldLabel = '<font color=red>*</font>'+this.fieldLabel;  
                    }  
                })  
            }); 
            
	  	     var pageTemplateStore = new Ext.data.JsonStore({
		             	url : __ctxPath + "/promotions/selectPageTemplateByType",
		             	root : "list",
		              	baseParams : {
			             	_method : "POST"
				
		         	},
			
		               	remoteSort : true,
		                autoLoad:true,
			            fields : [
			                  	"sid",
			              		"name"
			                ]
		     });
		     
		     //pageTemplateStore加载完成后 ，赋初始值
	  	     pageTemplateStore.load({
	  	    	 callback : function(){
	  	    		Ext.getCmp("pageTemplate").setValue(pageTemplateSid);
	  	     
	  	    	 }
	  	     });
	  	     
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
		     
		      //promotionTypeStore加载完成后 ，赋初始值
	  	     promotionTypeStore.load({
	  	    	 callback : function(){
	  	    		Ext.getCmp("promotionType").setValue(promotionTypeSid);
	  	    		var value= Ext.getCmp("promotionType").getValue();
	  	    		if(value == "5") {
						Ext.getCmp('promotionSpictFile').hide();
						Ext.getCmp('promotionSpict').hide();
					} else {
						Ext.getCmp('promotionSpictFile').show();
						Ext.getCmp('promotionSpict').show();
					} 
	  	    	 }
	  	     });
		     
		  this.updatepanel = new Ext.FormPanel({
			    id:'updateform',
			    region: '', 
			    height : document.documentElement.clientHeight-75,
			    frame : true,			   
				border : false,
				autoScroll:true,
				fileUpload:true,
				layoutConfig : {
					padding : "2"
				},
			    items:[
			    	{
			    	layout:'column',
			    	items:[
			    		{
					    		columnWidth:.5,
					    		layout:'form',
					    		items:[
					    			{
					    		columnWidth:.6,
					    		layout:'form',
					    		items:[
					    			{
										fieldLabel : "活动标题",
										name : "promotionTitle",
										allowBlank: false,
										xtype : "textfield",
										value:promotionTitle,
										anchor:'50%'
									},
									{
										fieldLabel : "sid",
										name : "sid",
										xtype : "hidden",
										value:sid,
										anchor:'50%'
									}]
					    		},{
						    		columnWidth:.6,
						    		layout:'form',
						    		items:[
						    			{
											fieldLabel : "活动描述",
											xtype : "textarea",
											name : 'promotionDesc',
											value:promotionDesc,
											anchor:'50%'
										}]
							    	},{
						    		columnWidth:.5,
						    		layout:'form',
						    		items:[
						    			{
											fieldLabel : "显示顺序",
											xtype : "textfield",
											name:'seq',
											value:seq,
											anchor:'50%'
										}]
						    		}
			    		]
			    		},	
				    	{
				    	columnWidth:.5,
			    		layout:'form',
			    		items:[
								{
						    	columnWidth:.5,
					    		layout:'form',
					    		items:[
								{
									xtype:"combo",
									fieldLabel:"活动模型",
									id:'pageTemplate',
			    					mode:'local',
			    					hiddenName:"pageTemplateSid",
			    					valueField: 'sid',
			    					displayField:'name',
			    					allowBlank: false,
									store:pageTemplateStore,
									anchor:"50%",
									listeners:{
			    						select:function(e,f,g){
			    							 
					    				}
									}
								}]
						    	},{
					    		columnWidth:.6,
					    		layout:'form',
					    		items:[
					    			{
										xtype:"combo",
										fieldLabel:"活动类型",
				    		       // 	autoWidth:true,
				    		        	id:'promotionType',
				    		        	hiddenName:"promotionTypeSid",
			    						valueField: 'sid',
				    					mode:'local',
				    					allowBlank: false,
				    					displayField:'promotionTypeName',
										store:promotionTypeStore,
										anchor:"50%",
										listeners:{
				    						select:function(e,f,g){
				    							var flag = Ext.getCmp('promotionSpict').hidden;
				    							var value = e.value;
			    								//5 表示闪购活动,闪购活动则隐藏轮播图
				    							if(value == "5" && flag == false) {
				    								Ext.getCmp('promotionSpictFile').hide();
		//		    								Ext.get('promotionSpict_box').dom.style.display = "none";
				    								Ext.getCmp('promotionSpict').hide();
				    							} else if(flag == true){
				    								Ext.getCmp('promotionSpictFile').show();
		//		    								Ext.get('promotionSpict_box').dom.style.display = "";
				    								Ext.getCmp('promotionSpict').show();
				    							} 
					    					}
					    					}
										
					    			}]
					    		},{
					    		columnWidth:.5,
					    		layout:'form',
					    		items:[
					    			{
										fieldLabel : "活动链接",
										xtype : "textfield",
										name:'promotionLink',
										value:promotionLink,
										anchor:'50%'
									}]
					    		},{
					    		columnWidth:.5,
					    		layout:'form',
					    		items:[{
					    			 xtype: 'datetimefield',
					    			 fieldLabel: '开始时间',
					    			 id:'promotionBeginTime',
					    			 name : 'promotionBeginTime',
					    			 value:promotionBeginTime,
					    			 anchor:'50%',
					    			 format:"H:i"
					    			 
					    			}]
					    		},{
					    		columnWidth:.5,
					    		layout:'form',
					    		items:[{
					    			 xtype: 'datetimefield',
					    			 fieldLabel: '结束时间',
					    			 id : 'promotionEndTime',
					    			 name : 'promotionEndTime',
					    			 value:promotionEndTime,
					    			 format:"H:i",
					    			 anchor:'50%',
					    			 validationEvent : 'blur',
							         validationOnChange : false,
							         validator : function(value){
							       		var aa = Ext.getCmp('updateform').form.findField("promotionBeginTime").getValue();
							       		var gedt = Ext.util.Format.date(aa, 'Y-m-d H:i:s');
							       		if(value<gedt){
							       		 	//Ext.Msg.alert("","结束时间应大于开始时间");
							       		 	alert("结束时间应大于开始时间");
							       		 }
							       }
					    			 
					    			}]
					    		}
				    	]
				    	},
				    	{
				    		columnWidth:.5,
				    		layout:'form',
				    		items:[{
						    		columnWidth:.9,
						    		layout:'form',
						    		items:[{
						    			 xtype : 'fileuploadfield',
										id : 'promotionBpictFile',
										name : 'promotionBpict',
										//inputType : 'file',
										fieldLabel : '闪购(活动)大图',
										allowBlank: false,
										value:promotionBpict,
										width : 280,
										listeners : {
										 'render':function(){
										  var logoFileCmp = Ext.get('promotionBpictFile-file');
										  logoFileCmp.on('change',function(field,newValue,oldValue){
										           var picPath = getFullPath(logoFileCmp.dom);
										         //  var url = 'file:///' + picPath;
										           if(Ext.isIE){
											             var image = document.getElementById("promotionBpict"); 
											             image.src = Ext.BLANK_IMAGE_URL;
											             image.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = picPath; 
										           }else{
										             //支持FF
											            // var file=document.getElementById("logoFile");
											            // var file=Ext.get('logoFile').dom;
														// var objectURL = window.URL.createObjectURL(file.files[0]);
										           	Ext.get('promotionBpict').dom.src =picPath;
										           }
										         },this);
										         }
											}
						    			 
						    			}
						    			
						    			
						    			
						    			]
						    		},{
					    			columnWidth:.9,
						    		layout:'form',
						    		items:[{
						    			 	xtype : 'box',
						    			 	width : 200,
		                            		height : 120,
											id : 'promotionBpict',
											autoEl : {
											    tag : 'img',
											    src : flashImage + promotionBpict,  
											    style : 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);'
											}
						    			}]
					    			}
				    			
				    			]
				    		},
		    		
		    				
			    			{
				    		columnWidth:.5,
				    		layout:'form',
				    		items:[{
						    		columnWidth:.9,
						    		layout:'form',
						    		items:[{
						    			 xtype : 'fileuploadfield',
										id : 'promotionSpictFile',
										name : 'promotionSpict',
									//	inputType : 'file',
										fieldLabel : '首页轮播焦点图',
										value:promotionSpict,
										width : 280,
										listeners : {
										 'render':function(){
										  var logoFileCmp = Ext.get('promotionSpictFile-file');
										  logoFileCmp.on('change',function(field,newValue,oldValue){
										           var picPath = getFullPath(logoFileCmp.dom);
										         //  var url = 'file:///' + picPath;
										           if(Ext.isIE){
											             var image = document.getElementById("promotionSpict"); 
											             image.src = Ext.BLANK_IMAGE_URL;
											             image.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = picPath; 
										           }else{
										             //支持FF
											            // var file=document.getElementById("logoFile");
											            // var file=Ext.get('logoFile').dom;
														// var objectURL = window.URL.createObjectURL(file.files[0]);
										           	Ext.get('promotionSpict').dom.src =picPath;
										           }
										         },this);
										         }
											}
						    			 
						    			}
						    			
						    			
						    			
						    			]
						    		},{
					    			columnWidth:.9,
						    		layout:'form',
						    		items:[{
						    			 	xtype : 'box',
						    			 	width : 200,
		                            		height : 120,
											id : 'promotionSpict',
											autoEl : {
											    tag : 'img',
											    src : flashImage + promotionSpict,  
											    style : 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);'
											}
						    			}]
					    			}
				    			]
				    		},
			    			{
				    		columnWidth:.5,
				    		layout:'form',
				    		items:[{
						    		columnWidth:.9,
						    		layout:'form',
						    		items:[{
						    			 xtype : 'fileuploadfield',
										id : 'promotionVpictFile',
										name : 'promotionVpict',
										//inputType : 'file',
										fieldLabel : '闪购正在进行图',
										allowBlank: false,
										value:promotionVpict,
										width : 280,
										listeners : {
										 'render':function(){
										  var logoFileCmp = Ext.get('promotionVpictFile-file');
										  logoFileCmp.on('change',function(field,newValue,oldValue){
										           var picPath = getFullPath(logoFileCmp.dom);
										         //  var url = 'file:///' + picPath;
										           if(Ext.isIE){
											             var image = document.getElementById("promotionVpict"); 
											             image.src = Ext.BLANK_IMAGE_URL;
											             image.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = picPath; 
										           }else{
										             //支持FF
											            // var file=document.getElementById("logoFile");
											            // var file=Ext.get('logoFile').dom;
														// var objectURL = window.URL.createObjectURL(file.files[0]);
										           	Ext.get('promotionVpict').dom.src =picPath;
										           }
										         },this);
										         }
											}
						    			 
						    			}
						    			
						    			
						    			
						    			]
						    		},{
					    			columnWidth:.9,
						    		layout:'form',
						    		items:[{
						    			 	xtype : 'box',
						    			 	width : 200,
		                            		height : 120,
											id : 'promotionVpict',
											autoEl : {
											    tag : 'img',
											    src : flashImage + promotionVpict,  
											    style : 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);'
											}
						    			}]
					    			}
				    			]
				    		},
							{
				    		columnWidth:.5,
				    		layout:'form',
				    		items:[{
						    		columnWidth:.9,
						    		layout:'form',
						    		items:[{
						    			 xtype : 'fileuploadfield',
										id : 'promotionCpictFile',
										name : 'promotionCpict',
										//inputType : 'file',
										fieldLabel : '闪购最后疯抢图',
										allowBlank: false,
										value:promotionCpict,
										width : 280,
										listeners : {
										 'render':function(){
										  var logoFileCmp = Ext.get('promotionCpictFile-file');
										  logoFileCmp.on('change',function(field,newValue,oldValue){
										           var picPath = getFullPath(logoFileCmp.dom);
										         //  var url = 'file:///' + picPath;
										           if(Ext.isIE){
											             var image = document.getElementById("promotionCpict"); 
											             image.src = Ext.BLANK_IMAGE_URL;
											             image.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = picPath; 
										           }else{
										             //支持FF
											            // var file=document.getElementById("logoFile");
											            // var file=Ext.get('logoFile').dom;
														// var objectURL = window.URL.createObjectURL(file.files[0]);
										           	Ext.get('promotionCpict').dom.src =picPath;
										           }
										         },this);
										         }
											}
						    			 
						    			}
						    			
						    			
						    			
						    			]
						    		},{
					    			columnWidth:.9,
						    		layout:'form',
						    		items:[{
						    			 	xtype : 'box',
						    			 	width : 100,
		                            		height : 120,
											id : 'promotionCpict',
											autoEl : {
											    tag : 'img',
											    src : flashImage + promotionCpict,  
											    style : 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);'
											}
						    			}]
					    			}
				    			]
				    		},
			    			{
				    		columnWidth:.5,
				    		layout:'form',
				    		items:[{
						    		columnWidth:.9,
						    		layout:'form',
						    		items:[{
						    			 xtype : 'fileuploadfield',
										id : 'promotionCgpictFile',
										name : 'promotionCgpict',
										//inputType : 'file',
										fieldLabel : '闪购预告图',
										allowBlank: false,
										value:promotionCgpict,
										width : 280,
										listeners : {
										 'render':function(){
										  var logoFileCmp = Ext.get('promotionCgpictFile-file');
										  logoFileCmp.on('change',function(field,newValue,oldValue){
										           var picPath = getFullPath(logoFileCmp.dom);
										         //  var url = 'file:///' + picPath;
										           if(Ext.isIE){
											             var image = document.getElementById("promotionCgpict"); 
											             image.src = Ext.BLANK_IMAGE_URL;
											             image.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = picPath; 
										           }else{
										             //支持FF
											            // var file=document.getElementById("logoFile");
											            // var file=Ext.get('logoFile').dom;
														// var objectURL = window.URL.createObjectURL(file.files[0]);
										           	Ext.get('promotionCgpict').dom.src =picPath;
										           }
										         },this);
										         }
											}
						    			 
						    			}]
						    		},{
					    			columnWidth:.9,
						    		layout:'form',
						    		items:[{
						    			 	xtype : 'box',
						    			 	width : 100,
		                            		height : 120,
											id : 'promotionCgpict',
											autoEl : {
											    tag : 'img',
											    src : flashImage + promotionCgpict,  
											    style : 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);'
											}
						    			}]
					    			}
				    			]
				    		}
		    		
			    	]}
//			        {
		    				
		    				
////---------------------------------			         
			         ],
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
						handler:save
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
							Ext.getCmp('UpdateFlashPromotion').close();
							
						}
					}]
				})
				
			  
		  });
		
		  this.formpanel = new Ext.Panel({
			  id : 'selectproduct',
			  region:'center',
			  height:'100%',
			  width:'100%',
			  layout : "column",
			  items:[{
							columnWidth : 1,
							items : [this.updatepanel]
						}
			         ]
		  });
	  }
//	   save : function(a){
//		  var form = Ext.getCmp('updateform').getForm();
//		  if(form.isValid()){
//			  form.submit({
//				  waitMsg : "正在提交数据……",
//				  url : __ctxPath + "/promotions/updateAndUploadToFTP",
//				  
//				  success : function(form,action){
//				  	Ext.Msg.alert('信息',action.result.msg);
//				  	alert("ok");
//				  	Ext.getCmp('promotionPanel').getStore().reload();
//				  	Ext.getCmp('UpdateFlashPromotion').close();
//				  },
//				  failure:function(form,action)
//				    	{
//				    		alert(action);
//				    		Ext.Msg.alert('错误','操作失败');
//				    	}
//			  });
//		  }
//		  else{
//		  	alert("必填项不能为空");
//		  }
//	  }
	 
	 
	
	  
});

//addrule = function(){
//		   new win({
//		
//			}).show();
//		   
//		//   alert("ok");
//		   
//	   }
function save(){
	  var form = Ext.getCmp('updateform').getForm();
		  if(form.isValid()){
			  form.submit({
				  waitMsg : "正在提交数据……",
				  url : __ctxPath + "/promotions/updateAndUploadToFTP",
				  success : function(){
				  	Ext.Msg.alert('错误','修改成功');
				  	Ext.getCmp('promotionPanel').getStore().reload();
				  	Ext.getCmp('UpdateFlashPromotion').close();
				  },
				  failure:function()
				    	{
				    		Ext.Msg.alert('错误','操作失败');
				    	}
			  });
		  }
		  else{
		  	alert("必填项不能为空");
		  }
	
}
function getFullPath(obj) {
    if (obj) {
        // ie
        if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
            obj.select();
            obj.blur();
            return document.selection.createRange().text;
        }
        // firefox
        else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
            if (obj.files[0]) {
                return window.URL.createObjectURL(obj.files[0]);
            }
            return obj.value;
        }
        return obj.value;
    }
}

