package net.shopin.web.payController;

import net.shopin.api.*;
import net.shopin.view.MemPointRecordVO;
import net.shopin.view.OrderVO;
import net.shopin.view.OrdersPayVO;
import net.shopin.view.SalesDetailVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.conf.CheckURL;
import net.shopin.web.conf.SignatureHelper_return;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-3-9
 * Time: 17:33:56
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class AlipayVerifyController {
    @Autowired
    IOrderService orderService;
    @Autowired
    IPaymentService paymentService;
    @Autowired
    IMemberPointService memberPointService;
    
    protected final Logger log = LoggerFactory.getLogger(getClass());

    /**
     * 支付宝return_url方式支付成功回调
     */
    @RequestMapping(value = "/taobaoverify", method = {RequestMethod.GET, RequestMethod.POST})
    public String alipayVerify(Model m, HttpServletRequest request) {
        String returnPage = "";
        //String partner = "2088002692486430"; //partner合作伙伴id（必须填写）
        String privateKey = "7e8zsuhffm3f8gdaolfexxdjau6d5mjz"; //partner 的对应交易安全校验码（必须填写）
        //如果您服务器不支持https交互，可以使用http的验证查询地址
        String sign = request.getParameter("sign");
        //获取支付宝ATN返回结果，true是正确的订单信息，false 是无效的
        Map params = new HashMap();
        //获得POST 过来参数设置到新的params中
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter
                .hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            try {
                params.put(name, new String(valueStr.getBytes("ISO-8859-1"), "UTF-8"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        String mysign = SignatureHelper_return.sign(params, privateKey);
        String orderNO = params.get("out_trade_no").toString();
        String totalFee = params.get("total_fee").toString();
        String tradeNo = params.get("trade_no").toString();
        //打印，收到消息比对sign的计算结果和传递来的sign是否匹配
        OrderVO vo = orderService.getOrderByNO(orderNO);
        if(!vo.getSaleTotalSum().equals(totalFee)){
           returnPage = "pay/payFail";
           return returnPage;
        }
        if (mysign.equals(sign)) {
            OrderVO orderVO = updateOrder(orderNO, totalFee, tradeNo, "0");
            m.addAttribute("order", orderVO);
            returnPage = "pay/paySucess";
        } else {
            returnPage = "pay/payFail";
        }
        return returnPage;
    }

    /**
     * 支付宝notify_url方式支付成功回调
     */
    @RequestMapping(value = "/alipaynotify", method = {RequestMethod.GET, RequestMethod.POST})
    public void alipayNotify(Model m, HttpServletRequest request, HttpServletResponse response) {

        String partner = "2088002692486430"; //partner合作伙伴id（必须填写）
        String privateKey = "7e8zsuhffm3f8gdaolfexxdjau6d5mjz"; //partner 的对应交易安全校验码（必须填写）
        //如果您服务器不支持https交互，可以使用http的验证查询地址
        //String alipayNotifyURL = "https://www.alipay.com/cooperate/gateway.do?service=notify_verify"
        String alipayNotifyURL = "http://notify.alipay.com/trade/notify_query.do?"
                + "partner="
                + partner
                + "&notify_id="
                + request.getParameter("notify_id");
        String sign = request.getParameter("sign");
        //获取支付宝ATN返回结果，true是正确的订单信息，false 是无效的
        String responseTxt = CheckURL.check(alipayNotifyURL);
        Map params = new HashMap();
        //获得POST 过来参数设置到新的params中
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter
                .hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            try {
                params.put(name, new String(valueStr.getBytes("ISO-8859-1"), "UTF-8"));

            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        String mysign = SignatureHelper_return.sign(params, privateKey);
        String orderNO = params.get("out_trade_no").toString();
        String totalFee = params.get("total_fee").toString();
        String discount = params.get("discount").toString();
        String tradeNo = params.get("trade_no").toString();
        totalFee = "" + new BigDecimal(totalFee).subtract(new BigDecimal(discount));
        //打印，收到消息比对sign的计算结果和传递来的sign是否匹配
        if (mysign.equals(sign) && responseTxt.equals("true")) {
            if ("TRADE_SUCCESS".equals(request.getParameter("trade_status"))||"TRADE_FINISHED".equals(request.getParameter("trade_status"))) {

                updateOrder(orderNO, totalFee, tradeNo, discount);

                try {
                    response.getWriter().print("success");
                } catch (IOException e1) {
                }
            } else {
                try {
                    response.getWriter().print("fail");
                } catch (IOException e1) {
                }
            }
       } else {
            log.warn("确认付款异常：mysign="+mysign+"&sign="+sign+"&orderNO="+orderNO+"&totalFee="+totalFee+"&discount="+discount+"&tradeNo="+tradeNo);
            try {
                response.getWriter().print("fail");
            } catch (IOException e1) {
            }
        }
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