<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<meta charset="utf-8">
<title>报名流程</title>
<link href="http://images.shopin.net/css/reset.css" rel="stylesheet" type="text/css">
<link href="http://images.shopin.net/css/master.css" rel="stylesheet" type="text/css">
<style>
img{ vertical-align:middle}
.tc { text-align:center}
#header, .backgroundffffff { width:950px; margin:0 auto}
#page { width:auto; position:static;}
/*dialog*/
.dialog{ display:none; overflow:hidden; width:314px; padding:10px 15px 20px; position:absolute; z-index:1000; background:#fff; border:2px solid #c8c8c8\9; border-radius:10px; box-shadow:0 0 10px #666;}
#mask{ display:none; width:100%; height:100%; position:absolute; z-index:999; top:0px; left:0px; background:#000; opacity:.3; filter:alpha(opacity=30);}
.dialogLine { height:1px; line-height:1px; font-size:0; overflow:hidden; background:#acacac;}
.dialogTitle { height:38px; font:normal 16px/38px 'microsoft yahei'; color:#4d4d4d}
.dialogTitle a { float:right; width:14px; height:14px; margin-top:8px; text-align:center; font:normal 12px/14px 'Century'; border:1px solid #dcdcdc; color:#acacac}
.dialogTitle a:hover, .dialogTitle a:visited { text-decoration:none; color:#acacac}
.dialogContact { padding:10px 8px}
#dialogTips { overflow:hidden; height:25px; line-height:25px; padding:0 10px; text-align:center; background:#ffd2c0; border:1px solid #ffbd9e; color:#f73600}
/*dialogForm*/
#dialogForm { padding-bottom:10px}
#dialogForm li { line-height:27px; margin-top:15px; color:#4d4d4d}
#dialogForm label.formLabel { width:88px; display:inline-block; *display:inline; *zoom:1; text-align:right; vertical-align:top}
#dialogForm .coll { display:inline-block; *display:inline; *zoom:1;}
#dialogForm .coll label { margin-right:15px}
#dialogForm .coll label input { margin-right:5px}
#dialogForm .coll select { width:120px; padding:3px 0}
#dialogForm input { vertical-align:middle}
.dialogText { width:204px; height:27px; padding-left:3px; font:normal 14px/27px simsun; border:1px solid #d0d0d0}
.dialogBtn { width:113px; height:36px; font:18px/36px 'microsoft yahei'; cursor:pointer; border:none; background:url(http://images.shopin.net/images/dialogbtn.png); color:#fff}
#dialogForm .tips { display:none; color:#f00}
#dialogForm .short { width:96px; margin-right:8px}
#dialogForm .highlight { color:#fa3218}
#dialogForm .findpassword { margin-left:10px}
.sendYZM { width:100px; height:27px; font:12px/27px 'simsun'; cursor:pointer; border:1px solid #c9d1e8; background:url(http://images.shopin.net/images/dialogbtn.png) -4px -38px ; color:#3f5593;}
.success { padding:40px 0; text-align:center;}
.closeBtn { width:113px; height:36px; font:18px/36px 'microsoft yahei'; cursor:pointer; border:none; background:url(http://images.shopin.net/images/dialogbtn.png) 0 -37px no-repeat; color:#3f5593}
.dialogTips { display:none}
.t { font:600 14px/40px simsun; color:#4d4d4d}
</style>
<script src="http://images.shopin.net/js/jquery/jquery132min.js"></script>
<script>
$(function(){
    $(".signupBtn").live('click',function(){
	    $.ajax({
		    url:'${ctx}/headerinfo.json',
			type:'post',
    		data:{},
			timeout: 30000,
                error: function(){
                    return;
                },
			success:function(response){
			    var isLogin=response.isLogin;
				 if(isLogin=='1'){
				   var url = '${ctx}/apply.html';
				   window.location.href=url;
				 }else{
				   var url = '${ctx}/login.html?forward=http://www.shopin.net/apply.html';
				   window.location.href=url;
				 }
			 }
		
		
		});
	 
	 
	});

    $(".close").click(function(){
	$(".dialog,#mask").hide();
	
});
// 居中
});
function center(obj) {
	var screenWidth = $(window).width(), screenHeight = $(window).height();	//当前浏览器窗口的宽高
	var scrolltop = $(document).scrollTop();	//获取当前窗口距离页面顶部高度
	var objLeft = (screenWidth - obj.width())/2 ;
	var objTop = (screenHeight - obj.height())/2 + scrolltop;
	obj.css({left: objLeft + 'px', top: objTop + 'px','display': 'block'});
};
//create by kongm 0418 start
<%--发送验证码短信--%>
function sendVerifyCode(button) {
    var telephone = $.trim($('#phonenumber').val());

    if (telephone == '' || !/^1(3|5|8)[0-9]{9}$/.test(telephone)) {
        $('#dialogTips').text('手机号码填写不正确');
        //$('#verifycode').attr('disabled', 'disabled');
        return;
    }

    $.ajax({
                url:'${ctx}/sendPhoneCode.json',
                type:'post',
                dataType:'json',
                data:{
                    'phonenumber':telephone
                },
                timeout:30000,
                error: function() {
                    $.popdialog(button, "phone_code", '发送验证码失败请重试');
                    return;
                },
                success:function(response) {
                    var result = response.result;
                    var status = result.status;
                    var message = result.message;
                    if (status == "1") {
                        $('#dialogTips').text(message);

                    } else {
                        $('#dialogTips').text(message);
                    }

                }


            });

}

function verifyUsername(button) {
    var inputVal = $.trim($('#name').val());
    if (inputVal == '') {
        $('#dialogTips').text('接收人姓名未填写');
        return;
    } else {
        $('#dialogTips').text('');
        return;
    }
}
<%--验证手机号码合法性--%>
function verifyPhoneNumber(button) {
    var inputVal = $.trim($('#phonenumber').val());
    //$('#phonenumber').val() ==''||!/^1(3|5|8)[0-9]{9}$/.test($('#phonenumber').val())
    if (inputVal == '' || !/^1(3|5|8)[0-9]{9}$/.test(inputVal)) {
        $('#dialogTips').text('手机号码填写不正确');
        //$('#verifycode').attr('disabled', 'disabled');
        return;
    } else {
       // $('#verifycode').attr('disabled', '');
        $('#dialogTips').text('');
    }

}

<%--验证验证码短信--%>
function verifyPhoneCode(button) {
    var inputVal = $.trim($('#phoneCode').val());
    $.ajax({
                url:'${ctx}/verifyPhoneCode.json',
                type:'post',
                dataType:'json',
                data:{
                    'phoneCode':inputVal
                },
                timeout:30000,
                error: function() {
                    $('#hasVerify').val(false);
                    $.popdialog(button, "phone_code", '验证码错误');
                    return;
                },
                success:function(response) {
                    var result = response.result;
                    var status = result.status;
                    var message = result.message;
                    if (status == '1') {
                        $('#dialogTips').text(message);
                        $('#hasVerify').val(true);
                    } else {
                        $('#dialogTips').text(message);
                        $('#hasVerify').val(false);
                    }

                }

            });

}




    /*校验报名信息是否填写正确*/
    function  validateApply(button){
        if($('#name').val() == ''){
            $('#dialogTips').text('请填写姓名');
            return false;
        }
        if($('#phonenumber').val() == '' || !/^1(3|5|8)[0-9]{9}$/.test($('#phonenumber').val())){
            $('#dialogTips').text('手机号填写不正确');
            return false;
        }
        if ($('#hasVerify').val() == 'false') {
             $('#dialogTips').text('验证码验证失败');
             return false;
         }
        if($(":radio[name='address'][checked]").val()==''){
             $('#dialogTips').text('请选择所在地');
            return false;
        }
        if($('#source option:selected').val()==''){
             $('#dialogTips').text('请选择来源');
            return false
        }

        return true;

    }



    function commitapply(button){
        if(!validateApply(button)){

            return;
        }

        var email = $('#email').val();
        var memname = $('#name').val();
        var telephone = $('#phonenumber').val();
        var address = $(":radio[name='address'][checked]").val();
        var source = $('#source option:selected').val();
        $.ajax({
                    url:'${ctx}/saveapply.json',
                    type: 'post',
                    dataType: 'json',
                    data:{
                        'email':email,
                        'name':memname,
                        'telephone':telephone,
                        'address':address,
                        'source':source
                    },
                    timeout: 30000,
                    error: function() {
                        $('#dialogTips').text('报名失败');
                        return;
                    },
                    success: function(response) {
                        var result = response.result;
                        var status = result.status;
                        var message = result.message;
                        if (status == '1') {
                            $('#dialogSignup').hide();
                            center($('#signupSuccess'))
                        }

//                $.popdialog(button,"save_person_info",message);
                        return;
                    }


                });

    }



</script>
 <c:if test="${islogin=='1'}">
   <script type="text/javascript">
           $(function(){
                 $('#mask').show();
             	$("#mask").css("height",$(document).height());
	  //$("#mask").css("width",$(window).width());
                center($('#dialogSignup'));
                $();



           });


   </script>

 </c:if>


</head>

<body>
<div id="page" style="height:1800px">
<a class="signupBtn" href="javascript:void(0);">我要报名登录</a><br>
<a class="signupBtn" href="javascript:void(0);" >我要报名</a>
<!--登录注册-->
<div class="dialog" id="dialogLogin">
	<div class="dialogTitle"><a class="close" href="javascript:void(0);" title="关闭">X</a><h3>登录\注册</h3></div>
	<p class="dialogLine"></p>
	<div class="dialogContact tc">
		<p class="t">参与本活动需登录上品折扣网。</p>
		<ul id="dialogForm">
			<li><div class="coll"><input type="button" class="dialogBtn" value="登&nbsp;录"></div></li>
		</ul>
	</div>
</div>
<!--我要报名-->
<div class="dialog" id="dialogSignup">
	<div class="dialogTitle"><a class="close" href="javascript:void(0);" title="关闭">X</a><h3>请填写报名信息</h3></div>
	<p class="dialogLine"></p>
	<div class="dialogContact">
		<p id="dialogTips"></p><!---提示信息 默认关闭--->
		<ul id="dialogForm">
             <input type="hidden" id="hasVerify" value="false"/>
			<li><label class="formLabel">注册邮箱：</label><div class="coll"><input type="text" class="dialogText" name="email" id="email" value="${member.memEmail}" disabled="true"></div></li>
			<li><label class="formLabel">姓　　名：</label><div class="coll"><input type="text" class="dialogText" name="username" id="name"  onblur="verifyUsername(this);"/></div></li>
			<li><label class="formLabel">手　　机：</label><div class="coll"><input type="text"  name="telephone" id="phonenumber"  class="dialogText short" onblur="verifyPhoneNumber(this);"/><input class="sendYZM" type="button" value="发送验证码" id="verifycode" onClick="sendVerifyCode(this);"></div></li>
			<li><label class="formLabel">验&nbsp;证&nbsp;码：</label><div class="coll"><input type="text" class="dialogText short" name="verifyCode" id="phoneCode" onblur="verifyPhoneCode(this);" /></div></li>
			<li><label class="formLabel">所&nbsp;在&nbsp;地：</label><div class="coll"><label><input type="radio" name="address" value="0" checked="true">北京</label><label><input type="radio" name="address" value="1">外埠</label></div></li>
			<li><label class="formLabel">获取方式：</label><div class="coll"><select id="source"><option>请选择</option><option value="0">微信</option><option value="1">微博</option><option value="2">论坛</option><option value="3">搜索</option><option value="4">网络新闻</option><option value="5">百度知道等问答媒体</option><option value="6">其它网站</option><option value="7">店内明示</option><option value="8">短信</option><option value="9">宣传海报</option><option value="10">地铁广告</option><option value="11">地铁广告</option><option value="12">电梯广告</option><option value="13">户外广告</option><option value="14">朋友推荐</option><option value="15">其它</option></select></div></li>
		</ul>
	</div>
	<p class="dialogLine"></p>
	<div class="dialogContact">
		<ul id="dialogForm"><li><label class="formLabel"></label><div class="coll"><input type="button" class="dialogBtn signupSuccess" value="我要报名" onclick="commitapply(this);"></div></li></ul>
	</div>
</div>
<!--报名成功-->
<div class="dialog" id="signupSuccess">
	<div class="dialogTitle"><a class="close" href="javascript:void(0);" title="关闭">X</a><h3>报名成功</h3></div>
	<p class="dialogLine"></p>
	<div class="dialogContact">
		<div class="success"><img src="images/success.png"></div>
	</div>
	<p class="dialogLine"></p>
	<div class="dialogContact">
		<ul id="dialogForm"><li><label class="formLabel"></label><div class="coll"><input type="button" class="closeBtn close" value="关闭"></div></li></ul>
	</div>
</div>
<div id="mask"></div>
</div>
</body>
</html>

