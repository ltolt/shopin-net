<%--
  Description:会员地址簿
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>我的地址簿</title>
<script type="text/javascript" src="${js}/input.js"></script>
<link href="${css}/myshopin-character.css" rel="stylesheet" type="text/css" />
<script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>
<style type="text/css">
    .input_short{width:100px}
    .input_long{width:500px}
</style>
<script type="text/javascript">
    <%--最多允许5个地址--%>
    var addressCount=parseInt('${memberAddressLimit}');
    <%--
       添加表单
       @param button
    --%>
    function addForm(){
       $("#addUL").css("display","block");
    }

    <%--
       隐藏新增表单
       @param button
    --%>
    function hideAdd(button){
       $("#addUL").css("display","none");
    }

    <%--选择省份城市 --%>
    function selectProvince(select){
          var province=$(select);
          var city=province.siblings(".citylist").eq(0);
          var value=province.val();
          if(value==''){
              return;
          }
          var provinceName=province.children("option[selected]").eq(0).html();
          province.attr("provinceName",provinceName);
          $.ajax({
                url:'${ctx}/district/selectprovince.json',
                type: 'post',
                dataType: 'json',
                data:{'provinceSID':value},
                timeout: 30000,
                error: function(){
                    return;
                },
                success: function(response){
                    var result=response.citylist;
                    city.html("<option value=''>请选择</option>");
                    for(var i=0;i<result.length;i++){
                        var ele=result[i];
                        var option=$("<option value='"+ele['sid']+"'>"+ele['name']+"</option>");
                        option.appendTo(city);
                    }
                    return;
                }
         });
      }

    <%--校验输入信息--%>
    function validate(button){
       var li=$(button).parent().parent();
       var name=li.find("input[name='name']");
       var deliProvinceSid=li.find("select[class='provincelist']");
       var deliCitySid=li.find("select[class='citylist']");
       var address=li.find("input[name='address']");
       var postcode=li.find("input[name='postcode']");
       var tel=li.find("input[name='tel']");
       if($.trim(name.val())==''){
           $.poptip(name,"name_tip","姓名不能为空");
           return false;
       }
       if(deliProvinceSid.val()==''){
          $.poptip(deliProvinceSid,"province_tip","请选择省份或直辖市");
          return false;
       }
       if(deliCitySid.val()==''){
          $.poptip(deliCitySid,"city_tip","请选择城市或区县");
          return false;
       }
       if($.trim(address.val())==''){
           $.poptip(address,"address_tip","地址不能为空");
           return false;
       }
       if(!/^\d{6}$/.test($.trim(postcode.val()))){
           $.poptip(postcode,"postcode_tip","邮编填写不正确,应为6位数字");
           return false;
       }
       var pattern=/(^[0-9]{3}[-]?[0-9]{8}$)|(^[0-9]{4}[-]?[0-9]{7}$)|(^0{0,1}13[0-9]{9}$)/;
       if(!pattern.test($.trim(tel.val()))){
           $.poptip(tel,"tel_tip","电话填写不正确,应为11位数字(手机或电话号码)");
           return false;
       }
       return true;
    }

    /**
     * 获得地址数量
     */
    function getAddressCount(){
        return $("body").find("li[name='address_item_li']").length;
    }

    <%--提交添加信息--%>
    function addCommit(button){
        if(getAddressCount()>addressCount){
            $.popdialog(button,"address_add_info","添加地址信息失败,你最多只能添加5个收货地址");
            return;
        }
        if(!validate(button)){
            return;
        }
        var li=$(button).parent().parent();
        var name=$.trim(li.find("input[name='name']").val());
        var deliProvinceSid=li.find("select[class='provincelist']").val();
        var deliCitySid=li.find("select[class='citylist']").val();
        var address=$.trim(li.find("input[name='address']").val());
        var postcode=$.trim(li.find("input[name='postcode']").val());
        var tel=$.trim(li.find("input[name='tel']").val());
        $.ajax({
            url:'${ctx}/member/addressSave.json',
            type: 'post',
            dataType: 'json',
            data:{'name':name,
                  'deliProvinceSid':deliProvinceSid,
                  'deliCitySid':deliCitySid,
                  'address':address,
                  'postcode':postcode,
                  'tel':tel},
            timeout: 30000,
            error: function(){
                $.popdialog(button,"address_add_info","添加地址信息失败,请重试");
                return;
            },
            success: function(response){
                var result=response.result;
                var status=result.status;
                var message=result.message;
                $.popdialog(button,"address_add_info",message);
                if(status=='1'){
                   window.setTimeout(function(){window.location.reload();},2000);
                }
                return;
            }
        });
    }
    
    <%--显示修改表单--%>
    function editForm(button){
       var li=$(button).parent().parent();
       li.next().css("display","block");
       li.css("display","none");
    }

    <%--
        根据当前按钮,渲染地址信息
        @param button
    --%>
    function renderEdit(button){
        var li=$(button).parent().parent();
        var name=$.trim(li.find("input[name='name']").val());
        var province=li.find("select[class='provincelist']").eq(0).children("option[selected]").eq(0).html();
        var city=li.find("select[class='citylist']").eq(0).children("option[selected]").eq(0).html();
        var address=$.trim(li.find("input[name='address']").val());
        var postcode=$.trim(li.find("input[name='postcode']").val());
        var tel=$.trim(li.find("input[name='tel']").val());
        var spans=li.prev().find("span");
        spans.eq(0).html(name);
        spans.eq(1).html(province+city+address);
        spans.eq(2).html(postcode);
        spans.eq(3).html(tel);
    }

    <%--
        隐藏修改表单
        @param button
    --%>
    function hideEdit(button){
        var li=$(button).parent().parent();
        li.prev().css("display","block");
        li.css("display","none");
    }
    
    <%--提交修改信息--%>
    function editCommit(button){
        if(!validate(button)){
            return;
        }
        var li=$(button).parent().parent();
        var name=$.trim(li.find("input[name='name']").val());
        var deliProvinceSid=li.find("select[class='provincelist']").val();
        var deliCitySid=li.find("select[class='citylist']").val();
        var address=$.trim(li.find("input[name='address']").val());
        var postcode=$.trim(li.find("input[name='postcode']").val());
        var tel=$.trim(li.find("input[name='tel']").val());
        var addressSID=li.find("input[name='addressSID']").val();
        $.ajax({
            url:'${ctx}/member/addressEdit.json',
            type: 'post',
            dataType: 'json',
            data:{'sid':addressSID,
                  'name':name,
                  'deliProvinceSid':deliProvinceSid,
                  'deliCitySid':deliCitySid,
                  'address':address,
                  'postcode':postcode,
                  'tel':tel},
            timeout: 30000,
            error: function(){
                $.popdialog(button,"address_edit_info","修改地址信息失败,请重试");
                return;
            },
            success: function(response){
                var result=response.result;
                var status=result.status;
                var message=result.message;
                $.popdialog(button,"address_del_info",message);
                if(status=='1'){
                   renderEdit(button);
                   hideEdit(button);
                }
                return;
            }
        });
    }
    
    <%--删除信息,提示--%>
    function del(button){
        $.popalert(button,"address_del_confirm",
                "该操作不能恢复，您确定要删除该地址信息吗?",doDel);
    }
    <%--删除信息--%>
    function doDel(button){
        var addressSID=$(button).prev().val();
        $.ajax({
            url:'${ctx}/member/addressDel.json',
            type: 'post',
            dataType: 'json',
            data:{'addressSID':addressSID},
            timeout: 30000,
            error: function(){
                $.popdialog(button,"address_del_info","删除地址信息失败,请重试");
                return;
            },
            success: function(response){
                var result=response.result;
                var status=result.status;
                var message=result.message;
                $.popdialog(button,"address_del_info",message);
                if(status=='1'){
                   $(button).parent().parent().parent().remove();
                }
                return;
            }
        });
    }
</script>

</head>

<body>
<%--面包屑内容开始--%>
<div id="breadcrumb">
	    <a href="${ctx}">首页</a><span>></span>我的上品<span>></span>管理地址簿
</div>
<%--面包屑内容结束--%>
<div style="width:950px;float:left">
    <%--左侧分类开始--%>
    <jsp:include page="myshopin_left.jsp"/>
    <%--左侧分类结束--%>
    <%--右侧分类开始--%>
	<div id="content-rightweihzi"  style="float:right">
	  <div id="content-right"  style="float:right">
    	<ul class="biaoge">
        	<li class="biaoge-top1">
                <strong style="color:#5050B5">管理地址薄</strong>
                <span onclick="addForm();"><img src="${images}/bt_s1-12.gif" style="cursor:pointer"/></span>
            </li>
        </ul>
        <ul class="biaogey2" style="display:none" id="addUL">
            <li >
                <p>收货人姓名：<input type="text" name="name" class='input_short'/></p>
                <p> <span>选择区域：</span>
                    <span>省份或直辖市：<select style="width:120px" class="provincelist"
                                    onchange="selectProvince(this)" >
                            <option value="">请选择</option>
                            <c:forEach items="${provincelist}" var="province">
                                 <option value="${province.sid}">${province.name}</option>
                            </c:forEach>
                        </select>
                        城市：<select style="width:120px" class="citylist" >
                            <option value="">请选择</option>
                        </select>
                    </span>
                </p>
                <p>收货地址：&nbsp;&nbsp;<input type="text" name="address" class='input_long'/></p>
                <p>邮编：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="postcode" class='input_short'/></p>
                <p>电话：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="tel" class='input_short'/></p>
                <p class="y2img" style="float:left">
                    <img src="${images}/bt_s1-10.gif" style="cursor:pointer" onclick="addCommit(this);"/>
                    <img src="${images}/bt_s1-5.gif" style="cursor:pointer" onclick="hideAdd(this);"/>
                </p>
            </li>
		</ul>
        <c:forEach items="${address_list}" var="item">
        <ul class="biaogey2">
            <li name="address_item_li">
				<p>收货人姓名：<span>${item.name}</span></p>
				<p>收货地址：<span>${item.fullAddress}</span></p>
				<p>邮编：<span>${item.postcode}</span></p>
				<p>电话：<span>${item.tel}</span></p>
				<p class="y2img" style="float:left">
                    <img src="${images}/bt_s1-6.gif" style="cursor:pointer" onclick="editForm(this)"/>
                    <input type="hidden" value="${item.sid}"/>
                    <img src="${images}/bt_s1-7.gif" style="cursor:pointer" onclick="del(this)"/>
                </p>
			</li>
            <li style="display:none">
                <input type="hidden" value="${item.sid}" name="addressSID"/>
                <p>收货人姓名：<input type="text" name="name" value="${item.name}" class='input_short'/></p>
                <p><span>选择区域：</span>
                    <span>省份或直辖市：<select style="width:120px"  class="provincelist"
                            onchange="selectProvince(this)" >
                            <option value="">请选择</option>
                            <c:forEach items="${provincelist}" var="province">
                                 <option value="${province.sid}" attr1='${province.sid}' attr2='${item.deliProvinceSid}'
                                         <c:if test="${province.sid==item.sid}">selected='true'</c:if>>${province.name}</option>
                            </c:forEach>
                        </select>
                        城市：<select style="width:120px" class="citylist" >
                            <option value="">请选择</option>
                        </select>
                    </span>
                </p>
                <p>收货地址：&nbsp;&nbsp;<input type="text" name="address" value="${item.address}" class='input_long'/></p>
                <p>邮编：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="postcode" value="${item.postcode}" class='input_short'/></p>
                <p>电话：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="tel" value="${item.tel}" class='input_short'/></p>
                <p class="y2img" style="float:left">
                    <img src="${images}/bt_s1-10.gif" style="cursor:pointer" onclick="editCommit(this);"/>
                    <img src="${images}/bt_s1-5.gif" style="cursor:pointer" onclick="hideEdit(this);"/>
                </p>
            </li>
        </ul>
        </c:forEach>
    </div>
    </div>             
    <%--右侧分类结束--%>
</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>
</body>
</html>
