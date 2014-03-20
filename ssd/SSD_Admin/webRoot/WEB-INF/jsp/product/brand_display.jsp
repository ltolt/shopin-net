<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/header.jsp" %>
<html>
	<head>
		<meta charset="UTF-8">
		<!--<link href="${ctx}/js/uploadify/example/css/default.css" rel="stylesheet" type="text/css" />  
		<link href="${ctx}/js/uploadify/example/css/uploadify.css" rel="stylesheet" type="text/css" />  
		  
		<script type="text/javascript" src="${ctx}/js/uploadify/swfobject.js"></script>  
		<script type="text/javascript" src="${ctx}/js/uploadify/jquery.uploadify.v2.1.0.min.js"></script>-->   
       <title> brand_display</title> 
	</head>
	<body>
		<table id="dg" class="easyui-datagrid"
			data-options="sortName:'sid',sortOrder:'desc', rownumbers:true,singleSelect:true,
			pagination:true,fit:true,fitColumn:true,url:'${ctx}/brandDisplay/list.html',toolbar:'#tb'">
			<thead>
				<tr>
					<th data-options="field:'ck',checkbox:true"></th>
					<th data-options="field:'brandName',width:100">网站品牌</th>
					<th data-options="field:'brandNameSpell',width:100">中文拼音</th>
					<!--<th data-options="field:'brandNameAlias', width:50">别名</th>-->
					<th data-options="field:'brandNameEn', width:100">英文名称</th>
					<th data-options="field:'brandDesc', width:100" >品牌描述</th>
					<th data-options="field:'brandPict', width:200">品牌大图</th>
					<th data-options="field:'logoPic', width:200">品牌小图</th>
					<th data-options="field:'brandCreateTime', width:200">创建时间</th>
					<th data-options="field:'aweSome', width:200">查询次数</th>
					<!--<th data-options="field:'brandCreateCountry', width:50">创建国家</th>
					<th data-options="field:'brandSpecialty', width:50">品牌特点</th>
					<th data-options="field:'brandSuitability', width:50">适合人群</th>
					<th data-options="field:'isFactoryStore', width:100 ,formatter:action">是否是工厂店</th>
					<th data-options="field:'factoryStoreOrder', width:80">工厂店Order</th>
					<th data-options="field:'parentFactoryStoreId',width:50">主工厂店Id</th>-->
				</tr>
			</thead>
		</table>
		<!-- 增删改查按钮 -->
		<div id="tb" align="left">
			<table cellpadding="0" cellspacing="0" style="width: 100%">
				<tr>
					<td>
						网站品牌名称:<input name="brandName"  id="brandName" class="easyui-validatebox"/>
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
	    <div id="dlg_add" class="easyui-dialog" style="width:550px;height:300px;padding:5px 5px"  closed="true" buttons="#dlg-buttons">
	      	 <form id="fm_add" method="post" novalidate>
	      	 	<input name="sid" class="easyui-validatebox" type="hidden"/>
	      	 	<table style="width:100%;padding:8px">
	      	 		<tr>
	      	 			<td >品牌名称:</td>
	      	 			<td style="width:80px;"><input name="brandName" class="easyui-validatebox"/></td>
	      	 			<td >中文拼音:</td>
	      	 			<td style="width:80px;"><input  name="brandNameSpell" class="easyui-validatebox"/></td>
	      	 		</tr>
	      	 		<tr>
	      	 			<td >别名:</td>
	      	 			<td style="width:80px;"><input   name="brandNameAlias" class="easyui-validatebox"/></td>
	      	 			<td >英文名称:</td>
	      	 			<td style="width:80px;"><input  name="brandNameEn" class="easyui-validatebox"/></td>
	      	 		</tr>
	      	 		<tr>
	      	 			<td >品牌描述:</td>
	      	 			<td style="width:80px;"><textarea clos="20"name="brandDesc"></textarea></td>
	      	 			<!--<td >品牌图片:</td>
	      	 			<td style="width:80px;"><input  name="brandPict" class="easyui-validatebox"/></td>
	      	 			<td><a href="#" class="easyui-linkbutton" iconCls="icon-add"  onclick="addPic()">上传</a></td>
	      	 			 <td >工厂店logo图片:</td>
	      	 			<td style="width:80px;"><input  name="logoPic" class="easyui-validatebox" /></td>
	      	 			-->
	      	 		</tr>
	      	 		  <!--<tr>
	      	 			<td >创建国家:</td>
	      	 			<td style="width:80px;"><input  name="brandCreateCountry" class="easyui-validatebox"/></td>
	      	 			<td >品牌特点:</td>
	      	 			<td style="width:80px;"><input  name="brandSpecialty" class="easyui-validatebox"/></td>
	      	 		</tr>
	      	 		<tr>
	      	 			<td >适合人群:</td>
	      	 			<td style="width:80px;"><input  name="brandSuitability" class="easyui-validatebox"/></td>
	      	 			<td >是否是工厂店:</td>
			            <td style="width:80px;">
			            	 <input type="radio" name="isFactoryStore" value="1" checked="true"/>是
			                 <input type="radio" name="isFactoryStore" value="0" checked="false"/>否
			            </td>
	      	 		</tr>
	      	 		<tr>
	      	 			<td >工厂店大图:</td>
	      	 			<td style="width:80px;"><input name="factoryBigPic" class="easyui-validatebox"/></td>
	      	 			<td >工厂店缩略图:</td>
	      	 			<td style="width:80px;"><input  name="factorySmallPic" class="easyui-validatebox"/></td>
	      	 		</tr>
	      	 		<tr>
	      	 			<td >活动大图片:</td>
	      	 			<td style="width:80px;"><input name="activityBigPic" class="easyui-validatebox"/></td>
	      	 			<td >活动缩略图:</td>
	      	 			<td style="width:80px;"><input  name="activitySmallPic" class="easyui-validatebox"/></td>
	      	 		</tr>
	      	 		<tr>
	      	 			<td >工厂店Order:</td>
	      	 			<td style="width:80px;"><input  name="factoryStoreOrder" class="easyui-validatebox"/></td>
	      	 			<td >主工厂店id:</td>
	      	 			<td style="width:80px;"><input  name="parentFactoryStoreId" class="easyui-validatebox"/></td>
	      	 		</tr>
	      	 		<tr>
	      	 			<td >品牌图片:</td>
	      	 			<td style="width:80px;"><input  name="brandPict" class="easyui-validatebox"/></td>
	      	 			<td><a href="#" class="easyui-linkbutton" iconCls="icon-add"  onclick="addPic()">上传图片</a></td>
	      	 		</tr>-->
	      	 	</table>
	      	 </form>
	   </div>
	   <div id="pict_add" class="easyui-dialog" style="width:320px;height:200px;padding:5px 5px"  closed="true" buttons="#pict-buttons">
	   		<form id="fm_addPict" method="post" enctype="multipart/form-data" novalidate >
	   			<input name="sid" class="easyui-validatebox" type="hidden"/>
	   			图片:<input name="pictPath" type="file" id="uploadify"/>
	   		</form>
	   </div>   
	      <!-- 添加修改页按钮 -->
	      <div id="dlg-buttons">  
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="save()">保存</a>  
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg_add').dialog('close')">取消</a>  
	      </div>
	      <div id="pict-buttons">  
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-ok" onclick="savePict()">上传</a>  
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#pict_add').dialog('close')">取消</a>  
	      </div>
	    
	<script type="text/javascript">
		var column;
		function find(){
        	var value = $('#brandName').val();
        	$('#dg').datagrid('load',{brandName : value});
        	
        };
        function addRel(){
        	$('#dlg_add').dialog('open').dialog('setTitle','添加品牌');
        	$('#fm_add').form('clear');
        };
        function addPic(){
        	
			$('#pict_add').dialog('open').dialog('setTitle','上传图片');
			$('#fm_addPict').form('clear');
			$('#fm_addPict').form('load');
			<!--alert("aa")-->
        }
        function savePict(){
        	$('#fm_addPict').form('submit',{
        		url:'${ctx}/brandDisplay/savePict.html?sid='+column.sid,
        		onSubmit:function(){
        			return $(this).form('validate');
        		},
        		success:function(result){
        			var result=eval('('+result+')');
        			if(result.errorMsg){
        				$.messager.show({  
	                            title: 'Error',  
	                            msg: result.errorMsg});	
        			}else{
        				$('#pict_add').dialog('close'); 
        				$('#fm_add').form('load',{brandPict:result.brandPict});
        			}
        		}
        	});
        }
        function save(){
           var ul;
            if(column==undefined){
            	 ul='${ctx}/brandDisplay/save.html';
            }else{
	            if(column.brandCreateTime==null&column.aweSome==null){
	            	 ul='${ctx}/brandDisplay/save.html';
	            }else if(column.brandCreateTime!=null&column.aweSome==null){
	                ul='${ctx}/brandDisplay/save.html?brandCreateTime='+column.brandCreateTime;
	            }else{
	            	ul='${ctx}/brandDisplay/save.html?brandCreateTime='+column.brandCreateTime+'&aweSome='+column.aweSome;
	            }
            }
        	$('#fm_add').form('submit',{
        		url:ul,
        		onSubmit:function(){
        			return $(this).form('validate');
        		},
        		success:function(result){
        			var result= eval('('+result+')');
        			if(result.errorMsg){
        				$.messager.show({  
	                            title: 'Error',  
	                            msg: result.errorMsg}); 
        			}else{
        				$('#dlg_add').dialog('close'); 
        				$('#dg').datagrid('reload');
        			}
        		}
        	});
        };
        function editRel(){
        	var row = $('#dg').datagrid('getSelected');
        	if(row==null){
				alert("请选择修改项");
				return;
			}
			column=row;
        	$('#dlg_add').dialog('open').dialog('setTitle','添加品牌');
        	$.ajaxSetup ({ 
				cache: false 
			});
        	$('#fm_add').form('load','${ctx}/brandDisplay/initupdate.html?sid='+row.sid)
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
        				$.post('${ctx}/brandDisplay/delete.html',{sid:row.sid},function(result){
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