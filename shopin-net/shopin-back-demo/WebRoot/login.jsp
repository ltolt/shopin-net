<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="common/header.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%request.setAttribute("ctx", request.getContextPath());%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上品折扣后台管理系统</title>
<style type="text/css">
 *{padding:0;margin:0;list-style:none;font-style:normal;font-size:12px;}
html,body {height:100%; background:#eff0ea}
.admlogbox { height:330px; position:relative; top:50%; margin-top:-165px; background:url(${ctx}/images/admlogline.png) repeat-x 0 155px}
.admlogmain { width:586px; height:330px; margin:0 auto; background:url(${ctx}/images/admlogbox.png) no-repeat 0 0}
.linklogo { display:block; width:266px; height:58px; margin-left:160px}
.admlogmain ul { margin-top:90px}
.admlogmain li { margin-bottom:10px}
.admlogmain li.tips { text-align:center; height:20px; margin-bottom:2px; text-indent:4em; color:#f00}
.admlogmain label,.admlogmain .coll {display:inline-block;*display:inline;*zoom:1}
.admlogmain label { width:237px; text-align:right}
.admlogmain input { vertical-align:middle}
.admlog_text { width:161px; height:29px; line-height:29px; padding-left:3px; background:url(${ctx}/images/admlogform.png) no-repeat 0 0; border:0}
.admlog_btn { width:66px; height:24px; cursor:pointer; background:url(${ctx}/images/admlogform.png) no-repeat 0 -29px; border:0; color:#fff}
.admlogmain p { text-align:center; color:#999}
</style>

</head>

<body>

<div class="admlogbox">
<div class="admlogmain">
<a class="linklogo" href="http://union.shopin.net/"></a>
<ul>
<form action="${ctx}/security/login" method="post"  id="login">
<li class="tips"><span>${error }</span></li><!--您输入的用户名或密码错误-->
<li><label>用户名：</label><div class="coll"><input type="text" name="username" id="username" value="${username}"/></div></li>
<li><label>用户密码：</label><div class="coll"><input type="password" name="password"/></div></li>
<li><label></label><div class="coll"><input class="admlog_btn" type="submit" value="登&nbsp;录" /></div></li>
</form>
</ul>
<p>版权所有上品折扣信息系统部</p>

<%
String msg=(String)request.getParameter("error");
if("true".equals(msg)){
%>
<p><font color="red">您没有权限访问！</font></p>
<%}%>
</div>
</div>


<script type="text/javascript" src="http://images.shopin.net/js/jquery/jquery132min.js"></script>
<script type="text/javascript">
/* $(function(){
	$(".tips").children().hide();
	$(".admlog_btn").click(function(){
		$(".tips").children().show();
		})
	$(".admlog_text").focus(function(){
		$(".tips").children().hide();
		})
	})
 */</script>

</body>
</html>



