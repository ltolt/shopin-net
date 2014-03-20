<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/header.jsp" %>
<html>  
	<head>  
	    <meta charset="UTF-8">  
	    <title></title>  
	</head>  
	<body>  
		<!--  列表页  -->
	    <table id="dg" class="easyui-datagrid"  
	            data-options="sortName:'sid',sortOrder:'desc',fit:true,rownumbers:true,singleSelect:true,pagination:true,url:'${ctx}/channel/list.html',toolbar:'#tb'" >  
	        <thead>  
	            <tr>  
	            	<th data-options="field:'ck',checkbox:true"></th>
	                <th data-options="field:'channelName',width:100">渠道名称</th>  
	                <th data-options="field:'status',width:80"  formatter="Common.StatusFormatter">状态</th>  
	                <th data-options="field:'optUser',width:80">操作人</th>  
	                <th data-options="field:'optDate',width:150">操作时间</th>
	            </tr>  
	        </thead>  
	    </table>  
	
	    <div id="tb">
	    	<table cellpadding="0" cellspacing="0" style="width: 100%">
	            <tr>
	                <td>
	                    渠道名称:<input name="channelName"  id="channelName" class="easyui-validatebox"/>
	      				<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="query()">查询</a>
	                </td>
	                <td style="text-align: right">　　　　　　
	                    <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="add()">添加</a>  
					    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="update()">修改</a>  
					    <a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true" onclick="del()">删除</a>
	                </td>
	            </tr>
	        </table>
		</div> 
		
		<!--  添加页  -->
		<div id="dlg_channel" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px" closed="true" buttons="#dlg-buttons">  
		    <div class="ftitle">渠道信息</div>
		    <form id="fm_channel" method="post" novalidate>
	            <input name="sid" class="easyui-validatebox" type="hidden"/>  
	            <div class="fitem">  
	                <label>渠道名称:</label>  
	                <input name="channelName" class="easyui-validatebox" required="true"/>  
	            </div>
	            <div class="fitem">  
	                <label>状态:</label>  
	                <input type="radio" name="status" value="1" checked="true"/>
	                <span>启用</span>
	                <input type="radio" name="status" value="0" checked="false"/>
	                <span>禁用</span>
	            </div>
		    </form>  
		</div>
		
		<div id="dlg-buttons">  
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a>  
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg_channel').dialog('close')">取消</a>  
		</div>
		
	    
	    
	    <script type="text/javascript"> 
	    
		    function add(){  
	            $('#dlg_channel').dialog('open').dialog('setTitle','添加渠道');  
	            $('#fm_channel').form('clear');
	            $('#fm_channel').form('load',{status:1});
			}
			
			function update(){  
				var row = $('#dg').datagrid('getSelected');
				if(row==null){
					alert("请选择修改项");
					return;
				}
	            $('#dlg_channel').dialog('open').dialog('setTitle','修改渠道');  
	            $.ajaxSetup ({ 
					cache: false 
				});
	            $('#fm_channel').form('load','${ctx}/channel/initupdate.html?sid='+row.sid);
			}
			
			function del(){  
		        var row = $('#dg').datagrid('getSelected');   
		        if (row){  
		            $.messager.confirm('Confirm','确定要删除吗?',function(r){  
			             if (r){  
			                 $.post('${ctx}/channel/del.html',{sid:row.sid},function(result){
			                     $('#dg').datagrid('reload'); 
			                     $.messager.show({ 
	                                 title: '消息警告',  
	                                 msg: result.message
			                     });  
		                  	 },'json');  
			             }  
		            });  
		        }  
			}
			
			function save(){  
				$('#fm_channel').form('submit', {
			        url:'${ctx}/channel/save.html',
			        onSubmit: function(){
			        	return $(this).form('validate');
			        },
			        success:function(result){
			        result = eval('('+result+')');  
		                $.messager.show({ 
                            title: '消息警告',  
                            msg: result.message
                        });  
		                $('#dlg_channel').dialog('close');      // close the dialog  
	                    $('#dg').datagrid('reload');    // reload the user data    
			        }
				});
			}
			
			function query(){  
				var channelName=$('#channelName').val();
				$('#dg').datagrid('load',{channelName: channelName});
			}
		    
		    var Common = {
			    StatusFormatter: function (value, rec, index) {
			        if (value == undefined) {
			            return "";
			        }
					if (value == 1) {
			            return "有效";
			        }else{
			            return "无效";
			        }
			    }
			};
		</script>
		<style type="text/css">  
	        #fm_channel{  
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
