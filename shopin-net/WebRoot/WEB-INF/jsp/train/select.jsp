<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
            
     function validate(){
		var i = $('#source option:selected').length;
		alert(i); 
		alert($('#source option:selected').length=='0');
    	alert($('#source option:selected').val()=='请选择'); 
    	 
     }
  

</script>


</head>
<body>
		<select id="source"><option>请选择</option>
			<option value="0">微信</option>
			<option value="1">微博</option>
			<option value="2">论坛</option>
			<option value="3">搜索</option>
			<option value="4">网络新闻</option>
			<option value="5">百度知道等问答媒体</option>
			<option value="6">其它网站</option>
			<option value="7">店内明示</option>
			<option value="8">短信</option>
			<option value="9">宣传海报</option>
			<option value="10">地铁广告</option>
			<option value="11">地铁广告</option>
			<option value="12">电梯广告</option>
			<option value="13">户外广告</option>
			<option value="14">朋友推荐</option>
			<option value="15">其它</option></select>

	</select>
    <button id="btn" onclick="validate();">ccc</button>

</body>
</html>