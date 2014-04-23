<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %><%@ page contentType="text/html;charset=UTF-8" language="java" %><%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN">
<head>
<title><decorator:title/></title>
<meta name="Keywords" content="上品折扣网,上品折扣店,上品,上品折扣官网,上品折扣网站,北京上品折扣官网,上品折扣官方网站,上品优价,上品折扣中关村店,亚奥旗舰店,上品折扣亚奥旗舰店,北京上品折扣店地址,上品折扣网是真的吗,
上品打折,上品网"/>
<meta name="Description" content="上品折扣网www.shopin.net女装,男装,运动,户外,鞋,包包,内衣,配饰打折促销特卖会!网上购物,方便省钱!100%品牌正品打折抢购,全场1折起,上品折扣,上品优价实体店供货,商场选款上品下单, 天天打折,省钱网购,10天包退换,正品质量保障!,抢购热线:4006090600"/>
<meta name="y_key" content="9b6fa984622567ef"/>
<jsp:include page="/common/meta.jsp"/>
<script type="text/javascript" src="${js}/jquery/jquery132min.js"></script>
<script type="text/javascript" src="${js}/jquery/jquery-select.js"></script>
<script type="text/javascript" src="${js}/jquery/jquery.cookie.js"></script>
<link href="${css}/reset.css" rel="stylesheet" type="text/css"/>
<link href="${css}/grids.css" rel="stylesheet" type="text/css"/>
<link href="${css}/grids-taobao.css" rel="stylesheet" type="text/css"/>
<link href="${css}/adcss.css" rel="stylesheet" type="text/css"/>
<link href="${css}/master.css?0901" rel="stylesheet" type="text/css"/>
<decorator:head/>
<script type="text/javascript">
	$(document).ready(function(){
            <%--页头初始化--%>
            $.ajax({
                url:'${ctx}/headerinfo.json',
                type: 'post',
                dataType: 'json',
                data:{},
                timeout: 30000,
                error: function(){
                    return;
                },
                success: function(response){
                    var isLogin=response.isLogin;
                    var username=response.username;
                    var proqty=response.proqty;
                    var orderqty=response.orderqty;
                    <%--处理登楼后的显示--%>
                    if(isLogin=='1'){
                      var username=response.username;
                      var li=$(".loginfo");
                      li.html("<span style='color:red;'>"+username+"</span><span>，欢迎来到上品折扣！</span><a href='${ctx}/logout.html'>注销</a>");
                    }
                    <%--处理用户购物车商品数量--%>
                    $("#header_pro_qty").html(proqty);
                    <%--处理用户订单数量--%>
                    $("#header_order_qty").html(orderqty);
                    return;
                }
            });
        });
    </script>
<!-- 百度默认跟踪代码: 开始-->
<script  type="text/javascript">
var _bdhm_top = 0;
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
var _bdhm_tim = new Image(1,1);
_bdhm_tim.id = "bdhmPerimg";
_bdhm_tim.src = _bdhmProtocol + "hm.baidu.com/_tt.gif?si=b14dd8757ed9f7dd76e92b0d74271018&rnd=" + Math.round(Math.random()*2147483647);
_bdhm_tim.onload=function(){_bdhm_top = 1;}
</script>
<!-- 百度默认跟踪代码: 结束-->
<script>
var _gaq = [];
_gaq.push(
	['_setAccount', 'UA-4728126-8'],
	['_setDomainName', ".shopin.net"],
	['_setAllowLinker', true],
	['_addOrganic', "sogou", "query"],
	['_addOrganic', "baidu", "word"],
	['_addOrganic', "soso", "w"]
);
</script>
</head>
<body>
<jsp:include page="/common/had.jsp"/>

<div id="page" class="w950">
<jsp:include page="/common/header.jsp"/>
<decorator:body/>
<jsp:include page="/common/footer.jsp"/>
</div>
<div style="display: none;">


<script language="JavaScript" type="text/javascript">
var langtaojin_client_id = "6194";
</script>
<script language="JavaScript" src="http://track.langtaojin.com/tracking/referrer.js"></script>
<noscript>
<img height="1" width="1" border="0" src="http://track.langtaojin.com/tracking/noscript.gif?client_id=6194" />
</noscript>
<script type="text/javascript" src="${js}/ck.js">
</script>
<script type="text/javascript">
try {ck.setAccount("SHOPIN-NET");
ck.trackPageView();
} catch(err) {}
</script>

<!--搜狗统计代码-->
<script  type="text/javascript">
  var _sogou_sa_q = _sogou_sa_q || [];
  _sogou_sa_q.push(['_sid', '99-163']);
 (function() {
    var _sogou_sa_protocol = (("https:" == document.location.protocol) ? "https://" : "http://");
    var _sogou_sa_src=_sogou_sa_protocol+"hermes.sogou.com/sa.js%3Fsid%3D99-163";
    document.write(unescape("%3Cscript src='" + _sogou_sa_src + "' type='text/javascript'%3E%3C/script%3E"));
    })();
</script>
<!--搜狗统计代码结束-->

<!-- 百度统计代码开始-->
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3Fb14dd8757ed9f7dd76e92b0d74271018' type='text/javascript'%3E%3C/script%3E"));
</script>
<!-- 结束-->

<!-- google统计代码开始-->
<!-- Google Code for &#30331;&#24405; Remarketing List -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1028537178;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "666666";
var google_conversion_label = "Bo1WCNzUgQIQ2va46gM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript">
	_gaq.push(['_trackPageview']);
	_gaq.push(['_trackPageLoadTime']);
  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
  var start = new Date().getTime();
		window.onload = function(){
		var time = new Date().getTime() - start;
		_gaq.push(['_trackEvent', 'RenderTime', 'PageLoadTime', '', time]);
	}
</script>
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1028537178/?label=Bo1WCNzUgQIQ2va46gM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
</div>
<!-- 结束-->
<div style="display:none">
<script src="http://s3.cnzz.com/stat.php?id=1516938&web_id=1516938&show=pic" language="JavaScript" charset="gb2312"></script>
</div>
<!--99click统计代码开始-->
<script type="text/javascript" src="http://images.shopin.net/js/o_code.js">
</script>
<!--99click统计代码结束-->		
</body>
</html>
