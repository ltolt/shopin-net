/**
 * 订单来源+消息
 */
package net.shopin.web.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;

import com.shopin.modules.utils.SendMessage;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.shopin.api.ICartService;
import net.shopin.api.IFreightService;
import net.shopin.api.IMemberAccountService;
import net.shopin.api.IMemberService;
import net.shopin.api.IOrderService;
import net.shopin.api.IOrderUpdateService;
import net.shopin.api.IProductListService;
import net.shopin.api.IRefundService;
import net.shopin.api.ISecurityService;
import net.shopin.exception.OrderFailedException;
import net.shopin.exception.RefundFailedException;
import net.shopin.view.AjaxMessageVO;
import net.shopin.view.Cart;
import net.shopin.view.CartItem;
import net.shopin.view.ExpressTypeVO;
import net.shopin.view.MemberAccountVO;
import net.shopin.view.MemberAddressVO;
import net.shopin.view.MemberVO;
import net.shopin.view.MergeOrderVO;
import net.shopin.view.OrderDetailVO;
import net.shopin.view.OrderVO;
import net.shopin.view.PaymentTypeVO;
import net.shopin.view.RefundsDetailVO;
import net.shopin.view.RefundsVO;
import net.shopin.web.util.*;
import net.shopin.web.util.HttpUtil;
import net.shopin.web.util.LoadProperties;
import net.util.*;
import org.apache.jasper.tagplugins.jstl.core.Catch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderManageController
{

    private final static String REMOTE_ORDERMSG_URL = LoadProperties.readValue("remote_ordermsg_url");

    private final static String  REMOTE_ORDEROMS_URL = LoadProperties.readValue("remote_orderOMS_url");

    

  @Autowired
  private ICartService cartService;

  @Autowired
  private IProductListService productListService;

  @Autowired
  private IMemberService memberService;

  @Autowired
  private ISecurityService securityService;

  @Autowired
  private IFreightService freightService;

  @Autowired
  private IOrderService orderService;

  @Autowired
  private IOrderUpdateService orderUpdateService;

  @Autowired
  private IRefundService refundService;

  @Autowired
  private IMemberAccountService memberAccountService;

  private double getOrderAmount(OrderVO ordervo)
  {
    double money = 0.0D;
    for (OrderDetailVO detailvo : ordervo.getOrderDetails()) {
      money += Double.parseDouble(detailvo.getSalePrice()) * Integer.parseInt(detailvo.getSaleSum());
    }
    double freight = ordervo.getSendCost() == null ? 0.0D : Double.parseDouble(ordervo.getSendCost());
    money += freight;
    return money;
  }

  private OrderVO convertToOrder(OrderVO order, String[] productItems, String uid)
  {
    order.setMembersSid(uid);

    List list = new ArrayList();
    for (String str : productItems) {
      String[] arr = str.split("_");
      OrderDetailVO vo = new OrderDetailVO();
      vo.setProDetailSid(arr[0]);
      vo.setSaleSum(arr[1]);
      vo.setSalePrice(arr[2]);
      list.add(vo);
    }
    order.setOrderDetails(list);

    if (!"货到付款".equals(order.getPaymentModeName())) {
      String freight = this.freightService.getFreight(order.getInceptCitySid(), order.getSendType());
      order.setSendCost(freight);
    }
    return order;
  }

  private MemberAddressVO convertToAddress(OrderVO order)
  {
    MemberAddressVO address = new MemberAddressVO();
    address.setMembersSid(order.getMembersSid());
    address.setDeliCitySid(order.getInceptCitySid());
    address.setAddress(order.getReceptAddress());
    address.setDeliProvinceSid(order.getInceptProvinceSid());
    address.setName(order.getReceptName());
    address.setPostcode(order.getInceptPostcode());
    address.setProvinceName(order.getInceptProvince());
    address.setCityName(order.getInceptCity());
    address.setTel(order.getReceptPhone());
    address.setAddress(getFullAddress(address));
    return address;
  }

  private String getFullAddress(MemberAddressVO addressVO) {
    String fullAddress = "";
    fullAddress = fullAddress + addressVO.getAddress();
    String cityName = addressVO.getCityName() == null ? "" : addressVO.getCityName();
    String provinceName = addressVO.getProvinceName() == null ? "" : addressVO.getProvinceName();
    if (fullAddress.indexOf(cityName) < 0) {
      fullAddress = cityName + fullAddress;
    }
    if ((!provinceName.equals(cityName)) && (fullAddress.indexOf(provinceName) < 0))
    {
      fullAddress = provinceName + fullAddress;
    }
    return fullAddress;
  }

  @RequestMapping(value={"/order/edit"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String orderedit(Model m, @CookieValue(value="userTicket", required=false) String uid, HttpServletRequest req, OrderVO order, String[] productItems, String addNewAddr)
  {
    if (!validateUid(uid)) {
      m.addAttribute("result", new AjaxMessageVO("0", "很抱歉，您还没有登录"));
      return null;
    }
    if (!validateRequired(order.getOrderId())) {
      m.addAttribute("result", new AjaxMessageVO("0", "修改订单失败"));
      return null;
    }
    if (productItems.length == 0) {
      m.addAttribute("result", new AjaxMessageVO("0", "修改订单失败，订单不能没有商品"));
      return null;
    }

     uid = this.securityService.getLoginUserId(uid).getMembersSid();
     OrderVO oldOrder = this.orderService.getOrder(order.getOrderId());
   try{
     //OMs修改代码 向远程OMS系统发链接 获取远程mysql中OMS订单的Sid
     //==start==
    Map requestMap =  new HashMap();
    requestMap.put("orderNo",oldOrder.getOrderNo());
    String orderJson = HttpUtil.HttpPost(REMOTE_ORDEROMS_URL,"orderService/findOrderByOrderNo",requestMap);
    JSONObject  jsonOrder = JSONObject.fromObject(orderJson);
    String successFlag = jsonOrder.getString("success");
       OrderVO omsOrder = new OrderVO();
      //通过订单号获取远程oms系统的订单sid
    if("true".equals(successFlag)){
         omsOrder  = (OrderVO) JSONObject.toBean(jsonOrder.getJSONObject("order"), OrderVO.class);
    }

     //  ==========end==============  kongm


    if (!uid.equals(oldOrder.getMembersSid())) {
      m.addAttribute("result", new AjaxMessageVO("0", "修改订单失败，您不能修改该订单"));
      return null;
    }
    if (!"1".equals(oldOrder.getOrderStatus())) {
      m.addAttribute("result", new AjaxMessageVO("0", new StringBuilder().append("订单").append(oldOrder.getOrderNo()).toString()) + "现在处于[" + oldOrder.getOrderStatusName() + "]的状态,不能修改该订单");

      return null;
    }
    order = convertToOrder(order, productItems, uid);
    order.setExternalLinks(oldOrder.getExternalLinks());
    order.setOrderSourceSid(oldOrder.getOrderSourceSid());
    order.setOrderNo(oldOrder.getOrderNo());
    if ("会员账户".equals(order.getPaymentModeName())) {
      MemberAccountVO account = this.memberAccountService.getAccount(uid);
      String balance = account.getBalance();
      double orderAmount = getOrderAmount(order);
      if ((!ValidateUtil.validateRequired(balance)) || (Double.parseDouble(balance) < orderAmount))
      {
        m.addAttribute("result", new AjaxMessageVO("0", "您的账户余额不足，不能使用账户余额支付，请选择其他支付方式"));
        return null;
      }
    }
    if ("货到付款".equals(order.getPaymentModeName())) {
      String freight = "";
      ExpressTypeVO typevo = this.freightService.getCollectType();
      if (typevo.getSid() == null) {
        m.addAttribute("result", new AjaxMessageVO("0", "选择支付方式失败，很抱歉，暂不支持" + order.getInceptCity() + "货到付款"));

        return null;
      }
      freight = this.freightService.getFreight(order.getInceptCitySid(), typevo.getSid());
      if (!validateRequired(freight)) {
        m.addAttribute("result", new AjaxMessageVO("0", "选择支付方式失败，很抱歉，暂不支持" + order.getInceptCity() + "货到付款"));

        return null;
      }
      order.setSendType(typevo.getSid());
      order.setSendCost(freight);
    }
    if ("1".equals(addNewAddr))
    {
      int count = this.memberService.getAddressCount(uid);
      if (count > CodeUtil.getMemberAddressLimit()) {
        m.addAttribute("result", new AjaxMessageVO("0", "您的地址簿已达最大数量限制,不能添加新地址"));
        return null;
      }
      MemberAddressVO address = convertToAddress(order);
      this.memberService.saveAddress(address);
    }
   

        //
       //对接oms系统代码  ====start ======
        //把单品订单的sid修改成远程oms系统的订单Sid
      if(omsOrder != null && omsOrder.getOrderId()!=null){
        order.setOrderId(omsOrder.getOrderId());

      Map paraMap = new HashMap();
      paraMap.put("orderjson", DataUtil.converOrderVOToJson(order));
      String modifyOrderJson = HttpUtil.HttpPost(REMOTE_ORDEROMS_URL,"orderService/modifyOrder",paraMap);
      JSONObject modifyOrder = JSONObject.fromObject(modifyOrderJson);
      String flag = modifyOrder.getString("success");
          //现有网站向单品库中修改订单的代码
       //OrderVO newOrder = this.orderUpdateService.updateOrder(order);
      if("true".equals(flag)){
      OrderVO newOrder = order;
      m.addAttribute("result", new AjaxMessageVO("1", "修改订单成功"));
      m.addAttribute("neworder", newOrder);


    }else {
          m.addAttribute("result",new AjaxMessageVO("0","库存不足,修改订单失败"));
      }
      }
    } catch (OrderFailedException e) {
      m.addAttribute("result", new AjaxMessageVO("0", e.getMessage()));
    } catch (Exception e) {
      m.addAttribute("result", new AjaxMessageVO("0", "修改订单失败"));
    }
    return null;
  }

  @RequestMapping(value={"/order/reuse/{orderId}"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
  public String saveOrder(Model m, @CookieValue(value="userTicket", required=false) String uid, @PathVariable("orderId") String orderId, HttpServletRequest req)
  {
    if (!validateUid(uid)) {
      return "redirect:/index.html";
    }
    if (!validateRequired(orderId)) {
      return "redirect:/index.html";
    }
    uid = this.securityService.getLoginUserId(uid).getMembersSid();
    OrderVO order = this.orderService.getOrder(orderId);
    if (!uid.equals(order.getMembersSid()))
      return "redirect:/myshopin/orders.html";
    try
    {
      OrderVO newOrder = this.orderUpdateService.saveOutTimeOrder(orderId);
       newOrder = this.orderService.getOrder(newOrder.getOrderId());
       System.out.println("-----------------定订单状态----------------"+newOrder.getOrderStatus());
        if(newOrder.getOrderStatus()!=null&&newOrder.getOrderStatus().equals("0")){
            m.addAttribute("message", "价格或库存有改变，不能付款");
            prepareOrderPayData(m, uid, order);
            return "myshopin/orderdetail";
        }else{
            Map requestMap = new HashMap();
            requestMap.put("orderNo",order.getOrderNo());
            requestMap.put("orderStatus","2");
              requestMap.put("msgMethod","modifyOrderNo");
              requestMap.put("msgSource","orderService");
              String  resultJson = HttpUtil.HttpPost(REMOTE_ORDEROMS_URL, "orderService/sendSynOrderInfoMessage", requestMap);
              JSONObject resultStatus = JSONObject.fromObject(resultJson);
              String successFlag = resultStatus.getString("flag");
              if(!"true".equals(successFlag)){
                 System.out.println(order.getOrderNo()+"修改订单状态为2失败");
              }
            m.addAttribute("offPriceRecord", this.orderService.getOffPriceRecord(newOrder.getOrderId()));
            prepareOrderPayData(m, uid, newOrder);
           //start add by tongjp  保存订单
           // sendMessageByOrderVO(ordervo,"sendStoreMessage","reduction_net_from","1");
           sendMessageByOrderVO(newOrder, SendMessage.STORE_METHOD,SendMessage.REDUCTION_NET_FROM,"1");
           //end add by tongjp
        }



    } catch (Exception e) {
      m.addAttribute("message", e.getMessage());
      prepareOrderPayData(m, uid, order);
      return "myshopin/orderdetail";
    }
    return "buying/orderreuse";
  }

  private void prepareOrderPayData(Model m, String uid, OrderVO order)
  {
    order.setPaymentModeName(this.cartService.getPaymentType(order.getPaymentModeSid()).getName());
    String sendTypeName = this.freightService.getExpressType(new Integer(order.getSendType())).getExpressName();

    if ("货到付款".equals(sendTypeName)) {
      sendTypeName = "由上品根据订单的收货地址选择合适的快递方式";
    }
    order.setSendTypeName(sendTypeName);
    order.setOrderStatusName(CodeUtil.getOrderStatusName(order));
    order.setOrderClientStatus(CodeUtil.getOrderClientStatus(order));
    String sendCost = ValidateUtil.validateMoney(order.getSendCost()) ? order.getSendCost() : "0.00";
    String money = ValidateUtil.validateMoney(order.getSaleMoneySum()) ? order.getSaleMoneySum() : "0.00";
    String total = new DecimalFormat("0.00").format(Double.parseDouble(sendCost) + Double.parseDouble(money));
    order.setSaleTotalSum("" + total);
    int qty = 0;
    for (OrderDetailVO detail : order.getOrderDetails()) {
      qty += Integer.parseInt(detail.getSaleSum());
    }
    order.setSaleTotalQty("" + qty);

    m.addAttribute("order", order);

    if ("会员账户".equals(order.getPaymentModeName())) {
      MemberAccountVO account = this.memberAccountService.getAccount(uid);
      if (account != null)
        m.addAttribute("account", account.getBalance());
    }
  }

  @RequestMapping(value={"/order/cancel"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String ordercancel(Model m, @CookieValue(value="userTicket", required=false) String uid, HttpServletRequest req, String orderId)
  {
    if (!validateUid(uid)) {
      m.addAttribute("result", new AjaxMessageVO("0", "撤销订单失败，很抱歉，您还没有登录"));
      return null;
    }
    if (!ValidateUtil.validateRequired(orderId)) {
      m.addAttribute("result", new AjaxMessageVO("0", "撤销订单失败"));
      return null;
    }
    uid = this.securityService.getLoginUserId(uid).getMembersSid();

      try{
    //oms对接撤销订单
    Map requestMap = new HashMap();
    requestMap.put("orderSid",orderId);
    String resultJson = HttpUtil.HttpPost(REMOTE_ORDEROMS_URL,"orderService/findOrderByOrderSid",requestMap);
    JSONObject result = JSONObject.fromObject(resultJson);
    String successFlag = result.getString("success");
     if("true".equals(successFlag)){
                   OrderVO orderVO = (OrderVO) net.sf.json.JSONObject.toBean(result.getJSONObject("order"),OrderVO.class);
                   List<OrderDetailVO> orderDetailVOList = net.sf.json.JSONArray.toList(result.getJSONObject("order").getJSONArray("orderDetails"), new OrderDetailVO(), new JsonConfig());
                   orderVO.setOrderDetails(orderDetailVOList);
        

    //OrderVO order = this.orderService.getOrder(orderId);
    String orderStatusName = CodeUtil.getOrderStatusName(orderVO.getOrderStatus(), orderVO.getDeliveryStatus());

    if (!uid.equals(orderVO.getMembersSid())) {
      m.addAttribute("result", new AjaxMessageVO("0", "很抱歉，您不能撤销订单" + orderVO.getOrderNo()));

      return null;
    }
    if (!"1".equals(orderVO.getOrderStatus()) && !"2".equals(orderVO.getOrderStatus())) {
      m.addAttribute("result", new AjaxMessageVO("0", "很抱歉，订单" + orderVO.getOrderNo() + "现在处于[" + orderStatusName + "]的状态，" + "不能撤销"));

      return null;
    }
        //OMS对接撤销订单
         Map paraMap = new HashMap();
         paraMap.put("orderSid",orderId);
         String cancelJson = HttpUtil.HttpPost(REMOTE_ORDEROMS_URL,"orderService/cancleOrderBySid",paraMap);
         JSONObject cancel = JSONObject.fromObject(cancelJson);
         String flag = cancel.getString("success");
         if("true".equals(flag)){
             m.addAttribute("result", new AjaxMessageVO("1", "撤销订单成功"));

               // this.orderService.cancelOrder(orderId);

     //start add by tongjp  取消订单
     //sendMessageByOrder(order,"sendStoreMessage","add_net_from","3");
        sendMessageByOrderVO(orderVO,SendMessage.STORE_METHOD,SendMessage.ADD_NET_FROM,"3");
     //end add by tongjp

             return  null;
          }

        }
      }catch (Exception e){
          e.printStackTrace();
           m.addAttribute("result",new AjaxMessageVO("0", "很抱歉，您不能撤销订单" ));
          return  null;
      }


    m.addAttribute("result",new AjaxMessageVO("0", "很抱歉，您不能撤销订单" ));
    return null;
  }



  @RequestMapping(value={"/order/receive"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String orderReceive(Model m, @CookieValue(value="userTicket", required=false) String uid, HttpServletRequest req, String orderId)
  {
    if (!validateUid(uid)) {
      m.addAttribute("result", new AjaxMessageVO("0", "确认收货失败，很抱歉，您还没有登录"));
      return null;
    }
    if (!ValidateUtil.validateRequired(orderId)) {
      m.addAttribute("result", new AjaxMessageVO("0", "确认收货失败"));
      return null;
    }
    uid = this.securityService.getLoginUserId(uid).getMembersSid();
    OrderVO order = this.orderService.getOrder(orderId);
    String orderStatusName = CodeUtil.getOrderStatusName(order.getOrderStatus(), order.getDeliveryStatus());
    if (!uid.equals(order.getMembersSid())) {
      m.addAttribute("result", new AjaxMessageVO("0", "很抱歉，您不能操作订单" + order.getOrderNo()));

      return null;
    }
    if ((!"2".equals(order.getOrderStatus())) && (!"3".equals(order.getDeliveryStatus()))) {
      m.addAttribute("result", new AjaxMessageVO("0", "很抱歉，订单" + order.getOrderNo() + "现在处于[" + orderStatusName + "]的状态，" + "您现在不能确认收货"));

      return null;
    }
      //单品确认订单 ====start
     this.orderService.confirmTheOrderFinish(orderId);
       //=====end========
    //OMS确认收货  ========start ========
    try{
    Map requestMap = new HashMap();
    requestMap.put("orderNo",order.getOrderNo());
    requestMap.put("orderStatus","9");
     requestMap.put("msgMethod","modifyOrderNo");
      requestMap.put("msgSource","web");
    String resultJson = HttpUtil.HttpPost(REMOTE_ORDERMSG_URL,"orderService/sendSynOrderInfoMessage",requestMap);
    JSONObject result = JSONObject.fromObject(resultJson);
    String successflag = result.getString("flag");
    if("true".equals(successflag)){
         m.addAttribute("result", new AjaxMessageVO("1", "操作成功，谢谢您确认收货"));
    }else {
         m.addAttribute("result",new AjaxMessageVO("0","确认收货失败"));
    }
    }catch (Exception e){
        e.printStackTrace();
        m.addAttribute("result",new AjaxMessageVO("0","确认收货失败"));
    }
    // =======oms end==============



    return null;
  }

  private RefundsVO prepareRefundCommitData(String[] refund, String orderId, String refundDirection)
  {
    RefundsVO refundsVO = new RefundsVO();
    refundsVO.setOrderSid(orderId);
    refundsVO.setRefundDirection(new Integer(refundDirection));
    List list = new ArrayList();
    for (String str : refund) {
      String[] arr = str.split("_");
      RefundsDetailVO detail = new RefundsDetailVO();
      detail.setProDetailSid(new Integer(arr[0]));
      detail.setRefundNum(new Integer(arr[1]));
      list.add(detail);
    }
    refundsVO.setRefundsDetails(list);

    return refundsVO;
  }

  @RequestMapping(value={"/refund/commit"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String orderRefund(Model m, @CookieValue(value="userTicket", required=false) String uid, HttpServletRequest req, String[] refund, String orderId, String refundDirection, String refundDesc, String bankUser, String bankProvince, String bankCity, String bankName, String bankAddress, String bankCardNumber)
  {
    if (!validateUid(uid)) {
      m.addAttribute("result", new AjaxMessageVO("0", "提交退货失败，很抱歉，您还没有登录"));
      return null;
    }

    if ((refund == null) || (refund.length == 0)) {
      m.addAttribute("result", new AjaxMessageVO("0", "提交退货失败，您没有填写退货商品和数量"));
      return null;
    }
    if (("4".equals(refundDirection)) && (!validateBankInfo(bankUser, bankName, bankAddress, bankProvince, bankCity, bankCardNumber))) {
      m.addAttribute("result", new AjaxMessageVO("0", "退款银行信息填写不完整，请检查！"));
      return null;
    }
    uid = this.securityService.getLoginUserId(uid).getMembersSid();
    OrderVO order = this.orderService.getOrder(orderId);
    String orderStatusName = CodeUtil.getOrderStatusName(order.getOrderStatus(), order.getDeliveryStatus());

    if (!uid.equals(order.getMembersSid())) {
      m.addAttribute("result", new AjaxMessageVO("0", "很抱歉，您操作的订单不存在"));

      return null;
    }
    RefundsVO refundvo = prepareRefundCommitData(refund, orderId, refundDirection);
    try {
      refundvo.setRefundDesc(refundDesc);

      refundvo.setBankName(bankName.trim());
      refundvo.setBankAddress(bankAddress.trim());
      refundvo.setBankCardNumber(bankCardNumber.trim());
      refundvo.setBankCity(bankCity.trim());
      refundvo.setBankProvince(bankProvince.trim());
      refundvo.setBankUser(bankUser.trim());

      this.refundService.saveRefuns(refundvo);
      m.addAttribute("result", new AjaxMessageVO("1", "提交退货成功"));
      return null;
    } catch (RefundFailedException e) {
      m.addAttribute("result", new AjaxMessageVO("0", e.getMessage()));
    }return null;
  }

  @RequestMapping(value={"/refund/cancel"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String orderRefundCancel(Model m, @CookieValue(value="userTicket", required=false) String uid, HttpServletRequest req, String[] refund, String refundSid)
  {
    if (!validateUid(uid)) {
      m.addAttribute("result", new AjaxMessageVO("0", "撤销退货失败，很抱歉，您还没有登录"));
      return null;
    }

    if (!ValidateUtil.validateRequired(refundSid)) {
      m.addAttribute("result", new AjaxMessageVO("0", "撤销退货失败，您操作的退货单不存在"));
      return null;
    }
    uid = this.securityService.getLoginUserId(uid).getMembersSid();

    OrderVO order = this.refundService.getOrderByRefundSid(refundSid);
    if (!uid.equals(order.getMembersSid())) {
      m.addAttribute("result", new AjaxMessageVO("0", "撤销退货失败，您操作的退货单不存在"));
      return null;
    }
    try {
      this.refundService.cancelRefuns(refundSid);
      m.addAttribute("result", new AjaxMessageVO("1", "撤销退货成功"));
    } catch (RefundFailedException e) {
      m.addAttribute("result", new AjaxMessageVO("0", e.getMessage()));
      return null;
    }
    return null;
  }

  @RequestMapping(value={"/order/merge"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public String orderMerge(Model m, @CookieValue(value="userTicket", required=false) String uid, String masterOrderid, String[] others, String refundFrtDirection, HttpServletRequest req)
  {
    if (!validateUid(uid)) {
      m.addAttribute("result", new AjaxMessageVO("0", "合并订单发货失败，很抱歉，您还没有登录"));
      return null;
    }
    if (!validateMergeData(masterOrderid, others, refundFrtDirection)) {
      m.addAttribute("result", new AjaxMessageVO("0", "合并订单发货失败"));
      return null;
    }
    MergeOrderVO mergevo = new MergeOrderVO();
    mergevo.setMasterOrderid(masterOrderid);
    List list = new ArrayList();
    for (String other : others) {
      list.add(other);
    }
    mergevo.setOthers(list);
    mergevo.setRefundFrtDirection(refundFrtDirection);
    try {
      this.orderService.mergeOrder(mergevo);
      m.addAttribute("result", new AjaxMessageVO("1", "合并订单发货成功"));
    } catch (OrderFailedException e) {
      m.addAttribute("result", new AjaxMessageVO("0", "合并订单发货失败，" + e.getMessage()));
      return null;
    }
    return null;
  }

  private boolean validateMergeData(String masterOrderid, String[] others, String refundFrtDirection) {
    if ((!ValidateUtil.validateRequired(masterOrderid)) || (!ValidateUtil.validateRequired(refundFrtDirection)) || (!refundFrtDirection.matches("[01]{1}")) || (others == null))
    {
      return false;
    }
    for (String other : others) {
      if (!ValidateUtil.validateRequired(other)) {
        return false;
      }
    }
    return true;
  }

  private boolean validateRequired(String str)
  {
    return (str != null) && (!"".equals(str));
  }

  private boolean validateCartId(String cartId)
  {
    return validateRequired(cartId);
  }

  private boolean validateUid(String uid)
  {
    return (validateRequired(uid)) && (this.securityService.isUserLogin(uid));
  }

  private boolean validateProductDetailId(String productDetailId)
  {
    return validateRequired(productDetailId);
  }

  private boolean validateMoney(String price)
  {
    String pattern = "\\d+(\\.\\d{1,2})?";

    return (price != null) && (price.matches(pattern));
  }

  private boolean validateQty(String qty)
  {
    String pattern = "[1-9]{1}[0-9]*";

    return (qty != null) && (qty.matches(pattern));
  }

  private boolean validatePostCode(String postCode)
  {
    if (!validateRequired(postCode)) {
      return false;
    }

    return postCode.matches("\\d{6}");
  }

  private boolean validateTel(String tel)
  {
    if (!validateRequired(tel)) {
      return false;
    }

    return (tel.matches("13[0-9]{1}\\d{8}")) || (tel.matches("\\d{3}-?\\d{8}")) || (tel.matches("\\d{4}-?\\d{7}"));
  }

  private boolean validateAddress(MemberAddressVO address)
  {
    String addr = address.getAddress();
    String citySid = address.getDeliCitySid();
    String cityName = address.getCityName();
    String provinceSid = address.getDeliProvinceSid();
    String memberSid = address.getMembersSid();
    String mobileTel = address.getMobileTel();
    String name = address.getName();
    String postcode = address.getPostcode();
    String provinceName = address.getProvinceName();
    String tel = address.getTel();
    if ((addr == null) || (!addr.matches("\\s+"))) {
      return false;
    }
    if ((citySid == null) || ("".equals(citySid))) {
      return false;
    }
    if ((provinceSid == null) || ("".equals(provinceSid))) {
      return false;
    }
    if ((name == null) || (!name.matches("\\s+"))) {
      return false;
    }
    if (!validatePostCode(postcode)) {
      return false;
    }

    return validateTel(tel);
  }

  private boolean validateSourceOneStore(Cart cart)
  {
    return true;
  }

  private boolean validateAddress(OrderVO order)
  {
    String receptName = order.getReceptName();
    String receptAddress = order.getReceptAddress();
    String receptPhone = order.getReceptPhone();
    String inceptPostCode = order.getInceptPostcode();
    String inceptProvinceSid = order.getInceptProvinceSid();
    String inceptProvince = order.getInceptProvince();
    String inceptCitySid = order.getInceptCitySid();
    String inceptCity = order.getInceptCity();
    if (!validateRequired(receptName)) {
      return false;
    }
    if (!validateRequired(receptAddress)) {
      return false;
    }
    if (!validateTel(receptPhone)) {
      return false;
    }
    if (!validateRequired(receptAddress)) {
      return false;
    }
    if (!validateRequired(receptAddress)) {
      return false;
    }
    if (!validateRequired(receptAddress)) {
      return false;
    }
    if (!validateRequired(receptAddress)) {
      return false;
    }

    return validateRequired(receptAddress);
  }

  private boolean validateInvoice(OrderVO order)
  {
    String invoiceBit = order.getInvoiceBit();
    String invoiceName = order.getInvoiceName();
    String invoiceDesc = order.getInvoiceDesc();
    if ((!validateRequired(invoiceBit)) || (!invoiceBit.matches("[0-1]{1}"))) {
      return false;
    }

    return (!"1".equals(invoiceBit)) || ((validateRequired(invoiceName)) && (validateRequired(invoiceDesc)));
  }

  private boolean validateSendType(OrderVO order)
  {
    String sendType = order.getSendType();
    String sendTypeName = order.getSendTypeName();
    if (!validateRequired(sendType)) {
      return false;
    }

    return validateRequired(sendTypeName);
  }

  private boolean validatePayType(OrderVO order)
  {
    String paymentModeSid = order.getPaymentModeSid();
    String paymentModeName = order.getPaymentModeName();
    if (!validateRequired(paymentModeSid)) {
      return false;
    }

    return validateRequired(paymentModeName);
  }

  private boolean validateFreight(OrderVO order)
  {
    String freightInCart = order.getSendCost();
    if (!validateMoney(freightInCart)) {
      return false;
    }
    String citySid = order.getInceptCitySid();
    String sendType = order.getSendType();
    String freight = this.freightService.getFreight(citySid, sendType);
    if (!validateRequired(freight)) {
      return false;
    }

    return freightInCart.equals(freight);
  }

  private boolean validateOrder(OrderVO order)
  {
    if (!validateAddress(order)) {
      return false;
    }

    if (!validateInvoice(order)) {
      return false;
    }

    if (!validateSendType(order)) {
      return false;
    }

    if (!validatePayType(order)) {
      return false;
    }

    return validateFreight(order);
  }

  private boolean validateProduct(List<CartItem> list)
  {
    return !list.isEmpty();
  }

  private boolean validateOrder(Cart cart)
  {
    if (!validateOrder(cart.getOrderVO())) {
      return false;
    }

    return validateProduct(cart.getItemList());
  }

  private boolean validateBankInfo(String bankUser, String bankName, String bankAddress, String bankProvince, String bankCity, String bankCardNum)
  {
    return (bankUser != null) && (!"".equals(bankUser.trim())) && (bankName != null) && (!"".equals(bankName.trim())) && (bankAddress != null) && (!"".equals(bankAddress.trim())) && (bankProvince != null) && (!"".equals(bankProvince.trim())) && (bankCity != null) && (!"".equals(bankCity.trim())) && (bankCardNum != null) && (!"".equals(bankCardNum));
  }

    public void sendMessageByOrderVO(OrderVO ordervo,String metnod,String messageSource,String sourceNum){
          //start tongjp 增加发送消息
            String pdSids="";
            List<OrderDetailVO>  detaillist=ordervo.getOrderDetails();
            if(detaillist!=null&&detaillist.size()>0){
                for(OrderDetailVO orderDetailVO:detaillist){
                 pdSids+=orderDetailVO.getProDetailSid()+":0;";
                }
                pdSids=pdSids.substring(0,pdSids.length()-1);
                //String method,String messageSource,String uuid,String messageType,String pdSid,String pdSids,String storeNum,String sourceNum,String ip
                SendMessage.toSendByPost(metnod, messageSource, SendMessage.getUUID(), SendMessage.STOREPROCEDURE_TYPE, "", pdSids, "", sourceNum, SendMessage.BACK_SERVER);
            }
            //end tongjp
    }
}