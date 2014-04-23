<%--
  Description:会员合并订单发货
  User: Su Haibo
  Date: 2010-1-18
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/common/meta.jsp"/>
<%@ include file="/common/taglibs.jsp" %>
<html>
<head>
<title>合并订单发货</title>
<script type="text/javascript" src="${js}/input.js"></script>
<script src="${js}/jquery/jquery-popdialog-0.1.js" type="text/javascript"></script>
<script src="${js}/jquery/jquery-format-0.1.js" type="text/javascript"></script>
<link href="${css}/order-detail.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    .table_css{border:1px solid #ff9900;border-collapse:collapse;margin-top:10px;}
    .td_css{border:1px solid #ff9900;}
    .refund_span{padding-left:5px;padding-right:5px}
</style>
<%--有可以合并的订单,--%>
<c:if test="${fn:length(orderlist)>1}">
<script type="text/javascript">
    <%--选择主订单--%>
    function selectMainOrder(radio){
        var main_orderId=$(radio).val();
        $("#order_merge_table input[name='order_merge_other']").each(function(){
            if($(this).val()==main_orderId){
                $(this).removeAttr("checked");
                $(this).attr("disabled","true");
            }else{
                $(this).removeAttr("disabled");
            }
        });
    }
    <%--获得合并订单的数据--%>
    function getMergeData(){
        <%--
        private String masterOrderid;      //主订单号
        private List<String> others;       //合并其他订单号
        private String refundFrtDirection; //退款去向  0 上品账号 1 原账户
        --%>
        var masterOrderid='';
        var others='';
        var main_radios=$(":radio[name='order_merge_main'][checked]");
        if(main_radios.length!=0){
            masterOrderid=main_radios.eq(0).val();
        }
        var other_radios=$(":checkbox[name='order_merge_other'][checked]");
        if(other_radios.length!=0){
            others=[];
            for(var i=0;i<other_radios.length;i++){
                if(other_radios.eq(i).val()!=masterOrderid){
                    others.push(other_radios.eq(i).val());
                }
            }
        }
        var refundFrtDirection='';
        var direction_radios=$(":radio[name='merge_direction'][checked]");
        if(direction_radios.length!=0){
            refundFrtDirection=direction_radios.eq(0).val();
        }
        var merge={};
        merge['masterOrderid']=masterOrderid;
        merge['others']=others;
        merge['refundFrtDirection']=refundFrtDirection;
        return merge;
    }

    <%--校验合并订单的数据--%>
    function validateMergeData(){
        var button=$("#merge_button");
        var merge=getMergeData();
        if(merge['masterOrderid']==''){
            $.popdialog(button,'merge_info',"请选择主订单");
            return false;
        }
        if(merge['others']==''){
            $.popdialog(button,'merge_info',"请选择要合并的订单");
            return false;
        }
        if(merge['refundFrtDirection']==''){
            $.popdialog(button,'merge_info',"请选择合并节省的运费返还方式");
            return false;
        }
        return true;
    }
    
    <%--选择合并订单--%>
    function doMerge(){
        var button=$("#merge_button");
        if(!validateMergeData()){
            return;
        }
        var merge=getMergeData();
        $.ajax({
            url:'${ctx}/order/merge.json',
            type: 'post',
            dataType: 'json',
            data:merge,
            timeout: 30000,
            error: function(){
                $.popdialog(button,"order_merge_commit","合并订单发货失败,请重试");
                return;
            },
            success: function(response){
                var result=response.result;
                var status=result.status;
                var message=result.message;
                $.popdialog(button,"order_merge_commit",message);
                if('1'==status){
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
</head>

<body>

<%--面包屑内容开始--%>
<div id="breadcrumb">
    <a href="${ctx}">首页</a><span>></span>我的上品<span>></span>订单管理<span>></span>合并订单发货
</div>
<%--面包屑内容结束--%>
<div style="width:950px;float:left">
    <%--左侧分类开始--%>
    <jsp:include page="myshopin_left.jsp"/>
    <%--左侧分类结束--%>
    <%--右侧分类开始--%>
	<div id="content-rightweihzi">
         <c:choose>
             <c:when test="${fn:length(orderlist)<2}">
                <ul class="biaoge" id="order_address_title">
                    <li>
                        <strong><font color="red">没有可以合并的订单</font></strong>
                    </li>
                </ul>
             </c:when>
             <c:when test="${fn:length(orderlist)>1}">
             <div id="content-right" class="order_detail_show">
                <ul class="biaoge" id="order_address_title">
                    <li class="biaoge-top-modify">
                        <strong  style="color:#5050B5">选择主订单，合并订单(货到付款订单不支持合并付款)</strong>
                    </li>
                </ul>
                <div style="padding-left:10px;float:left">
                    <table width="650" cellspacing="1" cellpadding="1" border="0" align="center"
                           id="order_merge_table" class="table_css">
                       <tr height="25">
                         <td width="10%" align="center" bgcolor="#ffecd0" class="td_css">主订单</td>
                         <td width="10%" align="center" bgcolor="#ffecd0" class="td_css">待合并订单</td>
                         <td width="20%" align="center" bgcolor="#ffecd0" class="td_css"><b>订单编号</b></td>
                         <td width="25%" align="center" bgcolor="#ffecd0" class="td_css"><b>下单时间</b></td>
                         <td width="10%" align="center" bgcolor="#ffecd0" class="td_css"><b>总数量</b></td>
                         <td width="25%" align="center" bgcolor="#ffecd0" class="td_css"><b>总金额</b></td>
                       </tr>
                       <c:forEach items="${orderlist}" var="item">
                           <tr height="25">
                             <td width="15%" align="center" bgcolor="#ffecd0" class="td_css">
                                 <input type="radio" name="order_merge_main" value="${item.orderId}"
                                         onclick="selectMainOrder(this)"/>
                             </td>
                             <td width="15%" align="center" bgcolor="#ffecd0" class="td_css">
                                 <input type="checkbox" name="order_merge_other" value="${item.orderId}"/>
                             </td>
                             <td align="center" bgcolor="#ffecd0" class="td_css">${item.orderNo}</td>
                             <td align="center"  bgcolor="#ffecd0" class="td_css">${item.saleTime}</td>
                             <td align="center" bgcolor="#ffecd0" class="td_css">${item.saleTotalQty}</td>
                             <td align="right" bgcolor="#ffecd0" class="td_css"><fmt:formatNumber type="currency" value="${item.saleTotalSum}" /></td>
                           </tr>
                           </c:forEach>
                    </table>
                </div>
                <div class="clear">&nbsp;</div>
                <ul class="biaoge1">
                    <li class="biaoge-top-modify">
                        合并订单节省的运费将返还给您，请选择返款方式
                    </li>
                    <li>
                        <%--<input type="radio" name="merge_direction" value='0' checked="true"/>
                        <label>将退货金额返到我的上品账户</label>--%>
                        <input type="radio" name="merge_direction" value='1' checked="true"/>
                        <label>将退货金额返到我付款时使用的银行卡账户或支付宝账户</label>
                    </li>
                    <li></li>
                    <li><img src="${images}/bt_s1-21.gif" style="cursor:pointer"  id="merge_button" onclick="doMerge();"/></li>
                </ul>
             </div>
             </c:when>
         </c:choose>
    </div>
    <%--右侧分类结束--%>
</div>
<div style="margin-top:5px;float:bottom;width:900px">&nbsp;</div>
</body>
</html>
