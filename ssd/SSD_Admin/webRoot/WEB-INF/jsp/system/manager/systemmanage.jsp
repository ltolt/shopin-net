<%request.setAttribute("ctx", request.getContextPath());%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
	    <title></title>
		<meta charset="UTF-8">
	    <link href="${ctx}/js/sys/css/default.css" rel="stylesheet" type="text/css" />
	    <link rel="stylesheet" type="text/css" href="${ctx}/js/sys/js/themes/default/easyui.css" />
	    <link rel="stylesheet" type="text/css" href="${ctx}/js/sys/js/themes/icon.css" />
	    <script type="text/javascript" src="${ctx}/js/sys/js/jquery-1.4.2.min.js"></script>
	    <script type="text/javascript" src="${ctx}/js/sys/js/jquery.easyui.pack.js"></script>
		<script type="text/javascript" src="${ctx}/js/sys/js/loadData.js"> </script>
		<script type="text/javascript" src="${ctx}/js/sys/js/sysdate.js"> </script>
		<script type="text/javascript">
			var _menus = {"menus":[
				{"menuid":"1","icon":"icon-sys","menuname":"类目管理",
					"menus":[{"menuid":"11","menuname":"销售渠道管理","icon":"icon-nav","url":"${ctx}/channel/init.html"},
						{"menuid":"12","menuname":"类目属性管理","icon":"icon-nav","url":"${ctx}/category/init.html"},
						{"menuid":"13","menuname":"属性字典管理","icon":"icon-nav","url":"${ctx}/propsdict/init.html"},
						{"menuid":"14","menuname":"库类型字典管理","icon":"icon-nav","url":"${ctx}/stockType/init.html"}
						
					]
				},{"menuid":"2","icon":"icon-sys","menuname":"商品管理",
					"menus":[{"menuid":"21","menuname":"商品品类管理","icon":"icon-nav","url":"${ctx}/ssdAdmin/init.html"},
						{"menuid":"22","menuname":"网站品牌管理","icon":"icon-nav","url":"${ctx}/brandDisplay/init.html"},
						<!--{"menuid":"23","menuname":"品牌品类管理","icon":"icon-nav","url":"${ctx}/brandCategory/init.html"},-->
						{"menuid":"24","menuname":"品牌关联管理","icon":"icon-nav","url":"${ctx}/brandRelation/init.html"},
						<!--{"menuid":"24","menuname":"商品价格信息","icon":"icon-nav","url":"${ctx}/price/init.html"},-->
						<!--{"menuid":"14","menuname":"库存管理","icon":"icon-nav","url":"${ctx}/stockSearch/init.html"}-->
						{"menuid":"25","menuname":"商品未上架管理","icon":"icon-nav","url":"${ctx}/proselling/init.html"}
					]
				}
			]};
	
	    </script>
	
	</head>
	<body class="easyui-layout" style="overflow-y: hidden"  scroll="no">
		<div region="north" split="true" border="false" style="overflow: hidden; height: 30px;background: #D2E0F2;">
	        <nobr style="float:right; valign:center; padding-right:20px;" class="head"><span id="date1"></span> <span id="time1"></span></nobr>
	        <span style="padding-left:10px;valign:center;font-size: 16px; ">后台库存管理系统</span>
	    </div>
	    <div region="west" split="true" title="导航菜单" style="width:220px;" id="west">
			<div class="easyui-accordion" fit="true" border="false">
				
			</div>
	    </div>
	    <div id="mainPanle" region="center" style="background: #eee; overflow-y:hidden">
	        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
				<div title="欢迎使用" style="padding:20px;overflow:hidden;" id="home">
					
					<h1>你好，欢迎来到库存管理系统</h1>
	
				</div>
			</div>
	    </div>
		<div region="south" split="true" style="height: 30px; background: #D2E0F2; ">
	        <div class="footer">Copyright (C) 2013 shopin All rights reserved; 本系统由上品折扣信息系统部提供技术支持</div>
	    </div>
	    
		<div id="mm" class="easyui-menu" style="width:150px;">
			<div id="mm-tabclose">关闭</div>
			<div id="mm-tabcloseall">全部关闭</div>
			<div id="mm-tabcloseother">除此之外全部关闭</div>
			<div class="menu-sep"></div>
			<div id="mm-tabcloseright">当前页右侧全部关闭</div>
			<div id="mm-tabcloseleft">当前页左侧全部关闭</div>
			<div class="menu-sep"></div>
			<div id="mm-exit">退出</div>
		</div>
	
	</body>
</html>