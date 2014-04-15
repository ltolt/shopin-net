<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<title>0元购</title>
<link href="http://images.shopin.net/s/css/reset.css" rel="stylesheet">
<link href="http://images.shopin.net/s/css/layout.css" rel="stylesheet">
<link href="http://images.shopin.net/s/css/master.css" rel="stylesheet">
<style>
body{background-image:url(about:blank);background-attachment:fixed}
img { vertical-align:top;}
.S_box { padding-bottom:40px; background:#f04e87 url(http://images.shopin.net/s/images/2013lingyuangou/bg.jpg) no-repeat center top}
.S_banner li { height:330px}
.top1 { background:url(http://images.shopin.net/s/images/2013lingyuangou/top1.jpg) no-repeat center top}
.top2 { background:url(http://images.shopin.net/s/images/2013lingyuangou/top2.jpg) no-repeat center top}
.S_rule { width:850px; height:183px; padding:0 70px 0 80px; margin:0 auto; font:600 14px/18px 'microsoft yahei'; background:url(http://images.shopin.net/s/images/2013lingyuangou/bg01.png) no-repeat center top; color:#fff}
.S_rule h6 { margin-bottom:10px; font-size:18px}
.S_rule li { padding:4px 0; list-style:decimal inside}
/*popBox*/
#popBox{ display:none; width:669px; overflow:hidden; z-index:999;}
#mask{ display:none; width:100%; height:100%; position:absolute; top:0px; left:0px; background:#000; opacity:.5; filter:alpha(opacity=50);}
.wrapBar { height:160px; background:url(http://images.shopin.net/s/images/2013lingyuangou/dialogBox.png) no-repeat 0 0}
.wrapClose { float:right; margin:85px 30px 0 0; width:17px; height:17px; background:url(http://images.shopin.net/s/images/2013lingyuangou/dialogIcon.png) no-repeat 0 0}
.wrapClose:hover { width:17px; height:17px; background:url(http://images.shopin.net/s/images/2013lingyuangou/dialogIcon.png) no-repeat -17px 0}
.wrapBody { padding:0 20px 40px 70px; background:url(http://images.shopin.net/s/images/2013lingyuangou/dialogBox.png) no-repeat 0 bottom}
.wrapIn { width:530px; margin:0 auto}
.wrapIn h2 { margin-top:-10px; zoom:1; font:600 24px/44px 'microsoft yahei'; text-align:center; color:#529319}
.wrapIn h3 { font:600 36px/60px 'microsoft yahei'; text-align:center; color:#d91337}
.wrapIn h4 { font:600 18px/44px 'microsoft yahei'; text-align:center; color:#529319}
.wrapIn h5 { margin-top:-10px; zoom:1; font:600 18px/44px 'microsoft yahei'; margin-bottom:30px; text-indent:10px; border-bottom:solid 1px #d5d5d5; color:#529319}
.wrapForm li { line-height:34px; margin-bottom:12px; font:600 12px/34px 'microsoft yahei'; color:#529319}
.wrapForm label.formLabel { width:95px; padding-right:15px; display:inline-block; *display:inline; *zoom:1; text-align:right; vertical-align:top; font-size:16px;}
.wrapForm .coll { display:inline-block; *display:inline; *zoom:1;}
.wrapForm input { vertical-align:middle}
.wrapForm .fontText { width:250px; height:28px; padding:3px 5px; margin-right:10px; font:normal 18px/28px 'microsoft yahei'; border:solid 1px #338426; color:#338426}
.wrapForm .submitBtn {display:inline-block;*display:inline;*zoom:1;width:163px;height:61px;cursor:pointer;overflow:visible;text-align:center;font:500 24px/62px 'microsoft yahei';background:url(http://images.shopin.net/s/images/2013lingyuangou/dialogIcon.png) no-repeat 0 -80px;border:none;color:#fff}
.wrapForm .cancelBtn {display:inline-block;*display:inline;*zoom:1;width:163px;height:61px;cursor:pointer;overflow:visible;text-align:center;font:500 24px/62px 'microsoft yahei';background:url(http://images.shopin.net/s/images/2013lingyuangou/dialogIcon.png) no-repeat 0 -19px;border:none;color:#fff}
.submitBtn:hover, .cancelBtn:hover {_color:#fff}
.wrapForm .tc { margin-top:40px}
.wrapForm .mes { display:; color:#f00}
.wrapForm .right { display:inline-block; *display:inline; *zoom:1; width:18px; height:21px; vertical-align:middle; background:url(http://images.shopin.net/s/images/2013lingyuangou/dialogIcon.png) no-repeat -34px 3px}
.wrapForm .wrong { display:inline-block; *display:inline; *zoom:1; vertical-align:middle; color:#d91337}
</style>
</head>

<body>
<div class="S_box tc">
<div class="S_banner">
    <ul>
      <li class="top1"></li>
      <li class="top2"></li>
    </ul>
</div>
<img src="http://images.shopin.net/s/images/2013lingyuangou/img01.png" width="1000" height="305" usemap="#Map">
<map name="Map">
  <area shape="rect" class="clickMe" coords="419,252,594,302" href="#">
</map>
<img src="http://images.shopin.net/s/images/2013lingyuangou/img02.png" width="1000" height="236">
<div class="S_rule tl">
    <h6>活动细则：</h6>
    <ul>
    	<li>活动报名时间：12月18日 00：00-12月24日 23：59，同一手机号码仅可参与一次报名；</li>
    	<li>活动将于12月25日随机抽取5名会员，每人获得2000元旅游基金（携程网礼品卡），中奖结果将于活动页及网站首页公告栏公布；</li>
    	<li>公布中奖结果后的3个工作日内，上品折扣网客服人员将电话通知中奖用户中奖信息，如果中奖用户所留手机号码有误，或客服人员与<br>　　5个工作日内无法同中奖用户取得联系，则视为放弃中奖资格；</li>
    	<li>奖品不可折现不可转让；</li>
    	<li>在法律许可的合法范畴内，本活动最终解释权归上品折扣所有。</li>
    </ul>
</div>
<img src="http://images.shopin.net/s/images/2013lingyuangou/img03.png" width="1000" height="317">
</div>
<script src="http://images.shopin.net/s/js/jquery132min.js"></script>
<!--登录注册-->
<div id="popBox" class="loginBox">
	<div class="wrapBar">
        <a class="wrapClose" href="javascript:void(0);"></a>
    </div>
    <div class="wrapBody">
        <div class="wrapIn">
        	<h2>请您先完成 登录/注册 <br>方可参与报名</h2>
            <div class="wrapForm">
            	<ul>
               <li class="tc">
                <a href="${ctx}/login.html?forward=http://www.shopin.net/help/lingyuangou.html" class="submitBtn loginBtn" target="_blank">登&nbsp;录</a>
                <a href="${ctx}/goRegister.html?forward=http://www.shopin.net/help/lingyuangou.html" class="cancelBtn ml" target="_blank">注&nbsp;册</a>
                </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--报名-->
<div id="popBox" class="signUp">
	<div class="wrapBar">
        <a class="wrapClose" href="javascript:void(0);"></a>
    </div>
    <div class="wrapBody">
        <div class="wrapIn">
            <h5>填写一下信息，参与报名</h5>
            <div class="wrapForm">
            	<ul>
                	<li><label class="formLabel">真实姓名</label><div class="coll"><input id="realName" class="fontText" type="text" value="请输入您的真实姓名"><span class=""></span></div></li>
                	<li><label class="formLabel">手机号码</label><div class="coll"><input id="mobile"  class="fontText" type="text" value="请输入您的手机号"><span class=""></span></div></li>
                	<li><label class="formLabel">居住城市</label><div class="coll"><input id="city"   class="fontText" type="text" value="请输入您的所在城市"><span class=""></span></div></li>
                	<li><label class="formLabel"></label><div class="coll"><input class="cancelBtn successBtn" type="submit" value="提&nbsp;交"></div></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--成功-->
<div id="popBox" class="successBox">
	<div class="wrapBar">
        <a class="wrapClose" href="javascript:void(0);"></a>
    </div>
    <div class="wrapBody">
        <div class="wrapIn" style="height:160px">
            <h3>恭喜您报名成功！</h3>
            <h4>本活动将于12月25日于活动页公布中奖信息。</h4>
        </div>
    </div>
</div>


<!--成功-->
<div id="popBox" class="failBox">
	<div class="wrapBar">
        <a class="wrapClose" href="javascript:void(0);"></a>
    </div>
    <div class="wrapBody">
        <div class="wrapIn" style="height:160px">
            <h3>报名失败！</h3>
            <h4><span id="errorInfo">您的手机号已经被注册！</span></h4>
        </div>
    </div>
</div>


<div id="mask"></div>
<script>
// 居中
function center(obj) { 
	var windowWidth = document.documentElement.clientWidth;   
	var windowHeight = document.documentElement.clientHeight;   
	var popupHeight = $(obj).height();   
	var popupWidth = $(obj).width();
	if (window.XMLHttpRequest) {
		$(obj).css({
			display:"block",
			position: "fixed",   
			top: (windowHeight-popupHeight)/2,
			left: (windowWidth-popupWidth)/2
		});  
	}else {
		$(obj).css({
			display:"block",
			position: "absolute",   
			top: (windowHeight-popupHeight)/2+$(document).scrollTop(),
			left: (windowWidth-popupWidth)/2
		});  
	}
}
//遮罩层
function lockScreen(){
var w = $(window).width();
var h = $(document).height();
$("#mask").css({height:h}).show();
};
//点击事件
$(function(){
	$(".clickMe").click(function(){
		lockScreen();
		openActivePage();
	});
	
    
	$(".successBtn").click(function(){
		regActive();
	});
	//关闭弹窗
	$(".wrapClose").click(function(){
		$(".loginBox").hide();
		$(".successBox").hide();
		$(".failBox").hide();
		$(".signUp").hide();
		
		$("#mask").hide();
	});
});
//获取焦点删除初始文字
$(function(){
	$('input:text').each(function(){
		var txt = $(this).val();
		$(this).focus(function(){
			if(txt === $(this).val()) $(this).val("");
		}).blur(function(){
			if($(this).val() == "") $(this).val(txt);
		});
	});
});
</script>


<script type="text/javascript">
<!--
<%--填写报名信息 --%>
function openActivePage(){
	    
		 <%--判断用户是否登录进行不同处理--%>
	     $.ajax({
	         url:'${ctx}/headerinfo.json',
	         type: 'post',
	         dataType: 'json',
	         data:{},
	         timeout: 30000,
	         error: function(){
	             return;
	         },
	         success: function(response){
	             var isLogin=response.isLogin;
	             <%--处理登lu后的显示--%>
	             if(isLogin=='1'){   
	            	 initReginfo();
	            	 center($(".signUp"));
	               
	             }else{
	            	 center($(".loginBox"));
	             }
	             return;
	         }
	     });

	
}



//提交活动内容
function regActive(){
	var realName=$("#realName").val().trim();
	var mobile=$("#mobile").val().trim();
	var city=$("#city").val().trim();
	//提示信息输出
	var realNameFlag=checkRealName(realName);
	var mobileFlag=checkMobile(mobile);
	var cityFlag=checkCity(city);
	if(realNameFlag&&mobileFlag&&cityFlag){
		//校验通过
	 <%--保存注册信息--%>
	   $.ajax({
	       url:'${ctx}/activeInfo.json',
	       type: 'post',
	       dataType: 'json',
	       data:{"realName":realName,"mobile":mobile,"city":city},
	       timeout: 30000,
	       error: function(){
	           return;
	       },
	       success: function(response){
	           var isLogin=response.isLogin;
	           var reason=response.reason;
	           var success=response.success;
	           <%--处理登lu后的显示--%>
	           if(isLogin=='1'){   
	          	 if(success==true){
	          		//注册成功提示
	          		$(".signUp").hide();
	          		initReginfo();
	        		center($(".successBox"));
	        		setTimeout(function(){
	        			$(".successBox").hide();
	        			$("#mask").hide();
	        		},3000);
	          	 }else{
	          	    //注册失败提示
	          		$(".signUp").hide();
	          		$("#errorInfo").html(reason);
	        		center($(".failBox"));
	          	 }
	             
	           }else{
	        	   //未登录弹出登录提示
	          		$(".signUp").hide();
	          	  
	        	   center($(".loginBox"));
	           }
	           return;
	       }
	   });
		       
	}else{
		return ;
	}

}

/**
 * 成功后初始化注册信息
 */
function initReginfo(){
		$("#realName").val("请输入您的真实姓名");
		$("#city").val("请输入您的所在城市");
		$("#mobile").val("请输入您的手机号");
		$("#realName").parent().children("span").attr("class","");
		$("#realName").parent().children("span").html('');
		$("#city").parent().children("span").attr("class","");
		$("#city").parent().children("span").html('');
		$("#mobile").parent().children("span").attr("class","");
		$("#mobile").parent().children("span").html('');
	
}




//校验真实姓名
function checkRealName(realName){
	//对真实姓名进行验证
	if(realName==""||realName=="请输入您的真实姓名"){
		$("#realName").parent().children("span").attr("class","mes wrong");
		$("#realName").parent().children("span").html("请输入您的真实姓名!");
	    return false ;
	}
	 if(!(/^[\u4e00-\u9fa5]+$/i).test(realName)){  
		 $("#realName").parent().children("span").attr("class","mes wrong");
		 $("#realName").parent().children("span").html('请输入中文姓名！');
	        return false;
	     }
	 if(realName.length>50){    
		 $("#realName").parent().children("span").attr("class","mes wrong");
		 $("#realName").parent().children("span").html('姓名过长！');
	        return false;
	  }

	 $("#realName").parent().children("span").attr("class","mes right");
	 $("#realName").parent().children("span").html('');
	 return true;
	  
}

//校验手机号
function checkMobile(mobile){
	//对手机号进行验证 
	if(mobile==""){
		$("#mobile").parent().children("span").attr("class","mes wrong");
		$("#mobile").parent().children("span").html("手机号不能为空!");
	    return false ;
	}
	
	if(!(/^1\d{10}$/).test(mobile)){ 
		$("#mobile").parent().children("span").attr("class","mes wrong");
		$("#mobile").parent().children("span").html('请输入正确的手机号码！');
      return false ;
	  }
	$("#mobile").parent().children("span").attr("class","mes right");
	$("#mobile").parent().children("span").html('');
	 return true;
	  
}

//校验城市信息
function checkCity(city){
	//对城市信息进行验证 
	if(city==""||city=="请输入您的所在城市"){
		$("#city").parent().children("span").attr("class","mes wrong");
		$("#city").parent().children("span").html("请输入您的所在城市!");
	    return false ;
	}
	
	if(city.length>100){  
		$("#city").parent().children("span").attr("class","mes wrong");
		$("#city").parent().children("span").html('城市信息过长！');
      return false;
	  }
	
	$("#city").parent().children("span").attr("class","mes right");
	$("#city").parent().children("span").html('');
	 return true;  
}


$(function(){
    //实现关闭按钮事件
	$("#realName").blur(function(){
		checkRealName(this.value);
	});
	$("#mobile").blur(function(){
		checkMobile(this.value);
	});
	$("#city").blur(function(){
		checkCity(this.value);
	});

});


//-->
</script>


<!--[if IE 6]>
<script type="text/javascript" src="http://images.shopin.net/js/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript"> 
DD_belatedPNG.fix('.wrapBar,.wrapBody');
</script> 
<![endif]-->
</body>
</html>

