NodeAddForm = Ext.extend(Ext.Window,{
	formpanel : null,
	constructor:function(a){
		if(a == null){
			a= {};
		}
		Ext.apply(this,a);
		this.initComponents();
		NodeAddForm.superclass.constructor.call(this,
		{
			id:'addcatewin',
			layout:'fit',
			items:this.formpanel,
			modal:true,
			height:300,
			width:400,
			title:'添加品类',
			buttonAlign : "center",
			buttons : this.buttons
		}		
		
		);
	},
	initComponents:function(){
		this.formpanel = new Ext.FormPanel({
			layout:'form',
			bodyStyle : "padding:10px 10px 10px 10px",
			border : false,
			id:'addcateform',
			defaults:{
				anchor:'95%,95%'
			},
			defaultType : "textfield",
			items:[{
				id:'cataname',
				name:'catename',
				fieldLabel:'分类名称',
				allowBlank:false
			}]
			
			
			
		});
		this.buttons=[{
			text:'保存',
			handler:this.save.createCallback(this,this.formpanel)
		}]
		
		
		
	},
	
	save:function(a,b){
		alert('save');
		
	}
	
	
	
	
	
	
	
	
	
	
		});