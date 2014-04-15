package net.shopin.web.conf;

import cn.com.infosec.icbc.ReturnValue;
import com.shopin.modules.utils.Md5;
import net.shopin.view.OrderDetailVO;
import net.shopin.view.OrderVO;
import net.shopin.web.conf.BankConf;

import java.io.FileInputStream;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: user
 * Date: 2009-2-3
 * Time: 17:23:56
 * To change this template use File | Settings | File Templates.
 */
public class PayWayVO {
    private BankpayVO bankvo;//首信易支付
    private AlipayVO alipayReq; // 支付宝请求参数
    private IcbcVO icbcVO;    //工商银行支付
//    private CardVo card;//我的购物卡

    private String orderNumber;// 订单号码
    private Double paymentalready;  //已经支付的货款

    public Double getPaymentalready() {
        return paymentalready;
    }

    public void setPaymentalready(Double paymentalready) {
        this.paymentalready = paymentalready;
    }

    public BankpayVO setBankvo(OrderVO orderVO, BankConf bankConf, String v_pmode, String paynum) {

        BankpayVO bankpayVO = new BankpayVO();
        Md5 md5 = new Md5("");
        Date currTime = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMddhhMMss");
        String md5Info = "0" + sdf.format(currTime) + paynum + orderVO.getOrderId() + sdf.format(currTime)
                + "-" + bankConf.getV_mid() + "-" + orderVO.getOrderNo() + "-" + sdf1.format(currTime) + bankConf.getV_mid() + bankConf.getBankVerifyURL();
        try {
            md5.hmac_Md5(md5Info, bankConf.getV_password());
            bankpayVO.setV_amount(paynum);
            bankpayVO.setV_md5info(md5.getStringDigest());
            bankpayVO.setV_mid(bankConf.getV_mid());
            bankpayVO.setV_moneytype("0");
            bankpayVO.setV_oid(sdf.format(currTime) + "-" + bankConf.getV_mid() + "-" + orderVO.getOrderNo() + "-" + sdf1.format(currTime));
            bankpayVO.setV_ordername(orderVO.getSaleName());
            bankpayVO.setV_orderstatus("0");
            bankpayVO.setV_pmode(v_pmode);
            bankpayVO.setV_rcvaddr(orderVO.getInceptPostcode());
            bankpayVO.setV_rcvname(orderVO.getOrderId());
            bankpayVO.setV_rcvpost(orderVO.getInceptPostcode());
            bankpayVO.setV_rcvtel(orderVO.getPaymentPhone());
            bankpayVO.setV_url(bankConf.getBankVerifyURL());
            bankpayVO.setV_ymd(sdf.format(currTime));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return bankpayVO;
    }
    
    public AlipayVO setAlipayKJ(OrderVO orderVO,BankConf bankConf,String token,String itpay){
       AlipayVO alipayKJ = new AlipayVO();

        try{
         alipayKJ.setSign_type(bankConf.getAlipayKJSignType());
         alipayKJ.setPaygateway(bankConf.getAlipayKJGateWay());
          alipayKJ.setPaymethod(orderVO.getPaymentModeSid().equals("26")?"":orderVO.getPaymentModeSid().equals("18") ? "peerpay" : orderVO.getPaymentModeSid().equals("17") ? "expressGatewayCredit" : "expressGatewayDebit");
         alipayKJ.setService(bankConf.getAlipayKJService());
         alipayKJ.setPartner(bankConf.getAlipayKJPartner());
         alipayKJ.setBody(orderVO.getOrderNo());//填写在跳到支付宝页面上显示的付款内容信息
         alipayKJ.setOut_trade_no(orderVO.getOrderNo());
         alipayKJ.setSubject(orderVO.getOrderNo());//填写在跳到支付宝
         alipayKJ.setPayment_type(bankConf.getAlipayKJPaymentType());
         alipayKJ.setSeller_email(bankConf.getAlipayKJSellerEmail());
         alipayKJ.setKey(bankConf.getAlipayKJKey());
       // alipayKJ.setPrice(orderVO.getSaleMoneySum());
        // alipayKJ.setLogistics_fee(orderVO.getSendCost());
         alipayKJ.setReturn_url(orderVO.getPaymentModeSid().equals("26")?"http://www.shopin.net/gotoalipay.html":bankConf.getAlipayKJReturnURL());
         alipayKJ.setNotify_url(bankConf.getAlipayKJNotifyURL());
         alipayKJ.setTotal_fee("" + (Double.parseDouble(orderVO.getSaleMoneySum()) + Double.parseDouble(orderVO.getSendCost())));
         alipayKJ.setShow_url("/myshopin/order/" + orderVO.getOrderId() + ".html");
//            String ItemUrl = Payment.CreateUrl(alipay.getPaygateway(), alipay.getService(), alipay.getSign_type(), alipay.getOut_trade_no(), alipay.getInput_charset(), alipay.getPartner(), alipay.getKey(),alipay.getShow_url(),alipay.getBody(),alipay.getTotal_fee(),alipay.getPayment_type(), alipay.getSeller_email(),  alipay.getSubject(),   alipay.getNotify_url(), alipay.getReturn_url(), alipay.getPaymethod(),bank);
       alipayKJ.setDefaultbank(orderVO.getDefaultBank());
       if("26".equals(orderVO.getPaymentModeSid())){
    	   alipayKJ.setQr_pay_mode("0");
       }
       String sign = AlipayKJPayment.createURL(alipayKJ.getPaygateway(), alipayKJ.getService(), alipayKJ.getSign_type(), alipayKJ.getOut_trade_no(), alipayKJ.getInput_charset(), alipayKJ.getPartner(), alipayKJ.getKey(), alipayKJ.getShow_url(), alipayKJ.getBody(),
                alipayKJ.getTotal_fee(), alipayKJ.getPayment_type(), alipayKJ.getSeller_email(), alipayKJ.getSubject(), alipayKJ.getNotify_url(), alipayKJ.getReturn_url(),
                alipayKJ.getPaymethod(),orderVO.getDefaultBank(),"Y",alipayKJ.getQr_pay_mode());
        //System.out.println(sign + "-----------------------------------------------");
        //创建sign
        alipayKJ.setSign(sign);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return alipayKJ;

    }

    public AlipayVO setAlipay(OrderVO orderVO, BankConf bankConf,String token,String itpay) {

        AlipayVO alipay = new AlipayVO();

        try {
            /** 注意参数顺序 **/
            alipay.setBody(orderVO.getOrderNo());//填写在跳到支付宝页面上显示的付款内容信息
            alipay.setOut_trade_no(orderVO.getOrderNo());
            alipay.setSubject(orderVO.getOrderNo());//填写在跳到支付宝页面上显示的付款标题信息
            alipay.setPrice(orderVO.getSaleMoneySum());//商品金额信息
            alipay.setLogistics_fee(orderVO.getSendCost());
            alipay.setReturn_url(bankConf.getTaobaoVerifyURL());
            alipay.setNotify_url(bankConf.getTaobaoNotifyURL());
            alipay.setTotal_fee("" + (Double.parseDouble(orderVO.getSaleMoneySum()) + Double.parseDouble(orderVO.getSendCost())));
            alipay.setShow_url("/myshopin/order/" + orderVO.getOrderId() + ".html");
//            String ItemUrl = Payment.CreateUrl(alipay.getPaygateway(), alipay.getService(), alipay.getSign_type(), alipay.getOut_trade_no(), alipay.getInput_charset(), alipay.getPartner(), alipay.getKey(),alipay.getShow_url(),alipay.getBody(),alipay.getTotal_fee(),alipay.getPayment_type(), alipay.getSeller_email(),  alipay.getSubject(),   alipay.getNotify_url(), alipay.getReturn_url(), alipay.getPaymethod(),bank);
//            alipay.setDefaultbank(bank);
            alipay.setToken(token);
            String ItemUrl = Payment.CreateUrl(alipay.getPaygateway(), alipay.getService(), alipay.getSign_type(), alipay.getOut_trade_no(), alipay.getInput_charset(), bankConf.getPartner(), bankConf.getKey(), bankConf.getSellerEmail(), alipay.getBody(), alipay.getSubject(), alipay.getShow_url(), alipay.getPayment_type(), bankConf.getTaobaoVerifyURL(), bankConf.getTaobaoNotifyURL(), alipay.getTotal_fee(),token,itpay);
            alipay.setSign(ItemUrl);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return alipay;
    }
    public AlipayVO getAlipayBank(OrderVO orderVO, BankConf bankConf,String bank) {

        AlipayVO alipay = new AlipayVO();

        try {
            /** 注意参数顺序 **/
            alipay.setBody(orderVO.getOrderNo());//填写在跳到支付宝页面上显示的付款内容信息
            alipay.setOut_trade_no(orderVO.getOrderNo());
            alipay.setSubject(orderVO.getOrderNo());//填写在跳到支付宝页面上显示的付款标题信息
            alipay.setPrice(orderVO.getSaleMoneySum());//商品金额信息
            alipay.setLogistics_fee(orderVO.getSendCost());
            alipay.setReturn_url(bankConf.getTaobaoVerifyURL());
            alipay.setNotify_url(bankConf.getTaobaoNotifyURL());
            alipay.setTotal_fee("" + (Double.parseDouble(orderVO.getSaleMoneySum()) + Double.parseDouble(orderVO.getSendCost())));
            alipay.setShow_url("/myshopin/order/" + orderVO.getOrderId() + ".html");
            String ItemUrl = Payment.CreateUrl(alipay.getPaygateway(), alipay.getService(), alipay.getSign_type(), alipay.getOut_trade_no(), alipay.getInput_charset(), alipay.getPartner(), alipay.getKey(),alipay.getShow_url(),alipay.getBody(),alipay.getTotal_fee(),alipay.getPayment_type(), alipay.getSeller_email(),  alipay.getSubject(),   alipay.getNotify_url(), alipay.getReturn_url(), alipay.getPaymethod(),bank);
            alipay.setDefaultbank(bank);
//            String ItemUrl = Payment.CreateUrl(alipay.getPaygateway(), alipay.getService(), alipay.getSign_type(), alipay.getOut_trade_no(), alipay.getInput_charset(), alipay.getPartner(), alipay.getKey(), alipay.getSeller_email(), alipay.getBody(), alipay.getSubject(), alipay.getShow_url(), alipay.getPayment_type(), alipay.getReturn_url(), alipay.getNotify_url(), alipay.getTotal_fee(),alipay.getPaymethod(),bank);
            alipay.setSign(ItemUrl);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return alipay;
    }

    public IcbcVO setIcbcVO(OrderVO orderVO, BankConf bankConf) {
        IcbcVO vo = new IcbcVO();
        //以下是Goods Information
        OrderDetailVO pro = new OrderDetailVO();
        if (orderVO.getOrderDetails().size() > 0) {
            pro = orderVO.getOrderDetails().get(0);
        }
        DecimalFormat df1 = new DecimalFormat("0.00");

        String goodsID = pro.getProDetailSid();
        String goodsName = pro.getProName();
        String goodsNum = pro.getSaleSum();
        String carriageAmt = orderVO.getSaleMoneySum();//已含运费金额
        String merHint = "www.shopin.net"; //商城提示
        String remark1 = "kg";   //单位
        String remark2 = "kg";   //单位
        String merVAR = "test";
        String tranDataXml = "<?xml version=\"1.0\" encoding=\"GBK\" standalone=\"no\"?>" +
                "<B2CReq>" +
                "<interfaceName>" + vo.getInterfaceName() + "</interfaceName>" +
                "<interfaceVersion>" + vo.getInterfaceVersion() + "</interfaceVersion>" +
                "<orderInfo>" +
                "<orderDate>" + orderVO.getSaleTime() + "</orderDate>" +
                "<orderid>" + orderVO.getOrderNo() + "</orderid>" +
                "<amount>" + Integer.parseInt(orderVO.getSaleTotalSum())*100 + "</amount>" +
                "<curType>" + vo.getCurType() + "</curType>" +
                "<merID>" + bankConf.getMerID() + "</merID>" +
                "<merAcct>" + bankConf.getMerAcct() + "</merAcct>" +
                "</orderInfo>" +
                "<custom>" +
                "<verifyJoinFlag>" + vo.getVerifyJoinFlag() + "</verifyJoinFlag>" +
                "<Language>" + vo.getLanguage() + "</Language>" +
                "</custom>" +
                "<message>" +
                "<goodsID>" + orderVO.getOrderId() + "</goodsID>" +
                "<goodsName></goodsName>" +
                "<goodsNum>" + orderVO.getOrderDetails().get(0).getSaleSum() + "</goodsNum>" +
                "<carriageAmt>" + Integer.parseInt(orderVO.getSaleTotalSum())*100 + "</carriageAmt>" +
                "<merHint>" + merHint + "</merHint>" +
                "<remark1>" + remark1 + "</remark1>" +
                "<remark2>" + remark2 + "</remark2>" +
                "<merURL>" + bankConf.getIcbcVerifyURL() + "</merURL>" +
                "<merVAR>" + merVAR + "</merVAR>" +
                "</message>" +
                "</B2CReq>";
        //交易数据
        String tranData = "";
        //订单签名数据
        String merSignMsg = "";
        //商城证书公钥
        String merCert = "";
        try {
            byte[] byteSrc = tranDataXml.getBytes();
            char[] keyPass = bankConf.getKey_password().toCharArray();

            tranData = new String(ReturnValue.base64enc(byteSrc)).toString();

            FileInputStream in1 = new FileInputStream(bankConf.getIcbcPublicFile());
            byte[] bcert = new byte[in1.available()];
            in1.read(bcert);
            in1.close();
            FileInputStream in2 = new FileInputStream(bankConf.getIcbcPrivateKey());
            byte[] bkey = new byte[in2.available()];
            in2.read(bkey);
            in2.close();

            byte[] sign = ReturnValue.sign(byteSrc, byteSrc.length, bkey, keyPass);
            if (sign == null) {
                System.out.println("签名失败,签名返回为空。请检查证书私钥和私钥保护口令是否正确。");
            } else {
//                System.out.println("签名成功");
                byte[] EncSign = ReturnValue.base64enc(sign);
                merSignMsg = new String(EncSign).toString();
            }

            byte[] EncCert = ReturnValue.base64enc(bcert);
            merCert = new String(EncCert).toString();

        } catch (Exception e) {
            e.printStackTrace();
        }
        vo.setTranData(tranData);
        vo.setMerSignMsg(merSignMsg);
        vo.setMerCert(merCert);
        return vo;
    }

    public IcbcVO getIcbcVO() {
        return icbcVO;
    }

    public void setIcbcVO(IcbcVO icbcVO) {
        this.icbcVO = icbcVO;
    }

    public void setBankvo(BankpayVO bankvo) {
        this.bankvo = bankvo;
    }

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

    public AlipayVO getAlipayReq() {
        return alipayReq;
    }

    public void setAlipayReq(AlipayVO alipayReq) {
        this.alipayReq = alipayReq;
    }

}
