package net.shopin.web.payController;

import cmb.netpayment.Security;
import net.shopin.api.IMemberPointService;
import net.shopin.api.IOrderService;
import net.shopin.api.IPaymentService;
import net.shopin.view.MemPointRecordVO;
import net.shopin.view.OrderVO;
import net.shopin.view.OrdersPayVO;
import net.shopin.web.conf.BankConf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-3-9
 * Time: 17:33:56
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class CmbVerifyController {
    @Autowired
    IOrderService orderService;
    @Autowired
    BankConf bankConf;
    @Autowired
    IPaymentService paymentService;
    @Autowired
    IMemberPointService memberPointService;


    /**
     * 银行方式支付成功回调
     */
    @RequestMapping(value = "/cmbVerify", method = {RequestMethod.GET, RequestMethod.POST})
    public String bankNotify(Model m, HttpServletRequest request, HttpServletResponse response) {
        String returnPage = "pay/payFail";
        String orderNo = request.getParameter("MerchantPara");     //银行签名数据
        String succeed = request.getParameter("Succeed");
        String billNo = request.getParameter("BillNo");
        String amount = request.getParameter("Amount");
        String msg = request.getParameter("Msg");
        String baSig = request.getQueryString();
        try {
            if (succeed.equals("Y")) {
                Security pay = new Security(bankConf.getCmbPublicKey());
                OrderVO ordersVO = orderService.getOrderByNO(orderNo);
//                Double money = Double.parseDouble(ordersVO.getSaleTotalSum());
                Double money=0.01d;
                String bankNo=msg.substring(18,msg.length());
                boolean bRet = pay.checkInfoFromBank(baSig.getBytes());
                if (money.toString().equals(amount) && bRet == true) {
                    OrderVO orderVO = updateOrder(orderNo, amount, bankNo, "0");
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