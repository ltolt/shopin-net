<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/header.jsp" %>
<html>  
	<head>  
	    <meta charset="UTF-8">  
	    <title> jQuery EasyUI Product</title>  
	</head>  
	<body>  
	    <table id="dg" class="easyui-datagrid" 
	            data-options="sortName:'sid',sortOrder:'desc',rownumbers:true,singleSelect:true,fit:true,fitColumn:true,pagination:true,url:'${ctx}/ssdAdmin/list.html',toolbar:'#tb',
	            	onLoadSuccess:function(data){ 
	            		$('.prod').linkbutton({ text:'维护品类对应关系', plain:true, iconCls:'icon-edit' });
	            	}
	            " >  
	        <thead>  
	            <tr>  
	            	<th data-options="field:'ck',checkbox:true"></th>
	                <th data-options="field:'productName'">商品名称</th>  
	                <th data-options="field:'productSku'">商品款号</th> 
	                <th data-options="field:'brandName'">商品品牌</th>  
	                <th data-options="field:'proType',formatter:action">正式商品标记</th> 
	                <th data-options="field:'proActiveBit',formatter:action">生效标记</th> 
	                <th data-options="field:'proSelling',formatter:action">上架标记</th>
	                <th data-options="field:'sexSid',formatter:ac">款式</th>
	                <th data-options="field:'action',align:'center',formatter:operate">操作</th>
	            </tr>  
	        </thead>  
	    </table>
	    
	    <div id="form" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"  
            closed="true" buttons="#dlg-buttons">  
	        <div class="ftitle">品类信息</div>  
	        <form id="fm" method="post" novalidate>  
	            <div class="fitem">  
			         <label>关联品类:</label>
			         <input id="tt"  name="categorySid" style="width:200px" class="easyui-combotree" multiple data-options="animate:true"/>         
			    </div>
	        </form>  
	    </div>
	    
	    <div id="dlg-buttons">  
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a>  
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#form').dialog('close')">取消</a>  
	    </div>
	    
	    <div id="tb" align="left">
	      	商品款号:<input name="productSku"  id="productSku" class="easyui-validatebox"/>
	      	<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="find()">查询</a>
	    </div>
	    
	    <script type="text/javascript"> 
	        function operate(value,row,index){
	        	return '<a href="javascript:void(0)" class="prod" onclick="editRel()"></a> ';  
	        }
	        function find(){
	        	var val=$('#productSku').val();
				$('#dg').datagrid('load',{productSku: val});
	        }
	        function editRel(){
	        	var row = $('#dg').datagrid('getSelected');
	        	$('#tt').combotree({
	        		url:'${ctx}/category/liste.html?productSid='+row.sid
	        	});
	        	$.ajaxSetup ({ 
					cache: false 
				});
	        	$('#fm').form('load','${ctx}/hide/edit.html?pid='+row.sid);
	        	$('#form').dialog('open').dialog('setTitle','维护品类对应关系');
	        	
	        }
	        
	        function save(){
	        	var row = $('#dg').datagrid('getSelected');
				var url = '${ctx}/pro_cate/save.html?productSid='+row.sid;
				$('#fm').form('submit',{  
	                url: url,  
	                onSubmit: function(){  
	                    return $(this).form('validate');
	                },  
	                success: function(result){ 
	                	var result = eval('('+result+')');  
	                	var flg = result.status;
	                    if (flg=='success'){  
	                        $.messager.show({  
	                            title: '消息提示',  
	                            msg: result.message  
	                        });  
	                        $('#form').dialog('close');
	                    } else {
	                    	$.messager.show({  
	                            title: '消息提示',  
	                            msg: result.message  
	                        });  
	                        $('#form').dialog('close');      // close the dialog 
	                    }  
	                }
	            });
	        }
	        function action(value, row, index) {
		        if (value == undefined) {
		            return "";
		        }
				if (value == 1) {
		            return "有效";
		        }else{
		            return "无效";
		        }
		    }
		    function ac(value, row, index) {
		        if (value == 1) {
		            return "男款";
		        }else if (value == 2){
		            return "女款";
		        }else if (value == 3){
		            return "中性";
		        }else{
		        	return "";
		        }
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
