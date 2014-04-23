<%--
  Description:会员收藏夹,为空的时候显示页面
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>我的收藏夹</title>
<link href="${css}/master.css" rel="stylesheet" type="text/css" />
<link href="${css}/favorites-yes.css" rel="stylesheet" type="text/css" />
<link href="${css}/myshopin-index.css" rel="stylesheet" type="text/css" />
<script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>
<style type="text/css">
    #breadcrumb{ display:block; float:left; margin:12px 0; font-size:12px; width:950px;}
    #breadcrumb a{color:#000000; text-decoration:none;}
    #breadcrumb a:hover{color:#FF6600; text-decoration:underline;}
    #breadcrumb span{ margin:0 5px;}
    #content-left{width:200px;border: 1px solid #DFD5CA;float:left;margin-right:8px;font-size:12px;line-height: 24px;}
    #content-left .top-left{
        text-align:center;
        font-size: 15px;
        line-height: 38px;
        font-weight: bold;
        background-image: url(${images}/l-30.gif);
        color: #FFFFFF;
    }
    #content-left .top-left2{padding-left:7px;font-size: 13px;line-height: 30px;font-weight: bold;
        border-top-width: 1px;
        border-top-style: solid;
        border-right-width: 1px;
        border-bottom-width: 1px;
        border-left-width: 1px;
        border-bottom-style: solid;
        border-top-color: #DFD5CA;
        border-right-color: #DFD5CA;
        border-bottom-color: #DFD5CA;
        border-left-color: #DFD5CA;
    }
    #content-left .top-left3{ padding-left:17px; margin:10px 0; line-height:20px;}
    #content-left .top-left3 img{ margin-left:30px; margin-top:7px; margin-bottom:7px;}
    #content-left .focus11,#content-left .focus11 a{color:#FF6600;font-weight: bold;}
</style>

<script type="text/javascript">

   /**
    * 取消收藏
    */
   function remove(button,productSID){
       $.ajax({
            url:'${ctx}/favorite/remove.json',
            type: 'post',
            dataType: 'json',
            data:{'productSID':productSID},
            timeout: 30000,
            error: function(){
                $.popdialog(button,"favor_remove","取消收藏失败,请重试");
                return;
            },
            success: function(response){
                var result=response.result;
                var status=result.status;
                var message=result.message;
                $.popdialog(button,"favor_remove",message);
                if(status=='1'){
                   setTimeout(function(){window.location.reload()},2000);
                }
                return;
            }
     });
   }

<%--复制内容到剪切板--%>
function copyToClipBoard(button,productSid,productName) {
    var txt = "还在找"+productName+"的打折信息吗？"
            + "快来<a href='${ctx}/product/"+productSid+".html' target='_blank'>这里</a>吧";
    if (window.clipboardData) {
        window.clipboardData.clearData();
        window.clipboardData.setData("Text", txt);
        $.popdialog(button, "copy_to_clip_board",
                '已经将本页地址复制成功，请按Ctrl+V粘贴到QQ、MSN或电子邮件发送给您的好友');
    } else {
        $.popdialog(button, "copy_to_clip_board", "很抱歉，您的浏览器不支持该功能");
    }
}
    
</script>



</head>

<body>

<div id="breadcrumb">
	    <a href="${ctx}">首页</a><span>></span>我的上品<span>></span>我的收藏夹
</div>
<%--中间内容开始--%>
<div style="width:950px;float:left">
    <%--左侧分类开始--%>
    <jsp:include page="myshopin_left.jsp"/>
    <%--左侧分类结束--%>
	<div id="content-sp-right1">
    	<div class="myfavorites"><strong style="color:#5050B5">我的收藏夹</strong></div>
            <ul class="favorites-list">
              <c:forEach items="${product_list}" var="item">
                 <li>
              	<ul class="favorites-list-1">
               	  <li class="favorites1"><a href="${ctx}/product/${item.sid}.html" target="_blank">
                         <img src="${images}${item.proPicture.proPictDir}${item.proPicture.proPictName}" title="产品图片" align="absmiddle" />
                  </a></li>
                  <li class="favorites2">
                    	<h1><a href="${ctx}/product/${item.sid}.html" target="_blank">${item.productName}</a></h1>
                        <h1>${item.proSku}</h1>
                        <%--<h2>有货</h2>--%>
                  </li>
                  <li class="favorites3">
                    	<h2>市场正价:
                            <c:if test="${item.proPrice!=null}">
                                <del><fmt:formatNumber type="currency" value="${item.proPrice.originalPrice}"/></del>
                            </c:if>
                        </h2>
                        <h4>上品折扣价:
                            <c:if test="${item.proPrice!=null}">
                                <fmt:formatNumber type="currency" value="${item.proPrice.currentPrice}"/>
                            </c:if>
                        </h4>
                  </li>
                  <li class="favorites4">
                    	<p><a href="${ctx}/list--${item.productCateSid}.html"><img src="${images}/i-category.gif" title="查看同类商品" /></a></p>
                        <p><a href="#"><img src="${images}/i-87.gif" title="推荐给朋友" onclick="copyToClipBoard(this,'${item.sid}','${item.productName}');"/></a></p>
                        <p><img src="${images}/i-88.gif" title="取消收藏" style="cursor:pointer" onclick="remove(this,'${item.sid}')"/></p>
                  </li>
                </ul>
              </li>
              </c:forEach>
            </ul>
            <div class="digg">${page}</div>
            <%--<div class="bordertopie6">--%>
                <%--<div class="favorites-bottom"><input type="button" value="搜索推荐热卖" onclick="javascript:window.location='${ctx}/favorite/show2.html'"/> </div>--%>
                <%--<div class="digg">${page}</div>--%>
            <%--</div>--%>
	</div>
<%--中间内容结束--%>
</div>
<div class="clear">&nbsp;</div>
</body>
</html>
