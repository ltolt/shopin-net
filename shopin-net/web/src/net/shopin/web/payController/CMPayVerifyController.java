//package net.shopin.web.payController;
//
//import com.hisun.iposm.HiiposmUtil;
//import net.shopin.api.IOrderService;
//import net.shopin.view.MemPointRecordVO;
//import net.shopin.view.OrderVO;
//import net.shopin.view.OrdersPayVO;
//import net.shopin.web.conf.BankConf;
//import net.shopin.web.conf.CheckURL;
//import net.shopin.web.conf.SignatureHelper_return;
//import net.shopin.web.util.OrderPaymentUtil;
//import net.shopin.web.util.OrderUtil;
//import net.shopin.web.util.PreUtil;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.io.UnsupportedEncodingException;
//import java.math.BigDecimal;
//import java.util.HashMap;
//import java.util.Iterator;
//import java.util.Map;
//
///**
// *
// */
//@Controller
//public class CMPayVerifyController {
//
//    @Autowired
//    BankConf bankConf;
//
//
//    protected final Logger log = LoggerFactory.getLogger(getClass());
//
//
//    @RequestMapping(value = "/cmpay/cmpayCallback", method = {RequestMethod.GET, RequestMethod.POST})
//    public String cmpayCallback(Model m, HttpServletRequest request) {
//
//        String signKey = bankConf.getCmpaySignKey();
//        String returnPage = "pay/paySucess";
//        try {
//            String merchantId = request.getParameter("merchantId");
//            String payNo = request.getParameter("payNo");
//            String returnCode = request.getParameter("returnCode");
//            String message = request.getParameter("message");
//            String signType = request.getParameter("signType");
//            String type = request.getParameter("type");
//            String version = request.getParameter("version");
//            String amount = request.getParameter("amount");
//            String amtItem = request.getParameter("amtItem");
//            String bankAbbr = request.getParameter("bankAbbr");
//            String mobile = request.getParameter("mobile");
//            String orderId = request.getParameter("orderId");
//            String payDate = request.getParameter("payDate");
//            String reserved1 = request.getParameter("reserved1");
//            String reserved2 = request.getParameter("reserved2");
//            String status = request.getParameter("status");
//            String orderDate = request.getParameter("orderDate");
//            String fee = request.getParameter("fee");
//            String hmac = request.getParameter("hmac");
//            String accountDate = request.getParameter("accountDate");
//
//            //必输字段 非空验证
//            if (merchantId == null) {
//                merchantId = "";
//            }
//            if (payNo == null) {
//                payNo = "";
//            }
//            if (returnCode == null) {
//                returnCode = "";
//            }
//            if (message == null) {
//                message = "";
//            }
//            if (signType == null) {
//                signType = "MD5";
//            }
//            if (type == null) {
//                type = "";
//            }
//            if (version == null) {
//                version = "";
//            }
//            if (amount == null) {
//                amount = "";
//            }
//            if (amtItem == null) {
//                amtItem = "";
//            }
//            if (bankAbbr == null) {
//                bankAbbr = "";
//            }
//            if (mobile == null) {
//                mobile = "";
//            }
//            if (orderId == null) {
//                orderId = "";
//            }
//            if (payDate == null) {
//                payDate = "";
//            }
//            if (reserved1 == null) {
//                reserved1 = "";
//            }
//            if (reserved2 == null) {
//                reserved2 = "";
//            }
//            if (status == null) {
//                status = "";
//            }
//            if (orderDate == null) {
//                orderDate = "";
//            }
//            if (fee == null) {
//                fee = "";
//            }
//            if (hmac == null) {
//                hmac = "";
//            }
//            if (accountDate == null) {
//                accountDate = "";
//            }
//            //验签报文
//            String signData = merchantId + payNo + returnCode + message + signType
//                    + type + version + amount + amtItem + bankAbbr + mobile
//                    + orderId + payDate + accountDate + reserved1 + reserved2 + status
//                    + orderDate + fee;
//
//            HiiposmUtil util = new HiiposmUtil();
//            //验签消息摘要
//            String hmac1 = util.MD5Sign(signData, signKey);
//            boolean sign_flag = util.MD5Verify(signData, hmac, signKey);
//            if (sign_flag) {//验签成功
//
//                OrderPaymentUtil.orderPayment(orderId, String.valueOf(new Double(amount).doubleValue() / 100), payNo, "0");
//                //modify by guanshiqiang for orderService项目迁移 at 2013-04-25 begin
//                //OrderVO orderVO = orderService.getOrderByNO(orderId);//OrderVO orderVO = ordersVO;
//                OrderVO orderVO = OrderUtil.getOrderByNO(orderId);
//                //modify by guanshiqiang for orderService项目迁移 at 2013-04-25 end
//
//                m.addAttribute("order", orderVO);
//                returnPage = "pay/paySucess";
//                returnPage = PreUtil.getReturnPage(m, request, orderVO, returnPage,
//                        (orderVO.getBookFlag()!=null&&orderVO.getBookFlag().trim().length()>0) ? Integer.valueOf(orderVO.getBookFlag()) : -1
//                        );
//            } else {
//                returnPage = "pay/payFail";
//            }
//
//        } catch (Exception e) {
//            returnPage = "pay/payFail";
//        }
//        return returnPage;
//    }
//
//    /**
//     * 支付宝notify_url方式支付成功回调
//     */
//    @RequestMapping(value = "/cmpay/cmpayNotify", method = {RequestMethod.GET, RequestMethod.POST})
//    public String cmpayNotify(Model m, HttpServletRequest request, HttpServletResponse response) {
//
//
//        String signKey = bankConf.getCmpaySignKey();
//
//        try {
//            //获取通知请求request中的参数
//            String merchantId = request.getParameter("merchantId");
//            String payNo = request.getParameter("payNo");
//            String returnCode = request.getParameter("returnCode");
//            String message = request.getParameter("message");
//            String signType = request.getParameter("signType");
//            String type = request.getParameter("type");
//            String version = request.getParameter("version");
//            String amount = request.getParameter("amount");
//            String amtItem = request.getParameter("amtItem");
//            String bankAbbr = request.getParameter("bankAbbr");
//            String mobile = request.getParameter("mobile");
//            String orderId = request.getParameter("orderId");
//            String payDate = request.getParameter("payDate");
//            String reserved1 = request.getParameter("reserved1");
//            String reserved2 = request.getParameter("reserved2");
//            String status = request.getParameter("status");
//            String orderDate = request.getParameter("orderDate");
//            String fee = request.getParameter("fee");
//            String hmac = request.getParameter("hmac");
//            String accountDate = request.getParameter("accountDate");
//
//            //必输字段非空验证
//            if (merchantId == null) {
//                merchantId = "";
//            }
//            if (payNo == null) {
//                payNo = "";
//            }
//            if (returnCode == null) {
//                returnCode = "";
//            }
//            if (message == null) {
//                message = "";
//            }
//            if (signType == null) {
//                signType = "MD5";
//            }
//            if (type == null) {
//                type = "";
//            }
//            if (version == null) {
//                version = "";
//            }
//            if (amount == null) {
//                amount = "";
//            }
//            if (amtItem == null) {
//                amtItem = "";
//            }
//            if (bankAbbr == null) {
//                bankAbbr = "";
//            }
//            if (mobile == null) {
//                mobile = "";
//            }
//            if (orderId == null) {
//                orderId = "";
//            }
//            if (payDate == null) {
//                payDate = "";
//            }
//            if (reserved1 == null) {
//                reserved1 = "";
//            }
//            if (reserved2 == null) {
//                reserved2 = "";
//            }
//            if (status == null) {
//                status = "";
//            }
//            if (orderDate == null) {
//                orderDate = "";
//            }
//            if (fee == null) {
//                fee = "";
//            }
//            if (hmac == null) {
//                hmac = "";
//            }
//            if (accountDate == null) {
//                accountDate = "";
//            }
//            //组织验签报文
//            String signData = merchantId + payNo + returnCode + message + signType
//                    + type + version + amount + amtItem + bankAbbr + mobile
//                    + orderId + payDate + accountDate + reserved1 + reserved2 + status
//                    + orderDate + fee;
//
//            HiiposmUtil util = new HiiposmUtil();
//            //out.println("验签报文："+signData+"<br/>");
//            String hmac1 = util.MD5Sign(signData, signKey);
//            //out.println("消息摘要（PAGE）："+hmac1+"<br/>");
//            //out.println("传来的摘要："+hmac+"<br/>");
//            //验签
//            boolean sign_flag = util.MD5Verify(signData, hmac, signKey);
//            if (sign_flag) {
//                //验签成功,商户的业务逻辑处理...
//                //......
//                //处理成功，向手机支付平台发送接收到后台通知成功的信息；请执行如下：（注：请不要在out.println其他的信息）
//                /*OrderVO vo = orderService.getOrderByNO(orderId);
//                OrderVO orderVO = updateOrder(vo.getOrderNo(), String.valueOf(new Double(amount).doubleValue() / 100), payNo, "0");*/
//                OrderPaymentUtil.orderPayment(orderId, String.valueOf(new Double(amount).doubleValue() / 100), payNo, "0");
//                response.getWriter().print("SUCCESS");
//            } else {
//                System.out.println("验签失败！");
//            }
//
//        } catch (Exception e) {
//            System.out.println("交易异常:" + e.getMessage());//
//        }
//        return null;
//    }
//
//}
