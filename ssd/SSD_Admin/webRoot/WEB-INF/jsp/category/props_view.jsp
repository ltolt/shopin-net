<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<html>  
	<head>
	    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">  
	    <meta name="keywords" content="jquery,ui,easy,easyui,web">  
	    <meta name="description" content="easyui help you build your web page easily!"> 
	</head>  
	<body>     
	    <table id="prop_dict" class="easyui-datagrid" 
	            data-options="sortName:'sid',fit:true,rownumbers:true,singleSelect:true,pagination:true,url:'${ctx}/propsdict/list.html',toolbar:'#tb'" >  
	        <thead>  
	            <tr>  
	            	<th data-options="field:'ck',checkbox:true,width:30"></th>
	                <th data-options="field:'sid',width:80">属性编号</th>  
	                <th data-options="field:'propsName',width:120">属性名称</th>  
	                <th data-options="field:'propsDesc',width:120">属性描述</th>  
	                <th data-options="field:'propsCode',width:120">属性编码</th>
	                <th data-options="field:'status',width:120,formatter:action">状态</th>
	                <th data-options="field:'isErpProp',width:120,formatter:erp">ERP标记</th>
	                <th data-options="field:'channelName',width:120">渠道名称</th>
	            </tr>  
	        </thead>
	    </table> 
	    <div id="tb">  
		    <table cellpadding="0" cellspacing="0" style="width: 100%">
	            <tr>
	                <td>
	                    属性名称:<input name="propsName"  id="propsName" class="easyui-validatebox"/>
	                    属性描述:<input name="propsDesc"  id="propsDesc" class="easyui-validatebox"/>
	      				<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="find()">查询</a>
	                </td>
	                <td style="text-align: right">　　　　　　
	                    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="append()">添加</a>  
					    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="edit()">修改</a>  
					    <a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true" onclick="remove()">删除</a>
	                </td>
	            </tr>
	        </table>  
		</div>
	    
	    <div id="form" class="easyui-dialog" style="width:600px;height:400px;padding:10px 20px"  
            closed="true" buttons="#dlg-buttons">  
	        <div class="ftitle">属性信息</div>  
	        <form id="fm" method="post" novalidate>  
	            <div class="fitem">
		            <table style="width:90%;padding:5px">
		      	 		<tr>
		      	 			<td style="width:30px;"><label>属性名称:</label></td>
		      	 			<td style="width:60px;"><input name="propsName" class="easyui-validatebox" required="true"/></td>
		      	 			<td style="width:30px;"><label>属性描述:</label></td>
		      	 			<td style="width:60px;"><input name="propsDesc" class="easyui-validatebox" /></td>
		      	 		</tr>
		      	 		<tr>
		      	 			<td ><label>属性编码:</label></td>
		      	 			<td style="width:60px;"><input name="propsCode" class="easyui-validatebox" /></td>
		      	 			<td id="radio1"><label>状态:</label></td>
		      	 			<td style="width:60px;">
								<input type="radio" name="status" value="1"/>
				                <span>有效</span>  
			          			<input type="radio" name="status" value="0"/>
			          			<span>无效</span>
							</td>
		      	 		</tr>
		      	 		<!--
		      	 		<tr>
		      	 			<td ><label>渠道名称:</label></td>
		      	 			<td style="width:60px;"><input class="easyui-combobox" name="channelSid"
								data-options="
									url:'${ctx}/chancombox/list.html',
									valueField:'sid',
									textField:'channelName'"></td>
		      	 		</tr>
		      	 		-->
		      	 	</table>
	      	 	</div>
	      	 	<div class="fitem">
		            <table id="value_dict" class="easyui-datagrid" style="width:450px;padding:10px 20px"
				            data-options="sortName:'sid',singleSelect:true,onClickRow: onClickRow,toolbar:'#tb1'" >  
				        <thead>  
				            <tr>  
				            	<th data-options="field:'ck',checkbox:true,width:30"></th>
				                <th data-options="field:'valuesName',width:100,editor:'text'">属性值名称</th>  
				                <th data-options="field:'valuesDesc',width:100,editor:'text'">属性值描述</th>  
				                <th data-options="field:'valuesCode',width:100,editor:'text'">属性值编码</th>
				                <th data-options="field:'status',width:100,
				                		formatter: function (value) {  
						                    if (String(value) == '1') {  
						                        return '有效';  
						                    }  
						                    else if (String(value) == '0') {  
						                        return '无效';  
						                    }  
						                },
				                		editor:{type:'checkbox',options:{on:'1',off:'0'}}">有效标记</th>
				            </tr>  
				        </thead>
				    </table> 
				    <div id="tb1"> 
				    	<table cellpadding="0" cellspacing="0" style="width: 100%">
				            <tr>
				                <td>
			                    	<label>属性值添加</label>
			                	</td>
				            	<td style="text-align: right">　　　　　　
				                    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()"></a>
								    <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="del()"></a>
				                </td>
				            </tr>
				        </table>  
					</div>
				</div>
	        </form>  
	    </div>  
	    
	    <div id="dlg-buttons">  
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a>  
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#form').dialog('close')">取消</a>  
	    </div>
	    
	    <script type="text/javascript">  
        	
	    	var editIndex = undefined;
			function endEditing(){
				if (editIndex == undefined){return true}
				if ($('#value_dict').datagrid('validateRow', editIndex)){
					$('#value_dict').datagrid('endEdit', editIndex);
					editIndex = undefined;
					return true;
				} else {
					return false;
				}
			}
	    	
			function onClickRow(index){
				if (editIndex != index){
					if (endEditing()){
						$('#value_dict').datagrid('selectRow', index)
								.datagrid('beginEdit', index);
						editIndex = index;
					} else {
						$('#value_dict').datagrid('selectRow', editIndex);
					}
				}
			}
			
			function add(){
				if (endEditing()){
					$('#value_dict').datagrid('appendRow',{});
					editIndex = $('#value_dict').datagrid('getRows').length-1;
					$('#value_dict').datagrid('selectRow', editIndex)
							.datagrid('beginEdit', editIndex);
				}
			}
			function del(){
				if (editIndex == undefined){return}
				$('#value_dict').datagrid('cancelEdit', editIndex)
						.datagrid('deleteRow', editIndex);
				editIndex = undefined;
			}
			function endEdit(){
				var rows = $('#value_dict').datagrid('getRows');
				for ( var i = 0; i < rows.length; i++) {
					$('#value_dict').datagrid('endEdit', i);
				}
			}
        	
        	function find(){  
				var value=$('#propsName').val();
				var value1=$('#propsDesc').val();
				$('#prop_dict').datagrid('load',{propsName: value,propsDesc: value1});
			}
        	function append(){  
	            $('#form').dialog('open').dialog('setTitle','添加属性');  
	            $('#fm').form('clear');
	            $('#fm').form('load',{name:"",status:1});
	        }
	        var sid;
	        function edit(){  
	            var row = $('#prop_dict').datagrid('getSelected');
	            if (row){
	            	sid = row.sid;
	                $('#form').dialog('open').dialog('setTitle','修改属性');  
	                $.ajaxSetup ({ 
						cache: false 
					});
	                $('#fm').form('load','${ctx}/propsdict/edit.html?id='+row.sid);
	                var qp = {sid:row.sid};
	                $('#value_dict').datagrid({
	                	url:'${ctx}/valuesbox/list.html',
	                	queryParams:qp
	                });
	            } else {
	            	$.messager.show({ 
                        title: '消息警告',  
                        msg: '请选择一条记录'  
                    });
            	} 
	        }
	        function save(){  
	        	var url = "";
	        	var insert1 = "";
	        	var update1 = "";
	        	var delete1 = "";
	        	endEdit();
				var effectRow = new Object();
				if ($('#value_dict').datagrid('getChanges').length) {
					var inserted = $('#value_dict').datagrid('getChanges', "inserted");
					var deleted = $('#value_dict').datagrid('getChanges', "deleted");
					var updated = $('#value_dict').datagrid('getChanges', "updated");
					
					if (inserted.length) {
						insert1 = JSON.stringify(inserted);
						insert1 = insert1.replace(/\%/g,"%25");
						insert1 = insert1.replace(/\#/g,"%23");
						insert1 = insert1.replace(/\&/g,"%26");
						insert1 = insert1.replace(/\+/g,"%2B");
					} 
					if (deleted.length) {
						delete1 = JSON.stringify(deleted);
						delete1 = delete1.replace(/\%/g,"%25");
						delete1 = delete1.replace(/\#/g,"%23");
						delete1 = delete1.replace(/\&/g,"%26");
						delete1 = delete1.replace(/\+/g,"%2B");
					} 
					if (updated.length) {
						update1 = JSON.stringify(updated);
						update1 = update1.replace(/\%/g,"%25");
						update1 = update1.replace(/\#/g,"%23");
						update1 = update1.replace(/\&/g,"%26");
						update1 = update1.replace(/\+/g,"%2B");
					} 
				}
				if (sid) {
					url = '${ctx}/propsdict/add.html?sid='+sid+'&insert1='+insert1+'&update1='+update1+'&delete1='+delete1;
					
				} else {
					url = '${ctx}/propsdict/add.html?insert1='+insert1+'&update1='+update1+'&delete1='+delete1;
					
				}
				$('#fm').form('submit',{  
	                url: url,
	                method:'post',
	                onSubmit: function(){  
	                    return $(this).form('validate');
	                },  
	                success: function(result){ 
	                	var result = eval('('+result+')');  
	                    if (result.errorMsg){  
	                        $.messager.show({  
	                            title: 'Error',  
	                            msg: result.errorMsg  
	                        });  
	                    } else {  
	                        $('#form').dialog('close');      // close the dialog  
	                        $('#prop_dict').datagrid('reload');    // reload the user data  
	                    }  
	                }
	            });  
	        }
	        function remove(){  
	            var row = $('#prop_dict').datagrid('getSelected');
	            if (row){  
	                $.messager.confirm('Confirm','确定要删除吗?',function(r){  
	                    if (r){  
	                        $.post('${ctx}/propsdict/del.html',{id:row.sid},function(result){  
	                            if (result.success){  
	                                $('#prop_dict').datagrid('reload'); 
	                            } else {  
	                                $.messager.show({ 
	                                    title: '消息警告',  
	                                    msg: result.errorMsg  
	                                });  
	                            }  
	                        },'json');  
	                    }  
	                });  
	            } else {
	            	$.messager.show({ 
                        title: '消息警告',  
                        msg: '请选择一条记录'  
                    });
            	} 
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
	        function erp(value, row, index) {
		        if (value == undefined) {
		            return "";
		        }
		        if (value == 1) {
		            return "ERP同步";
		        }else{
		            return "非ERP同步";
		        }
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
