package net.shopin.web.payController;

import cn.com.infosec.icbc.ReturnValue;
import com.capinfo.crypt.RSA_MD5;
import net.shopin.api.*;
import net.shopin.view.MemPointRecordVO;
import net.shopin.view.OrderVO;
import net.shopin.view.OrdersPayVO;
import net.shopin.view.SalesDetailVO;
import net.shopin.web.conf.BankConf;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-3-9
 * Time: 17:33:56
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class IcbcVerifyController {
    @Autowired
    IOrderService orderService;
    @Autowired
    BankConf bankConf;
    @Autowired
    IPaymentService paymentService;
    @Autowired
    IMemberPointService memberPointService;


    /**
     * 工商银行方式支付成功回调
     */
    @RequestMapping(value = "/icbcNotify", method = {RequestMethod.GET, RequestMethod.POST})
    public String bankNotify(Model m, HttpServletRequest request, HttpServletResponse response) {
        String returnPage = "pay/payFail";
        String signMsg = request.getParameter("signMsg");     //银行签名数据
        try {
            String mySignMsg = new String(signMsg.getBytes("ISO-8859-1"), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String notifyData = request.getParameter("notifyData"); //结果数据
        String merVAR = request.getParameter("merVAR"); //网站变量
        String notifyDatas;
        byte[] notifyDataByte = ReturnValue.base64dec(notifyData.getBytes());
        notifyDatas = new String(notifyDataByte).toString();
        SAXBuilder builder = new SAXBuilder();
        try {
            byte[] byteSrc = signMsg.getBytes();
            FileInputStream in1 = new FileInputStream(bankConf.getIcbcBankFile());
            byte[] bcert = new byte[in1.available()];
            in1.read(bcert);
            in1.close();
            byte[] EncCert = ReturnValue.base64enc(bcert);
            byte[] DecSign = ReturnValue.base64dec(signMsg.getBytes());
            if (DecSign != null) {
                byte[] DecCert = ReturnValue.base64dec(EncCert);
                if (DecCert != null) {
                    int a = ReturnValue.verifySign(notifyDataByte, notifyDataByte.length, DecCert, DecSign);
                    if (a == 0) {
                        Document doc = builder.build(new StringReader(notifyDatas));
                        Element root = doc.getRootElement();
                        Element bank = root.getChild("bank");
                        Element orderInfo = root.getChild("orderInfo");
                        String status = bank.getChildText("tranStat");
                        String tranSerialNo = bank.getChildText("TranSerialNo");
                        String orderNo = orderInfo.getChildText("orderid");
                        String amount = orderInfo.getChildText("amount");
                        if ("1".equals(status)) {
                            OrderVO orderVO = updateOrder(orderNo, amount, tranSerialNo, "0");
                            m.addAttribute("order", orderVO);
                            returnPage = "pay/paySucess";
                        } else {
                            returnPage = "pay/payFail";
                        }
                    } else {
                        returnPage = "pay/payFail";
                    }
                } else {
                    returnPage = "pay/payFail";
                }
            } else {
                returnPage = "pay/payFail";
            }
        } catch (Exception e) {
            e.printStackTrace();
            returnPage = "pay/payFail";
        }
        return returnPage;
    }

    private OrderVO updateOrder(String orderNO, String totalFee,String tradeNo,String discount) {
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