<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<title>贺天猫5周年,5000张购物券狂派!</title>
<style>
img { vertical-align:top; border:0;}
</style>
<script src="http://images.shopin.net/js/jquery/jquery.cookie.js"></script>
<script>
$(function(){
	var cookieDate = new Date();
		cookieDate.setTime(cookieDate.getTime() + (60 * 60 * 1000));
		$.cookie("cmbFlag", "1",{expires:cookieDate,path:'/',domain:'shopin.net'});
});
</script>
</head>

<body>
<div class="mini">
<a href="http://shopin.tmall.com/?spm=a1z10.1.w1873034753.8.C7UrfC" target="_blank"><img src="http://images.shopin.net/images/ad/2013tmallmini/img01.jpg"></a>
<a href="http://shopin.tmall.com/?spm=a1z10.1.w1873034753.8.C7UrfC" target="_blank"><img src="http://images.shopin.net/images/ad/2013tmallmini/img02.jpg"></a>
</div>
</body>
</html>
