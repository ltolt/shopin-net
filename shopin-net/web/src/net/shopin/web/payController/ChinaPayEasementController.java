package net.shopin.web.payController;

import chinapay.PrivateKey;
import chinapay.SecureLink;
import net.shopin.view.OrderVO;
import net.shopin.web.conf.ChinapayConf;
import net.shopin.web.util.OrderUtil;
import net.shopin.web.util.SystemConstants;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-3-9
 * Time: 17:33:56
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class ChinaPayEasementController {
    @Autowired
    ChinapayConf chinapayConf;

    /**
     * 去银联支付
     */
    @RequestMapping(value = "/toChinaPayEasement.html", method = {RequestMethod.GET, RequestMethod.POST})
    public String toPay(Model m, HttpServletRequest request) {
    	OrderVO ordersVO = OrderUtil.getOrderByNO(request.getParameter("orderNo"),false);
        //校验订单状态,是否已经付款,缺少
        if (!"1".equals(ordersVO.getOrderStatus())) {
            return "redirect:" + SystemConstants.SSO_URL + "/myshopin/vieworders.html?orderNo=" + ordersVO.getOrderNo() + "&status=view";
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String date = sdf.format(new Date());
        Double d = ordersVO.getNeedSaleMoneySum().doubleValue()* 100;
        String tran = d.longValue() + "";
        String trans = tran;
        if (tran.length() < 12) {
            for (int i = 0; i < 12 - tran.length(); i++) {
                trans = "0" + trans;
            }
        }
        String shopin=ordersVO.getOrderNo();
        PrivateKey key = new PrivateKey();
        Boolean flag = key.buildKey(chinapayConf.getChinaPayMerId(), 0, chinapayConf.getChinaPayPrivetKey());
        SecureLink sl = new SecureLink(key);
        String signMsg = chinapayConf.getChinaPayMerId() + "00" + ordersVO.getOrderNo() + trans + chinapayConf.getChinaPayCuryId() + date + chinapayConf.getChinaPayTransType() + shopin;
        String code = sl.Sign(signMsg);

        m.addAttribute("toUrl", chinapayConf.getChinaPayToUrl());
        m.addAttribute("MerId", chinapayConf.getChinaPayMerId());
        m.addAttribute("OrdId", "00" + ordersVO.getOrderNo());
        m.addAttribute("TransAmt", trans);
        m.addAttribute("CuryId", chinapayConf.getChinaPayCuryId());
        m.addAttribute("TransDate", date);
        m.addAttribute("TransType", chinapayConf.getChinaPayTransType());
        m.addAttribute("Version", chinapayConf.getChinaPayVersion());
        m.addAttribute("BgRetUrl", chinapayConf.getChinaBgRetUrl());
        m.addAttribute("PageRetUrl", chinapayConf.getChinaPageRetUrl());
        m.addAttribute("Priv1", shopin);
        m.addAttribute("ChkValue", code);
        //modify by Jack for 银联网管编码修改 at 2011-12-25 begin
        //m.addAttribute("GateId", "8604");
        m.addAttribute("GateId", "8607");
        //modify by Jack for 银联网管编码修改 at 2011-12-25 end
        return "pay/toChinaPay";
    }
}