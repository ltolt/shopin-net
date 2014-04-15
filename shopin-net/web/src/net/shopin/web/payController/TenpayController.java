package net.shopin.web.payController;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.view.OrderVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.tenpay.PayRequestHandler;
import net.shopin.web.tenpay.TenpayUtil;
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
 * Date: 2010-9-9
 * Time: 17:33:56
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class TenpayController {

    @Autowired
    BankConf bankConf;

    /**
     * 跳转到财付通支付页面
     */
    @RequestMapping(value = "/toTenpay", method = {RequestMethod.GET, RequestMethod.POST})
    public String toTenpay(Model m, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
    	OrderVO ordersVO = OrderUtil.getOrderByNO(request.getParameter("orderNo"),false);
        //校验订单状态,是否已经付款,缺少
        if (!"1".equals(ordersVO.getOrderStatus())) {
            return "redirect:" + SystemConstants.SSO_URL + "/myshopin/vieworders.html?orderNo=" + ordersVO.getOrderNo() + "&status=view";
        }
        //banktype=1 表示微信支付
        String bankType = request.getParameter("bankType");
        
        //创建PayRequestHandler实例
        PayRequestHandler reqHandler = new PayRequestHandler(request, response);
        //设置密钥
        reqHandler.setKey(bankConf.getTenpayKey());
        //初始化
        reqHandler.init();
        //设置支付参数
        String currTime = TenpayUtil.getCurrTime();
        //8位日期
        String strDate = currTime.substring(0, 8);
        //6位时间
        String strTime = currTime.substring(8, currTime.length());
        //四位随机数
        String strRandom = TenpayUtil.buildRandom(4) + "";

        //财付通交易单号，规则为：10位商户号+8位时间（YYYYmmdd)+10位流水号
        double totle = ordersVO.getNeedSaleMoneySum().doubleValue() * 100;
        String transactionId = bankConf.getTenpayAccount() + strDate + strTime + strRandom;

        reqHandler.setParameter("bargainor_id", bankConf.getTenpayAccount());  //商户号
        reqHandler.setParameter("sp_billno", ordersVO.getOrderNo());         //商家订单号
        reqHandler.setParameter("transaction_id", transactionId);    //财付通交易单号
        reqHandler.setParameter("return_url", bankConf.getTenpayVerifyURL());  //支付通知url
        reqHandler.setParameter("desc", ordersVO.getOrderNo()); //商品名称
        reqHandler.setParameter("total_fee", (int) Math.ceil(totle) + "");   //商品金额,以分为单位
        reqHandler.setParameter("attach", ordersVO.getOrderNo());  //商品金额,以分为单位
        if(bankType!= null && !"".equals(bankType)){
        	//微信支付传参
        	reqHandler.setParameter("bank_type", "WX");
        	reqHandler.setParameter("spbill_create_ip", request.getRemoteAddr());
        }
        //        reqHandler.setParameter("spbill_create_ip", "124.108.45.108");      //商品金额,以分为单位

        //用户ip,测试环境时不要加这个ip参数，正式环境再加此参数
//        reqHandler.setParameter("spbill_create_ip", request.getRemoteAddr());

        //获取请求带参数的url
        String requestUrl = reqHandler.getRequestURL();

        return "redirect:" + requestUrl;
    }
}