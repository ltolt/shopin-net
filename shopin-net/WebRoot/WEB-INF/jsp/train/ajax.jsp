<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ajax</title>
  <script type="text/javascript">
      $(document).ready(function(){
    	  //绑定事件 -- 使用live的方式
    	  /* $('.test button').live('click',function(){
    		  alert('clicked');
    	  }); */
    	  
    	  $(document).delegate('button','click',function(){
    		  alert('clicked');
    	  });
    	  
      });              
              
  
  
  
  </script>
</head>
<body>
    <div class="test" id="d">
       <button id="btn">click me</button>
    </div>
    
    
    <script type="text/javascript">
      $(function(){
    	  $.ajax({
    		  url:'${ctx}/testJson.json',
    		  type:'post',
    		  data:{},
    		  success:function(){
    			  alert('ajax success');
    			  $('.test').html('<button id="btn">click me</button>');
    			  
    		  },
    		  error:function(){
    			  alert('error');
    		  }
    		  
    	  }
    	  );
    	  
    	  
    	  
      });
    
    
    
    
    </script>
    
    
    
    
    
    
    
</body>
</html>