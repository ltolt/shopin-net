<%--
  Description:会员设置个性化信息
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>设置个性化信息</title>
<script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>
<link href="${css}/myshopin-character.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .textinput{width:60px;}
</style>
<script type="text/javascript">
    <%--选择月份,改变日期选择框--%>
    function changeBirth(){
       var birth_year='';
       var birth_month='';
       var options=$("#birthdate_year option:selected");
       if(options.length>0){
           birth_year=options.eq(0).val();
       }
       options=$("#birthdate_month option:selected");
       if(options.length>0){
           birth_month=options.eq(0).val();
       }
       $("#birthdate_day").empty().append("<option value=''></option>");
       if(birth_year!=''&&birth_month!=''){
           var days=getDayCount(parseInt(birth_year),parseInt(birth_month));
           for(var i=0;i<days;i++){
              $("#birthdate_day").append("<option value='"+(i+1)+"'>"+(i+1)+"</option>");
           }
       }
    }
    <%--根据年月获得天数--%>
    function getDayCount(year,month){
       if(month=='1'||month=='3'||month=='5'||month=='7'
               ||month=='8'||month=='10'||month=='12'){
           return 31;
       }
       if(month=='4'||month=='6'||month=='9'||month=='11'){
           return 30;
       }
       if(month=='2'){
           if(year%400==0||(year%4==0&&year%100!=0)){
              return 29;
           }else{
              return 28;
           }
       }
    }

    <%--获得个人信息的数据--%>
    function getPersonalData(){
       var info={};
       var sex='';
       var birthdate='';
       var birth_year='';
       var birth_month='';
       var birth_day='';
       var stature='';
       var weight='';
       var tel='';
       var career='';
       var earnings='';
       var interest='';
       
       var radios=$(":radio[name='sex'][checked]");
       if(radios.length>0){
           sex=radios.eq(0).val();
       }
       var options=$("#birthdate_year option:selected");
       if(options.length>0){
           birth_year=options.eq(0).val();
       }
       options=$("#birthdate_month option:selected");
       if(options.length>0){
           birth_month=options.eq(0).val();
           if(birth_month.length<2){
               birth_month="0"+birth_month;
           }
       }
       options=$("#birthdate_day option:selected");
       if(options.length>0){
           birth_day=options.eq(0).val();
           if(birth_day.length<2){
               birth_day="0"+birth_day;
           }
       }
       if(birth_year!=''&&birth_month!=''&&birth_day!=''){
           birthdate=birth_year+"-"+birth_month+"-"+birth_day;
       }
       options=$("#stature option:selected");
       if(options.length>0){
           stature=options.eq(0).val();
       }
       options=$("#weight option:selected");
       if(options.length>0){
           weight=options.eq(0).val();
       }
       tel=$.trim($("input[name='tel']").val());
       options=$("#career option:selected");
       if(options.length>0){
           career=options.eq(0).val();
       }
       options=$("#earnings option:selected");
       if(options.length>0){
           earnings=options.eq(0).val();
       }
       interest=$.trim($("input[name='interest']").val());
       info['sex']=sex;
       info['birthdate']=birthdate;
       info['stature']=stature;
       info['weight']=weight;
       info['tel']=tel;
       info['career']=career;
       info['earnings']=earnings;
       info['interest']=interest;
       return info;
    }

    <%--校验个人信息的数据--%>
    function validatePersonalData(){
       var info=getPersonalData();
       var sex=info['sex'];
       var birthdate=info['birthdate'];
       var stature=info['stature'];
       var weight=info['weight'];
       var tel=info['tel'];
       var career=info['career'];
       var earnings=info['earnings'];
       var interest=info['interest'];
       var button=$("#bt_personal").get(0);
       if(sex==''){
           $.popdialog(button,"save_person_commit",'请选择性别');
           return false;
       }
       if(birthdate==''){
           $.popdialog(button,"save_person_commit",'请选择生日');
           return false;
       }
       if(stature==''){
           $.popdialog(button,"save_person_commit",'请选择身高');
           return false;
       }
       if(weight==''){
           $.popdialog(button,"save_person_commit",'请选择体重');
           return false;
       }
       if(tel==''||!/^1(3|5)[0-9]{9}$/.test(tel)){
           $.popdialog(button,"save_person_commit",'手机号填写不正确');
           return false;
       }
       if(career==''){
           $.popdialog(button,"save_person_commit",'请选择职业');
           return false;
       }
       if(earnings==''){
           $.popdialog(button,"save_person_commit",'请选择收入');
           return false;
       }
       if(interest==''){
           $.popdialog(button,"save_person_commit",'请填写兴趣信息');
           return false;
       }
       return true;
    }
    

    <%--保存个人信息的数据--%>
    function savePersonal(button){
       if(!validatePersonalData()){
           return;
       }
       var info=getPersonalData();
       var button=$("#bt_personal").get(0);
       $.ajax({
            url:'${ctx}/member/savePersonal.json',
            type: 'post',
            dataType: 'json',
            data:info,
            timeout: 30000,
            error: function(){
                $.popdialog(button,"save_person_info","保存信息失败,请重试");
                return;
            },
            success: function(response){
                var result=response.result;
                var status=result.status;
                var message=result.message;
                $.popdialog(button,"save_person_info",message);
                return;   
            }
     });
    }
</script>
</head>

<body>
    <%--面包屑内容开始--%>
    <div id="breadcrumb">
	    <a href="${ctx}">首页</a><span>></span>我的上品<span>></span>个性化信息设置</div>
    <%--面包屑内容结束--%>
<div style="width:950px;float:left">
    <%--左侧分类开始--%>
    <jsp:include page="myshopin_left.jsp"/>
    <%--左侧分类结束--%>
    <%--右侧分类开始--%>
	<div id="content-rightweihzi">
		<div id="content-right">
			<div class="ykong"></div>
			<div class="biaoge11" id="personal_div">
				<table width="640" border="0" cellspacing="2" cellpadding="0" >
					<tr>
						<td height="24" align="right">性别：</td>
						<td>&nbsp;&nbsp;<input type="radio" name="sex" value="1"
                               <c:if test="${info.sex=='1'}">checked='true'</c:if> />
							男&nbsp;&nbsp;
							<input type="radio" name="sex"  value="0"
                               <c:if test="${info.sex=='0'}">checked='true'</c:if> />
							女</td>
					</tr>
					<tr>
						<td height="24" align="right">生日：</td>
						<td>
                            <select id="birthdate_year" style="width:60px;color:#000000"
                                    onchange="changeBirth();" onblur="changeBirth();">
                                <option value=""></option>
                                <c:forEach var="year" begin="1950" end="2010" step="1">
                                   <option value="${year}"
                                        <c:if test="${year==birthdate_year}">selected='true'</c:if> >${year}</option>
                                </c:forEach>
                            </select>年
                            <select id="birthdate_month" style="width:40px;color:#000000"
                                    onchange="changeBirth();" onblur="changeBirth();">
                                <option value=""></option>
                                <c:forEach var="month" begin="1" end="12" step="1">
                                   <option value="${month}"
                                           <c:if test="${month==birthdate_month}">selected='true'</c:if> >${month}</option>
                                </c:forEach>
                            </select>月
                            <select id="birthdate_day" style="width:40px;color:#000000">
                                <option value=""></option>
                                <c:forEach var="day" begin="1" end="31" step="1">
                                   <option value="${day}"
                                           <c:if test="${day==birthdate_day}">selected='true'</c:if> >${day}</option>
                                </c:forEach>
                            </select>日
						</td>
					</tr>
                    <tr>
						<td height="24" align="right">身高：</td>
						<td>
                            <select id="stature" style="width:60px;color:#000000">
                               <option value=""></option>
                               <c:forEach var="cm" begin="100" end="240" step="1">
                                   <option value="${cm}"
                                       <c:if test="${cm==info.stature}">selected='true'</c:if> >${cm}</option>
                               </c:forEach>
                            </select>厘米
						</td>
					</tr>
                    <tr>
						<td height="24" align="right">体重：</td>
						<td>
                            <select id="weight" style="width:60px;color:#000000">
                               <option value=""></option>
                               <c:forEach var="kg" begin="40" end="150" step="1">
                                   <option value="${kg}"
                                           <c:if test="${kg==info.weight}">selected='true'</c:if> >${kg}</option>
                               </c:forEach>
                            </select>公斤
						</td>
					</tr>
                    <tr>
						<td height="24" align="right">手机号：</td>
						<td><input name="tel" type="text" style="width:96px" maxlength="12" value="${info.tel}"/></td>
					</tr>
                    <tr>
						<td height="24" align="right">职业：</td>
						<td>
                            <select id="career" style="width:100px;color:#000000">
                               <option value=""></option> 
                               <option value="学生" <c:if test="${'学生'==info.career}">selected='true'</c:if> >学生</option>
                               <option value="网络工程师" <c:if test="${'网络工程师'==info.career}">selected='true'</c:if>>网络工程师</option>
                               <option value="销售专员" <c:if test="${'销售专员'==info.career}">selected='true'</c:if>>销售专员</option>
                               <option value="教师" <c:if test="${'教师'==info.career}">selected='true'</c:if>>教师</option>
                               <option value="医生" <c:if test="${'医生'==info.career}">selected='true'</c:if>>医生</option>
                               <option value="律师" <c:if test="${'律师'==info.career}">selected='true'</c:if>>律师</option>
                               <option value="护士" <c:if test="${'护士'==info.career}">selected='true'</c:if>>护士</option>
                            </select>
						</td>
					</tr>
                    <tr>
						<td height="24" align="right">收入：</td>
						<td>
                            <select id="earnings" style="width:100px;color:#000000">
                               <option value=""></option> 
                               <option value="少于1000" <c:if test="${'少于1000'==info.earnings}">selected='true'</c:if>>少于1000</option>
                               <option value="1000-3000" <c:if test="${'1000-3000'==info.earnings}">selected='true'</c:if>>1000-3000</option>
                               <option value="3000-5000" <c:if test="${'3000-5000'==info.earnings}">selected='true'</c:if>>3000-5000</option>
                               <option value="5000-10000" <c:if test="${'5000-10000'==info.earnings}">selected='true'</c:if>>5000-10000</option>
                               <option value="10000以上" <c:if test="${'10000以上'==info.earnings}">selected='true'</c:if>>10000以上</option>
                            </select>
						</td>
					</tr>
                    <tr>
						<td height="24" align="right">兴趣：</td>
						<td><input name="interest" type="text" style="width:400px" maxlength="40" value="${info.interest}"/></td>
					</tr>

				</table>

                <table width="640" border="0" cellspacing="2" cellpadding="0">
                    <tr><td width="640" align="center">
                        <img id="bt_personal" src="${images}/y-c002.gif" border="0" style="cursor:pointer" onclick="savePersonal()"/>
                    </td></tr>
                </table>
			</div>
		</div>
    </div>             
    <%--右侧分类结束--%>
</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>
</body>
</html>



<%--<table width="640" border="0" cellspacing="2" cellpadding="0">--%>
                    <%--<tr>--%>
						<%--<td width="20%" height="24" align="right">昵称：</td>--%>
						<%--<td width="80%"><input name="nickname" type="text" class="yinput" /></td>--%>
					<%--</tr>--%>
					<%--<tr>--%>
						<%--<td height="24" align="right" valign="top">上传头像：</td>--%>
						<%--<td><table width="50%" border="0" cellspacing="0" cellpadding="0">--%>
							<%--<tr>--%>
								<%--<td width="36%" class="imgbk"><img src="${images}/del/y_4.jpg" width="90" height="90" /></td>--%>
								<%--<td width="64%" valign="bottom"><a href="#">更新</a></td>--%>
							<%--</tr>--%>
                            <%--<tr style="display:none">--%>
                                <%--<td colspan="2" class="imgbk">选择图片:<input type="file" name="headpic"/><input type="button" value="上传"/> </td>--%>
                            <%--</tr>--%>
						<%--</table></td>--%>
					<%--</tr>--%>
                    <%--<tr>--%>
						<%--<td height="24" align="right">男友/女友生日：</td>--%>
						<%--<td><input name="mate_birthday" type="text" class="textinput" /></td>--%>
					<%--</tr>--%>
					<%--<tr>--%>
						<%--<td height="24" align="right">喜欢的颜色</td>--%>
						<%--<td>--%>
						<%--红&nbsp;&nbsp;--%>
						<%--&nbsp;&nbsp;<input type="radio" name="favor_color" value="radio" />--%>
						<%--橙&nbsp;&nbsp;--%>
						<%--&nbsp;&nbsp;<input type="radio" name="favor_color" value="radio" />--%>
						<%--黄&nbsp;&nbsp;--%>
						<%--&nbsp;&nbsp;<input type="radio" name="favor_color" value="radio" />--%>
						<%--绿&nbsp;&nbsp;--%>
						<%--&nbsp;&nbsp;<input type="radio" name="favor_color" value="radio" />--%>
						<%--蓝&nbsp;&nbsp;--%>
						<%--&nbsp;&nbsp;<input type="radio" name="favor_color" value="radio" />--%>
						<%--靛&nbsp;&nbsp;--%>
						<%--&nbsp;&nbsp;<input type="radio" name="favor_color" value="radio" />--%>
						<%--紫&nbsp;&nbsp;--%>
						<%--</td>--%>
					<%--</tr>--%>
					<%--<tr>--%>
						<%--<td height="24" align="right">喜欢的风格：</td>--%>
						<%--<td><select name="favor_style">--%>
							<%--<option>波西米亚风格</option>--%>
						<%--</select>--%>
						<%--</td>--%>
					<%--</tr>--%>
					<%--<tr>--%>
						<%--<td height="24" align="right">喜欢的品牌：</td>--%>
						<%--<td><select name="favor_brand" >--%>
							<%--<option selected="selected">米尚</option>--%>
																		<%--</select></td>--%>
					<%--</tr>--%>
					<%--<tr>--%>
						<%--<td width="20%" height="24" align="right">教育程度：</td>--%>
						<%--<td width="30%"><select name="education" >--%>
							<%--<option selected="selected" value="">请选择</option>--%>
                            <%--<option selected="selected" value="小学">小学</option>--%>
						<%--</select></td>--%>
						<%--<td width="12%" align="right">身高：</td>--%>
						<%--<td><input name="height" type="text" class="textinput" /></td>--%>
					<%--</tr>--%>
					<%--<tr>--%>
						<%--<td height="24" align="right">职业：</td>--%>
						<%--<td><select name="job" >--%>
							<%--<option selected="selected">请选择</option>--%>
						<%--</select></td>--%>
						<%--<td align="right">体重：</td>--%>
						<%--<td><input name="weight" type="text" class="textinput" /></td>--%>
					<%--</tr>--%>
					<%--<tr>--%>
						<%--<td height="24" align="right">月收入：</td>--%>
						<%--<td><select name="salary">--%>
							<%--<option selected="selected">请选择</option>--%>
						<%--</select></td>--%>
						<%--<td align="right">腰围：</td>--%>
						<%--<td><input name="waistline" type="text" class="textinput"/></td>--%>
					<%--</tr>--%>
					<%--<tr>--%>
						<%--<td height="24" align="right">逛街频率：</td>--%>
						<%--<td><select name="sequence" >--%>
							<%--<option selected="selected">请选择</option>--%>
						<%--</select></td>--%>
						<%--<td align="right">胸围：</td>--%>
						<%--<td><input name="cup" type="text" class="textinput" /></td>--%>
					<%--</tr>--%>
					<%--<tr>--%>
						<%--<td height="24" align="right">每次购物金额：</td>--%>
						<%--<td><select name="shop_money" >--%>
							<%--<option selected="selected">请选择</option>--%>
						<%--</select></td>--%>
						<%--<td align="right">&nbsp;</td>--%>
						<%--<td>&nbsp;</td>--%>
					<%--</tr>--%>
				<%--</table>--%>
				<%--<table width="640" border="0" cellspacing="2" cellpadding="0">--%>
					<%--<tr>--%>
						<%--<td width="25%" height="24" align="right">喜欢到哪里购物：</td>--%>
						<%--<td width="75%">--%>
							<%--<input type="checkbox" name="favor_place" value="" />--%>
						<%--网上购物&nbsp;&nbsp;--%>
						<%--&nbsp;&nbsp;<input type="checkbox" name="favor_place" value="" />--%>
						<%--百货商场&nbsp;&nbsp;--%>
						<%--&nbsp;&nbsp;<input type="checkbox" name="favor_place" value="" />--%>
						<%--时尚卖场&nbsp;&nbsp;<br />--%>
						<%--<input type="checkbox" name="favor_place" value="" />--%>
						<%--折扣市场&nbsp;&nbsp;--%>
						<%--&nbsp;&nbsp;<input type="checkbox" name="favor_place" value="" />--%>
						<%--批发市场&nbsp;&nbsp;--%>
						<%--&nbsp;&nbsp;<input type="checkbox" name="favor_place" value="" />--%>
						<%--街边小店&nbsp;&nbsp;--%>
						<%--</td>--%>
					<%--</tr>--%>
					<%--<tr>--%>
						<%--<td height="24" align="right">您购买服装更看重哪些因素：</td>--%>
						<%--<td><input type="checkbox" name="favor_factor" value="" />--%>
<%--品牌&nbsp;&nbsp;--%>
						<%--&nbsp;&nbsp;--%>
						<%--<input type="checkbox" name="favor_factor" value="" />--%>
<%--折扣&nbsp;&nbsp;--%>
						<%--&nbsp;&nbsp;--%>
						<%--<input type="checkbox" name="favor_factor" value="" />--%>
<%--价位&nbsp;&nbsp;--%>
<%--&nbsp;&nbsp;--%>
						<%--<input type="checkbox" name="favor_factor" value="" />--%>
<%--款式&nbsp;&nbsp;&nbsp;&nbsp;--%>
						<%--<input type="checkbox" name="favor_factor" value="" />--%>
<%--品质&nbsp;&nbsp; </td>--%>
					<%--</tr>--%>
				<%--</table>--%>