package net.shopin.web.payController;

import net.shopin.view.OrderVO;
import net.shopin.web.conf.AlipayVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.conf.PayWayVO;
import net.shopin.web.util.OrderUtil;
import net.shopin.web.util.SystemConstants;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2011-2-12
 * Time: 16:00:26
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class AliIcbcPayController {
    @Autowired
    BankConf bankConf;

    @RequestMapping(value = "/toIcbcBank", method = {RequestMethod.GET, RequestMethod.POST})
    public String toBank(Model m, HttpServletRequest request) {
    	OrderVO ordersVO = OrderUtil.getOrderByNO(request.getParameter("orderNo"),false);
        //校验订单状态,是否已经付款,缺少
        if (!"1".equals(ordersVO.getOrderStatus())) {
            return "redirect:" + SystemConstants.SSO_URL + "/myshopin/vieworders.html?orderNo=" + ordersVO.getOrderNo() + "&status=view";
        }
        String payBank = "ICBCB2C";
        PayWayVO payway = new PayWayVO();
        AlipayVO alipay = payway.getAlipayBank(ordersVO, bankConf, payBank);
        alipay.setTotal_fee("" + ordersVO.getNeedSaleMoneySum());
        m.addAttribute("url", alipay.getSign());
        return "pay/toBank";
    }
}
