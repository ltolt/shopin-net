NavSortView = Ext.extend(	Ext.Panel,{
					treepanel : null,
					gridpanel : null,
					constructor : function(a) {
						if (a == null) {
							a = {};
						}
						Ext.apply(this, a);
						this.initComponents();
						NavSortView.superclass.constructor
								.call(
										this,
										{
											id : 'navsortview',
											title : '频道分类导航',
											layout : 'column',
											region : "center",
											border : true,
											width : document.documentElement.clientWidth,
											height : document.documentElement.clientHeight - 40,
											items : [ {
												columnWidth : 0.2,
												items : [ this.treepanel ]
											}, {
												columnWidth : 0.8,
												items : [ this.gridpanel ]
											} ],
											renderTo : "mainDiv"
										});
					},
					initComponents : function() {
						var channelSid;
						var channelName;
						var loader = new Ext.tree.TreeLoader({
							url : __ctxPath + "/channel/channeltree"
						});
						loader.on('beforeload', function(treeloader, node) {
							treeloader.baseParams = {
								_method : "POST"
							};
						});

						this.treepanel = new Ext.tree.TreePanel({
							id : 'channelTree',
							title : '频道列表',
							collapsible : true,
							split : true,
							height : 400,
							border : true,
							loader : loader,
							root : new Ext.tree.AsyncTreeNode({
								id : 0,
								text : '频道列表',
								leaf : false
							}),
							rootVisible : false,
						});
						// 给树形菜单添加事件
						this.treepanel.on("click", aa, this.treepanel);
						function aa(n) {
							channelSid = n.id;
							channelName = n.text;
							NavSortView.findById(n.id);
						}
						NavSortView.findById = function(shopChannelsSid) {
							var b = Ext.getCmp("navlsortlist");
							b
									.getStore()
									.reload(
											{
												params : {
													url : __ctxPath
															+ "/navSort/queryModuleNames",
													_method : "POST",
													shopChannelsSid : shopChannelsSid
												}
											});
						};
						// 树形菜单事件结束
						/*
						 * store的url统一为：__ctxPath + "/action"
						 * baseParams包含真正的action和_method，对应shopin-back-demo系统controller的注解
						 */
						var store = new Ext.data.JsonStore({
							url : __ctxPath + "/navSort/queryModuleNames",
							root : "data",
							baseParams : {
								_method : "POST"
							},
							totalProperty : "totalRecords",
							remoteSort : true,
							fields : [ "sid", "createUser", "createTime",
									"updateTime", "updateUser", "moduleName",
									"isEnable" ]
						});
						// store.load();
						var selectModel = new Ext.grid.CheckboxSelectionModel();
						var columnModel = new Ext.grid.ColumnModel(
								{
									columns : [
											{
												header : "模板名称",
												width : 10,
												dataIndex : "moduleName",
											},
											{
												header : "创建人",
												width : 10,
												dataIndex : "createUser",
											},
											{
												header : "创建时间",
												width : 20,
												dataIndex : "createTime",
											},
											{
												header : "修改人",
												width : 10,
												dataIndex : "updateUser",
											},
											{
												header : "修改时间",
												width : 20,
												dataIndex : "updateTime",
											},
											{
												header : "是否启用",
												dataIndex : "isEnable",
												width : 10,
												renderer : function(c) {
													if (c == 0) {
														return "停用";
													} else {
														return "启用";
													}
												}
											},
											{
												header : "操作",
												dataIndex : "sid",
												sortable : false,
												width : 36,
												renderer : function(a) {
													var k = "";
													k += "<button type='button' onclick='NavSortView.addItemForm("
															+ a
															+ ")'>增加导航明细</button>";
													// k+="&nbsp;&nbsp;<button
													// type='button'
													// onclick='NavSortView.aa("+a+")'>删除</button>";
													k += "&nbsp;&nbsp;<button type='button' onclick='NavSortView.updateItemForm("
															+ a
															+ ","
															+ channelSid
															+ ")'>修改</button>";
													k += "&nbsp;&nbsp;<button type='button' onclick='NavSortView.enableSort("
															+ a
															+ ","
															+ channelSid
															+ ")'>启用</button>";
													return k;
												}
											}

									]
								});

						// NavSortView.aa=function(a){
						// //Ext.Msg.alert(a+"++"+channelSid);
						// Ext.Msg.alert("提示","删除功能尚不明确");
						// };

						NavSortView.addItemForm = function(a) {
							var record = Ext.getCmp('navlsortlist')
									.getSelectionModel().getSelections();
							new AddItemForm({
								record : record,
								channelName : channelName
							}).show();
						};

						NavSortView.updateItemForm = function(a, channelSid) {
							var record = Ext.getCmp('navlsortlist')
									.getSelectionModel().getSelections();
							new UpdateItemForm({
								sid : a,
								moduleName : record[0].get("moduleName"),
								channelSid : channelSid,
								channelName : channelName,
							}).show();
						};

						this.gridpanel = new Ext.grid.GridPanel({
							id : "navlsortlist",
							// autoHeight : true,
							height : 400,
							border : false,
							title : "信息维护区",
							store : store,
							cm : columnModel,
							sm : selectModel,
							trackMouseOver : true,
							// disableSelection : false,
							loadMask : true,
							viewConfig : {
								forceFit : true,
								enableRowBody : false,
								showPreview : false
							},
							bbar : new Ext.Toolbar({
								id : 'addNavSort',
								allowDepress : true, // 是否允许按钮被按下的状态
								height : 40,
								buttonAlign : 'right',
								items : [ {
									xtype : 'button',
									preesed : true,
									align : 'center',
									height : 30,
									width : 80,
									ctCls : 'x-btn-over',
									text : '新增分类导航',
									iconCls: 'button_add',
									handler : function() {
										if (channelSid != null) {
											new AddNavSort({
												channelSid : channelSid,
												channelName : channelName
											}).show();
										} else {
											Ext.MessageBox.alert("提示信息",
													"请选择频道先！");
										}
									}

								} ]
							})
						});

					}
				});

NavSortView.enableSort = function(sid, shopChannelsSid) {
	Ext.Msg.confirm("信息确认", "您确认要启用用所选导航模板吗？", function(c) {
		if (c == "yes") {
			Ext.Ajax.request({
				url : __ctxPath + "/navSort/enableSort/",
				params : {
					sid : sid,
					shopChannelsSid : shopChannelsSid,
					_method : "POST"
				},
				success : function() {
					NavSortView.findById(shopChannelsSid);
				}
			});
		}
	});

};
