package net.shopin.web.payController;

import net.shopin.api.*;
import net.shopin.view.*;
import net.shopin.web.conf.BankConf;
import net.shopin.web.util.ValidateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.text.DecimalFormat;
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
public class AccountController {
    @Autowired
    IOrderService orderService;
    @Autowired
    private ISecurityService securityService;
    @Autowired
    private IMemberAccountService memberAccountService;
    @Autowired
    IPaymentService paymentService;

    @Autowired
    IMemberPointService memberPointService;

//校验登录的id

    private boolean validateUid(String uid) {
        if (!ValidateUtil.validateRequired(uid) || !securityService.isUserLogin(uid)) {
            return false;
        }
        return true;
    }

    /**
     * 得到订单的总金额
     *
     * @param ordervo
     * @return
     */
    private double getOrderAmount(OrderVO ordervo) {
        double money = 0.00;
        for (OrderDetailVO detailvo : ordervo.getOrderDetails()) {
            money += Double.parseDouble(detailvo.getSalePrice()) * Integer.parseInt(detailvo.getSaleSum());
        }
        double freight = ordervo.getSendCost() == null ? 0 : Double.parseDouble(ordervo.getSendCost());
        money += freight;
        return money;
    }

    /**
     * 使用会员账户支付订单,得到会员账户明细记录
     *
     * @param ordervo
     * @return
     */
    private MemAccountRecordVO getOrderAccountPayRecord(OrderVO ordervo, MemberAccountVO account) {
        String uid = ordervo.getMembersSid();
        MemAccountRecordVO record = new MemAccountRecordVO();
        record.setDealTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        record.setDealType("订单占款");
        record.setMembersSid(uid);
        record.setVersion(account.getVersion());
        record.setMoney(new DecimalFormat("0.00").format(getOrderAmount(ordervo)));
        return record;

    }

    /**
     * 使用会员账户支付
     *
     * @param m
     * @param cartId
     * @param uid
     * @param orderId
     * @return
     */
    @RequestMapping(value = "/accountpay", method = RequestMethod.POST)
    public String payOrderByAccount(Model m,
                                    @CookieValue(value = "userTicket", required = false) String uid,
                                    String orderId) {
        if (!validateUid(uid)) {
            m.addAttribute("result", new AjaxMessageVO("0", "支付失败，当前会话已经失效，请刷新页面"));
            return null;
        }
        uid = securityService.getLoginUserId(uid).getMembersSid();
        OrderVO ordervo = orderService.getOrder(orderId);
        if (!uid.equals(ordervo.getMembersSid())) {
            m.addAttribute("result", new AjaxMessageVO("0", "您不能支付该订单"));
            return null;
        }
        if (!"1".equals(ordervo.getOrderStatus())) {
            m.addAttribute("result", new AjaxMessageVO("1", "您不能支付该订单，即将跳转到订单信息页面，请查看"));
            return null;
        }
        MemberAccountVO account = memberAccountService.getAccount(uid);
        MemAccountRecordVO record = getOrderAccountPayRecord(ordervo, account);
        if (account.getBalance() == null ||
                Double.parseDouble(account.getBalance()) < Double.parseDouble(record.getMoney())) {
            m.addAttribute("result", new AjaxMessageVO("0", "使用会员账户支付失败，账户余额不足"));
            return null;
        }
        if (!memberAccountService.accountConsume(record)) {
            m.addAttribute("result", new AjaxMessageVO("0", "使用会员账户支付失败"));
            return null;
        }
//        orderService.orderPayment(ordervo.getOrderNo(), ordervo.getPaymentModeSid());
        Double orderMoney = Double.parseDouble(ordervo.getSaleMoneySum()) + Double.parseDouble(ordervo.getSendCost());

        updateOrder(ordervo.getOrderNo(),orderMoney+"");
        String message = "支付成功，账户扣除金额" + ordervo.getSaleTotalSum() + "元，余额" + account.getBalance() + "元";
        m.addAttribute("result", new AjaxMessageVO("1", message));
        return null;
    }

    private void updateOrder(String orderNO, String totalFee) {
        OrderVO orderVO = orderService.getOrderByNO(orderNO);
        OrdersPayVO mopvo = new OrdersPayVO();
        mopvo.setOrderSid(orderVO.getOrderId());
        mopvo.setPayType(orderVO.getPaymentModeSid());
        mopvo.setPayMoney(totalFee);
        paymentService.savePaymentRecord(mopvo);

        MemPointRecordVO recordVO = new MemPointRecordVO();
        recordVO.setMembersSid(orderVO.getMembersSid());
        Double point = Math.rint(Double.parseDouble(totalFee));
        recordVO.setExpPoints(point.intValue() + "");
        recordVO.setExpType("购买商品");
        recordVO.setMemo("购买商品赠送积分" + totalFee);
        memberPointService.pointCharge(recordVO);

        Double paySum = paymentService.getPaymentRecordSum(orderVO.getOrderId());
        Double payYet = Double.parseDouble(totalFee);
        Double orderMoney = Double.parseDouble(orderVO.getSaleMoneySum()) + Double.parseDouble(orderVO.getSendCost());

        if ((paySum + payYet) >= (orderMoney)) {
            orderService.orderPayment(orderVO.getOrderNo(), orderVO.getPaymentModeSid());
        }
    }

}
