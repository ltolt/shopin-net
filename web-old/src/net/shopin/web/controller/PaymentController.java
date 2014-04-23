package net.shopin.web.controller;

import cn.com.infosec.icbc.ReturnValue;
import com.capinfo.crypt.RSA_MD5;
import net.shopin.api.*;
import net.shopin.view.*;
import net.shopin.web.conf.*;
import net.shopin.web.util.ValidateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;


/**
 * 订单支付控制器
 */
@Controller
public class PaymentController {

    @Autowired
    IOrderService orderService;
    @Autowired
    private IOrderUpdateService orderUpdateService;
    @Autowired
    private ISecurityService securityService;
    @Autowired
    private IMemberAccountService memberAccountService;
    @Autowired
    BankConf bankConf;
    @Autowired
    IPaymentService paymentService;

//    //校验登录的id
//
//    private boolean validateUid(String uid) {
//        if (!ValidateUtil.validateRequired(uid) || !securityService.isUserLogin(uid)) {
//            return false;
//        }
//        return true;
//    }
//
//    /**
//     * 得到订单的总金额
//     *
//     * @param ordervo
//     * @return
//     */
//    private double getOrderAmount(OrderVO ordervo) {
//        double money = 0.00;
//        for (OrderDetailVO detailvo : ordervo.getOrderDetails()) {
//            money += Double.parseDouble(detailvo.getSalePrice()) * Integer.parseInt(detailvo.getSaleSum());
//        }
//        double freight = ordervo.getSendCost() == null ? 0 : Double.parseDouble(ordervo.getSendCost());
//        money += freight;
//        return money;
//    }
//
//    /**
//     * 使用会员账户支付订单,得到会员账户明细记录
//     *
//     * @param ordervo
//     * @return
//     */
//    private MemAccountRecordVO getOrderAccountPayRecord(OrderVO ordervo, MemberAccountVO account) {
//        String uid = ordervo.getMembersSid();
//        MemAccountRecordVO record = new MemAccountRecordVO();
//        record.setDealTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
//        record.setDealType("订单占款");
//        record.setMembersSid(uid);
//        record.setVersion(account.getVersion());
//        record.setMoney(new DecimalFormat("0.00").format(getOrderAmount(ordervo)));
//        return record;
//
//    }
//
//    /**
//     * 使用会员账户支付
//     *
//     * @param m
//     * @param cartId
//     * @param uid
//     * @param orderId
//     * @return
//     */
//    @RequestMapping(value = "/accountpay", method = RequestMethod.POST)
//    public String payOrderByAccount(Model m,
//                                    @CookieValue(value = "userTicket", required = false) String uid,
//                                    String orderId) {
//        if (!validateUid(uid)) {
//            m.addAttribute("result", new AjaxMessageVO("0", "支付失败，当前会话已经失效，请刷新页面"));
//            return null;
//        }
//        uid = securityService.getLoginUserId(uid).getMembersSid();
//        OrderVO ordervo = orderService.getOrder(orderId);
//        if (!uid.equals(ordervo.getMembersSid())) {
//            m.addAttribute("result", new AjaxMessageVO("0", "您不能支付该订单"));
//            return null;
//        }
//        if (!"1".equals(ordervo.getOrderStatus())) {
//            m.addAttribute("result", new AjaxMessageVO("1", "您不能支付该订单，即将跳转到订单信息页面，请查看"));
//            return null;
//        }
//        MemberAccountVO account = memberAccountService.getAccount(uid);
//        MemAccountRecordVO record = getOrderAccountPayRecord(ordervo, account);
//        if (account.getBalance() == null ||
//                Double.parseDouble(account.getBalance()) < Double.parseDouble(record.getMoney())) {
//            m.addAttribute("result", new AjaxMessageVO("0", "使用会员账户支付失败，账户余额不足"));
//            return null;
//        }
//        if (!memberAccountService.accountConsume(record)) {
//            m.addAttribute("result", new AjaxMessageVO("0", "使用会员账户支付失败"));
//            return null;
//        }
//        orderService.orderPayment(ordervo.getOrderNo(), ordervo.getPaymentModeSid());
//        String message = "支付成功，账户扣除金额" + ordervo.getSaleTotalSum() + "元，余额" + account.getBalance() + "元";
//        m.addAttribute("result", new AjaxMessageVO("1", message));
//        return null;
//    }

//    /**
//     * 跳转到支付宝支付页面
//     */
//    @RequestMapping(value = "/toAlipay", method = {RequestMethod.GET, RequestMethod.POST})
//    public String toAlipay(Model m, HttpServletRequest request) {
//        System.out.println("---------去支付宝---------");
//        OrderVO ordersVO = orderService.getOrder(request.getParameter("sid"));
//        //校验订单状态,是否已经付款,缺少
//        if (!"1".equals(ordersVO.getOrderStatus())) {
//            return "redirect:/myshopin/order/" + ordersVO.getOrderId() + ".html";
//        }
//        PayWayVO payway = new PayWayVO();
//        AlipayVO alipay = payway.setAlipay(ordersVO, bankConf);
//        m.addAttribute("_input_charset", "utf-8");
//        m.addAttribute("body", alipay.getBody());
//        m.addAttribute("out_trade_no", alipay.getOut_trade_no());
//        m.addAttribute("partner", alipay.getPartner());
//        m.addAttribute("payment_type", alipay.getPayment_type());
//        m.addAttribute("seller_email", alipay.getSeller_email());
//        m.addAttribute("service", alipay.getService());
//        m.addAttribute("sign", alipay.getSign());
//        m.addAttribute("total_fee", alipay.getTotal_fee());
//        m.addAttribute("sign_type", alipay.getSign_type());
//        m.addAttribute("subject", alipay.getSubject());
//        m.addAttribute("show_url", alipay.getShow_url());
//        m.addAttribute("return_url", alipay.getReturn_url());
//        m.addAttribute("notify_url", alipay.getNotify_url());
//        return "pay/toAlipay";
//    }

//    /**
//     * 跳转到首信易银行支付界面
//     */
//    @RequestMapping(value = "/toBankpay", method = {RequestMethod.GET, RequestMethod.POST})
//    public String toBankPay(Model m, PaymentParameterVO vo, HttpServletResponse response) {
//        System.out.println("---------去首信易---------");
//        OrderVO ordersVO = orderService.getOrder(vo.getOrderSid());
//        //校验订单状态,是否已经付款,缺少
//        if (!"1".equals(ordersVO.getOrderStatus())) {
//            return "redirect:/myshopin/order/" + ordersVO.getOrderId() + ".html";
//        }
//        String paynum = vo.getPaynum();
//        String v_pmode = vo.getV_pmode();
//        PayWayVO payway = new PayWayVO();
//        BankpayVO bankVO = payway.setBankvo(ordersVO, bankConf, v_pmode, paynum);
//        m.addAttribute("v_mid", bankVO.getV_mid());
//        m.addAttribute("v_oid", bankVO.getV_oid());
//        m.addAttribute("v_rcvname", bankVO.getV_rcvname());
//        m.addAttribute("v_rcvaddr", bankVO.getV_rcvaddr());
//        m.addAttribute("v_rcvtel", bankVO.getV_rcvtel());
//        m.addAttribute("v_rcvpost", bankVO.getV_rcvpost());
//        m.addAttribute("v_amount", bankVO.getV_amount());
//        m.addAttribute("v_ymd", bankVO.getV_ymd());
//        m.addAttribute("v_orderstatus", bankVO.getV_orderstatus());
//        m.addAttribute("v_ordername", bankVO.getV_ordername());
//        m.addAttribute("v_moneytype", bankVO.getV_moneytype());
//        m.addAttribute("v_url", bankVO.getV_url());
//        m.addAttribute("v_md5info", bankVO.getV_md5info());
//        m.addAttribute("v_pmode", bankVO.getV_pmode());
//        return "pay/toCapinfo";
//    }

//    @RequestMapping(value = "/icbcPay.html", method = {RequestMethod.GET, RequestMethod.POST})
//    public String pay(Model m, HttpServletRequest request) {
//        return "pay/icbcpay";
//    }

//    /**
//     * 去工商银行支付
//     */
//    @RequestMapping(value = "/toIcbcPay.html", method = {RequestMethod.GET, RequestMethod.POST})
//    public String toPay(Model m, HttpServletRequest request) {
//
//        OrderVO ordersVO = orderService.getOrder(request.getParameter("sid"));
//        //校验订单状态,是否已经付款,缺少
//        if (!"1".equals(ordersVO.getOrderStatus())) {
//            return "redirect:/myshopin/order/" + ordersVO.getOrderId() + ".html";
//        }
//        System.out.println("------"+ordersVO);
//        ordersVO.setSaleTime("20100305" + request.getParameter("time") + "01");
//        PayWayVO payway = new PayWayVO();
//        IcbcVO icbcVO = payway.setIcbcVO(ordersVO, bankConf);
////        m.addAttribute("toUrl", "https://mybank3.dccnet.com.cn/servlet/ICBCINBSEBusinessServlet");
//        m.addAttribute("interfaceName", icbcVO.getInterfaceName());
//        m.addAttribute("interfaceVersion", icbcVO.getInterfaceVersion());
//        m.addAttribute("tranData", icbcVO.getTranData());
//        m.addAttribute("merSignMsg", icbcVO.getMerSignMsg());
//        m.addAttribute("merCert", icbcVO.getMerCert());
//        return "pay/toIcbcPay";
//    }

//    /**
//     * 支付宝return_url方式支付成功回调
//     */
//    @RequestMapping(value = "/taobaoVerify", method = {RequestMethod.GET, RequestMethod.POST})
//    public String alipayVerify(Model m, HttpServletRequest request) {
//        //String partner = "2088002692486430"; //partner合作伙伴id（必须填写）
//        String privateKey = "7e8zsuhffm3f8gdaolfexxdjau6d5mjz"; //partner 的对应交易安全校验码（必须填写）
//        //如果您服务器不支持https交互，可以使用http的验证查询地址
//        String sign = request.getParameter("sign");
//        //获取支付宝ATN返回结果，true是正确的订单信息，false 是无效的
//        Map params = new HashMap();
//        //获得POST 过来参数设置到新的params中
//        Map requestParams = request.getParameterMap();
//        for (Iterator iter = requestParams.keySet().iterator(); iter
//                .hasNext();) {
//            String name = (String) iter.next();
//            String[] values = (String[]) requestParams.get(name);
//            String valueStr = "";
//            for (int i = 0; i < values.length; i++) {
//                valueStr = (i == values.length - 1) ? valueStr + values[i]
//                        : valueStr + values[i] + ",";
//            }
//            try {
//                params.put(name, new String(valueStr.getBytes("ISO-8859-1"), "UTF-8"));
//            } catch (UnsupportedEncodingException e) {
//                e.printStackTrace();
//            }
//        }
//        String mysign = SignatureHelper_return.sign(params, privateKey);
//        String orderNO = params.get("out_trade_no").toString();
//        String totalFee = params.get("total_fee").toString();
//
//        //打印，收到消息比对sign的计算结果和传递来的sign是否匹配
//        if (mysign.equals(sign)) {
//
//            updateOrder(orderNO, totalFee, 2);
//
//            m.addAttribute("message", "支付成功");
//            m.addAttribute("message2", "您已经成功付款，请您关注此订单状态！！");
//        } else {
//            m.addAttribute("message", "支付失败");
//            m.addAttribute("message2", "您支付订单号" + orderNO + "过程中出现错误，请您核查！");
//        }
//        return "pay/taobaoverify";
//    }
//
//    /**
//     * 首信易银行return_url方式支付成功回调
//     */
//    @RequestMapping(value = "/bankVerify", method = {RequestMethod.GET, RequestMethod.POST})
//    public String bankVerify(Model m, HttpServletRequest request) {
//        //原信息
//        String v_oid = request.getParameter("v_oid");
//        String v_pstatus = request.getParameter("v_pstatus");
//        String v_amount = request.getParameter("v_amount");
//        String v_moneytype = request.getParameter("v_moneytype");
//        String strSource = v_oid + v_pstatus + v_amount + v_moneytype;
//        String SignString = request.getParameter("v_sign");
//        try {
//            //公钥验证
//            RSA_MD5 rsaMD5 = new RSA_MD5();
//            int k = rsaMD5.PublicVerifyMD5(bankConf.getPublicKeyFile(), SignString, strSource);
//            if (k == 0) {
//                String orderNO = v_oid.split("-")[2];
//                if ("1".equals(v_pstatus) || "20".equals(v_pstatus)) {
//
//                    updateOrder(orderNO, v_amount, 2);
//
//                    m.addAttribute("result", "订单" + orderNO + "付款已确认");
//                } else {
//                    m.addAttribute("result", "订单" + orderNO + ",银行返回结果：" + request.getParameter("v_pstring"));
//                }
//            } else {
//                m.addAttribute("result", "银联返回结果验证错误");
//            }
//        } catch (Exception e) {
//            m.addAttribute("result", "银联返回结果验证错误");
//        }
//        return "pay/bankverify";
//    }
//
//    /**
//     * 支付宝notify_url方式支付成功回调
//     */
//    @RequestMapping(value = "/alipayNotify", method = {RequestMethod.GET, RequestMethod.POST})
//    public void alipayNotify(Model m, HttpServletRequest request, HttpServletResponse response) {
//
//        String partner = "2088002692486430"; //partner合作伙伴id（必须填写）
//        String privateKey = "7e8zsuhffm3f8gdaolfexxdjau6d5mjz"; //partner 的对应交易安全校验码（必须填写）
//        //如果您服务器不支持https交互，可以使用http的验证查询地址
//        //String alipayNotifyURL = "https://www.alipay.com/cooperate/gateway.do?service=notify_verify"
//        String alipayNotifyURL = "http://notify.alipay.com/trade/notify_query.do?"
//                + "partner="
//                + partner
//                + "&notify_id="
//                + request.getParameter("notify_id");
//        String sign = request.getParameter("sign");
//        //获取支付宝ATN返回结果，true是正确的订单信息，false 是无效的
//        String responseTxt = CheckURL.check(alipayNotifyURL);
//        Map params = new HashMap();
//        //获得POST 过来参数设置到新的params中
//        Map requestParams = request.getParameterMap();
//        for (Iterator iter = requestParams.keySet().iterator(); iter
//                .hasNext();) {
//            String name = (String) iter.next();
//            String[] values = (String[]) requestParams.get(name);
//            String valueStr = "";
//            for (int i = 0; i < values.length; i++) {
//                valueStr = (i == values.length - 1) ? valueStr + values[i]
//                        : valueStr + values[i] + ",";
//            }
//            try {
//                params.put(name, new String(valueStr.getBytes("ISO-8859-1"), "UTF-8"));
//
//            } catch (UnsupportedEncodingException e) {
//                e.printStackTrace();
//            }
//        }
//        String mysign = SignatureHelper_return.sign(params, privateKey);
//        String orderNO = params.get("out_trade_no").toString();
//        String totalFee = params.get("total_fee").toString();
//        //打印，收到消息比对sign的计算结果和传递来的sign是否匹配
//        if (mysign.equals(sign) && responseTxt.equals("true")) {
//            if ("TRADE_SUCCESS".equals(request.getParameter("trade_status"))) {
//
//                updateOrder(orderNO, totalFee, 2);
//
//                try {
//                    response.getWriter().print("success");
//                } catch (IOException e1) {
//                }
//            } else {
//                try {
//                    response.getWriter().print("fail");
//                } catch (IOException e1) {
//                }
//            }
//        } else {
//            try {
//                response.getWriter().print("fail");
//            } catch (IOException e1) {
//            }
//        }
//    }
//
//    /**
//     * 首信易银行notify_url方式支付成功回调
//     */
//    @RequestMapping(value = "/bankNotify", method = {RequestMethod.GET, RequestMethod.POST})
//    public void bankNotify(Model m, HttpServletRequest request, HttpServletResponse response) {
//        //原信息
//        String v_count = request.getParameter("v_count");     //订单个数
//        String v_oid = request.getParameter("v_oid");         //订单编号组
//        //String v_pmode = request.getParameter("v_pmode");     //支付方式组
//        String v_pstatus = request.getParameter("v_pstatus"); //支付状态组
//        //String v_pstring = request.getParameter("v_pstring"); //支付结果说明
//        String v_amount = request.getParameter("v_amount");
//        String v_moneytype = request.getParameter("v_moneytype");
//        String source = v_oid + v_pstatus + v_amount + v_moneytype + v_count;
//        String SignString = request.getParameter("v_sign");
//        try {
//            //公钥验证
//            RSA_MD5 rsaMD5 = new RSA_MD5();
//            int k = rsaMD5.PublicVerifyMD5(bankConf.getPublicKeyFile(), SignString, source);
//            if (k == 0) {
//                if (Integer.parseInt(v_count) == 1) {
//                    String orderNO = v_oid.split("-")[2];
//                    if ("1".equals(v_pstatus)) {
//
//                        updateOrder(orderNO, v_amount, 2);
//
//                        response.getWriter().print("sent");
//                    } else {
//                        response.getWriter().print("error");
//                    }
//                } else {
//                    String[] a_oid = v_oid.split("|_|");
//                    //String[] a_pmode = v_pmode.split("|_|");
//                    String[] a_pstatus = v_pstatus.split("|_|");
//                    //String[] a_pstring = v_pstring.split("|_|");
//                    String[] a_amount = v_amount.split("|_|");
//                    //String[] a_moneytype = v_moneytype.split("|_|");
//                    if (a_oid.length == Integer.parseInt(v_count)) {
//                        for (int i = 0; i < a_oid.length; i++) {
//                            String s = a_oid[i];
//                            String orderNO = s.split("-")[2];
//                            String status = a_pstatus[i];
//                            String amount = a_amount[i];
//                            if ("1".equals(status)) {
//                                updateOrder(orderNO, v_amount, 2);
//                            }
//                        }
//                        response.getWriter().print("sent");
//                    } else {
//                        response.getWriter().print("error");
//                    }
//                }
//            } else {
//                response.getWriter().print("error");
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            try {
//                response.getWriter().print("error");
//            } catch (IOException e1) {
//            }
//        }
//    }
//
//    private void updateOrder(String orderNO, String totalFee, int payType) {
//        OrderVO orderVO = orderService.getOrderByNO(orderNO);
//        // if ("0".equals(orderVO.getCheckBit())) {
//
//        OrdersPayVO mopvo = new OrdersPayVO();
//        mopvo.setOrderSid(orderVO.getOrderId());
//        mopvo.setPayType(payType + "");
//        mopvo.setPayMoney(totalFee);
//
//        paymentService.savePaymentRecord(mopvo);
//
//        Double paySum = paymentService.getPaymentRecordSum(orderVO.getOrderId());
//        Double payYet = Double.parseDouble(totalFee);
//        Double orderMoney = Double.parseDouble(orderVO.getSaleMoneySum()) + Double.parseDouble(orderVO.getSendCost());
//
//        if ((paySum + payYet) >= (orderMoney)) {
//            orderService.updateAfterPay(orderVO.getOrderId(), payType);
//        }
//    }
//
//    private SalesDetailVO getSaleDetail() {
//
//        SalesDetailVO saleVO = new SalesDetailVO();
//
//        return saleVO;
//    }


    //    /**
//     * 跳转到首信易银行支付界面
//     */
//    @RequestMapping(value = "/toCapinfo", method = {RequestMethod.GET, RequestMethod.POST})
//    public String toBankAccountPay(Model m, PaymentParameterVO vo) {
//        OrderVO ordersVO = orderService.getOrder(vo.getOrderSid());
//        String paynum = vo.getPaynum();
//        String v_pmode = vo.getV_pmode();
//        PayWayVO payway = new PayWayVO();
//        BankpayVO bankVO = payway.setBankvo(ordersVO, bankConf, v_pmode, paynum);
//        if (v_pmode.equals("22")) {
//            m.addAttribute("v_mid", bankVO.getV_mid());
//            m.addAttribute("v_oid", bankVO.getV_oid());
//            m.addAttribute("v_rcvname", bankVO.getV_rcvname());
//            m.addAttribute("v_rcvaddr", bankVO.getV_rcvaddr());
//            m.addAttribute("v_rcvtel", bankVO.getV_rcvtel());
//            m.addAttribute("v_rcvpost", bankVO.getV_rcvpost());
//            m.addAttribute("v_amount", bankVO.getV_amount());
//            m.addAttribute("v_ymd", bankVO.getV_ymd());
//            m.addAttribute("v_orderstatus", bankVO.getV_orderstatus());
//            m.addAttribute("v_ordername", bankVO.getV_ordername());
//            m.addAttribute("v_moneytype", bankVO.getV_moneytype());
//            m.addAttribute("v_url", bankVO.getV_url());
//            m.addAttribute("v_md5info", bankVO.getV_md5info());
//            m.addAttribute("v_pmode", bankVO.getV_pmode());
//        }
//        return "order/toCapinfo";
//    }

}
