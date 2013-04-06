<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Card layout的使用</title>
 <script type="text/javascript">
      Ext.onReady(function(){
    	  //自定义的功能
    	  var  navHandler = function(direction){
    		 //每当切换卡片的时候就会执行这个函数
    		 //这里可按照事件情况调用setActiveItem方法，处理任何有分支的判断，包括一些可能的动作
    		 //如 取消 或完结卡片
    		 //一个真实的向导根据设计的情况可能很复杂，最好是创建一个子类来完成设计
    		 alert(direction);
    		 alert(this.id);
    		 alert(this.html);
    		 alert(this);
    	  }
    	  
    	  var card = new Ext.Panel({
    		  title:'向导的演示',
    		  layout:'card',
    		  activeItem:0,//激活的item不能缺少
    		  bodyStyle:'padding:15px',
    		  renderTo:document.body,
    		  defaults:{
    			  //对每个组件都有效
    			  border:false
    		  },
    		  //简单的导航路由按钮，可以扩展更多
    		  bbar:[
    		        {
    		        	id:'move-prev',
    		        	text:'后退',
    		        	handler:navHandler.createDelegate(this,[-1]),
    		        	disabled:true
    		        },
    		        '->',//表示会占据所有空白的区域
    		        {
    		        	id:'move-next',
    		        	text:'前进',
    		        	handler:navHandler.createDelegate(this,[1])
    		        }
    		        ],
    		        //内面的面板，就是'卡片'
    		        items:[{
    		        	id:'card-0',
    		        	html:'<h1>欢迎来到向导</h1><p>step 1 of 3</p>'
    		        },{
						id:'card-1',    		        	
    		        	html:'<p>step 2 of 3</p>'
    		        },{
    		        	id:'card-2',
    		        	html:'<h1>祝贺</h1><p>step 3 of 3-完成</p>'
    		        }]
    	  });
    	  
      });
 
 
 
 </script>

</head>


<body>

</body>
</html>