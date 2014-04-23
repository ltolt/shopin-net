


//jquery trainning =about basic jquery and tablesorter

var jq = jQuery.noConflict();


//自写插件
jq.fn.checkAll = function(mode) {
	var mode = mode || 'on'; // if mode is undefined, use 'on' as default
	return this.each(function() {
		switch(mode) {
		case 'on':
			this.checked = true;
			break;
		case 'off':
			this.checked = false;
			break;
		case 'toggle':
			this.checked = !this.checked;
			break;
		}
	});
};

// get some data
 var foobar = "peter wei";

 // specify handler, it needs data as a paramter
 function handler(data) {
   alert(data);
 }


//一个在使用AJAX载入内容时经常发生的问题是：当载入一个事件句柄到一个HTML文档时，还需要在载入内容上应用这些事件，你不得不在内容加载完成后应用这些事件句柄，为了防止代码重复执行，你可能用到如下一个function:
function addClickHandlers() {
	//Now addClickHandlers is called once when the DOM is ready and then everytime when a user clicked a link with the class remote and the content has finished loading.


	jq("a.remote", this).click(function() {
		jq("#target").load(this.href, addClickHandlers);
	});
}

jq(function($) {
// code to execute when the DOM is ready

	//现在，addClickHandlers只在DOM载入完成后执行一次，这是在用户每次点击具有remote这个样式的链接并且内容加载完成后.
	addClickHandlers() ;


	//另一个常见的问题是关于回调(callback)的参数。你可以通过一个额外的参数指定回调的方法，简单的办法是将这个回调方法包含在一个其它的function中:
	 // add click handler and pass foobar!
	 jq("a.foobar").click(function(){
		 handler(foobar);
	 });


	 // if you need the context of the original handler, use apply:
	 $('a').click(function(){
	   handler.apply(this, [foobar]);
	 });




	//全选或清空


	//全选
	$("#checkAll").click(function() {
		//$("#checkByPlugin").check("off");
		//$("#checkAll").check("on");
		//$("#form3 input[type*='checkbox']").check("on");
		$("#form3 input[id*='ids']").check("on");
	});


	//反选
	$("#checkByPlugin").click(function() {

		$("#checkAll").check("off");
		//$("#checkByPlugin").check("toggle");
		//var flag=this.checked;
		//this.checked=flag;
		//$("#form3 input[type*='checkbox']").checkAll("toggle");
		//$("#form3 input[type*='checkbox']").check("toggle");
		$("#form3 input[id*='ids']").check("toggle");
	});


	//根据idt选
	$("#checkByID").click(function() {
		var flag=this.checked;

		//this.checked = flag;
		$("input[id*='ids']").each(function() {
			//this.checked = true;
			// or, to uncheck
			//this.checked = false;
			// or, to toggle
			this.checked = flag;
		});
	});

	$("#rating").append(" Please rate: ");

	for ( var i = 1; i <= 5; i++ )
	 $("#rating").append("<a href='#'>rate" + i + "</a> ");

	// add markup to container and apply click handlers to anchors
	$("#rating a").click(function(e){
	 // stop normal link click
	 e.preventDefault();

	 // send request
	 $.post("rate.do", {rating: $(this).html()}, function(xml) {
	   // format and output result
	   $("#rating").html(
		 "Thanks for rating, current average: " +
		 $("average", xml).text() +
		 ", number of votes: " +
		 $("count", xml).text()
	   );
	 });
	});

	//Applied to the Hello world! example, we end with this:
	$("a").click(function() {
	 alert("Hello Peter!");
	});


   $("#large").tablesorter({
     // striping looking
     widgets: ['zebra']
	 	//stripingRowClass: ['odd','even'],	// Class names for striping supplyed as a array.
		//stripRowsOnStartUp: true		// Strip rows on tableSorter init.
   });

});


jQuery(document).ready(function($) {


	$("#orderedlist").addClass("red");

	jq("#orderedlist > li").addClass("blue");


	$("#orderedlist li:last").hover(function() {
		 $(this).addClass("green");
	},function(){
		 $(this).removeClass("green");
	});


	jq(".buttons button").eq(2).click(function(){
	   jq("#orderedlist").find("li").each(function(i) {
			 jq(this).append( " !Test! " + i );
			 $(this).html( $(this).html() + " BAM! " + i );

		});
	});


   // use this to reset a single form
   $("#reset").click(function() {
     $("form")[0].reset();
   });


	// use this to reset several forms at once
	$("#reset").click(function() {
	 $("form").each(function() {
	   this.reset();
	 });
	});

	$("li").not(":has(ul)").css("border", "1px solid black");

	jq(".buttons button").eq(3).click(function(){
		$("li").not("[ul]").css("border", "1px solid black").css("color","green");
	});

	jq(".buttons button").eq(4).click(function(){
	   $("#orderedlist").removeClass();
	});

	$("a[name]").css("background", "#669900" );

	$("a[href*=test2.htm]").click(function() {
	 // do something with all links that point somewhere to /content/gallery
	});


	jq('#faq').find('dd').hide().end().find('dt').click(function() {
		//jq(this).next().toggle();
		//jq(this).next().slideToggle();
		var answer = $(this).next();
         if (answer.is(':visible')) {
             answer.slideUp();
         } else {
             answer.slideDown();
         }

	});

	$("a").hover(function(){
	 $(this).parents("p").addClass("highlight");
	},function(){
	 $(this).parents("p").removeClass("highlight");
	});

	//Simple animations with jQuery can be achieved with show() and hide().
	$("a.foobar").toggle(function(){
		$(".stuff").hide('slow');
	},function(){
		$(".stuff").show('fast');
	});

	//You can create any combination of animations with animate(), eg. a slide with a fade:
   $("#first").toggle(function(){
     $(".stuff").animate({ height: 'hide', opacity: 'hide' }, 'slow');
   },function(){
     $(".stuff").animate({ height: 'show', opacity: 'show' }, 'slow');
   });

//dom对象，可以使用dom中的方法，但不能再使用Jquery的方法。
//以下几种写法都是正确的：

//$("#msg").html();
//$("#msg")[0].innerHTML;
//$("#msg").eq(0)[0].innerHTML;
//$("#msg").get(0).innerHTML;
//注意，eq返回的是jquery对象，而get(n)和索引返回的是dom元素对象。对于jquery对象只能使用jquery的方法，而dom对象只能使用dom的方法，如要获取第三个<div>元素的内容。有如下两种方法：

//$("div").eq(2).html();              //调用jquery对象的方法
//$("div").get(2).innerHTML;       //调用dom的方法属性

///$("#msg").html();              //返回id为msg的元素节点的html内容。
//$("#msg").html("<b>new content</b>");
//将“<b>new content</b>” 作为html串写入id为msg的元素节点内容中,页面显示粗体的new content

//$("#msg").text();              //返回id为msg的元素节点的文本内容。
//$("#msg").text("<b>new content</b>");
//将“<b>new content</b>” 作为普通文本串写入id为msg的元素节点内容中,页面显示<b>new content</b>

//$("#msg").height();              //返回id为msg的元素的高度
//$("#msg").height("300");       //将id为msg的元素的高度设为300
//$("#msg").width();              //返回id为msg的元素的宽度
//$("#msg").width("300");       //将id为msg的元素的宽度设为300

//$("input").val(");       //返回表单输入框的value值
//$("input").val("test");       //将表单输入框的value值设为test

//$("#msg").click();       //触发id为msg的元素的单击事件
//$("#msg").click(fn);       //为id为msg的元素单击事件添加函数

});