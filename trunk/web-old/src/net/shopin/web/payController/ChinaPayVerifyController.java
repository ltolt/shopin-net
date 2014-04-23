package net.shopin.web.payController;

import chinapay.PrivateKey;
import chinapay.SecureLink;
import cmb.netpayment.Security;
import net.shopin.api.IMemberPointService;
import net.shopin.api.IOrderService;
import net.shopin.api.IPaymentService;
import net.shopin.view.MemPointRecordVO;
import net.shopin.view.OrderVO;
import net.shopin.view.OrdersPayVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.conf.ChinapayConf;
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
public class ChinaPayVerifyController {
    @Autowired
    IOrderService orderService;
    @Autowired
    ChinapayConf chinapayConf;
    @Autowired
    IPaymentService paymentService;
    @Autowired
    IMemberPointService memberPointService;


    /**
     * 银行方式支付成功回调
     */
    @RequestMapping(value = "/chinaPayVerify", method = {RequestMethod.GET, RequestMethod.POST})
    public String bankNotify(Model m, HttpServletRequest request, HttpServletResponse response) {
        String returnPage = "pay/payFail";
        String priv1 = request.getParameter("Priv1");     //银行签名数据
        String status = request.getParameter("status");
        String checkvalue = request.getParameter("checkvalue");
        String amount = request.getParameter("amount");
        String merid = request.getParameter("merid");
        String orderno = request.getParameter("orderno");
        String transdate = request.getParameter("transdate");
        String currencycode = request.getParameter("currencycode");
        String transtype = request.getParameter("transtype");
        String orderNo = orderno.substring(2, orderno.length());     //银行签名数据

        try {
            if (status.equals("1001")) {
                OrderVO ordersVO = orderService.getOrderByNO(orderNo);
//                Double money = Double.parseDouble(ordersVO.getSaleTotalSum())*100;
                Double money = 0.01d * 100;
                PrivateKey key = new PrivateKey();
                Boolean flag = key.buildKey("999999999999999", 0, chinapayConf.getChinaPayPublicKey());
                SecureLink sl = new SecureLink(key);
                Boolean bRet = sl.verifyTransResponse(merid, orderno, amount, currencycode, transdate, transtype, status, checkvalue);
                String tran = money.longValue() + "";
                String trans = tran;
                if (tran.length() < 12) {
                    for (int i = 0; i < 12 - tran.length(); i++) {
                        trans = "0" + trans;
                    }
                }

                if (trans.equals(amount) && bRet == true) {
                    OrderVO orderVO = updateOrder(orderNo, amount, orderno, "0");
                    m.addAttribute("order", orderVO);
                    returnPage = "pay/paySucess";
                } else {
                    returnPage = "pay/payFail";
                }
            } else {
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

}