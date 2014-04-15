<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>2011年终盘点，千款冬装全年底价-上品折扣</title>
<meta name="description" content="上品折扣2011年终盘点、百个品牌、千款明星冬装全年底价。" />
<meta name="keywords" content="上品折扣年终盘点，五大品类（羽绒、羊绒、保暖、靴子、户外）。百个品牌（雅鹿、波司 登、鄂尔多斯、雪莲、鹿王、纤丝鸟、猫人、北极绒、莱尔斯丹、THE NORTH FACE、狼爪、 BLACKYAK）等折上折，全年底价。" />
<base target="_blank" />
<style type="text/css">
	.hd_nav { position:relative; width:950px;}
	.hd_nav img { border:none;}
	.hd_nav ul { list-style:none; padding:0; margin:0;}
	.hd_nav ul li { width:132px; float:left; height:220px; padding:0 9px;}
	.hd_nav ul h1,.hd_nav ul p { padding:0; margin:0; text-align:center; font-size:12px; height:24px; line-height:24px; overflow:hidden; color:#333333; font-weight:normal;}
	.hd_nav ul a:hover h1 { color:#f15930;}
	.hd_nav ul a img { border:1px solid #fff;}
	.hd_nav ul a:hover img { border:1px solid #d0d0d0;}
	.hd_nav ul p b { color:#f15930; font-size:14px;}
	#ibacktop { width:21px; height:75px; cursor:pointer; position:absolute;}
	.fsdanpinlist { border:2px solid #ea5825; border-top:none; background:#eff0e8; padding:10px 20px 30px;}
	.flash-font12 { font-size:14px; line-height:37px; font-weight:bold; padding-left:490px; color:#fff; font-family:"微软雅黑"}
	.flash-font12 span { font-family:"微软雅黑"}
	.flash-font12 span span { font-size:24px; padding:0 3px;font-family:"MS Serif", "New York", serif; font-weight:normal;}
</style>
<script type="text/javascript" src="http://images.shopin.net/js/lazyload.js"></script>
<%
    java.util.Date date = new java.util.Date();
    java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    String currentdata = format.format(date);
    java.util.Date currenttime = format.parse(currentdata);
    String dateTime= "2011-12-13 23:59:59";  //设置要开始（结束）的时间
    java.util.Date time = format.parse(dateTime);

    //if(currenttime.after(time)){//在某个时间以后显示内容
//    if(currenttime.before(time)){  如果是到某个时间段以后不显示下面div的内容
%>
<script type="text/javascript">
$(document).ready(function(){
$(".hd_nav img").lazyload({
          placeholder : "http://images.shopin.net/images/ad/lazyblank.gif",        
          effect : "fadeIn"
});
});
</script>
    <script type="text/javascript">
        //var jq = jQuery.noConflict();
        var SysSecond = new Array();
        var InterValObj;
        jQuery(document).ready(function($) {
            //SysSecond = parseInt($("#remainSeconds").html()); //这里我是在服务端算好了剩余的秒数，并保存到客户端，如果过期则返回0
            $(".remainSeconds").each(function() {
                var curIndex = $(".remainSeconds").index(this);
                SysSecond[curIndex] = parseInt($(this).html());

            });
            InterValObj = window.setInterval(SetRemainTime, 1000); //间隔函数，1秒执行
        });

        //时间倒计时
        function SetRemainTime() {
            $.each(SysSecond, function(i, n) {
                //alert(i);
                //alert(n);
                if (n > 0) {
                    n = n - 1;
                    SysSecond[i] = n;
                    var second = Math.floor(n % 60);             // 计算秒
                    var minute = Math.floor((n / 60) % 60);      //计算分
                    var hour = Math.floor((n / 3600) % 24);      //计算小时
                    var day = Math.floor((n / 3600) / 24);        //计算天
                    var start = "<span class='flash-font16'>";
                    var end = "</span>";
                    var text = "";
                    if (day > 0) {
                        text = text + start + day + end + "天";
                    }
                    if (hour > 0) {
                        text = text + start + hour + end + "小时";
                    }
                    if (minute > 0) {
                        text = text + start + minute + end + "分";
                    }
                    if (second > 0) {
                        text = text + start + second + end + "秒";
                    }
                    $(".remainTime").eq(i).html(text);
                } else {//剩余时间小于或等于0的时候，就停止间隔函数
                    $(".flash-font12").html("${promotion.promotionTitle}:活动已结束");
                    window.clearInterval(InterValObj);
                }
            });
        }
</script>
</head>

<body>
<div class="hd_nav">
	<div><img src="http://images.shopin.net/images/ad/2011finalsale/2011finalsale_01.jpg" width="950" height="320" /></div>
    <div><img src="http://images.shopin.net/images/ad/2011finalsale/2011finalsale_02.jpg" width="950" height="223" /></div>
    <div><img src="http://images.shopin.net/images/ad/2011finalsale/2011finalsale_03.jpg" width="950" height="370" /></div>
    
    <div><img src="http://images.shopin.net/images/ad/2011finalsale/2011finalsale_09_4.jpg" width="950" height="76" /></div>
    <div class="fsdanpinlist">
    	<ul>
        	<li>
            	<a href="http://www.shopin.net/product/1396272.html">
                	<img src="http://images.shopin.net/images/68/2011/09/06/Pic1396272_140122_0_1.jpg" width="130" height="130" />
                    <h1>【网络特供】迪士尼专柜正品女款羽绒外套</h1>
                    <p>市场价：￥698</p>
                    <p><b>特供价：￥156</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1397176.html">
                	<img src="http://images.shopin.net/images/68/2011/09/06/Pic1397176_33705_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】迪士尼专柜正品女款加棉外套</h1>
                    <p>市场价：￥798</p>
                    <p><b>特供价：￥179</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1508373.html">
                	<img src="http://images.shopin.net/images/68/2011/11/03/Pic1508373_36719_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】EI SEINO专柜正品女款牛仔外套</h1>
                    <p>市场价：￥1080</p>
                    <p><b>特供价：￥89</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1508409.html">
                	<img src="http://images.shopin.net/images/68/2011/11/03/Pic1508409_36720_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】EI SEINO专柜正品女款牛仔外套</h1>
                    <p>市场价：￥1080</p>
                    <p><b>特供价：￥99</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1477234.html">
                	<img src="http://images.shopin.net/images/68/2011/10/19/Pic1477234_36719_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】EI SEINO专柜正品女款牛仔外套</h1>
                    <p>市场价：￥1399</p>
                    <p><b>特供价：￥150</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/876536.html">
                	<img src="http://images.shopin.net/images/63/2011/01/11/Pic876536_67162_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】无色无味专柜正品套头衫</h1>
                    <p>市场价：￥426</p>
                    <p><b>特供价：￥79</b></p>
                </a>
            </li>
            
            <li>
            	<a href="http://www.shopin.net/product/752292.html">
                	<img src="http://images.shopin.net/images/66/2011/01/25/Pic752292_81772_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】无色无味专柜正品套头衫</h1>
                    <p>市场价：￥398</p>
                    <p><b>特供价：￥71</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/962651.html">
                	<img src="http://images.shopin.net/images/61/2011/01/19/Pic962651_92824_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】LILY专柜正品套头衫</h1>
                    <p>市场价：￥499</p>
                    <p><b>特供价：￥109</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/750189.html">
                	<img src="http://images.shopin.net/images/66/2011/01/30/Pic750189_81499_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】AOS专柜正品外套</h1>
                    <p>市场价：￥1680</p>
                    <p><b>特供价：￥260</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/845440.html">
                	<img src="http://images.shopin.net/images/61/2010/11/19/Pic845440_4547_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】AOS专柜正品外套</h1>
                    <p>市场价：￥1380</p>
                    <p><b>特供价：￥199</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1150079.html">
                	<img src="http://images.shopin.net/images/68/2011/08/16/Pic1150079_116526_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】Eneby专柜正品女款其它外套</h1>
                    <p>市场价：￥769</p>
                    <p><b>特供价：￥99</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/666340.html">
                	<img src="http://images.shopin.net/images/68/2011/08/16/Pic666340_67783_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】Eneby专柜正品套头衫</h1>
                    <p>市场价：￥439</p>
                    <p><b>特供价：￥79</b></p>
                </a>
            </li>
            
            <li>
            	<a href="http://www.shopin.net/product/1406523.html">
                	<img src="http://images.shopin.net/images/68/2011/09/10/Pic1406523_114631_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】Eneby专柜正品女款其它套头衫</h1>
                    <p>市场价：￥489</p>
                    <p><b>特供价：￥59</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/83420.html">
                	<img src="http://images.shopin.net/images/60/2010/10/11/Pic83420_24093_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】IVRESSE专柜正品外套</h1>
                    <p>市场价：￥3280</p>
                    <p><b>特供价：￥262</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/627264.html">
                	<img src="http://images.shopin.net/images/60/2010/12/09/Pic627264_24075_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】IVRESSE专柜正品外套</h1>
                    <p>市场价：￥860</p>
                    <p><b>特供价：￥158</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/783403.html">
                	<img src="http://images.shopin.net/images/68/2011/10/24/Pic783403_24067_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】IVRESSE专柜正品女款其它外套</h1>
                    <p>市场价：￥2980</p>
                    <p><b>特供价：￥158</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1498058.html">
                	<img src="http://images.shopin.net/images/66/2011/10/29/Pic1498058_7172_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】纳纹专柜正品外套</h1>
                    <p>市场价：￥896</p>
                    <p><b>特供价：￥199</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1516287.html">
                	<img src="http://images.shopin.net/images/68/2011/11/11/Pic1516287_97238_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】纳纹专柜正品女款其它外套</h1>
                    <p>市场价：￥986</p>
                    <p><b>特供价：￥199</b></p>
                </a>
            </li>
            
            <li>
            	<a href="http://www.shopin.net/product/1498050.html">
                	<img src="http://images.shopin.net/images/66/2011/10/29/Pic1498050_98059_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】纳纹专柜正品女款其它外套</h1>
                    <p>市场价：￥1136</p>
                    <p><b>特供价：￥199</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1516297.html">
                	<img src="http://images.shopin.net/images/68/2011/11/11/Pic1516297_7172_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】纳纹专柜正品女款其它外套</h1>
                    <p>市场价：￥896</p>
                    <p><b>特供价：￥150</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1377122.html">
                	<img src="http://images.shopin.net/images/66/2011/08/29/Pic1377122_123141_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】huayin专柜正品外套</h1>
                    <p>市场价：￥688</p>
                    <p><b>特供价：￥79</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1322965.html">
                	<img src="http://images.shopin.net/images/63/2011/07/26/Pic1322965_123142_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】huayin专柜正品外套</h1>
                    <p>市场价：￥4680</p>
                    <p><b>特供价：￥319</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/709963.html">
                	<img src="http://images.shopin.net/images/68/2011/09/22/Pic709963_76018_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】诺恩专柜正品套头衫</h1>
                    <p>市场价：￥580</p>
                    <p><b>特供价：￥68</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/986713.html">
                	<img src="http://images.shopin.net/images/61/2011/02/09/Pic986713_73336_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】F2FACE专柜正品整体衣</h1>
                    <p>市场价：￥866</p>
                    <p><b>特供价：￥129</b></p>
                </a>
            </li>
            
             <li>
            	<a href="http://www.shopin.net/product/1495399.html">
                	<img src="http://images.shopin.net/images/68/2011/11/03/Pic1495399_153396_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】温娜尔专柜正品外套</h1>
                    <p>市场价：￥1200</p>
                    <p><b>特供价：￥159</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1506970.html">
                	<img src="http://images.shopin.net/images/68/2011/11/03/Pic1506970_150484_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】温娜尔专柜正品背心</h1>
                    <p>市场价：￥1020</p>
                    <p><b>特供价：￥159</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1495883.html">
                	<img src="http://images.shopin.net/images/68/2011/11/03/Pic1495883_153391_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】温娜尔专柜正品女款其它背心</h1>
                    <p>市场价：￥1500</p>
                    <p><b>特供价：￥159</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1506972.html">
                	<img src="http://images.shopin.net/images/68/2011/11/03/Pic1506972_153393_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】温娜尔专柜正品背心</h1>
                    <p>市场价：￥1500</p>
                    <p><b>特供价：￥239</b></p>
                </a>
            </li>
            
            <li>
            	<a href="http://www.shopin.net/product/1011936.html">
                	<img src="http://images.shopin.net/images/66/2011/02/25/Pic1011936_100906_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】F2FACE专柜正品棉夹克外套</h1>
                    <p>市场价：￥496</p>
                    <p><b>特供价：￥67</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1456585.html">
                	<img src="http://images.shopin.net/images/68/2011/10/21/Pic1456585_98059_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】纳纹专柜正品女款化纤外套</h1>
                    <p>市场价：￥866</p>
                    <p><b>特供价：￥199</b></p>
                </a>
            </li>
            
            <li>
            	<a href="http://www.shopin.net/product/1532501.html">
                	<img src="http://images.shopin.net/images/63/2011/11/23/Pic1532501_152057_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】菲尔图专柜正品女款PU靴子</h1>
                    <p>市场价：￥580</p>
                    <p><b>特供价：￥258</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1532533.html">
                	<img src="http://images.shopin.net/images/63/2011/11/23/Pic1532533_8735_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】菲尔图专柜正品女款PU靴子</h1>
                    <p>市场价：￥580</p>
                    <p><b>特供价：￥258</b></p>
                </a>
            </li>
            
            <li>
            	<a href="http://www.shopin.net/product/1532528.html">
                	<img src="http://images.shopin.net/images/63/2011/11/23/Pic1532528_8605_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】菲尔图专柜正品女款PU靴子</h1>
                    <p>市场价：￥580</p>
                    <p><b>特供价：￥258</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1532522.html">
                	<img src="http://images.shopin.net/images/63/2011/11/23/Pic1532522_100380_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】菲尔图专柜正品女款PU靴子</h1>
                    <p>市场价：￥580</p>
                    <p><b>特供价：￥258</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1496691.html">
                	<img src="http://images.shopin.net/images/66/2011/10/27/Pic1496691_152414_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】SHOWPLUS专柜正品2011靴子</h1>
                    <p>市场价：￥1428</p>
                    <p><b>特供价：￥399</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1511201.html">
                	<img src="http://images.shopin.net/images/58/2011/11/09/Pic1511201_153711_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】Minicactus专柜正品女款真皮靴子</h1>
                    <p>市场价：￥738</p>
                    <p><b>特供价：￥295</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/584477.html">
                	<img src="http://images.shopin.net/images/60/2010/08/13/Pic584477_12056_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】D:FUSE专柜正品靴子</h1>
                    <p>市场价：￥1299</p>
                    <p><b>特供价：￥299</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/755631.html">
                	<img src="http://images.shopin.net/images/58/2011/10/21/Pic755631_82501_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】菲尔图专柜正品女款真皮靴子</h1>
                    <p>市场价：￥1180</p>
                    <p><b>特供价：￥206</b></p>
                </a>
            </li>
            
            <li>
            	<a href="http://www.shopin.net/product/1462631.html">
                	<img src="http://images.shopin.net/images/58/2011/10/09/Pic1462631_8177_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】伊人专柜正品靴子</h1>
                    <p>市场价：￥698</p>
                    <p><b>特供价：￥159</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1421708.html">
                	<img src="http://images.shopin.net/images/60/2011/09/19/Pic1421708_25631_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】伊人专柜正品靴子</h1>
                    <p>市场价：￥858</p>
                    <p><b>特供价：￥207</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1519976.html">
                	<img src="http://images.shopin.net/images/60/2011/11/11/Pic1519976_8240_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】伊人专柜正品靴子</h1>
                    <p>市场价：￥858</p>
                    <p><b>特供价：￥207</b></p>
                </a>
            </li>
            <li>
            	<a href="http://www.shopin.net/product/1438576.html">
                	<img src="http://images.shopin.net/images/60/2011/09/27/Pic1438576_8240_0_1.jpg" width="130" height="130"  />
                    <h1>【网络特供】伊人专柜正品靴子</h1>
                    <p>市场价：￥698</p>
                    <p><b>特供价：￥159</b></p>
                </a>
            </li>
            <div style="clear:both"></div>
        </ul>
        <div style="clear:both"></div>
    </div>
    
    <div style="height:95px; overflow:hidden;"><img src="http://images.shopin.net/images/ad/2011finalsale/2011finalsale_04.jpg" width="950" height="95" border="0" usemap="#Map" />
      <map name="Map" id="Map">
        <area shape="rect" coords="168,11,262,76" href="http://www.shopin.net/brands/1413.html" />
        <area shape="rect" coords="278,11,370,77" href="http://www.shopin.net/brands/1411.html" />
        <area shape="rect" coords="387,10,480,76" href="http://www.shopin.net/brands/1505.html" />
        <area shape="rect" coords="498,11,592,77" href="http://www.shopin.net/brands/1524.html" />
        <area shape="rect" coords="608,11,701,77" href="http://www.shopin.net/brands/1881.html" />
        <area shape="rect" coords="716,11,808,75" href="http://www.shopin.net/brands/1420.html" />
        <area shape="rect" coords="844,34,907,52" href="http://www.shopin.net/promotion/3834.html" />
      </map>
    </div>
    <div style="height:101px; overflow:hidden;"><img src="http://images.shopin.net/images/ad/2011finalsale/2011finalsale_05_2.jpg" width="950" height="101" border="0" usemap="#Map2" />
      <map name="Map2" id="Map2">
        <area shape="rect" coords="168,19,259,84" href="http://www.shopin.net/brands/303.html" />
        <area shape="rect" coords="276,19,370,83" href="http://www.shopin.net/brands/1409.html" />
        <area shape="rect" coords="387,18,480,84" href="http://www.shopin.net/brands/1410.html" />
        <area shape="rect" coords="497,18,589,84" href="http://www.shopin.net/brands/1511.html" />
        <area shape="rect" coords="606,18,700,85" href="http://www.shopin.net/brands/1387.html" />
        <area shape="rect" coords="719,17,810,83" href="http://www.shopin.net/brands/1422.html" />
        <area shape="rect" coords="843,42,908,59" href="http://www.shopin.net/promotion/3831.html" />
      </map>
    </div>
    <div style="height:102px; overflow:hidden;"><img src="http://images.shopin.net/images/ad/2011finalsale/2011finalsale_06.jpg" width="950" height="102" border="0" usemap="#Map3" />
      <map name="Map3" id="Map3">
        <area shape="rect" coords="167,19,261,83" href="http://www.shopin.net/underwear/brands/1475.html" />
        <area shape="rect" coords="276,20,370,83" href="http://www.shopin.net/underwear/brands/1478.html" />
        <area shape="rect" coords="386,20,480,83" href="http://www.shopin.net/underwear/brands/1445.html" />
        <area shape="rect" coords="497,18,590,84" href="http://www.shopin.net/underwear/brands/1488.html" />
        <area shape="rect" coords="606,18,700,83" href="http://www.shopin.net/underwear/brands/174.html" />
        <area shape="rect" coords="715,19,809,85" href="http://www.shopin.net/brands/1476.html" />
        <area shape="rect" coords="844,42,907,59" href="http://www.shopin.net/promotion/3829.html" />
      </map>
    </div>
    <div style="height:101px; overflow:hidden;"><img src="http://images.shopin.net/images/ad/2011finalsale/2011finalsale_07.jpg" width="950" height="101" border="0" usemap="#Map4" />
      <map name="Map4" id="Map4">
        <area shape="rect" coords="168,20,262,85" href="http://www.shopin.net/shoes/brands/256.html" />
        <area shape="rect" coords="275,20,369,84" href="http://www.shopin.net/shoes/brands/237.html" />
        <area shape="rect" coords="388,21,479,85" href="http://www.shopin.net/shoes/brands/1357.html" />
        <area shape="rect" coords="496,20,591,85" href="http://www.shopin.net/shoes/brands/246.html" />
        <area shape="rect" coords="607,19,699,84" href="http://www.shopin.net/shoes/brands/126.html" />
        <area shape="rect" coords="715,19,810,84" href="http://www.shopin.net/brands/340.html" />
        <area shape="rect" coords="844,43,907,59" href="http://www.shopin.net/promotion/3832.html" />
      </map>
    </div>
    <div style="height:124px; overflow:hidden;"><img src="http://images.shopin.net/images/ad/2011finalsale/2011finalsale_08.jpg" width="950" height="124" border="0" usemap="#Map5" />
      <map name="Map5" id="Map5">
        <area shape="rect" coords="168,22,260,86" href="http://www.shopin.net/brands/1941.html " />
        <area shape="rect" coords="277,22,370,85" href="http://www.shopin.net/brands/1616.html" />
        <area shape="rect" coords="387,20,479,85" href="http://www.shopin.net/brands/602.html" />
        <area shape="rect" coords="498,21,588,86" href="http://www.shopin.net/brands/591.html" />
        <area shape="rect" coords="606,21,699,85" href="http://www.shopin.net/brands/593.html" />
        <area shape="rect" coords="715,19,808,85" href="http://www.shopin.net/brands/605.html" />
        <area shape="rect" coords="846,48,908,64" href="http://www.shopin.net/promotion/3833.html" />
      </map>
    </div>
    
    <div style="margin-top:20px; background:url(http://images.shopin.net/images/ad/2011finalsale/2011finalsale_15_2.jpg); width:950px; height:37px; overflow:hidden;">
    	<div class="remainSeconds" style="display:none"><%=(time.getTime()-System.currentTimeMillis())/1000%></div>
        <div class="flash-font12">
            <span class="remainTime"><span class="flash-font16">0</span>天<span class="flash-font16">0</span>小时<span
                    class="flash-font16">0</span>分<span class="flash-font16">0</span>秒
            </span>
            结束
        </div>
    </div>
    <div><a href="http://www.shopin.net/promotion/3834.html"><img src="http://images.shopin.net/images/ad/2011finalsale/2011finalsale_16.jpg" width="950" height="205" /></a></div>
    <div><a href="http://www.shopin.net/promotion/3829.html"><img src="http://images.shopin.net/images/ad/2011finalsale/2011finalsale_17.jpg" width="950" height="205" /></a></div>
    <div><a href="http://www.shopin.net/promotion/3833.html"><img src="http://images.shopin.net/images/ad/2011finalsale/2011finalsale_18.jpg" width="950" height="205" /></a></div>
    <div><a href="http://www.shopin.net/promotion/3832.html"><img src="http://images.shopin.net/images/ad/2011finalsale/2011finalsale_19.jpg" width="950" height="206" /></a></div>
    <div><a href="http://www.shopin.net/promotion/3831.html"><img src="http://images.shopin.net/images/ad/2011finalsale/2011finalsale_20.jpg" width="950" height="205" /></a></div>
    <div><img src="http://images.shopin.net/images/ad/2011finalsale/2011finalsale_21.jpg" width="950" height="17" /></div>
</div>
</body>
</html>
