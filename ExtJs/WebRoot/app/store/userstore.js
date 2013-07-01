Ext.define('hw.store.userstore',{
	extend:'Ext.data.Store',
	model:'hw.model.usermodel',
	autoLoad:true,
	proxy:{
		type:'ajax',
		api:{
			read:'data/users.json',
			update:'data/updateUser.json'
		},
		reader:{
			type:'json',
			root:'users',
			successProperty:'success'
		}
		
		
	}
	
	
});


