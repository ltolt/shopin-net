package net.shopin.web.controller;

import com.shopin.modules.security.interceptor.ObjectSecurity;
import com.shopin.modules.utils.PageHelper;
import com.shopin.modules.utils.SendMessage;
import com.shopin.modules.web.view.PageVO;
import com.sun.net.httpserver.HttpsServer;
import net.sf.json.JsonConfig;
import net.shopin.api.*;
import net.shopin.view.*;
import net.shopin.web.util.*;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import weibo4j.org.json.JSONArray;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;

/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2010-2-2
 * Time: 17:02:40
 */
@Controller
@ObjectSecurity
public class MyShopinController {

   private final static String  REMOTE_ORDEROMS_URL = LoadProperties.readValue("remote_orderOMS_url");

   @Autowired
   private ICartService cartService; 
   @Autowired
   private ISecurityService securityService;
   @Autowired
   private IProductService productService;
   @Autowired
   private IFavorService favorService;
   @Autowired
   private IMemberService memberService;
   @Autowired
   private IMemberPointService pointService;
   @Autowired
   private IMemberCouponService memberCouponService;
   @Autowired
   private IMemberAccountService accountService;
   @Autowired
   private IFreightService freightService;
   @Autowired
   private IOrderService orderService;
   @Autowired
   private IProductListService productListService;
   @Autowired
   private IRefundService refundService;
//    @Autowired
//    private IDMOrderService dmService;

    //我的上品主页
    @RequestMapping(value = "/myshopin/index", method = RequestMethod.GET)
    public String index(Model m,@CookieValue(value="userTicket",required=false) String uid,
                        HttpServletRequest req) {
       
        return "redirect:/myshopin/orders.html";
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
        oldPrepareOrder(order);
        m.addAttribute("order",order);
        //准备配送方式选择数据
        m.addAttribute("expresslist",expressTypes);
        m.addAttribute("avail_express_types",availExpressTypes);
        //准备支付方式选择数据
        m.addAttribute("paymentlist",paymentTypes);
        m.addAttribute("existCollect",existCollect);
        //准备订单状态判断的数据
        String orderStatusNumber= OldCodeUtil.getOrderNumberStatus(order);
        m.addAttribute("status_number",
                Integer.parseInt(orderStatusNumber));
    }

    //原有网站流程的准备订单数据
    private void oldPrepareOrder(OrderVO order){
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

    //oms系统下的准备订单数据
    private void prepareOrder(OrderVO order){
       order.setOrderStatusName(CodeUtil.getOrderStatusName(order));
       order.setOrderClientStatus(CodeUtil.getOrderClientStatus(order));
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

    @RequestMapping(value = "/myshopin/orders", method = RequestMethod.GET)
    public String myOrder(Model m,@CookieValue(value="userTicket",required=false) String uid,
                        HttpServletRequest req) {
        uid = securityService.getLoginUserId(uid).getMembersSid();
        PageVO<OrderVO> page=new PageVO<OrderVO>(10,true);
        //对接OMS代码  获取分页订单数据
        try{
        Map paraMap = new HashMap();
        paraMap.put("memberSid",uid);
        paraMap.put("pageNumber",1);
        paraMap.put("pageSize",10);
        String ordersListJson = HttpUtil.HttpPost(REMOTE_ORDEROMS_URL, "orderService/findOrdersForPageByMemberSid", paraMap);
        net.sf.json.JSONObject ordersJson = net.sf.json.JSONObject.fromObject(ordersListJson);
        String successflag =  (String) ordersJson.get("success");
        if("true".equals(successflag)){
            net.sf.json.JSONArray array=ordersJson.getJSONArray("orders");
            List<OrderVO> orderVOList=new ArrayList();
            for(int i = 0; i < array.size(); i++){
                net.sf.json.JSONObject jb = array.getJSONObject(i);
                Map cmap=new HashMap();
                cmap.put("orderDetails", OrderDetailVO.class);
                OrderVO v = (OrderVO) net.sf.json.JSONObject.toBean(jb, OrderVO.class,cmap);
                orderVOList.add(v);
            }
         
            String totalCount = (String) ordersJson.get("totalCount");
            String pageNo = (String) ordersJson.get("pageNumber");
            page.setTotalCount(Integer.valueOf(totalCount));
            page.setPageNo(Integer.valueOf(pageNo));

            //page.setList(orderVOList);
            //page=orderService.getAllOrders(page,uid);
            //List<OrderVO> list=page.getList();
            prepareOrderList(orderVOList);
            m.addAttribute("orderlist",orderVOList);
            PageHelper pageHelper = new PageHelper(req, "page.ftl", "/myshopin/orders");
            m.addAttribute("page", pageHelper.getPageBreakStr(page));


        }


        //准备订单统计数据
        //对接OMS订单系统  准备订单统计数据
        int countNotPaid=0;     //等待付款订单数
        int countNotFinished=0; //未完成订单数
        int countFinished=0;    //已完成订单数

        Map requestMap = new HashMap();
        requestMap.put("memberSid",uid);
        String  resultsJson = HttpUtil.HttpPost(REMOTE_ORDEROMS_URL,"orderService/getOrdersByMemberSid",requestMap);
        net.sf.json.JSONObject result = net.sf.json.JSONObject.fromObject(resultsJson);
        String flag = (String) result.get("success");
        if("true".equals(flag)){
            //根据会员sid获取会员所有的订单列表 (不分页)
            List<OrderVO> resultList = net.sf.json.JSONArray.toList(result.getJSONArray("orders"),new OrderVO(),new JsonConfig());
            for(OrderVO order : resultList){
                 //如果订单状态等于1(货到付款草稿)或者等于2(非货到付款草稿)
                if( "2".equals(order.getOrderStatus())){
                        
                        countNotPaid += 1;
                }
                //如果订单状态大于0小于9则订单未完成
                if((0 < Integer.valueOf(order.getOrderStatus()) && Integer.valueOf(order.getOrderStatus()) < 9) || (new Integer(1)).equals(order.getOrderStatus())){

                    countNotFinished += 1;

                }
                //如果订单状态等于10 或者 11 则表示支付完成
                if(Integer.valueOf(order.getOrderStatus()) >= 9){
                    countFinished += 1;
                }
            }

        }


        m.addAttribute("not_paid_count",countNotPaid);
        m.addAttribute("not_finished_count",countNotFinished);
        m.addAttribute("finished_count",countFinished);
             }catch (Exception e){
            e.printStackTrace();

        }
        return "myshopin/orderlist";
    }

    //我的订单
    @RequestMapping(value = "/myshopin/orders/{page}", method = RequestMethod.GET)
    public String order(Model m,@CookieValue(value="userTicket",required=false) String uid,
                        @PathVariable("page") String pageNo,
                        HttpServletRequest req) {
        uid=securityService.getLoginUserId(uid).getMembersSid();
        PageVO<OrderVO> page=new PageVO<OrderVO>(10,true);
         //对接OMS代码  获取分页订单数据
        try{
        Map paraMap = new HashMap();
        paraMap.put("memberSid",uid);
        paraMap.put("pageNumber",pageNo);
        paraMap.put("pageSize",10);
        String ordersListJson = HttpUtil.HttpPost(REMOTE_ORDEROMS_URL, "orderService/findOrdersForPageByMemberSid", paraMap);
        net.sf.json.JSONObject ordersJson = net.sf.json.JSONObject.fromObject(ordersListJson);
        String successflag =  (String) ordersJson.get("success");
         if("true".equals(successflag)){
            net.sf.json.JSONArray array=ordersJson.getJSONArray("orders");
            List<OrderVO> orderVOList=new ArrayList();
            for(int i = 0; i < array.size(); i++){
                net.sf.json.JSONObject jb = array.getJSONObject(i);
                Map cmap=new HashMap();
                cmap.put("orderDetails", OrderDetailVO.class);
                OrderVO v = (OrderVO) net.sf.json.JSONObject.toBean(jb, OrderVO.class,cmap);
                orderVOList.add(v);
            }
         
            String totalCount = (String) ordersJson.get("totalCount");
            String pageNumber = (String) ordersJson.get("pageNumber");
            page.setTotalCount(Integer.valueOf(totalCount));
            page.setPageNo(Integer.valueOf(pageNumber));

            //page.setList(orderVOList);
            //page=orderService.getAllOrders(page,uid);
            //List<OrderVO> list=page.getList();
            prepareOrderList(orderVOList);
            m.addAttribute("orderlist",orderVOList);
            PageHelper pageHelper = new PageHelper(req, "page.ftl", "/myshopin/orders");
            m.addAttribute("page", pageHelper.getPageBreakStr(page));
        }

          //准备订单统计数据
        //对接OMS订单系统  准备订单统计数据
        int countNotPaid=0;     //等待付款订单数
        int countNotFinished=0; //未完成订单数
        int countFinished=0;    //已完成订单数

        Map requestMap = new HashMap();
        requestMap.put("memberSid",uid);
        String  resultsJson = HttpUtil.HttpPost(REMOTE_ORDEROMS_URL,"orderService/getOrdersByMemberSid",requestMap);
        net.sf.json.JSONObject result = net.sf.json.JSONObject.fromObject(resultsJson);
        String flag = (String) result.get("success");
        if("true".equals(flag)){
            //根据会员sid获取会员所有的订单列表 (不分页)
            List<OrderVO> resultList = net.sf.json.JSONArray.toList(result.getJSONArray("orders"),new OrderVO(),new JsonConfig());
            for(OrderVO order : resultList){
                 //如果订单状态等于1(货到付款草稿)或者等于2(非货到付款草稿)
                if( "2".equals(order.getOrderStatus())){

                        countNotPaid += 1;
                }
                //如果订单状态大于0小于9则订单未完成
                if((0 < Integer.valueOf(order.getOrderStatus()) && Integer.valueOf(order.getOrderStatus()) < 9) || (new Integer(1)).equals(order.getOrderStatus())){

                    countNotFinished += 1;

                }
                //如果订单状态等于10 或者 11 则表示支付完成
                if(Integer.valueOf(order.getOrderStatus()) >= 9){
                    countFinished += 1;
                }
            }

        }
        m.addAttribute("not_paid_count",countNotPaid);
        m.addAttribute("not_finished_count",countNotFinished);
        m.addAttribute("finished_count",countFinished);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "myshopin/orderlist";
    }

    //我的订单
    @RequestMapping(value = "/myshopin/searchorders/{orderNo}", method = RequestMethod.GET)
    public String orderSearch(Model m,@CookieValue(value="userTicket",required=false) String uid,
                        @PathVariable("orderNo") String orderNo,HttpServletRequest req) {
        uid=securityService.getLoginUserId(uid).getMembersSid();
        PageVO<OrderVO> page=new PageVO<OrderVO>(10,true);
        OrderVO order=new OrderVO();
        order.setMembersSid(uid);
        order.setOrderNo(orderNo);
        //OMS对接搜索订单by订单号
        //搜索这块又问题  没有规避掉边界值 错值
        try{
        Map requestMap = new HashMap();
        requestMap.put("orderNo",orderNo);
        String resultJson = HttpUtil.HttpPost(REMOTE_ORDEROMS_URL,"orderService/findOrderByOrderNo",requestMap);
        net.sf.json.JSONObject  jsonOrder = net.sf.json.JSONObject.fromObject(resultJson);
        String successflag = jsonOrder.getString("success");
        if("true".equals(successflag)){
            OrderVO orderVO = (OrderVO) net.sf.json.JSONObject.toBean(jsonOrder.getJSONObject("order"),OrderVO.class);
            List<OrderDetailVO> orderDetailVOList = net.sf.json.JSONArray.toList(jsonOrder.getJSONObject("order").getJSONArray("orderDetails"), new OrderDetailVO(), new JsonConfig());
            orderVO.setOrderDetails(orderDetailVOList);

            if(uid.equals(orderVO.getMembersSid())){
                List orderList = new ArrayList();
                orderList.add(orderVO);
                page.setList(orderList);
                page.setPageNo(1);
                page.setTotalCount(1);
                 prepareOrderList(page.getList());
                 m.addAttribute("orderlist",page.getList());
                 m.addAttribute("orderSearchNo",orderNo);
            }

        }

        //page = orderService.getOrdersByExample(page, order);

        PageHelper pageHelper = new PageHelper(req, "page.ftl", "/myshopin/searchorders/"+orderNo);
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        }catch (Exception e){
            e.printStackTrace();
        }

        return "myshopin/orderlist";
    }

    @RequestMapping(value = "/myshopin/searchorders/{orderNo}/{page}", method = RequestMethod.GET)
    public String orderSearchPage(Model m,@CookieValue(value="userTicket",required=false) String uid,
                        @PathVariable("orderNo") String orderNo,@PathVariable("page") int pageNo,
                        HttpServletRequest req) {
        uid=securityService.getLoginUserId(uid).getMembersSid();
        PageVO<OrderVO> page=new PageVO<OrderVO>(10,true);
        page.setPageNo(pageNo);
        OrderVO order=new OrderVO();
        order.setMembersSid(uid);
        order.setOrderNo(orderNo);
        page = orderService.getOrdersByExample(page, order);
        prepareOrderList(page.getList());
        m.addAttribute("orderlist",page.getList());
        m.addAttribute("orderSearchNo",orderNo);
        PageHelper pageHelper = new PageHelper(req, "page.ftl", "/myshopin/searchorders/"+orderNo);
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        return "myshopin/orderlist";
    }

    //订单明细
    @RequestMapping(value = "/myshopin/order/{orderNo}", method = RequestMethod.GET)
    public String orderDetail(Model m,@CookieValue(value="userTicket",required=false) String uid,
                              @PathVariable("orderNo") String orderNo,
                              HttpServletRequest req) {
        uid=securityService.getLoginUserId(uid).getMembersSid();

        OrderVO order = this.orderService.getOrderByNO(orderNo);
        order = this.orderService.getOrder(order.getOrderId());
        
          if(!uid.equals(order.getMembersSid())){
            m.addAttribute("message","您没有权限查看该订单");
            return "redirect:/myshopin/orders.html";
        }
        m.addAttribute("delivery",orderService.getOrderDelivery(order.getOrderId()));
        prepareOrderDetail(m,uid,order);
        m.addAttribute("offPriceRecord",orderService.getOffPriceRecord(order.getOrderId()));

        //}
        //OrderVO order=orderService.getOrder(orderId);

        return "myshopin/orderdetail";
    }

    //查看退货订单
    @RequestMapping(value = "/myshopin/refunds", method = RequestMethod.GET)
    public String myRefund(Model m,@CookieValue(value="userTicket",required=false) String uid,
                         HttpServletRequest req) {
        uid=securityService.getLoginUserId(uid).getMembersSid();
        PageVO<OrderVO> page=new PageVO<OrderVO>(10,true);
        page=refundService.getRefunsOrderList(page,uid);
        List<OrderVO> list=page.getList();
        prepareOrderList(list);
        m.addAttribute("orderlist",list);
        PageHelper pageHelper = new PageHelper(req, "page.ftl", "/myshopin/refunds");
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        return "myshopin/refundlist";
    }

    //我的退货单
    @RequestMapping(value = "/myshopin/refunds/{page}", method = RequestMethod.GET)
    public String refund(Model m,@CookieValue(value="userTicket",required=false) String uid,
                         @PathVariable("page") String pageNo,
                         HttpServletRequest req) {
        uid=securityService.getLoginUserId(uid).getMembersSid();
        PageVO<OrderVO> page=new PageVO<OrderVO>(10,true);
        page.setPageNo(Integer.parseInt(pageNo));
        page=refundService.getRefunsOrderList(page,uid);
        List<OrderVO> list=page.getList();
        prepareOrderList(list);
        m.addAttribute("orderlist",list);
        PageHelper pageHelper = new PageHelper(req, "page.ftl", "/myshopin/refunds");
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        return "myshopin/refundlist";
    }

    //我的订单
    @RequestMapping(value = "/myshopin/searchrefunds/{orderNo}", method = RequestMethod.GET)
    public String refundSearch(Model m,@CookieValue("userTicket") String uid,
                        @PathVariable("orderNo") String orderNo,
                        HttpServletRequest req) {
        uid=securityService.getLoginUserId(uid).getMembersSid();
        PageVO<OrderVO> page=new PageVO<OrderVO>(10,true);
        OrderVO order=new OrderVO();
        order.setOrderNo(orderNo);
        order.setMembersSid(uid);
        page = refundService.getRefunsOrderListByExample(page, order);
        List<OrderVO> list=page.getList();
        prepareOrderList(list);
        m.addAttribute("orderlist",list);
        m.addAttribute("orderSearchNo",orderNo);
        PageHelper pageHelper = new PageHelper(req, "page.ftl", "/myshopin/searchrefunds/"+orderNo);
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        return "myshopin/refundlist";
    }

    //我的订单
    @RequestMapping(value = "/myshopin/searchrefunds/{orderNo}/{page}", method = RequestMethod.GET)
    public String refundSearchPage(Model m,@CookieValue("userTicket") String uid,
                        @PathVariable("orderNo") String orderNo,@PathVariable("page") int pageNo,
                        HttpServletRequest req) {
        uid=securityService.getLoginUserId(uid).getMembersSid();
        PageVO<OrderVO> page=new PageVO<OrderVO>(10,true);
        page.setPageNo(pageNo);
        OrderVO order=new OrderVO();
        order.setOrderNo(orderNo);
        order.setMembersSid(uid);
        page = refundService.getRefunsOrderListByExample(page, order);
        List<OrderVO> list=page.getList();
        prepareOrderList(list);
        m.addAttribute("orderlist",list);
        m.addAttribute("orderSearchNo",orderNo);
        PageHelper pageHelper = new PageHelper(req, "page.ftl", "/myshopin/searchrefunds/"+orderNo);
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        return "myshopin/refundlist";
    }

    //退货单明细
    @RequestMapping(value = "/myshopin/refund/{id}", method = RequestMethod.GET)
    public String refundDetail(Model m,@PathVariable("id") String orderNo,
               @CookieValue(value="userTicket",required=false) String uid,HttpServletRequest req) {
       uid=securityService.getLoginUserId(uid).getMembersSid();
       OrderVO order = orderService.getOrderByNO(orderNo);
       String orderId = order.getOrderId();
        order=orderService.getOrder(orderId);
        if(!uid.equals(order.getMembersSid())){
            return "redirect:/myshopin/refund.html";
        }
        prepareOrderDetail(m,uid,order);
        List<RefundsVO> list=refundService.getRefundsByOrderSid(orderId);
        for(RefundsVO vo:list){
            vo.setRefundStatusName(CodeUtil.getRefundStatusName(vo.getRefundStatus()));
        }
        m.addAttribute("refundlist",list);
        return "myshopin/refunddetail";
    }

    //合并订单发货
    @RequestMapping(value = "/myshopin/merge", method = RequestMethod.GET)
    public String mergeSend(Model m,@CookieValue("userTicket") String uid,
                            HttpServletRequest req) {
        uid=securityService.getLoginUserId(uid).getMembersSid();
        List<OrderVO>  list=orderService.getMergeOrders(uid);
        prepareOrderList(list);
        m.addAttribute("orderlist",list);
        return "myshopin/ordermerge";
    }

    @RequestMapping(value = "/myshopin/favorite", method = RequestMethod.GET)
    public String myFavorite(Model m,@CookieValue(value="userTicket",required=false) String uid,
                             HttpServletRequest req) {
       uid=securityService.getLoginUserId(uid).getMembersSid();
       PageVO<ProductVO> page=new PageVO<ProductVO>(5,true);
       page=favorService.getAllProduct(page,uid);
       m.addAttribute("product_list",page.getList());
       PageHelper pageHelper = new PageHelper(req, "page.ftl", "/myshopin/favorite");
       m.addAttribute("page", pageHelper.getPageBreakStr(page));
       return "myshopin/favorite";
    }

    //我的收藏夹
    @RequestMapping(value = "/myshopin/favorite/{page}", method = RequestMethod.GET)
    public String favorite(Model m,@PathVariable("page") String pageNo,
                             @CookieValue(value="userTicket",required=false) String uid,
                             HttpServletRequest req) {
       uid=securityService.getLoginUserId(uid).getMembersSid();
       PageVO<ProductVO> page=new PageVO<ProductVO>(5,true);
       page.setPageNo(Integer.parseInt(pageNo));
       page=favorService.getAllProduct(page,uid);
       m.addAttribute("product_list",page.getList());
       PageHelper pageHelper = new PageHelper(req, "page.ftl", "/myshopin/favorite");
       m.addAttribute("page", pageHelper.getPageBreakStr(page));
       return "myshopin/favorite";
    }
    
    //会员信息
    @RequestMapping(value = "/myshopin/memberinfo", method = RequestMethod.GET)
    public String memberinfo(Model m, @CookieValue(value="userTicket",required=false) String uid,
                                 HttpServletRequest req) {
        
        uid=securityService.getLoginUserId(uid).getMembersSid();
        MemberPersonalInfoVO info=memberService.getPersional(uid);
        m.addAttribute("info",info);
        int year=0;
        int month=0;
        int day=0;
        if(info!=null&&info.getBirthdate()!=null){
            String str=info.getBirthdate();
            String[] arr=str.substring(0,10).split("-");
            year=Integer.parseInt(arr[0]);
            month=Integer.parseInt(arr[1]);
            day=Integer.parseInt(arr[2]);
        }
        m.addAttribute("birthdate_year",year);
        m.addAttribute("birthdate_month",month);
        m.addAttribute("birthdate_day",day);
        return "myshopin/editpersonal";
    }
    
    //密码修改
    @RequestMapping(value = "/myshopin/password", method = RequestMethod.GET)
    public String password(Model m,HttpServletRequest req) {
        return "myshopin/editpassword";
    }
    
    //地址薄
    @RequestMapping(value = "/myshopin/address", method = RequestMethod.GET)
    public String address(Model m, @CookieValue(value="userTicket",required=false) String uid,
                             HttpServletRequest req) {
      uid=securityService.getLoginUserId(uid).getMembersSid();
      List<DistrictVO> provinces=freightService.getProvinces();
      List<MemberAddressVO> list=memberService.getAdressList(uid);
      m.addAttribute("address_list",list);
      m.addAttribute("provincelist",provinces);
      m.addAttribute("memberAddressLimit",CodeUtil.getMemberAddressLimit());
      return "myshopin/editaddress";
    }

    @RequestMapping(value = "/myshopin/coupon", method = RequestMethod.GET)
    public String myCoupon(Model m,@CookieValue(value="userTicket",required=false) String uid,
                             HttpServletRequest req) {
       MemberVO memberVO=securityService.getLoginUserId(uid);
       uid=memberVO.getMembersSid();
       PageVO<MemberCouponVO> page=new PageVO<MemberCouponVO>(10,true);
       page=memberCouponService.getMemberCoupon(page,uid);
       m.addAttribute("coupon_list",page.getList());
       PageHelper pageHelper = new PageHelper(req, "page.ftl", "/myshopin/coupon");
       m.addAttribute("page", pageHelper.getPageBreakStr(page));
       return "myshopin/coupon";
    }

    @RequestMapping(value = "/myshopin/coupon/{page}", method = RequestMethod.GET)
    public String myCouponPage(Model m, @CookieValue(value = "userTicket", required = false) String uid,
                               @PathVariable("page") int pageNo,
                               HttpServletRequest req) {
        MemberVO memberVO = securityService.getLoginUserId(uid);
        uid = memberVO.getMembersSid();
        PageVO<MemberCouponVO> page = new PageVO<MemberCouponVO>(10, true);
        page.setPageNo(pageNo);
        page = memberCouponService.getMemberCoupon(page, uid);
        m.addAttribute("coupon_list", page.getList());
        PageHelper pageHelper = new PageHelper(req, "page.ftl", "/myshopin/coupon");
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        return "myshopin/coupon";
    }

    @RequestMapping(value = "/myshopin/point", method = RequestMethod.GET)
    public String myPoint(Model m,@CookieValue(value="userTicket",required=false) String uid,
                             HttpServletRequest req) {
       MemberVO memberVO=securityService.getLoginUserId(uid);
       uid=memberVO.getMembersSid();
       MemberPointVO point=pointService.getPoint(uid);
       MemberLevelVO current=memberService.getMemLevel(point.getSumPoint());
       MemberLevelVO update=memberService.getUpdateLevel(point.getSumPoint());
       if(update!=null){
           String updatePoint=""+(new BigDecimal(update.getBeginPoint()).intValue()-
               new BigDecimal(point.getSumPoint()).intValue());
           m.addAttribute("updatepoint",updatePoint);
       }
       m.addAttribute("point",point);
       m.addAttribute("currentLevel",current);
       m.addAttribute("updateLevel",update);
       PageVO<MemPointRecordVO> page=new PageVO<MemPointRecordVO>(10,true);
       page=pointService.getPointRecord(page,uid);
       m.addAttribute("pointlist",page.getList());
       PageHelper pageHelper = new PageHelper(req, "page.ftl", "/myshopin/point");
       m.addAttribute("page", pageHelper.getPageBreakStr(page));
       return "myshopin/point";
    }

    //积分
    @RequestMapping(value = "/myshopin/point/{page}", method = RequestMethod.GET)
    public String point(Model m,@PathVariable("page") String pageNo,
                             @CookieValue(value="userTicket",required=false) String uid,
                             HttpServletRequest req) {
       MemberVO memberVO=securityService.getLoginUserId(uid);
       uid=memberVO.getMembersSid();
       MemberPointVO point=pointService.getPoint(uid);
       MemberLevelVO current=memberService.getMemLevel(point.getSumPoint());
       MemberLevelVO update=memberService.getUpdateLevel(point.getSumPoint());
       if(update!=null){
           String updatePoint=""+(new BigDecimal(update.getBeginPoint()).intValue()-
               new BigDecimal(point.getSumPoint()).intValue());
           m.addAttribute("updatepoint",updatePoint);
       }
       m.addAttribute("point",point);
       m.addAttribute("currentLevel",current);
       m.addAttribute("updateLevel",update);
       PageVO<MemPointRecordVO> page=new PageVO<MemPointRecordVO>(10,true);
       page.setPageNo(Integer.parseInt(pageNo));
       page=pointService.getPointRecord(page,uid);
       m.addAttribute("pointlist",page.getList());
       PageHelper pageHelper = new PageHelper(req, "page.ftl", "/myshopin/point");
       m.addAttribute("page", pageHelper.getPageBreakStr(page));
       return "myshopin/point";
    }

    @RequestMapping(value = "/myshopin/account", method = RequestMethod.GET)
    public String account(Model m,@CookieValue(value="userTicket",required=false) String uid, HttpServletRequest req) {
       uid=securityService.getLoginUserId(uid).getMembersSid();
       MemberAccountVO account= accountService.getAccount(uid);
       PageVO<MemAccountRecordVO> page=new PageVO<MemAccountRecordVO>(10,true);
       page=accountService.getAccountRecord(page,uid);
       m.addAttribute("account",account);
       String balance=(account==null||account.getBalance()==null)?"0":account.getBalance();
       m.addAttribute("balance",new DecimalFormat("0.00").format(Double.parseDouble(balance)));
       m.addAttribute("recordlist",page.getList());
       PageHelper pageHelper = new PageHelper(req, "page.ftl", "/myshopin/account");
       m.addAttribute("page", pageHelper.getPageBreakStr(page));
       return "myshopin/account";
    }

    //帐户
    @RequestMapping(value = "/myshopin/account/{page}", method = RequestMethod.GET)
    public String account(Model m,@PathVariable("page") String pageNo,
                             @CookieValue(value="userTicket",required=false) String uid, HttpServletRequest req) {
       uid=securityService.getLoginUserId(uid).getMembersSid();
       MemberAccountVO account= accountService.getAccount(uid);
       PageVO<MemAccountRecordVO> page=new PageVO<MemAccountRecordVO>(10,true);
       page.setPageNo(Integer.parseInt(pageNo));
       page=accountService.getAccountRecord(page,uid);
       m.addAttribute("account",account);
       String balance=(account==null||account.getBalance()==null)?"0":account.getBalance();
       m.addAttribute("balance",new DecimalFormat("0.00").format(Double.parseDouble(balance)));
       m.addAttribute("recordlist",page.getList());
       PageHelper pageHelper = new PageHelper(req, "page.ftl", "/myshopin/account");
       m.addAttribute("page", pageHelper.getPageBreakStr(page));
       return "myshopin/account";
    }

    @RequestMapping(value = "/myshopin/comment", method = RequestMethod.GET)
    public String comment(Model m,@CookieValue(value="userTicket",required=false) String uid,
                          HttpServletRequest req) {
        uid=securityService.getLoginUserId(uid).getMembersSid();
        PageVO<ProReviewsVO> page=new PageVO<ProReviewsVO>(5,true);
        page=memberService.getAllProReviews(page,uid);
        m.addAttribute("commentlist",page.getList());
        PageHelper pageHelper = new PageHelper(req, "page.ftl", "/myshopin/comment");
        m.addAttribute("page", pageHelper.getPageBreakStr(page));

        return "myshopin/comment";
    }


    //评论
    @RequestMapping(value = "/myshopin/comment/{page}", method = RequestMethod.GET)
    public String comment(Model m, @PathVariable("page") String pageNo,
                          @CookieValue(value="userTicket",required=false) String uid,
                          HttpServletRequest req) {
        uid=securityService.getLoginUserId(uid).getMembersSid();
        PageVO<ProReviewsVO> page=new PageVO<ProReviewsVO>(5,true);
        page.setPageNo(Integer.parseInt(pageNo));
        page=memberService.getAllProReviews(page,uid);
        m.addAttribute("commentlist",page.getList());
        PageHelper pageHelper = new PageHelper(req, "page.ftl", "/myshopin/comment");
        m.addAttribute("page", pageHelper.getPageBreakStr(page));
        return "myshopin/comment";
    }



}
