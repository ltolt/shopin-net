package net.shopin.web.payController;

import chinapay.PrivateKey;
import chinapay.SecureLink;
import net.shopin.api.IMemberPointService;
import net.shopin.api.IOrderService;
import net.shopin.api.IPaymentService;
import net.shopin.view.MemPointRecordVO;
import net.shopin.view.OrderVO;
import net.shopin.view.OrdersPayVO;
import net.shopin.web.conf.ChinapayConf;
import net.shopin.web.conf.YeePayConf;
import net.shopin.web.conf.yeePayConf.DigestUtil;
import net.shopin.web.conf.yeePayConf.PaymentForOnlineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-3-9
 * Time: 17:33:56
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class YeePayVerifyController {
    @Autowired
    IOrderService orderService;
    @Autowired
    ChinapayConf chinapayConf;
    @Autowired
    IPaymentService paymentService;
    @Autowired
    IMemberPointService memberPointService;
    @Autowired
    YeePayConf yeePayConf;

    /**
     * 银行方式支付成功回调
     */
    @RequestMapping(value = "/yeePayVerify", method = {RequestMethod.GET, RequestMethod.POST})
    public String bankNotify(Model m, HttpServletRequest request, HttpServletResponse response) {
        String returnPage = "pay/payFail";
        try {
            String keyValue = formatString(yeePayConf.getKeyValue());   // 商家密钥
            String r0_Cmd = formatString(request.getParameter("r0_Cmd")); // 业务类型
            String p1_MerId = formatString(yeePayConf.getP1MerId());   // 商户编号
            String r1_Code = formatString(request.getParameter("r1_Code"));// 支付结果
            String r2_TrxId = formatString(request.getParameter("r2_TrxId"));// 易宝支付交易流水号
            String r3_Amt = formatString(request.getParameter("r3_Amt"));// 支付金额
            String r4_Cur = formatString(request.getParameter("r4_Cur"));// 交易币种
            String r5_Pid = new String(formatString(request.getParameter("r5_Pid")).getBytes("iso-8859-1"), "gbk");// 商品名称
            String r6_Order = formatString(request.getParameter("r6_Order"));// 商户订单号
            String r7_Uid = formatString(request.getParameter("r7_Uid"));// 易宝支付会员ID
            String r8_MP = new String(formatString(request.getParameter("r8_MP")).getBytes("iso-8859-1"), "gbk");// 商户扩展信息
            String r9_BType = formatString(request.getParameter("r9_BType"));// 交易结果返回类型
            String hmac = formatString(request.getParameter("hmac"));// 签名数据
            boolean isOK = false;
            // 校验返回数据包
            isOK = verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code,
                    r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType, keyValue);
            if (isOK) {
                //在接收到支付结果通知后，判断是否进行过业务逻辑处理，不要重复进行业务逻辑处理
                if (r1_Code.equals("1")) {
                    OrderVO ordersVO = orderService.getOrderByNO(r6_Order);
//                    String money =ordersVO.getSaleTotalSum();
                    double money =Double.parseDouble(ordersVO.getSaleTotalSum());
                    double pay =Double.parseDouble(r3_Amt);
                    // 产品通用接口支付成功返回-浏览器重定向
                    if (money==pay&& ordersVO.getOrderStatus().equals("1")) {
                        OrderVO orderVO = updateOrder(r6_Order, r3_Amt, r2_TrxId, "0");
                        if (r9_BType.equals("1")) {
                            m.addAttribute("order", orderVO);
                            returnPage = "pay/paySucess";
                            //out.println("callback方式:产品通用接口支付成功返回-浏览器重定向");
                            // 产品通用接口支付成功返回-服务器点对点通讯
                        } else if (r9_BType.equals("2")) {
                            // 如果在发起交易请求时	设置使用应答机制时，必须应答以"success"开头的字符串，大小写不敏感
                            //out.println("SUCCESS");
                            // 产品通用接口支付成功返回-电话支付返回
                            response.getWriter().println("SUCCESS");
                        }
                    } else {
                        returnPage = "pay/payFail";
                    }
                }
            } else {
                //out.println("交易签名被篡改!");
                returnPage = "pay/payFail";
            }
        } catch (Exception e) {
            returnPage = "pay/payFail";
            e.printStackTrace();
        }
        return returnPage;
    }

    private OrderVO updateOrder(String orderNO, String totalFee, String tradeNo, String discount) {
        OrderVO orderVO = orderService.getOrderByNO(orderNO);
        OrdersPayVO mopvo = new OrdersPayVO();
        mopvo.setOrderSid(orderVO.getOrderId());
        mopvo.setPayType(orderVO.getPaymentModeSid());
        mopvo.setPayMoney(totalFee);
        mopvo.setTradeNo(tradeNo);
        mopvo.setDiscount(discount);
        paymentService.savePaymentRecord(mopvo);
        try {
            MemPointRecordVO recordVO = new MemPointRecordVO();
            recordVO.setMembersSid(orderVO.getMembersSid());
            Double point = Math.rint(Double.parseDouble(totalFee));
            recordVO.setExpPoints(point.intValue() + "");
            recordVO.setExpType("购买商品");
            recordVO.setMemo("购买商品赠送积分" + totalFee);
            memberPointService.pointCharge(recordVO);
        } catch (Exception e) {
        }
        Double paySum = paymentService.getPaymentRecordSum(orderVO.getOrderId());
        Double payYet = Double.parseDouble(totalFee);
        Double orderMoney = Double.parseDouble(orderVO.getSaleMoneySum()) + Double.parseDouble(orderVO.getSendCost());
        if ((paySum + payYet) >= (orderMoney)) {
            orderService.orderPayment(orderVO.getOrderNo(), orderVO.getPaymentModeSid());
        }
        return orderVO;
    }

    private String formatString(String text) {
        if (text == null) {
            return "";
        }
        return text;
    }

    private boolean verifyCallback(String hmac, String p1_MerId,
                                   String r0_Cmd, String r1_Code, String r2_TrxId, String r3_Amt,
                                   String r4_Cur, String r5_Pid, String r6_Order, String r7_Uid,
                                   String r8_MP, String r9_BType, String keyValue) {
        StringBuffer sValue = new StringBuffer();
        // 商户编号
        sValue.append(p1_MerId);
        // 业务类型
        sValue.append(r0_Cmd);
        // 支付结果
        sValue.append(r1_Code);
        // 易宝支付交易流水号
        sValue.append(r2_TrxId);
        // 支付金额
        sValue.append(r3_Amt);
        // 交易币种
        sValue.append(r4_Cur);
        // 商品名称
        sValue.append(r5_Pid);
        // 商户订单号
        sValue.append(r6_Order);
        // 易宝支付会员ID
        sValue.append(r7_Uid);
        // 商户扩展信息
        sValue.append(r8_MP);
        // 交易结果返回类型
        sValue.append(r9_BType);
        String sNewString = null;
        sNewString = DigestUtil.hmacSign(sValue.toString(), keyValue);

        if (hmac.equals(sNewString)) {
            return (true);
        }
        return (false);
    }

}