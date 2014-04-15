package net.shopin.web.payController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.view.OrderVO;
import net.shopin.view.WebProductVO;
import net.shopin.web.conf.BankConf;
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

import cmb.netpayment.Security;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2010-3-9
 * Time: 17:33:56
 * To change this template use File | Settings | File Templates.
 */
@Controller
public class CmbVerifyController {
    @Autowired
    BankConf bankConf;

    protected final Logger logger = LoggerFactory.getLogger(getClass());

    /**
     * 银行方式支付成功回调
     */
    @RequestMapping(value = "/cmbVerify", method = {RequestMethod.GET, RequestMethod.POST})
    public String bankNotify(Model m, HttpServletRequest request, HttpServletResponse response) {
        String returnPage = "pay/payFail";
        String orderNo = request.getParameter("MerchantPara");     //银行签名数据
        String succeed = request.getParameter("Succeed");
        String billNo = request.getParameter("BillNo");
        String amount = request.getParameter("Amount");
        String msg = request.getParameter("Msg");
        String baSig = request.getQueryString();
        try {
            if (succeed.equals("Y")) {
                Security pay = new Security(bankConf.getCmbPublicKey());
                //modify by guanshiqiang for orderService项目迁移 at 2013-04-25 begin
                //OrderVO ordersVO = orderService.getOrderByNO(orderNo);
                //OrderVO ordersVO = OrderUtil.getOrderByNO(orderNo);
                //modify by guanshiqiang for orderService项目迁移 at 2013-04-25 end
                //Double money = Double.parseDouble(ordersVO.getSaleTotalSum());
                //modify by guanshiqiang for orderService项目迁移 at 2013-04-25 begin
                //Double money = Double.valueOf(orderService.getOrdeWaitPaySum(ordersVO.getOrderId()));
                Double money = Double.valueOf(OrderUtil.getOrderWaitPaySum(orderNo));
                //modify by guanshiqiang for orderService项目迁移 at 2013-04-25 end
                String bankNo=msg.substring(18,msg.length());
                boolean bRet = pay.checkInfoFromBank(baSig.getBytes());
                logger.info("------cmbVerify------money=" + money.toString() + "--amount" + Double.valueOf(amount).toString() + "---bRet=" + bRet);
                //if (money.toString().equals(Double.valueOf(amount).toString()) && bRet == true) {
                //由于orderService.getOrdeWaitPaySum问题需要隐藏 关世强需要增加相应的获取应付额方法
                if (bRet == true) {
                    /* OrderVO orderVO = updateOrder(orderNo, amount, bankNo, "0");*/
                    logger.info("------cmbVerify------verify success");
                    OrderPaymentUtil.orderPayment(orderNo, amount, bankNo, "0");
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
                    logger.info("------cmbVerify------verify faliure");
                }
            } else {
                returnPage = "pay/payFail";
                logger.info("------cmbVerify------succeed not Y");
            }
        } catch (Exception e) {
            returnPage = "pay/payFail";
            e.printStackTrace();
            logger.info("------cmbVerify------Exception");
        }
        return returnPage;
    }

}