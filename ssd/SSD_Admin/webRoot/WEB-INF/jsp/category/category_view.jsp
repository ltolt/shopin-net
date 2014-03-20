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
			<div data-options="region:'west',title:'品类类目',split:true,border:false" style="width:200px">
				
				<div id="tt" class="easyui-tree" data-options="
		    		url:'${ctx}/category/list.html',
		    		animate:true,
		    		onClick: function(node){
						var qp = {cid:node.id};
						$('#prop').datagrid({
							url:'${ctx}/props/list.html',
							queryParams:qp
						});
					},
		    		onContextMenu: function(e,node){
		    			e.preventDefault();
		    			$(this).tree('select',node.target);
		    			$('#mm').menu('show',{
		    				left: e.pageX,
		    				top: e.pageY
		    			});
		    		}"></div>
			    <div id="mm" class="easyui-menu" style="width:120px;">  
			        <div onclick="append()" data-options="iconCls:'icon-add'">添加品类</div>  
			        <div onclick="edit()" data-options="iconCls:'icon-edit'">修改品类</div>
			        <div onclick="remove()" data-options="iconCls:'icon-remove'">删除品类</div>
			        <div class="menu-sep"></div>  
			        <div onclick="expand()">展开</div>  
			        <div onclick="collapse()">收起</div>  
			    </div>
			    
			    <div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"  
		            closed="true" buttons="#dlg-buttons">  
			        <div class="ftitle">品类信息</div>  
			        <form id="fm" method="post" novalidate>  
			            <div class="fitem">  
			                <label>品类名称:</label>  
			                <input name="name" class="easyui-validatebox" required="true"/>  
			            </div>
			            <div id="radio1" class="fitem">  
			                <label>状态:</label>  
			                <input type="radio" name="status" value="1"/>
			                <span>有效</span>  
		          			<input type="radio" name="status" value="0"/>
		          			<span>无效</span>   
			            </div>
			            <div id="radio2" class="fitem">  
			                <label>显示状态:</label>  
			                <input type="radio" name="isDisplay" value="1"/>
			                <span>显示</span>  
		          			<input type="radio" name="isDisplay" value="0"/>
		          			<span>不显示</span>   
			            </div>
			        </form>  
			    </div>  
			    
			    <div id="dlg-buttons">  
			        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a>  
			        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')">取消</a>  
			    </div>
			    
			</div>  
			
	        <div data-options="region:'center',border:false">
	        	<table id="prop" class="easyui-datagrid" style="width:100%"
			            data-options="sortName:'sid',fit:true,sortOrder:'desc',singleSelect:true,pagination:true,toolbar:'#tb',
			            	view: detailview,  
						    detailFormatter:rowEx,  
						    onExpandRow: function(index,row){  
						        var propindex = index;
						        $('#ddv-'+index).datagrid({  
						            url:'${ctx}/values/list.html?propsSid='+row.propsSid+'&categorySid='+row.categorySid+'&channelSid='+row.channelSid,  
						            fitColumns:true,  
						            singleSelect:true,  
						            rownumbers:true, 
						            height:300,
						            pagination:true,
						            loadMsg:'正在加载中',  
						            columns:[[  
						                {field:'ck',checkbox:true},  
						                {field:'valuesSid',title:'属性值编号',width:100},
						                {field:'valuesName',title:'属性值名称',width:100},
						                {field:'propsName',title:'属性名称',width:100},
						                {field:'categoryName',title:'品类名称',width:100}
						            ]],  
						            onResize:function(){  
						                $('#prop').datagrid('fixDetailRowHeight',index);  
						            },  
						            onLoadSuccess:function(data){  
						                setTimeout(function(){  
						                    $('#prop').datagrid('fixDetailRowHeight',index);  
						                },0);
						            }  
						        });
						        $('#prop').datagrid('fixDetailRowHeight',index);  
						    }
			            " >  
			        <thead>  
			            <tr>  
			            	<th data-options="field:'propsSid',width:180">属性编号</th>  
			                <th data-options="field:'propsName',width:180">属性名称</th>  
			                <th data-options="field:'categorySid',width:180">品类编号</th>  
			                <th data-options="field:'categoryName',width:180">品类名称</th>
			            </tr>  
			        </thead>
			    </table> 
			    <div id="tb">  
				    <table cellpadding="0" cellspacing="0" style="width: 100%">
			            <tr>
			                <td>
			                    属性名称:<input name="propsName"  id="propsName" class="easyui-validatebox"/>
			      				<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="find()">查询</a>
			                </td>
			                <td style="text-align: right">
				    			<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editProp()">编辑</a>
			                </td>
			            </tr>
			        </table>  
				</div> 
				
				<div id="dlg_prop" class="easyui-dialog" style="width:600px;height:400px;padding:10px 20px"  
		            closed="true" buttons="#dlgp-buttons">  
			        <div class="ftitle">属性信息</div>  
			        <form id="fm_prop" method="post" novalidate>  
			            <div class="fitem">  
			                <label>品类名称:</label>  
			                <input type="text" readonly="readonly" style="width:400px" name="name" class="easyui-validatebox" required="true"/>  
			            </div>
			            <div class="fitem">  
			                <label>属性名称:</label>
			                <input id="pdict" class="easyui-combogrid" style="width:400px" name="propsid"
							data-options="
								multiple: true,
								idField:'sid',
								textField:'propsName',
								columns: [[
									{field:'ck',checkbox:true},
									{field:'propsName',title:'属性',width:80},
									{field:'propsDesc',title:'属性描述',width:160}
								]],
								fitColumns: true
								">
			            </div>
			        </form>  
			    </div>
			    
			    <div id="dlgp-buttons">  
			        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="saveProp()">保存</a>  
			        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg_prop').dialog('close')">取消</a>  
			    </div>
	        </div>
	    </div>
	    
	    <script type="text/javascript">  
        	var url;
        	function append(){  
	            var node = $('#tt').tree('getSelected');
	            $('#dlg').dialog('open').dialog('setTitle','添加品类');  
	            $('#fm').form('clear');
	            $('#fm').form('load',{name:"",status:1,isDisplay:1});
            	url = '${ctx}/category/add.html?id='+node.id;  
	        }
	        function edit(){  
	            var row = $('#tt').tree('getSelected');
	            if (row){  
	                $('#dlg').dialog('open').dialog('setTitle','修改品类');
	                $.ajaxSetup ({ 
						cache: false 
					});
	                $('#fm').form('load','${ctx}/category/edit.html?id='+row.id);
	                url = '${ctx}/category/add.html?sid='+row.id;
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
	                	var flag = result.status;
	                    if (flag=='true'){  
	                        $.messager.show({  
	                            title: '提示消息',  
	                            msg: result.message  
	                        });  
	                        $('#dlg').dialog('close');      // close the dialog  
	                        $('#tt').tree('reload');    // reload the user data  
	                    } else { 
	                    	$.messager.show({  
	                            title: '提示消息',  
	                            msg: result.message  
	                        });
	                        $('#dlg').dialog('close');      // close the dialog  
	                        $('#tt').tree('reload');    // reload the user data  
	                    }  
	                }  
	            });  
	        }
	        function remove(){  
	            var row = $('#tt').tree('getSelected');   
	            if (row){  
	                $.messager.confirm('Confirm','确定要删除吗?',function(r){  
	                    if (r){  
	                        $.post('${ctx}/category/del.html',{id:row.id},function(result){  
	                            if (result.success){  
	                                $('#tt').tree('reload'); 
	                            } else {  
	                                $.messager.show({ 
	                                    title: '消息警告',  
	                                    msg: result.message  
	                                });  
	                            }  
	                        },'json');  
	                    }  
	                });  
	            }  
	        }  
	        function collapse(){  
	            var node = $('#tt').tree('getSelected');  
	            $('#tt').tree('collapse',node.target);  
	        }  
	        function expand(){  
	            var node = $('#tt').tree('getSelected');  
	            $('#tt').tree('expand',node.target);  
	        }  
	        
	        function rowEx(index,row){  
		        return '<div style="padding:2px"><table id="ddv-' + index + '"></table></div>';  
		    }
            
            var prop_url;
            function editProp(){  
	            var node = $('#tt').tree('getSelected');
	            if(node){
		            $('#pdict').combogrid({
		            	url:'${ctx}/propscombox/list.html?id='+node.id
		            });
		            $('#dlg_prop').dialog('open').dialog('setTitle','添加属性');  
		            $('#fm_prop').form('clear');
		            $.ajaxSetup ({ 
						cache: false 
					});
		            $('#fm_prop').form('load','${ctx}/propvals/edit.html?id='+node.id);
		            prop_url = '${ctx}/provalues/add.html?cid='+node.id;
            	} else {
	            	$.messager.show({ 
                        title: '消息警告',  
                        msg: '选择一个品类'  
                    });
            	}
	        }
	        function saveProp(){  
	            $('#fm_prop').form('submit',{  
	                url: prop_url,  
	                onSubmit: function(){  
	                    return $(this).form('validate');
	                },  
	                success: function(result){ 
	                	var result = eval('('+result+')');  
                        $.messager.show({  
                            title: '消息提示',  
                            msg: result.message  
                        });  
                        $('#dlg_prop').dialog('close');      // close the dialog  
                        $('#prop').datagrid('reload');    // reload the user data  
                      
	                }  
	            });  
	        }
	        function find(){ 
	        	var node = $('#tt').tree('getSelected');
				if (node) {
					var value=$('#propsName').val();
					$('#prop').datagrid('load',{propsName: value,cid:node.id});
				} else {
					$.messager.show({  
                        title: '消息提示',  
                        msg: '需选择品类！！'  
                    });
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
