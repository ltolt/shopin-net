<%--
  Description:退货申请表单
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>申请退货</title>
<script type="text/javascript" src="${js}/input.js"></script>
<link href="${css}/myshopin-character.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%--面包屑内容开始--%>
    <div id="breadcrumb">
	    <a href="${ctx}">首页</a><span>></span>我的上品<span>></span>申请退货</div>
<%--面包屑内容结束--%>
<div style="width:950px;float:left">
    <%--左侧分类开始--%>
    <jsp:include page="myshopin_left.jsp"/>
    <%--左侧分类结束--%>
    <%--右侧分类开始--%>
	<div id="content-rightweihzi">
		<div id="content-right">
			<div class="ykong"></div>
			<div class="biaoge11">
				<table width="640" border="0" cellspacing="2" cellpadding="0">
					<tr>
						<td width="20%" height="24" align="right">昵称：</td>
						<td width="80%"><input name="textfield" type="text" class="yinput" id="textfield" /></td>
					</tr>
					<tr>
						<td height="24" align="right" valign="top">上传头像：</td>
						<td><table width="50%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="36%" class="imgbk"><img src="${images}/del/y_4.jpg" width="90" height="90" /></td>
								<td width="64%" valign="bottom"><a href="#">更新</a></td>
							</tr>
						</table></td>
					</tr>
					<tr>
						<td height="24" align="right">性别：</td>
						<td>&nbsp;&nbsp;<input type="radio" name="radio" id="radio" value="radio" />
							女&nbsp;&nbsp;
							<input type="radio" name="radio" id="radio2" value="radio" />
							男</td>
					</tr>
					<tr>
						<td height="24" align="right">生日：</td>
						<td><input name="textfield2" type="text" class="yinput" id="textfield2" /></td>
					</tr>
					<tr>
						<td height="24" align="right">男友/女友生日：</td>
						<td><input name="textfield3" type="text" class="yinput" id="textfield3" /></td>
					</tr>
					<tr>
						<td height="24" align="right">喜欢的颜色</td>
						<td>
						&nbsp;&nbsp;<input type="radio" name="radio" id="radio" value="radio" />
						红&nbsp;&nbsp;
						&nbsp;&nbsp;<input type="radio" name="radio" id="radio" value="radio" />
						橙&nbsp;&nbsp;
						&nbsp;&nbsp;<input type="radio" name="radio" id="radio" value="radio" />
						黄&nbsp;&nbsp;
						&nbsp;&nbsp;<input type="radio" name="radio" id="radio" value="radio" />
						绿&nbsp;&nbsp;
						&nbsp;&nbsp;<input type="radio" name="radio" id="radio" value="radio" />
						蓝&nbsp;&nbsp;
						&nbsp;&nbsp;<input type="radio" name="radio" id="radio" value="radio" />
						靛&nbsp;&nbsp;
						&nbsp;&nbsp;<input type="radio" name="radio" id="radio" value="radio" />
						紫&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td height="24" align="right">喜欢的风格：</td>
						<td><select name="select" id="select" class="">
							<option>波西米亚风格</option>
						</select>
						</td>
					</tr>
					<tr>
						<td height="24" align="right">喜欢的品牌：</td>
						<td><select name="select2" id="select2" class="">
							<option selected="selected">米尚</option>
																		</select></td>
					</tr>
				</table>
				<table width="640" border="0" cellspacing="2" cellpadding="0">
					<tr>
						<td width="20%" height="24" align="right">教育程度：</td>
						<td width="30%"><select name="select3" id="select3" class="">
							<option selected="selected">请选择</option>
						</select></td>
						<td width="12%" align="right">身高：</td>
						<td width="38%"><input name="textfield4" type="text" class="yinput" id="textfield4" /></td>
					</tr>
					<tr>
						<td height="24" align="right">职业：</td>
						<td><select name="select7" id="select7" class="">
							<option selected="selected">请选择</option>
						</select></td>
						<td align="right">体重：</td>
						<td><input name="textfield5" type="text" class="yinput" id="textfield5" /></td>
					</tr>
					<tr>
						<td height="24" align="right">月收入：</td>
						<td><select name="select4" id="select4" class="">
							<option selected="selected">请选择</option>
						</select></td>
						<td align="right">腰围：</td>
						<td><input name="textfield6" type="text" class="yinput" id="textfield6" /></td>
					</tr>
					<tr>
						<td height="24" align="right">逛街频率：</td>
						<td><select name="select5" id="select5" class="">
							<option selected="selected">请选择</option>
						</select></td>
						<td align="right">胸围：</td>
						<td><input name="textfield7" type="text" class="yinput" id="textfield7" /></td>
					</tr>
					<tr>
						<td height="24" align="right">每次购物金额：</td>
						<td><select name="select6" id="select6" class="">
							<option selected="selected">请选择</option>
						</select></td>
						<td align="right">&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
				<table width="640" border="0" cellspacing="2" cellpadding="0">
					<tr>
						<td width="25%" height="24" align="right">喜欢到哪里购物：</td>
						<td width="75%">
							<input type="radio" name="radio" id="radio" value="radio" />
						网上购物&nbsp;&nbsp;
						&nbsp;&nbsp;<input type="radio" name="radio" id="radio" value="radio" />
						百货商场&nbsp;&nbsp;
						&nbsp;&nbsp;<input type="radio" name="radio" id="radio" value="radio" />
						时尚卖场&nbsp;&nbsp;<br />
						<input type="radio" name="radio" id="radio" value="radio" />
						折扣市场&nbsp;&nbsp;
						&nbsp;&nbsp;
						<input type="radio" name="radio" id="radio" value="radio" />
						批发市场&nbsp;&nbsp;
						&nbsp;&nbsp;<input type="radio" name="radio" id="radio" value="radio" />
						街边小店&nbsp;&nbsp;
						</td>
					</tr>
					<tr>
						<td height="24" align="right">服装购买您更看重哪些因素：</td>
						<td><input type="radio" name="radio" id="radio3" value="radio" />
品牌&nbsp;&nbsp;
						&nbsp;&nbsp;
						<input type="radio" name="radio" id="radio3" value="radio" />
折扣&nbsp;&nbsp;
						&nbsp;&nbsp;
						<input type="radio" name="radio" id="radio3" value="radio" />
价位&nbsp;&nbsp;
&nbsp;&nbsp;
						<input type="radio" name="radio" id="radio3" value="radio" />
款式&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" name="radio" id="radio3" value="radio" />
品质&nbsp;&nbsp; </td>
					</tr>
				</table>
			</div>
			<div class="biaogey3">
				<div class="biaogey3-tit">您希望上品网为您提供那些信息（多选）</div>
				<div class="biaogey3-content">
					<li><input type="checkbox" name="checkbox" id="checkbox" />打折信息</li>
					<li><input type="checkbox" name="checkbox" id="checkbox" />搭配技巧</li>
					<li><input type="checkbox" name="checkbox" id="checkbox" />热销推荐</li>
					<li><input type="checkbox" name="checkbox" id="checkbox" />新品速递</li>
					<li><input type="checkbox" name="checkbox" id="checkbox" />明星穿衣</li>
					<li><input type="checkbox" name="checkbox" id="checkbox" />精彩专辑</li>
					<li><input type="checkbox" name="checkbox" id="checkbox" />品牌攻略</li>
					<li><input type="checkbox" name="checkbox" id="checkbox" />论坛精帖</li>
					<li><input type="checkbox" name="checkbox" id="checkbox" />最新潮流</li>
				</div>


			</div>



		</div>
    </div>
    <%--右侧分类结束--%>
</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>
</body>
</html>
