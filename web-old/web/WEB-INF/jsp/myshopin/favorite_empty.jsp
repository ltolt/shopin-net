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
<script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>
<link href="${css}/myshopin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
    /**
    * 添加到收藏
    */
   function add(button,productSID){
       $.ajax({
            url:'${ctx}/favor/add.json',
            type: 'post',
            dataType: 'json',
            data:{'productSID':productSID},
            timeout: 3000,
            error: function(){
                $.popdialog(button,"favor_add","加入收藏失败,请重试");
                return;
            },
            success: function(response){
                var flag=response.result;
                if(flag=='1'){
                   $.popdialog(button,"favor_add","加入收藏成功");
                }else{
                   $.popdialog(button,"favor_add","加入收藏失败,请重试");
                }
                return;
            }
     });
   }
</script>
</head>
<body>
<%--面包屑内容开始--%>
<div id="breadcrumb">
    <a href="${ctx}">首页</a><span>></span>我的上品<span>></span>我的收藏夹
</div>
<%--面包屑内容结束--%>
<div style="width:950px;float:left">
    <%--左侧分类开始--%>
    <jsp:include page="myshopin_left.jsp"/>
    <%--左侧分类结束--%>
    <%--右侧分类开始--%>
	<div id="content-rightweihzi">
    <div id="content-right">
    	<ul>
        	<li class="shoucang-top"><strong style="color:#5B5BBE">搜索推荐热卖</strong></li>
        </ul>
		<ul class="search-top">
		   <li><input type="text" size="27" maxlength="" /></li>
		    <li><img src="${images}/l-21.gif" /></li>
		</ul>
		<div class="search-top2"><img src="${images}/l-22.gif" /></div>
        <div class="search-top200000"><strong>下面是上品折扣网热卖和推荐的商品，现在就去看吧！</strong></div>
		<div class="Contentbox1">
		    <ul>
			   <li>
            <a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
			<span class="color666666">市场正价<em>109.0</em></span>
            <h3>上品折扣价￥99.0</h3>
             </li>
			    <li>
            <a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
			<span class="color666666">市场正价<em>109.0</em></span>
            <h3>上品折扣价￥99.0</h3>
             </li>
			   <li>
            <a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
			<span class="color666666">市场正价<em>109.0</em></span>
            <h3>上品折扣价￥99.0</h3>
             </li>
			   <li>
            <a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
			<span class="color666666">市场正价<em>109.0</em></span>
            <h3>上品折扣价￥99.0</h3>
             </li>

                </ul>
		</div>
        <div class="Contentbox1">
        <ul>
           <li>
        <a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
        <span class="color666666">市场正价<em>109.0</em></span>
        <h3>上品折扣价￥99.0</h3>
         </li>
            <li>
        <a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
        <span class="color666666">市场正价<em>109.0</em></span>
        <h3>上品折扣价￥99.0</h3>
         </li>
           <li>
        <a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
        <span class="color666666">市场正价<em>109.0</em></span>
        <h3>上品折扣价￥99.0</h3>
         </li>
           <li>
        <a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
        <span class="color666666">市场正价<em>109.0</em></span>
        <h3>上品折扣价￥99.0</h3>
         </li>

            </ul>
    </div>
        <div class="Contentbox1">
<ul>
   <li>
<a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
<span class="color666666">市场正价<em>109.0</em></span>
<h3>上品折扣价￥99.0</h3>
 </li>
    <li>
<a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
<span class="color666666">市场正价<em>109.0</em></span>
<h3>上品折扣价￥99.0</h3>
 </li>
   <li>
<a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
<span class="color666666">市场正价<em>109.0</em></span>
<h3>上品折扣价￥99.0</h3>
 </li>
   <li>
<a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
<span class="color666666">市场正价<em>109.0</em></span>
<h3>上品折扣价￥99.0</h3>
 </li>

    </ul>
</div>
        <div class="Contentbox1">
     <ul>
           <li>
        <a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
        <span class="color666666">市场正价<em>109.0</em></span>
        <h3>上品折扣价￥99.0</h3>
         </li>
            <li>
        <a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
        <span class="color666666">市场正价<em>109.0</em></span>
        <h3>上品折扣价￥99.0</h3>
         </li>
           <li>
        <a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
        <span class="color666666">市场正价<em>109.0</em></span>
        <h3>上品折扣价￥99.0</h3>
         </li>
           <li>
        <a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
        <span class="color666666">市场正价<em>109.0</em></span>
        <h3>上品折扣价￥99.0</h3>
         </li>

            </ul>
    </div>
        <div class="Contentbox1">
        <ul>
           <li>
        <a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
        <span class="color666666">市场正价<em>109.0</em></span>
        <h3>上品折扣价￥99.0</h3>
         </li>
            <li>
        <a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
        <span class="color666666">市场正价<em>109.0</em></span>
        <h3>上品折扣价￥99.0</h3>
         </li>
           <li>
        <a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
        <span class="color666666">市场正价<em>109.0</em></span>
        <h3>上品折扣价￥99.0</h3>
         </li>
           <li>
        <a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
        <span class="color666666">市场正价<em>109.0</em></span>
        <h3>上品折扣价￥99.0</h3>
         </li>

            </ul>
    </div>
        <div class="Contentbox1">
        <ul>
           <li>
        <a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
        <span class="color666666">市场正价<em>109.0</em></span>
        <h3>上品折扣价￥99.0</h3>
         </li>
            <li>
        <a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
        <span class="color666666">市场正价<em>109.0</em></span>
        <h3>上品折扣价￥99.0</h3>
         </li>
           <li>
        <a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
        <span class="color666666">市场正价<em>109.0</em></span>
        <h3>上品折扣价￥99.0</h3>
         </li>
           <li>
        <a href="#"><img src="${images}/l-23.gif" title="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
        <span class="color666666">市场正价<em>109.0</em></span>
        <h3>上品折扣价￥99.0</h3>
         </li>

            </ul>
    </div>
    </div>
    <%--右侧分类结束--%>
    </div>
</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>
</body>
</html>
