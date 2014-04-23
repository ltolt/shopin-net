package net.shopin.web.payController;

import net.shopin.api.IOrderService;
import net.shopin.view.OrderVO;
import net.shopin.web.conf.AlipayKJPayment;
import net.shopin.web.conf.AlipayVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.conf.PayWayVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: kongming
 * Date: 12-7-21
 * Time: 上午11:13
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class AlipayKJController {

    @Autowired
    IOrderService orderService;

    @Autowired
    BankConf bankConf;

    /**
     * 跳转到支付宝快捷支付页面
     */

    @RequestMapping(value = "/toAlipaykj",method = {RequestMethod.GET,RequestMethod.POST})
    public  String  toAlipayKJ(Model m,HttpServletRequest request){
        OrderVO ordervo = orderService.getOrder(request.getParameter("sid"));
        //校验订单状态
        if(!"1".equals(ordervo.getOrderStatus())){
            return "redirect:/myshopin/order/" +  ordervo.getOrderId() + ".html";
        }
        String token = getToken(request);
        PayWayVO payway = new PayWayVO();

        AlipayVO alipayVO = payway.setAlipayKJ(ordervo,bankConf,token,"2d");
       
        alipayVO.setTotal_fee("" + orderService.getOrdeWaitPaySum(ordervo.getOrderId()));
      
        String form = buildKJForm(alipayVO,token);
        m.addAttribute("form",form);
        return "pay/toAlipayKJ";

    }

    private String buildKJForm(AlipayVO alipayVO, String token) {
         //待请求参数数组
        Map<String,String> m = new HashMap<String,String>();
        m.put("paymethod", alipayVO.getPaymethod());
        m.put("_input_charset", alipayVO.getInput_charset());
        m.put("body", alipayVO.getBody());
        m.put("out_trade_no", alipayVO.getOut_trade_no());
        m.put("partner", alipayVO.getPartner());
        m.put("payment_type", alipayVO.getPayment_type());
        m.put("seller_email", alipayVO.getSeller_email());
        m.put("service", alipayVO.getService());
        m.put("sign", alipayVO.getSign());
        m.put("total_fee", alipayVO.getTotal_fee());
        m.put("sign_type", alipayVO.getSign_type());
        m.put("subject", alipayVO.getSubject());
        m.put("show_url", alipayVO.getShow_url());
        m.put("return_url", alipayVO.getReturn_url());
        m.put("notify_url", alipayVO.getNotify_url());
        m.put("default_login","Y");
        m.put("defaultbank",alipayVO.getDefaultbank());

        m = AlipayKJPayment.paraFilter(m);
        m.put("sign",alipayVO.getSign());
    
        m.put("sign_type",alipayVO.getSign_type());
        List<String> keys = new ArrayList<String>(m.keySet());
        StringBuffer sbHtml = new StringBuffer();
        sbHtml.append("<form id=\"alipaysubmit\" name=\"alipaysubmit\" action=\"" + alipayVO.getPaygateway()
                              + "_input_charset=" + "UTF-8"
                              + "\" method=\"get\">");
        for(int i = 0;i<keys.size();i++){
            String name = (String)keys.get(i);
            String value = (String)m.get(name);

          sbHtml.append("<input type=\"hidden\" name=\"" + name + "\" value=\"" + value + "\"/>");
          }
        sbHtml.append("</form>");
  
        return sbHtml.toString();
    }

    private String getToken(HttpServletRequest request) {
        Cookie[]  cookies = request.getCookies();
        String token = null;
        for(int i = 0;i<cookies.length;i++){
            if(cookies[i].getName().equals("aliToken")){
                token = cookies[i].getValue();
                break;
            }

        }

        return token;
    }


}
