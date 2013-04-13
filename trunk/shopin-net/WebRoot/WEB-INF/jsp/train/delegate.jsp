<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>delegate</title>
  <script src="http://code.jquery.com/jquery-1.9.0.js"></script>
   <script type="text/javascript">
        $(document).ready(function(){
        	$("div").delegate("button","click",function(){
        		$("p").slideToggle();
        	});
        });  
   </script>
 


</head>
<body>
	<div style="background-color: red">
		<p>这是一个段落。</p>
		<button>请点击这里</button>
	</div>
</body>
</html>