// JavaScript Document
var timeCounter = (function() {
 var int;
 var total = 0;
 return function(elemID, remainTime) {
  obj = document.getElementById(elemID);
  if(null != remainTime && "" != remainTime && remainTime > 0) {
	  total = remainTime;
  } 
  if(total > 0) {
	  $(".shangou").show();
  }
  var s = (total%60) < 10 ? ('0' + total%60) : total%60;
  var h = total/3600 < 10 ? ('0' + parseInt(total/3600)) : parseInt(total/3600);
  var m = (total-h*3600)/60 < 10 ? ('0' + parseInt((total-h*3600)/60)) : parseInt((total-h*3600)/60);
  if(obj != null) {
	  obj.innerHTML = m + ' 分 ' + s + ' 秒 ';
  }
  
  total--;
  int = setTimeout("timeCounter('" + elemID + "')", 1000);
  if(total < 0) {
	  clearTimeout(int);
	  $(".shangou").hide();
	  window.location.href = "show.html";
	  total = 0;
  }
 }
})()