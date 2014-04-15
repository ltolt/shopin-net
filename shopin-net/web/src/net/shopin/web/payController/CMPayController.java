//package net.shopin.web.payController;
//
//import com.hisun.iposm.HiiposmUtil;
//import net.shopin.api.IOrderService;
//import net.shopin.view.OrderVO;
//import net.shopin.web.conf.*;
//import net.shopin.web.util.OrderUtil;
//
//import org.apache.commons.beanutils.BeanUtils;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.ui.Model;
//
//import javax.servlet.http.Cookie;
//import javax.servlet.http.HttpServletRequest;
//import java.io.IOException;
//import java.io.UnsupportedEncodingException;
//import java.lang.reflect.Field;
//import java.net.URLDecoder;
//import java.util.*;
//
//
//@Controller
//public class CMPayController {
//
//    @Autowired
//    BankConf bankConf;
//
//    /**
//     * 跳转到手机支付支付页面
//     */
//    @RequestMapping(value = "/toCMPay", method = {RequestMethod.GET, RequestMethod.POST})
//    public String toCMPay(Model model, HttpServletRequest request) {
//        try {
//        	//modify by guanshiqiang for orderService项目迁移 at 2013-04-25 begin
//            //OrderVO ordervo = orderService.getOrder(request.getParameter("sid"));
//        	OrderVO ordervo = OrderUtil.getOrderByNO(request.getParameter("orderNo"));
//            //modify by guanshiqiang for orderService项目迁移 at 2013-04-25 end
//            //校验订单状态
//            if (!"1".equals(ordervo.getOrderStatus())) {
//                return "redirect:/myshopin/order/" + ordervo.getOrderNo() + ".html";
//            }
//
//            CMPayVO cmPayVO = new CMPayVO();
//            cmPayVO.setPaygateway(bankConf.getCmpayPaygateway());
//            cmPayVO.setCharacterSet(bankConf.getCmpayCharacterSet());
//            cmPayVO.setCallbackUrl(bankConf.getCmpayCallbackUrl());
//            cmPayVO.setNotifyUrl(bankConf.getCmpayNotifyUrl());
//
//            String clientIp = request.getHeader("x-forwarded-for");
//            if ((clientIp == null) || (clientIp.length() == 0)
//                    || ("unknown".equalsIgnoreCase(clientIp))) {
//                clientIp = request.getHeader("Proxy-Client-IP");
//            }
//            if ((clientIp == null) || (clientIp.length() == 0)
//                    || ("unknown".equalsIgnoreCase(clientIp))) {
//                clientIp = request.getHeader("WL-Proxy-Client-IP");
//            }
//            if ((clientIp == null) || (clientIp.length() == 0)
//                    || ("unknown".equalsIgnoreCase(clientIp))) {
//                clientIp = request.getRemoteAddr();
//            }
//            cmPayVO.setIpAddress(clientIp);
//            cmPayVO.setMerchantId(bankConf.getCmpayMerchantId());
//            cmPayVO.setSignKey(bankConf.getCmpaySignKey());
//            cmPayVO.setRequestId(String.valueOf(System.currentTimeMillis()));
//            cmPayVO.setSignType(bankConf.getCmpaySignType());
//            cmPayVO.setVersion(bankConf.getCmpayVersion());
//            String type = "DirectPayConfirm";//双向确认
//            if (ordervo.getPaymentModeSid().equals("20")) {
//                type = "DirectPayConfirm"; //双向确认
//            } else if (ordervo.getPaymentModeSid().equals("21") || ordervo.getPaymentModeSid().equals("22")
//                    || ordervo.getPaymentModeSid().equals("23") || ordervo.getPaymentModeSid().equals("24")) {
//                type = "GWDirectPay";//网银网关
//            }
//            cmPayVO.setType(type);
//            //modify by guanshiqiang for orderService项目迁移 at 2013-04-25 begin
//            //cmPayVO.setAmount(Double.valueOf(orderService.getOrdeWaitPaySum(ordervo.getOrderId()) * 100).longValue() + "");
//            cmPayVO.setAmount(Double.valueOf(OrderUtil.getOrderWaitPaySum(ordervo.getOrderId()) * 100).longValue() + "");
//            //modify by guanshiqiang for orderService项目迁移 at 2013-04-25 end
//            cmPayVO.setMerchantAbbr("www.shopin.net");
//            if (ordervo.getPaymentModeSid().equals("20")) {
//                cmPayVO.setBankAbbr("");
//                cmPayVO.setMerchantAbbr("上品折扣");
//            }else if (ordervo.getPaymentModeSid().equals("21")) {//手机支付建设银行
//                cmPayVO.setBankAbbr("CCB");
//            }else if (ordervo.getPaymentModeSid().equals("22")) {//手机支付中国银行
//                cmPayVO.setBankAbbr("BOC");
//            }else if (ordervo.getPaymentModeSid().equals("23")) {//手机支付农业银行
//                cmPayVO.setBankAbbr("ABC");
//            }else if (ordervo.getPaymentModeSid().equals("24")) {//手机支付交通银行
//                cmPayVO.setBankAbbr("BCOM");
//            }
//            cmPayVO.setCurrency("00");
//            cmPayVO.setOrderDate(ordervo.getSaleTime().substring(0, 8));//order SaleTime pattern yyyyMMddHHmmss
//            cmPayVO.setOrderId(ordervo.getOrderNo());
//            cmPayVO.setMerAcDate(ordervo.getSaleTime().substring(0, 8));
//            cmPayVO.setPeriod("999");
//            cmPayVO.setPeriodUnit("03");//单位 月
//            cmPayVO.setProductName(ordervo.getOrderNo());
//            cmPayVO.setCouponsFlag("00");//使用全部营销工具(默讣)
//            return buildCMPayForm(cmPayVO, model, request);
//        } catch (Exception e) {
//            return "pay/payFail";
//        }
//
//    }
//
//    private String buildCMPayForm(CMPayVO cmPayVO, Model model, HttpServletRequest request) {
//        //采用反射将cmPayVO所有null值属性设置为空字符串
//        try {
//            Class classCMPayVO = CMPayVO.class;
//            Field[] fields = classCMPayVO.getDeclaredFields();
//            for (Field field : fields) {
//                String value = BeanUtils.getProperty(cmPayVO, field.getName());
//                if (value == null) {
//                    BeanUtils.setProperty(cmPayVO, field.getName(), "");
//                }
//            }
//        } catch (Exception e) {
//            throw new RuntimeException("服务端异常");
//        }
//
//        String signData = cmPayVO.getCharacterSet() + cmPayVO.getCallbackUrl() + cmPayVO.getNotifyUrl()
//                + cmPayVO.getIpAddress() + cmPayVO.getMerchantId() + cmPayVO.getRequestId() + cmPayVO.getSignType() + cmPayVO.getType()
//                + cmPayVO.getVersion() + cmPayVO.getAmount() + cmPayVO.getBankAbbr() + cmPayVO.getCurrency() + cmPayVO.getOrderDate()
//                + cmPayVO.getOrderId() + cmPayVO.getMerAcDate() + cmPayVO.getPeriod() + cmPayVO.getPeriodUnit() + cmPayVO.getMerchantAbbr()
//                + cmPayVO.getProductDesc() + cmPayVO.getProductId() + cmPayVO.getProductName() + cmPayVO.getProductNum()
//                + cmPayVO.getReserved1() + cmPayVO.getReserved2() + cmPayVO.getUserToken() + cmPayVO.getShowUrl() + cmPayVO.getCouponsFlag();
//        HiiposmUtil util = new HiiposmUtil();
//        String hmac = util.MD5Sign(signData, cmPayVO.getSignKey());
//        if (cmPayVO.getType().equalsIgnoreCase("GWDirectPay")) {
//            //待请求参数数组
//            Map<String, String> m = new LinkedHashMap<String, String>();
//            m.put("characterSet", cmPayVO.getCharacterSet());
//            m.put("callbackUrl", cmPayVO.getCallbackUrl());
//            m.put("notifyUrl", cmPayVO.getNotifyUrl());
//            m.put("ipAddress", cmPayVO.getIpAddress());
//            m.put("merchantId", cmPayVO.getMerchantId());
//            m.put("requestId", cmPayVO.getRequestId());
//            m.put("signType", cmPayVO.getSignType());
//            m.put("type", cmPayVO.getType());
//            m.put("version", cmPayVO.getVersion());
//            m.put("hmac", hmac);
//            m.put("amount", cmPayVO.getAmount());
//            m.put("bankAbbr", cmPayVO.getBankAbbr());
//            m.put("currency", cmPayVO.getCurrency());
//            m.put("orderDate", cmPayVO.getOrderDate());
//            m.put("orderId", cmPayVO.getOrderId());
//            m.put("merAcDate", cmPayVO.getMerAcDate());
//            m.put("period", cmPayVO.getPeriod());
//            m.put("periodUnit", cmPayVO.getPeriodUnit());
//            m.put("merchantAbbr", cmPayVO.getMerchantAbbr());
//            m.put("productDesc", cmPayVO.getProductDesc());
//            m.put("productId", cmPayVO.getProductId());
//            m.put("productName", cmPayVO.getProductName());
//            m.put("productNum", cmPayVO.getProductNum());
//            m.put("reserved1", cmPayVO.getReserved1());
//            m.put("reserved2", cmPayVO.getReserved2());
//            m.put("userToken", cmPayVO.getUserToken());
//            m.put("showUrl", cmPayVO.getShowUrl());
//            m.put("couponsFlag", cmPayVO.getCouponsFlag());
//            List<String> keys = new ArrayList<String>(m.keySet());
//            StringBuffer sbHtml = new StringBuffer();
//            sbHtml.append("<form id=\"cmpaysubmit\" name=\"cmpaysubmit\" action=\"" + cmPayVO.getPaygateway()
//                    + "\" method=\"get\">");
//            for (int i = 0; i < keys.size(); i++) {
//                String name = (String) keys.get(i);
//                String value = (String) m.get(name);
//
//                sbHtml.append("<input type=\"hidden\" name=\"" + name + "\" value=\"" + value + "\"/>");
//            }
//            sbHtml.append("</form>");
//            model.addAttribute("form", sbHtml.toString());
//            return "pay/toCMPay";
//        } else if (cmPayVO.getType().equalsIgnoreCase("DirectPayConfirm")) {
//            //-- 请求报文
//            String buf = "characterSet=" + cmPayVO.getCharacterSet() + "&callbackUrl="
//                    + cmPayVO.getCallbackUrl() + "&notifyUrl=" + cmPayVO.getNotifyUrl()
//                    + "&ipAddress=" + cmPayVO.getIpAddress() + "&merchantId="
//                    + cmPayVO.getMerchantId() + "&requestId=" + cmPayVO.getRequestId() + "&signType="
//                    + cmPayVO.getSignType() + "&type=" + cmPayVO.getType() + "&version=" + cmPayVO.getVersion()
//                    + "&amount=" + cmPayVO.getAmount() + "&bankAbbr=" + cmPayVO.getBankAbbr()
//                    + "&currency=" + cmPayVO.getCurrency() + "&orderDate=" + cmPayVO.getOrderDate()
//                    + "&orderId=" + cmPayVO.getOrderId() + "&merAcDate=" + cmPayVO.getMerAcDate()
//                    + "&period=" + cmPayVO.getPeriod() + "&periodUnit=" + cmPayVO.getPeriodUnit()
//                    + "&merchantAbbr=" + cmPayVO.getMerchantAbbr() + "&productDesc="
//                    + cmPayVO.getProductDesc() + "&productId=" + cmPayVO.getProductId()
//                    + "&productName=" + cmPayVO.getProductName() + "&productNum="
//                    + cmPayVO.getProductNum() + "" + "&reserved1=" + cmPayVO.getReserved1()
//                    + "&reserved2=" + cmPayVO.getReserved2() + "&userToken=" + cmPayVO.getUserToken()
//                    + "&showUrl=" + cmPayVO.getShowUrl() + "&couponsFlag=" + cmPayVO.getCouponsFlag();
//            //-- 带上消息摘要
//            buf = "hmac=" + hmac + "&" + buf;
//
//            //发起http请求，并获取响应报文
//            String res = null;
//            try {
//                res = util.sendAndRecv(cmPayVO.getPaygateway(), buf, cmPayVO.getCharacterSet());
//            } catch (IOException e) {
//                throw new RuntimeException("支付失败");
//            }
//            //获得手机支付平台的消息摘要，用于验签,
//            String hmac1 = util.getValue(res, "hmac");
//            String vfsign = null;
//            try {
//                vfsign = util.getValue(res, "merchantId")
//                        + util.getValue(res, "requestId")
//                        + util.getValue(res, "signType")
//                        + util.getValue(res, "type")
//                        + util.getValue(res, "version")
//                        + util.getValue(res, "returnCode")
//                        + URLDecoder.decode(util.getValue(res, "message"),
//                        "UTF-8") + util.getValue(res, "payUrl");
//            } catch (UnsupportedEncodingException e) {
//                throw new RuntimeException("支付失败");
//            }
//            //响应码
//            String code = util.getValue(res, "returnCode");
//            //下单交易成功
//            if (!code.equals("000000")) {
//                throw new RuntimeException("支付失败");
//            } else {
//                // -- 验证签名
//                boolean flag = false;
//                flag = util.MD5Verify(vfsign, hmac1, cmPayVO.getSignKey());
//                if (!flag) {
//                    throw new RuntimeException("支付失败,验签失败");
//                } else {
//                    String payUrl = util.getValue(res, "payUrl");
//                    String submit_url = util.getRedirectUrl(payUrl);
//                    //response.sendRedirect(submit_url);
//                    return "redirect:" + submit_url;
//                }
//            }
//        } else {
//            throw new RuntimeException("支付失败");
//        }
//
//    }
//}
