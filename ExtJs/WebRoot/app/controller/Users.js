Ext.define('hw.controller.Users',{
	extend:'Ext.app.Controller',
	stores:[
	        'userstore'
	        ],
	models:[
	        'usermodel'
	        ],
	views:[
	       'list',
	       'edit'
	       ],
	init:function(){
		this.control({
			'userlist':{
				itemdblclick:this.editUser
			},
			'useredit button[action=save]':{
				click:this.updateUser
			}
			
		});
		
		//console.log('Initialized Users!this happens before the application launch function is called');
//		this.control({
//			'viewport> panel':{
//				render:this.onPanelRendered
//				
//			}
//			
//		});
		
	},
	
	editUser:function(grid,record){
		var view = Ext.widget('useredit');
		view.down('form').loadRecord(record);
		console.log('double clicked on' + record.get('name'));
		
	},
	updateUser:function(button){
		console.log('clicked the save button');
		var win = button.up('window'),
		form = win.down('form'),
		record = form.getRecord(),
		values = form.getValues();
		record.set(values);
		win.close();
		//this.getUsersStore().sync();
	}
	
//	onPanelRendered:function(){
//		console.log('The panel was rendered');
//		
//	}
	
});