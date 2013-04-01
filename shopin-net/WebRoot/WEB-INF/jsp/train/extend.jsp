<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ext extend train</title>
<script type="text/javascript">
  //Ext.extend使用
  //1.prototype的使用
  //javascript基于原型的继承的概念
  var  RectAngle = function(width,height){
    this.widht = width;
    this.height= height;
  }
  RectAngle.prototype.area = function(){
  return this.widht * this.height;
  }
  var rect = new RectAngle(3,4);
  alert(rect.area());
  
  
  
  
  

</script>

</head>
<body>                     
                      
</body>
</html>