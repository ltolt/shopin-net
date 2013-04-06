<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Accordion layout</title>
<script type="text/javascript">
        Ext.onReady(function(){
        	//AccordionLayout的使用
        	var accordion = new Ext.Panel({
        		title:'Accordion Layout',
        		layout:'accordion',
        		defaults:{
        			//作用于每个面板上
        			bodyStyle:'padding:15px'
        		},
        		layoutConfig:{
        			//layout特定的设置
        			titleCollase:false,
        			animate:true,
        			activeOnTop:true
        		},
        		items:[
        		       {title:'panel 1 ',
        		    	html:'panel 1 content'   
        		       },
        		       {
        		    	   title:'panel 2',
        		    	   html:'panel 2 content'
        		       },
        		       {
        		    	   title:'panel 3',
        		    	   html:'panel 3 content'
        		       }
        		       ]
        	});
        	 
        	accordion.render(document.body);
        	
        });



</script>

</head>
<body>

</body>
</html>