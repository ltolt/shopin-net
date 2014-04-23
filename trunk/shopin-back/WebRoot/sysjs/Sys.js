Ext.ns("Sys");
var jsCache = new Array();

var SysUserInfo = function(a, b, c) {
	this.username = a;
	this.rights = b;
	this.roleSids = c;
}
var curUserInfo = null;
var isGranted = function(a) {
	if(curUserInfo.rights.indexOf("_ALL") != -1) {
		return true;
	}
	if(curUserInfo.rights.indexOf(a) != -1) {
		return true;
	}
	return false;
}

function newView(viewName, params) {
	var str = "new " + viewName;
	if (params != null) {
		str += "(params);";
	} else {
		str += "();";
	}
	return eval(str);
}

function $ImportJs(viewName, callback, params) {
	var b = jsCache[viewName];
	if (b != null) {
		var view = newView(viewName, params);
		callback.call(this, view);
	} else {
		var jsArr = eval("Sys.importJs." + viewName);
		if (jsArr == undefined || jsArr.length == 0) {
			try {
				var view = newView(viewName, params);
				callback.call(this, view);
			} catch (e) {
			}
			return;
		}
		ScriptMgr.load({
			scripts : jsArr,
			callback : function() {
				jsCache[viewName] = 0;
				var view = newView(viewName, params);
				callback.call(this, view);
			}
		});
	}
}

Sys.clickNode = function(a, c) {
	var b = Ext.getCmp("centerTabPanel");
	var d = b.getItem(a.id);
	if(d == null) {
		$ImportJs(a.id, function(g) {
			Ext.apply(g, {closable:true});
			d = b.add(g);
			b.activate(d);
		}, c);
	} else {
		Ext.apply(d, {closable:true});
		b.activate(d);
	}
};
