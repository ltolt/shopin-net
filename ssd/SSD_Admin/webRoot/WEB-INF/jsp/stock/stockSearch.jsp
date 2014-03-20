<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/header.jsp" %>
<html>
	<head>
		<title> stock_list</title>
	</head>
	   
	<body>
		<table id="dg" class="easyui-datagrid" style="width:550px;height:300px" toolbar="#tb"
			data-options="sortName:'sid',sortOrder:'desc',rownumbers:true,fit:true,singleSelect:true,pagination:true,url:'${ctx}/stockSearch/list.html'">
		<thead>
			<tr>
			   <th data-options="field:'ck',checkbox:true"></th>
               <th data-options="field:'productDetailSid',width:150">物料号</th>
               <th data-options="field:'supplySid',width:100">供应商</th>
               <th data-options="field:'shopSid',width:100">门店</th>
               <th data-options="field:'stockTypeSid',width:100">库位</th>
               <th data-options="field:'proSum',width:100">库存数</th>
			</tr>
		</thead>
	</table>
	<div id="tb" style="padding:5px;height:auto">
		<div>
		    物料号:<input name="productDetailSid" id="productDetailSid" class="easyui-validatebox" style="width:80px">
			供应商:<input name="supplySid" id="supplySid" class="easyui-combobox" style="width:80px" 
			      data-options="
	 	   	 		valueField: 'sid',
	 	   	 		textField: 'supplyName',
	 	   	 		singleSelect:true,
	 	   	 		url: '${ctx}/ssd/supplylist.html',
	 	   	 		columns: [[
	 	   	 			{field:'supplyName'},
	 	   	 		 ]],
	 	   	 		fitColumns: true"  >
			门店: <input name="shopSid" id="shopSid" class="easyui-combobox" style="width:80px"
			        data-options="
	 	   	 		valueField:'sid',
	 	   	 		textField:'shopName',
	 	   	 		singleSelect:true,
	 	   	 		url: '${ctx}/ssd/shoplist.html',
	 	   	 		columns: [[
	 	   	 			{field:'shopName'},
	 	   	 		 ]],
	 	   	 		fitColumns: true"  >
			库位: <input name="stockTypeSid" id="stockTypeSid" class="easyui-combobox" style="width:80px"
			        data-options="
	 	   	 		valueField:'sid',
	 	   	 		textField:'stockName',
	 	   	 		singleSelect:true,
	 	   	 		url: '${ctx}/stockSearch/stockType.html',
	 	   	 		columns: [[
	 	   	 			{field:'stockName'},
	 	   	 		 ]],
	 	   	 		fitColumns: true"  >
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="find()">查询</a>
		</div>
	</div>	
	
	<script type="text/javascript">
	var var_url;
	   function find(){
	   	var supply=$('#supplySid').combobox('getValue');
	   	var shop=$('#shopSid').combobox('getValue');
	   	var stockType = $('#stockTypeSid').combobox('getValue');
	   	var productDetail=$('#productDetailSid').val();
	   	$('#dg').datagrid('load',{supplySid : supply,shopSid:shop,stockTypeSid:stockType,productDetailSid:productDetail});
	   } 
	
	</script>
	
	</body>


</html>