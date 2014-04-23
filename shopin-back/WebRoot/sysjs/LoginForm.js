LoginForm = Ext.extend(Ext.Window, {
	formPanel : null,
	constructor : function(a) {
		if(a == null) {
			a = {};
		}
		Ext.apply(this, a);
		this.initComponents();
		LoginForm.superclass.constructor.call(this, {
			id : "LoginFormWin",
			layout : "fit",
			items : this.formPanel,
			modal : true,
			closable : false,
			height : 150,
			width : 300,
			title : "backWeb网站后台管理登陆",
			buttonAlign : "center",
			buttons : this.buttons,
			keys:[{
				key:Ext.EventObject.ENTER,
				fn:this.login.createCallback(this, this.formPanel)
			}]
		});
	},
	initComponents : function() {
		this.formPanel = new Ext.FormPanel({
			layout : "form",
			bodyStyle : "padding:10px 10px 10px 10px",
			border : false,
			url : __ctxPath + "/loginAction",
			id : "LoginForm",
			defaults : {
				anchor : "95%,95%"
			},
			defaultType : "textfield",
			items : [
				{
					fieldLabel : "账号",
					id : "username",
					name : "username",
					allowBlank : false,
					blankText : "账号不能为空！"
				}, {
					inputType : "password",
					fieldLabel : "密码",
					id : "password",
					name : "password",
					allowBlank : false,
					blankText : "密码不能为空！"
				}, {
					id : "action",
					name : "action",
					xtype : "hidden",
					value : "/security/login"
				}, {
					id : "_method",
					name : "_method",
					xtype : "hidden",
					value : "POST"
				}
			]
		});
		this.buttons = [
			{
				text : "登录",
				handler : this.login.createCallback(this, this.formPanel)
			}, {
				text : "重置",
				handler : this.reset.createCallback(this, this.formPanel)
			}
		];
	},
	login : function(a, b) {
		if(b.getForm().isValid()) {
			b.getForm().submit({
				method : "post",
				waitMsg : "正在提交数据……",
				success : function(form, action) {
					alert('success');
					a.hide();
					var json = Ext.util.JSON.decode(action.response.responseText);
					alert(json);
					if(json.data == null) {
						a.show();
						Ext.MessageBox.show({
							title : "操作信息",
							msg : "登录失败！",
							buttons : Ext.MessageBox.OK,
							icon : Ext.MessageBox.ERROR
						});
						b.getComponent("username").reset();
						b.getComponent("password").reset();
						return ;
					} else if(json.data.username.length > 0) {
						location.href = __ctxPath + "/index.jsp";
					} else {
						a.show();
						Ext.MessageBox.show({
							title : "操作信息",
							msg : "登录失败！",
							buttons : Ext.MessageBox.OK,
							icon : Ext.MessageBox.ERROR
						});
						b.getComponent("username").reset();
						b.getComponent("password").reset();
						return ;
					}
				},
				failure : function(c, d) {
					alert('false');
					Ext.MessageBox.show({
						title : "操作信息",
						msg : "登录失败！",
						buttons : Ext.MessageBox.OK,
						icon : Ext.MessageBox.ERROR
					});
					b.getComponent("username").reset();
					b.getComponent("password").reset();
					return ;
				}
			});
		}
	},
	reset : function(a, b) {
		a.center();
		b.getComponent("username").reset();
		b.getComponent("password").reset();
	}
});