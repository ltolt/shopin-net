<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN">
<head>
<title>上品攻略-上品折扣官方购物网站-www.shopin.net</title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>

<script type="text/javascript" src="http://images.shopin.net/js/jquery/jquery132min.js"></script>

<link href="http://images.shopin.net/css/gonglue.css" rel="stylesheet" type="text/css"/>
<!--<link href="http://images.shopin.net/css/master.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="http://images.shopin.net/css/y_product.css" type="text/css"/>-->

<script type="text/javascript" src="http://images.shopin.net/js/jquery/jquery.freetab-0.1.js"></script>
<script type="text/javascript" src="http://images.shopin.net/js/jquery/jcarousellite_1.0.1.js"></script>
<script type="text/javascript" src="http://images.shopin.net/js/jquery/jquery.easing.1.1.js"></script>

<script type="text/javascript">
jQuery(document).ready(function($) {
    getViewHistory();

    //滚动商品图片加载
    $("#nav_item").jCarouselLite({
        //control button
        btnNext: ".next",
        btnPrev: ".prev",
        //speed and effect
        speed: 800,
        auto:false,
        //easing: "backin",
        easing: "easeinout",
        //more or less
        visible: 
                3,
        //vertical
        vertical: true,
        afterEnd: function(a) {
            //alert($(a).html());
            //$("#current").attr("src", $(a).find("img:first").attr("src"));
        }
    });

    //点击商品小图片
    $("#nav_item img").click(function() {
        $("#current").attr("src", $(this).attr("src"));
        return false;
    })
    //初始化主图
    //颜色tab加载
    $(".rightintro").freetab({
        nav: "tab_nav",
        //鼠标事件，0-onclick;1-onmouseover
        event: 0
    });
});

function getViewHistory() {
    $.ajax({
        url:'/stat/viewhistory.json?id='+Math.round(Math.random()*100000),
        type: 'get',
        dataType: 'json',
        async :false,
        data:{},
        timeout: 30000,
        error: function() {
            return;
        },
        success: function(response) {
            var result = response.viewhistory;
            createInterface(result);
        }
    });
    return;
}
</script>
</head>



<body>
<div class="page">
		
		<div><img src="http://images.shopin.net/images/ad/090612.gif"/></div>
		
        <!--产品细节小图开始-->
        <div class="leftpic">
            
            <div><a href="javascript:void(0);" class="prev"><img src="http://images.shopin.net/images/ad/09065.gif"/></a></div>
            <div id="nav_item">
                <ul>
                        <li proColorSid="72799">
                            <a href="javascript:void(0);"><img src="http://images.shopin.net/images/ad/09061.gif" alt="Pic638898_72799_0.jpg" width="187" height="172"/></a>
                        </li>
						<li proColorSid="72799">
                            <a href="javascript:void(0);"><img src="http://images.shopin.net/images/ad/09063.gif" alt="Pic638898_72799_0.jpg" width="187" height="172"/></a>
                        </li>
						<li proColorSid="72799">
                            <a href="javascript:void(0);"><img src="http://images.shopin.net/images/ad/09064.gif" alt="Pic638898_72799_0.jpg" width="187" height="172"/></a>
                        </li>
                </ul>
            </div>
            <div><a href="javascript:void(0);" class="next"><img src="http://images.shopin.net/images/ad/09066.gif"/></a></div>
        </div>
        <!--产品细节小图结束-->
		<!--产品大图开始-->
        <div class="bigpic">              
               <img id="current" src="http://images.shopin.net/images/ad/09061.jpg" border="0" width="730" height="620"/>
        </div>
        <!--产品大图结束-->
		
		<div class="logo">
			<ul>
				<li><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/09067.gif" border="0"/></a><p>3折起</p></li>
				<li><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/09068.gif" border="0"/></a><p>3折起</p></li>
				<li><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/09069.gif" border="0"/></a><p>3折起</p></li>
				<li><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/090610.gif" border="0"/></a><p>3折起</p></li>
				<li><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/090611.gif" border="0"/></a><p>3折起</p></li>
			</ul>
		</div>

        
</div>

</body>
</html>
