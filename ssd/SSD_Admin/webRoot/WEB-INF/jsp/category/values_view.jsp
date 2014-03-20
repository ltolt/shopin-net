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
	    <table id="value_dict" class="easyui-datagrid" 
	            data-options="sortName:'sid',fit:true,rownumbers:true,singleSelect:true,pagination:true,url:'${ctx}/valuesdict/list.html',toolbar:'#tb'" >  
	        <thead>  
	            <tr>  
	            	<th data-options="field:'ck',checkbox:true,width:30"></th>
	                <th data-options="field:'sid',width:80">属性值编号</th>  
	                <th data-options="field:'valuesName',width:120">属性值名称</th>  
	                <th data-options="field:'valuesDesc',width:120">属性值描述</th>  
	                <th data-options="field:'valuesCode',width:120">属性值编码</th>
	                <th data-options="field:'status',width:120,formatter:action">状态</th>
	                <th data-options="field:'channelName',width:120">渠道名称</th>
	            </tr>  
	        </thead>
	    </table> 
	    <div id="tb"> 
	    	<table cellpadding="0" cellspacing="0" style="width: 100%">
	            <tr>
	                <td>
	                    属性值名称:<input name="valuesName"  id="valuesName" class="easyui-validatebox"/>
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
	    
	    <div id="form" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"  
            closed="true" buttons="#dlg-buttons">  
	        <div class="ftitle">属性值信息</div>  
	        <form id="fm" method="post" novalidate>  
	            <div class="fitem">  
	                <label>属性值名称:</label>  
	                <input name="valuesName" class="easyui-validatebox" required="true"/>  
	            </div>
	            <div class="fitem">  
	                <label>属性值描述:</label>  
	                <input name="valuesDesc" class="easyui-validatebox" required="true"/>  
	            </div>
	            <div class="fitem">  
	                <label>属性值编码:</label>  
	                <input name="valuesCode" class="easyui-validatebox" required="true"/>  
	            </div>
	            <div id="radio1" class="fitem">  
	                <label>显示标记:</label>  
	                <input type="radio" name="status" value="1"/>
	                <span>显示</span>  
          			<input type="radio" name="status" value="0"/>
          			<span>不显示</span>   
	            </div>
	            <div class="fitem">  
	                <label>渠道名称:</label>
	                <input class="easyui-combobox" name="channelSid"
					data-options="
						url:'${ctx}/chancombox/list.html',
						valueField:'sid',
						textField:'channelName'">   
	            </div>
	        </form>  
	    </div>  
	    
	    <div id="dlg-buttons">  
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a>  
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>  
	    </div>
	    
	    <script type="text/javascript">  
        	function find(){  
				var value=$('#valuesName').val();
				$('#value_dict').datagrid('load',{valuesName: value});
			}
        	var url;
        	function append(){  
	            $('#form').dialog('open').dialog('setTitle','添加属性值');  
	            $('#fm').form('clear');
	            $('#fm').form('load',{name:"",status:1});
            	url = '${ctx}/valuesdict/add.html';  
	        }
	        function edit(){  
	            var row = $('#value_dict').datagrid('getSelected');
	            if (row){  
	                $('#form').dialog('open').dialog('setTitle','修改属性值');  
	                $('#fm').form('load','${ctx}/valuesdict/edit.html?id='+row.sid);
	                url = '${ctx}/valuesdict/add.html?sid='+row.sid;
	            } else {
	            	$.messager.show({ 
                        title: '消息警告',  
                        msg: '请选择一条记录'  
                    });
            	} 
	        }
	        function save(){  
	            $('#fm').form('submit',{  
	                url: url,  
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
	                        $('#value_dict').datagrid('reload');    // reload the user data  
	                    }  
	                }
	            });  
	        }
	        function remove(){  
	            var row = $('#value_dict').datagrid('getSelected');
	            if (row){  
	                $.messager.confirm('Confirm','确定要删除吗?',function(r){  
	                    if (r){  
	                        $.post('${ctx}/valuesdict/del.html',{id:row.sid},function(result){  
	                            if (result.success){  
	                                $('#value_dict').datagrid('reload'); 
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