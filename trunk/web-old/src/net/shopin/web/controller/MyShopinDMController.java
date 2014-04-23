package net.shopin.web.controller;

import javax.servlet.http.HttpServletRequest;

import com.shopin.modules.security.interceptor.ObjectSecurity;
import com.shopin.modules.utils.PageHelper;
import net.sf.json.JSONObject;
import net.shopin.api.*;
import net.shopin.view.*;

import net.shopin.web.util.*;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.shopin.modules.web.view.PageVO;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@ObjectSecurity
public class MyShopinDMController  {
    private final static String  REMOTE_ORDEROMS_URL = LoadProperties.readValue("remote_orderOMS_url");

    private final String MEMBERSID = "63512";

    @Autowired
   private IMemberService memberService;

     @Autowired
   private IFreightService freightService;

    @Autowired
   private ICartService cartService;
    @Autowired
   private ISecurityService securityService;
    @Autowired
    private IDMOrderService dmService;


     @Autowired
   private IOrderService orderService;





    @RequestMapping(value = "/myshopin/dmorders",method = RequestMethod.GET)
       public String myDMOrder(Model m,@CookieValue(value = "userTicket",required=false) String uid,  HttpServletRequest req){


           return "myshopin/dmorders";

       }
       @RequestMapping(value = "/myshopin/searchdmorders/{alipayTradeNo}/{receptPhone}/{receptName}",method = RequestMethod.GET)
       public  String searchDMOrder(Model m,@CookieValue(value = "userTicket",required=false) String uid,@PathVariable("alipayTradeNo") String alipayTradeNo,@PathVariable("receptPhone") String receptPhone,@PathVariable("receptName") String receptName, HttpServletRequest req)  {


           try {
               receptName  = URLDecoder.decode(receptName, "UTF-8");

           } catch (UnsupportedEncodingException e) {
               e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
           }

             PageVO<OrderVO> page=new PageVO<OrderVO>(10,true);

             page = dmService.getDMOrderByExample(page,alipayTradeNo,receptName,receptPhone);
            if(page.getList() != null && 0 != page.getList().size()){
           prepareOrderList(page.getList());
           m.addAttribute("orderlist",page.getList());


           PageHelper pageHelper = new PageHelper(req, "page.ftl", "/myshopin/searchdmorders/"+alipayTradeNo + "/" + receptPhone + "/" + receptName);
           m.addAttribute("page", pageHelper.getPageBreakStr(page));

           return       "myshopin/dmorders";
            }


           return "redirect:/myshopin/dmorders.html";
       }
       @RequestMapping(value={"/myshopin/bindDM"}, method={RequestMethod.POST})
     public String ordercancel(Model m, @CookieValue(value="userTicket", required=false) String uid, HttpServletRequest req, String orderId)
     {
       if (!validateUid(uid)) {
         m.addAttribute("result", new AjaxMessageVO("0", "绑定订单失败，很抱歉，您还没有登录"));
         return null;
       }
       if (!ValidateUtil.validateRequired(orderId)) {
         m.addAttribute("result", new AjaxMessageVO("0", "绑定订单失败"));
         return null;
       }

         uid = this.securityService.getLoginUserId(uid).getMembersSid();
         OrderVO order = this.orderService.getOrder(orderId);

       if(MEMBERSID.equals(order.getMembersSid())){
            try{
            Map requestMap = new HashMap();
            requestMap.put("orderNo",order.getOrderNo());
            requestMap.put("memberSid",uid);
            String resultJson = HttpUtil.HttpPost(REMOTE_ORDEROMS_URL,"orderService/saveOrdersFromDP",requestMap);
            JSONObject result = JSONObject.fromObject(resultJson);
            String successflag = result.getString("success");
           // String orderStatusName = OldCodeUtil.getOrderStatusName(order.getOrderStatus(), order.getDeliveryStatus());



            if("true".equals(successflag)){
             boolean  bind = this.dmService.bindDM(uid,orderId);
              if(bind){
               m.addAttribute("result",new AjaxMessageVO("1","二维码订单绑定成功"));
              }

            }
            }catch (Exception e){
               e.printStackTrace();
               m.addAttribute("result", new AjaxMessageVO("0", "绑定订单失败"));
            }

         return null;

       }else if(uid.equals(order.getMembersSid())){
           m.addAttribute("result",new AjaxMessageVO("0","您已经成功绑定该订单"));
           return null;
       }
       else{
               m.addAttribute("result",new AjaxMessageVO("0","该订单已被其他用户绑定"));
               return  null;
       }

     }

       private boolean validateUid(String uid)
         {
           return (validateRequired(uid)) && (this.securityService.isUserLogin(uid));
         }

       private boolean validateRequired(String str)
     {
       return (str != null) && (!"".equals(str));
     }


     //准备订单列表数据
    private void prepareOrderList(List<OrderVO> list){
       for(OrderVO vo:list){
            prepareOrder(vo);
       }
    }

    //准备订单详细页数据
    private void prepareOrderDetail(Model m,String uid,OrderVO order){
        List<ExpressTypeVO> expressTypes=freightService.getAllExpressType();
        List<PaymentTypeVO> paymentTypes=cartService.getAllPaymentType();
        List<DistrictVO> provinces=freightService.getProvinces();
//        List<CartItem> list=cart.getItemList();
        List<OrderDetailVO> list=order.getOrderDetails();
        List<MemberAddressVO> addresslist=memberService.getAdressList(uid);
        String formAddress="";
        String availExpressTypes="";
        if(order.getReceptAddress()!=null&&order.getInceptProvince()!=null&&order.getInceptCity()!=null){
            formAddress=order.getReceptAddress().replaceAll(order.getInceptProvince(),"");
            formAddress=formAddress.replaceAll(order.getInceptCity(),"");
        }
        List<ExpressTypeVO> availtypes=expressTypes;
        if(order.getInceptCitySid()!=null){
            availtypes=freightService.getExpressTypeByCity(
                    Integer.parseInt(order.getInceptCitySid()));
        }

        //设置订单支付方式名称
        for(PaymentTypeVO paytype:paymentTypes){
            if(paytype.getSid().equals(order.getPaymentModeSid())){
                order.setPaymentModeName(paytype.getName());
            }
        }

        boolean existCollect=false;     //是否存在货到付款的运送方式
        //设置订单配送方式名称
        for(ExpressTypeVO availetype:availtypes){
            availExpressTypes+=availetype.getSid()+",";
            if("货到付款".equals(availetype.getExpressName())){
               existCollect=true;
            }
            if(availetype.getSid().equals(order.getSendType())){
                order.setSendTypeName(availetype.getExpressName());
            }
        }
        if(availExpressTypes.indexOf(",")!=-1){
           availExpressTypes=availExpressTypes.substring(0,availExpressTypes.length()-1);
        }
        int qty=0;
        for(OrderDetailVO detail:order.getOrderDetails()){
          qty+=Integer.parseInt(detail.getSaleSum());
        }
        order.setSaleTotalQty(""+qty);
        String showAddress=order.getReceptAddress();
        if(order.getReceptAddress().indexOf(order.getInceptCity())==-1){
           showAddress=order.getInceptCity()+showAddress;
        }
        if(order.getReceptAddress().indexOf(order.getInceptProvince())==-1){
           showAddress=order.getInceptProvince()+showAddress;
        }
        //准备订单收货地址数据
        m.addAttribute("showAddress",showAddress);
         //准备省份选择数据
        m.addAttribute("provincelist",provinces);
        //准备地址选择列表数据
        m.addAttribute("addresslist",addresslist);
        m.addAttribute("formAddress",formAddress);
        //准备订单数据
        prepareOrder(order);
        m.addAttribute("order",order);
        //准备配送方式选择数据
        m.addAttribute("expresslist",expressTypes);
        m.addAttribute("avail_express_types",availExpressTypes);
        //准备支付方式选择数据
        m.addAttribute("paymentlist",paymentTypes);
        m.addAttribute("existCollect",existCollect);
        //准备订单状态判断的数据
        String orderStatusNumber= CodeUtil.getOrderNumberStatus(order);
        m.addAttribute("status_number",
                Integer.parseInt(orderStatusNumber));
    }

    //准备订单数据
    private void prepareOrder(OrderVO order){
       order.setOrderStatusName(OldCodeUtil.getOrderStatusName(order));
       order.setOrderClientStatus(OldCodeUtil.getOrderClientStatus(order));
       String sendCost=ValidateUtil.validateMoney(order.getSendCost())?order.getSendCost():"0.00";
       String money=ValidateUtil.validateMoney(order.getSaleMoneySum())?order.getSaleMoneySum():"0.00";
       String total=new DecimalFormat("0.00").format((Double.parseDouble(sendCost)+Double.parseDouble(money)));
       order.setSaleTotalSum(""+total);
       int qty=0;
       for(OrderDetailVO detail:order.getOrderDetails()){
          qty+=Integer.parseInt(detail.getSaleSum());
       }
       order.setSaleTotalQty(""+qty);
    }


}
