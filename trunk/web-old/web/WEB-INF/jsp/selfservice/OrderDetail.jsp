<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>退货订单详情</title>
<link href="${css}/message.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${js}/swfupload.js"></script>
<script type="text/javascript" src="${js}/swfupload.queue.js"></script>
<script type="text/javascript" src="${js}/fileprogress.js"></script>
<script type="text/javascript" src="${js}/handlers.js"></script>
<style type="text/css">
    <!--
    .STYLE3 {
        color: #FFFFFF;
        font-weight: bold;
    }

    -->

    <c:set var="refundImageDir" value="refundimages"/>

</style>
<script type="text/javascript">

    jQuery(document).ready(function($){
        <c:forEach items="${order.orderDetails}" var="item" varStatus="stat">

       var swfu_${item.proSid} = new SWFUpload({
            flash_url : "${ctx}/js/swfupload.swf",
            upload_url: "${ctx}/photoUpload/${refundImageDir}.html",
            //post_params: {"PHPSESSID" : "<?php echo session_id(); ?>"},
            file_size_limit : "1 MB",
            file_types : "*.jpg",
            file_types_description : "图片文件",
            file_upload_limit : 5,
            file_queue_limit : 0,
            custom_settings : {
                progressTarget : "${item.proSid}_fsUploadProgress",
                cancelButtonId : "${item.proSid}_btnCancel"
            },
            debug: false,
            // auto_upload:false,

            // Button settings
            //button_image_url: "/images/refundupload.png",
            button_width: "60",
            button_height: "25",
            button_placeholder_id: "${item.proSid}_spanButtonPlaceHolder",
            button_text: '上传图片',
            button_text_style: ".theFont { font-size: 16;color:#D6D6D6 }",
            button_text_left_padding: 10,
            button_text_top_padding: 5,

            // The event handler functions are defined in handlers.js
            file_queued_handler : fileQueued,
            file_queue_error_handler : fileQueueError,
            file_dialog_complete_handler : fileDialogComplete,
            upload_start_handler : uploadStart,
            upload_progress_handler : uploadProgress,
            upload_error_handler : uploadError,
            upload_success_handler : uploadSuccess_${item.proSid},
            upload_complete_handler : uploadComplete,
            queue_complete_handler : queueComplete    // Queue plugin event
        });
         </c:forEach>
    });
    <c:forEach items="${order.orderDetails}" var="item" varStatus="stat">
    function uploadSuccess_${item.proSid}(file, serverData) {
        //alert("ok"+serverData);
        var picurls = "${images}/${refundImageDir}/" + serverData;

        var pics = document.getElementById("${item.proSid}_renamepic").value;
        if (pics.split(";").length <= 5) {
            if (pics == "") {
                pics = picurls;
            } else {
                pics = pics + ";" + picurls;
            }
            document.getElementById("${item.proSid}_renamepic").value = pics;
            $('<span></span>').appendTo($("#${item.proSid}_haveduploadedpics")).text(" " + file.name);
        } else {
            alert('最多只允许上传五张图片！');
        }

        try {
            var progress = new FileProgress(file, this.customSettings.progressTarget);
            progress.setComplete();
            //progress.setStatus("==Complete==");
            progress.toggleCancel(false);

        } catch (ex) {
            this.debug(ex);
        }
    }
    </c:forEach>


</script>
<script type="text/javascript">
    function checkRefundNum(input, total, refunded) {
        var current = input.value;
        if (current == 0) {
            alert("您没有填写退货数量");
            input.value = 0;
            return false;
        } else if (total - refunded - current < 0) {
            input.value = 0;
            alert('退货数量填写不正确，最大值为' + (total - refunded));
            return false;
        }

        return true;
    }

    function checkReson() {
        var flag = true;
        $('input[type=checkbox]').each(function() {
            if (this.checked) {
                var pre = $(this).val();
                var id = '#' + pre + '_refundReson  option:selected';
                var picid = '#' + pre + "_renamepic";
                var name = "#" + pre + "_proName";
                if ($(id).text() == "质量问题" || $(id).text() == "商品脏、残") {
                    if ($(picid).val() == "") {
                        alert($(name).val() + "退货原因是【" + $(id).text() + "】必须上传图片!");
                        flag = false;
                        if (flag == false)
                            return flag;
                    }
                }
            }
        });
        return flag;
    }
    function checkDescription() {
        var flag = true;
        $('input[type=checkbox]').each(function() {
            if (this.checked) {
                var pre = $(this).val();
                var id = '#' + pre + '_refundReson  option:selected';
                var name = "#" + pre + "_proName";
                var description = '#' + pre + "_description";
                if ($(id).text() == "发错尺码、颜色、款号" || $(id).text() == "发错商品(品牌、订单号）") {
                    if ($(description).val() == "") {
                        alert("请填写" + $(name).val() + "商品的退货原因描述。例如‘尺码应该是SL，发成了XL。’");
                        flag = false;
                        if (flag == false)return flag;
                    }
                }
            }
        });
        return flag;
    }

    function checkCount() {
        var flag = true;
        //检验退货数量是否正确
        $('input[type=checkbox]').each(function() {
            if (this.checked) {
                var pre = $(this).val();
                var id = '#' + pre + '_refund_qty';
                var name = "#" + pre + "_proName";
                if ($(id).val() <= 0) {
                    alert($(name).val() + "没有填写退货数量");
                    flag = false;
                    if (flag == false)return flag;
                }
            }
        });

        return flag;
    }
    function checkContent() {
        var msgContent = $.trim($("#msgContent").val());
        if ("" == msgContent) {
            alert('请填写留言内容');
            return false;
        } else if (msgContent.length > 200 || msgContent.length < 10) {
            alert("留言内容不能超过200个字符,最少为10个有效字符！");
            return false;
        }
        return true;
    }

    function haveCheck() {
        var i = 0;
        $('input[type=checkbox]').each(function() {
            if (this.checked) {
                i++;
            }
        })
        if (i < 1) {
            alert('没有选择退货商品！');
            return false;
        }
        return true;
    }
    function commitRefundLeaveMsg() {
        var email = $.trim($("#userEmail").val());
        //检查邮箱地址
        var valid = /^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/.test(email);
        //&&checkCount()&&checkReson()

        if (haveCheck() && checkCount() && checkReson() && checkDescription() && checkContent()) {
            $("#refundForm").submit();
        }
    }

    function checkIsNumber(input){
        if(isNaN(input.value)){
            alert("只允许输入数字！");
            input.value="";
        }
    }

</script>

</head>
<body>
<div id="page1">
    <div class="biaoti1"><img src="${images}/0414m4.gif" alt="在线留言"/></div>
    <div class="faq0414-2">
        <table width="90%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:0 auto;">
            <form action="${ctx}/refundapply/commit.html" id="refundForm" method="post">
                <tr>
                    <td height="60" colspan="3" align="left" valign="middle" class="tabletitle1">问题类型：商品售后问题 -- 退货申请
                        <input type="hidden" name="typeId" value="${typeId}"/>
                    </td>
                </tr>
                <tr>
                    <td width="13%" height="70" align="left" valign="middle">我的订单号是</td>
                    <td width="1%" height="30" align="left" valign="middle">&nbsp;</td>
                    <td width="86%" align="left" valign="middle">
                        <input name="orderId" id="orderId" type="text" class="faq0414-2kuang" readonly
                               value="${orderNo}" editable="false"/>
                    </td>
                </tr>

                <tr>
                    <td height="35" colspan="3" align="center" valign="middle">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="EFF0E8">
                            <tr>
                                <td width="9%" height="30" align="center" valign="middle" bgcolor="73B9B1"><span
                                        class="STYLE3">
          <label></label>
          退货请勾选
        </span></td>
                                <td width="10%" align="center" valign="middle" bgcolor="73B9B1"><span class="STYLE3">商品编号</span>
                                </td>
                                <td width="38%" height="30" align="center" valign="middle" bgcolor="73B9B1"><span
                                        class="STYLE3">商品名称</span></td>
                                <td width="10%" align="center" valign="middle" bgcolor="73B9B1"><span class="STYLE3">商品价格</span>
                                </td>
                                <td width="12%" align="center" valign="middle" bgcolor="73B9B1"><span class="STYLE3">可退货数量</span>
                                </td>
                                <td width="11%" align="center" valign="middle" bgcolor="73B9B1"><span class="STYLE3">退货数量</span>
                                </td>
                                <td width="10%" align="center" valign="middle" bgcolor="73B9B1"><span class="STYLE3">退货原因</span>
                                </td>
                                <td width="10%" align="center" valign="middle" bgcolor="73B9B1"><span class="STYLE3">原因描述</span>
                                </td>
                            </tr>
                            <c:forEach items="${order.orderDetails}" var="item" varStatus="stat">
                            <c:if test="${order.orderStatus >= 2 && (item.saleSum-item.refundNum)>0}"> <%--//保证订单交易成功--%>
                            <tr>
                                <td height="60" align="center" valign="middle"><label>
                                    <input type="checkbox" name="${item.proSid}_needRefund"
                                           id="${item.proSid}_needRefund" value="${item.proSid}"/>
                                </label></td>
                                <td height="60" align="center" valign="middle">${item.proSku}</td>
                                <td align="center" valign="middle"><a href="${ctx}/product/${item.proSid}.html"
                                                                      target="_blank"><input type="hidden"
                                                                                             id="${item.proSid}_proName"
                                                                                             value="${item.proName}">${item.proName}
                                </a></td>
                                <td align="center" valign="middle"><fmt:formatNumber type="currency"
                                                                                     value="${item.salePrice}"/></td>
                                <td align="center" valign="middle"><label>${item.saleSum-item.refundNum}</label></td>
                                <td align="center" valign="middle">
                                    <input name="${item.proSid}_refund_qty" id="${item.proSid}_refund_qty" type="text"
                                           class="faq0414-2kuang" size="5" value="0" onkeyup="checkIsNumber(this)"
                                           onblur="checkRefundNum(this,'${item.saleSum}','${item.refundNum}')"/>
                                </td>
                                <td align="left" valign="middle">
                                    <label>
                                        <select name="${item.proSid}_refundReson" id="${item.proSid}_refundReson">
                                            <%--<option selected value="-1">选择退货原因</option>--%>
                                            <c:forEach items="${reasons}" var="reason">
                                            <option value="${reason.rsid}">${reason.reson}</option>
                                            </c:forEach>
                                        </select>
                                    </label>
                                </td>
                                <td align="center" valign="middle"><input type="text" name="${item.proSid}_description"
                                                                          id="${item.proSid}_description"/></td>
                            </tr>
                            <tr>
                                <td height="40" colspan="2" align="center" valign="middle" bgcolor="#CCCCCC">
                                    最多5张jpg图片单张小于1M
                                </td>
                                <td height="40" align="center" bgcolor="#CCCCCC">
                                    <div style="padding: 0; vertical-align: baseline;"><span
                                            id="${item.proSid}_spanButtonPlaceHolder"></span>&nbsp;<input
                                            id="${item.proSid}_btnCancel" type="button" value="取消上传"
                                            onclick="swfu.cancelQueue();" disabled="disabled"/></div>
                                </td>
                                <td height="40" colspan="5" align="left" valign="top" bgcolor="#CCCCCC"
                                    id="${item.proSid}_fsUploadProgress">
                                    已经上传的图片:<span id="${item.proSid}_haveduploadedpics"></span>
            <span class="fieldset flash">
            <span class="wrapper">
                <input type="hidden" id="${item.proSid}_renamepic" name="${item.proSid}_picurls" value="${picurls}"/>
            </span>

	    </span>
                            </tr>
                                  </c:if>
                    </c:forEach>
                        </table>
                    </td>
                <tr>
                <tr>
                    <td height="50" colspan="3" align="left" valign="middle">我的留言（请输入200字以内）</td>
                </tr>
                <tr>
                    <td height="180" colspan="3" align="left" valign="top"><label>
                        <textarea cols="90" rows="10" name="msgContent" id="msgContent">${msgContent}</textarea>
                    </label></td>
                </tr>
                <tr>
                    <td height="26" align="left" valign="middle">我的名字</td>
                    <td height="30" align="left" valign="middle">&nbsp;</td>
                    <td align="left" valign="middle"><input type="text" name="userName" id="userName"
                                                            value="${order.receptName}" readonly/></td>
                </tr>
                <tr>
                    <td height="26" align="left" valign="middle">我的邮箱地址</td>
                    <td height="30" align="left" valign="middle">&nbsp;</td>
                    <td align="left" valign="middle"><input type="text" name="userEmail" id="userEmail" value="${email}"
                                                            readonly/></td>
                </tr>
                <tr>
                    <td height="26" align="left" valign="middle">我的联系电话</td>
                    <td height="30" align="left" valign="middle">&nbsp;</td>
                    <td align="left" valign="middle"><input type="text" name="tel" id="tel" value="${order.receptPhone}"
                                                            readonly/></td>
                </tr>
                <tr>
                    <td height="26" align="left" valign="middle">我的省市</td>
                    <td height="30" align="left" valign="middle">&nbsp;</td>
                    <td align="left" valign="middle"><input type="hidden" name="userProvince"
                                                            value="${order.inceptProvince}"
                                                            readonly/>${order.inceptProvince}</td>
                </tr>
                <tr>
                    <td height="26" align="left" valign="middle">是否需要回复</td>
                    <td height="30" align="left" valign="middle">&nbsp;</td>
                    <td align="left" valign="middle"><label>
                        <input type="radio" name="isNeedReplay" value="1" checked="true"/>
                    </label>
                        是
                        <label>
                            <input type="radio" name="isNeedReplay" value="0"/>
                        </label>
                        否
                    </td>
                </tr>
                <tr>
                    <td height="80" colspan="3" align="center" valign="middle"><label>
                        <a onclick="commitRefundLeaveMsg()" style="cursor:pointer;"><img name="imageField"
                                                                                         src="${images}/0414m15.gif"/></a>
                    </label></td>
                </tr>

            </form>
        </table>
    </div>
</div>

</body>
</html>
