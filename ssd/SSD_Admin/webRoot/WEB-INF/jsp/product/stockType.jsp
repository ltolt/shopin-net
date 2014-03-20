<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/header.jsp" %>
<html>
	<head>
		<meta charset="UTF-8">
       <title> stock_type</title> 
	</head>
	<body>
		<table id="dg" class="easyui-datagrid"
			data-options="sortName:'sid',sortOrder:'desc', rownumbers:true,singleSelect:true,
			pagination:true,fit:true,fitColumn:true,url:'${ctx}/stockType/list.html',toolbar:'#tb'">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'sid',width:100">库标示</th>
					<th data-options="field:'stockName',width:100">库名称</th>
				</tr>
			</thead>
		</table>
		<!-- 增删改查按钮 -->
		<div id="tb" align="left">
			<table cellpadding="0" cellspacing="0" style="width: 100%">
				<tr>
					<td>
						库名称:<input name="stockName"  id="stockName" class="easyui-validatebox"/>
	      	            <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="find()">查询</a>
					</td>
					<td style="text-align: right">
						<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addRel()">添加</a>  
						 
				      	<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editRel()">修改</a>
				      	<a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true" onclick="delRel()">删除</a> 
					</td>
				</tr>
			</table>
	     </div>
	      <!--添加修改页  -->
	    <div id="dlg_add" class="easyui-dialog" style="width:260px;height:200px;padding:5px 5px"  closed="true" buttons="#dlg-buttons">
	      	 <form id="fm_add" method="post" novalidate>
	      	 	<input name="sid" class="easyui-validatebox" type="hidden"/>
	      	 	<table style="width:100%;padding:8px">
	      	 		<tr>
	      	 			<td >库标示:</td>
	      	 			<td style="width:80px;"><input name="sid1" class="easyui-validatebox"/></td>
	      	 		</tr>
	      	 		<tr>
	      	 			<td >库名称:</td>
	      	 			<td style="width:80px;"><input  name="stockName" class="easyui-validatebox"/></td>
	      	 		</tr>
	      	 	</table>
	      	 </form>
	   </div>
	  
	      <!-- 添加修改页按钮 -->
	      <div id="dlg-buttons">  
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a>  
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg_add').dialog('close')">取消</a>  
	      </div>
	    
	<script type="text/javascript">
		 
		function find(){
        	var value = $('#stockName').val();
        	$('#dg').datagrid('load',{stockName : value});
        	
        };
        function addRel(){
        	$('#dlg_add').dialog('open').dialog('setTitle','添加');
        	$('#fm_add').form('clear');
        };
        function save(){
        	$('#fm_add').form('submit',{
        		url:'${ctx}/stockType/save.html',
        		onSubmit:function(){
        			return $(this).form('validate');
        		},
        		success:function(result){
        			var result= eval('('+result+')');
        				$.messager.show({  
	                            title: '消息',  
	                            msg: result.message}); 
        				$('#dlg_add').dialog('close'); 
        				$('#dg').datagrid('reload');
        		}
        	});
        };
        function editRel(){
        	var row = $('#dg').datagrid('getSelected');
        	if(row==null){
				alert("请选择修改项");
				return;
			}
        	$('#dlg_add').dialog('open').dialog('setTitle','修改');
        	$.ajaxSetup ({ 
				cache: false 
			});
        	$('#fm_add').form('load',{sid:row.sid,sid1:row.sid,stockName:row.stockName})
        };
        
        function delRel(){
        	var row = $('#dg').datagrid('getSelected');
        	if(row==null){
					alert("请选择删除项");
					return;
				}
        	if(row){
        		$.messager.confirm('Confirm','确定删除吗?',function(r){
        			if(r){
        				$.post('${ctx}/stockType/delete.html',{sid:row.sid},function(result){
        						$('#dg').datagrid('reload');
        						 $.messager.show({ 
	                                    title: '消息警告',  
	                                    msg: result.message  
	                                });  
        				},'json');
        			}
        		});
        	}
        };
        
        function action(value, row, index) {
		        if (value == undefined) {
		            return "";
		        }
				if (value == 0) {
		            return "否";
		        }else{
		            return "是";
		        }
		    };
		    
		   
			
	</script>
	</body>

</html>