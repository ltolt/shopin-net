/**
 * 扩展jquery,格式化函数
 */
jQuery.extend({
   formatMoney:function(money){
    var str=""+money;
    var index=str.indexOf(".");
    if(index<0){
          str+=".00";
    }
    var arr = (new String(str)).split(".");
    var xs = arr[1];
    if((xs+"").length>3){
      if((xs+"").charAt(2)=='9'){
         str = arr[0]+"."+(parseInt((xs+"").substring(0,2))+1);
      }
      if((xs+"").charAt(2)=='0'){
       str = arr[0]+"."+(xs+"").substring(0,2);
      }
    }
    return str;
   }
});