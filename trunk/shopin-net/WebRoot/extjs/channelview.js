ChannelView= Ext.extend(Ext.Panel,{
	treepanel : null,
	gridpanel : null,
	constructor:function(a){
		if(a==null){
			a={};
		}
		Ext.apply(this,a);
		this.initComponents();
		ChannelView.superclass.constructor.call(this,{
			id:'channelview',
			layout:'column',
			border:true,
			width:500,
			height:500,
			items:[{
				columnWidth:0.2,
				items:[
				       this.treepanel
				       ]
			},{
				columnWidth:0.8,
				items:[
				       this.gridpanel
				       ]
			}],
			title:'频道管理',
			renderTo : "mainDiv"
		});	
	},
	initComponents:function(){
		var e;
		var loader = new Ext.tree.TreeLoader({
			 url:__ctxPath +'/catetreeload.html'		 
		 });
		 var root3 = new Ext.tree.AsyncTreeNode({id:1,text:'网站分类',leaf:false})
//		loader.on('beforeload',function(loader,node){
//			// alert(node.id);
//			 loader.baseParams.nodeId = node.id;
//		 });
		this.treepanel = new Ext.tree.TreePanel({
			id:'channelTree',
			title:'频道管理',
			collapsible : true,
			split : true,
			height : 800,
			border : false,
			loader : loader,
			root:new Ext.tree.AsyncTreeNode({id:1,text:'网站分类',leaf:false}),
			rootVisible : false
		});
		this.gridpanel= new Ext.grid.GridPanel({
			id : "channellist",
			autoHeight : true,
			border : false,
			title : "频道信息",
			trackMouseOver : true,
			//disableSelection : false,
			loadMask : true,
		});
	}
});