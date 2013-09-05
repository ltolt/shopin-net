//Ext.require([
//    'Ext.form.field.File',
//    'Ext.form.Panel',
//    'Ext.window.MessageBox'
//]);
//
//Ext.onReady(function(){
////  Class which shows invisible file input field.
//    if (window.location.href.indexOf('debug') !== -1) {
//        Ext.getBody().addCls('x-debug');
//    }
//
//    var msg = function(title,msg){
//    	Ext.Msg.show({
//    		title: title,
//            msg: msg,
//            minWidth: 200,
//            modal: true,
//            icon: Ext.Msg.INFO,
//            buttons: Ext.Msg.OK
//    	});
//    }
//    
//    var box = Ext.create({
//    	xtype : 'box',  
//    	id : 'logoPic',  
//    	width : 150,  
//    	height : 200,  
//    	autoEl : {  
//    	    tag : 'img',  
//    	    src : currentLogoPath,    
//    	    style : 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale);'  
//    	}  
//    	
//    });
//    
//    
//    var fibasic = Ext.create('Ext.form.field.File',{
//    	renderTo: 'fi-basic',
//        width: 400,
//        hideLabel: true
//    })
//	
//	Ext.create('Ext.button.Button',{
//		text:'Get File Path',
//		renderTo:'fi-basic-btn',
//		handler:function(){
//			var v = fibasic.getValue();
//			msg('Selected File', v && v != '' ? v : 'None');
//		}
//	});
//	
//});
//
//
//
var panel3 = new Ext.form.FormPanel({
	renderTo: 'fi-basic',
	labelAlign : 'left',
         labelWidth:60,
	border : false,
	bodyStyle : 'padding:4px;',
	frame : false,
	url : '../ajaxdata/uploadFile.jsp',
	autoHeight : true,
	fileUpload : true,
	items : [{
		id : 'file',
		autoScroll : false,
		xtype : 'textfield',
        fieldLabel:'本地上传',
		name : 'file',
		hideLabel : true,
		// inputType : 'file'//按照Ext默认的属性将inputType设为file时，始终响应不了onchange事件，结果就以autoCreate的方式，如下，因为这种方式相当于html里的input,所以也就响应得了啦！

		autoCreate : {
			tag : "input",
			type : "file",
			size : "20",
			autocomplete : "off",
			onChange : "browseImages(this.value);"
		}
	}]

	,
	buttons : [{
		text : '上传',
		handler : function() {
			panel3.getForm().submit({
				// waitTitle : "请稍候",
				waitMsg : "正在上传...",
				success : function(form, action){},
				failure : function(form, action) {
					Global.alert('上传图片失败！');
				}
			})
		}
	}]
});
