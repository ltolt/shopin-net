<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../inc/head.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>自定义单元格的显示格式</title>
</head>
<body>
    <h1 style="margin:20px 0px 0px 20px;">自定义单元格</h1>
    <br/>
    <p>
    <div id="panel1"></div><br>
    <div>事件</div>
    <textarea id="op" rows="10" style="width:800px;"></textarea>
    
    <script type="text/javascript">
       var app = {};
       
       Ext.onReady(function(){
    	   Ext.state.Manager.setProvider(new Ext.state.CookieProvider());
    	   Ext.QuickTips.init();
    	   Ext.Msg.minWidth = 300;
    	   
    	   var mydata = [
    	                 [1,{text:'Ext',url:'http://extjs.com'},-10.00,'2008-01-01 12:01:01','br.gif','Altantic',{text:'一',tips:'提示1'}]
    	                 ];
    	   
    	   var store = new Ext.data.SimpleStore({
    		   fields:[{
    			 name:'id',type:'int'  
    		   },
    		   {name:'linker'},
    		   {name:'number',type:'float'},
    		   {name:'datetime',type:'date',dateFormat:'Y-m-d H:i:s'},
    		   {name:'icon'},
    		   {name:'qtips'},
    		   {name:'tips'}
    		   ]
    	   });
    	   store.loadData(mydata);
    	   
    	   function leftpad(val){
    		   return String.leftPad(val,5,"0");
    	   }
    	   
    	   function linker(val){
    		   if(typeof val == "object"){
    			   return '<a style="display:table;width:100%" title="'+ val.url + '" target="_blank" href="'+ val.url + '">' + val.text + '</a>'
    		   }
    		   return val;
    	   }
    	   
    	   function num(val){
    		   if(val > 0 ){
    			   return '<span style="color:green;">'+val + '</span>';
    		   }else if(val<0){
    			   return '<span style="color:red;">'+ val+'</span>'; 
    		   }
    		   return val;
    	   }
    	   function icon(val){
    		   return '<img src="./images/gif ' + val + '">'
    	   }
    	   
    	   function qtips(val){
    		   return val;
    	   }
    	   function tips(val){
    		   if(typeof val == 'object'){
    			   return '<span style="display:table;width:100%;" title=">' + val.tips + '">' + val.text + '</span>'
    		   }
    		   return val;
    	   }
    	   
    	   
    	   
    	   var grid = new Ext.grid.GridPanel({
    		   height:350,
    		   width:800,
    		   store:store,
    		   title:'自定义单元格的显示格式',
    		   frame:true,
    		   columns:[
    		            {header:'编号',width:80,sortable:true,renderer:leftpad,dataIndex:'id'},
    		            {header:'链接',width:75,sortable:true,renderer:linker,dataIndex:'linker'},
    		            {header:'数值',width:75,sortable:true,renderer:num,dataIndex:'number'},
    		            {header:'时间',width:85,sortable:true,renderer:Ext.util.Format.dateRenderer('Y-m-d'),dataIndex:'datetime'},
    		            {header:'图标',width:75,sortable:true,renderer:icon,dataIndex:'icon'},
    		            {header:'图片提示',width:75,sortable:true,renderer:qtips,dataIndex:'qtips'},
    		            {header:'文字提示',width:75,sortable:true,renderer:tips,dataIndex:'tips'},
    		            {xtype:'actioncolumn',width:50,items:
    		            [{
    		            	icon:'${ctx}/images/application_go.png',
    		            	tooltip:'查看',
    		            	handler:function(grid,rowIndex,colIndex){
    		            		var rec = store.getAt(rowIndex);
    		            		alert(rec);
    		            	}
    		            }]	
    		            }
    		            ],
    		            stripeRows:true,
    		            autoExpandColumn:5,
    	   				listeners:{
    	   					rowclick:function(trid,rowIndex,e){
    	   						Ext.get('op').dom.value="------------\n" + Ext.encode(store.getAt(rowIndex).data) + "\n";
    	   					}
    	   				}
    	   });
			 grid.render('panel1');    	   
    	     Ext.get('op').dom.value = "";
    	     var a = "${resources}";
    	     var arr = a.split(',');
    	     for(var i =0;i<arr.length;i++){
    	    	 alert(arr[i]);
    	     }
    	     
       });
    
    
    
    </script>
   
    
</body>
</html>