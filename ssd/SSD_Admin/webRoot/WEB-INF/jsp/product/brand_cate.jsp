<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<html>  
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
	    <meta name="keywords" content="jquery,ui,easy,easyui,web">  
	    <meta name="description" content="easyui help you build your web page easily!">  
	    <title>Dynamic Loading in TreeGrid - jQuery EasyUI Demo</title>    
	</head>  
	<body> 
	    <div class="easyui-layout" data-options="fit:true"> 
			<div data-options="region:'west',split:true,border:false" style="width:200px">
				
				<div id="tt" class="easyui-tree" checkbox="true" data-options="
		    		url:'${ctx}/category/list.html',
		    		animate:true,
		    		onCheck: function(node){
						var str = node.id+','+node.text;
						var panode = $('#tt').tree('getParent',node.target);
						while($('#tt').tree('getParent',panode.target)!=null){
							str = str+'--'+panode.id+','+panode.text;
							panode = $('#tt').tree('getParent',panode.target);
						}
					}"></div>
			    
			</div>  
			
	        <div data-options="region:'center',border:false">
	        	<a href="#" class="easyui-linkbutton" onclick="getArrays()">获取ids</a> 
	        </div>
	    </div>
	    
	    
	    <script type="text/javascript">  
	        function getArrays(){
				var nodes = $('#tt').tree('getChecked');
				var nodeIds = Array();
				for(var i=0; i<nodes.length; i++){
					if($('#tt').tree('getParent',nodes[i].target)!=null){
						var isHave = false;
						for (var index = 0; index < nodeIds.length; index++) {
							if (nodeIds[index] == nodes[i].id) {
								isHave = true;
							}
						}
						if (!isHave) {
							nodeIds.push(nodes[i].id);
						}
					}
					var panode = $('#tt').tree('getParent',nodes[i].target);
					while($('#tt').tree('getParent',panode.target)!=null){
						var isHave = false;
						for (var index = 0; index < nodeIds.length; index++) {
							if (nodeIds[index] == panode.id) {
								isHave = true;
							}
						}
						if (!isHave) {
							nodeIds.push(panode.id);
						}
						panode = $('#tt').tree('getParent',panode.target);
					}
				}
					
				alert(nodeIds);
			}
	    </script>
	    
	    <style type="text/css">  
	        #fm{  
	            margin:0;  
	            padding:10px 30px;  
	        }  
	        .ftitle{  
	            font-size:14px;  
	            font-weight:bold;  
	            padding:5px 0;  
	            margin-bottom:10px;  
	            border-bottom:1px solid #ccc;  
	        }  
	        .fitem{  
	            margin-bottom:5px;  
	        }  
	        .fitem label{  
	            display:inline-block;  
	            width:80px;  
	        }  
	    </style>
	</body>  
</html>  