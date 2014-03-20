<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/header.jsp" %>
<html>
	<head>
		<meta charset="UTF-8">  
       <title> brand_category</title> 
	</head>
	<body>
		<table id="dg" class="easyui-datagrid" 
	            data-options="sortName:'sid',sortOrder:'desc',rownumbers:true,singleSelect:true,pagination:true,fit:true,fitColumn:true,url:'${ctx}/brandCategory/brandList.html',toolbar:'#tb',
	            	onLoadSuccess:function(data){ 
	            		$('.prod1').linkbutton({ text:'品牌品类关系维护', plain:true, iconCls:'icon-edit' });
	            		
	            	}
	            " >  
	        <thead>  
	            <tr>  
	            	<th data-options="field:'ck',checkbox:true"></th>
	            	<th data-options="field:'brandName',width:100">网站品牌名称</th>
	            	<!--<th data-options="field:'channelName',width:100">渠道</th>-->
	            	<!--<th data-options="field:'action',align:'center',formatter:operate">操作</th>--> 
	            </tr>  
	       </thead>  
	    </table>
	    <table id="dgd" hidden="true" class="easyui-datagrid" data-options="rownumbers:true,fit:true" >
	         <thead>  
	            <tr>  
	            	<th data-options="field:'cid'">cid</th>
	            </tr>  
	        </thead>   
	    </table>
	    <div id="form" class="easyui-dialog" closed="true" style="width:400px;height:280px;padding:10px 20px"  
             buttons="#dlg-buttons">  
	        <div class="ftitle">品类信息</div>  
	        <form id="fm" method="post" novalidate>  
	            <div id="tt" class="easyui-tree" checkbox="true"  multiple="true" data-options="
		    		animate:true
					"></div>
	        </form>  
	    </div>
	    
		<div id="dlg-buttons">  
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a>  
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#form').dialog('close')">取消</a>  
	    </div>
	    
	    <div id="tb" align="left">
	      	品牌名称:<input name="brandName"  id="brandName" class="easyui-validatebox"/>
	      	<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="find()">查询</a>
	      	<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editRel()">修改</a>
	    </div>
	
	<script type="text/javascript">
		function operate(value,row,index){
	        	var s = '<a href="javascript:void(0)" class="prod" onclick="editRel()">添加品类对应关系</a> ';  
	            
	            return s;
	        };
	        
	       function save(){
	       	var row =$('#dg').datagrid('getSelected');
	       	var nodes = $('#tt').tree('getChecked');
	       	var nodeIds =Array();
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
				
				var url = '${ctx}/brandCategory/save.html?channelSid=1'+'&brandSid='+row.sid+'&nodeIds='+nodeIds;
				$('#fm').form('submit',{  
	                url: url,  
	                onSubmit: function(){  
	                    return $(this).form('validate');
	                },  
	                success: function(result){ 
	                	var result = eval('('+result+')');  
	                    if (result.errorMsg){  
	                        $.messager.show({  
	                            title: '消息警告',  
	                            msg:result.errorMsg    
	                        });  
	                    } else {
	                    	 
	                        $('#form').dialog('close');// close the dialog 
	                   		$('#dg').datagrid('reload');
	                   		
	                    }  
	                }
	            });
				
	       }; 
		function find(){
        	var value = $('#brandName').val();
        	$('#dg').datagrid('load',{brandName : value});
        	
        };
        function editRel(){
           var row = $('#dg').datagrid('getSelected');
           alert(row.channelSid);
           if(row==null){
					alert("请选择修改项");
					return;
				}
           var qp = {brandSid:row.sid,channelSid:1};
              $('#tt').tree({
	        		url:'${ctx}/brandCategory/liste.html?brandSid='+row.sid+'&channelSid=1'
	        	});
	       
	         
	         $('#dgd').datagrid({
					url:'${ctx}/brandCategory/edit.html',
					queryParams:qp,
					onLoadSuccess:function(data){ 
	            		$(this).datagrid('selectRow',0);
			        	var roww = $(this).datagrid('getSelected');
			        	var no = roww.cid;
			        	if (no != null) {
			        		var nodeIds = Array();
				        	var tmp = "";
				        	for (var index = 0; index < no.length; index++) {
				        		if (","!=no[index]) {
				        			tmp = tmp+no[index];
				        		} else {
				        			nodeIds.push(tmp);
				        			tmp = "";
				        		}
				        	}
				        	var node = $('#tt').tree('find',1);
				        	//$('#tt').tree('expand',node.target);
				        	//$('#tt').tree('check',node.target);
				        	//getChild(nodeIds,node);
			        	}
			        	
	            	}
				});
				$('#form').dialog('open').dialog('setTitle','维护品类对应关系');
        };
        
        function getChild(nodeIds){
	        	if (nodeIds.length == 0) {
        			return;
        		} else {
        			var arr = Array();
		    		for (var index = 0; index < nodeIds.length; index++) {
		    			var tmp = $('#tt').tree('find',nodeIds[index]);
		    			if (tmp != null) {
		    				$('#tt').tree('expandAll',tmp.target);
		    				$('#tt').tree('check',tmp.target);
		    			} else {
		    				arr.push(nodeIds[index]);
		    			}
		    		}
		    		nodeIds = arr;
		    		alert(nodeIds);
		    		getChild(nodeIds);
        		}
	        	
	        }
	        
        
	</script>

</html>