package net.shopin.web.conf;

/**
 * Created by IntelliJ IDEA.
 * User: wchao
 * Date: 12-10-11
 * Time: 上午10:42
 * To change this template use File | Settings | File Templates.
 */
public class CMPayVO {

    private String paygateway;

    private String characterSet;//00- GBK 01- GB2312 02- UTF-8 默讣00-GBK 可空

    private String callbackUrl;//类似支付宝的returnUrl同步返回 非空

    private String notifyUrl;//异步返回 非空

    private String ipAddress;//ip地址 非空

    private String merchantId;//商户编号 非空

    private String signKey;// 商户密钥

    private String requestId;//商户请求号 非空

    private String signType;//签名方式 只能是MD5，RSA 非空

    private String version;//2.0.0 非空

    private String type;//接口类型  GWDirectPay网银网关

    private String merchantCert;//  丌参不签名；如果signType=RSA，此项必输 可空

    private String hmac;//获得hmac的方法见签名算法,参数顺序按照表格中从上到下的顺序,但丌包括本参数. 非空

    private String amount;//订单金额，以分为单位，如1元表示为100 非空

    private String bankAbbr;//可空

    private String currency;//币种  00- CNY—现金支付方式 默讣为：00 非空

    private String orderDate;// 商户发起请求的时间;年年年年月月日日 非空

    private String orderId;//商户系统订单号 非空

    private String merAcDate;//商户发起请求的会计日期; 年年年年月月日日 非空

    private String period;//数字，不订单有效期单位同时构成订单有效期 非空

    private String periodUnit;//只能取以下枚举值00- 分 01- 小时 02- 日 03- 月 非空

    private String merchantAbbr;//商户展示名称 可空

    private String productDesc;//对商品的描述 可空

    private String productId;//所购买商品的编号 可空

    private String productName;//所购买商品的名称 非空

    private String productNum;//所购买商品的数量 可空

    private String reserved1;//保留字段 交易返回时原样返回给商家网站，给商户备用 可空

    private String reserved2;

    private String userToken;//待支付的手机号或者手机支付账户昵称 可空

    private String showUrl;//商品展示地址 可空

    private String couponsFlag;//营销工具使用控制00使用全部营销工具(默讣) 10丌支持使用电子券 20丌支持代金券 30-丌支持积分 40-丌支持所有营销工具 可空

    public String getPaygateway() {
        return paygateway;
    }

    public void setPaygateway(String paygateway) {
        this.paygateway = paygateway;
    }

    public String getCharacterSet() {
        return characterSet;
    }

    public void setCharacterSet(String characterSet) {
        this.characterSet = characterSet;
    }

    public String getCallbackUrl() {
        return callbackUrl;
    }

    public void setCallbackUrl(String callbackUrl) {
        this.callbackUrl = callbackUrl;
    }

    public String getNotifyUrl() {
        return notifyUrl;
    }

    public void setNotifyUrl(String notifyUrl) {
        this.notifyUrl = notifyUrl;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public String getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(String merchantId) {
        this.merchantId = merchantId;
    }

    public String getSignKey() {
        return signKey;
    }

    public void setSignKey(String signKey) {
        this.signKey = signKey;
    }

    public String getRequestId() {
        return requestId;
    }

    public void setRequestId(String requestId) {
        this.requestId = requestId;
    }

    public String getSignType() {
        return signType;
    }

    public void setSignType(String signType) {
        this.signType = signType;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMerchantCert() {
        return merchantCert;
    }

    public void setMerchantCert(String merchantCert) {
        this.merchantCert = merchantCert;
    }

    public String getHmac() {
        return hmac;
    }

    public void setHmac(String hmac) {
        this.hmac = hmac;
    }

    public String getCouponsFlag() {
        return couponsFlag;
    }

    public void setCouponsFlag(String couponsFlag) {
        this.couponsFlag = couponsFlag;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getBankAbbr() {
        return bankAbbr;
    }

    public void setBankAbbr(String bankAbbr) {
        this.bankAbbr = bankAbbr;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getMerAcDate() {
        return merAcDate;
    }

    public void setMerAcDate(String merAcDate) {
        this.merAcDate = merAcDate;
    }

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public String getPeriodUnit() {
        return periodUnit;
    }

    public void setPeriodUnit(String periodUnit) {
        this.periodUnit = periodUnit;
    }

    public String getMerchantAbbr() {
        return merchantAbbr;
    }

    public void setMerchantAbbr(String merchantAbbr) {
        this.merchantAbbr = merchantAbbr;
    }

    public String getProductDesc() {
        return productDesc;
    }

    public void setProductDesc(String productDesc) {
        this.productDesc = productDesc;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductNum() {
        return productNum;
    }

    public void setProductNum(String productNum) {
        this.productNum = productNum;
    }

    public String getReserved1() {
        return reserved1;
    }

    public void setReserved1(String reserved1) {
        this.reserved1 = reserved1;
    }

    public String getReserved2() {
        return reserved2;
    }

    public void setReserved2(String reserved2) {
        this.reserved2 = reserved2;
    }

    public String getUserToken() {
        return userToken;
    }

    public void setUserToken(String userToken) {
        this.userToken = userToken;
    }

    public String getShowUrl() {
        return showUrl;
    }

    public void setShowUrl(String showUrl) {
        this.showUrl = showUrl;
    }
}
