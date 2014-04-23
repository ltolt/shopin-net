package net.shopin.web.conf;

import cn.com.infosec.icbc.ReturnValue;
import com.shopin.modules.utils.Md5;
import net.shopin.view.OrderDetailVO;
import net.shopin.view.OrderVO;

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
public class IcbcPayWayVO {
    private IcbcVO icbcVO;    //工商银行支付
    private String orderNumber;// 订单号码
    private Double paymentalready;  //已经支付的货款
    public Double getPaymentalready() {
        return paymentalready;
    }

    public void setPaymentalready(Double paymentalready) {
        this.paymentalready = paymentalready;
    }

    public IcbcVO setIcbcVO(OrderVO orderVO, IcbcConf bankConf) {
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
                "<interfaceName>" + bankConf.getInterfaceName() + "</interfaceName>" +
                "<interfaceVersion>" + bankConf.getInterfaceVersion() + "</interfaceVersion>" +
                "<orderInfo>" +
                "<orderDate>" + orderVO.getSaleTime() + "</orderDate>" +
                "<curType>" + bankConf.getCurType() + "</curType> " +
                "<merID>" + bankConf.getMerID() + "</merID>" +
                "<subOrderInfoList>" +
                "<subOrderInfo>" +
                "<orderid>" + orderVO.getOrderNo() + "</orderid>" +
                "<amount>" + orderVO.getSaleTotalSum() + "</amount>" +
                "<installmentTimes>" + bankConf.getInstallmentTimes() + "</installmentTimes>" +
                "<merAcct>" + bankConf.getMerAcct() + "</merAcct>" +
                "<goodsID>" + "001" + "</goodsID>" +
                "<goodsName>test</goodsName>" +
                "<goodsNum>" + orderVO.getOrderDetails().get(0).getSaleSum() + "</goodsNum>" +
                "<carriageAmt>" + orderVO.getSaleTotalSum() + "</carriageAmt>" +
                "</subOrderInfo>" +
                "</subOrderInfoList>" +
                "</orderInfo>" +
                "<custom>" +
                "<verifyJoinFlag>" + bankConf.getVerifyJoinFlag() + "</verifyJoinFlag>" +
                "<Language>" + bankConf.getLanguage() + "</Language>" +
                "</custom>" +
                "<message>" +
                "<creditType>" + bankConf.getCreditType() + "</creditType>" +
                "<notifyType>" + bankConf.getNotifyType() + "</notifyType>" +
                "<resultType>" + bankConf.getResultType() + "</resultType>" +
                "<merReference></merReference>"+
                "<merCustomIp>" + bankConf.getMerCustomIp() + "</merCustomIp>" +
                "<goodsType></goodsType>" +
                "<merCustomID></merCustomID>" +
                "<merCustomPhone></merCustomPhone>" +
                "<goodsAddress></goodsAddress>" +
                "<merOrderRemark></merOrderRemark>" +
                "<merHint>" + merHint + "</merHint>" +
                "<remark1>" + remark1 + "</remark1>" +
                "<remark2>" + remark2 + "</remark2>" +
                "<merURL>" + bankConf.getIcbcVerifyURL() + "</merURL>" +
                "<merVAR>" + merVAR + "</merVAR>" +
                "</message>" +
                "</B2CReq>";
//        String tranDataXml="<?xml version=\"1.0\" encoding=\"GBK\" standalone=\"no\"?>" +
//                "<B2CReq>" +
//                "<interfaceName>ICBC_PERBANK_B2C</interfaceName>" +
//                "<interfaceVersion>1.0.0.11</interfaceVersion>" +
//                "<orderInfo>" +
//                "<orderDate>20110513160029</orderDate>" +
//                "<curType>001</curType>" +
//                "<merID>0200EC23734696</merID>" +
//                "<subOrderInfoList>" +
//                "<subOrderInfo>" +
//                "<orderid>201003081416290</orderid>" +
//                "<amount>1</amount>" +
//                "<installmentTimes>1</installmentTimes>" +
//                "<merAcct>0200026009018372212</merAcct>" +
//                "<goodsID>001</goodsID>" +
//                "<goodsName>test</goodsName>" +
//                "<goodsNum>2</goodsNum>" +
//                "<carriageAmt>20</carriageAmt>" +
//                "</subOrderInfo>" +
//                "<subOrderInfo>" +
//                "<orderid>201003081416291</orderid>" +
//                "<amount>1</amount>" +
//                "<installmentTimes>1</installmentTimes>" +
//                "<merAcct>0200004519000100173</merAcct>" +
//                "<goodsID>001</goodsID>" +
//                "<goodsName>test</goodsName>" +
//                "<goodsNum>2</goodsNum>" +
//                "<carriageAmt>20</carriageAmt>" +
//                "</subOrderInfo>" +
//                "</subOrderInfoList>" +
//                "</orderInfo>" +
//                "<custom>" +
//                "<verifyJoinFlag>0</verifyJoinFlag>" +
//                "<Language>ZH_CN</Language>" +
//                "</custom>" +
//                "<message>" +
//                "<creditType>2</creditType>" +
//                "<notifyType>AG</notifyType>" +
//                "<resultType>1</resultType>" +
//                "<merReference></merReference>"+
//                "<merCustomIp>1.202.151.124</merCustomIp>" +
//                "<goodsType>1</goodsType>" +
//                "<merCustomID>123456</merCustomID>" +
//                "<merCustomPhone>13466780886</merCustomPhone>" +
//                "<goodsAddress>test</goodsAddress>" +
//                "<merOrderRemark>test</merOrderRemark>" +
//                "<merHint>test</merHint>" +
//                "<remark1></remark1>" +
//                "<remark2></remark2>" +
//                "<merURL>http://1.202.151.124/EbizSimulate/emulator/Newb2c_Pay_Mer.jsp</merURL>" +
//                "<merVAR>test</merVAR>" +
//                "</message>" +
//                "</B2CReq>";
        //交易数据
        String tranData = "";
        //订单签名数据
        String merSignMsg = "";
        //商城证书公钥
        String merCert = "";
        try {
            byte[] byteSrc = tranDataXml.getBytes();
            char[] keyPass = bankConf.getKeyPassword().toCharArray();

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

    public String getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }

}
