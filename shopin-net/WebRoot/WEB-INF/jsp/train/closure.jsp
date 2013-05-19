<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>闭包的概念</title>
<script type="text/javascript">
  //闭包
  function makePowerFn(power){
	  function powerFn(base){
		  return Math.pow(base,power);
	  }
	  return powerFn;
  }
  
  var square = makePowerFn(2);
  //alert(square(3));
   //一个普通的函数
   function makerPowerFn2(power){
	   return power;
   }
  // alert(makerPowerFn2(3));
   //一个闭包函数
 /*   function makeIncre(){
	   var n = 0;
	   function incre(){
		   return ++n;
	   }
	   //return incre;
   }
   var inc1 = makeIncre();
   var inc2 = makeIncre();
   alert(inc1());
   alert(inc1());
   alert(inc1()); */
   Ext.onReady(function(){
	   function show(x,y){
		   Ext.MessageBox.alert("提示","x=" + x + " y = " + y);
	   }
	   var f1= show.createCallback(1,2);
	   f1();
	   
	   
   });
   
   //function的概念
   function Person(name,age){
	   this.name = name;
	   this.age = age;
   }
   
   function sayHi(){
	   alert(this.name + " 嗨");
   }
   Person.prototype.sayHi = sayHi;//注意函数名后面不带括号,表示函数的引用
   var someone = new Person('jack',18);
   someone.sayHi();
</script>















</head>
<body>

</body>
</html>