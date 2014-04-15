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
<script src="${localjs}/backToTop.js"></script>
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
                    <%--处理登lu后的显示--%>
                    if(isLogin=='1'){   
                      var li=$("#hello");
                      var login=$(".login");   
                      li.html("<span style='color:red'>"+username+"</span>，欢迎来到上品折扣！");
                      login.html("<a href='${ctx}/logout.html'>注销</a>");
                      
                    }
                    <%--处理用户购物车商品数量--%>
                    $("#shopping-amount").html(proqty);
                    <%--处理用户订单数量--%>
                    $("#header_order_qty").html(orderqty);
                    return;
                }
            });
        });
    </script>
</head>
<body>

<jsp:include page="/common/header.jsp"/>
<decorator:body/>
<jsp:include page="/common/footer.jsp"/>


<!--[if IE 6]>
<script src="http://images.shopin.net/s/js/DD_belatedPNG_0.0.8a-min.js"></script> 
<script type="text/javascript"> 
DD_belatedPNG.fix('.png,.categorys .catehd span'); 
</script> 
<![endif]-->

</body>
</html>








