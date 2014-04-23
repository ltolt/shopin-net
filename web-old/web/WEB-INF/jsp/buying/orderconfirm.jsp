<%--
  Description:确认订单    
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>订单确认-上品折扣网www.shopin.net</title>
<link href="${css}/master.css" rel="stylesheet" type="text/css"/>
<link href="${css}/mycart.css" rel="stylesheet" type="text/css"/>
<script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>
<script src="${js}/jquery/jquery-format-0.1.js" type="text/javascript"></script>
<style type="text/css">
    .cart_form_span {
        padding-left: 10px
    }

    ;
    .cart_modify {
        display: none
    }

    ;
    .table_css {
        border: 1px solid #ff9900;
        border-collapse: collapse;
    }

    .td_css {
        border: 1px solid #ff9900;
    }
</style>
<script type="text/javascript">
<%--
页面加载,绑定商品数量输入框的onkeyup事件,增加属性值product(SID),old(购物车中原来数量),max(库存数)
--%>
$(document).ready(function() {
    $("#cart_table input[type='text']").each(
                                            function() {
                                                var str = $(this).prev().val();
                                                var arr = str.split("_");
                                                $(this).attr('product', arr[0]);
                                                $(this).attr('old', arr[1]);
                                                $(this).attr('max', arr[2]);
                                                $(this).attr('price', arr[3]);
                                                $(this).attr('oldprice', arr[4]);
                                                $(this).attr('value', arr[1]);
                                                $(this).bind("keyup", function() {
                                                    var value = $.trim($(this).val());
                                                    value = value.replace(/\D/gi, "");
                                                    if (value == '' || value == '0' || parseInt(value) > parseInt($(this).attr("max"))) {
                                                        value = $(this).attr("old");
                                                    }
                                                    $(this).attr("value", value);
                                                });
                                            }
            );
    $("#cart_address_select input[name='cart_address_item']").each(
                                                                  function() {
                                                                      var radio = $(this);
                                                                      var hiddens = radio.siblings("input[type='hidden']");
                                                                      var address = {
                                                                          "receptname":hiddens.eq(0).val(),
                                                                          "deliProvinceSid":hiddens.eq(1).val(),
                                                                          "provinceName":hiddens.eq(2).val(),
                                                                          "deliCitySid":hiddens.eq(3).val(),
                                                                          "cityName":hiddens.eq(4).val(),
                                                                          "address":hiddens.eq(5).val(),
                                                                          "postcode":hiddens.eq(6).val(),
                                                                          "tel":hiddens.eq(7).val(),
                                                                          "fullAddress":hiddens.eq(8).val(),
                                                                          "completeInfo":hiddens.eq(9).val(),
                                                                          "newoption":'0'
                                                                      }
                                                                      radio.attr(address);
                                                                  }
            );
                       //选定支付方式
		$(".cashier_list_icons label").click(function(){
			$(this).addClass("current").parent().siblings().children().removeClass("current")

        })
		$(".cashier_list_icons input:radio").click(function(){
			$(this).next("label").addClass("current").parent().siblings().children().removeClass("current")
			})


});

<%--计算购物车中商品的总金额--%>
function countAmount() {
    var amount = 0;
    $("#cart_table input[type='text']").each(
                                            function() {
                                                amount += parseInt($(this).attr("old")) * parseFloat($(this).attr("price"));
                                                $(this).attr("value", $(this).attr("old"));
                                            }
            );
    return $.formatMoney("" + amount);
}

<%--计算购物车中商品的总数量--%>
function countQty() {
    var qty = 0;
    $("#cart_table input[type='text']").each(
                                            function() {
                                                qty += parseInt($(this).attr("old"));
                                            }
            );
    if (qty == 0) {
        $("#validate_productlist").attr("value", "false");
    }
    return qty;
}

<%--重新计算正价的总金额,上品价的总金额,总数量--%>
function countAll() {
    var cart_total_amount = countAmount();
    var cart_total_qty = countQty();
    var freight = $("#cart_total_freight").val();
    if (freight == "" || isNaN(freight)) {
        freight = "0.00";
    }
    var order_total_amount = parseFloat("" + cart_total_amount) + parseFloat(freight);
    order_total_amount = $.formatMoney("" + order_total_amount);
    $(".cart_total_amount").each(function() {
        $(this).html(cart_total_amount);
    });
    $(".cart_total_qty").each(function() {
        $(this).html(cart_total_qty);
    });
    $(".order_total_amount").each(function() {
        $(this).html(order_total_amount);
    });
}

<%--
   修改购物车中商品的数量
   @param button 当前点击的按钮元素
--%>
function updateQty(button) {
    var input = $(button).prev();
    var productSID = input.attr("product");
    var value = $.trim(input.attr("value"));
    var price = input.attr("price");
    var old = input.attr("old");
    var max = input.attr("max");
    if (value == '' || value == '0' || isNaN(value) || !/^\d+$/.test(value)) {
        $.popdialog(button, productSID + "_update", '数量输入不正确,应为大于零的数字,并小于库存数量');
        return;
    }
    if (value == old) {
        $.popdialog(button, productSID + "_update", '数量没有变化');
        return;
    }
    $.ajax({
        url:'${ctx}/cart/updateqty.json',
        type: 'post',
        dataType: 'json',
        data:{'proDetailSID':productSID,
            'price':price,
            'qty':value
        },
        timeout: 30000,
        error: function() {
            $.popdialog(button, productSID + "_update", '更新数量失败,请重试');
            return;
        },
        success: function(response) {
            var result = response.result;
            var status = result.status;
            var shopcount = response.shopcount;
            if (status && status == '1') {
                input.attr("old", value);
                input.parent().prev().html(value);
                countAll();
            }
            $.popdialog(button, productSID + "_update", result.message);
            if (shopcount !== 'undefined') {
                $(button).parent().prev().prev().html(shopcount);
            }
            return;
        }
    });
}

<%--
   从购物车中删除商品
   @param button 删除按钮
--%>
function remove(button) {
    var input = $(button).prev().prev();
    var productSID = input.attr("product");
    $.ajax({
        url:'${ctx}/cart/remove.json',
        type: 'post',
        dataType: 'json',
        data:{'proDetailSID':productSID},
        timeout: 30000,
        error: function() {
            $.popdialog(button, productSID + "_remove", '移除商品失败,请重试');
            return;
        },
        success: function(response) {
            var result = response.result;
            var status = result.status;
            var message = result.message;
            $.popdialog(button, productSID + "_remove", message);
            if (status && status == '1') {
                input.parent().parent().parent().remove();
                countAll();
                if (countQty() == 0) {
                    $("#cartMassage").html("购物车无商品，<a href='/index.html' target='_blank'>请继续购物>> </a>");
                }
            }
            return;
        }
    });

}

<%--获得地址信息--%>
function getAddressData() {
     var addr = {};
    var address_radios = $("li[class='select'] :radio[name='cart_address_item']");

    //var address_new =    $("div #cart_address_form [style='display:block']");
    var address_new = $("div #cart_address_form");
    var flag = $(address_new).css("display");

    if (address_radios.length == 0) {
         if(flag == 'block'){

              addr.sid = '';
              addr.name = $.trim($("#cart_address_form input[name='cart_address_name']").val());
             addr.deliProvinceSid = $("#provincelist").val();
           addr.provinceName = $("#provincelist option:selected").eq(0).html();
         addr.deliCitySid = $("#citylist").val();
         addr.cityName = $("#citylist option:selected").eq(0).html();
          addr.address = $.trim($("#cart_address_form input[name='cart_address_address']").val());
          addr.postcode = $.trim($("#cart_address_form input[name='cart_address_postcode']").val());
          addr.tel = $.trim($("#cart_address_form input[name='cart_address_tel']").val());
          addr.newoption = '1';

              return addr;
    }
        return '';
    }

    var address_radio = address_radios.eq(0);

    if (address_radio.val() != '') {
        addr.sid = address_radio.val();
        addr.name = address_radio.attr("receptname");
        addr.deliProvinceSid = address_radio.attr("deliProvinceSid");
        addr.provinceName = address_radio.attr("provinceName");
        addr.deliCitySid = address_radio.attr("deliCitySid");
        addr.cityName = address_radio.attr("cityName");
        addr.address = address_radio.attr("address");
        addr.postcode = address_radio.attr("postcode");
        addr.tel = address_radio.attr("tel");
        addr.newoption = address_radio.attr("newoption");
        return addr;
    }
    return '';

}

<%--获得,是否将新地址加入地址簿信息--%>
function getAddNewAddr() {
    var address = getAddressData();
    if (address != '' && '1' == address.newoption) {
        var radios = $(":radio[name='new_address_option'][checked]");
        if (radios.length > 0) {
            var value = radios.eq(0).val();
            return value;
        }
    }
    return '0';
}

<%--显示地址选择区域--%>
function showAddressSelect(button) {
    //test-start
    $("#cart_address_select").css("display", "block");
    $("#cart_address_button").css("display", "block");
    $("#cart_address").css("display", "none");
    $(button).css("display", "none");
    return;
}
<%--隐藏地址选择列表--%>
function hideAddress(button) {
    var address = getAddressData();
    if ($("#validate_address").val() != 'true') {
        $.popdialog(button, "cart_address_shut_info", "您还没有填写收货人信息");
        return;
    } else {
        $("#cart_address_select").css("display", "none");
        $("#cart_address_form").css("display", "none");
        $("#cart_address_button").css("display", "none");
        $("#cart_address").css("display", "block");
        $("#cart_address_title").children().eq(1).css("display", "block");
        $("#cart_address_select input[name='cart_address_item']").each(function() {
            $(this).removeAttr("checked");
        });
    }
}

<%--选择地址列表--%>
function selectAddressOption(button) {
          var address_lis = $("li[class='select']");

         for(var i=0;i<address_lis.length;i++){
            var address_li = address_lis.get(i);

           $(address_li).removeClass("select");
        }
        $("#cart_address_form").css("display", "block");

}
function selectOption(button){
        $("#cart_address_form").css("display", "none");
        var address_lis = $("li[class='select']");
        for(var i=0;i<address_lis.length;i++){
            var address_li = address_lis.get(i);
             $(address_li).removeClass("select");
        }
       $(button).attr("class","select");

}


<%--
   根据选择的地址iput,渲染地址信息
   @param input
--%>
function renderAddressInfo() {
    var address = getAddressData();
    var address_li = $("#cart_address").children("li");
    address_li.eq(0).html("姓名：" + address.name);
    address_li.eq(1).html("地址：" + address.provinceName + address.cityName + address.address);
    address_li.eq(2).html("邮编：" + address.postcode);
    address_li.eq(3).html("手机：" + address.tel);
}

<%--
  选择收货地址之后,屏蔽掉货到付款的支付方式
 @param existCollect
--%>
function renderPayTypeOptions(existCollect) {
    var radios = $(":radio[name='cart_paytype_item']");
    $(":radio[name='cart_paytype_item']").each(function() {
        var radio = $(this);
        radio.removeAttr("checked");
        var paytypename = radio.next().text();

        var paytypesid = radio.val();
        
        if ('4' == paytypesid) {
            if (existCollect && '1' == existCollect) {
                radio.parent().css("display", "block");
            } else {
                radio.parent().css("display", "none");
            }
        }
    });
}

<%--
  选择收货地址之后,屏蔽掉相关的收货方式
  @param typeids 可选的配送方式id的数组
--%>
function renderSendTypeOptions(typeids) {
    if (!typeids || typeids.length == 0) {
        return;
    }
    var arr = $(":radio[name='cart_sendtype_item']");
<%--清空已经选择的选项--%>
    arr.each(function() {
        $(this).removeAttr("checked");
        $(this).parent().css("display", "none");
        for (var i = 0; i < typeids.length; i++) {
            if (typeids[i] == $(this).attr("value")) {
                $(this).parent().css("display", "block");
                break;
            }
        }
    });
}

<%--校验收货地址信息--%>
function validateAddress(button) {
    var address = getAddressData();
    if ('' == address) {
        $.popdialog(button, "save_modify_info", "您还没有填写收货人信息");
        return false;
    }
    if ('0' == address.newoption) {
        return true;
    }
    var flag = true;
    var inputs = $("#cart_address_form input[type='text']");
    if (address.name == '') {
        $.poptip(inputs.get(0), "cart_address_form_name_validate", "请填写收货人姓名")
        flag = false;
    }
    if (address.deliProvinceSid == '') {
        $.poptip($("#provincelist").get(0), "cart_address_form_province_validate", "请选择省份");
        flag = false;
    }
    if (address.deliCitySid == '') {
        $.poptip($("#citylist").get(0), "cart_address_form_city_validate", "请选择城市");
        flag = false;
    }
    if (address.address == '') {
        $.poptip(inputs.get(1), "cart_address_form_address_validate", "请填写收货地址");
        flag = false;
    }
    if (!/^\d{11,12}$/.test(address.tel)) {
        $.poptip(inputs.get(3), "cart_address_form_tel_validate", "*提示：手机号码填写不正确（应为11位或12位数字），为便于送货时及时联系您，请填写正确手机号码。");
        flag = false;
    }
    if (!flag) {
        $.popdialog(button, "save_modify_info", "收货人信息填写不正确");
    }
    return flag;
}

<%--提交地址修改--%>
function commitAddress(button) {
    if (!validateAddress(button)) {
        return;
    }
    var address = getAddressData();
    var data;
    var url;
    var reload = false;
    if (address.newoption == '0') {
        data = {'addressSID':address.sid};
        url = '${ctx}/order/selectAddress.json';
    } else {
        data = {'name':address.name,
            'address':address.address,
            'deliProvinceSid':address.deliProvinceSid,
            'deliCitySid':address.deliCitySid,
            'postcode':address.postcode,
            'provinceName':address.provinceName,
            'cityName':address.cityName,
            'tel':address.tel,
            'fullAddress':address.provinceName + address.cityName + address.address,
            'flag':getAddNewAddr()
        };
        url = '${ctx}/order/newAddress.json';
        reload = getAddNewAddr() == '1' ? true : false;
    }
    $.ajax({
        url:url,
        type: 'post',
        dataType: 'json',
        data:data,
        timeout: 30000,
        error: function() {
            $.popdialog(button, "cart_address_select_confirm", '填写地址信息失败,请重试');
            return;
        },
        success: function(response) {
            var result = response.result;
            var status = result.status;
            var message = result.message;
            $.popdialog($("#cart_address_select"), "cart_address_select_confirm", message);
            if (status == '1') {
                $("#validate_address").attr("value", "true");
                $("#validate_paytype").attr("value", "false");
                $("#validate_sendtype").attr("value", "false");
                renderAddressInfo();
                hideAddress();
                var typeids = response.typeids;
                var existCollect = response.existcollect;
                renderPayTypeOptions(existCollect);
                renderSendTypeOptions(typeids);
                showPaytypeForm();
                showSendtypeForm();
                if (reload) {
                    window.setTimeout(function() {
                        window.location.reload();
                    }, 2000);
                }
            }
            return;
        }
    });
}

<%--选择省份--%>
function selectProvince() {
    var province = $("#provincelist");
    var city = $("#citylist");
    var value = province.val();
    if (value == '') {
        return;
    }
    var provinceName = $("#provincelist").children("option[selected]").eq(0).html();
    province.attr("provinceName", provinceName);
    $.ajax({
        url:'${ctx}/district/selectprovince.json',
        type: 'post',
        dataType: 'json',
        data:{'provinceSID':value},
        timeout: 30000,
        error: function() {
            return;
        },
        success: function(response) {
            var result = response.citylist;
            city.html("<option value=''>请选择</option>");
            for (var i = 0; i < result.length; i++) {
                var ele = result[i];
                var option = $("<option value='" + ele['sid'] + "'>" + ele['name'] + "</option>");
                option.attr("freight", ele['freight']);
                option.attr("cityname", ele['name']);
                option.appendTo(city);
            }
            return;
        }
    });
}

<%--选择城市--%>
function selectCity() {
    var city = $("#citylist");
    var option = city.children("option[selected]").eq(0);
    var value = option.attr("value");
    var freight = option.attr("freight");
    if (value == '') {
        return;
    }
    city.attr("freight", freight);
    city.attr("cityName", option.html());
}

<%--显示发票信息表单--%>
function showInvoiceForm(button) {
    $("#cart_invoice").css("display", "none");
    $("#cart_invoice_form").css("display", "block");
    $(button).css("display", "none");
}

<%--激活发票信息表单--%>
function activateInvoiceForm() {
    var checkbox = $("#cart_invoice_form input[type='checkbox']").get(0);
    if (checkbox.checked) {
        $("#cart_invoice_form input[type='text']").get(0).disabled = false;
        $("#cart_invoice_form select").get(0).disabled = false;
    } else {
        $("#cart_invoice_form input[type='text']").get(0).disabled = true;
        $("#cart_invoice_form select").get(0).disabled = true;
    }
}

<%--隐藏发票信息表单--%>
function hideInvoiceForm() {
    if ($("#validate_invoice").val() != 'true') {
        $.popdialog($("#cart_invoice_cancel").get(0), 'invoice_shut_info', "请填写发票信息");
        return;
    }

    $("#cart_invoice").css("display", "block");
    $("#cart_invoice_form").css("display", "none");
    $("#cart_invoice").prev().children().eq(1).css("display", "block");
}

<%--渲染发票信息区域--%>
function renderInvoiceInfo() {
    var div = $("#cart_invoice");
    var flag = $("#cart_invoice_form input[type='checkbox']").get(0).checked;
    var header = $.trim($("#cart_invoice_form input[type='text']").eq(0).val());
    var content = $("#cart_invoice_form select").eq(0).children("option[selected]").eq(0).html();
    if (flag) {
        div.html("").append("<li>发票抬头：" + header + "</li>")
                .append("<li>发票内容：" + content + "</li>");
    } else {
        div.html("<li>不需要发票</li>");
    }
}

<%--
   提交发票信息修改
   @param button
--%>
function commitInvoiceForm(button) {
    var flag = $("#cart_invoice_form input[type='checkbox']").get(0).checked;
    var header = $.trim($("#cart_invoice_form input[type='text']").eq(0).val());
    var content = $("#cart_invoice_form select").eq(0).val();
    if (flag && header == '') {
        $.popdialog(button, "cart_invoice_commit", "请填写发票抬头");
        return;
    }
    $.ajax({
        url:'${ctx}/order/invoice.json',
        type: 'post',
        dataType: 'json',
        data:{'invoiceBit':flag ? "1" : "0",
            'invoiceName':header,
            'invoiceDesc':content
        },
        timeout: 30000,
        error: function() {
            $.popdialog(button, "cart_invoice_commit", '修改发票信息失败,请重试');
            return;
        },
        success: function(response) {
            var result = response.result;
            var status = result.status;
            var message = result.message;
            $.popdialog($("#cart_invoice_form").get(0), "cart_invoice_commit", message);
            if (status == '1') {
                $("#validate_invoice").attr("value", "true");
                renderInvoiceInfo();
                hideInvoiceForm();
            }
            return;
        }
    });
}

<%--显示支付方式选择表单--%>
function showPaytypeForm(button) {
    $("#cart_paytype").css("display", "none");
    $("#cart_paytype_form").css("display", "block");
    if (button) {
        $(button).css("display", "none");
    }
}

<%--隐藏支付方式选择表单--%>
function hidePaytypeForm() {
    if ($("#validate_paytype").val() != 'true') {
        $.popdialog($("#cart_paytype_cancel"), 'paytype_shut_info', "请选择支付方式");
        return;
    }
    $("#cart_paytype").css("display", "block");
    $("#cart_paytype_form").css("display", "none");
    $("#cart_paytype").prev().children().eq(1).css("display", "block");
}

<%--渲染支付方式信息--%>
function renderPaytypeInfo() {
    var payinput = $(":radio[name='cart_paytype_item'][checked]").eq(0);
    var paytype = payinput.next().html();

    $("#cart_paytype").html("<li>支付方式：<label class='icon_box'>" + paytype + "</label></li>");
}

<%--提交支付信息修改--%>
function commitPaytypeForm(button) {
    //判断是否填写了收货地址
    
    if ('true' != $("#validate_address").val()) {
        $.popdialog(button, "cart_paytype_commit", '请先填写收货人信息');
        return;
    }

    var arr = $(":radio[name='cart_paytype_item'][checked]");
    if (!arr || arr.length == 0) {
        $.popdialog(button, "cart_paytype_commit", '请选择支付方式');
        return;
    }

    var input = arr.eq(0);

    var paytype = input.val();

    var paytypename = input.next().text();
   
    var defaultbank = '';
    if(paytype=='17'){
     defaultbank = input.attr("flag");
      paytypename="信用卡快捷支付";
     //alert(defaultbank);
    }
     if(paytype=='19'){
     defaultbank = input.attr("flag");
      paytypename="借记卡快捷支付";
     //alert(defaultbank);
    }
    

    $.ajax({
        url:'${ctx}/order/paytype.json',
        type: 'post',
        dataType: 'json',
        data:{'paymentModeSid':paytype,
            'paymentModeName':paytypename,
             'defaultbank':defaultbank
             },
        timeout: 30000,
        error: function() {
            $.popdialog(button, "cart_paytype_commit", '修改支付方式失败,请重试');
            return;
        },
        success: function(response) {
            var result = response.result;
            var status = result.status;
            var message = result.message;
            $.popdialog($("#cart_paytype_form"), "cart_paytype_commit", message);
            if (status == '1') {
                $("#validate_paytype").attr("value", "true");
                renderPaytypeInfo();
                hidePaytypeForm();
            <%--选择了货到付款,隐藏配送方式选择,如果不是,显示配送方式选择--%>
                $("#cart_sendtype").css("display", "none");
                $("#cart_sendtype_form").css("display", "none");
                //$("#cart_sendtype_require").css("display","none");
                $("#cart_sendtype_require").css("display", "block");
                if (paytypename != '货到付款') {
                <%--&lt;%&ndash;如果已经填写过配送方式&ndash;%&gt;--%>
                <%--if('true'==$("#validate_sendtype").val()){--%>
                <%--$("#cart_sendtype").css("display","block");--%>
                <%--}else{--%>
                <%--$("#cart_sendtype_form").css("display","block");--%>
                <%--$("#cart_sendtype_require").css("display","block");--%>
                <%--}--%>
                    $("#cart_sendtype_form").css("display", "block");
                    //$("#cart_sendtype_require").css("display","block");
                    $("#validate_sendtype").val("false");
                } else {
                <%--如果是货到付款,处理运费,订单总金额--%>
                    var freight = response.freight;
                    if (freight !== 'undefined' && freight != '') {
                        freight = $.formatMoney(freight);
                        $(".cart_send_freight").each(function() {
                            $(this).html(freight)
                        });
                        $("#cart_total_freight").val(freight);
                        renderSendtypeInfo(freight);
                        $("#cart_sendtype").css("display", "block");
                        countAll();
                    }
                }
            }
            return;
        }
    });
}


<%--显示配送方式选择表单--%>
function showSendtypeForm(button) {
<%--如果支付方式选择的是货到付款,不显示配送方式选择项--%>
    if ('true' == $("#validate_paytype").val()) {
        var arr = $(":radio[name='cart_paytype_item'][checked]");
        var input = arr.eq(0);
        var paytype = input.val();
        var paytypename = input.next().text();
        /*         if('货到付款'==paytypename){
         $.popdialog(button,"show_send_type_info","您选择了货到付款,不需要填写配送方式");
         return;
         }*/
    }
    $("#cart_sendtype").css("display", "none");
    if ('货到付款' != paytypename) {
        $("#cart_sendtype_form").css("display", "block");
    }
    $("#cart_sendtype_require").css("display", "block");
    if (button) {
        $(button).css("display", "none");
    }
}

<%--隐藏配送方式选择表单--%>
function hideSendtypeForm() {
    if ($("#validate_sendtype").val() != 'true') {
        $.popdialog($("#cart_sendtype_cancel"), 'sendtype_shut_info', "请选择配送方式");
        return;
    }
    $("#cart_sendtype").css("display", "block");
    $("#cart_sendtype_form").css("display", "none");
    $("#cart_sendtype_require").css("display", "none");
    $("#cart_sendtype").prev().children().eq(1).css("display", "block");
}

<%--渲染配送方式信息--%>
function renderSendtypeInfo(freight) {
    var sendinputs = $(":radio[name='cart_sendtype_item'][checked]");
    var sendtype = "";
    if ('true' == $("#validate_paytype").val()) {
        var arr = $(":radio[name='cart_paytype_item'][checked]");
        var input = arr.eq(0);
        var paytype = input.val();
        var paytypename = input.next().text();
        if ('货到付款' == paytypename) {
            sendtype = "由上品选择合适的配送方式";
        } else {
            var sendinput = sendinputs.eq(0);
            sendtype = sendinput.next().html();
        }
    } else {
        var sendinput = sendinputs.eq(0);
        sendtype = sendinput.next().html();
    }
    if (!freight) {
        freight = "5.00";
    }
    var sendrequire = '无';
    var radios = $(":radio[name='send_require_item'][checked]");
    if (radios.length > 0) {
        sendrequire = radios.eq(0).val();
    }
    $("#cart_sendtype .send_type").eq(0).html(sendtype);
    $(".cart_send_freight").each(function() {
        $(this).html(freight);
    });
    $("#cart_sendtype .send_require").eq(0).html(sendrequire);
}

<%--提交配送信息修改--%>
function commitSendtypeForm(button) {
    //判断是否选择了支付方式
    if ('true' != $("#validate_paytype").val()) {
        $.popdialog(button, "cart_sendtype_commit", '请先选择支付方式');
        return;
    }
    var types = $(":radio[name='cart_sendtype_item'][checked]");
<%--判断是否选择了送货方式--%>
    if (!types || types.length == 0) {
        var arr = $(":radio[name='cart_paytype_item'][checked]");
        var input = arr.eq(0);
        var paytype = input.val();
        var paytypename = input.next().text();
    <%--如果支付方式不是货到付款--%>
        if ('货到付款' != paytypename) {
            $.popdialog(button, "cart_sendtype_commit", '请选择配送方式');
            return;
        }
    }
    var sendtype = types.eq(0).val();
    var sendtypename = types.eq(0).next().html();
    var freight = "5.00";
//       var freight=$(".cart_total_freight").eq(0).html();
    //获得配送特殊要求
    //var sendrequire = $("#send_require_memo").val();
	var sendrequire = '无';
    var radios = $(":radio[name='send_require_item'][checked]");
    if (radios.length > 0) {
        sendrequire = radios.eq(0).val();
    }
    $.ajax({
        url:'${ctx}/order/sendtype.json',
        type: 'post',
        dataType: 'json',
        data:{'sendType':sendtype,
            'sendTypeName':sendtypename,
            'sendCost':freight,
            'memo':sendrequire},
        timeout: 30000,
        error: function() {
            $.popdialog(button, "cart_sendtype_commit", '修改配送方式失败,请重试');
            return;
        },
        success: function(response) {
            var result = response.result;
            var status = result.status;
            var message = result.message;
            var freight = response.freight;
            $.popdialog($("#cart_sendtype_require").get(0), "cart_sendtype_commit", message);
            if (status == '1') {
                $("#validate_sendtype").attr("value", "true");
                renderSendtypeInfo();
                hideSendtypeForm();
                if (freight !== 'undefined' && freight != '') {
                    freight = $.formatMoney(freight);
                    $(".cart_send_freight").each(function() {
                        $(this).html(freight)
                    });
                    $("#cart_total_freight").val(freight);
                    countAll();
                }
            }
            return;
        }
    });
}


<%--显示商品数量修改表单--%>
function showProductForm(button) {
    $("#cart_table td:has(span)").each(
                                      function() {
                                          $(this).children("span").eq(0).css("display", "none");
                                          $(this).children("span").eq(1).css("display", "block");
                                      }
            );
    $(button).next().css("display", "block");
    $(button).css("display", "none");
}

<%--隐藏商品数量修改表单--%>
function hideProductForm(button) {
    $("#cart_table td:has(span)").each(
                                      function() {
                                          $(this).children("span").eq(0).css("display", "block");
                                          $(this).children("span").eq(1).css("display", "none");
                                      }
            );
    $(button).prev().css("display", "block");
    $(button).css("display", "none");
}

<%--校验订单信息是否填写正确--%>
function validateOrder(button) {
    if ($("#validate_address").val() == 'false') {
        $.popdialog(button, "validate_info", "您还没有填写收货地址");
        return false;
    }
    if ($("#validate_invoice").val() == 'false') {
        $.popdialog(button, "validate_info", "您还没有填写发票信息");
        return false;
    }
    if ($("#validate_paytype").val() == 'false') {
        $.popdialog(button, "validate_info", "您还没有选择支付方式");
        return false;
    }
    if ($("#validate_sendtype").val() == 'false') {
        var input = $(":radio[name='cart_paytype_item'][checked]").eq(0);
        var paytype = input.val();
        var paytypename = input.next().text();
        if (paytypename != '货到付款') {
            $.popdialog(button, "validate_info", "您还没有选择配送方式");
            return false;
        }
    }

    if ($("#validate_productlist").val() == 'false') {
        $.popdialog(button, "validate_info", "您还没有购买商品");
        return false;
    }
    return true;
}

<%--提交订单--%>
function commitOrder(button) {
    if (!validateOrder(button)) {
        return;
    }
    $.ajax({
        url:'${ctx}/order/commit.json',
        type: 'post',
        dataType: 'json',
        data:{},
        timeout: 30000,
        error: function() {
            $.popdialog(button, "order_confirm_commit", '确认订单失败，可能原因是库存不足，请检查商品库存量和购买数量');
            var url = '${ctx}/order/confirm.html'
            window.location = url;
            return;
        },
        success: function(response) {
            var result = response.result;
            var status = result.status;
            var message = result.message;
            if (status == '1') {
                var orderId = response.orderId;
                
                var url = '${ctx}/orderpay/' + orderId + '.html'
                window.location = url;
            } else {
                $.popdialog(button, "order_confirm_commit", message);
                if (status == '01') {
                    window.setTimeout(function() {
                        window.location = '${ctx}/login.html';
                    }, 5000);
                }
            }
            return;
        }
    });

}
function alipayAddress() {
    $("#forward").val(window.location.toString());
    $("#alipay_form").get(0).submit();
}


</script>
</head>

<body>
<%--订单提交前的校验数据--%>
<input type="hidden" id="validate_address" value="${validate_address}"/>
<input type="hidden" id="validate_invoice" value="${validate_invoice}"/>
<input type="hidden" id="validate_sendtype" value="${validate_sendtype}"/>
<input type="hidden" id="validate_paytype" value="${validate_paytype}"/>
<input type="hidden" id="validate_productlist" value="${validate_productlist}"/>

<div>
<div>
    <ul class="banner-channels">
        <ol><img src="${images}/y-p004.gif"/>
        </ol>
        <div class="cart-step">
            <img src="${images}/y_num001.gif" title="第一步" border="0"/><font color="#f60">挑选商品(1.请选颜色 2.请选尺码)</font> <img
                src="${images}/y_arr_001-c.gif" width="23" height="8"/>
            <img src="${images}/y_num002-c.gif" title="第二步" border="0"/><font color="#f60">我的购物车</font><img
                src="${images}/y_arr_001-c.gif" width="23" height="8"/>
            <img src="${images}/y_num003-c.gif" title="第三步" border="0"/><font color="#f60">确认结算</font><img
                src="${images}/y_arr_001.gif" width="23" height="8"/>
            <img src="${images}/y_num004.gif" title="第四步" border="0"/>订购成功
        </div>
    </ul>
</div>
<%--confirm-content开始--%>
<div id="pays-content">
<div class="pay-kong1"></div>
<div class="pays-bk0405">
    <li class="pays-bktit"><img src="${images}/y_003.gif" border="0" align="absmiddle"/>温馨提示：请仔细查看您的订单，点击“订单确认”后提交订单。
    </li>
    <li>　　　您成功提交订单后，表示您已接受了shopin.net上品折扣网的使用条件和相关交易条款,祝您购物愉快！</li>
</div>
<div class="pay-kong1"></div>
<div class="pays-bk1">
<div class="pays-tcony" id="cart_address_title">
    <div class="pay-tcon-re">收货人信息
        <%
            Cookie[] cookie = request.getCookies();
            String alipays = "";
            for (int i = 0; i < cookie.length; i++) {

                if (cookie[i].getName().equals("alipayLog")) {
                    alipays = cookie[i].getValue();
                }
            }
            if (alipays.equals("alipay")){
        %>
        <img src="${images}/bank/alipay_add_query.png" style="cursor:pointer" align="absmiddle"
             onClick="alipayAddress();"/>
         <%}%>
    </div>
    <div class="pay-tcon-re1" onClick="showAddressSelect(this)"
         <c:if test="${order.receptName==null}">style="display:none"</c:if>
            ><img src="${images}/bt_s1-6.gif" style="cursor:pointer"/></div>
</div>
<form id="alipay_form" method='post' action='${ctx}/aliAddress.html'>
    <div class="lcontent-img"></div>
    <input type="hidden" name="forward" id="forward"/>
</form>
<div class="pays-tinfo" id="cart_address"
     <c:if test="${order.receptName==null||''==order.receptName}">style="display:none"</c:if>>
    <li>姓名：${order.receptName}</li>
    <li>地址：${order.receptAddress}</li>
    <li>邮编：${order.inceptPostcode}</li>
    <li>手机：${order.receptPhone}</li>
</div>
  <div class="pays-tinfo" id="cart_address_select"
     <c:if test="${order.receptName!=null}">style="display:none"</c:if>>
    <h3 style="color:red;font-weight:normal">选择收货地址</h3>
    <ul class="address_list clear zc">
    <c:forEach items="${addresslist}" var="item" varStatus="status">

            <li <c:if test="${status.index==0}">class="select"</c:if>  onclick="selectOption(this)">
			<div class="addr_hd">
				<span class="addrinfo_province">${item.provinceName}</span>
				<span class="addrinfo_city" title="${item.cityName}">${item.cityName}</span>
				<span class="addrinfo_name" title="${item.name}">(${item.name} 收)</span>
			</div>
			<div class="addr_bd">
				<span class="addrinfo_dist">${item.address}</span>
				<span class="addrinfo_street" title="${item.fullAddress}">${item.fullAddress}</span><!--详细地址截15个字符 后续以省略号代替，title 取全部字符-->
				<span class="addrinfo_tel">${item.tel}</span>
			</div>
                      <span style="display:none;">
                        <input type="radio" name="cart_address_item" onClick="selectAddressOption(this)"
                               value="${item.sid}" class="address_select_radio"
                               <c:if test="${status.index==0}">checked="true"</c:if>/>
                        <label>${item.completeInfo}</label>
                        <input type="hidden" value="${item.name}"/>
                        <input type="hidden" value="${item.deliProvinceSid}"/>
                        <input type="hidden" value="${item.provinceName}"/>
                        <input type="hidden" value="${item.deliCitySid}"/>
                        <input type="hidden" value="${item.cityName}"/>
                        <input type="hidden" value="${item.address}"/>
                        <input type="hidden" value="${item.postcode}"/>
                        <input type="hidden" value="${item.tel}"/>
                        <input type="hidden" value="${item.fullAddress}"/>
                        <input type="hidden" value="${item.completeInfo}"/>
                    </span>

	     	</li>
    </c:forEach>
        </ul>
    <div class="addr_temp"><input type="button" onclick="selectAddressOption(this)" value="使用新地址" /></div>
</div>

<div class="pays-tinfo" id="cart_address_form" style="display:none">
    <li style="color:red">填写新的收货地址</li>
    <li><span>收货人：<input type="text" name="cart_address_name" value="${order.receptName}" style="width:120px"/></span>
    </li>
    <li>
                    <span>省份或直辖市：
                        <select style="width:120px" onChange="selectProvince()" id="provincelist">
                            <option value="">请选择</option>
                            <c:forEach items="${provincelist}" var="province">
                                <option value="${province.sid}">${province.name}</option>
                            </c:forEach>
                        </select>
                    </span>
                    <span>城市：
                        <select style="width:120px" onChange="selectCity()" id="citylist">
                            <option value="">请选择</option>
                        </select>
                    </span>
										<!--郊区已开通货到付款 支付提示 Date:2012-07-18 By:Shulf-->
                    <span id="PAG" style="color:#f00">郊区已开通货到付款 <a href="http://www.shopin.net/notice/1266.html" target="_blank" style="color:blue">详情点击</a></span>
											<script language="javascript" type="text/javascript">
											 $(function(){
											  $("#PAG").hide();
											  $("#provincelist").change(function(){
											   if($(this).val() == "10"){
											    $("#PAG").show();
											   }else{
											    $("#PAG").hide();
											   }
											  }); 
											 });
											</script>
										<!--郊区已开通货到付款 支付提示 Date:2012-07-18 By:Shulf-->
    </li>
    <li><span>地址：&nbsp;&nbsp;<input type="text" name="cart_address_address" value="${formAddress}" style="width:600px"/></span>
    </li>
    <li><span>邮编：&nbsp;&nbsp;<input type="text" name="cart_address_postcode" value="${order.inceptPostcode}"
                                    style="width:120px"/></span></li>
    <li><span>手机：&nbsp;&nbsp;<input type="text" name="cart_address_tel" value="${order.receptPhone}"
                                    style="width:120px"/></span></li>
    <li>
        <span <c:if test="${!isLogin}">style="display:none"</c:if>><input type="radio" name="new_address_option"
                                                                          value="0"/><label>作为临时收货地址</label></span>
        <c:if test="${isLogin}">
            <span><input type="radio" name="new_address_option" value="1" checked="true"/><label>加入我的地址簿</label></span>
        </c:if>
    </li>
</div>
<div class="pays-tinfo" id="cart_address_button"
     <c:if test="${order.receptName!=null}">style='display:none'</c:if> >
    <li>
                    <span><img src="${images}/w_47.gif" style="cursor:pointer" onClick="commitAddress(this)"/>
                    </span>

    </li>
</div>
<div class="pays-tcony" id="cart_paytype_title">
    <div class="pay-tcon-re">支付方式<!--<span style="font-weight: normal;color:#000000; ">（北京地区已开通货到付款）</span>--></div>
    <div class="pay-tcon-re1" onClick="showPaytypeForm(this);"
         <c:if test="${order.paymentModeSid==null}">style="display:none"</c:if>
            ><img src="${images}/bt_s1-6.gif" style="cursor:pointer"/></div>
</div>
<div class="pays-tinfo" id="cart_paytype"
     <c:if test="${order.paymentModeSid==null}">style="display:none"</c:if>>
    <li>支付方式：<label class='icon_box'><span title="${order.paymentModeName}" id="pay${order.paymentModeSid}"  class="icon ${order.defaultbank}">${order.paymentModeName}</span></label></li>
   
</div>
<div class="pays-tinfo" id="cart_paytype_form"
     <c:if test="${order.paymentModeSid!=null}">style="display:none"</c:if>>
    <li style="color:red">选择支付方式<span style="color:#3F88FF;padding-left:60px; "><a
            href="http://www.shopin.net/help/h_pay1.html" target="_blank">支付方式帮助>></a></span></li>

    <%
        Cookie[] cookies = request.getCookies();
        String cid = "";
        String alipay = "";
        for (int i = 0; i < cookies.length; i++) {
            if (cookies[i].getName().equals("cid")) {
                cid = cookies[i].getValue();
            }
            if (cookies[i].getName().equals("alipayLog")) {
                alipay = cookies[i].getValue();
            }
        }
        if (cid.equals("tenpay101125tgcxhd")) {
    %>
      <c:forEach items="${paymentlist}" var="item">
      <h3 style="color:red;font-weight:normal">第三方支付平台</h3>
      <ul class="cashier_list_icons clear zc">
        
        <c:if test="${item.sid=='10'}">
             <li class="cashier_bank ">
               <input type="radio" name="cart_paytype_item" value="${item.sid}" id="ebank_${item.sid}" checked='true'/>
		               <label class="icon_box" for="ebank_${item.sid}"><span title="${item.name}" id="pay${item.sid}"  class="icon">${item.name}</span></label>
            </li>
        </c:if>
     </c:forEach>
    <%} else if (alipay.equals("alipay")) {%>
    <c:forEach items="${paymentlist}" var="item">
        <c:if test="${item.sid=='3'}">

                <li class="cashier_bank ">
               <input type="radio" name="cart_paytype_item" value="${item.sid}" id="ebank_${item.sid}" checked='true'/>
		               <label class="icon_box" for="ebank_${item.sid}"><span title="${item.name}" id="pay${item.sid}"  class="icon">${item.name}</span></label>
            </li>
           
        </c:if>
    </c:forEach>
    <%} else if (cid.equals("shopin-cmb")) {%>
    <c:forEach items="${paymentlist}" var="item">
        <c:if test="${item.sid=='13'}">
            <li class="cashier_bank ">
               <input type="radio" name="cart_paytype_item" value="${item.sid}" id="ebank_${item.sid}" checked='true'/>
		               <label class="icon_box" for="ebank_${item.sid}"><span title="${item.name}" id="pay${item.sid}"  class="icon">${item.name}</span></label>
            </li>
        </c:if>
    </c:forEach>
    <%} else {%>
    <h3 style="color:red;font-weight:normal">第三方支付平台</h3>
      <ul class="cashier_list_icons clear zc">
    <c:forEach items="${paymentlist}" var="item">
    		<c:if test="${item.paymentTypeClassSid=='1'}">
    			<li class="cashier_bank "
		                <c:if test="${!existCollect&&item.name=='货到付款'}">style='display:none'</c:if> >
		            <input type="radio" name="cart_paytype_item" value="${item.sid}" id="ebank_${item.sid}"
		                   <c:if test="${item.sid==order.paymentModeSid}">checked='true'</c:if>/>
		            <label class="icon_box" for="ebank_${item.sid}"><span title="${item.name}" id="pay${item.sid}"  class="icon">${item.name}</span></label>
		        </li>
    		</c:if>
        </c:forEach>
        </ul>
        <h3 style="color:red;font-weight:normal"><img src="http://images.shopin.net/images/w_95.png" width="100" height="14" align="middle"  />　无需开通网银，无支付限额，72小时安全赔付。（服务由支付宝提供）</h3>
	    <ul class="cashier_list_icons clear zc">
		<li class="cashier_bank ">
			<input id="ebank_04" type="radio" name="cart_paytype_item" value="17" flag="CMB">
			<label class="icon_box" for="ebank_04"><span title="招商银行" id="pay13" class="icon CMB">招商银行</span></label>
		</li>

		<li class="cashier_bank ">
			<input id="ebank_05" type="radio" name="cart_paytype_item" value="17" flag="CCB">
			<label class="icon_box" for="ebank_05"><span title="建设银行" class="icon CCB">建设银行</span></label>
		</li>

		<li class="cashier_bank ">
			<input id="ebank_21" type="radio" name="cart_paytype_item" value="17" flag="ICBC">
			<label class="icon_box" for="ebank_21"><span title="中国工商银行" id="pay11" class="icon ICBC">中国工商银行</span></label>
		</li>

		<li class="cashier_bank ">
			<input id="ebank_07" type="radio" name="cart_paytype_item" value="17" flag="BOC">
			<label class="icon_box" for="ebank_07"><span title="中国银行" class="icon BOC">中国银行</span></label>
		</li>

		<li class="cashier_bank ">
			<input id="ebank_08" type="radio" name="cart_paytype_item" value="17" flag="ABC">
			<label class="icon_box" for="ebank_08"><span title="农业银行" class="icon ABC">农业银行</span></label>
		</li>

		<li class="cashier_bank ">
			<input id="ebank_09" type="radio" name="cart_paytype_item" value="17" flag="CEB">
			<label class="icon_box" for="ebank_09"><span title="光大银行" class="icon CEB">光大银行</span></label>
		</li>

		<li class="cashier_bank ">
			<input id="ebank_20" type="radio" name="cart_paytype_item" value="17" flag="SPABANK">
			<label class="icon_box" for="ebank_20"><span title="平安银行" class="icon SPABANK">平安银行</span></label>
		</li>

		<li class="cashier_bank ">
			<input id="ebank_22" type="radio" name="cart_paytype_item" value="17" flag="SDB">
			<label class="icon_box" for="ebank_22"><span title="深圳发展银行" class="icon SDB">深圳发展银行</span></label>
		</li>
	</ul>
     <h3 style="color:red;font-weight:normal"><img src="http://images.shopin.net/images/w_97.png" width="100" height="14" align="middle"  />　无需开通网银，无支付限额，72小时安全赔付。（服务由支付宝提供）</h3>
	<ul class="cashier_list_icons clear zc">


		<li class="cashier_bank ">
			<input id="ebank_31" type="radio" name="cart_paytype_item" value="19" flag="CCB">
			<label class="icon_box" for="ebank_31"><span title="建设银行" class="icon CCB">建设银行</span></label>
		</li>

		<li class="cashier_bank ">
			<input id="ebank_32" type="radio" name="cart_paytype_item" value="19" flag="ICBC">
			<label class="icon_box" for="ebank_32"><span title="中国工商银行" class="icon ICBC">中国工商银行</span></label>
		</li>

		<li class="cashier_bank ">
			<input id="ebank_33" type="radio" name="cart_paytype_item" value="19" flag="BOC">
			<label class="icon_box" for="ebank_33"><span title="中国银行" class="icon BOC">中国银行</span></label>
		</li>

		<li class="cashier_bank ">
			<input id="ebank_34" type="radio" name="cart_paytype_item" value="19" flag="ABC">
			<label class="icon_box" for="ebank_34"><span title="农业银行" class="icon ABC">农业银行</span></label>
		</li>

		<li class="cashier_bank ">
			<input id="ebank_35" type="radio" name="cart_paytype_item" value="19" flag="CEB">
			<label class="icon_box" for="ebank_35"><span title="光大银行" class="icon CEB">光大银行</span></label>
		</li>
        	<li class="cashier_bank ">
			<input id="ebank_36" type="radio" name="cart_paytype_item" value="19" flag="SDB">
			<label class="icon_box" for="ebank_36"><span title="深圳发展银行" class="icon SDB">深圳发展银行</span></label>
		</li>
		
	</ul>


     <h3 style="color:red;font-weight:normal">网上银行</h3>
	 <ul class="cashier_list_icons clear zc">
         <c:forEach items="${paymentlist}" var="item">
    		<c:if test="${item.paymentTypeClassSid=='3'}">
    			<li class="cashier_bank "
		                <c:if test="${!existCollect&&item.name=='货到付款'}">style='display:none'</c:if> >
		            <input type="radio" name="cart_paytype_item" value="${item.sid}" id="ebank_${item.sid}"
		                   <c:if test="${item.sid==order.paymentModeSid}">checked='true'</c:if>/>
		            <label class="icon_box" for="ebank_${item.sid}"><span title="${item.name}" id="pay${item.sid}"  class="icon">${item.name}</span></label>
		        </li>
    		</c:if>
        </c:forEach>
    	</ul>
         <h3 style="color:red;font-weight:normal">找人代付</h3>
      <ul class="cashier_list_icons clear zc">
    <c:forEach items="${paymentlist}" var="item">
    		<c:if test="${item.paymentTypeClassSid=='6'}">
    			<li class="cashier_bank "
		                <c:if test="${!existCollect&&item.name=='货到付款'}">style='display:none'</c:if> >
		            <input type="radio" name="cart_paytype_item" value="${item.sid}" id="ebank_25"
		                   <c:if test="${item.sid==order.paymentModeSid}">checked='true'</c:if>/>
		            <label class="icon_box" for="ebank_25"><span title="${item.name}" id="pay${item.sid}"  class="icon other_pay">${item.name}</span></label>
		        </li>
    		</c:if>
        </c:forEach>
        </ul>

      <h3 style="color:red;font-weight:normal" <c:if test="${!existCollect}">style='display:none'</c:if>>货到付款</h3>

	  <ul class="cashier_list_icons clear zc">
	 	<c:forEach items="${paymentlist}" var="item">
    		<c:if test="${item.paymentTypeClassSid=='4'}">
    			<li class="cashier_bank "
		                <c:if test="${!existCollect&&item.name=='货到付款'}">style='display:none'</c:if> >
		            <input type="radio" name="cart_paytype_item" value="${item.sid}" id="ebank_${item.sid}"
		                   <c:if test="${item.sid==order.paymentModeSid}">checked='true'</c:if>/>
		            <label class="icon_box" for="ebank_${item.sid}"><span title="${item.name}" id="pay${item.sid}"  class="icon">${item.name}</span></label>
		        </li>
    		</c:if>
        </c:forEach>
    	</ul>


    <%}%>
    <li>
                    <span>
                        <img src="${images}/bt_s1-4.gif" style="cursor:pointer" onClick="commitPaytypeForm(this);"/>
                        <img src="${images}/bt_s1-5.gif" style="cursor:pointer" id="cart_paytype_cancel"
                             onClick="hidePaytypeForm();"/>
                    </span>
    </li>
</div>

<div class="pays-tcony" id="cart_sendtype_title">
    <div class="pay-tcon-re">配送方式<span
            style="font-weight: normal;color:#000000; ">（大件类超重物品，根据商品实际重量需另行加收运费，敬请理解。）</span></div>
    <div class="pay-tcon-re1" onClick="showSendtypeForm(this)"
         <c:if test="${order.sendType==null}">style="display:none"</c:if>
            ><img src="${images}/bt_s1-6.gif" style="cursor:pointer"/></div>
</div>
<div class="pays-tinfo" id="cart_sendtype"
        <c:if test="${order.sendType==null}">
            style="display:none"</c:if>>
    <li>配送方式：<span class="send_type"><c:if test="${order.paymentModeName=='货到付款'}">由上品选择合适的配送方式</c:if><c:if
            test="${order.paymentModeName!='货到付款'}">${order.sendTypeName}</c:if></span>&nbsp;&nbsp;
        运费：<span class='cart_send_freight' style="color:#cc0000;">${sendcost}</span>元
    </li>
</div>
<div class="pays-tinfo" id="cart_sendtype_form"
     <c:if test="${order.paymentModeName=='货到付款'||order.sendType!=null}">style="display:none"</c:if>>
    <li style="color:red">选择配送方式<span class="yunfeixiang"><a href="/help/h_log.html"
                                                             target="_blank">运费及送达时间详情>></a></span>
    </li>
    <c:forEach items="${expresslist}" var="item">
	<c:if test="${item.sid < 5}">
        <li
                <c:if test="${!fn:contains(avail_express_types,item.sid)}">style="display:none"</c:if> >
                    <span>
                        <input type="radio" name="cart_sendtype_item" value="${item.sid}"
                               <c:if test="${order.paymentModeName=='货到付款'&&item.sid==1}">checked='true'</c:if> />
                        <label>${item.expressName}<c:if
                                test="${item.expressMemo!=null}">(${item.expressMemo})</c:if></label>
                    </span>
        </li>
</c:if>
    </c:forEach>
    <c:if test="${order.paymentModeName=='货到付款'}">
        <li style="display:none">
            <input type="radio" name="cart_sendtype_item" value="${paytype.sid}" checked='true'/>
        </li>
    </c:if>
</div>
<div class="pays-tinfo" id="cart_sendtype_require"
     <c:if test="${order.sendType!=null&&not empty order.memo}">style="display:none"</c:if> >
    <li style="color:red">如对送货时间有特别要求请注明</li>
      <li>
                    <span>
                        <input type="radio" name="send_require_item"
                     <c:if test="${'工作日、双休日与假日均可送货'==order.memo}">checked='true'</c:if>
                               value="工作日、双休日与假日均可送货" class="send_require_select_radio"/>
                         <label>工作日、双休日与假日均可送货</label>
                    </span>
                </li>
                <li>
                    <span>
                         <input type="radio" name="send_require_item"
                     <c:if test="${'只双休日、假日送货(工作日不用送)'==order.memo}">checked='true'</c:if>
                               value="只双休日、假日送货(工作日不用送)" class="send_require_select_radio"/>
                         <label>只双休日、假日送货(工作日不用送)</label>
                    </span>
                </li>
                <li>
                    <span>
                         <input type="radio" name="send_require_item"
                     <c:if test="${'只工作日送货(双休日、假日不用送) (注：写字楼/商用地址客户请选择)'==order.memo}">checked='true'</c:if>
                               value="只工作日送货(双休日、假日不用送) (注：写字楼/商用地址客户请选择)" class="send_require_select_radio"/>
                         <label>只工作日送货(双休日、假日不用送) (注：写字楼/商用地址客户请选择)</label>
                    </span>
                </li>
                <input type="hidden" id="send_require_memo" name="send_require_memo" value=""/>
                <li>
                    <span>
                         <input type="radio" name="send_require_item"
                     <c:if test="${'学校地址/地址白天没人，请尽量安排其他时间送货 (注：特别安排可能会超出预计送货天数)'==order.memo}">checked='true'</c:if>
                               value="学校地址/地址白天没人，请尽量安排其他时间送货 (注：特别安排可能会超出预计送货天数)" class="send_require_select_radio"/>
                         <label>学校地址/地址白天没人，请尽量安排其他时间送货 (注：特别安排可能会超出预计送货天数)</label>
                    </span>
                </li>
                <!--<li>
                    <span>
                         <input type="radio" name="send_require_item" value="自定义" class="send_require_select_radio"/>
                         <label>自定义</label>
                    </span>
                </li>
    <li>
        <textarea rows="5" cols="40" id="send_require_memo" name="send_require_memo"></textarea>
    </li> -->
    <li>
                    <span>
                        <img src="${images}/bt_s1-4.gif" style="cursor:pointer" onClick="commitSendtypeForm(this);"/>
                        <img src="${images}/bt_s1-5.gif" style="cursor:pointer" id="cart_sendtype_cancel"
                             onClick="hideSendtypeForm();"/>
                    </span>
    </li>
</div>
<div class="pays-tcony" id="cart_invoice_title">
    <div class="pay-tcon-re">发票信息</div>
    <div class="pay-tcon-re1" onClick="showInvoiceForm(this)"
         <c:if test="${order.invoiceBit==null}">style="display:none"</c:if>
            ><img src="${images}/bt_s1-6.gif" style="cursor:pointer"/></div>
</div>
<div class="pays-tinfo" id="cart_invoice"
     <c:if test="${order.invoiceBit==null}">style="display:none"</c:if>>
    <c:if test="${order.invoiceBit==null||order.invoiceBit=='0'}">
        <li>不需要发票</li>
    </c:if>
    <c:if test="${order.invoiceBit!=null&&order.invoiceBit=='1'}">
        <li>发票抬头：${order.invoiceName}</li>
        <li>发票内容：${order.invoiceDesc}</li>
    </c:if>
</div>
<div class="pays-tinfo" id="cart_invoice_form"
     <c:if test="${order.invoiceBit!=null}">style="display:none"</c:if>>
    <li style="color:red">填写发票信息</li>
    <li>
                    <span>
                        <input type="checkbox" name="cart_invoice_flag" onClick="activateInvoiceForm()"
                               <c:if test="${order.invoiceBit!=null&&order.invoiceBit=='1'}">checked='true'</c:if> />
                        <label>开具发票</label>
                    </span>
    </li>
    <li>
                    <span>
                        发票抬头：<input type="text" name="cart_invoice_header" style="width:120px"
                            <c:if test="${order.invoiceBit==null||order.invoiceBit=='0'}"> disabled='true'</c:if>
                                    value="${order.invoiceName==null?"个人":order.invoiceName}"/>
                    </span>
    </li>
    <li>
                    <span>
                        发票内容：<select name="发票内容" style="width:125px"
                            <c:if test="${order.invoiceBit==null||order.invoiceBit=='0'}"> disabled='true'</c:if>>
                        <option value="体育用品" <c:if test="${'体育用品'==order.invoiceDesc}">selected='true'</c:if>/>
                        <label>体育用品</label>
                        <option value="服装" <c:if test="${'服装'==order.invoiceDesc}">selected='true'</c:if>/>
                        <label>服装</label>
                        <option value="包" <c:if test="${'包'==order.invoiceDesc}">selected='true'</c:if>/>
                        <label>包</label>
                        <option value="鞋" <c:if test="${'鞋'==order.invoiceDesc}">selected='true'</c:if>/>
                        <label>鞋</label>
                        <option value="礼品" <c:if test="${'礼品'==order.invoiceDesc}">selected='true'</c:if>/>
                        <label>礼品</label>
                    </select>
                    </span>
    </li>
    <li>
        <span><img src="${images}/bt_s1-4.gif" style="cursor:pointer" onClick="commitInvoiceForm(this)"/></span>
        <span><img src="${images}/bt_s1-5.gif" style="cursor:pointer" id="cart_invoice_cancel"
                   onClick="hideInvoiceForm()"/></span>
    </li>
</div>
</div>
<div class="pay-kong1"></div>
<div class="pays-bk1">
    <div class="pay-kong1"></div>
    <div class="pays-tcony">
        <div class="pay-tcon-re">商品清单</div>
        <div class="pay-tcon-re1" onClick="showProductForm(this);">
            <img src="${images}/bt_s1-6.gif" style="cursor:pointer"/>
        </div>
        <div class="pay-tcon-re1" onClick="hideProductForm(this);" style="display:none">
            <img src="${images}/bt_s1-4.gif" style="cursor:pointer"/>
        </div>
    </div>
    <div class="pays-tcontent" style="padding-left:10px">
        <table width="98%" border="0" cellspacing="0" cellpadding="0" id="cart_table"
               class="table_css">
            <tr>
                <td width="9%" bgcolor="#ffecd0" class="td_css">商品编码</td>
                <td width="20%" bgcolor="#ffecd0" class="td_css">商品名称</td>
                <td width="8%" bgcolor="#ffecd0" class="td_css">市场正价</td>
                <td width="8%" bgcolor="#ffecd0" class="td_css">上品价</td>
                <td width="8%" bgcolor="#ffecd0" class="td_css">为您节省</td>
                <td width="10%" bgcolor="#ffecd0" class="td_css">颜色</td>
                <td width="9%" bgcolor="#ffecd0" class="td_css">尺寸</td>
                <td width="9%" bgcolor="#ffecd0" class="td_css">库存量</td>
                <td width="19%" bgcolor="#ffecd0" class="td_css">购买数量</td>
            </tr>
            <c:forEach items="${cartlist}" var="item">
                <tr>
                    <td bgcolor="#ffecd0" class="td_css">${item.proSku}</td>
                    <td bgcolor="#ffecd0" class="td_css"><a href="${ctx}/product/${item.productSid}.html"
                                                            target="_blank">${item.name}</a></td>
                    <td bgcolor="#ffecd0" class="td_css">
                        <del><fmt:formatNumber type="currency" value="${item.originalPrice}"/></del>
                    </td>
                    <td bgcolor="#ffecd0" class="td_css"><fmt:formatNumber type="currency"
                                                                           value="${item.promotionPrice}"/></td>
                    <td bgcolor="#ffecd0" class="td_css"><fmt:formatNumber type="currency"
                                                                           value="${item.originalPrice*1-item.promotionPrice*1}"/></td>
                    <td bgcolor="#ffecd0" class="td_css">${item.color}</td>
                    <td bgcolor="#ffecd0" class="td_css">${item.size}</td>
                    <td bgcolor="#ffecd0" class="td_css">${item.storeCount}</td>
                    <td valign="middle" bgcolor="#ffecd0" class="td_css">
                        <span>${item.qty}</span>
                            <span style="display:none">
                                <input type="hidden"
                                       value="${item.sid}_${item.qty}_${item.storeCount}_${item.promotionPrice}_${item.originalPrice}"/>
                                <input type="text" style="width:30px" size="3" value="${item.qty}"/>
                                <img src="${images}/bt_s1-8.gif" style="cursor:pointer" onClick="updateQty(this)"/>
                                <img src="${images}/bt_s1-7.gif" style="cursor:pointer" onClick="remove(this)"/>
                            </span>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <div id="cartMassage"></div>
        <c:if test="${fn:length(cartlist)<1}">
            购物车无商品，<a href="/index.html" target="_blank"><img src="${images}/y-p002.gif" border="0" style="cursor:pointer"/></a>
        </c:if>
    </div>
    <div class="pays-tcony1">
        <div class="pay-tcon-yre">
            <span>商品总金额：<span class="cart_total_amount" style="color:red">${amount}</span></span>
            <span style="padding-left:10px">总数量：<span class="cart_total_qty" style="color:red">${total}</span></span>
        </div>
        <%--<div class="pay-tcon-yre1">预计发货时间：09年09月09日 前</div>--%>
    </div>
</div>
<div class="pay-kong1"></div>
<div class="pays-bk2">

    <input type="hidden" id="cart_total_freight" value="${order.sendCost==null?"0.00":order.sendCost}"/>

    <div style="font-size:12px; line-height:24px; color:#333; border:1px solid #f90; font-weight:bold; background-color:#ffe6bf; text-indent:15px;width:743px;width:743px;">
        订单总金额：<span class="order_total_amount" style="color:red">${orderamount}</span>元
        商品总金额：<span class="cart_total_amount" style="color:red">${amount}</span>
        运费：<span class="cart_send_freight" style="color:red">${sendcost}</span></div>
    <div>
        <div class="pays-yes">
			<span style="padding-right:100px">
               <img src="${images}/y-p005.gif" border="0" onClick="commitOrder(this)" style="cursor:pointer"/>
            </span>
        </div>
    </div>
    <%--confirm-content结束--%>
</div>
<div class="clear"></div>
    <%
        if (cid.startsWith("ad-baidu")) {
    %>
<noscript>
    <img height="1" width="1" border="0" alt="" style="display:none"
         src="http://analytics.adsage.cn/atac.gif?acc=936&cid=1062&csid=2628&ver=1.0"/>
</noscript>
<script type="text/javascript" src="http://analytics.adsage.cn/atac.js"></script>
<script type="text/javascript">
    <!--
    ataTracker.setAccount("936");
    ataTracker.setConversion("1062", "2628");
    ataTracker.track();
    //-->
</script>
    <%
        }
    %>
</body>
</html>
