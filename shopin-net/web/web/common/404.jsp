<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>上品折扣网 - 实体店应季正品保障，全网底价折扣</title>
<link href="http://images.shopin.net/s/css/reset.css" rel="stylesheet" type="text/css">
<link href="http://images.shopin.net/s/css/layout.css" rel="stylesheet" type="text/css">
<link href="http://images.shopin.net/s/css/master.css" rel="stylesheet" type="text/css">
</head>

<body>


<div id="container">
	<div class="in clear">
		<div class="page404">
		<h2>抱歉！您访问的商品或页面没有找到。</h2>
		<ul>
		<li><span>您可以返回：</span><a href="http://www.shopin.net/index.html">上品首页</a></li>
		<li><span>或去其地方逛逛：</span><a href="http://search.shopin.net/search.html?keyword=">热销商品</a> |  <a href="http://www.shopin.net/channel/brandstores.html">品牌馆</a> |  <a href="http://www.shopin.net/notices/0.html">最新打折预报</a> |  <a href="http://www.shopin.net/help/cartstep.html">上品攻略</a></li>
				</ul>
		</div>
	</div>
</div>
<script src="http://images.shopin.net/s/js/jquery132min.js"></script>
<script src="http://images.shopin.net/s/js/slider.js"></script>
<script src="http://images.shopin.net/s/js/tab.js"></script>
<script src="http://images.shopin.net/s/js/allCate.js"></script>
<script src="http://images.shopin.net/s/js/mousemove.js"></script>
<script src="http://images.shopin.net/s/js/mz-packed.js"></script> 
<script>
//列表排序
$(".sort dd").click(function(){
	$(this).addClass("cur").siblings().removeClass("cur");
});
$(".sort dd, .range dd").hover(function(){
		$(this).addClass("over");
	},function(){
		$(this).removeClass("over");
	});
var range = $(".range dd");
	range.click(function(){
		if($(this).hasClass("cur")){$(this).toggleClass("descend")}else{true};
		$(this).addClass("cur").siblings().removeClass("cur");
	});
</script>
<script>
//商品筛选
$(function(){
//筛选
	var $category = $('.attrs ul:not(".brandAttrs ul")');
	$.each($category, function(i, n){
		$('li:gt(6)', n).hide().parent().next(".attrMore").show();
	})
	var $toggleBtn = $('.attrs .attrMore a:not(".brandAttrs .attrMore a")');             //  获取“显示全部品牌”按钮
	$toggleBtn.click(function(){
		if($(this).text() == '收起') {
			$(this)
				.removeClass("retract")
				.html("更多<i></i>").parent().prev().children('li:gt(6)').hide();
		}else{
			$(this)
				.addClass("retract")
				.html("收起<i></i>").parent().prev().children('li:gt(6)').show();
		}
	});
	//品牌筛选
	var $categoryBrand = $(".brandAttrs ul");
	$.each($categoryBrand, function(i, n){
		$('li:gt(20)', n).hide().parent().next(".attrMore").show();
	})
	var $toggleBtnBrand = $('.brandAttrs .attrMore a');             //  获取“显示全部品牌”按钮
	$toggleBtnBrand.click(function(){
		if($(this).text() == '收起') {
			$(this)
				.removeClass("retract")
				.html("更多<i></i>").parent().prev().children('li:gt(20)').hide();
		}else{
			$(this)
				.addClass("retract")
				.html("收起<i></i>").parent().prev().children('li:gt(20)').show();
		}
	});
	//当前选取并添加至您已选择
	var $currSelect = $(".attr .attrValues li a:not('.colorAttr .attr .attrValues li a')"),$attrName = $(".attrName span").text();
	$currSelect.click(function(){
		$(this).parent().parent().parent().parent().hide();
		$(".selectAttrs ul").append("<li><a>"+$(this).parent().parent().parent().prev().children().html()+"："+$(this).text()+"<i></i></a></li>");
	});
	$(".selectAttrs li").live("click",function(){
		$(this).remove();
		if($(this).children().text() == $attrName){$(this.$attrName).show()}else{return};
		});
	});
</script>
<script>
//选择颜色
$(function(){
	$(".attrValues a").click(function(){
		$(this).addClass("hover").siblings().removeClass("hover");
		});
	});
	
$(function(){
	$(".page a").click(function(){
		$(this).addClass("page_select").siblings().removeClass("page_select");
		});
	});
</script> 
<script type="text/javascript">
$(function(){
	$(".MagicZoom").hover(function(){
		$(this).addClass("curr");
		},function(){
			$(this).removeClass("curr");
			});
	});
</script>

<!--[if IE 6]>
<script src="http://images.shopin.net/s/js/DD_belatedPNG_0.0.8a-min.js"></script> 
<script type="text/javascript"> 
DD_belatedPNG.fix('.png');
</script> 
<![endif]-->
</body>
</html>
