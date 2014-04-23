package net.shopin.web.payController;

import net.shopin.api.*;
import net.shopin.view.OrderVO;
import net.shopin.view.PaymentParameterVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.conf.BankpayVO;
import net.shopin.web.conf.PayWayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletResponse;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-3-9
 * Time: 17:33:56
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class BankController {
    @Autowired
    IOrderService orderService;
    @Autowired
    BankConf bankConf;

     /**
     * 跳转到首信易银行支付界面
     */
    @RequestMapping(value = "/toBankpay", method = {RequestMethod.GET, RequestMethod.POST})
    public String toBankPay(Model m, PaymentParameterVO vo, HttpServletResponse response) {
        OrderVO ordersVO = orderService.getOrder(vo.getOrderSid());
        //校验订单状态,是否已经付款,缺少
        if (!"1".equals(ordersVO.getOrderStatus())) {
            return "redirect:/myshopin/order/" + ordersVO.getOrderId() + ".html";
        }
        String paynum = ""+orderService.getOrdeWaitPaySum(ordersVO.getOrderId());
        String v_pmode = vo.getV_pmode();
        PayWayVO payway = new PayWayVO();
        BankpayVO bankVO = payway.setBankvo(ordersVO, bankConf, v_pmode, paynum);
        m.addAttribute("v_mid", bankVO.getV_mid());
        m.addAttribute("v_oid", bankVO.getV_oid());
        m.addAttribute("v_rcvname", bankVO.getV_rcvname());
        m.addAttribute("v_rcvaddr", bankVO.getV_rcvaddr());
        m.addAttribute("v_rcvtel", bankVO.getV_rcvtel());
        m.addAttribute("v_rcvpost", bankVO.getV_rcvpost());
        m.addAttribute("v_amount", bankVO.getV_amount());
        m.addAttribute("v_ymd", bankVO.getV_ymd());
        m.addAttribute("v_orderstatus", bankVO.getV_orderstatus());
        m.addAttribute("v_ordername", bankVO.getV_ordername());
        m.addAttribute("v_moneytype", bankVO.getV_moneytype());
        m.addAttribute("v_url", bankVO.getV_url());
        m.addAttribute("v_md5info", bankVO.getV_md5info());
        m.addAttribute("v_pmode", bankVO.getV_pmode());
        return "pay/toCapinfo";
    }
}