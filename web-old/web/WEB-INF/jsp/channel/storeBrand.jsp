<%--
  Description: Sub Channel[value buying]
  User: guansq
  Date: 2012-1-13
  Time: 13:01:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
	<title>购精明-聚划算，闪购，限时抢，团购，网上购物,名品打折网,品牌折扣网，女装，女鞋，内衣，童装，运动，上品折扣网shopin.net，商场名牌1-3折，专柜正品，品质保障</title>
    <link rel="stylesheet" href="${css}/freetab.css"/>
    <link rel="stylesheet" href="${css}/brand-stores.css"/>
    <link href="${css}/mycart.css" rel="stylesheet" type="text/css"/>
    <link href="${css}/reset.css" rel="stylesheet" type="text/css" />
	<link href="${css}/slideshow.css" rel="stylesheet" type="text/css" />
	<link href="${css}/storage.css" rel="stylesheet" type="text/css" />
	<link href="${css}/master.css" rel="stylesheet" type="text/css" />
	<script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>
	<link href="${css}/facebox.css" media="screen" rel="stylesheet" type="text/css"/>
	<link href="${css}/dingyue.css" media="screen" rel="stylesheet" type="text/css"/>
	<script src="${js}/facebox.js" type="text/javascript"></script>
	<script src="${js}/jquery/jquery.json-2.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var _key='';
		function show(key) {
			$(".abc-a").hide();
			$("#divBrand_" + key).fadeIn();
            _key=key;
		}
        __key = "";
		$(document).ready(function() {
			$('a[rel*=facebox]').facebox({
		        loadingImage : '${images}/loading.gif',
		        closeImage   : '${images}/ad/03251.gif'
		    });

		/*	$("ul.st_brandlist:each>li").each(function(){
				var idx = $(this).parent().children("li").index($(this));
				$(this).children(":checkbox").click(function(e){
					var flag = $(this).attr("checked");
					if(!flag){
						var rc = $("ul.st_brandlist:last").children("#idx"+idx+_key);
						rc.remove();
					}else{
						var imgTxt = $(this).parent().clone(true).attr("id","idx"+idx+_key);
						imgTxt.children(":checkbox").attr("checked",true);
						$("ul.st_brandlist:last").append(imgTxt);
					}
					if($("ul.st_brandlist:last>li").length>0){
						$("ul>.st_brand_no").hide();
					}else{
						$("ul>.st_brand_no").show();
					}
					e.stopPropagation();
				});
                _key='';
			});*/
        $("ul.st_notice_list:eq(0)>li,ul.st_brand_list>li").each(function() {
            var idx = $(this).parent().children("li").index($(this));
            $(this).children(":checkbox").click(function(e) {
                var flag = $(this).attr("checked");
                if (!flag) {
                    var rc = $("ul>.st_brand_no").parent().children("#idx" + $(this).parent().attr('id')+_key);
                    rc.remove();
                } else {
                    var imgTxt = $(this).parent().clone().attr("id", "idx" + $(this).parent().attr('id')+_key);
                    imgTxt.click(function(e) {
                        var flag = $(this).attr("checked");
                        if (!flag) {
                            $(this).remove();
                            var liId = $(this).attr('id');
                            $('#' + liId.substr(3, liId.length - 2)).find("input[type='checkbox']").attr('checked', false);
                        }
						if($("ul>.st_brand_no").parent().find(":checked").length>0){
							$("ul>.st_brand_no").hide();
						} else {
							$("ul>.st_brand_no").show();
						}
                    });
                    imgTxt.children(":checkbox").attr("checked", true);
                    $("ul>.st_brand_no").parent().append(imgTxt);
                }
                if ($("ul.st_notice_list:eq(0) :checked,ul.st_brand_list:eq(0) :checked").length > 0) {
                    $("ul>.st_brand_no").hide();
                } else {
                    $("ul>.st_brand_no").show();
                }
                e.stopPropagation();
            });
        });

		});

        function doSubmitCustomerBrand(){
            var email = $.trim($("#email").val());
            var handPhone=$.trim($("#handPhone").val());
            var brands=$.trim($("#custombrands").val());
            var arr=null
            var phonereg = /^(((13[0-9]{1})|(18[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
           var valid = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(email);
            if(!valid){
                alert("邮箱地址不正确");
                $("#handPhone").attr("value","");
                return false;
            }
            if(handPhone==""||!phonereg.test(handPhone)){
                alert("手机号码填写不正确");
                $("#custombrands").attr("value","");
                return false;
            }
            if(brands==""||brands=="请输入品牌名称，不同品牌之间以英文字母逗号区隔"){
                alert("请填写品牌名称");
                return false;
            }else{
               arr = brands.split(",");
            }
            var user=new Object();
            user.email = email;
            user.handPhone=handPhone;
            var brandList = new Array();

            for(var i=0;i<arr.length;i++){
                var brand = new Object();
                brand.brandName = $.trim(arr[i]);
                brand.brandSid = '';
                if(brand.brandName!=""){
                  brandList.push(brand);
                }
            }
           user.brands=brandList;
             $.ajax({
                url:"/bd/lovebrandselect.json",
                dataType: 'json',
                type:'post',
                 data:{
                     'email':email,'handPhone':handPhone
                    ,'brands':$.toJSON(brandList)
                 },
                success: function(response){
                    var rs =response.result;
                    if(rs!=null&&rs.status==-1){
                        alert(rs.message);
                    }else if(status==0){
                        alert("提交成功，感谢您的参与！");
						window.location.href="/channel-store.html";
                    }
                  },
                  error:function(response){
                     alert(response)
                  }
                  });
        }
    //-------------------------------------------
            function doSubmitSelectBrand(){

           var list=$("#bd_selected_brand").children("li");
           var brandList = new Array();
            for(var i=0;i<list.length;i++){
                var brand = new Object();
                brand.brandName = list.eq(i).attr("name");
                brand.brandSid = list.eq(i).attr("sid");
                brandList.push(brand);
            }

            if(brandList.length<1){
                alert("请选择您喜爱的品牌！");
                return false;
            }
            var email = $.trim($('#facebox input[type=text]:eq(1)').val());
            var handPhone=$.trim($('#facebox input[type=text]:eq(2)').val());
            var userName=$.trim($('#facebox input[type=text]:eq(0)').val());
            var phonereg = /^(((13[0-9]{1})|(18[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
            var valid = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(email);
            if(userName==""){
                alert("用户名不能为空！");
                return;
            }
            if(!valid){
                alert("邮箱地址不正确");
                return false;
            }
            if(handPhone==""||!phonereg.test(handPhone)){
                alert("手机号码填写不正确");
                return false;
            }

             $.ajax({
                url:"/bd/lovebrandselect.json",
                dataType: 'json',
                type:'post',
                 data:{
                     'email':email,'handPhone':handPhone,'userName':userName
                    ,'brands':$.toJSON(brandList)
                 },
                success: function(response){
                    var rs =response.result;
                    if(rs!=null&&rs.status==-1){
                        alert(rs.message);
                    }else if(status==0){
                        alert("提交成功，感谢您的参与！");
						window.location.href="/channel-store.html";
                    }
                  },
                  error:function(response){
                     alert(response)
                  }
                  });
        }

	</script>
</head>
<body>
	<div class="st_brand">
		<ul  class="background-nofont hd">
			<li class="b-left"></li>
			<li class="b-font" style="color:#FFFFFF">活动通知我</li>
			<li class="b-right"></li>
		</ul>
		<div class="bd">
			<ul class="st_brandlist st_boxlist01 st_notice_list">
				<c:forEach items="${topBrands}" var="item">
					<li id="${item.sid}_bd" sid="${item.sid}" name="${item.brandName}"><a target="_blank" href="${ctx}/brands/${item.sid}.html"><img src="${images}${item.pictureUrl}" alt="${item.brandName}"/></a><input type="checkbox" /></li>
				</c:forEach>
			</ul>
		</div>
		<div class="st_brand_nav">
			品牌导航：
			<c:forEach var="brand" items="${allbrands}"><a href="javascript:show('${brand.key}')">${brand.key}</a></c:forEach>
			<c:forEach var="brand" items="${allbrands}">
				<div class="abc-a" style="display:none;" id="divBrand_${brand.key}">
					<ul class="st_brandlist st_boxlist01 st_brand_list">
						<c:forEach var="p" items="${brand.value}" varStatus="status">
							<li id="${p.sid}_all" sid="${p.sid}" name="${p.brandName}"><a target="_blank" href="${ctx}/brands/${p.sid}.html"><img src="${images}${p.pictureUrl}" alt="${p.brandName}"/></a><input type="checkbox" /></li>
						</c:forEach>
					</ul>
				</div>
			</c:forEach>
		</div>
		<div class="bd st_boxlist01">
			<ul class="st_brandlist st_brand_min_height"  id="bd_selected_brand">
				<h5>您已选择的品牌：</h5>
				<p class="st_brand_no">您暂未选择有活动时需要通知您的品牌</p>
			</ul>
			<div class="st_submit"><a href="#mode" rel="facebox"><img src="http://images.shopin.net/images/st_1.gif" /></a></div>
		</div>
	</div>
	<div class="st_hope">
		<h5>您希望在上品折扣买到哪些品牌？</h5>
		<%--<form id="custombrand">--%>
			<textarea class="st_hope_textarea" id="custombrands" value="请输入品牌名称，不同品牌之间以英文字母逗号区隔" value="请输入品牌名称，不同品牌之间以英文字母逗号区隔" onfocus="if(this.value == '请输入品牌名称，不同品牌之间以英文字母逗号区隔')this.value=''" onblur="if(this.value == '')this.value='请输入品牌名称，不同品牌之间以英文字母逗号区隔'">请输入品牌名称，不同品牌之间以英文字母逗号区隔</textarea>
			<button onclick="doSubmitCustomerBrand()"><img src="http://images.shopin.net/images/st_1.gif" /></button>
			<label>您的E-MAIL：<input class="st_hope_text" type="text" id="email"/></label><label>您的手机号：<input class="st_hope_text" type="text" id="handPhone"/></label>
		<%--</form>--%>
	</div>
	<div id="mode" style="display:none;">
        <ul class="dy1-1">
            <li class="dy1-title"></li>
            <li class="dy1-from">
            	<table cellpadding="5" cellspacing="0" style="margin:0 auto;width:400px;">
            		<tr>
            			<td style="height:60px;">姓名：</td>
            			<td><input type="text" id="user_name" style="width:200px;height:25px;" value=""/></td>
            		</tr>
            		<tr >
            			<td style="height:60px;">邮箱：</td>
            			<td><input type="text" style="width:200px;height:25px;" id="u_email"/></td>
            		</tr>
            		<tr  >
            			<td style="height:60px;">手机号码：</td>
            			<td><input type="text" style="width:200px;height:25px;" id="u_phone"/></td>
            		</tr>
            		<tr>
            			<td colspan="2" style="height:100px;text-align:center;">
            				<a style="font-weight:bold;padding:7px;background-color:#ddd;hover:red;text-decoration:none;cursor:pointer;" onclick="doSubmitSelectBrand()">确&nbsp;&nbsp;&nbsp;&nbsp;认</a>
            			</td>
            		</tr>
            	</table>
            </li>
        </ul>
    </div>
<script type="text/javascript">

</script>
</body>
</html>