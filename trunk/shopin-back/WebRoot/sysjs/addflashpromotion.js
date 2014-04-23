//增加闪购活动窗口扩展
AddFlashPromotion = Ext.extend(Ext.Window,{
	  savepanel : null,
	  formpanel   : null,
	  selectpanel : null,
	  json : null,
	  constructor : function(a){
		  if(a == null) {
				a = {};
			}
			Ext.apply(this, a);
			this.initComponents();
			AddFlashPromotion.superclass.constructor.call(this,{
				id : 'AddFlashPromotion',
				layout:'border',
				items:[
				       this.formpanel
				       ],
		        modal : true,
				height : document.documentElement.clientHeight-40,
				width : document.documentElement.clientWidth-200,
				title : "添加活动"       
			});
	  },
	  
	  initComponents : function() {
	  	
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
		     
		     
		     
		  this.savepanel = new Ext.FormPanel({
			    id:'saveform',
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
				    		columnWidth:.5,
				    		layout:'form',
				    		items:[
				    			{
									fieldLabel : "活动标题",
									name : "promotionTitle",
									allowBlank: false,
									xtype : "textfield",
									anchor:'50%'
								}]
				    		},
				    		{
				    		columnWidth:.5,
				    		layout:'form',
				    		items:[
				    			{
									fieldLabel : "活动描述",
									xtype : "textarea",
									name : 'promotionDesc',
									anchor:'50%'
								}]
					    	},{
			    		columnWidth:.6,
			    		layout:'form',
			    		items:[
			    			{
								fieldLabel : "显示顺序",
								xtype : "textfield",
								name:'seq',
								anchor:'50%'
							}]
			    		}]
			    		},
			    		{
				    	columnWidth:.5,
			    		layout:'form',
			    		items:[
						{
				    	columnWidth:.45,
			    		layout:'form',
			    		items:[
						{
							xtype:"combo",
							fieldLabel:"活动模型",
							id:'pageTemplate',
	    					mode:'local',
	    					triggerAction : 'all',
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
			    		columnWidth:.45,
			    		layout:'form',
			    		items:[
			    			{
								xtype:"combo",
								fieldLabel:"活动类型",
		    		        //	autoWidth:true,
		    		        	id:'promotionType',
		    		        	hiddenName:"promotionTypeSid",
	    						valueField: 'sid',
		    					mode:'local',
		    					triggerAction : 'all',
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
		    								Ext.getCmp('promotionSpict').hide();
//		    								Ext.get('promotionSpict_box').dom.style.display = "none";
		    								Ext.getCmp('promotionSpict_box').hide();
		    							} else if(flag == true){
		    								Ext.getCmp('promotionSpict').show();
//		    								Ext.get('promotionSpict_box').dom.style.display = "";
		    								Ext.getCmp('promotionSpict_box').show();
		    							} 
			    					}
								}
			    			}]
			    		},{
				    		columnWidth:.6,
				    		layout:'form',
				    		items:[
				    			{
									fieldLabel : "活动链接",
									xtype : "textfield",
									name:'promotionLink',
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
			    			 anchor:'50%',
			    			 format:"H:i"
			    			 
			    			}]
			    		},
			    		{
			    		columnWidth:.5,
			    		layout:'form',
			    		items:[{
			    			 xtype: 'datetimefield',
			    			 fieldLabel: '结束时间',
			    			 id : 'promotionEndTime',
			    			 name : 'promotionEndTime',
			    			 format:"H:i",
			    			 anchor:'50%',
			    			 validationEvent : 'blur',
					         validationOnChange : false,
					         validator : function(value){
					       		var aa = Ext.getCmp('saveform').form.findField("promotionBeginTime").getValue();
					       		var gedt = Ext.util.Format.date(aa, 'Y-m-d H:i:s');
					       		if(value<gedt){
					       		 	//Ext.Msg.alert("","结束时间应大于开始时间");
					       		 	alert("结束时间应大于开始时间");
					       		 }
					       }
			    			 
			    			}]
			    		}
			    	]},
				    {
		    		columnWidth:.5,
		    		layout:'form',
		    		items:[{
				    		columnWidth:.6,
				    		layout:'form',
				    		items:[{
				    			 xtype : 'fileuploadfield',
								id : 'promotionBpict',
								name : 'promotionBpict',
							//	inputType : 'file',
								fieldLabel : '闪购(活动)大图',
								allowBlank: false,
								width : 280,
								listeners : {
								 'render':function(){
								  var logoFileCmp = Ext.get('promotionBpict-file');
								  logoFileCmp.on('change',function(field,newValue,oldValue){
								           var picPath = getFullPath(logoFileCmp.dom);
								         //  var url = 'file:///' + picPath;
								           if(Ext.isIE){
									             var image = document.getElementById("promotionBpict_box"); 
									             image.src = Ext.BLANK_IMAGE_URL;
									             image.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = picPath; 
								           }else{
								             //支持FF
									            // var file=document.getElementById("logoFile");
									            // var file=Ext.get('logoFile').dom;
												// var objectURL = window.URL.createObjectURL(file.files[0]);
								           	Ext.get('promotionBpict_box').dom.src =picPath;
								           }
								         },this);
								         }
									}
				    			 
				    			}]
				    		},{
			    			columnWidth:.6,
				    		layout:'form',
				    		items:[{
				    			 	xtype : 'box',
				    			 	width : 200,
                            		height : 120,
									id : 'promotionBpict_box',
									autoEl : {
									    tag : 'img',
									    src : '',  
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
				    		columnWidth:.6,
				    		layout:'form',
				    		items:[{
				    			 xtype : 'fileuploadfield',
								id : 'promotionSpict',
								name : 'promotionSpict',
								//inputType : 'file',
								fieldLabel : '首页轮播焦点图',
								hidden:false,
								width : 280,
								listeners : {
								 'render':function(){
								  var logoFileCmp = Ext.get('promotionSpict-file');
								  logoFileCmp.on('change',function(field,newValue,oldValue){
								           var picPath = getFullPath(logoFileCmp.dom);
								         //  var url = 'file:///' + picPath;
								           if(Ext.isIE){
									             var image = document.getElementById("promotionSpict_box"); 
									             image.src = Ext.BLANK_IMAGE_URL;
									             image.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = picPath; 
								           }else{
								             //支持FF
									            // var file=document.getElementById("logoFile");
									            // var file=Ext.get('logoFile').dom;
												// var objectURL = window.URL.createObjectURL(file.files[0]);
								           	Ext.get('promotionSpict_box').dom.src =picPath;
								           }
								         },this);
								         }
									}
				    			 
				    			}
				    			]
				    		},{
			    			columnWidth:.6,
				    		layout:'form',
				    		items:[{
				    			 	xtype : 'box',
				    			 	width : 200,
                            		height : 120,
                            		hidden:false,
									id : 'promotionSpict_box',
									autoEl : {
									    tag : 'img',
									    src : '',  
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
				    		columnWidth:.6,
				    		layout:'form',
				    		items:[{
				    			 xtype : 'fileuploadfield',
								id : 'promotionVpict',
								name : 'promotionVpict',
								//inputType : 'file',
								fieldLabel : '闪购正在进行图',
								allowBlank: false,
								width : 280,
								listeners : {
								 'render':function(){
								  var logoFileCmp = Ext.get('promotionVpict-file');
								  logoFileCmp.on('change',function(field,newValue,oldValue){
								           var picPath = getFullPath(logoFileCmp.dom);
								         //  var url = 'file:///' + picPath;
								           if(Ext.isIE){
									             var image = document.getElementById("promotionVpict_box"); 
									             image.src = Ext.BLANK_IMAGE_URL;
									             image.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = picPath; 
								           }else{
								             //支持FF
									            // var file=document.getElementById("logoFile");
									            // var file=Ext.get('logoFile').dom;
												// var objectURL = window.URL.createObjectURL(file.files[0]);
								           	Ext.get('promotionVpict_box').dom.src =picPath;
								           }
								         },this);
								         }
									}
				    			 
				    			}
				    			
				    			
				    			
				    			]
				    		},{
			    			columnWidth:.6,
				    		layout:'form',
				    		items:[{
				    			 	xtype : 'box',
				    			 	width : 200,
                            		height : 120,
									id : 'promotionVpict_box',
									autoEl : {
									    tag : 'img',
									    src : '',  
									    style : 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);'
									}
				    			}]
			    			}
				    			
				    			]
				    		},
		    		
		    				
//-----------------------------------
					{
		    		columnWidth:.5,
		    		layout:'form',
		    		items:[{
				    		columnWidth:.9,
				    		layout:'form',
				    		items:[{
				    			 xtype : 'fileuploadfield',
								id : 'promotionCpict',
								name : 'promotionCpict',
							//	inputType : 'file',
								fieldLabel : '闪购最后疯抢图',
								allowBlank: false,
								width : 280,
								listeners : {
								 'render':function(){
								  var logoFileCmp = Ext.get('promotionCpict-file');
								  logoFileCmp.on('change',function(field,newValue,oldValue){
								           var picPath = getFullPath(logoFileCmp.dom);
								         //  var url = 'file:///' + picPath;
								           if(Ext.isIE){
									             var image = document.getElementById("promotionCpict_box"); 
									             image.src = Ext.BLANK_IMAGE_URL;
									             image.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = picPath; 
								           }else{
								             //支持FF
									            // var file=document.getElementById("logoFile");
									            // var file=Ext.get('logoFile').dom;
												// var objectURL = window.URL.createObjectURL(file.files[0]);
								           	Ext.get('promotionCpict_box').dom.src =picPath;
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
									id : 'promotionCpict_box',
									autoEl : {
									    tag : 'img',
									    src : '',  
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
								id : 'promotionCgpict',
								name : 'promotionCgpict',
							//	inputType : 'file',
								fieldLabel : '闪购预告图',
								allowBlank: false,
								width : 280,
								listeners : {
								 'render':function(){
								  var logoFileCmp = Ext.get('promotionCgpict-file');
								  logoFileCmp.on('change',function(field,newValue,oldValue){
								           var picPath = getFullPath(logoFileCmp.dom);
								         //  var url = 'file:///' + picPath;
								           if(Ext.isIE){
									             var image = document.getElementById("promotionCgpict_box"); 
									             image.src = Ext.BLANK_IMAGE_URL;
									             image.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = picPath; 
								           }else{
								             //支持FF
									            // var file=document.getElementById("logoFile");
									            // var file=Ext.get('logoFile').dom;
												// var objectURL = window.URL.createObjectURL(file.files[0]);
								           	Ext.get('promotionCgpict_box').dom.src =picPath;
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
									id : 'promotionCgpict_box',
									autoEl : {
									    tag : 'img',
									    src : '',  
									    style : 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);'
									}
				    			}]
			    			}
			    		]}
		    		
		    				
				    	]
				    	}	
//---------------------------------			         
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
						handler:this.save.createCallback(this)
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
							Ext.getCmp('AddFlashPromotion').close();
							
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
							items : [this.savepanel]
						}
			         ]
		  });
	  },
	   save : function(a){
		  var form = Ext.getCmp('saveform').getForm();
		  if(form.isValid()){
			  form.submit({
				  waitMsg : "正在提交数据……",
				  url : __ctxPath + "/promotions/saveAndUploadToFTP",
				  success : function(){
				  	Ext.Msg.alert('错误','添加活动成功');
				  	Ext.getCmp('promotionPanel').getStore().reload();
				  	Ext.getCmp('AddFlashPromotion').close();
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
	 
	 
	
	  
});

//addrule = function(){
//		   new win({
//		
//			}).show();
//		   
//		//   alert("ok");
//		   
//	   }
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

