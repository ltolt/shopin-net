package net.shopin.web.payController;

import com.capinfo.crypt.RSA_MD5;
import net.shopin.api.*;
import net.shopin.view.MemPointRecordVO;
import net.shopin.view.OrderVO;
import net.shopin.view.OrdersPayVO;
import net.shopin.view.SalesDetailVO;
import net.shopin.web.conf.BankConf;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-3-9
 * Time: 17:33:56
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class BankVerifyController {
    @Autowired
    IOrderService orderService;
    @Autowired
    BankConf bankConf;
    @Autowired
    IPaymentService paymentService;
    @Autowired
    IMemberPointService memberPointService;

    /**
     * 首信易银行return_url方式支付成功回调
     */
    @RequestMapping(value = "/bankverify", method = {RequestMethod.GET, RequestMethod.POST})
    public String bankVerify(Model m, HttpServletRequest request) {
        String returnPage = "";
        //原信息
        String v_oid = request.getParameter("v_oid");
        String v_pstatus = request.getParameter("v_pstatus");
        String v_amount = request.getParameter("v_amount");
        String v_moneytype = request.getParameter("v_moneytype");
        String strSource = v_oid + v_pstatus + v_amount + v_moneytype;
        String SignString = request.getParameter("v_sign");
        try {
            //公钥验证
            RSA_MD5 rsaMD5 = new RSA_MD5();
            int k = rsaMD5.PublicVerifyMD5(bankConf.getPublicKeyFile(), SignString, strSource);
            if (k == 0) {
                String orderNO = v_oid.split("-")[2];
                String tradeNo = v_oid.split("-")[3];
                if ("1".equals(v_pstatus) || "20".equals(v_pstatus)) {
                    OrderVO orderVO = updateOrder(orderNO, v_amount,tradeNo);
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
        }
        return returnPage;
    }

    /**
     * 首信易银行notify_url方式支付成功回调
     */
    @RequestMapping(value = "/banknotify", method = {RequestMethod.GET, RequestMethod.POST})
    public void bankNotify(Model m, HttpServletRequest request, HttpServletResponse response) {
        //原信息
        String v_count = request.getParameter("v_count");     //订单个数
        String v_oid = request.getParameter("v_oid");         //订单编号组
        //String v_pmode = request.getParameter("v_pmode");     //支付方式组
        String v_pstatus = request.getParameter("v_pstatus"); //支付状态组
        //String v_pstring = request.getParameter("v_pstring"); //支付结果说明
        String v_amount = request.getParameter("v_amount");
        String v_moneytype = request.getParameter("v_moneytype");
        String source = v_oid + v_pstatus + v_amount + v_moneytype + v_count;
        String SignString = request.getParameter("v_sign");
        try {
            //公钥验证
            RSA_MD5 rsaMD5 = new RSA_MD5();
            int k = rsaMD5.PublicVerifyMD5(bankConf.getPublicKeyFile(), SignString, source);
            if (k == 0) {
                if (Integer.parseInt(v_count) == 1) {
                    String orderNO = v_oid.split("-")[2];
                    String tradeNo = v_oid.split("-")[3];
                    if ("1".equals(v_pstatus)) {

                        updateOrder(orderNO, v_amount,tradeNo);

                        response.getWriter().print("sent");
                    } else {
                        response.getWriter().print("error");
                    }
                } else {
                    String[] a_oid = v_oid.split("|_|");
                    //String[] a_pmode = v_pmode.split("|_|");
                    String[] a_pstatus = v_pstatus.split("|_|");
                    //String[] a_pstring = v_pstring.split("|_|");
                    String[] a_amount = v_amount.split("|_|");
                    //String[] a_moneytype = v_moneytype.split("|_|");
                    if (a_oid.length == Integer.parseInt(v_count)) {
                        for (int i = 0; i < a_oid.length; i++) {
                            String s = a_oid[i];
                            String orderNO = s.split("-")[2];
                            String tradeNo = v_oid.split("-")[3];
                            String status = a_pstatus[i];
                            String amount = a_amount[i];
                            if ("1".equals(status)) {
                                updateOrder(orderNO, v_amount,tradeNo);
                            }
                        }
                        response.getWriter().print("sent");
                    } else {
                        response.getWriter().print("error");
                    }
                }
            } else {
                response.getWriter().print("error");
            }
        } catch (Exception e) {
            e.printStackTrace();
            try {
                response.getWriter().print("error");
            } catch (IOException e1) {
            }
        }
    }

    private OrderVO updateOrder(String orderNO, String totalFee,String tradeNo) {
        OrderVO orderVO = orderService.getOrderByNO(orderNO);
        OrdersPayVO mopvo = new OrdersPayVO();
        mopvo.setOrderSid(orderVO.getOrderId());
        mopvo.setPayType(orderVO.getPaymentModeSid());
        mopvo.setPayMoney(totalFee);
        mopvo.setTradeNo(tradeNo);
        mopvo.setDiscount("0");
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