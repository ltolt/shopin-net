/**
 * Div Select for jQuery
 * Version:0.1
 * Copyright (c) 2010 Shopin.net
 *
 */
 jQuery(document).ready(function($) {

	 //选择框,如为class,#改为.
	var input="#t_selected";

	//列表项Div,如为class,#改为.
	var itemDiv="#t_select-list";

	var flag=false;

	//触发选择框
	$(input).click(function(){
		$(itemDiv).toggle();
	});

	//选中列表项
	$(itemDiv).children().click(function(){
		//付值
		$(input).html($(this).html());
		$(itemDiv).hide();
	});

	//失去焦点时
	$(input).blur(function(){
		if(!flag){$(itemDiv).hide();}
	});

	$(input).parent().mouseover(function(){
		flag=true;
	});

	$(input).parent().mouseout(function(){
		flag=false;
	});

 });




