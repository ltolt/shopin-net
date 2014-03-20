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
	            data-options="sortName:'sid',sortOrder:'desc',fit:true,rownumbers:true,singleSelect:true,pagination:true,url:'${ctx}/price/list.html',toolbar:'#tb'" >  
	        <thead>  
	            <tr>  
	            	<th data-options="field:'ck',checkbox:true"></th>
	                <th data-options="field:'productDetailSid',width:100">物料号</th>  
	                <th data-options="field:'supplySid',width:100">供应商号</th>
	                <th data-options="field:'shopSid',width:100">门店号</th>
	                <th data-options="field:'currentPrice',width:100">现价</th>  
	                <th data-options="field:'originalPrice',width:100">原价</th>
	                <th data-options="field:'promotionPrice',width:100">促销价</th>
	                <th data-options="field:'promotionBeginTime',width:150">活动开始时间</th>
	                <th data-options="field:'promotionEndTime',width:150">活动结束时间</th>
	            </tr>  
	        </thead>  
	    </table>  
	
	    <div id="tb">
	    	<table cellpadding="0" cellspacing="0" style="width: 100%">
	            <tr>
	                <td>
	                    物料号:<input name="productDetailSid"  id="productDetailSid" class="easyui-validatebox"/>
	      				供应商:<input name="supplySid"  id="supplySid" class="easyui-combobox" data-options="
								url:'${ctx}/ssd/supplylist.html',
								valueField:'sid',
								textField:'supplyName',
								value:'--请选择--'
							"/>
	      				门店:<input name="shopSid" id="shopSid" class="easyui-combobox" data-options="
								url:'${ctx}/ssd/shoplist.html',
								valueField:'sid',
								textField:'shopName',
								value:'--请选择--'
							"/>
	      				<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="query()">查询</a>
	                </td>
	            </tr>
	        </table>
		</div> 
	    
	    
	    <script type="text/javascript"> 
	    
			function query(){  
				var productDetailSid=$('#productDetailSid').val();
				var supplySid=$('#supplySid').combobox('getValue');
				if (supplySid=="--请选择--") {
					supplySid="";
				}
				var shopSid=$('#shopSid').combobox('getValue');
				if (shopSid=="--请选择--") {
					shopSid="";
				}
				$('#dg').datagrid('load',{productDetailSid: productDetailSid,supplySid:supplySid,shopSid:shopSid});
			}
		    
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
