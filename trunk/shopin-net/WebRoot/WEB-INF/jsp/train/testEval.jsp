<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test eval</title>
<script type="text/javascript">
         
        $(function(){
        	
        	//alert(eval('{}'));//return undefined
        	//alert(eval('({})'));//return object
        
        	var data = "{root:[{name:'1',value:'看看'},{name:'6101',value:'北京市'},{name:'6102',value:'天津市'},{name:'6104',value:'重庆市'}]}";
        	var dataObj = eval("("+ data +")");
        	//alert(dataObj.root.length);//输出root的子对象数量
            $.each(dataObj.root,function(idx,item){
            	/* alert(idx);
            	alert(item); */
            	if(idx==0){
            		return true;
            	}
            	//alert('name:' + item.name + ',value:' + item.value);
                $('.product').append("<li id="+item.name +" > "+ item.value + "</li>");
            }); 	
        	
        	//第二中解析json 的方式
        	var json = '{name:"cj",age:"19"}';
        	var data = (new Function("","return " + json))();
        	alert(data.name);
        	
        	//alert('111');
        	/* var dataobj = eval("({sid:'1',name:'km'})");
        	alert(dataobj.sid); */
        	// var str= "{result:[{sid:'1',name:'km'},{sid:'2',name:'kk'}]}";
        	/* var obj  =  eval("(" + str + ")");
        	var dataObj = obj.result;
        	//alert(dataObj.sid);
        	alert(dataObj.length);
        	for(var i=0;i < dataObj.length;i++){
        		$('.product').append("<li id="+dataObj[i].sid +" > "+ dataObj[i].name + "</li>");
        		
        	} 
        	 */
        	
        	
        	
        }); 
   


</script>


</head>
<body>
   <ul class="product">
   
   
   </ul>
</body>
</html>