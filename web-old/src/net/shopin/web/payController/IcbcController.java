package net.shopin.web.payController;

import net.shopin.api.*;
import net.shopin.view.OrderVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.conf.IcbcVO;
import net.shopin.web.conf.PayWayVO;
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
public class IcbcController {
    @Autowired
    IOrderService orderService;
    @Autowired
    BankConf bankConf;

    /**
     * 去工商银行支付
     */
    @RequestMapping(value = "/toIcbcPay.html", method = {RequestMethod.GET, RequestMethod.POST})
    public String toPay(Model m, HttpServletRequest request) {
        OrderVO ordersVO = orderService.getOrder(request.getParameter("sid"));
        //校验订单状态,是否已经付款,缺少
        if (!"1".equals(ordersVO.getOrderStatus())) {
            return "redirect:/myshopin/order/" + ordersVO.getOrderId() + ".html";
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        ordersVO.setSaleTime(sdf.format(new Date()));
        PayWayVO payway = new PayWayVO();
        IcbcVO icbcVO = payway.setIcbcVO(ordersVO, bankConf);
        m.addAttribute("toUrl", "https://mybank.icbc.com.cn/servlet/ICBCINBSEBusinessServlet");
        m.addAttribute("interfaceName", icbcVO.getInterfaceName());
        m.addAttribute("interfaceVersion", icbcVO.getInterfaceVersion());
        m.addAttribute("tranData", icbcVO.getTranData());
        m.addAttribute("merSignMsg", icbcVO.getMerSignMsg());
        m.addAttribute("merCert", icbcVO.getMerCert());
        m.addAttribute("sid", request.getParameter("sid"));
        Double money = Double.parseDouble(ordersVO.getSaleMoneySum()) + Double.parseDouble(ordersVO.getSendCost());
        m.addAttribute("money", money);
        return "pay/toIcbcPay";
    }
}