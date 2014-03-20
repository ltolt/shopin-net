<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/header.jsp" %>
<html>
	<head>
	   <meta charset="UTF-8">  
       <title> brand_relation</title>
       

	</head>
	<body>
		<table id="dg" class="easyui-datagrid" style="width:550px;height:300px" toolbar="#tb"
         data-options="sortName:'brandSid',sortOrder:'desc',rownumbers:true,fit:true,singleSelect:true,pagination:true,url:'${ctx}/brandRelation/list.html'">  
         <thead>  
          <tr>  
        	<th data-options="field:'ck',checkbox:true"></th>
            <th data-options="field:'brandName',width:150">原品牌名称</th>
            <!--<th data-options="field:'channelName',width:100">渠道</th>--> 
            <th data-options="field:'brandRootName',width:150">网站品牌名称</th>
            
		   </tr>
		  
          </thead>  
        </table> 
        <div id="tb" align="left">
           	<table cellpadding="0" cellspacing="0" style="width: 100%">
           	   <tr>
           	   	  <td>
		          	原品牌名称:<input name="brandName"  id="brandName" class="easyui-validatebox"/>
		            <!--渠道名称:<input class="easyui-combobox" name="channelSid" id="channelSid"
					data-options="url:'${ctx}/chancombox/list.html',valueField:'sid',textField:'channelName'">-->
				  	<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="find()">查询</a>
				  </td>
				  <td style="text-align: right">
					
				    <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="edit()">修改</a>
				    <a href="#" class="easyui-linkbutton" iconCls="icon-cut" plain="true" onclick="delRel()">删除</a>
				  </td> 
			  </tr>
	      </table> 
	    </div>
	 <div id="editWindow" class="easyui-dialog" style="width:300px;height:220px;" closed="true"  buttons="#dlg-buttons">
	 	    
	 	   <form id="fm_prop" method="post" novalidate>
	 	      <div style="text-align:left;padding-top:4px;">
	 	   	    <span>原品牌名称 :</span>
	 	   	    <input id="ct" name="oldName" class="mini-textbox" plain="true" style="width:120px;"/>
	 	   	  </div> 
	 	     <div class="fitem" style="text-align:left;padding-top:4px;">
	 	   	 	<span>网站品牌名称 :</span>
	 	   	 	 <input id="cc" name="sid" class="easyui-combogrid" style="width:115px"
	 	   	 	 data-options="
	 	   	 		
	 	   	 		idField: 'sid',
	 	   	 		textField: 'brandName',
	 	   	 		singleSelect:true,
	 	   	 		url: '${ctx}/brandRelation/brandRoot.html',
	 	   	 		columns: [[
	 	   	 			{field:'brandName'},
	 	   	 		 ]],
	 	   	 		fitColumns: true">
	 	   	 </div >
	 	   	 <div style="text-align:right;padding-right:4px;padding-top:105px;" >
	 	   	 	<a class="easyui-linkbutton" iconCls="icon-ok"   href="javascript:updateRow()">保存</a>
	 	   	 	<a class="easyui-linkbutton" iconCls="icon-cancel" href="javascript:cancelRow()">取消</a>
	 	   	  </div>
	 	   </form>
	 	   	
	 </div>	   		

	<script type="text/javascript"> 
	var var_url;
		function cancelRow() {
			
          	$('#editWindow').dialog('close');
            <!--$('#dg').datagrid('reload');-->
        }
        
        function edit(){
        	
        	var row = $('#dg').datagrid('getSelected');
        	if(row==null){
					alert("请选择修改项");
					return;
				}
        	
        	$('#editWindow').dialog('open').dialog('setTitle','品牌 维护');
        	$('#fm_prop').form('clear');
        	$('#fm_prop').form('load',{oldName:row.brandName,newName:""});
        	var_url="${ctx}/brandRelation/update.html?sid1="+row.brandSid; 
        	 
        	 
        };
         function delRel(){
         	var row = $('#dg').datagrid('getSelected');
         	
         	if(row==null){
					alert("请选择删除项");
					return;
				}
         	if (row){  
	                $.messager.confirm('Confirm','确定要删除吗?',function(r){  
	                    if (r){  
	                        $.post('${ctx}/brandRelation/delete.html',{sid:row.sid,brandSid:row.brandSid},function(result){  
	                            if (result.success){  
	                                $('#dg').datagrid('reload'); 
	                            } else {  
	                                $.messager.show({ 
	                                    title: '消息警告',  
	                                    msg: result.errorMsg  
	                                });  
	                            }  
	                        },'json');  
	                    }  
	                });  
	            }  
         };
        function find(){
        	var value = $('#brandName').val();
        	<!--var val = $('#channelSid').combobox('getValue');-->
        	$('#dg').datagrid('load',{brandName : value,channelSid:"1"});
        	<!--alert('You input: ' + value);-->
        };
        
        function updateRow(){
        	$('#fm_prop').form('submit',{
        		url:var_url,
        		onSubmit:function(){
        			return $(this).form('validate');
        		},
        		success:function(result){
        			var result = eval('('+result+')');
        			if(result.errorMsg){
        				$.messager.show({
        					title:'Error',
        					msg:result.errorMsg
        				});
        			}else{
        				
          				$('#editWindow').dialog('close');
          				$('#dg').datagrid('reload');
        			}
        		}
        		
        	});
            
        };
        
		function onselection(e){
			var channel = e;
			if(channel){
				$.post('${ctx}/brandRelation/list.html',{channelSid:channel},function(result){
					if(result.success){
					$('#dg').datagrid('reload');
					}else{
						$.messager.show({ 
                                    title: '消息警告',  
                                    msg: result.errorMsg  
                                });  
					}
				},'json');
			}
			
		};
		
	
	</script>
    </body>  
</html>