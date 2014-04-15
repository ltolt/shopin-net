package net.shopin.web.conf;

import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: lqw
 * Date: 2009-2-13
 * Time: 10:52:14
 * To change this template use File | Settings | File Templates.
 */
//支付宝请求参数
public class AlipayVO {

	
    Date Now_Date = new Date();
    String paygateway = "https://www.alipay.com/cooperate/gateway.do?";    //'支付接口
    String service = "create_direct_pay_by_user";//	create_direct_pay_by_user
    String sign_type = "MD5";
    String out_trade_no = "" + Now_Date.getTime();    //商户网站订单
    String input_charset = "utf-8";
    String partner = "2088002692486430"; //支付宝合作伙伴id (账户内提取)
    String key = "7e8zsuhffm3f8gdaolfexxdjau6d5mjz"; //支付宝安全校验码(账户内提取)
    String seller_email = "shangpinlvyansha@sina.com";         //卖家支付宝帐户

    //以上是账户信息，以下是商品信息
    String body = "商品描述"; //商品描述，推荐格式：商品名称（订单编号：订单编号）
    String subject = "商品名称";             //商品名称
    String price = "0.01";                 //订单总价
    String quantity = "1";
    String show_url = "www.shopin.net";
    String payment_type = "1";
    String discount = "0";
    String total_fee = "0";

    // 物流信息和支付宝通知，一般商城不需要通知，请删除此参数，并且在payment.java里面相应删除参数
    String logistics_type = "EXPRESS";
    String logistics_fee = "5.00";
    String logistics_payment = "BUYER_PAY";
    String notify_url = "http://www.shopin.net/alipayNotify.html";    //通知接收URL
    String return_url = "";    //支付完成后跳转返回的网址URL
    String sign = "";

    String credit_card_pay = "Y";
    String credit_card_default_display = "Y";
    String defaultbank;
    String paymethod = "bankPay";
    String token = "";
    String itpay = "2d";
    /**
     * 扫码支付 add by kongm 20131125 
     */
    String qr_pay_mode;
    
    
    

    public String getQr_pay_mode() {
		return qr_pay_mode;
	}

	public void setQr_pay_mode(String qr_pay_mode) {
		this.qr_pay_mode = qr_pay_mode;
	}

	public String getCredit_card_pay() {
        return credit_card_pay;
    }

    public void setCredit_card_pay(String credit_card_pay) {
        this.credit_card_pay = credit_card_pay;
    }

    public String getCredit_card_default_display() {
        return credit_card_default_display;
    }

    public void setCredit_card_default_display(String credit_card_default_display) {
        this.credit_card_default_display = credit_card_default_display;
    }

    public String getDefaultbank() {
        return defaultbank;
    }

    public void setDefaultbank(String defaultbank) {
        this.defaultbank = defaultbank;
    }

    public String getPaymethod() {
        return paymethod;
    }

    public void setPaymethod(String paymethod) {
        this.paymethod = paymethod;
    }

    public String getSign() {
         if ((this.paymethod.equalsIgnoreCase("expressGatewayCredit")) || (this.paymethod.equalsIgnoreCase("expressGatewayDebit")) || (this.paymethod.equalsIgnoreCase("peerpay")) ){
           // System.out.println("a;lii-----------------------------------------------");
            return AlipayKJPayment.createURL(paygateway, service, sign_type,
                        out_trade_no, input_charset, partner, key, show_url, body,
                        total_fee, payment_type, seller_email, subject, notify_url,
                        return_url, paymethod, defaultbank, "Y",qr_pay_mode);
        }else{
        	//扫码支付sign生成 add by kongm 
        	if("0".equals(qr_pay_mode)){
        		return AlipayKJPayment.createURLQ(paygateway, service, sign_type,
                        out_trade_no, input_charset, partner, key, show_url, body,
                        total_fee, payment_type, seller_email, subject, notify_url,
                        return_url, paymethod, defaultbank, "Y",qr_pay_mode);
        	}
        	else if (defaultbank != null) {
                return Payment.CreateUrls(paygateway, service, sign_type,
                        out_trade_no, input_charset, partner, key, show_url, body,
                        total_fee, payment_type, seller_email, subject, notify_url,
                        return_url, paymethod, defaultbank);
            } else {
                return Payment.CreateUrl(paygateway, service, sign_type,
                        out_trade_no, input_charset, partner, key, seller_email, body,
                        subject, show_url, payment_type, return_url, notify_url, total_fee,token,itpay);
            }
        }
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public Date getNow_Date() {
        return Now_Date;
    }

    public void setNow_Date(Date now_Date) {
        Now_Date = now_Date;
    }

    public String getPaygateway() {
        return paygateway;
    }

    public void setPaygateway(String paygateway) {
        this.paygateway = paygateway;
    }

    public String getService() {
        return service;
    }

    public void setService(String service) {
        this.service = service;
    }

    public String getSign_type() {
        return sign_type;
    }

    public void setSign_type(String sign_type) {
        this.sign_type = sign_type;
    }

    public String getOut_trade_no() {
        return out_trade_no;
    }

    public void setOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
    }

    public String getInput_charset() {
        return input_charset;
    }

    public void setInput_charset(String input_charset) {
        this.input_charset = input_charset;
    }

    public String getPartner() {
        return partner;
    }

    public void setPartner(String partner) {
        this.partner = partner;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getSeller_email() {
        return seller_email;
    }

    public void setSeller_email(String seller_email) {
        this.seller_email = seller_email;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getShow_url() {
        return show_url;
    }

    public void setShow_url(String show_url) {
        this.show_url = show_url;
    }

    public String getPayment_type() {
        return payment_type;
    }

    public void setPayment_type(String payment_type) {
        this.payment_type = payment_type;
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }

    public String getLogistics_type() {
        return logistics_type;
    }

    public void setLogistics_type(String logistics_type) {
        this.logistics_type = logistics_type;
    }

    public String getLogistics_fee() {
        return logistics_fee;
    }

    public void setLogistics_fee(String logistics_fee) {
        this.logistics_fee = logistics_fee;
    }

    public String getLogistics_payment() {
        return logistics_payment;
    }

    public void setLogistics_payment(String logistics_payment) {
        this.logistics_payment = logistics_payment;
    }

    public String getReturn_url() {
        return return_url;
    }

    public void setReturn_url(String return_url) {
        this.return_url = return_url;
    }

    public String getTotal_fee() {
        return total_fee;
    }

    public void setTotal_fee(String total_fee) {
        this.total_fee = total_fee;
    }

    public String getNotify_url() {
        return notify_url;
    }

    public void setNotify_url(String notify_url) {
        this.notify_url = notify_url;
    }

    @Override
    public String toString() {
        return "AlipayVO{" +
                "Now_Date=" + Now_Date +
                ", paygateway='" + paygateway + '\'' +
                ", service='" + service + '\'' +
                ", sign_type='" + sign_type + '\'' +
                ", out_trade_no='" + out_trade_no + '\'' +
                ", input_charset='" + input_charset + '\'' +
                ", partner='" + partner + '\'' +
                ", key='" + key + '\'' +
                ", seller_email='" + seller_email + '\'' +
                ", body='" + body + '\'' +
                ", subject='" + subject + '\'' +
                ", price='" + price + '\'' +
                ", quantity='" + quantity + '\'' +
                ", show_url='" + show_url + '\'' +
                ", payment_type='" + payment_type + '\'' +
                ", discount='" + discount + '\'' +
                ", logistics_type='" + logistics_type + '\'' +
                ", logistics_fee='" + logistics_fee + '\'' +
                ", logistics_payment='" + logistics_payment + '\'' +
                ", return_url='" + return_url + '\'' +
                ", sign='" + sign + '\'' +
                '}';
    }
}