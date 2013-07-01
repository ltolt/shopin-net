Ext.define('hw.view.edit',{
	extend:'Ext.window.Window',
	alias:'widget.useredit',
	title:'edit user',
	layout:'fit',
	autoShow:true,
	initComponent:function(){
		this.items=[
		{
				xtype:'form',
				items:[
				       {
				    	   xtype:'textfield',
				    	   name:'name',
				    	   fieldLabel:'Name'
				       },{
				    	   xtype:'textfield',
				    	   name :'email',
				    	   fieldLabel:'Email'
				       }
				       
				       ]
				
		}
		
  ];
     this.buttons=[
    	 {
    		 text:'save',
    		 action:'save'
    	 },
    	 {
    		 text:'cancel',
    		 scope:this,
    		 handler:this.close
    	 }
     ];
     this.callParent(arguments);
	}	
});