package net.shopin.web.payController;

import net.shopin.api.IOrderService;
import net.shopin.view.OrderVO;
import net.shopin.web.conf.*;
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
public class IcbcNewController {
    @Autowired
    IOrderService orderService;
    @Autowired
    IcbcConf icbcConf;

    /**
     * 去工商银行支付
     */
    @RequestMapping(value = "/toIcbcPays.html", method = {RequestMethod.GET, RequestMethod.POST})
    public String toPay(Model m, HttpServletRequest request) {
        OrderVO ordersVO = orderService.getOrder(request.getParameter("sid"));

        String times=request.getParameter("time");
        //校验订单状态,是否已经付款,缺少
//        if (!"1".equals(ordersVO.getOrderStatus())) {
//            return "redirect:/myshopin/order/" + ordersVO.getOrderId() + ".html";
//        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
//        ordersVO.setSaleTime(sdf.format(new Date()));
        ordersVO.setSaleTime(times);
        String money="1";
        ordersVO.setSaleTotalSum(money);
        IcbcPayWayVO payway = new IcbcPayWayVO();
        IcbcVO icbcVO = payway.setIcbcVO(ordersVO, icbcConf);
        m.addAttribute("toUrl", "https://mybank3.dccnet.com.cn/servlet/ICBCINBSEBusinessServlet");
//        m.addAttribute("toUrl", "https://mybank.icbc.com.cn/servlet/ICBCINBSEBusinessServlet");
        m.addAttribute("interfaceName", icbcConf.getInterfaceName());
        m.addAttribute("interfaceVersion", icbcConf.getInterfaceVersion());
        m.addAttribute("tranData", icbcVO.getTranData());
        m.addAttribute("merSignMsg", icbcVO.getMerSignMsg());
        m.addAttribute("merCert", icbcVO.getMerCert());
//        m.addAttribute("sid", request.getParameter("sid"));
//        Double money = Double.parseDouble(ordersVO.getSaleMoneySum()) + Double.parseDouble(ordersVO.getSendCost());
//        m.addAttribute("money", money);
        return "pay/toIcbcPay";
    }
}