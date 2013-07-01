Ext.define('hw.view.list',{
	extend:'Ext.grid.Panel',
	alias:'widget.userlist',
	title:'all users',
	store:'userstore',
	initComponent:function(){
		this.columns=[
		              	{header:'Name',dataIndex:'name',  flex:1},
		              	{header:'Email',dataIndex:'email', flex:1}
		              ];
		this.callParent(arguments);
	}
	
});