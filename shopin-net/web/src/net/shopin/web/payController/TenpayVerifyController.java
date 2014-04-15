package net.shopin.web.payController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.view.OrderVO;
import net.shopin.view.WebProductVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.tenpay.PayResponseHandler;
import net.shopin.web.util.OrderPaymentUtil;
import net.shopin.web.util.OrderUtil;
import net.shopin.web.util.PreUtil;

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
public class TenpayVerifyController {
    @Autowired
    BankConf bankConf;

    /**
     * 财付通return_url方式支付成功回调
     */
    @RequestMapping(value = "/tenpayVerify", method = {RequestMethod.GET, RequestMethod.POST})
    public String alipayVerify(Model m, HttpServletRequest request, HttpServletResponse response) {
        String returnPage = "";
        //创建PayResponseHandler实例
        PayResponseHandler resHandler = new PayResponseHandler(request, response);
        resHandler.setKey(bankConf.getTenpayKey());
        //判断签名
        if (resHandler.isTenpaySign()) {
            //交易单号
            String transaction_id = resHandler.getParameter("transaction_id");
            //金额金额,以分为单位
            String total_fee = resHandler.getParameter("total_fee");
           total_fee=Integer.parseInt(total_fee)/100+"";
//            String total_fee = "500";
            String orderNO = resHandler.getParameter("attach");
//            String orderNO = "20100324000020";
            String tradeNo = resHandler.getParameter("transaction_id");
            //支付结果
            String pay_result = resHandler.getParameter("pay_result");

            if ("0".equals(pay_result)) {

                OrderPaymentUtil.orderPayment(orderNO, total_fee, tradeNo, "0");
                //modify by guanshiqiang for orderService项目迁移 at 2013-04-25 begin
                //OrderVO orderVO = orderService.getOrderByNO(orderNO);
                OrderVO orderVO = OrderUtil.getOrderByNO(orderNO,true);
                //modify by guanshiqiang for orderService项目迁移 at 2013-04-25 end
                //获取商品推荐列表
                List<WebProductVO> webProductVOList = OrderUtil.getTJProducts();
                m.addAttribute("webProductVOList", webProductVOList);
                m.addAttribute("order", orderVO);
                returnPage = "pay/paySucess";
                returnPage = PreUtil.getReturnPage(m, request, orderVO, returnPage,
                        (orderVO.getBookFlag()!=null&&orderVO.getBookFlag().trim().length()>0) ? Integer.valueOf(orderVO.getBookFlag()) : -1
                        );


                //调用doShow, 打印meta值跟js代码,告诉财付通处理成功,并在用户浏览器显示$show页面.
//                resHandler.doShow("http://localhost:8080/tenpay/show.jsp");
            } else {
                //当做不成功处理
                System.out.println("支付失败");
                returnPage = "pay/payFail";
            }
        } else {
            System.out.println("认证签名失败");
            returnPage = "pay/payFail";
            //String debugInfo = resHandler.getDebugInfo();
            //System.out.println("debugInfo:" + debugInfo);
        }
        return returnPage;
    }

}