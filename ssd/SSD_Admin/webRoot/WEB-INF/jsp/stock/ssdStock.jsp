<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../inc/header.jsp" %>
<html>  
<head>  
    <meta charset="UTF-8">  
    <title> jQuery EasyUI Product</title>  
</head>  
<body>  
    <table id="dg" class="easyui-datagrid" title="DataGrid" style="width:1200px;height:800px"  
            data-options="sortName:'sid',sortOrder:'desc',rownumbers:true,singleSelect:true,pagination:true,url:'${ctx}/ssdStock/list.html',toolbar:toolbar" >  
        <thead>  
            <tr>  
                <th data-options="field:'sid',width:80">sid</th>  
                <th data-options="field:'productSid',width:80">productSid</th>  
                <th data-options="field:'proSku',width:80">proSku</th>  
                <th data-options="field:'productDetailSid',width:80">detailSid</th>  
                <th data-options="field:'proStanSid',width:80">stanSid</th>  
                <th data-options="field:'proStanName',width:80">stanName</th> 
                <th data-options="field:'proColorSid',width:80"> colorSid</th> 
                <th data-options="field:'proColorName',width:80"> colorName</th> 
                <th data-options="field:'brandSid',width:80">brandSid </th> 
                <th data-options="field:'stockTypeSid',width:80">stockTypeSid</th> 
                <th data-options="field:'proSum',width:80">proSum</th>
                <th data-options="field:'originalPrice',width:80,align:'center'">originalPrice</th>
                <th data-options="field:'currentPrice',width:80,align:'center'">currentPrice</th>
                <th data-options="field:'promotionPrice',width:80,align:'center'">promotionPrice</th>
                <th data-options="field:'offValue',width:80,align:'center'">offValue</th>
                <th data-options="field:'saleCodeSid',width:80">saleCodeSid</th> 
                <th data-options="field:'netBit',width:80,align:'center'">netBit</th>
                <th data-options="field:'supplySalingBit',width:60">supplySalingBit</th>
                <th data-options="field:'netSaleBit',width:80">netSaleBit</th>
                <th data-options="field:'shopSid',width:80">shopSid</th>
                <th data-options="field:'shopName',width:80">shopName</th>
                <th data-options="field:'promotionBeginTime',width:80,align:'center'">promotionBeginTime</th>
                <th data-options="field:'promotionEndTime',width:80,align:'center'">promotionEndTime</th>
            </tr>  
        </thead>  
    </table>  
    <script type="text/javascript"> 
    	$(function(){  
    	 	var pager = $('#dg').datagrid('getPager');  // get the pager of datagrid  
        });
        //
        var toolbar = [{  
	            text:'Add',  
	            iconCls:'icon-add',  
	            handler:function(){
	            addRows();
            }  
       },{  
             text:'Delete',  
             iconCls:'icon-cut',  
             handler:function(){
            	deleterow();
				}  
        },'-',{  
            text:'Save',  
            iconCls:'icon-save',  
            handler:function(){alert('add') }  
        },{
        	text:'search',  
            iconCls:'icon-search',  
            handler:function(){alert('serch') }  
        },{
        	text:'edit',  
            iconCls:'icon-edit',  
            handler:function(){editrow(); }  
        }];  
       //
       function getRowIndex(target){   
   			 var tr = $(target).closest('tr.datagrid-row');   
    		return parseInt(tr.attr('datagrid-row-index'));   
        };   
       function editrow(target){
       alert('aa');   
             var row = $('#dg').datagrid('getSelected'); 
             if(row){
             	
             } 
       };
       function deleterow(){   
             var row = $('#dg').datagrid('getSelected');
             if(row){
	             $.messager.confirm('Confirm','Are you sure?',function(r){   
		             if (r){   
		             	//$('#dg').datagrid('deleteRow', getRowIndex(target)); 
		             	$.post('${ctx}/ssdProduct/delete.html',{id:row.sid},function(result){  
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
        } ;  
       function saverow(target){   
            $('#dg').datagrid('endEdit', getRowIndex(target));   
        } ;   
       function cancelrow(target){   
           $('#dg').datagrid('cancelEdit', getRowIndex(target));   
       } ;
       function addRows(){
       		alert('save');
       };
       
   </script>  
</body>  
</html>  
