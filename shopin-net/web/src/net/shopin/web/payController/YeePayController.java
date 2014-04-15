package net.shopin.web.payController;

import javax.servlet.http.HttpServletRequest;

import net.shopin.view.OrderVO;
import net.shopin.web.conf.YeePayConf;
import net.shopin.web.conf.yeePayConf.DigestUtil;
import net.shopin.web.util.OrderUtil;
import net.shopin.web.util.SystemConstants;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-3-9
 * Time: 17:33:56
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class YeePayController {
    @Autowired
    YeePayConf yeePayConf;

    /**
     * 去银联支付
     */
    @RequestMapping(value = "/toYeePay.html", method = {RequestMethod.GET, RequestMethod.POST})
    public String toPay(Model m, HttpServletRequest request) {
    	OrderVO ordersVO = OrderUtil.getOrderByNO(request.getParameter("orderNo"),false);
        //校验订单状态,是否已经付款,缺少
        if (!"1".equals(ordersVO.getOrderStatus())) {
            return "redirect:" + SystemConstants.SSO_URL + "/myshopin/vieworders.html?orderNo=" + ordersVO.getOrderNo() + "&status=view";
        }
        String keyValue = yeePayConf.getKeyValue();   // 商家密钥
        String nodeAuthorizationURL = yeePayConf.getNodeAuthorizationURL();  // 交易请求地址
        String p0Cmd = yeePayConf.getP0Cmd();     // 在线支付请求，固定值 ”Buy”
        String p1MerId = yeePayConf.getP1MerId();  // 商户编号
        String p2Order =ordersVO.getOrderNo();              // 商户订单号
        //String p3Amt = ordersVO.getSaleTotalSum();           // 支付金额
        String p3Amt = ordersVO.getNeedSaleMoneySum().toString();
        String p4Cur = yeePayConf.getP4Cur();      // 交易币种
        String p5Pid = ordersVO.getOrderId();      // 商品名称
        String p6Pcat ="";      // 商品种类
        String p7Pdesc = "";        // 商品描述
        String p8Url = yeePayConf.getP8Url();      // 商户接收支付成功数据的地址
        String p9SAF = yeePayConf.getP9SAF();       // 需要填写送货信息 0：不需要  1:需要
        String paMP = "";   // 商户扩展信息
        String pdFrpId = yeePayConf.getPdFrpId(); // 支付通道编码
        // 银行编号必须大写
        pdFrpId = pdFrpId.toUpperCase();
        String prNeedResponse = "1";    // 默认为"1"，需要应答机制
        // 获得MD5-HMAC签名
        String hmac = getReqMd5HmacForOnlinePayment(p0Cmd,
                p1MerId, p2Order, p3Amt, p4Cur, p5Pid, p6Pcat, p7Pdesc,
                p8Url, p9SAF, paMP, pdFrpId, prNeedResponse, keyValue);

        m.addAttribute("keyValue", keyValue);
        m.addAttribute("nodeAuthorizationURL", nodeAuthorizationURL);
        m.addAttribute("paMP", paMP);
        m.addAttribute("pdFrpId", pdFrpId);
        m.addAttribute("hmac", hmac);
        m.addAttribute("prNeedResponse", prNeedResponse);

        m.addAttribute("p0Cmd", p0Cmd);
        m.addAttribute("p1MerId", p1MerId);
        m.addAttribute("p2Order", p2Order);
        m.addAttribute("p3Amt", p3Amt);
        m.addAttribute("p4Cur", p4Cur);
        m.addAttribute("p5Pid", p5Pid);
        m.addAttribute("p6Pcat", p6Pcat);
        m.addAttribute("p7Pdesc", p7Pdesc);
        m.addAttribute("p8Url", p8Url);
        m.addAttribute("p9SAF", p9SAF);

        return "pay/toYeePay";
    }

    public String getReqMd5HmacForOnlinePayment(String p0_Cmd,String p1_MerId,
			String p2_Order, String p3_Amt, String p4_Cur,String p5_Pid, String p6_Pcat,
			String p7_Pdesc,String p8_Url, String p9_SAF,String pa_MP,String pd_FrpId,
			String pr_NeedResponse,String keyValue) {
		  StringBuffer sValue = new StringBuffer();
		// 业务类型
		sValue.append(p0_Cmd);
		// 商户编号
		sValue.append(p1_MerId);
		// 商户订单号
		sValue.append(p2_Order);
		// 支付金额
		sValue.append(p3_Amt);
		// 交易币种
		sValue.append(p4_Cur);
		// 商品名称
		sValue.append(p5_Pid);
		// 商品种类
		sValue.append(p6_Pcat);
		// 商品描述
		sValue.append(p7_Pdesc);
		// 商户接收支付成功数据的地址
		sValue.append(p8_Url);
		// 送货地址
		sValue.append(p9_SAF);
		// 商户扩展信息
		sValue.append(pa_MP);
		// 银行编码
		sValue.append(pd_FrpId);
		// 应答机制
		sValue.append(pr_NeedResponse);

		String sNewString = null;

		sNewString = DigestUtil.hmacSign(sValue.toString(), keyValue);
		return (sNewString);
	}
    
}