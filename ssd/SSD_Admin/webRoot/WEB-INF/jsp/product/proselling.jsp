<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/header.jsp" %>
<html>  
	<head>  
	    <meta charset="UTF-8">  
	    <title> jQuery EasyUI Product</title>  
	</head>  
	<body>  
	    <table id="dg" class="easyui-datagrid" 
	            data-options="sortName:'sid',sortOrder:'desc',rownumbers:true,singleSelect:true,fit:true,fitColumn:true,pagination:true,url:'${ctx}/proselling/list.html',toolbar:'#tb'" >  
	    <thead>
				<tr>
					<th data-options="field:'message',width:100">&nbsp;提 &nbsp;&nbsp;  示</th>
				</tr>
			</thead>
	    
	    </table>
	    
	    <div id="tb" align="left">
	      	商品款号:<input name="productSku"  id="productSku" class="easyui-validatebox"/>
	      	品牌ID:<input name="brandSid" id="brandSid" class="easyui-combobox" data-options="
								url:'${ctx}/ssd/brandlist.html',
								valueField:'sid',
								textField:'brandName',
								value:'--请选择--'
							"/>
	      	<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="find();">查询</a>
	    </div>
	    
	    <script type="text/javascript"> 

	        function find(){
	        	var productSku=$('#productSku').val();
	        	var brandSid=$('#brandSid').combobox('getValue');
				if (brandSid=="--请选择--") {
					brandSid="";
				}	
	        	$('#dg').datagrid('load',{productSku : productSku,brandSid:brandSid});				
	           }
	        	    	       
	    </script> 
	   
	    <style>
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
