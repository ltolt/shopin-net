<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>会员独享12大品牌内购会,全场1折起,李宁,纳纹,红蜻蜓,红袖,GALADAY,无色无味,2012.2.20-27,仅此8天 </title>
<link href="http://images.shopin.net/css/reset.css" rel="stylesheet" type="text/css" />
<link href="http://images.shopin.net/css/master.css" rel="stylesheet" type="text/css" />
<link href="http://images.shopin.net/css/vip.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://images.shopin.net/js/jquery/jquery132min.js"></script>
<script type="text/javascript">
//轮播图
$(function() {
	var len = $("#focus ul li").length; //获取焦点图中的图片总数
	var index = 0; //图片索引值默认为0
	var picTimer; //声明一个时间变量备用
	
	var btn = "<div class='btn'>"; //btn变量用来在焦点图中添加按钮，由于是纯数字无实际意义，在这里使用jquery插入而不是直接存在于网页内容中，这样也方便于一些网站内容管理系统的生成。
	for(i=0;i<len;i++) {
		btn += "<span>" + (i+1) + "</span>";
	}
	btn += "</div>";
	$("#focus").append(btn);

	$("#focus .btn span").mouseover(function() { //按钮的鼠标单击事件
		index = $("#focus .btn span").index(this); //获取到被单击按钮的索引值（顺序）
		showPic(index); //通过showPic()函数显示该索引值的图片
	}).eq(0).click(); //初始化，默认显示索引值为0（第一张）的图片

	$("#focus").hover(function() {
		clearInterval(picTimer); //鼠标经过焦点图时停止自动播放
	},function() {
		picTimer = setInterval(function() {
			showPic(index); //鼠标滑出时根据当前索引值继续自动播放
			index++; //设置索引值为下一张图片
			if(index==len) {index=0;} //如果索引值等于图片总数，下一次显示第一张图片
		},3000); //3000定义执行以上语句的时间周期
	}).trigger("mouseleave"); //初始化，触发鼠标滑出事件，即自动播放

	function showPic(index) {
		var picHeight = $("#focus ul li img").height(); //变量picHeight获取到图片的高度，当然也可以使用固定值而省略此步
		$("#focus ul").stop(true,false).animate({top:-picHeight*index},300); //根据图片高度和当前图片的索引值，计算出ul向上的偏移量，再使用.animate()来移动它实现动画效果。结尾的“300”定义了移动速度
		$("#focus .btn span").removeClass("on").eq(index).addClass("on");//根据index变量（索引值）给相应的按钮添加selected的类，并移除其它按钮的selected类
	}
});
</script>
</head>

<body>
<div class="page_wrapper">
<img src="http://images.shopin.net/images/ad/vip/topbanner_1.jpg" alt="会员独享－12大品牌内购会!" />
<img src="http://images.shopin.net/images/ad/vip/topbanner_2.jpg" alt="会员独享－12大品牌内购会!" />
<img src="http://images.shopin.net/images/ad/vip/topbanner_3.jpg" alt="会员独享－12大品牌内购会!" />
<div class="subtool bgc_green"><img src="http://images.shopin.net/images/ad/vip/qg23_y.gif" alt="抢购进行时 2012.2.23-2012.2.27 仅5天 限时抢购" /></div>
<div class="wrap mb10 img_gray">
  <ul>
    <li class="fchtitle">
      <h2>Huayin内购会 小外套 风衣 裙装 1-3折 限时抢购！</h2>
    </li>
    <li class="fchimg">
      <a target="_blank" href="http://www.shopin.net/promotion/4404.html">
        <img src="http://images.shopin.net/images/ad/vip/pic_11.jpg" alt="OL必备新春装 四季装" />
      </a>
    </li>
  </ul>
  <ul>
    <li class="fchtitle">
      <h2>菲尔图内购会  意式凉鞋 单鞋 船鞋 1-3折 限时抢购！</h2>
    </li>
    <li class="fchimg">
      <a target="_blank" href="http://www.shopin.net/promotion/4405.html">
        <img src="http://images.shopin.net/images/ad/vip/pic_12.jpg" alt="意式凉鞋单鞋专场" />
      </a>
    </li>
  </ul>
  <ul>
    <li class="fchtitle">
      <h2>秋水伊人内购会  内搭衫 裙装 外套 1-3折 限时抢购！</h2>
    </li>
    <li class="fchimg">
      <a target="_blank" href="http://www.shopin.net/promotion/2686.html">
        <img src="http://images.shopin.net/images/ad/vip/pic_14.jpg" alt="100%纯棉体验" />
      </a>
    </li>
  </ul>
  <ul>
    <li class="fchtitle">
      <h2>伟伦内购会 洋装 小外套 大衣 1-3折限时抢购！</h2>
    </li>
    <li class="fchimg">
      <a target="_blank" href="http://www.shopin.net/promotion/4401.html">
        <img src="http://images.shopin.net/images/ad/vip/pic_8.jpg" alt="混搭MIX潮流 春装" />
      </a>
    </li>
  </ul>
  <ul>
    <li class="fchtitle">
      <h2>GALADAY内购会 凉鞋 凉拖 单鞋 1-3折  限时抢购！</h2>
    </li>
    <li class="fchimg">
      <a target="_blank" href="http://www.shopin.net/promotion/4402.html">
        <img src="http://images.shopin.net/images/ad/vip/pic_9.jpg" alt="女人的优越选择 凉鞋 单鞋" />
      </a>
    </li>
  </ul>
  <ul>
    <li class="fchtitle">
      <h2>GALADAY内购会 手提包 斜跨包 手袋  1-5折  限时抢购！</h2>
    </li>
    <li class="fchimg">
      <a target="_blank" href="http://www.shopin.net/promotion/4403.html">
        <img src="http://images.shopin.net/images/ad/vip/pic_10.jpg" alt="优雅 简约 时尚 时尚包袋" />
      </a>
    </li>
  </ul>
  <ul>
    <li class="fchtitle">
      <h2>红袖内购会 针织衫 裙装 外套 1-3折 限时抢购！</h2>
    </li>
    <li class="fchimg">
      <a target="_blank" href="http://www.shopin.net/promotion/4398.html">
        <img src="http://images.shopin.net/images/ad/vip/pic_5.jpg" alt="简约 时尚 百搭" />
      </a>
    </li>
  </ul>
  <ul>
    <li class="fchtitle">
      <h2>卡曼尼内购会 船鞋 鱼嘴鞋 凉鞋 1-3折 限时抢购！</h2>
    </li>
    <li class="fchimg">
      <a target="_blank" href="http://www.shopin.net/promotion/4399.html">
        <img src="http://images.shopin.net/images/ad/vip/pic_6.jpg" alt="悠然美丽 时尚生活 单鞋" />
      </a>
    </li>
  </ul>
  <ul>
    <li class="fchtitle">
      <h2>适步内购会 凉鞋 凉拖 单鞋￥99-￥199  限时抢购！</h2>
    </li>
    <li class="fchimg">
      <a target="_blank" href="http://www.shopin.net/promotion/4400.html">
        <img src="http://images.shopin.net/images/ad/vip/pic_7.jpg" alt="舒适行走新感觉 凉鞋 单鞋" />
      </a>
    </li>
  </ul>
  <!--ul>
    <li class="fchtitle">
      <h2>李宁内购会 运动装 运动鞋  低至2折 限时抢购！</h2>
    </li>
    <li class="fchimg">
      <a target="_blank" href="http://www.shopin.net/promotion/4408.htm">
        <img src="http://images.shopin.net/images/ad/vip/pic_1.jpg" alt="李宁开学应季装备 限时抢 春季鞋服" />
      </a>
    </li>
  </ul-->
  <ul>
    <li class="fchtitle">
      <h2>纳纹内购会 针织衫 裙装 小西服 1-3折 限时抢购！</h2>
    </li>
    <li class="fchimg">
      <a target="_blank" href="http://www.shopin.net/promotion/4395.html">
        <img src="http://images.shopin.net/images/ad/vip/pic_2.jpg" alt="时尚 潮流 摩登 四季装" />
      </a>
    </li>
  </ul>
  <ul>
    <li class="fchtitle">
      <h2>红蜻蜓内购会 单鞋  裸靴 长靴  1-3折 限时抢购！</h2>
    </li>
    <li class="fchimg">
      <a target="_blank" href="http://www.shopin.net/promotion/4346.html">
        <img src="http://images.shopin.net/images/ad/vip/pic_3.jpg" alt="反季皮靴单鞋聚惠 春夏装" />
      </a>
    </li>
  </ul>
  <ul>
    <li class="fchtitle">
      <h2>L.COASSION内购会 大衣 裙装 衬衫 4.5折封 限时抢购！ </h2>
    </li>
    <li class="fchimg">
      <a target="_blank" href="http://www.shopin.net/promotion/4396.html">
        <img src="http://images.shopin.net/images/ad/vip/pic_4.jpg" alt="知性美感自然流畅" />
      </a>
    </li>
  </ul>
</div>
<div class="subtool bgc_brown"><img src="http://images.shopin.net/images/ad/vip/qg24.gif" alt="2012.2.23 即将开始 限时抢购" /></div>
<div class="wrap mb10">
  <div id="focus">
    <ul>
        <li><a href="http://www.shopin.net/promotion/4364.html"><img src="http://images.shopin.net/images//promotions/201202161757131.jpg" alt="板鞋添新 极致玩味 新款 复古 经典滑板鞋 大牌新款" /></a></li>
        <li><a href="http://www.shopin.net/promotion/4234.html"><img src="http://images.shopin.net/images//promotions/201202161640261.jpg" alt="蠢潮流踝靴 优雅绽放 简约 精致 花朵装饰" /></a></li>
        <li><a href="http://www.shopin.net/promotion/4373.html"><img src="http://images.shopin.net/images//promotions/201202161802331.jpg" alt="唯美气质 春日必备 大衣 内搭衫 休闲裤" /></a></li>
        <li><a href="http://www.shopin.net/promotion/4276.html"><img src="http://images.shopin.net/images//promotions/201202161645401.jpg" alt="早春美包 简单随型 休闲包 运动包 炫美春色" /></a></li>
        <li><a href="http://www.shopin.net/promotion/4387.html"><img src="http://images.shopin.net/images//promotions/201202161751571.jpg" alt="活力街范 唤醒春潮流 夹克 印染 牛仔" /></a></li>
        <li><a href="http://www.shopin.net/promotion/4383.html"><img src="http://images.shopin.net/images//promotions/201202161749311.jpg" alt="商务绅士 精致奢华感 大牌 春款 卓越品质" /></a></li>
    </ul>
  </div>
</div>
</div>
</body> 
</html>