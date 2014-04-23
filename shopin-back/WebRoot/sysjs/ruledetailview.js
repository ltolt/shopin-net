RuleDetailView=Ext.extend(Ext.Window ,{
xtype:"window",
	title:"规则明细",
	height : document.documentElement.clientHeight-40,
	width : document.documentElement.clientWidth-40,
	initComponent: function(){
		
		var ruleSid = this.ruleSid;
		
		var detailstore = new Ext.data.JsonStore({
				url : __ctxPath + "/ruleMql/findDetails",
				root : "list",
				baseParams : {
					_method : "POST",
					 sid:ruleSid
					
				},
				
				remoteSort : true,
				autoLoad:true,
				 fields : ["sid",
				           "ruleSid",
				           "brandSid",
				           "productClassSid",
				           "productClassName",
				           "brandName",
				           "offMin",
							"offMax",
							"priceMin",
							"priceMax",
							"stockMin",
							"stockMax",
							"shopSid",
							"shopName",
							"saleCode",
							"saleSum",
							"priceUpdateTime"]
			});
			
			
		this.items=[
			{
				xtype:"grid",
				title:"规则明细表",
				height:579,
				store:detailstore,
				viewConfig : {
						  forceFit: true
						 },
				columns:[
					{
						header:"sid",
						sortable:true,
						resizable:true,
						dataIndex:"sid",
						width:100
					},
					{
						header:"销售编码",
						sortable:true,
						resizable:true,
						dataIndex:"saleCode",
						width:100
					},
					{
						header:"销售数量",
						sortable:true,
						resizable:true,
						dataIndex:"saleSum",
						width:100
					},
					{
						header:"品牌",
						sortable:true,
						resizable:true,
						dataIndex:"brandName",
						width:100
					},
					{
						header:"品类",
						sortable:true,
						resizable:true,
						dataIndex:"productClassName",
						width:100
					},
					{
						header:"门店",
						sortable:true,
						resizable:true,
						dataIndex:"shopName",
						width:100
					},
					{
						header:"折扣最小值",
						sortable:true,
						resizable:true,
						dataIndex:"offMin",
						width:100
					},
					{
						header:"折扣最大值",
						sortable:true,
						resizable:true,
						dataIndex:"offMax",
						width:100
					},
					{
						header:"价格最小值",
						sortable:true,
						resizable:true,
						dataIndex:"priceMin",
						width:100
					},
					{
						header:"价格最大值",
						sortable:true,
						resizable:true,
						dataIndex:"priceMax",
						width:100
					},
					{
						header:"库存最小值",
						sortable:true,
						resizable:true,
						dataIndex:"stockMin",
						width:100
					},
					{
						header:"库存最大值",
						sortable:true,
						resizable:true,
						dataIndex:"stockMax",
						width:100
					},
					{
						header:"价格更新时间",
						sortable:true,
						resizable:true,
						dataIndex:"priceUpdateTime",
						width:100
					}
				]
			}
		]
		RuleDetailView.superclass.initComponent.call(this);
	}

	

})