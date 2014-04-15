package net.shopin.web.payController;

import net.shopin.view.OrderVO;
import net.shopin.view.WebProductVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.conf.CheckURL;
import net.shopin.web.conf.SignatureHelper_return;
import net.shopin.web.util.OrderPaymentUtil;
import net.shopin.web.util.OrderUtil;
import net.shopin.web.util.PreUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by IntelliJ IDEA.
 * User: kongming
 * Date: 12-7-25
 * Time: 上午12:52
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class AlipayKJVerifyController {

    @Autowired
    BankConf bankConf;

    protected final Logger log = LoggerFactory.getLogger(getClass());


    @RequestMapping(value = "/alipayCreditVerify", method = {RequestMethod.GET, RequestMethod.POST})
    public String alipayVerify(Model m, HttpServletRequest request) {
        String returnPage = "";
        String partner = bankConf.getAlipayKJPartner();
        String privateKey = bankConf.getAlipayKJKey();
        String sign = request.getParameter("sign");

        Map params = new HashMap();
        //获得POST过来的参数
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter
                .hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            try {
                params.put(name, new String(valueStr.getBytes("ISO-8859-1"), "UTF-8"));
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }


        }
        String mysign = SignatureHelper_return.sign(params, privateKey);
        String orderNO = params.get("out_trade_no").toString();
        String totalFee = params.get("total_fee").toString();
        String tradeNo = params.get("trade_no").toString();
        //打印，收到消息比对sign的计算结果和传递来的sign是否匹配
        //modify by guanshiqiang for orderService项目迁移 at 2013-04-25 begin
        //OrderVO vo = orderService.getOrderByNO(orderNO);
        //OrderVO vo = OrderUtil.getOrderByNO(orderNO);
        //modify by guanshiqiang for orderService项目迁移 at 2013-04-25 end
        //if(!vo.getSaleTotalSum().equals(totalFee)){

        //由于orderService.getOrdeWaitPaySum问题需要隐藏 关世强需要增加相应的获取应付额方法
        /*if (!Double.valueOf(orderService.getOrdeWaitPaySum(vo.getOrderId())).toString().equals(Double.valueOf(totalFee).toString())) {
            returnPage = "pay/payFail";
            return returnPage;
        }*/
        if (mysign.equals(sign)) {


            /*OrderVO orderVO = updateOrder(orderNO, totalFee, tradeNo, "0");*/

            OrderPaymentUtil.orderPayment(orderNO, totalFee, tradeNo, "0");
            //modify by guanshiqiang for orderService项目迁移 at 2013-04-25 begin
            //OrderVO orderVO = orderService.getOrderByNO(vo.getOrderNo());//OrderVO orderVO = vo;
            OrderVO orderVO = OrderUtil.getOrderByNO(orderNO, true);
            //modify by guanshiqiang for orderService项目迁移 at 2013-04-25 end
            //获取商品推荐列表
            List<WebProductVO> webProductVOList = OrderUtil.getTJProducts();
            m.addAttribute("webProductVOList", webProductVOList);
            m.addAttribute("order", orderVO);

            returnPage = "pay/paySucess";
            returnPage = PreUtil.getReturnPage(m, request, orderVO, returnPage,
                    (orderVO.getBookFlag() != null && orderVO.getBookFlag().trim().length() > 0) ? Integer.valueOf(orderVO.getBookFlag()) : -1
            );
        } else {
            returnPage = "pay/payFail";
        }
        return returnPage;
    }

    /**
     * 支付宝notify_url方式支付成功回调
     */
    @RequestMapping(value = "/alipayCreditNotify", method = {RequestMethod.GET, RequestMethod.POST})
    public String alipayNotify(Model m, HttpServletRequest request, HttpServletResponse response) {

        String partner = bankConf.getAlipayKJPartner();
        String privateKey = bankConf.getAlipayKJKey();
        //如果您服务器不支持https交互，可以使用http的验证查询地址
        //String alipayNotifyURL = "https://www.alipay.com/cooperate/gateway.do?service=notify_verify"
        String alipayNotifyURL = "https://mapi.alipay.com/gateway.do?service=notify_verify&partner=" + partner + "&notify_id=" + request.getParameter("notify_id");
        String sign = request.getParameter("sign");
        //获取支付宝ATN返回结果，true是正确的订单信息，false 是无效的
        String responseTxt = CheckURL.check(alipayNotifyURL);
        Map params = new HashMap();
        //获得POST 过来参数设置到新的params中
        Map requestParams = request.getParameterMap();
        for (Iterator iter = requestParams.keySet().iterator(); iter
                .hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            try {
                params.put(name, new String(valueStr.getBytes("ISO-8859-1"), "UTF-8"));

            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        String mysign = SignatureHelper_return.sign(params, privateKey);
        String orderNO = params.get("out_trade_no").toString();
        String totalFee = params.get("total_fee").toString();
        String discount = params.get("discount").toString();
        String tradeNo = params.get("trade_no").toString();
        totalFee = "" + new BigDecimal(totalFee).subtract(new BigDecimal(discount));
        //打印，收到消息比对sign的计算结果和传递来的sign是否匹配
        if (mysign.equals(sign) && responseTxt.equals("true")) {
            if ("TRADE_SUCCESS".equals(request.getParameter("trade_status")) || "TRADE_FINISHED".equals(request.getParameter("trade_status"))) {

                //updateOrder(orderNO, totalFee, tradeNo, discount);
                OrderPaymentUtil.orderPayment(orderNO, totalFee, tradeNo, discount);

                try {
                    response.getWriter().print("success");
                } catch (IOException e1) {
                    System.out.println("11111111111111111111");
                }
            } else {
                try {
                    response.getWriter().print("fail");
                } catch (IOException e1) {
                    System.out.println("11111111111111111111");
                }
            }
        } else {
            log.warn("确认付款异常：mysign=" + mysign + "&sign=" + sign + "&orderNO=" + orderNO + "&totalFee=" + totalFee + "&discount=" + discount + "&tradeNo=" + tradeNo);
            try {
                response.getWriter().print("fail");
            } catch (IOException e1) {
                System.out.println("11111111111111111111");
            }
        }
        return null;
    }

}
