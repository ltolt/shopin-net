Employee = Ext.extend(Ext.Util.Observable,{
	constructor:function(config){
		this.name = config.name;
		this.addEvents({
			"fired":true,
			"quit":true
		});
		
		//拷贝配置的监听器到this对象里 使得基础类的
		//构造器将会被添加
		this.listeners = config.listeners;
		
		//调用父类的构造器来完成构造过程
		Employee.superclass.constructor.call(this,config);
		
		
		
		
		
		
		
		
		
		
		
		
	}
	
	
});