package net.shopin.web.payController;

import cmb.MerchantCode;
import net.shopin.api.IOrderService;
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
public class CmbController {
    @Autowired
    IOrderService orderService;
    @Autowired
    BankConf bankConf;

    /**
     * 去工商银行支付
     */
    @RequestMapping(value = "/toCmbPay.html", method = {RequestMethod.GET, RequestMethod.POST})
    public String toPay(Model m, HttpServletRequest request) {
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        OrderVO ordersVO = orderService.getOrder(request.getParameter("sid"));
        //校验订单状态,是否已经付款,缺少
//        if (!"1".equals(ordersVO.getOrderStatus())) {
//            return "redirect:/myshopin/order/" + ordersVO.getOrderId() + ".html";
//        }
        ordersVO.setSaleTime(sdf.format(new Date()));
        String orderDate=sdf1.format(new Date());
        String billno=ordersVO.getOrderNo().substring(4,ordersVO.getOrderNo().length());
        String merchantPara=ordersVO.getOrderNo();
        //Double money = Double.parseDouble(ordersVO.getSaleTotalSum());
        Double money=0.01D;
        ordersVO.setSaleTotalSum(money.toString());
        MerchantCode mc = new MerchantCode();
        String merchantCode = mc.genMerchantCode(bankConf.getCmbShopinKey(),orderDate,bankConf.getCmbBranchID(),bankConf.getCmbCoNo(),billno,ordersVO.getSaleTotalSum(),merchantPara,bankConf.getCmbVerifyURL(),"","","","","");
//        String merchantCode = mc.genMerchantCode("1a2b3c4dA5SHopin",orderDate,"0010","006872",billno,money.toString(),merchantPara,"http://1.202.151.98/web/cmbVerify.html","","","","","");
        m.addAttribute("date", orderDate);
        m.addAttribute("cono", bankConf.getCmbCoNo());
        m.addAttribute("branchid", bankConf.getCmbBranchID());
        m.addAttribute("billno", billno);
        m.addAttribute("merchantPara", merchantPara);
        m.addAttribute("merchantUrl", bankConf.getCmbVerifyURL());
        m.addAttribute("amount", ordersVO.getSaleTotalSum());
        m.addAttribute("merchantCode", merchantCode.trim());

        System.out.println("交易时间："+orderDate);
        System.out.println("订单号："+billno);
        System.out.println("金额："+money);
        System.out.println("卡号：");
        return "pay/toCmbPay";
    }
}