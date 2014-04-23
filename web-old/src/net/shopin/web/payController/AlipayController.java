package net.shopin.web.payController;

import net.shopin.api.*;
import net.shopin.view.OrderVO;
import net.shopin.web.conf.AlipayVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.conf.PayWayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-3-9
 * Time: 17:33:56
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class AlipayController {
    @Autowired
    IOrderService orderService;
    @Autowired
    BankConf bankConf;

    /**
     * 跳转到支付宝支付页面
     */
    @RequestMapping(value = "/toAlipay", method = {RequestMethod.GET, RequestMethod.POST})
    public String toAlipay(Model m, HttpServletRequest request) {
        OrderVO ordersVO = orderService.getOrder(request.getParameter("sid"));
        //校验订单状态,是否已经付款,缺少
        if (!"1".equals(ordersVO.getOrderStatus())) {
            return "redirect:/myshopin/order/" + ordersVO.getOrderId() + ".html";
        }
        String token = getToken(request);
        PayWayVO payway = new PayWayVO();
        AlipayVO alipay = payway.setAlipay(ordersVO, bankConf, token,"2d");
        alipay.setTotal_fee("" + orderService.getOrdeWaitPaySum(ordersVO.getOrderId()));
        String form = buildForm(alipay, token);
        m.addAttribute("form", form);
        return "pay/toAlipay";
    }

    public String getToken(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        String token = null;
        for (int i = 0; i < cookies.length; i++) {

            if (cookies[i].getName().equals("aliToken")) {
                token = cookies[i].getValue();
                break;
            }
        }
        return token;
    }


    public String buildForm(AlipayVO alipay, String token) {
        //待请求参数数组
        Map<String, String> m = new HashMap<String, String>();
        m.put("_input_charset", "utf-8");
        m.put("body", alipay.getBody());
        m.put("out_trade_no", alipay.getOut_trade_no());
        m.put("partner", alipay.getPartner());
        m.put("payment_type", alipay.getPayment_type());
        m.put("seller_email", alipay.getSeller_email());
        m.put("service", alipay.getService());
        m.put("sign", alipay.getSign());
        m.put("total_fee", alipay.getTotal_fee());
        m.put("sign_type", alipay.getSign_type());
        m.put("subject", alipay.getSubject());
        m.put("show_url", alipay.getShow_url());
        m.put("return_url", alipay.getReturn_url());
        m.put("notify_url", alipay.getNotify_url());
        m.put("it_b_pay", "2d");
        if (token != null && !"".equals(token)) {
            m.put("token", token);
        }
        List<String> keys = new ArrayList<String>(m.keySet());

        StringBuffer sbHtml = new StringBuffer();

        sbHtml.append("<form name=\"alipaysubmit\"method=\"post\"action=\"https://www.alipay.com/cooperate/gateway.do?_input_charset=utf-8\">");

        for (int i = 0; i < keys.size(); i++) {
            String name = (String) keys.get(i);
            String value = (String) m.get(name);

            sbHtml.append("<input type=\"hidden\" name=\"" + name + "\" value=\"" + value + "\"/>");
        }
        sbHtml.append("</form>");
        return sbHtml.toString();
    }


}