package net.shopin.web.payController;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import net.shopin.view.OrderVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.util.OrderUtil;
import net.shopin.web.util.SystemConstants;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cmb.MerchantCode;

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
    BankConf bankConf;

    /**
     * 去工商银行支付
     */
    @RequestMapping(value = "/toCmbPay.html", method = {RequestMethod.GET, RequestMethod.POST})
    public String toPay(Model m, HttpServletRequest request) {
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        OrderVO ordersVO = OrderUtil.getOrderByNO(request.getParameter("orderNo"),false);
        //校验订单状态,是否已经付款,缺少
        if (!"1".equals(ordersVO.getOrderStatus())) {
            return "redirect:" + SystemConstants.SSO_URL + "/myshopin/vieworders.html?orderNo=" + ordersVO.getOrderNo() + "&status=view";
        }
        ordersVO.setSaleTime(sdf.format(new Date()));
        String orderDate=sdf1.format(new Date());
        String billno=ordersVO.getOrderNo().substring(4,ordersVO.getOrderNo().length());
        String merchantPara=ordersVO.getOrderNo();
        String merchantCode = MerchantCode.genMerchantCode(this.bankConf.getCmbShopinKey(), orderDate, this.bankConf.getCmbBranchID(), this.bankConf.getCmbCoNo(), billno, ordersVO.getNeedSaleMoneySum().toString(), merchantPara, this.bankConf.getCmbVerifyURL(), "", "");
        m.addAttribute("date", orderDate);
	    m.addAttribute("cono", this.bankConf.getCmbCoNo());
	    m.addAttribute("branchid", this.bankConf.getCmbBranchID());
        m.addAttribute("billno", billno);
        m.addAttribute("merchantPara", merchantPara);
    	m.addAttribute("merchantUrl", this.bankConf.getCmbVerifyURL());
    	m.addAttribute("amount", ordersVO.getNeedSaleMoneySum().toString());
        m.addAttribute("merchantCode", merchantCode.trim());

        return "pay/toCmbPay";
    }
}
