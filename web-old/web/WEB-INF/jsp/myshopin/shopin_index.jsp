<%--
  Description:会员-我的上品首页
  User: Su Haibo
  Date: 2010-1-18
--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上品折扣官方购物网站-万款名牌100%正品1-6折秒杀!天天特卖,1小时限时抢购!实体店供货,10天退换,北京最低价！-www.shopin.net</title>
<link href="../css/master.css" rel="stylesheet" type="text/css" />
<link href="../css/myshopin-index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/input.js"></script>
</head>

<body>
<div id="page">
<!--[if !ie]>页头开始<![endif]-->
    <div id="header">

        <div id="logo"><img src="${images}/logo.jpg" alt="上品折扣网-www.shopin.net" /></div>
        <div id="shopin-site">
            <select>
              <option>北京站</option>
              <option>上海站</option>
            </select>
        </div>
        <div id="banner"><img src="${images}/i-1.gif" alt="正品保障" /></div>

        <ul id="loginbar">
        	<li>您好，欢迎来上品！<a href="#">登录</a> | <a href="#">免费注册</a> | <a href="#">新手上路</a> | <a href="#">我的上品</a> | <a href="#">帮助</a></li>

            <li class="line10">服务热线 <span>400 609 0600 </span>(10:00-22:00)<a href="#"><img src="${images}/i-2.gif" alt="客服在线" /></a></li>
      	</ul>
      <ul id="main-nav">
          <li class="width25">&nbsp;</li>
          <li><a href="#" id="Focus">首页</a></li>
          <li><a href="#">女人</a></li>

          <li><a href="#">男士</a></li>
          <li><a href="#">运动户外</a></li>
          <li><a href="#">鞋</a></li>
          <li><a href="#">内衣</a></li>
          <li><a href="#">箱包配饰</a></li>
          <li><a href="#">童装</a></li>

          <li><a href="#">所有品类</a></li>
          <li><a href="#">品牌专业店</a></li> 
          <li class="width25">&nbsp;</li>
      </ul>
      <div class="subnav">
          <ul>
            <li class="topnav">
                <ul>

                    <li><a href="#">限时抢购</a></li>
                    <li><span>|</span><li>
                    <li><a href="#">买手推荐</a></li>
                    <li><span>|</span><li>
                    <li><a href="#">新品上架</a></li>
                    <li><span>|</span><li>

                    <li><a href="#">品牌风云榜</a></li>
                    <li><span>|</span><li>
                    <li><a href="#">会员专享</a></li>
                    <li><span>|</span><li>
                    <li><a href="#">资讯社区</a></li>
                    <li><span>|</span><li>

                    <li><a href="#">上品知道</a></li>
                </ul>
             </li>
            <li class="search">
              <form>
                <input name="input" type="text" class="s-input" value="请输入品牌/货号"/>
                <div id="t_select">
                    <div id="t_selected" onclick="shlist();" onmouseover="cws(true);" onmouseout="cws(false);" onblur="hlist()">全部</div>

			    <div id="t_select-list" onmouseover="cws(true);" onmouseout="cws(false);">
                      <div class=""onclick="changesever(this);" ><a href="#">全部</a></div>
                      <div class=""onclick="changesever(this);" ><a href="#">女人</a></div>
                      <div class=""onclick="changesever(this);" ><a href="#">男土</a></div>
                      <div class=""onclick="changesever(this);" ><a href="#">运动户外</a></div>
                      <div class=""onclick="changesever(this);" ><a href="#">鞋</a></div>

                      <div class=""onclick="changesever(this);" ><a href="#">内衣</a></div>
                      <div class=""onclick="changesever(this);" ><a href="#">箱包配饰</a></div>
                      <div class=""onclick="changesever(this);" ><a href="#">童装</a></div>
                  </div>
                </div>
                <input type="image" src="${images}/i-4.gif"　class="searchbutton" />
              	<h3><span><a href="#">高级搜索</a></span>　<a href="#">暇步士</a> <a href="#">婷美</a> <a href="#">猫人</a> <a href="#">暇步士</a> <a href="#">婷美</a></h3> 
              </form>

            </li>
          </ul>  
          
          <ul class="shop">
            <li><img src="${images}/i-5.gif" alt="购物车" /></li>
            <li class="shop3">
                <p><a href="#">购物车有 <span>2 </span>件商品</a></p>
                <p><a href="#">去结算>></a> 　<a href="#">我的订单(<span>2</span>)</a></p>

            </li>
           </ul>
      </div>
	  <div class="tonglan"><img src="${images}/del/d-1.jpg" alt="上品折扣" /></div>
	</div>
<!--[if !ie]>页头结束<![endif]-->
<!--[if !ie]>中间内容开始<![endif]-->
	<!--[if !ie]>面包屑开始<![endif]-->
    
    <!--[if !ie]>面包屑结束<![endif]-->
	<ul id="content-sp">

    	<li id="content-sp-left">
        	<div class="content-sp-left-title">我的上品</div>
            <ul class="content-sp-left-list">
            	<ol class="content-sp-left-list1">订单管理</ol>
                <li><a href="#">查看订单</a></li>
                <li><a href="#">查看退货订单</a></li>
                <li><a href="#">修改订单</a></li>

                <li><a href="#">我的收藏夹</a></li>
            </ul>
            <ul class="content-sp-left-list">
            	<ol>个人信息</ol>
                <li><a href="#">修改个人信息</a></li>
                <li><a href="#">修改密码</a></li>
                <li><a href="#">管理地址簿</a></li>

            </ul>
            <ul class="content-sp-left-list">
            	<ol>虚拟账户</ol>
                <li><a href="#">我的积分</a></li>
                <li>
                	<ul class="content-sp-left-list2">
                    	<li class="content-sp-left-list3"><a href="#">帐户余额</a></li>

                        <li><a href="#">查看退货订单</a></li>
                    </ul>
                </li>
                <li>
                	<ul class="content-sp-left-list2">
                    	<li class="content-sp-left-list3"><a href="#">我的shopin卡</a></li>
                        <li><a href="#">修改订单</a></li>

                    </ul>
                </li>
                <li>
                	<ul class="content-sp-left-list2">
                    	<li class="content-sp-left-list3"><a href="#">我的有效购物金额</a></li>
                        <li><a href="#">我的收藏夹</a></li>
                    </ul>
                </li>

            </ul>
            <ul class="content-sp-left-list">
            	<ol class="background-new">我的社区</ol>
                <li><a href="#">商品评论(3)</a></li>
                <li><a href="#">服务评论(4)</a></li>
                <li><a href="#">回帖(9)</a></li>
            </ul>

        </li>
        <li id="content-sp-center">
        	<div class="welcome"><span>您好 小虫! 欢迎登录 </span><a href="#">[退出]</a></div>
            <ul class="content-center-list">
            	<ol>上品小助手提醒</ol>
                <li>07-16 13:14　您有 <span>1</span> 个订单已发货，请您注意查收。<a href="#" target="_blank">查看订单>></a></li>

                <li>07-16 13:14　您有 <span>1</span> 个订单未付款，请您及时付款。<a href="#" target="_blank">查看并付款>></a></li>
                <li class="cuikuan">请尽快完成付款！由于该宝贝同时在实体店销售，如果您未能及时付款，则有可能被别人抢走哦！</li>
                <li>07-16 13:14　您有 <span>1</span> 个订单已发货，请您注意查收。<a href="#" target="_blank">查看订单>></a></li>

            </ul>
            <ul class="content-center-list1">
            	<ol>浏览记录</ol>
                <li class="img-list1">
                	<ul class="img-list">
                       <li>
                          <a href="#"><img src="${images}/del/d-7.jpg" alt="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
                          <h3><em>10609.0</em>￥89999.0</h3>                      
                       </li>

                       <li>
                          <a href="#"><img src="${images}/del/d-7.jpg" alt="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
                          <h3><em>1060.0</em>￥89.00</h3>                    
                       </li>
                       <li>
                          <a href="#"><img src="${images}/del/d-7.jpg" alt="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
                          <h3><em>1060.0</em>￥89.00</h3>                     
                       </li>

                	</ul>
                </li>
            </ul>
            <ul class="content-center-list1">
            	<ol>猜您喜欢</ol>
                <li class="img-list1">
                	<ul class="img-list">
                       <li>

                          <a href="#"><img src="${images}/del/d-7.jpg" alt="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
                          <h3><em>10609.0</em>￥89999.0</h3>                      
                       </li>
                       <li>
                          <a href="#"><img src="${images}/del/d-7.jpg" alt="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
                          <h3><em>1060.0</em>￥89.00</h3>                    
                       </li>
                       <li>

                          <a href="#"><img src="${images}/del/d-7.jpg" alt="sku" /><p>鹿王专柜正品时尚女款羊绒衫... </p></a>
                          <h3><em>1060.0</em>￥89.00</h3>                     
                       </li>
                	</ul>
                </li>
            </ul>
        </li>
        <li id="content-sp-right">
            <div class="help"><a href="#" target="_blank">需要帮助？ </a></div>
            <ul class="container">
                <ol>网站公告<span><a href="#" target="_blank">更多>></a></span></ol>
                <li class="container-title">
                    <h3>金牌买手大奖招募</h3>
                    <p><a href="#" target="_blank">3折20元起 限100件 7天限时抢购</a></p>
                </li>
                <li><a href="#" target="_blank">NIKE秋季运动系列3折热卖活动</a></li>
                <li><a href="#" target="_blank">NIKE秋季运动系列3折热卖活动</a></li>
                <li><a href="#" target="_blank">NIKE秋季运动系列3折热卖活动</a></li>
                <li><a href="#" target="_blank">NIKE秋季运动系列3折热卖活动</a></li>
            </ul>
            <ul class="container">
                <ol>常见问题<span><a target="_blank" href="#">更多>></a></span></ol>
                <li><a target="_blank" href="#">NIKE秋季运动系列3折热卖活动</a></li>
                <li><a target="_blank" href="#">NIKE秋季运动系列3折热卖活动</a></li>
                <li><a target="_blank" href="#">NIKE秋季运动系列3折热卖活动</a></li>
                <li><a target="_blank" href="#">NIKE秋季运动系列3折热卖活动</a></li>
                <li><a target="_blank" href="#">NIKE秋季运动系列3折热卖活动</a></li>
                <li><a target="_blank" href="#">NIKE秋季运动系列3折热卖活动</a></li>
            </ul>
            <ul class="container">
                <li class="newsletter"><input type="checkbox" value="" name=""/>订阅打折快报</li>
                <li class="newsletter1"><a target="_blank" href="#">第一时间获得最新品牌打折活动消息</a></li>
            </ul>
            <ul class="container container1">
                <ol>意见反馈</ol>
                <li>我们需要您的意见和建议，谢谢！</li>
                <li class="comments"><textarea cols="32" rows="6"></textarea>
                </li>
                <li><a href="#"><img height="26" width="66" border="0" alt="提交" src="${images}/i-84.gif"/></a></li>
            </ul>
        </li>
    </ul>
<!--[if !ie]>中间内容结束<![endif]-->
<!--[if !ie]>底部内容开始<![endif]-->
  <ul id="shangpin">
    <li class="shangpin-logo"><img src="${images}/i-44.gif" alt="上品商业" /></li>
           <li><a href="#"><img src="${images}/i-1.jpg" alt="亚运村店" /><p>亚运村店</p></a></li>
           <li><a href="#"><img src="${images}/i-2.jpg" alt="王府井店" /><p>王府井店</p></a></li>
           <li><a href="#"><img src="${images}/i-3.jpg" alt="中关村店" /><p>中关村店</p></a></li>

           <li><a href="#"><img src="${images}/i-4.jpg" alt="五棵松店" /><p>五棵松店</p></a></li>
           <li><a href="#"><img src="${images}/i-5.jpg" alt="首体店" /><p>首体店</p></a></li>
           <li><a href="#"><img src="${images}/i-6.jpg" alt="朝阳店" /><p>朝阳店</p></a></li>
  </ul>
    <ul class="about">
   	  <li class="about-list">
       	<ul>

          <ol>关于上品</ol>
              <li><a href="#">联系我们</a></li>
              <li><a href="#">友情链接</a></li>
            </ul>
        </li>
        <li class="about-list width133">
        	<ul>

              <ol>购物指南</ol>
              <li><a href="#">新用户注册</a></li>
              <li><a href="#">怎么下订单</a></li>
              <li><a href="#">常见问题</a></li>
              <li><a href="#">顾客投诉板</a></li>
            </ul>

      </li>
        <li class="about-list width129">
        	<ul>
              <ol>支付方式</ol>
              <li><a href="#">网上支付</a></li>
              <li><a href="#">银行汇款</a></li>
              <li><a href="#">电话支付</a></li>

              <li><a href="#">邮局汇款</a></li>
              <li><a href="#">货到付款</a></li>
            </ul>
        </li>
        <li class="about-list width168">
        	<ul>
              <ol>配送方式</ol>

              <li><a href="#">支付方式</a></li>
              <li><a href="#">网上支付常见问题</a></li>
              <li><a href="#">配送范围/时间/运费</a></li>
            </ul>
        </li>
      <li class="about-list width224">
        	<ul>

              <ol>退换货服务</ol>
              <li class="dian2"><a href="#">退货政策</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"><img src="${images}/i-11.gif" hspace="6" align="absmiddle" />退货政策</a></li>
              <li class="dian2"><a href="#">退货流程</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"><img src="${images}/i-11.gif" hspace="6" align="absmiddle" />换货流程</a></li>
              <li><a href="#">补发货流程</a></li>
              <li><a href="#">错货处理流程</a></li>

              <li><a href="#">如何退款</a></li>
            </ul>
      </li>
        <li class="about-list width200">
        	<ul>
              <ol>客服中心</ol>
              <li><a href="#">客服联系方式</a></li>

              <li><a href="#">客服热线：4006090600</a></li>
              <li><a href="#">在线客服：QQ QQ  旺旺</a></li>
              <li><a href="#">客服mail:service@shopin.cn</a></li>
              <li><a href="#">客服传真：(010)51721200</a></li>
            </ul>
        </li>
  </ul>

    <ul class="bottomnav">
    	<li><a href="#">关于我们</a></li>
        <li><a href="#">网站地图</a></li>
      <li><a href="#">联系我们</a></li>
        <li><a href="#">人才招聘</a></li>
        <li><a href="#">品牌招商</a></li>

        <li><a href="#">友情链接</a></li>
        <li><a href="#">联盟合作</a></li>
  </ul>
    <ul class="shopin-icon">
    	<li><a href="#"><img src="${images}/i-47.gif" alt="上品折扣低价的秘密" /></a></li>
        <li><a href="#"><img src="${images}/i-48.gif" alt="正品保障10天保退换" /></a></li>
        <li><a href="https://www.alipay.com/aip/aip_validate_list.htm?trust_id=AIP11033240" target="_blank"><img src="https://img.alipay.com/img/logo/aip/logo154x50.jpg"></a></li>
  </ul>

    <div class="bottomnav1"><a href="#">使用条件</a> | <a href="#">隐私声明</a> <a href="#">京ICP备0944499号</a><img src="${images}/i-49.gif" alt="ICP" align="absmiddle" />Copyright 2008-2010, 版权所有 <a href="http://www.shopin.net">SHOPIN.NET</a></div>
<!--[if !ie]>底部内容结束<![endif]-->
</div>
</body>
</html>
