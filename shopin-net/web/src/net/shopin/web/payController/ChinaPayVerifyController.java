package net.shopin.web.payController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.view.OrderVO;
import net.shopin.view.WebProductVO;
import net.shopin.web.conf.ChinapayConf;
import net.shopin.web.util.OrderPaymentUtil;
import net.shopin.web.util.OrderUtil;
import net.shopin.web.util.PreUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import chinapay.PrivateKey;
import chinapay.SecureLink;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-3-9
 * Time: 17:33:56
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class ChinaPayVerifyController {
    @Autowired
    ChinapayConf chinapayConf;


    /**
     * 银行方式支付成功回调
     */
    @RequestMapping(value = "/chinaPayVerify", method = {RequestMethod.GET, RequestMethod.POST})
    public String bankNotify(Model m, HttpServletRequest request, HttpServletResponse response) {
        String returnPage = "pay/payFail";
        String priv1 = request.getParameter("Priv1");     //银行签名数据
        String status = request.getParameter("status");
        String checkvalue = request.getParameter("checkvalue");
        String amount = request.getParameter("amount");
        String merid = request.getParameter("merid");
        String orderno = request.getParameter("orderno");
        String transdate = request.getParameter("transdate");
        String currencycode = request.getParameter("currencycode");
        String transtype = request.getParameter("transtype");
        String orderNo = orderno.substring(2, orderno.length());     //银行签名数据

        try {
            if (status.equals("1001")) {
            	//modify by guanshiqiang for orderService项目迁移 at 2013-04-25 begin
                //OrderVO ordersVO = orderService.getOrderByNO(orderNo);
            	//OrderVO ordersVO = OrderUtil.getOrderByNO(orderNo);
                //modify by guanshiqiang for orderService项目迁移 at 2013-04-25 end
                //Double money = Double.parseDouble(ordersVO.getSaleTotalSum())*100;
            	//modify by guanshiqiang for orderService项目迁移 at 2013-04-25 begin
                //Double money = Double.valueOf(orderService.getOrdeWaitPaySum(ordersVO.getOrderId()))*100;
            	Double money = Double.valueOf(OrderUtil.getOrderWaitPaySum(orderNo)) * 100;
                //modify by guanshiqiang for orderService项目迁移 at 2013-04-25 end
                PrivateKey key = new PrivateKey();
                Boolean flag = key.buildKey("999999999999999", 0, chinapayConf.getChinaPayPublicKey());
                SecureLink sl = new SecureLink(key);
                Boolean bRet = sl.verifyTransResponse(merid, orderno, amount, currencycode, transdate, transtype, status, checkvalue);
                String tran = money.longValue() + "";
                String trans = tran;
                if (tran.length() < 12) {
                    for (int i = 0; i < 12 - tran.length(); i++) {
                        trans = "0" + trans;
                    }
                }

                //由于orderService.getOrdeWaitPaySum问题需要隐藏 关世强需要增加相应的获取应付额方法
                //if (trans.equals(amount) && bRet == true) {
                if (bRet == true) {
                    /*OrderVO orderVO = updateOrder(orderNo, amount, orderno, "0");*/

                    OrderPaymentUtil.orderPayment(orderNo, amount, orderno, "0");
                    //modify by guanshiqiang for orderService项目迁移 at 2013-04-25 begin
                    //OrderVO orderVO = orderService.getOrderByNO(ordersVO.getOrderNo());//OrderVO orderVO = ordersVO;
                    OrderVO orderVO = OrderUtil.getOrderByNO(orderNo,true);
                    //modify by guanshiqiang for orderService项目迁移 at 2013-04-25 end
                    //获取商品推荐列表
                    List<WebProductVO> webProductVOList = OrderUtil.getTJProducts();
                    m.addAttribute("webProductVOList", webProductVOList);
                    m.addAttribute("order", orderVO);
                    returnPage = "pay/paySucess";
                    returnPage = PreUtil.getReturnPage(m, request, orderVO, returnPage,
                            (orderVO.getBookFlag()!=null&&orderVO.getBookFlag().trim().length()>0) ? Integer.valueOf(orderVO.getBookFlag()) : -1
                            );
                } else {
                    returnPage = "pay/payFail";
                }
            } else {
                returnPage = "pay/payFail";
            }
        } catch (Exception e) {
            returnPage = "pay/payFail";
            e.printStackTrace();
        }
        return returnPage;
    }

}