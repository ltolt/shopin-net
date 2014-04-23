<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>常见问题</title>
<link href="${css}/message.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function doSearchLeaveMsg(){
            var keyword = document.getElementById("keyword").value;
           window.location.href='${ctx}/msg/common/1.html?keyword='+encodeURI(keyword,"utf-8") ;
           // $("#sform").submit();
        }
    </script>
</head>
<body>

	<ul id="page-110415">

<li class="pleft-110419">
            <div class="faqbuttom"><img src="${images}/0414m1.gif" width="210" height="111" /></div>
            <div class="faq1">在线留言流程</div>
            <div class="faq0414">会员登录 → 我要留言 → 选择“问题类型”→ 填写留言信息 → 提交 → 查看我的上品 → 我的留言</div>
			<div class="faq1">在线留言特点</div>
			<div class="faq0414">1、24小时随时提交留言信息<br/>
2、支持商品售后问题图片上传(正面，侧面，细节，100K以内)<br/>
3、登录会员账户查看客服回复内容 </div>
			<div class="faq1">在线留言回复时间</div>
			<div class="faq0414">　　客服在每日11:00、14:00、18:00、20:00统一回复顾客留言，请您在以上时间登录会员账户查询。<br/><br/>注：21:00-9:00之间提交的留言，请在次日<br/>
			　　18:00前查询。国家法定假日，回复时间调<br/>　　
			整见公告。</div>
			
			
			
			<div class="faq1">在线留言流程</div>
            <div class="faq0414">会员登录<a name="a1" id="a1"></a> → 我要留言 → 选择“问题类型”→ 填写留言信息 → 提交 → 查看我的上品 → 我的留言</div>
			
			
			<div class="faq1">联系客服</div>
			<div class="faq0414">热线：4008980808(9:00-21:00）<br/>
			咨询：<a href="mailto:question@shopin.cn" target="_blank">question@shopin.cn</a> <br/>
			查询：<a href="mailto:Web-order@shopin.cn" target="_blank">Web-order@shopin.cn</a> <br/>
			投诉：<a href="mailto:service@shopin.cn" target="_blank">service@shopin.cn</a>　<br/>
			</div>
      </li>







        <li class="pright-110419">
			<div class="biaoti"><img src="${images}/0414m2.gif" alt="常见问题" /></div>
			<ul class="liucheng">
				<li><a href="http://www.shopin.net/help/h_payment.html#c1" target="_blank"><img src="${images}/0414m5.gif" alt="购物流程" border="0" /></a></li>
				<li><a href="http://www.shopin.net/promotions.html" target="_blank"><img src="${images}/0414m6.gif" alt="促销活动" width="78" height="27" border="0" /></a></li>
				<li><a href="http://www.shopin.net/help/h_pay.html" target="_blank"><img src="${images}/0414m7.gif" alt="支付方式" border="0" /></a></li>
				<li><a href="http://www.shopin.net/help/h_log.html" target="_blank"><img src="${images}/0414m8.gif" alt="运费收取" border="0" /></a></li>
				<li><a href="http://www.shopin.net/help/h_log.html#l"><img src="${images}/0414m9.gif" alt="配送服务" /></a></li>
				<li><a href="http://www.shopin.net/help/h_return.html#b1" target="_blank"><img src="${images}/0414m10.gif" alt="退货规定" border="0" /></a></li>
			</ul>

            <div style="padding-right:20px;width:95%;text-align:right;color:#808080;"><a href="#moreleavemsg">更多>></a></div>
			<div class="biaoti"><img src="${images}/0414m3.gif" alt="常见顾客留言" width="96" height="16" /></div>
			<div class="sousuo">
            <form action="" method="get">
                    <input type="text" class="sousuokuang"value="${keyword==null?"请输入关键词":keyword}" name="keyword" id="keyword" onfocus="this.value=''"/>
			<img src="${images}/0414m12.gif" align="absmiddle"  style="cursor:pointer;" onclick="doSearchLeaveMsg()"/>
			</form></div>

          <div class="pright1-110419">
                <c:forEach items="${pageVO.list}" var="msg">
                    <div>
                        <h2><b>咨询内容：</b>${msg.msgContent}</h2>
                    </div>

                     <div class="nr">
                        <h2><b>回复内容：</b>${msg.replayContent}</h2>
                   </div>
                </c:forEach>

               	 	<div style="padding:20px;">
                	<div class="sabrosus">${page}</div> </div>

            </div>
            <a name="moreleavemsg"></a>
            <div class="biaoti"><img src="${images}/0414m4.gif" alt="在线客留言" width="64" height="16" /></div>
            <div>
				<p class="liuyanxuan">
                    请您选择留言的类型：
                    <c:forEach items="${messageTypes}" var="msgType">
                        <input name="msgType" type="radio" value="${msgType.tid}" onclick="goToSecondPage('${msgType.tid}')"/>
                        ${msgType.catename}&nbsp;&nbsp;&nbsp;&nbsp;
                    </c:forEach>
                    <p style=" float:right; padding:0 60px 25px 0;"><a  target="_blank"  id="firstlevetype" ><img name="" type="image" src="${images}/0414m13.gif" /></a></p>
            </div>
      </li>
    </ul>
    <script type="text/javascript">
        function goToSecondPage(pid){
            document.getElementById('firstlevetype').href="${ctx}/msg/"+pid+".html";
        }
    </script>
</body>
</html>
