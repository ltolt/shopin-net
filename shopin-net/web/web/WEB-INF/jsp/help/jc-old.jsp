<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>上品折扣喊你猜价格！ 赢1元购物特权！上品折扣网shopin.net- 商场名牌1-3折限量秒杀,正品保障,网上购物!服装品牌,名品折扣,名牌打折,团购价!上品折扣官方购物网站</title>
<link href="http://images.shopin.net/css/guess.css" rel="stylesheet" type="text/css" />
<link href="${css}/guess.css" rel="stylesheet" type="text/css" />
<script src="${js}/jquery/jquery132min.js" type="text/javascript"></script>
<link href="${css}/facebox0504.css" media="screen" rel="stylesheet" type="text/css"/>
<script src="${js}/facebox.js" type="text/javascript"></script>
<style type="text/css">
<!--

-->
</style>
<script type="text/javascript">
        jQuery(document).ready(function($) {
            $('a[rel*=facebox]').facebox({
                loadingImage : '${images}/loading.gif',
                closeImage   : '${images}/ad/03251.gif'
            })
        })

        function check() {
            var product = $('#product').html();
            var productPrice = $('#facebox input[name=productPrice]').val();
            var name = $('#facebox input[name=name]').val();
            var member = $('#facebox input[name=member]').val();
            var phone = $('#facebox input[name=phone]').val();
            var address = $('#facebox input[name=address]').val()
            var email = $('#facebox input[name=email]').val();

            if (productPrice == "") {
                alert("请您填写商品价格");
                return false;
            }

            if (name == "") {
                alert("请您填写真实姓名");
                return false;
            }
            var reg = /^(((13[0-9]{1})|(18[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
            //            if (!reg.test($.trim($('#phone').val()))) {
            if (phone == "" || phone.length != 11) {
                alert("手机号码格式不对");
                return false;
            }
            if (address == "") {
                alert("请您填写通讯地址");
                return false;
            }
            var valid = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(email);
            if (!valid) {
                alert("请您确认邮箱地址是否正确");
                return false;
            }

            $.ajax({
                url:'/web/vote.json',
//                url:'${ctx}/vote.json',
                type: 'post',
                dataType: 'json',
                data:{'productPrice':productPrice,
                    'product':product,
                    'name':name,
                    'member':member,
                    'phone':phone,
                    'address':address,
                    'email':email
                },
                timeout: 30000,
                success: function(response) {
                    var status = response.status;
                    if (status == '1') {
                        $('#meS').trigger('click');
                    }
                    if (status == '0') {
                        $('#meF').trigger('click');
                    }
                    
                }
            });
            return false;
        }

         function save(){

         }

        function out(){
            $.facebox.close();
        }
        function toGuess(pro){
            $("#product").empty();
            $("#product").prepend(pro);
            $('#box').trigger('click');
        }
    </script>
</head>

<body>

<a id="box" href="#info" rel="facebox"></a>
<a id="meS" href="#success" rel="facebox"></a>
<a id="meF" href="#fail" rel="facebox"></a>

<div id="info" style="display:none;">
    <table width="451" border="0" cellspacing="0" cellpadding="0" style="font-size:12px;">
        <tr>
            <td><img src="http://images.shopin.net/images/ad/042715.gif" width="451" height="43"/></td>
        </tr>
        <tr>
            <td align="center" valign="middle" background="http://images.shopin.net/images/ad/0427116.gif">
                <table width="80%" border="0" cellspacing="0" cellpadding="0" style="margin:15px auto;">
                    <%--<form id="form1" action="${ctx}/vote.html" method="post" onsubmit="return check();">--%>
                    <form id="form1">
                        <tr>
                            <td width="92" height="22" align="right" valign="middle"><p>竞猜商品:<br/>
                            </p></td>
                            <td height="22" align="left" valign="middle"><span id="product"></span></td>
                        </tr>
                        <tr>
                            <td height="22" align="right" valign="middle"><p><span
                                    style="color:#FF6600">* </span>商品价格:<br/>
                            </p></td>
                            <td width="245" height="22" align="left" valign="middle"><label>
                                <input name="productPrice" id="productPrice" type="text" size="20"/>
                            </label>
                                （竞猜价格）
                            </td>
                        </tr>
                        <tr>
                            <td height="22" align="right" valign="middle"><p>会 员 名:<br/>
                            </p></td>
                            <td height="22" align="left" valign="middle"><input name="member" type="text"
                                                                                size="20"/></td>
                        </tr>
                        <tr>
                            <td height="22" align="right" valign="middle"><p><span
                                    style="color:#FF6600">* </span>真实姓名:<br/>
                            </p></td>
                            <td height="22" align="left" valign="middle"><input name="name" type="text"
                                                                                size="20"/></td>
                        </tr>
                        <tr>
                            <td height="22" align="right" valign="middle"><p><span
                                    style="color:#FF6600">* </span>手机号码:<br/>
                            </p></td>
                            <td height="22" align="left" valign="middle"><input name="phone" type="text"
                                                                                size="20"/></td>
                        </tr>
                        <tr>
                            <td height="22" align="right" valign="middle"><p><span
                                    style="color:#FF6600">* </span>通讯地址:<br/>
                            </p></td>
                            <td height="22" align="left" valign="middle"><input name="address" type="text"
                                                                                size="20"/></td>
                        </tr>
                        <tr>
                            <td height="22" align="right" valign="middle"><p><span style="color:#FF6600">* </span>电子邮箱:
                            </p></td>
                            <td height="22" align="left" valign="middle"><input name="email" type="text"
                                                                                size="20"/></td>
                        </tr>
                        <tr>
                            <td height="60" colspan="2" align="center" valign="middle"><span style="color:#FF6600">备注：*为必填选项</span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" valign="middle"><input type="image"
                                                                                  src="http://images.shopin.net/images/ad/0427118.gif"
                                                                                  width="79" height="30"
                                                                                  border="0" onclick="return check();"/></td>
                        </tr>
                    </form>
                </table>
            </td>
        </tr>
        <tr>
            <td><img src="http://images.shopin.net/images/ad/0427117.gif" width="451" height="34"/></td>
        </tr>
    </table>

</div>
<div id="success" style="display:none;" style="z-index:999">
    <table width="451" border="0" cellspacing="0" cellpadding="0" style="font-size:12px;">
        <tr>
            <td><img src="http://images.shopin.net/images/ad/0427119.gif" width="451" height="35"/></td>
        </tr>
        <tr>
            <td align="center" valign="middle" background="http://images.shopin.net/images/ad/0427116.gif">
                <table width="70%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="left" valign="middle" style="color:#4C5861; line-height:21px;">恭喜您投票成功！感谢参与！<br/>
                            敬请关注2011年5月19日获奖名单公布
                        </td>
                    </tr>
                    <tr>
                        <td height="60" align="left" valign="middle"><a href="#" target="_blank"
                                                                        style="color:#E8470B; font-weight:bold; text-indent:inherit;">
                            &gt;&gt; 去上品折扣官方微博 参与竞猜留言</a></td>
                    </tr>
                    <tr>
                        <td height="64" align="center" valign="middle"><img
                                src="http://images.shopin.net/images/ad/0427120.gif" width="79" height="30" style="cursor:pointer;" onclick="out();"/></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td><img src="http://images.shopin.net/images/ad/0427117.gif" width="451" height="34"/></td>
        </tr>
    </table>
</div>
<div id="fail" style="display:none;" style="z-index:999">
    <table width="451" border="0" cellspacing="0" cellpadding="0" style="font-size:12px;">
        <tr>
            <td><img src="http://images.shopin.net/images/ad/0427119.gif" width="451" height="35"/></td>
        </tr>
        <tr>
            <td align="center" valign="middle" background="http://images.shopin.net/images/ad/0427116.gif">
                <table width="70%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <td align="left" valign="middle" style="color:#4C5861; line-height:21px;">投票失败，您每天只可竞猜一次，无法重复！感谢参与！<br/>
                            敬请关注2011年5月19日获奖名单公布
                        </td>
                    </tr>
                    <tr>
                        <td height="60" align="left" valign="middle"><a href="#" target="_blank"
                                                                        style="color:#E8470B; font-weight:bold; text-indent:inherit;">
                            &gt;&gt; 去上品折扣官方微博 参与竞猜留言</a></td>
                    </tr>
                    <tr>
                        <td height="64" align="center" valign="middle"><img
                                src="http://images.shopin.net/images/ad/0427120.gif" width="79" height="30" style="cursor:pointer;" onclick="out();"/></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td><img src="http://images.shopin.net/images/ad/0427117.gif" width="451" height="34"/></td>
        </tr>
    </table>
</div>


<table width="950" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#EEEFE7">
  <tr>
    <td><img src="http://images.shopin.net/images/ad/04281.jpg" width="950" height="371" /></td>
  </tr>
  <tr>
    <td align="center" valign="middle"><img src="http://images.shopin.net/images/ad/04281.gif" width="822" height="108" style="margin:12px auto 23px auto;"/></td>
  </tr>
  <tr>
    <td height="42" align="center" valign="top"><img src="http://images.shopin.net/images/ad/04282.gif" width="657" height="20" /></td>
  </tr>
  <tr>
    <td height="38" align="center" valign="top" background="http://images.shopin.net/images/ad/042835.gif"><img src="http://images.shopin.net/images/ad/04284.gif" width="253" height="24" style="margin-top:9px;"/></td>
  </tr>
  <tr>
    <td align="left" valign="top" bgcolor="#FFFFFF"><table width="780" border="0" cellspacing="0" cellpadding="0" style="margin:17px 0 0 123px;">
      <tr>
        <td width="93" rowspan="5" align="left" valign="top"><img src="http://images.shopin.net/images/ad/04285.gif" width="76" height="98" style="margin-top:5px;"/></td>
        <td height="22" align="left" valign="top"><img src="http://images.shopin.net/images/ad/04286.gif" width="75" height="16" /></td>
      </tr>
      <tr>
        <td height="110" align="left" valign="top" style="line-height:20px;">竞猜方式：点击“我要竞猜”参与竞猜50款明星商品的“上品折扣价”，每人每日仅可竞猜1款商品价格；<br />
          抽奖规则：活动期内，从每日【最接近“上品折扣价”】竞猜结果中随机产生1名获奖者，即获得1元购物特权。 <br />
          获奖公告：2011年5月19日，公布所有明星商品的“上品折扣价”，并公布14名获奖名单。<br />
          奖品设置：获奖者，即可享受以1元价格获得“所竞猜组”的明星商品（随机选出）一款。<br />
　　　　　所有奖品将于2011年5月20日-5月25日发出，快递费用由获奖者自行承担。</td>
      </tr>
      <tr>
        <td height="22" align="left" valign="top" style="line-height:20px;"><img src="http://images.shopin.net/images/ad/04287.gif" width="75" height="16" /></td>
      </tr>
      <tr>
        <td height="170" align="left" valign="top" style="line-height:20px;">方式一：上品折扣 <a href="Http://t.sina.com.cn/offprice" target="_blank"><img src="http://images.shopin.net/images/ad/04288.gif" width="65" height="24" vspace="5" border="0" align="absmiddle" /></a>               <a href="Http://t.sina.com.cn/offprice" target="_blank">Http://t.sina.com.cn/offprice</a><br />
　　　　官方微博 <a href="http://t.qq.com/shangpinzhekou" target="_blank"><img src="http://images.shopin.net/images/ad/04289.gif" width="65" height="21" vspace="5" border="0" align="absmiddle" /></a>              <a href="http://t.qq.com/shangpinzhekou" target="_blank">http://t.qq.com/shangpinzhekou</a><br />
　　　　可将竟猜的商品名称、竞猜价、您的联系方式，发布在上品折扣官方微博；<br />
方式二：登录活动页面：<a href="http://www.shopin.net/help/jc.html" target="_blank">http://www.shopin.net/help/jc</a>，按提示参与竞猜。<br />
方式三：光临上品折扣实体店--王府井店、亚奥旗舰店、首体店、五棵松店、中关村店、朝阳门店、三里河店、来广营店<br />
　　　　参加现场竞猜（2011年5月12日9：00-5月18日15：00）,现场抽奖（2011年5月14日、5月15日每天14：00—16:00）<br />
　　　　详情见各店内公告。</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center" valign="top" class="bg1"><table width="850" border="0" cellspacing="0" cellpadding="0" style="margin:15px 0 35px 70px;">
      <tr>
        <td width="160" rowspan="2" align="left" valign="middle"><img src="http://images.shopin.net/images/ad/042833.gif" width="142" height="93" /></td>
        <td height="40" align="left" valign="middle" style="color:#2893AB; font-weight:bold;"><img src="http://images.shopin.net/images/ad/042834.gif" width="188" height="17" align="absmiddle" />　　　　　　竞猜时间：2011年5月5日-5月7日  仅3天</td>
      </tr>
      <tr>
        <td align="left" valign="top" style="color:#515E6B;line-height:20px;">店址：北京市王府井大街200号工美大厦五层<br />
          总机：65288866 <br />
          乘车路线：
          10、20、37、41、59、120、126、420、802，王府井站下车；
          103电车、104电车、104快、201、211、420、803，王府井路口北下车；地铁一号线王府井站下车</td>
      </tr>
      <tr>
        <td width="160" rowspan="2" align="left" valign="middle"><img src="http://images.shopin.net/images/ad/042815.gif" width="133" height="87" /></td>
        <td height="40" align="left" valign="middle" style="color:#2893AB; font-weight:bold;"><img src="http://images.shopin.net/images/ad/042821.gif" width="189" height="17" align="absmiddle" />　　　　　　竞猜时间：2011年5月5日-5月7日  仅3天</td>
      </tr>
      <tr>
        <td align="left" valign="top" style="color:#515E6B;line-height:20px;">地址：北京市朝阳区亚运村北苑路158号家和城二层、三层、四层<br />
          电话：85278090<br />
          乘车路线：358、417、426、466、479、484、727、751、752、803、836、849、850、851、913，大屯北站下车；
          653、984、 985，科荟路东口下车；地铁5号线大屯路东站下车</td>
        </tr>
    </table>
      <table width="780" border="0" cellspacing="0" cellpadding="0" style="margin:15px auto 15px auto;">
        <tr>
          <td width="130" height="138" align="center" valign="top"><div class="sku-img-guess"><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/042811.gif" width="130" height="130" border="0"/></a><div class="zhekou-guess"></div></div></td>
          <td width="28" rowspan="5" align="center" valign="top">&nbsp;</td>
          <td width="130" align="center" valign="top"><div class="sku-img-guess"><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/042811.gif" width="130" height="130" border="0" /></a><div class="zhekou-guess"></div></div></td>
          <td width="28" rowspan="5" align="center" valign="top">&nbsp;</td>
          <td width="130" align="center" valign="top"><div class="sku-img-guess"><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/042811.gif" width="130" height="130" border="0" /></a><div class="zhekou-guess"></div></div></td>
          <td width="28" rowspan="5" align="center" valign="top">&nbsp;</td>
          <td width="130" align="center" valign="top"><div class="sku-img-guess"><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/042811.gif" width="130" height="130" border="0" /></a><div class="zhekou-guess"></div></div></td>
          <td width="28" rowspan="5" align="center" valign="top">&nbsp;</td>
          <td width="130" align="center" valign="top"><div class="sku-img-guess"><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/042811.gif" width="130" height="130" border="0" /></a><div class="zhekou-guess"></div></div></td>
        </tr>
        <tr>
          <td height="20" align="left" valign="middle" class="t1"><a href="#" target="_blank">NIKE360正品正品单鞋</a></td>
          <td align="left" valign="middle" class="t1"><a href="#" target="_blank">NIKE360正品正品单鞋</a></td>
          <td align="left" valign="middle" class="t1"><a href="#" target="_blank">NIKE360正品正品单鞋</a></td>
          <td align="left" valign="middle" class="t1"><a href="#" target="_blank">NIKE360正品正品单鞋</a></td>
          <td align="left" valign="middle" class="t1"><a href="#" target="_blank">NIKE360正品正品单鞋</a></td>
        </tr>
        <tr>
          <td height="20" align="left" valign="middle" class="t2">商场专柜价：798元</td>
          <td align="left" valign="middle" class="t2">商场专柜价：798元</td>
          <td align="left" valign="middle" class="t2">商场专柜价：798元</td>
          <td align="left" valign="middle" class="t2">商场专柜价：798元</td>
          <td align="left" valign="middle" class="t2">商场专柜价：798元</td>
        </tr>
        <tr>
          <td height="20" align="left" valign="middle" class="t3">上品折扣价：？？</td>
          <td align="left" valign="middle" class="t3">上品折扣价：？？</td>
          <td align="left" valign="middle" class="t3">上品折扣价：？？</td>
          <td align="left" valign="middle" class="t3">上品折扣价：？？</td>
          <td align="left" valign="middle" class="t3">上品折扣价：？？</td>
        </tr>
        <tr>
          <td align="center" valign="middle"><img src="http://images.shopin.net/images/ad/042812.gif" width="79" height="30" border="0" style="cursor:pointer;" style="margin:10px auto;" onclick="toGuess('NIKE360正品正品单鞋');"/></td>
          <td align="center" valign="middle"><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/042812.gif" width="79" height="30" border="0" style="margin:10px auto;" /></a></td>
          <td align="center" valign="middle"><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/042812.gif" width="79" height="30" border="0" style="margin:10px auto;" /></a></td>
          <td align="center" valign="middle"><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/042812.gif" width="79" height="30" border="0" style="margin:10px auto;" /></a></td>
          <td align="center" valign="middle"><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/042812.gif" width="79" height="30" border="0" style="margin:10px auto;" /></a></td>
        </tr>
      </table>
      <table width="780" border="0" cellspacing="0" cellpadding="0" style="margin:15px auto 15px auto;">
        <tr>
          <td width="130" height="138" align="center" valign="top"><div class="sku-img-guess"><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/042811.gif" width="130" height="130" border="0" /></a>
                <div class="zhekou-guess"></div>
          </div></td>
          <td width="28" rowspan="5" align="center" valign="top">&nbsp;</td>
          <td width="130" align="center" valign="top"><div class="sku-img-guess"><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/042811.gif" width="130" height="130" border="0" /></a>
                <div class="zhekou-guess"></div>
          </div></td>
          <td width="28" rowspan="5" align="center" valign="top">&nbsp;</td>
          <td width="130" align="center" valign="top"><div class="sku-img-guess"><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/042811.gif" width="130" height="130" border="0" /></a>
                <div class="zhekou-guess"></div>
          </div></td>
          <td width="28" rowspan="5" align="center" valign="top">&nbsp;</td>
          <td width="130" align="center" valign="top"><div class="sku-img-guess"><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/042811.gif" width="130" height="130" border="0" /></a>
                <div class="zhekou-guess"></div>
          </div></td>
          <td width="28" rowspan="5" align="center" valign="top">&nbsp;</td>
          <td width="130" align="center" valign="top"><div class="sku-img-guess"><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/042811.gif" width="130" height="130" border="0" /></a>
                <div class="zhekou-guess"></div>
          </div></td>
        </tr>
        <tr>
          <td height="20" align="left" valign="middle" class="t1"><a href="#" target="_blank">NIKE360正品正品单鞋</a></td>
          <td align="left" valign="middle" class="t1"><a href="#" target="_blank">NIKE360正品正品单鞋</a></td>
          <td align="left" valign="middle" class="t1"><a href="#" target="_blank">NIKE360正品正品单鞋</a></td>
          <td align="left" valign="middle" class="t1"><a href="#" target="_blank">NIKE360正品正品单鞋</a></td>
          <td align="left" valign="middle" class="t1"><a href="#" target="_blank">NIKE360正品正品单鞋</a></td>
        </tr>
        <tr>
          <td height="20" align="left" valign="middle" class="t2">商场专柜价：798元</td>
          <td align="left" valign="middle" class="t2">商场专柜价：798元</td>
          <td align="left" valign="middle" class="t2">商场专柜价：798元</td>
          <td align="left" valign="middle" class="t2">商场专柜价：798元</td>
          <td align="left" valign="middle" class="t2">商场专柜价：798元</td>
        </tr>
        <tr>
          <td height="20" align="left" valign="middle" class="t3">上品折扣价：？？</td>
          <td align="left" valign="middle" class="t3">上品折扣价：？？</td>
          <td align="left" valign="middle" class="t3">上品折扣价：？？</td>
          <td align="left" valign="middle" class="t3">上品折扣价：？？</td>
          <td align="left" valign="middle" class="t3">上品折扣价：？？</td>
        </tr>
        <tr>
          <td align="center" valign="middle"><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/042812.gif" width="79" height="30" border="0" style="margin:10px auto;" /></a></td>
          <td align="center" valign="middle"><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/042812.gif" width="79" height="30" border="0" style="margin:10px auto;" /></a></td>
          <td align="center" valign="middle"><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/042812.gif" width="79" height="30" border="0" style="margin:10px auto;" /></a></td>
          <td align="center" valign="middle"><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/042812.gif" width="79" height="30" border="0" style="margin:10px auto;" /></a></td>
          <td align="center" valign="middle"><a href="#" target="_blank"><img src="http://images.shopin.net/images/ad/042812.gif" width="79" height="30" border="0" style="margin:10px auto;" /></a></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="3" bgcolor="#272D33"></td>
  </tr>
  <tr>
    <td height="22" bgcolor="#515E6B">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" valign="top" class="bg2"><table width="850" border="0" cellspacing="0" cellpadding="0" style="margin:15px 0 35px 70px;">
      <tr>
        <td width="160" rowspan="2" align="left" valign="middle"><img src="http://images.shopin.net/images/ad/042828.gif" width="141" height="92" /></td>
        <td height="40" align="left" valign="middle" style="color:#2893AB; font-weight:bold;"><img src="http://images.shopin.net/images/ad/042829.gif" width="169" height="17" align="absmiddle" />　　　　　　竞猜时间：2011年5月8日-5月10日  仅3天</td>
      </tr>
      <tr>
        <td align="left" valign="top" style="color:#515E6B;line-height:20px;">店址：北京市海淀区中关村南大街甲56号方圆大厦四层<br />
          总机：88029010 <br />
          乘车路线：
          27、320、332、334、360、601、634、653、714、716、717、727、732、804、808、814、特4、特5、运通104、运通105、运通106、运通205、运通206、电车105、电车107、电车111，白石桥站下车</td>
      </tr>
      <tr>
        <td width="160" rowspan="2" align="left" valign="middle"><img src="http://images.shopin.net/images/ad/042818.gif" width="141" height="92" /></td>
        <td height="40" align="left" valign="middle" style="color:#2893AB; font-weight:bold;"><img src="http://images.shopin.net/images/ad/042823.gif" width="188" height="17" align="absmiddle" />　　　　　　竞猜时间：2011年5月8日-5月10日  仅3天</td>
      </tr>
      <tr>
        <td align="left" valign="top" style="color:#515E6B;line-height:20px;">店址：北京市海淀区西翠路5号今日商业中心一层、二层<br />
          总机：88283350<br />
          乘车路线：
          308、335、849，西翠路口西下车;
          740、840、913、941、958，沙窝桥南下车</td>
        </tr>
    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="70" align="center" valign="middle"><img src="http://images.shopin.net/images/ad/042836.gif" width="226" height="41" vspace="15" border="0" /></td>
          </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td height="3" bgcolor="#272D33"></td>
  </tr>
  <tr>
    <td height="22" bgcolor="#515E6B">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" valign="top" class="bg3"><table width="850" border="0" cellspacing="0" cellpadding="0" style="margin:15px 0 35px 70px;">
      <tr>
        <td width="160" rowspan="2" align="left" valign="middle"><img src="http://images.shopin.net/images/ad/042831.gif" width="141" height="93" /></td>
        <td height="40" align="left" valign="middle" style="color:#2893AB; font-weight:bold;"><img src="http://images.shopin.net/images/ad/042832.gif" width="189" height="17" align="absmiddle" />　　　　　　竞猜时间：2011年5月11日-5月13日  仅3天</td>
      </tr>
      <tr>
        <td align="left" valign="top" style="color:#515E6B;line-height:20px;">地址：北京市朝阳区朝外大街19号华普大厦二、三层<br />
          电话：65804883-108<br />
          乘车路线：858、420、202、109、101、110、750、846路朝阳门外下车即到;地铁朝阳门站Ａ出口，向东100米。</td>
      </tr>
      <tr>
        <td width="160" rowspan="2" align="left" valign="middle"><img src="http://images.shopin.net/images/ad/042819.gif" width="141" height="92" /></td>
        <td height="40" align="left" valign="middle" style="color:#2893AB; font-weight:bold;"><img src="http://images.shopin.net/images/ad/042824.gif" width="188" height="17" align="absmiddle" />　　　　　　竞猜时间：2011年5月11日-5月13日  仅3天</td>
      </tr>
      <tr>
        <td align="left" valign="top" style="color:#515E6B;line-height:20px;">店址：北京市海淀区北四环西路52号中芯大厦一层、二层、三层<br />
          总机：51721200 <br />
          乘车路线：
          26、47、333外环、718、740、751、808、840、913、982、983，中关村站下车；
          132、302快、307、320、332、355、365、681、716、717、731、801、801快、811、特4、特6、运通105、运通106、运通109、运通110、运通205，海龙站下车</td>
        </tr>
    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="70" align="center" valign="middle"><img src="http://images.shopin.net/images/ad/042836.gif" width="226" height="41" vspace="15" border="0" /></td>
          </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td height="3" bgcolor="#272D33"></td>
  </tr>
  <tr>
    <td height="22" bgcolor="#515E6B">&nbsp;</td>
  </tr>
  
  <tr>
    <td align="center" valign="top" class="bg4"><table width="850" border="0" cellspacing="0" cellpadding="0" style="margin:15px 0 35px 70px;">
        <tr>
          <td width="160" rowspan="2" align="left" valign="middle"><img src="http://images.shopin.net/images/ad/042826.gif" width="140" height="92" /></td>
          <td height="40" align="left" valign="middle" style="color:#2893AB; font-weight:bold;"><img src="http://images.shopin.net/images/ad/042827.gif" width="188" height="17" align="absmiddle" />　　　　　　竞猜时间：2011年5月14日-5月16日  仅3天</td>
        </tr>
        <tr>
          <td height="70" align="left" valign="top" style="color:#515E6B;line-height:20px;">地址：北京市西城区月坛南街30号西单万方商场2层、3层<br />
            电话：68516955<br />
          乘车路线：13、21、65、68、32三里河东口下车</td>
        </tr>
        <tr>
          <td rowspan="2" align="left" valign="middle"><img src="http://images.shopin.net/images/ad/042816.gif" width="142" height="93" /></td>
          <td height="40" align="left" valign="middle" style="color:#2893AB; font-weight:bold;"><img src="http://images.shopin.net/images/ad/042822.gif" width="188" height="17" align="absmiddle" />　　　　　　竞猜时间：2011年5月14日-5月16日  仅3天</td>
        </tr>
        <tr>
          <td height="70" align="left" valign="top" style="color:#515E6B;line-height:20px;">地址：北京市朝阳区来广营香宾路66-1号<br />
            电话：59578666<br />
          乘车路线：404 467 630 677 682 707 852 975 966 944支 运通110 运通111 运通113 运通201等广顺桥南站下车</td>
        </tr>
        
      </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="70" align="center" valign="middle"><img src="http://images.shopin.net/images/ad/042836.gif" width="226" height="41" vspace="15" border="0" /></td>
          </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td height="3" bgcolor="#272D33"></td>
  </tr>
  <tr>
    <td height="22" bgcolor="#515E6B">&nbsp;</td>
  </tr>
  <tr>
    <td align="center" valign="top" class="bg5"><table width="840" border="0" cellspacing="0" cellpadding="0" style="margin:15px 0 35px 70px;">
          <tr>
            <td width="160" rowspan="2" align="left" valign="middle"><img src="http://images.shopin.net/images/ad/042814.gif" width="132" height="87" /></td>
            <td height="40" align="left" valign="middle" style="color:#2893AB; font-weight:bold;"><img src="http://images.shopin.net/images/ad/042820.gif" width="206" height="17" align="absmiddle" />　　　　　　竞猜时间：2011年5月17日-5月18日  仅2天</td>
          </tr>
          <tr>
            <td align="left" valign="top" style="color:#515E6B;text-indent: 20px; line-height:20px;">上品商业旗下电商平台-上品折扣网www.shopin.net首创中国百货折扣店网络商场模式，依托“上品折扣”实体店连<br />
              锁体系，一体化、全方位整合多店、全品类、全品牌、全库存商品资源，最大化吸纳实体店货品资源，真正实现了“零库<br />
              存”、“虚实一体化”的电子商务模式。</td>
          </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="70" align="center" valign="middle"><img src="http://images.shopin.net/images/ad/042836.gif" width="226" height="41" vspace="15" border="0" /></td>
          </tr>
      </table>
    </td>
  </tr>
  
  <tr>
    <td height="6" bgcolor="#313941"></td>
  </tr>
  
</table>
</body>
</html>
