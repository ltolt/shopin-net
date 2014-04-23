package net.shopin.web.payController;

import net.shopin.api.IMemberPointService;
import net.shopin.api.IOrderService;
import net.shopin.api.IPaymentService;
import net.shopin.view.MemPointRecordVO;
import net.shopin.view.OrderVO;
import net.shopin.view.OrdersPayVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.conf.SignatureHelper_return;
import net.shopin.web.tenpay.PayResponseHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-9-9
 * Time: 17:33:56
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class TenpayVerifyController {
    @Autowired
    IOrderService orderService;
    @Autowired
    IPaymentService paymentService;
    @Autowired
    IMemberPointService memberPointService;
    @Autowired
    BankConf bankConf;

    /**
     * 财付通return_url方式支付成功回调
     */
    @RequestMapping(value = "/tenpayVerify", method = {RequestMethod.GET, RequestMethod.POST})
    public String alipayVerify(Model m, HttpServletRequest request, HttpServletResponse response) {
        String returnPage = "";
        //创建PayResponseHandler实例
        PayResponseHandler resHandler = new PayResponseHandler(request, response);
        resHandler.setKey(bankConf.getTenpayKey());
        //判断签名
        if (resHandler.isTenpaySign()) {
            //交易单号
            String transaction_id = resHandler.getParameter("transaction_id");
            //金额金额,以分为单位
            String total_fee = resHandler.getParameter("total_fee");
           total_fee=Integer.parseInt(total_fee)/100+"";
//            String total_fee = "500";
            String orderNO = resHandler.getParameter("attach");
//            String orderNO = "20100324000020";
            String tradeNo = resHandler.getParameter("transaction_id");
            //支付结果
            String pay_result = resHandler.getParameter("pay_result");

            if ("0".equals(pay_result)) {
                OrderVO orderVO = updateOrder(orderNO, total_fee, tradeNo, "0");
                m.addAttribute("order", orderVO);
                returnPage = "pay/paySucess";

                //调用doShow, 打印meta值跟js代码,告诉财付通处理成功,并在用户浏览器显示$show页面.
//                resHandler.doShow("http://localhost:8080/tenpay/show.jsp");
            } else {
                //当做不成功处理
                System.out.println("支付失败");
                returnPage = "pay/payFail";
            }
        } else {
            System.out.println("认证签名失败");
            returnPage = "pay/payFail";
            //String debugInfo = resHandler.getDebugInfo();
            //System.out.println("debugInfo:" + debugInfo);
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