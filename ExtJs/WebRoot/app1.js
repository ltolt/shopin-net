Ext.Loader.setConfig({
    enabled: true
});
Ext.application({
	name:'hw',
	appFolder:'app',
	controllers:[
	             'Users'
	             ],
	launch:function(){
		Ext.create('Ext.container.Viewport',{
			layout:'fit',
			items:
			       {
			    	   xtype:'userlist'
			       }
			       
		});
		
	}
	
});


