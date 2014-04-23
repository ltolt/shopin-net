var NavigationTree = function (g, f, h, e, c) {
	var d = {
		id : g,
		store : new Ext.data.SimpleStore({
			fields : [],
			data : [[]]
		}),
		editable : false,
		mode : "local",
		fieldLabel : h,
		allowBlank : c == false ? false : true,
		triggerAction : "all",
		maxHeight : 200,
		tpl : "<tpl for='.'><div style='height:200px'><div id='" + g + "tree'></div></div></tpl>",
		selectedClass : "",
		onSelect : Ext.emptyFn
	};
	var loader = new Ext.tree.TreeLoader({
		url : f + "/navigation/navigationTree"
	});
	loader.on('beforeload', function(treeloader, node) {
		treeloader.baseParams = {
				 _method : "POST", 
				 node:1 
		};
	});
	var b = new Ext.form.ComboBox(d);
//	解决选择节点下拉框关闭的问题
//	Ext.override(Ext.form.ComboBox, {  
//      onViewClick : function(doFocus) {  
//        var index = this.view.getSelectedIndexes()[0], s = this.store, r = s.getAt(index);  
//        if (r) {  
//          this.onSelect(r, index);  
//        } else if (s.getCount() === 0) {  
//          this.collapse();  
//        }  
//        if (doFocus !== false) {  
//          this.el.focus();  
//        }  
//      }  
//    });
	var a = new Ext.tree.TreePanel({
			id : g + "Tree",
			height : 199,
			autoScroll : true,
			split : true,	
			modal:true,
			loader : loader,
			root : new Ext.tree.AsyncTreeNode({
				id : "1",
				expanded : true
			}),
			rootVisible : false
		});		
//	a.on("click", function (j) {
//		var i = Ext.getCmp(e);
//		if (j.id != null && j.id != "") {
//			b.setValue(j.text);
//			b.id = j.id;
//			b.collapse();
//			if (i != null) {
//				i.setValue(j.id);
//			}
//			//Ext.getCmp('productClassSid').setValue(j.id);
//			Ext.getCmp('classSid').setValue(j.id);
//			Ext.getCmp('name').setValue(j.text);
//		}
//	});
		
	var str=[];//页面显示的
	var classSid = [];
	var className = [];
	a.on("click", function (j,index) {
		var i = Ext.getCmp(e);
		if(this.fireEvent('beforeselect', this, j, index) !== false){
			if (j.id != null && j.id != "") {
				str.push(j.text);
				b.setValue(str.join());
				
				b.id = j.id;
				b.collapse();
				if (i != null) {
					classSid.push(j.id);
					i.setValue(classSid);
				}
				className.push(j.text);
				Ext.getCmp('name').setValue(className);
			}
		}
	});
	b.on("expand", function () {
		a.render(g + "tree");
	});
   return b;
};
