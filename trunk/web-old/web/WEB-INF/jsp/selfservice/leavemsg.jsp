<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>在线留言</title>
    <link href="${css}/message.css" rel="stylesheet" type="text/css"/>
    <style type="text/css">
        <!--
        .STYLE3 {
            color: #FFFFFF;
            font-weight: bold;
        }

#BgDiv {
	position:absolute;
	top:0px;
	right:0px;
	bottom:0px;
	left:0px;
	background-color:#000000;
	filter:alpha(opacity=30);/* IE */
	opacity:0.3;/* FireFox */
	z-index:100;
}

#MsgDiv {
	border:#6B90DA 2px solid;
	background-Color:#FFFFFF;
	position:absolute;
	text-align:center;
	padding:0px 2px 0px 0px;
	line-height:22px;
	z-index:102;
}

#MsgDivTable {
	width:100%;
	margin:1px;
	border:0px;
	padding:0px;
	border-spacing: 0;
	border-collapse: collapse;
}

#MsgDivTitle {
	height:20px;
	color:#ff0000;
	text-align:left;
	padding:3px 3px 3px 1px;
	margin:0px;
	font-weight:bold;
	font-size:13px;
	cursor:move;
    width:335px;
}

#MsgTitle {
	background-color:#eeeeee;
	background-repeat:repeat;
}

#MsgDivClose {
	width:21px;
	font-family:"\u5b8b\u4f53";
	cursor:pointer;
	padding-right:0px;
	padding-right:0px;
}

#MsgDivClose span {
	color:#0000ff;
    padding-right:0px;
	font-size:15pt;
}

#MsgBox {
	text-align:left;
    padding:10px;
}
        -->
    </style>
    <script type="text/javascript" src="${js}/popWin.js"></script>
    <script type="text/javascript">
         function validateSecondLeveType(){
            var i=0;
             $("input[name='leaveMessageType']").each(function(){
                if (this.checked){
                    i++;
                }
             });
            if(i>0){
                  return true;
            }else{
                alert("请选择子类别");
                return false;
            }
        }
        function validateEmail() {
            var email = $.trim($("#userEmail").val());
            var valid = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(email);
            if (!valid) {
                $("#userEmail").attr("value", "");
                alert("邮箱地址不正确，请检查！");
                return false;
            } else {
                return true;
            }
        }

        function validateTel() {
            var tel = $.trim($("#tel").val());
            var valid = /(^[0-9]{3}[-]?[0-9]{8}$)|(^[0-9]{4}[-]?[0-9]{7}$)|(^0{0,1}13[0-9]{9}$)/.test(tel);
            if (!valid) {
                $("#tel").attr("value", "");
                alert("电话填写不正确,应为11位数字(手机或电话号码)");
                return false;
            } else {
                return true;
            }

        }

        function validateProvince() {
            if ($("#pv").get(0).selectedIndex == 0) {
                alert("您没有选择所在省市，请选择！");
                return false;
            } else {
                return ture;
            }

        }
        /*function validateType() {
            var subTypes = document.getElementsByName("msgType");
            for (var i = 0; i < subTypes.length; i++) {
                if (subTypes[i].checked == true) {
                    return true;
                }
            }
            return true;
        }*/

        function validateUserName() {
            var userName = $.trim($("#userName").val());
            if (userName == null || userName == "") {
                alert("用户名不能为空");
                return false;
            } else {
                return true;
            }

        }

        function validateMsgContent() {
            var msgContent = $.trim($("#msgContent").val());
            if (msgContent.length > 200) {
                alert("留言内容太长");
                return false;
            } else if (msgContent.length < 10){
                alert('留言信息不能少于10个字符！');
                return false;
            }
            return true;
        }

        function validateOrderNo(){
            var orderNo = $.trim($("#orderId").val());
            if(orderNo==null || orderNo==""){
                alert('订单编号是必须填写项！');
                return false;
            }else{
                return true;
            }
        }

        function commitMsg() {

          var orderNeed = '${parent.orderNoNeed}';
            if(orderNeed=='1' && validateOrderNo()){
               if (validateSecondLeveType()  && validateTel() && validateMsgContent()) {
                $("#msgform").submit();
               }
            }else {
                if (validateSecondLeveType()  && validateTel()  && validateMsgContent()) {
                   $("#msgform").submit();
                }
                }
        }

        function goToNext(address,typeId,target,typeName){
            var url=address+"?typeId="+typeId;
            var allType= '${parent.catename}--'+typeName
             $("#all-msg-type").text(allType) ;
            if(target=='0'){
                document.location.href=url;
            }else
            {
                window.open(url,'_blank');
            }

        }

        function showInfo(infoContent,typeName){
         var allType= '${parent.catename}--'+typeName
           $("#test").text(infoContent);
            var div = document.getElementById("test").innerHTML;
		   popWin(allType, div, 400, 200);
             //  alert(infoContent);
             $("#all-msg-type").text(allType) ;
        }

        function initNavTips(address,typeId,target,typeName){
             var allType= '${parent.catename}--'+typeName
             $("#all-msg-type").text(allType) ;
            var url=address+"?typeId="+typeId;
             if(target=='0'){
                document.location.href=url;
            }
        }


      function validateOrderDetail(){
          var orderNo=$.trim($("#orderId").val());
          if(orderNo==""){
              alert("请输入订单号！");
              return;
          }

          $.ajax({
           url: "${ctx}/validate/orderNo.json",
           type: "POST",
           dataType: 'json',
           data: {'orderId':orderNo},
           timeout: 30000,
           success: function(response){
             var msg = response.message;
             if(msg != undefined ){
                 alert(msg.message);
                 $("#orderId").attr("value",'');//将订单号输入框清空
             }else{
                var order=response.order;
                 if(order != undefined ){ //说明订单返回结果是找到的订单，自动填充相关信息。如果没有找到，则不做任何操作
                 $("#userName").attr("value",order.receptName);
                 $("#userName").attr("readonly",true);
                 $("#tel").attr("value",order.receptPhone);
                 $("#tel").attr("readonly",true);
                 $("#pv").find('option').remove().end().append("<option value='"+order.inceptProvince+"' selected>"+order.inceptProvince+"</option>").val(order.inceptProvince);
               // $("#userEmailTips").text("*邮箱为必填项");
                 $("#userEmail").attr("value",response.email);
                 }
             }

           },
            error:function(XMLResponse){
             alert("校验出现错误，请稍后再试！"+XMLResponse.responseText);
           }
        });
   }



    </script>
</head>
<body>
	<div id="test" style="display:none;margin:10px;"></div>
<div id="page1">
    <div class="biaoti1"><img src="${images}/0414m4.gif" alt="在线留言"/></div>
    <div class="faq0414-2">

        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;">
             <form id="msgform" action="${ctx}/leavemsg/commit.html" method="post">
                <tr>
                    <td height="60" colspan="3" align="left" valign="middle" class="tabletitle1">
                        问题类型：${parent.catename} </td>
                </tr>
                <tr>
                    <td width="13%" height="70" align="left" valign="middle">请选择分类</td>
                    <td width="1%" height="30" align="left" valign="middle">&nbsp;</td>
                    <td width="86%" align="left" valign="middle"><label></label>
                      <c:forEach items="${subs}" var="subType">
                        <label>
                         <input type="radio"  name="leaveMessageType" id="msgType" value="${subType.tid}"
                       <%-- <c:choose>
                         &lt;%&ndash;-- contenttype  0表示是链接类型，1表示是文字提示。2表示什么都不做&ndash;%&gt;
                         <c:when test="${subType.contenttype eq '0'}">
                         onclick="goToNext('${fn:trim(subType.viewcontent)}','${subType.tid}','${subType.targetType}','${subType.catename}')"
                         </c:when>
                         <c:otherwise>
                             <c:if test="${subType.contenttype eq '1'}">
                             onclick="showInfo('${fn:trim(subType.viewcontent)}','${subType.catename}')"
                             </c:if>
                         </c:otherwise>
                         </c:choose>--%>
                         onclick="initNavTips('${fn:trim(subType.viewcontent)}','${subType.tid}','${subType.targetType}','${subType.catename}')"

                        />
                          </label>
                            <c:choose>
                         <%---- contenttype  0表示是链接类型，1表示是文字提示。2表示什么都不做--%>
                                <c:when test="${subType.contenttype eq '0'}">
                                    <a href="javascript:goToNext('${subType.viewcontent}','${subType.tid}','${subType.targetType}','${subType.catename}')"> ${subType.catename}</a>
                                </c:when>
                                <c:otherwise>
                                <a  <c:if test="${subType.contenttype eq '1'}">  href="javascript:showInfo('${subType.viewcontent}','${subType.catename}');"</c:if>> ${subType.catename}</a>
                            </c:otherwise>
                            </c:choose>
                         <c:if test="${subType.catename eq '退货申请'}"><span style="color:red;padding-left:20px;">目前不支持换货 </span></c:if>
                        </c:forEach>


                       <%--   <select id="secondType" name="leaveMessageType">
                            <option value="-1">请选择子类别</option>
                            <c:forEach items="${subs}" var="subType">
                                <option value="${subType.tid}">${subType.catename}</option>
                            </c:forEach>
                        </select>
                        --%>


                </tr>
                <tr>
                    <td height="30" align="left" valign="middle">我的订单号是</td>
                    <td height="30" align="left" valign="middle">&nbsp;</td>
                    <td align="left" valign="middle"><label>
                        <input name="orderId" id="orderId"  <c:if test="${parent.orderNoNeed eq '1'}">onblur="validateOrderDetail()"</c:if> type="text" class="faq0414-2kuang"/><input type="hidden" value="验证订单号" id="ordercheckbt"/>
                        <c:if test="${parent.orderNoNeed eq '1'}"><span style="color:red">* 订单号为必填项</span>&nbsp;&nbsp;<span><a href="http://www.shopin.net/myshopin/orders.html" target="_blank">查看订单</a></span></c:if>
                    </label>
                    </td>
                </tr>
                <tr>
                    <td height="26" align="left" valign="middle">我的名字</td>
                    <td height="30" align="left" valign="middle">&nbsp;</td>
                    <td align="left" valign="middle"><input type="text" name="userName" id="userName"/></td>
                </tr>
                <tr>
                    <td height="26" align="left" valign="middle">我的邮箱地址</td>
                    <td height="30" align="left" valign="middle">&nbsp;</td>
                    <td align="left" valign="middle"><input type="text" name="userEmail" id="userEmail" value="${email}"
                                                            /><span style="color:red" id="userEmailTips"></span></td>
                </tr>
                <tr>
                    <td height="26" align="left" valign="middle">我的联系电话</td>
                    <td height="30" align="left" valign="middle">&nbsp;</td>
                    <td align="left" valign="middle"><input type="text" name="tel" id="tel" onblur="validateTel()"/>
                    <span style="color:red">&nbsp;&nbsp;*必须填写</span>
                    </td>
                </tr>
                <tr>
                    <td height="26" align="left" valign="middle">我的省市</td>
                    <td height="30" align="left" valign="middle">&nbsp;</td>
                    <td align="left" valign="middle">
                        <SELECT NAME="userProvince" id="pv">
                        </SELECT>
                    </td>
                </tr>
                <tr>
                    <td height="26" align="left" valign="middle">是否需要回复</td>
                    <td height="30" align="left" valign="middle">&nbsp;</td>
                    <td align="left" valign="middle">
                    <label>
                        <input type="radio" name="needreplay" value="1" <c:if test="${'建议' ne parent.catename }"> checked=true</c:if>/>
                    </label>
                        是
                        <label>
                            <input type="radio" name="needreplay" value="0" <c:if test="${'建议' eq parent.catename }"> checked=true</c:if>/>
                        </label>
                        否
                    </td>
                </tr>
                <tr><td colspan="3">您选择留言类型是：<span id="all-msg-type" class="tabletitle1"></span></td></tr>
                <tr>
                    <td height="50" colspan="3" align="left" valign="middle">我的留言（请输入200字以内）</td>
                </tr>
                <tr>
                    <td height="180" colspan="3" align="left" valign="top"><label>
                        <textarea name="msgContent" id="msgContent" cols="90" rows="10"></textarea>
                    </label></td>
                </tr>
                <tr>
                    <td height="80" colspan="3" align="center" valign="middle"><label>
                       <a onclick="commitMsg()" style="cursor:pointer;">
                            <img name="imageField"
                          src="${images}/0414m15.gif" alt="提交" />
                      </a>
                    </label>
                    </td>
                </tr>
                 </form>
        </table>

    </div>
</div>

<script type="text/javascript">
      function init() {
        var pvs = new Array("北京市", "天津市", "河北省", "山西省", "内蒙古自治区", "辽宁省", "吉林省", "黑龙江省", "上海市", "江苏省", "浙江省", "安徽省", "福建省", "江西省", "山东省", "河南省", "湖北省", "湖南省", "广东省", "广西壮族自治区", "海南省", "重庆市", "四川省", "贵州省", "云南省", "西藏自治区", "陕西省", "甘肃省", "青海省", "宁夏回族自治区", "新疆维吾尔自治区", "台湾省", "香港特别行政区", "澳门特别行政区");
        for (var i = 0; i < pvs.length; i++) {
            $("#pv").append("<option value='" + pvs[i] + "'>" + pvs[i] + "</option>");
        }
    }
    init();
</script>

</body>
</html>
