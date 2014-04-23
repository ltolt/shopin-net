<%--
  Description:会员订单 
  User: Su Haibo  
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>订单详细信息</title>
<script type="text/javascript" src="${js}/input.js"></script>
<script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>
<script src="${js}/jquery/jquery-format-0.1.js" type="text/javascript"></script>
<link href="${css}/order-detail.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .table_css{border:1px solid #ff9900;border-collapse:collapse;margin-top:10px;}
    .td_css{border:1px solid #ff9900;}
</style>
<c:if test="${order.orderStatus>1}">
    <script type="text/javascript">
        $(document).ready(function() {
            var delivery = $("#deliverylist");
            var sid = ${order.orderId};
            $.ajax({
                url:'${ctx}/myshopin/delivery.json',
                type: 'post',
                dataType: 'json',
                data:{'orderId':sid},
                timeout: 30000,
                error: function() {
                    return;
                },
                success: function(response) {
                    var result = response.outDelivery;
                    delivery.html("");
                    for (var i = 0; i < result.length; i++) {
                        var ele = result[i];
                        var info = $("<li>" + result[i] + "</li>");
                        info.appendTo(delivery);
                    }
                    return;
                }
            });
        });
    </script>
</c:if>
<%--订单处于确认收货状态--%>
<c:if test="${'23'==order.orderClientStatus}">
<script type="text/javascript">
    <%--确认收货--%>
    function confirmAccept(){
        $.popalert($("#confirm_receive_pic"),"order_confirm_receive","您确认已收货吗?",doAccept);
    }
    function doAccept(){
       $.ajax({
                url:'${ctx}/order/receive.json',
                type: 'post',
                dataType: 'json',
                data:{'orderId':${order.orderId}},
                timeout: 30000,
                error: function(){
                    return;
                },
                success: function(response){
                    var result=response.result;
                    var status=result.status;
                    var message=result.message;
                    $.popdialog($("#confirm_receive_pic"),"order_confirm_receive",message);
                    if(status=='1'){
                          window.setTimeout(function(){
                              window.location.reload();
                          },2000);
                    }
                    return;
                }
         });
    }
</script>
</c:if>

<%--订单处于等待付款状态--%>
<c:if test="${order!=null&&'1'==order.orderClientStatus}">
<script type="text/javascript">
    <%--
        页面加载,
        绑定商品数量输入框的onkeyup事件,
        增加属性值product(SID),qty,saleprice,proprice,removeflag
        绑定地址选择列表数据
        绑定订单数据
    --%>
    var order_pay_old_html;
    var order_pay_old_css;
    var order_send_old_html;
    var order_send_old_css;
    var order_new_address_html;
    $(document).ready(function(){
       <%--绑定订单中的商品项数据到商品数量修改的input--%>
       $("#product_table_form input[name='order_detail_item']").each(
          function(){
            var str=$(this).prev().val();
            var arr=str.split("_");
            $(this).attr('product',arr[0]);
            $(this).attr('qty',arr[1]);
            $(this).attr('saleprice',arr[2]);
            $(this).attr('proprice',arr[3]);
            $(this).attr('removeflag','false');
            $(this).bind("keyup",function(){
               var value=$.trim($(this).val());
               value=value.replace(/\D/gi,"");
               if(value==''||value=='0'){
                       value=$(this).attr("qty");
               }
               $(this).attr("value",value);
            });
          }
      );
      <%--绑定地址数据到radio input--%>
      $("#order_address_select input[name='address_list_item']").each(function(){
          var radio=$(this);
          if(radio.val()!=''){
              var hiddens=radio.siblings("input[type='hidden']");
              var address={
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
      });

      <%--绑定支付选择项原数据,配送方式选择项元数据--%>
      order_pay_old_html=$("#order_paytype_form").html();
      order_pay_old_css=$("#order_paytype_form").css("display");
      order_send_old_html=$("#order_sendtype_form").html();
      order_send_old_css=$("#order_sendtype_form").css("display");
      order_new_address_html=$("#order_address_form").html();
    });

    <%--显示订单条款修改表单--%>
    function showEditForm(){
       $("#content-rightweihzi .order_detail_show").css("display","none");
       $("#content-rightweihzi .order_detail_edit").css("display","block");
       $("#product_table_form tr").each(function(){
           $(this).css("display","");
           var input=$(this).find("input[name='order_detail_item']").eq(0);
           input.attr("removeflag",'false');
           input.attr("value",input.attr("qty"));
       });
       $("#order_sale_sum_edit").html($("#order_sale_sum").html());
       $("#order_sale_qty_edit").html($("#order_sale_qty").html());
       $("#order_paytype_form").html(order_pay_old_html).css("display",order_pay_old_css);
       $("#order_sendtype_form").html(order_send_old_html).css("display",order_send_old_css);
       $("#order_address_form").html(order_new_address_html);
    }
    <%--隐藏订单条款修改表单--%>
    function hideEditForm(){
       $("#content-rightweihzi .order_detail_show").css("display","block");
       $("#content-rightweihzi .order_detail_edit").css("display","none"); 
    }
    <%--选择地址后,重新渲染配送方式选择项--%>
    function renderPayAndSendOptions(typeids,existCollect){
        if(!typeids||typeids.length==0){
            return;
        }
        var arr= $(":radio[name='order_sendtype_item']");
         <%--清空已经选择的选项--%>
         arr.each(function(){
             $(this).removeAttr("checked");
             $(this).parent().css("display","none");
             for(var i=0;i<typeids.length;i++){
                 if(typeids[i]==$(this).attr("value")){
                     $(this).parent().css("display","block");
                     break;
                 }
             }
        });
        $(":radio[name='cart_paytype_item']").each(function(){
            $(this).removeAttr("checked");
            $(this).parent().css("display","block");
            if($(this).next().text()=='货到付款'){
                if(existCollect=='0'){
                   $(this).parent().css("display","none");
                }
            }
        });
    }
    <%--地址簿效果js-----kongming--%>
    function selectOption(button){
        $("#order_address_form").css("display", "none");
        var address_lis = $("li[class='select']");
        for(var i=0;i<address_lis.length;i++){
            var address_li = address_lis.get(i);
             $(address_li).removeClass("select");
        }
        $(button).attr("class","select");
        var addressSid=$(button).attr('flag');
         $("#order_address_form").css("display","none");
           $.ajax({
                url:'${ctx}/order/selectAddress.json',
                type: 'post',
                dataType: 'json',
                data:{'addressSID':addressSid},
                timeout: 30000,
                error: function(){
                    return;
                },
                success: function(response){
                    var result=response.result;
                    var status=result.status;
                    var message=result.message;
                    if(status=='1'){
                          var typeids=response.typeids;
                          var existCollect=response.existcollect;
                          renderPayAndSendOptions(typeids,existCollect);
                    }
                    return;
                }
           });
       }
        




   <%--选择地址列表 --%>
function selectAddressOption(button) {
          var address_lis = $("li[class='select']");

         for(var i=0;i<address_lis.length;i++){
            var address_li = address_lis.get(i);

           $(address_li).removeClass("select");
        }
        $("#order_address_form").css("display", "block");
          



}



    <%--选择收货地址--%>
    function selectAddress(radio){
       var addressSid=$(radio).val();
       if(addressSid==''){
           $("#order_address_form").css("display","block");
       }else{
           $("#order_address_form").css("display","none");
           $.ajax({
                url:'${ctx}/order/selectAddress.json',
                type: 'post',
                dataType: 'json',
                data:{'addressSID':addressSid},
                timeout: 30000,
                error: function(){
                    return;
                },
                success: function(response){
                    var result=response.result;
                    var status=result.status;
                    var message=result.message;
                    if(status=='1'){
                          var typeids=response.typeids;
                          var existCollect=response.existcollect;
                          renderPayAndSendOptions(typeids,existCollect);
                    }
                    return;
                }
           });
       }
    }
    <%--选择省份--%>
    function selectProvince(){
          var province=$("#provincelist");
          var city=$("#citylist");
          var value=province.val();
          if(value==''){
              return;
          }
          var provinceName=$("#provincelist").children("option[selected]").eq(0).html();
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
                        option.attr("freight",ele['freight']);
                        option.attr("cityname",ele['name']);
                        option.appendTo(city);
                    }
                    return;
                }
         });
    }
    <%--选择城市--%>
    function selectCity(){
          var city=$("#citylist");
          var option=city.children("option[selected]").eq(0);
          var value=option.attr("value");
          var freight=option.attr("freight");
          if(value==''){
              return;
          }
          $.ajax({
            url:'${ctx}/district/selectcity.json',
            type: 'post',
            dataType: 'json',
            data:{'citySID':value},
            timeout: 30000,
            error: function(){
                return;
            },
            success: function(response){
                var typeids=response.typeids;
                var existCollect=response.existcollect;
                renderPayAndSendOptions(typeids,existCollect);
                return;
            }
          }); 
    }

    <%--填写发票信息--%>
    function activateInvoiceForm(){
         var checkbox=$("#order_invoice_form input[type='checkbox']").get(0);
         if(checkbox.checked){
          $("#order_invoice_form input[type='text']").removeAttr("disabled");
          $("#order_invoice_form select").removeAttr("disabled");
         }else{
          $("#order_invoice_form input[type='text']").attr("disabled","true");
          $("#order_invoice_form select").attr("disabled","true");
         }
    }

    <%--选择支付方式--%>
    function selectPayType(radio){
        if("货到付款"==$(radio).next().text()){
           $("#order_sendtype_form").css("display","none");
           $("#order_sendtype_require_form").css("display","none");
        }else{
           $("#order_sendtype_form").css("display","block");
           $("#order_sendtype_require_form").css("display","block");
        }
    }

    <%--修改商品数量检查库存--%>
    function checkStore(input){
       var prodetailsid=$(input).attr("product");
       var qty=$(input).attr("qty");
       var saleprice=$(input).attr("saleprice");
       var proprice=$(input).attr("proprice");
       var value=$.trim($(input).val());
       if(value==''||value=='0'||isNaN(value)||!/^\d+$/.test(value)){
           $.poptip(input,prodetailsid+"_qty_check","输入的数量不正确，请输入大于0的数字");
           return;
       }
       $.ajax({
            url:'${ctx}/cart/checkstore.json',
            type: 'post',
            dataType: 'json',
            data:{'proDetailSID':prodetailsid,
                  'price':saleprice,
                  'qty':value
                  },
            timeout: 30000,
            error: function(){
                return;
            },
            success: function(response){
                var result=response.result;
                var status=result.status;
                var message=result.message;
                var storeqty=response.storeqty;
                if('1'==status){
                  count();
                }else{
                  $.poptip(input,prodetailsid+"_qty_check",message);
                }
                $(input).attr("store",storeqty);
                return;
            }
      }); 
    }

    <%--删除商品--%>
    function remove(input){
        $(input).prev().attr("removeflag","true");
        $(input).parent().parent().css("display","none");
    }

    <%--计算商品总数量,商品总金额--%>
    function count(){
       var order_sale_sum=0;
       var order_sale_qty=0;
       var product=getProductData();
       for(var i=0;i<product.length;i++){
           var item=product[i];
           var saleSum=item.saleSum;
           var salePrice=item.salePrice;
           order_sale_qty+=parseInt(saleSum);
           order_sale_sum+=parseFloat(salePrice)*parseInt(saleSum);
       }
       $("#order_sale_sum_edit").html($.formatMoney(""+order_sale_sum));
       $("#order_sale_qty_edit").html(order_sale_qty);
    }
    <%--修改获取地址信息的js---kongming--%>
    <%--获得地址信息--%>
function getAddressData() {
     var addr = {};
    var address_radios = $("li[class='select'] :radio[name='address_list_item']");

    //var address_new =    $("div #cart_address_form [style='display:block']");
    var address_new = $("div #order_address_form");
    var flag = $(address_new).css("display");

    if (address_radios.length == 0) {
         if(flag == 'block'){

              addr.sid = '';
              addr.name = $.trim($("#order_address_form input[name='order_address_name']").val());
             addr.deliProvinceSid = $("#provincelist").val();
           addr.provinceName = $("#provincelist option:selected").eq(0).html();
         addr.deliCitySid = $("#citylist").val();
         addr.cityName = $("#citylist option:selected").eq(0).html();
          addr.address = $.trim($("#order_address_form input[name='order_address_address']").val());
          addr.postcode = $.trim($("#order_address_form input[name='order_address_postcode']").val());
          addr.tel = $.trim($("#order_address_form input[name='order_address_tel']").val());
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
      <%-- 网站原有的获得地址信息方法
    function getAddressData(){
       var  address_radios=$(":radio[name='address_list_item'][checked]");
       if(address_radios.length==0){
           return '';
       }
       var address_radio=address_radios.eq(0);
       var addr={};
       if(address_radio.val()!=''){
           addr.name=address_radio.attr("receptname");
           addr.deliProvinceSid=address_radio.attr("deliProvinceSid");
           addr.provinceName=address_radio.attr("provinceName");
           addr.deliCitySid=address_radio.attr("deliCitySid");
           addr.cityName=address_radio.attr("cityName");
           addr.address=address_radio.attr("address");
           addr.postcode=address_radio.attr("postcode");
           addr.tel=address_radio.attr("tel");
           addr.newoption=address_radio.attr("newoption");
          return addr;
       }
       addr.name=$.trim($("#order_address_form input[name='order_address_name']").val());
       addr.deliProvinceSid=$("#provincelist").val();
       addr.provinceName=$("#provincelist option:selected").eq(0).html();
       addr.deliCitySid=$("#citylist").val();
       addr.cityName=$("#citylist option:selected").eq(0).html();
       addr.address=$.trim($("#order_address_form input[name='order_address_address']").val());
       addr.postcode=$.trim($("#order_address_form input[name='order_address_postcode']").val());
       addr.tel=$.trim($("#order_address_form input[name='order_address_tel']").val());
       addr.newoption='1';
       return addr;
    }
    --%>

    <%--获得发票信息--%>
    function getInvoiceData(){
        var invoice={};
        invoice.invoiceBit=$("#order_invoice_form input[type='checkbox']").attr("checked")?'1':'0';
        invoice.invoiceName=$.trim($("#order_invoice_form input[name='order_invoice_header']").val());
        invoice.invoiceDesc=$("#order_invoice_form select").val();
        return invoice;
    }
    <%--新的支付方式获取信息方法--kongming--%>
    function getPayTypeData(){
        var arr = $(":radio[name='cart_paytype_item'][checked]");
        if (!arr || arr.length == 0) {
        $.popdialog(button, "cart_paytype_commit", '请选择支付方式');
        return;
    }
      var input = arr.eq(0);
      var paytype = {};
    var paymentModeSid = input.val();
    var paytypename = input.next().text();
      var defaultbank = '';
    if(paymentModeSid=='17'){
         defaultbank = input.attr("flag");
      paytypename="信用卡快捷支付";
     //alert(defaultbank);
    }
     if(paymentModeSid=='19'){
          defaultbank = input.attr("flag");
      paytypename="借记卡快捷支付";
     //alert(defaultbank);
    }
     paytype.paymentModeSid = paymentModeSid;
     paytype.paymentModeName =  paytypename;
     paytype.defaultbank = defaultbank;
     return paytype;

    }
    <%--获得支付方式信息
    function getPayTypeData(){
       var paytype_radios=$(":radio[name='order_paytype_item'][checked]");
       if(paytype_radios.length==0){
           return '';
       }
       var paytype={};
       paytype.paymentModeSid=paytype_radios.eq(0).val();
       paytype.paymentModeName=paytype_radios.eq(0).next().html();
       return paytype;
    }--%>
    <%--获得配送方式信息--%>
    function getSendTypeData(){
       var paytype=getPayTypeData();
       if('货到付款'==paytype.paymentModeName){
           return {'sendType':'','sendTypeName':'','memo':''};
       }
       var send_radios=$(":radio[name='order_sendtype_item'][checked]");
       if(send_radios.length==0){
           return '';
       }
       var sendtype={};
       sendtype.sendType=send_radios.eq(0).val();
       sendtype.sendTypeName=send_radios.eq(0).next().html();
       sendtype.memo='无';
       var require_radios=$(":radio[name='send_require_item'][checked]");
       if(require_radios.length!=0){
          sendtype.memo=require_radios.eq(0).val(); 
       }
       return sendtype;
    }
    <%--获得订单商品信息--%>
    function getProductData(){
      var order_detail_list=[];
      $("#product_table_form input[name='order_detail_item']").each(function(){
          if($(this).attr("removeflag")=='false'){
             var order_detail={};
             order_detail.proDetailSid=$(this).attr("product");
             order_detail.saleSum=$.trim($(this).attr("value"));
             order_detail.salePrice=$(this).attr("saleprice");
             order_detail_list.push(order_detail);
          }
      });
      return order_detail_list;
    }
    <%--获得,是否将新地址加入地址簿信息--%>
    function getAddNewAddr(){
       var address=getAddressData();
       if(address!=''&&'1'==address.newoption){
           var radios=$(":radio[name='new_address_option'][checked]");
           if(radios.length>0){
               var value=radios.eq(0).val();
               return value;
           }
       }
       return '0';
    }

    <%--获得表单数据--%>
    function getOrderData(){
       <%--获得地址信息--%>
       var order={};
       order.orderId='${order.orderId}';
       var address=getAddressData();
       order.receptName=address.name;
       order.inceptProvinceSid=address.deliProvinceSid;
       order.inceptProvince=address.provinceName;
       order.inceptCitySid=address.deliCitySid;
       order.inceptCity=address.cityName;
       order.receptAddress=address.provinceName+address.cityName+address.address;
       order.inceptPostcode=address.postcode;
       order.receptPhone=address.tel;
       order.addNewAddr=getAddNewAddr();
       <%--获得发票信息--%>
       var invoice=getInvoiceData();
       order.invoiceBit=invoice.invoiceBit;
       order.invoiceName=invoice.invoiceName;
       order.invoiceDesc=invoice.invoiceDesc;
       <%--获得支付方式信息--%>
       var paytype=getPayTypeData();
       order.paymentModeSid=paytype.paymentModeSid;
       order.paymentModeName=paytype.paymentModeName;
       order.defaultbank=paytype.defaultbank;
       <%--获得配送方式信息--%>
       var sendtype=getSendTypeData();
       order.sendType=sendtype.sendType;
       order.sendTypeName=sendtype.sendTypeName;
       order.memo=sendtype.memo;
       var product=getProductData();
       var arr=[];
       for(var i=0;i<product.length;i++){
           var item=product[i];
           arr.push(item.proDetailSid+"_"+item.saleSum+"_"+item.salePrice);
       }
       order.productItems=arr;
       return order;
    }
    <%--校验收货地址--%>
    function validateAddress(){
       var address=getAddressData();
       var button=$("#save_button").get(0);
       if(''==address){
           $.popdialog(button,"save_modify_info","您还没有填写收货人信息");
           return false;
       }
       if('0'==address.newoption){
           return true;
       }
       var flag=true;
       var inputs=$("#order_address_form input[type='text']");
       if(address.name==''){
          $.poptip(inputs.get(0),"order_address_form_name_validate","请填写收货人姓名")
          flag=false;
       }
       if(address.deliProvinceSid==''){
          $.poptip($("#provincelist").get(0),"order_address_form_province_validate","请选择省份");
          flag=false;
       }
       if(address.deliCitySid==''){
          $.poptip($("#citylist").get(0),"order_address_form_city_validate","请选择城市");
          flag=false;
       }
       if(address.address==''){
         $.poptip(inputs.get(1),"order_address_form_address_validate","请填写收货地址");
         flag=false;
       }
       if(address.postcode==''){
        $.poptip(inputs.get(2),"order_address_form_postcode_validate","请填写邮政编码");
         flag=false;
       }
       if(!/^[1-9]{1}[0-9]{5}$/.test(address.postcode)){
        $.poptip(inputs.get(2),"order_address_form_postcode_validate","邮政编码错误,应为6位数字");
        flag=false;
       }
       if(!/^\d{11,12}$/.test(address.tel)){
        $.poptip(inputs.get(3),"order_address_form_tel_validate","电话号码填写不正确,应为11位或12位数字,(可以为电话或手机号码)");
        flag=false;
       }
       if(!flag){
         $.popdialog(button,"save_modify_info","收货人信息填写不正确");
       }
       return flag;
    }
    <%--校验发票信息--%>
    function validateInvoice(){
       var button=$("#save_button").get(0);
       var input=$("#order_invoice_form input[name='order_invoice_header']").get(0);
       var invoice=getInvoiceData();
       if(invoice.invoiceBit=='1'){
          if(invoice.invoiceName==''){
              $.poptip(input,"order_invoice_tip","发票抬头不能为空");
              $.popdialog(button,"save_modify_info","发票信息填写不正确");
              return false;
          }
       }
       return true;
    }
    <%--校验支付方式--%>
    function validatePayType(){
       var button=$("#save_button").get(0);
       var paytype=getPayTypeData();
       if(''==paytype){
           $.popdialog(button,"save_modify_info","请选择支付方式");
           return false;
       }
       return true;
    }
    <%--校验配送方式--%>
    function validateSendType(){
       var button=$("#save_button").get(0);
       var sendtype=getSendTypeData();
       if(''==sendtype){
           var paytype=getPayTypeData();
           if('货到付款'!=paytype.paymentModeName){
              $.popdialog(button,"save_modify_info","请选择配送方式");
              return false;
           }
       }
       return true;
    }
    <%--校验商品--%>
    function validateProduct(){
        var button=$("#save_button").get(0);
        var product=getProductData();
        if(product.length==0){
           $.popdialog(button,"save_modify_info","订单中不能没有商品");
           return false;
        }
        for(var i=0;i<product.length;i++){
            var obj=product[i];
            if(obj.saleSum==''||obj.saleSum=='0'||!/^\d+$/.test(obj.saleSum)){
               $.popdialog(button,"save_modify_info","订单中的商品数量填写不正确，应为数字");
               return false;
            }
        }
        return true;
    }

    <%--校验表单--%>
    function validate(){
        if(!validateAddress()){
            return false;
        }
        if(!validateInvoice()){
            return false;
        }
        if(!validatePayType()){
            return false;
        }
        if(!validateSendType()){
            return false;
        }
        if(!validateProduct()){
            return false;
        }
        return true;
    }

    <%--提交订单修改--%>
    function commitEdit(){
        if(!validate()){
            return;
        }
        var order=getOrderData();
        var button=$("#save_button").get(0);
        $.ajax({
            url:'${ctx}/order/edit.json',
            type: 'post',
            dataType: 'json',
            data:order,
            timeout: 30000,
            error: function(){
                return;
            },
            success: function(response){
                var result=response.result;
                var status=result.status;
                var message=result.message;
                if('1'==status){
                    var neworder=response.neworder;
                    $.popdialog(button,"save_modify_info",message);
                    window.setTimeout(function(){
                        window.location='${ctx}/myshopin/order/'+neworder.orderNo+".html";
                    },2000);
                }else{
                    $.popdialog(button,"save_modify_info",message); 
                }
                return;
            }
        }); 
    }
</script>
</c:if>
</head>

<body>

<%--面包屑内容开始--%>
<div id="breadcrumb">
    <a href="${ctx}">首页</a><span>></span>我的上品<span>></span>订单信息
</div>
<%--面包屑内容结束--%>
<div style="width:950px;float:left">
    <%--左侧分类开始--%>
    <jsp:include page="myshopin_left.jsp"/>
    <%--左侧分类结束--%>
    <%--右侧分类开始--%>
	<div id="content-rightweihzi">
        <c:if test="${order==null}">您查看的订单不存在!返回<a href="${ctx}/myshopin/orders.html">订单列表</a></c:if>
        <c:if test="${order!=null}">
         <div class="pc01">
            <li>
                <c:choose>
                    <c:when test="${status_number<1}">
                        <img src="${images}/o_s_11.gif"  />
                    </c:when>
                    <c:otherwise>
                        <img src="${images}/o_s_12.gif"
                            <c:if test="${'1'==order.orderClientStatus}">
                                style="cursor:pointer" title="我要付款"
                                onclick="javascript:window.location='${ctx}/order/pay/${order.orderId}.html';"
                            </c:if>  />
                    </c:otherwise>
                </c:choose>
            </li>
            <li><img src="${images}/l-5.gif"  /></li>
            <li>
                <c:choose>
                    <c:when test="${status_number<2}">
                        <img src="${images}/o_s_21.gif"  />
                    </c:when>
                    <c:otherwise>
                        <img src="${images}/o_s_22.gif"  />
                    </c:otherwise>
                </c:choose>
            </li>
            <li><img src="${images}/l-5.gif"  /></li>
            <li>
                <c:choose>
                    <c:when test="${status_number<3}">
                        <img src="${images}/o_s_31.gif"  />
                    </c:when>
                    <c:otherwise>
                        <img src="${images}/o_s_32.gif"  />
                    </c:otherwise>
                </c:choose>
            </li>
            <li><img src="${images}/l-5.gif"  /></li>
            <li>
                <c:choose>
                    <c:when test="${status_number<4}">
                        <img src="${images}/o_s_41.gif"  />
                    </c:when>
                    <c:otherwise>
                        <img src="${images}/o_s_42.gif" id='confirm_receive_pic'
                             <c:if test="${'23'==order.orderClientStatus}">
                                style="cursor:pointer" title="请点击确认收货"
                                onclick="confirmAccept();"
                            </c:if>  />
                    </c:otherwise>
                </c:choose>
            </li>
            <li><img src="${images}/l-5.gif"  /></li>
            <li>
                <c:choose>
                    <c:when test="${status_number<5}">
                        <img src="${images}/o_s_51.gif"  />
                    </c:when>
                    <c:otherwise>
                        <img src="${images}/o_s_52.gif"  />
                    </c:otherwise>
                </c:choose>
            </li>
        </div>
         <div class="banner">
             <em style="color:red">订单:${order.orderNo}</em><br/>
         </div>
         ${message}
         <c:if test="${'1'==order.orderClientStatus}">
         <div>
            <span style="float:left">
                <a href="${ctx}/order/pay/${order.orderId}.html"><img src="${images}/i-92.gif"/></a>
            </span>
            <span onClick="showEditForm();" style="float:right">
                <img src="${images}/bt_s1-6.gif" style="cursor:pointer" />
            </span>
         </div>
         </c:if>
         <c:if test="${'0'==order.orderClientStatus}">
         <div>
            <span style="float:left">
                <a href="${ctx}/order/reuse/${order.orderId}.html"><img src="${images}/i-92.gif"/></a>
            </span>
         </div>
         </c:if>
         <div id="content-right" class="order_detail_show">
            <ul class="biaoge" id="order_address_title">
                <li class="biaoge-top-modify">
                    <strong>收货人信息</strong>
                </li>
            </ul>
            <ul class="biaoge1"  id="order_address">
                <li>姓名：${order.receptName}</li>
                <li>地址：${showAddress}</li>
                <li>邮编：${order.inceptPostcode}</li>
                <li>电话：${order.receptPhone}</li>
            </ul>
            <ul class="biaoge" id="order_paytype_title">
                <li class="biaoge-top-modify"><strong>支付信息&nbsp;&nbsp;</strong></li>
            </ul>
            <ul class="biaoge1" id="order_paytype">
                <li>支付方式：${order.paymentModeName}</li>
            </ul>
            <ul class="biaoge" id="order_sendtype_title">
        	    <li class="biaoge-top-modify"><strong>配送信息&nbsp;&nbsp;</strong></li>
            </ul>
		    <ul class="biaoge1" id="order_sendtype">
                <li>
                    配送方式：${order.sendTypeName}&nbsp;<strong>
                    运费：<span class="order_send_cost"><fmt:formatNumber type="currency" value="${order.sendCost}"/></span>元</strong>
                </li>
                <li>时间要求：（注：如对送货时间有特别的要求请注明）</li>
                <li>${order.memo}</li>
                <c:if test="${not empty delivery.courierNo}">
                <li>配送公司：<c:if test="${not empty delivery.websiteUrl}"><a href="${delivery.websiteUrl}" target="_blank">${delivery.deliveryComName}</a></c:if><c:if test="${empty delivery.websiteUrl}">${delivery.deliveryComName}</c:if></li>
                <li>快递单号：${delivery.courierNo}</li>
                <li>联系电话：${delivery.linkerPhone}</li>
                <li>配送时间：${delivery.deliveryTime}</li>
                </c:if>
				<div id="deliverylist">
                 <c:if test="${delivery.deliveryComName=='乐运通'}">
                   <img src="${images}/2011/loading.gif"/>
                 </c:if>
        </div>
            </ul>
            <ul class="biaoge" id="order_invoice_title">
                <li class="biaoge-top-modify"><strong>发票信息&nbsp;&nbsp;</strong></li>
            </ul>
            <ul class="biaoge1" id="order_invoice">
                <c:if test="${order.invoiceBit==null||order.invoiceBit=='0'}">
                <li>不需要发票</li>
                </c:if>
                <c:if test="${order.invoiceBit!=null&&order.invoiceBit=='1'}">
                <li>发票抬头：${order.invoiceName}</li>
                <li>发票内容：${order.invoiceDesc}</li>
                </c:if>
            </ul>
            <ul class="biaoge">
                <li class="biaoge-top-modify"><strong>商品清单&nbsp;&nbsp;</strong></li>
            </ul>
            <div style="padding-left:10px;float:left">
                <table width="650px" id="product_table" class="table_css">
                   <tr>
                       <td width="15%" align="center" bgcolor="#ffecd0" class="td_css">商品编号</td>
                       <td width="15%" align="center" bgcolor="#ffecd0" class="td_css">商品名称</td>
                       <td width="10%" align="center" bgcolor="#ffecd0" class="td_css">商品正价</td>
                       <td width="10%" align="center" bgcolor="#ffecd0" class="td_css">上品价</td>
                       <td width="10%" align="center" bgcolor="#ffecd0" class="td_css">颜色</td>
                       <td width="10%" align="center" bgcolor="#ffecd0" class="td_css">尺寸</td>
                       <td width="20%" align="center" bgcolor="#ffecd0" class="td_css">购买数量</td>
                   </tr>
                   <c:forEach items="${order.orderDetails}" var="item">
                   <tr>
                       <td align="center" bgcolor="#ffecd0" class="td_css">${item.proSku}</td>
                       <td align="center" bgcolor="#ffecd0" class="td_css"><a href="${ctx}/product/${item.proSid}.html" target="_blank">${item.proName}</a></td>
                       <td align="center" bgcolor="#ffecd0" class="td_css"><del><fmt:formatNumber type="currency" value="${item.proPrice}"/></del></td>
                       <td align="center" bgcolor="#ffecd0" class="td_css"><fmt:formatNumber type="currency" value="${item.salePrice}"/></td>
                       <td align="center" bgcolor="#ffecd0" class="td_css">${item.proColorName}</td>
                       <td align="center" bgcolor="#ffecd0" class="td_css">${item.proSize}</td>
                       <td align="center" bgcolor="#ffecd0" class="td_css">${item.saleSum}</td>
                   </tr>
                   </c:forEach>
                   <tr>
                       <td colspan="7" bgcolor="#ffecd0" class="td_css" align="right">
                           <strong>
                                    商品总数量：<span id="order_sale_qty" style="color:red">${order.saleTotalQty}</span>
                                    商品总金额：<span id="order_sale_sum" style="color:red">
                                        <fmt:formatNumber type="currency" value="${order.saleMoneySum}"/></span>元
                                    </strong>
                       </td>
                   </tr>
                </table>
            </div>
         </div>
         <div id="content-right"  class="order_detail_edit" style="display:none">
            <ul class="biaoge" id="order_address_title">
                <li class="biaoge-top-modify">
                    <strong>收货人信息</strong>
                </li>
            </ul>
             	<div class="cont-box" id="order_address_select">
			   <h3 style="color:red;font-weight:normal">选择收货地址</h3>
                	<ul class="address_list clear zc">
                      <c:forEach items="${addresslist}" var="item" varStatus="status">

            <li <c:if test="${status.index==0}">class="select"</c:if> onclick="selectOption(this)" flag="${item.sid}">
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
                        <input type="radio" name="address_list_item" onClick="selectAddressOption(this)"
                               value="${item.sid}" class="address_select_radio"/>
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

              <%--  <c:forEach items="${addresslist}" var="item">
                <li>
                    <input type="radio" name="address_list_item" value="${item.sid}"
                           onclick="selectAddress(this);"/>
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
                </li>
                </c:forEach>--%>
                <div class="addr_temp"><input type="button" onclick="selectAddressOption(this)" value="使用新地址" /></div>
            </ul>
            <ul class="biaoge1" id="order_address_form"  style="display:none">
                <li style="color:red">填写新的收货地址</li>
                <li>收货人：<input type="text" name="order_address_name" value="${order.receptName}" style="width:120px"/></li>
                <li>省份或直辖市：
                        <select style="width:120px" onChange="selectProvince()" id="provincelist">
                            <option value="">请选择</option>
                            <c:forEach items="${provincelist}" var="province">
                                 <option value="${province.sid}">${province.name}</option>
                            </c:forEach>
                        </select>
                    城市：
                        <select style="width:120px" onChange="selectCity()" id="citylist">
                            <option value="">请选择</option>
                        </select>
                </li>
                <li>地址：&nbsp;&nbsp;<input type="text" name="order_address_address" value="${formAddress}" style="width:500px"/></li>
                <li>邮编：&nbsp;&nbsp;<input type="text" name="order_address_postcode" value="${order.inceptPostcode}" style="width:120px"/></li>
                <li>电话：&nbsp;&nbsp;<input type="text" name="order_address_tel" value="${order.receptPhone}" style="width:120px"/></li>
                <li>
                    <input type="radio" name="new_address_option" value="0" checked="true"/><label>作为临时收货地址</label>
                    <input type="radio" name="new_address_option" value="1"/><label>加入我的地址簿</label>
                </li>
            </ul>
            <ul class="biaoge" id="order_invoice_title">
                <li class="biaoge-top-modify"><strong>发票信息&nbsp;&nbsp;</strong></li>
            </ul>
            <ul class="biaoge1" id="order_invoice_form">
                <li style="color:red">填写发票信息</li>
                <li>
                    <input type="checkbox" name="order_invoice_flag" onclick="activateInvoiceForm()"
                           <c:if test="${order.invoiceBit!=null&&order.invoiceBit=='1'}">checked='true'</c:if> />
                    <label>开具发票</label>
                </li>
				<li>  
                   发票抬头：<input type="text" name="order_invoice_header" style="width:120px"
                   <c:if test="${order.invoiceBit==null||order.invoiceBit=='0'}"> disabled='true'</c:if>
                            value="${order.invoiceName}" />
                </li>
				<li>
                    发票内容：<select name="发票内容" style="width:125px"
                    <c:if test="${order.invoiceBit==null||order.invoiceBit=='0'}"> disabled='true'</c:if>>
                        <option value="体育用品" <c:if test="${'体育用品'==order.invoiceDesc}">selected='true'</c:if>/><label>体育用品</label>
                        <option value="包" <c:if test="${'包'==order.invoiceDesc}">selected='true'</c:if>/><label>包</label>
                        <option value="鞋" <c:if test="${'鞋'==order.invoiceDesc}">selected='true'</c:if>/><label>鞋</label>
                        <option value="礼品" <c:if test="${'礼品'==order.invoiceDesc}">selected='true'</c:if>/><label>礼品</label>
                    </select>
                </li>
            </ul>
            <ul class="biaoge" id="order_paytype_title">
                <li class="biaoge-top-modify"><strong>选择支付方式&nbsp;&nbsp;</strong></li>
            </ul>
             <div class="cont-box">
                <h3 style="color:red;font-weight:normal">第三方支付平台</h3>
                    <ul class="cashier_list_icons clear zc">
                    <c:forEach items="${paymentlist}" var="item">
    		<c:if test="${item.paymentTypeClassSid=='1'}">
    			<li class="cashier_bank "
		                <c:if test="${!existCollect&&item.name=='货到付款'}">style='display:none'</c:if> >
		            <input type="radio" name="cart_paytype_item" value="${item.sid}" id="ebank_${item.sid}"
		                   <c:if test="${item.sid==order.paymentModeSid}">checked='true'</c:if> onclick="selectPayType(this)"/>
		            <label class="icon_box" for="ebank_${item.sid}"><span title="${item.name}" id="pay${item.sid}"  class="icon">${item.name}</span></label>
		        </li>
    		</c:if>
        </c:forEach>
            </ul>
                <h3 style="color:red;font-weight:normal"><img src="http://images.shopin.net/images/w_95.png" width="100" height="14" align="middle"  />　无需开通网银，无支付限额，72小时安全赔付。（服务由支付宝提供）</h3>
                       <ul class="cashier_list_icons clear zc">
                       <li class="cashier_bank ">
                           <input id="ebank_04" type="radio" name="cart_paytype_item" value="17" flag="CMB" onclick="selectPayType(this)">
                           <label class="icon_box" for="ebank_04"><span title="招商银行" id="pay13" class="icon CMB">招商银行</span></label>
                       </li>

                       <li class="cashier_bank ">
                           <input id="ebank_05" type="radio" name="cart_paytype_item" value="17" flag="CCB" onclick="selectPayType(this)">
                           <label class="icon_box" for="ebank_05"><span title="建设银行" class="icon CCB">建设银行</span></label>
                       </li>

                       <li class="cashier_bank ">
                           <input id="ebank_21" type="radio" name="cart_paytype_item" value="17" flag="ICBC" onclick="selectPayType(this)">
                           <label class="icon_box" for="ebank_21"><span title="中国工商银行" id="pay11" class="icon ICBC">中国工商银行</span></label>
                       </li>

                       <li class="cashier_bank ">
                           <input id="ebank_07" type="radio" name="cart_paytype_item" value="17" flag="BOC" onclick="selectPayType(this)">
                           <label class="icon_box" for="ebank_07"><span title="中国银行" class="icon BOC">中国银行</span></label>
                       </li>

                       <li class="cashier_bank ">
                           <input id="ebank_08" type="radio" name="cart_paytype_item" value="17" flag="ABC" onclick="selectPayType(this)">
                           <label class="icon_box" for="ebank_08"><span title="农业银行" class="icon ABC">农业银行</span></label>
                       </li>

                       <li class="cashier_bank ">
                           <input id="ebank_09" type="radio" name="cart_paytype_item" value="17" flag="CEB" onclick="selectPayType(this)">
                           <label class="icon_box" for="ebank_09"><span title="光大银行" class="icon CEB">光大银行</span></label>
                       </li>

                       <li class="cashier_bank ">
                           <input id="ebank_20" type="radio" name="cart_paytype_item" value="17" flag="SPABANK" onclick="selectPayType(this)">
                           <label class="icon_box" for="ebank_20"><span title="平安银行" class="icon SPABANK">平安银行</span></label>
                       </li>

                       <li class="cashier_bank ">
                           <input id="ebank_22" type="radio" name="cart_paytype_item" value="17" flag="SDB" onclick="selectPayType(this)">
                           <label class="icon_box" for="ebank_22"><span title="深圳发展银行" class="icon SDB">深圳发展银行</span></label>
                       </li>
                   </ul>
                 <h3 style="color:red;font-weight:normal"><img src="http://images.shopin.net/images/w_97.png" width="100" height="14" align="middle"  />　无需开通网银，无支付限额，72小时安全赔付。（服务由支付宝提供）</h3>
                    <ul class="cashier_list_icons clear zc">


                        <li class="cashier_bank ">
                            <input id="ebank_31" type="radio" name="cart_paytype_item" value="19" flag="CCB" onclick="selectPayType(this)">
                            <label class="icon_box" for="ebank_31"><span title="建设银行" class="icon CCB">建设银行</span></label>
                        </li>

                        <li class="cashier_bank ">
                            <input id="ebank_32" type="radio" name="cart_paytype_item" value="19" flag="ICBC" onclick="selectPayType(this)">
                            <label class="icon_box" for="ebank_32"><span title="中国工商银行" class="icon ICBC">中国工商银行</span></label>
                        </li>

                        <li class="cashier_bank ">
                            <input id="ebank_33" type="radio" name="cart_paytype_item" value="19" flag="BOC" onclick="selectPayType(this)">
                            <label class="icon_box" for="ebank_33"><span title="中国银行" class="icon BOC">中国银行</span></label>
                        </li>

                        <li class="cashier_bank ">
                            <input id="ebank_34" type="radio" name="cart_paytype_item" value="19" flag="ABC" onclick="selectPayType(this)">
                            <label class="icon_box" for="ebank_34"><span title="农业银行" class="icon ABC">农业银行</span></label>
                        </li>

                        <li class="cashier_bank ">
                            <input id="ebank_35" type="radio" name="cart_paytype_item" value="19" flag="CEB" onclick="selectPayType(this)">
                            <label class="icon_box" for="ebank_35"><span title="光大银行" class="icon CEB">光大银行</span></label>
                        </li>
                            <li class="cashier_bank ">
                            <input id="ebank_36" type="radio" name="cart_paytype_item" value="19" flag="SDB" onclick="selectPayType(this)">
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
                                          <c:if test="${item.sid==order.paymentModeSid}">checked='true'</c:if> onclick="selectPayType(this)"/>
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
                                          <c:if test="${item.sid==order.paymentModeSid}">checked='true'</c:if> onclick="selectPayType(this)"/>
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
                                          <c:if test="${item.sid==order.paymentModeSid}">checked='true'</c:if> onclick="selectPayType(this)"/>
                                   <label class="icon_box" for="ebank_${item.sid}"><span title="${item.name}" id="pay${item.sid}"  class="icon">${item.name}</span></label>
                               </li>
                           </c:if>
                       </c:forEach>
                       </ul>
                        </div>

                 



           <%-- <ul class="biaoge1" id="order_paytype_form">
                <li style="color:red">选择支付方式</li>
                <c:forEach items="${paymentlist}" var="item">
	        
                <li>
                    <input type="radio" name="order_paytype_item" value="${item.sid}"
                           onclick="selectPayType(this)"
                            <c:if test="${item.sid==order.paymentModeSid}">checked='true'</c:if>
                    />
                    <label>${item.name}</label>
                </li>
                
                </c:forEach>
            </ul>--%>
            <ul class="biaoge" id="order_sendtype_title">
        	    <li class="biaoge-top-modify"><strong>配送信息&nbsp;&nbsp;</strong></li>
            </ul>
            <ul class="biaoge1" id="order_sendtype_form"
                <c:if test="${'货到付款'==order.paymentModeName}">style='display:none'</c:if>  >
                <li  style="color:red">选择配送方式</li>
                <c:forEach items="${expresslist}" var="item">
		<c:if test="${item.sid < 5}">
                 <li>
                    <input type="radio" name="order_sendtype_item" value="${item.sid}"
                 <c:if test="${item.sid==order.sendType}">checked='true'</c:if> />
                    <label>${item.expressName}<c:if test="${item.expressMemo!=null}">(${item.expressMemo})</c:if></label>
                </li>
		</c:if>
                </c:forEach>
            </ul>
            <ul class="biaoge1" id="order_sendtype_require_form">
                <li  style="color:red">时间要求：(注:如对送货时间有特别要求请注明) </li>
                <li>
                     <input type="radio" name="send_require_item"
                 <c:if test="${'工作日、双休日与假日均可送货'==order.memo}">checked='true'</c:if>
                           value="工作日、双休日与假日均可送货" class="send_require_select_radio"/>
                     <label>工作日、双休日与假日均可送货</label>
                </li>
                <li>
                     <input type="radio" name="send_require_item"
                 <c:if test="${'只双休日、假日送货(工作日不用送)'==order.memo}">checked='true'</c:if>
                           value="只双休日、假日送货(工作日不用送)" class="send_require_select_radio"/>
                     <label>只双休日、假日送货(工作日不用送)</label>
                </li>
                <li>
                     <input type="radio" name="send_require_item"
                 <c:if test="${'只工作日送货(双休日、假日不用送) (注：写字楼/商用地址客户请选择)'==order.memo}">checked='true'</c:if>
                           value="只工作日送货(双休日、假日不用送) (注：写字楼/商用地址客户请选择)" class="send_require_select_radio"/>
                     <label>只工作日送货(双休日、假日不用送) (注：写字楼/商用地址客户请选择)</label>
                </li>
                <li>
                     <input type="radio" name="send_require_item"
                 <c:if test="${'学校地址/地址白天没人，请尽量安排其他时间送货 (注：特别安排可能会超出预计送货天数)'==order.memo}">checked='true'</c:if>
                           value="学校地址/地址白天没人，请尽量安排其他时间送货 (注：特别安排可能会超出预计送货天数)" class="send_require_select_radio"/>
                     <label>学校地址/地址白天没人，请尽量安排其他时间送货 (注：特别安排可能会超出预计送货天数)</label>
                </li>
            </ul>
            <ul class="biaoge">
                <li class="biaoge-top-modify"><strong>商品清单&nbsp;&nbsp;</strong></li>
            </ul>
            <div style="padding-left:10px;float:left">
                <table width="650px" id="product_table_form" class="table_css">
                   <tr>
                       <td width="15%" align="center" bgcolor="#ffecd0" class="td_css">商品编号</td>
                       <td width="15%" align="center" bgcolor="#ffecd0" class="td_css">商品名称</td>
                       <td width="10%" align="center" bgcolor="#ffecd0" class="td_css">商品正价</td>
                       <td width="10%" align="center" bgcolor="#ffecd0" class="td_css">上品价</td>
                       <td width="10%" align="center" bgcolor="#ffecd0" class="td_css">颜色</td>
                       <td width="10%" align="center" bgcolor="#ffecd0" class="td_css">尺寸</td>
                       <td width="20%" align="center" bgcolor="#ffecd0" class="td_css">购买数量</td>
                   </tr>
                   <c:forEach items="${order.orderDetails}" var="item">
                   <tr>
                       <td align="center" bgcolor="#ffecd0" class="td_css">${item.proSku}</td>
                       <td align="center" bgcolor="#ffecd0" class="td_css"><a href="${ctx}/product/${item.proSid}.html" target="_blank">${item.proName}</a></td>
                       <td align="center" bgcolor="#ffecd0" class="td_css"><del><fmt:formatNumber type="currency" value="${item.proPrice}"/></del></td>
                       <td align="center" bgcolor="#ffecd0" class="td_css"><fmt:formatNumber type="currency" value="${item.salePrice}"/></td>
                       <td align="center" bgcolor="#ffecd0" class="td_css">${item.proColorName}</td>
                       <td align="center" bgcolor="#ffecd0" class="td_css">${item.proSize}</td>
                       <td align="center" bgcolor="#ffecd0" class="td_css">
                            <input type="hidden" value="${item.proDetailSid}_${item.saleSum}_${item.salePrice}_${item.proPrice}"/>
                            <input type="text" name="order_detail_item" style="width:30px" size="3" value="${item.saleSum}" onBlur="checkStore(this);"/>
                            <img src="${images}/bt_s1-7.gif" style="cursor:pointer" onClick="remove(this)"/>
                       </td>
                   </tr>
                   </c:forEach>
                   <tr>
                       <td colspan="7" bgcolor="#ffecd0" class="td_css" align="right">
                             <strong>
                                    商品总数量：<span id="order_sale_qty_edit" style="color:red">${order.saleTotalQty}</span>
                                    商品总金额：<span id="order_sale_sum_edit" style="color:red">
                                        <fmt:formatNumber type="currency" value="${order.saleMoneySum}"/></span>元
                             </strong>
                       </td>
                   </tr>
                </table>
            </div>
            <ul class="biaoge1">
                <li>
                    <img src="${images}/bt_s1-11.gif" style="cursor:pointer" onClick="commitEdit();" id="save_button"/>
                    <img src="${images}/bt_s1-5.gif" style="cursor:pointer" onClick="hideEditForm();"/>
                </li>
            </ul>
         </div>
         <div class="banner">
            <ul>
               <li><strong>订单总金额：<span class="order_total_sum"><c:if test="${not empty offPriceRecord.offPrice}"><fmt:formatNumber type="currency" value="${order.saleTotalSum*1-offPriceRecord.offPrice*1}"/></c:if><c:if test="${empty offPriceRecord.offPrice}"><fmt:formatNumber type="currency" value="${order.saleTotalSum}"/></c:if></span>元</strong></li>
               <li><strong>商品总金额：<span class="order_sale_sum"><fmt:formatNumber type="currency" value="${order.saleMoneySum}"/></span>元</strong></li>
               <li><strong>运费：<span class="order_send_cost"><fmt:formatNumber type="currency" value="${order.sendCost}"/></span>元</strong></li>
               <c:if test="${not empty offPriceRecord}">
               <li><strong>减免运费：<span class="order_send_cost"><fmt:formatNumber type="currency" value="${offPriceRecord.offPrice}"/></span>元</strong></li>
               </c:if>
            </ul>
         </div>
         <c:choose>
            <c:when test="${order.paymentModeSid == '4'}">
          <div >
             <ul style="float: left;">
                <li>
                    温馨提示：因上品折扣网与实体卖场同步销售，由于数据同步差异，个别商品偶有无货，遇此现象我们会及时电话或短信通
                </li>
                <li>
                　　　　　知您。由此给您带来的不便深表歉意！感谢您的支持！
                </li>
             </ul>
         </div>
            </c:when>
            <c:otherwise>
          <div>
             <ul style="float: left;">
                <li>
                    温馨提示：因上品折扣网与实体卖场同步销售，由于数据同步差异，个别商品偶有无货，遇此现象我们会及时电话或短信通
                </li>
                <li>
                　　　　　知您，并尽快给您办理退款。由此给您带来的不便深表歉意！感谢您的支持！
                </li>
             </ul>
         </div>
            </c:otherwise>
        </c:choose>
        </c:if>
    </div>
    <%--右侧分类结束--%>
</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>
</body>
</html>
