package net.shopin.web.conf;

/**
 * Created by IntelliJ IDEA.
 * User: wentao
 * Date: 2009-2-6
 * Time: 13:42:43
 */
public class BankConf {
    private String v_mid;
    private String v_password;
    private String publicKeyFile;
    private String bankVerifyURL;
    private String taobaoVerifyURL;
    private String taobaoNotifyURL;
    private String bankCardVerifyURL;
    private String partner;
    private String sellerEmail;
    private String sellerId;
    private String key;
    private String alipayKJSignType;
    private String alipayKJGateWay;
    private String alipayKJReturnURL;
    private String alipayKJNotifyURL;
    private  String alipayKJService;
    private  String alipayKJPartner;
    private  String alipayKJPaymentType;
    private String alipayKJSellerEmail;
    private String alipayKJPayMethod;
    private String alipayKJKey;
    private String icbcVerifyURL;//工行回调url
    private String key_password;//工行商户商城私钥密码
    private String merID = "0200EC23489707";//工行商户代码
    private String merAcct = "0200004519000100173";//工行商户账号
    private String icbcPublicFile;
    private String icbcPrivateKey;
    private String icbcBankFile;

    private String alipayUserReUrl;//会员共享返回url

    private String tenpayKey;
    private String tenpayAccount;
    private String tenpayVerifyURL;

    //--------field added by kongm  20140102 start
    private String tenpayWXKey;
    private String tenpayWXAccount;
    private String tenpayWXVerifyURL;
    private String wxGateWay;
    private String tenpayWXNotifyURL;
    //---------field added by kongm end
  
    
    
	private String cmbPublicKey;
    private String cmbVerifyURL;
    private String cmbShopinKey;
    private String cmbBranchID;
    private String cmbCoNo;

    private String chinaPayPublicKey;
    private String chinaPayPrivetKey;
    private String chinaPageRetUrl;
    private String chinaBgRetUrl;
    private String chinaPayMerId;

    
    
    
    public String getWxGateWay() {
		return wxGateWay;
	}

	public void setWxGateWay(String wxGateWay) {
		this.wxGateWay = wxGateWay;
	}

	public String getTenpayWXNotifyURL() {
		return tenpayWXNotifyURL;
	}

	public void setTenpayWXNotifyURL(String tenpayWXNotifyURL) {
		this.tenpayWXNotifyURL = tenpayWXNotifyURL;
	}

	public String getTenpayWXKey() {
  		return tenpayWXKey;
  	}

  	public void setTenpayWXKey(String tenpayWXKey) {
  		this.tenpayWXKey = tenpayWXKey;
  	}

  	public String getTenpayWXAccount() {
  		return tenpayWXAccount;
  	}

  	public void setTenpayWXAccount(String tenpayWXAccount) {
  		this.tenpayWXAccount = tenpayWXAccount;
  	}

  	public String getTenpayWXVerifyURL() {
  		return tenpayWXVerifyURL;
  	}

  	public void setTenpayWXVerifyURL(String tenpayWXVerifyURL) {
  		this.tenpayWXVerifyURL = tenpayWXVerifyURL;
  	}

    
    public String getChinaPayPublicKey() {
        return chinaPayPublicKey;
    }

    public void setChinaPayPublicKey(String chinaPayPublicKey) {
        this.chinaPayPublicKey = chinaPayPublicKey;
    }


    public String getAlipayKJSellerEmail() {
        return alipayKJSellerEmail;
    }

    public String getAlipayKJKey() {
        return alipayKJKey;
    }

    public void setAlipayKJKey(String alipayKJKey) {
        this.alipayKJKey = alipayKJKey;
    }

    public void setAlipayKJSellerEmail(String alipayKJSellerEmail) {
        this.alipayKJSellerEmail = alipayKJSellerEmail;
    }

    public String getAlipayKJSignType() {
        return alipayKJSignType;
    }

    public void setAlipayKJSignType(String alipayKJSignType) {
        this.alipayKJSignType = alipayKJSignType;
    }

    public String getAlipayKJPaymentType() {
        return alipayKJPaymentType;
    }

    public void setAlipayKJPaymentType(String alipayKJPaymentType) {
        this.alipayKJPaymentType = alipayKJPaymentType;
    }

    public String getChinaPayPrivetKey() {
        return chinaPayPrivetKey;
    }

    public void setChinaPayPrivetKey(String chinaPayPrivetKey) {
        this.chinaPayPrivetKey = chinaPayPrivetKey;
    }

    public String getAlipayKJGateWay() {
        return alipayKJGateWay;
    }

    public void setAlipayKJGateWay(String alipayKJGateWay) {
        this.alipayKJGateWay = alipayKJGateWay;
    }

    public String getChinaPageRetUrl() {
        return chinaPageRetUrl;
    }

    public void setChinaPageRetUrl(String chinaPageRetUrl) {
        this.chinaPageRetUrl = chinaPageRetUrl;
    }

    public String getChinaBgRetUrl() {
        return chinaBgRetUrl;
    }

    public void setChinaBgRetUrl(String chinaBgRetUrl) {
        this.chinaBgRetUrl = chinaBgRetUrl;
    }

    public String getChinaPayMerId() {
        return chinaPayMerId;
    }

    public void setChinaPayMerId(String chinaPayMerId) {
        this.chinaPayMerId = chinaPayMerId;
    }

    public String getCmbShopinKey() {
        return cmbShopinKey;
    }

    public void setCmbShopinKey(String cmbShopinKey) {
        this.cmbShopinKey = cmbShopinKey;
    }

    public String getCmbBranchID() {
        return cmbBranchID;
    }

    public void setCmbBranchID(String cmbBranchID) {
        this.cmbBranchID = cmbBranchID;
    }

    public String getAlipayKJService() {
        return alipayKJService;
    }

    public void setAlipayKJService(String alipayKJService) {
        this.alipayKJService = alipayKJService;
    }

    public String getCmbCoNo() {
        return cmbCoNo;
    }

    public void setCmbCoNo(String cmbCoNo) {
        this.cmbCoNo = cmbCoNo;
    }

    public String getCmbPublicKey() {
        return cmbPublicKey;
    }

    public void setCmbPublicKey(String cmbPublicKey) {
        this.cmbPublicKey = cmbPublicKey;
    }

    public String getCmbVerifyURL() {
        return cmbVerifyURL;
    }

    public void setCmbVerifyURL(String cmbVerifyURL) {
        this.cmbVerifyURL = cmbVerifyURL;
    }

    public String getTenpayKey() {
        return tenpayKey;
    }

    public void setTenpayKey(String tenpayKey) {
        this.tenpayKey = tenpayKey;
    }

    public String getTenpayAccount() {
        return tenpayAccount;
    }

    public void setTenpayAccount(String tenpayAccount) {
        this.tenpayAccount = tenpayAccount;
    }

    public String getTenpayVerifyURL() {
        return tenpayVerifyURL;
    }

    public void setTenpayVerifyURL(String tenpayVerifyURL) {
        this.tenpayVerifyURL = tenpayVerifyURL;
    }

    public String getAlipayUserReUrl() {
        return alipayUserReUrl;
    }

    public String getAlipayKJPartner() {
        return alipayKJPartner;
    }

    public void setAlipayKJPartner(String alipayKJPartner) {
        this.alipayKJPartner = alipayKJPartner;
    }

    public void setAlipayUserReUrl(String alipayUserReUrl) {
        this.alipayUserReUrl = alipayUserReUrl;
    }

    public String getIcbcBankFile() {
        return icbcBankFile;
    }

    public void setIcbcBankFile(String icbcBankFile) {
        this.icbcBankFile = icbcBankFile;
    }

    public String getIcbcVerifyURL() {
        return icbcVerifyURL;
    }

    public void setIcbcVerifyURL(String icbcVerifyURL) {
        this.icbcVerifyURL = icbcVerifyURL;
    }

    public String getKey_password() {
        return key_password;
    }

    public void setKey_password(String key_password) {
        this.key_password = key_password;
    }

    public String getMerID() {
        return merID;
    }

    public void setMerID(String merID) {
        this.merID = merID;
    }

    public String getMerAcct() {
        return merAcct;
    }

    public void setMerAcct(String merAcct) {
        this.merAcct = merAcct;
    }

    public String getIcbcPublicFile() {
        return icbcPublicFile;
    }

    public void setIcbcPublicFile(String icbcPublicFile) {
        this.icbcPublicFile = icbcPublicFile;
    }

    public String getIcbcPrivateKey() {
        return icbcPrivateKey;
    }

    public void setIcbcPrivateKey(String icbcPrivateKey) {
        this.icbcPrivateKey = icbcPrivateKey;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getBankCardVerifyURL() {
        return bankCardVerifyURL;
    }

    public void setBankCardVerifyURL(String bankCardVerifyURL) {
        this.bankCardVerifyURL = bankCardVerifyURL;
    }

    public String getV_mid() {
        return v_mid;
    }

    public String getAlipayKJNotifyURL() {
        return alipayKJNotifyURL;
    }

    public void setAlipayKJNotifyURL(String alipayKJNotifyURL) {
        this.alipayKJNotifyURL = alipayKJNotifyURL;
    }

    public String getAlipayKJReturnURL() {
        return alipayKJReturnURL;
    }

    public void setAlipayKJReturnURL(String alipayKJReturnURL) {
        this.alipayKJReturnURL = alipayKJReturnURL;
    }

    public void setV_mid(String v_mid) {
        this.v_mid = v_mid;

    }

    public String getV_password() {
        return v_password;
    }

    public void setV_password(String v_password) {
        this.v_password = v_password;
    }

    public String getPublicKeyFile() {
        return publicKeyFile;
    }

    public void setPublicKeyFile(String publicKeyFile) {
        this.publicKeyFile = publicKeyFile;
    }

    public String getBankVerifyURL() {
        return bankVerifyURL;
    }

    public void setBankVerifyURL(String bankVerifyURL) {
        this.bankVerifyURL = bankVerifyURL;
    }

    public String getTaobaoVerifyURL() {
        return taobaoVerifyURL;
    }

    public void setTaobaoVerifyURL(String taobaoVerifyURL) {
        this.taobaoVerifyURL = taobaoVerifyURL;
    }

    public String getPartner() {
        return partner;
    }

    public void setPartner(String partner) {
        this.partner = partner;
    }

    public String getSellerEmail() {
        return sellerEmail;
    }

    public void setSellerEmail(String sellerEmail) {
        this.sellerEmail = sellerEmail;
    }

    public String getSellerId() {
        return sellerId;
    }

    public void setSellerId(String sellerId) {
        this.sellerId = sellerId;
    }

    public String getTaobaoNotifyURL() {
        return taobaoNotifyURL;
    }

    public void setTaobaoNotifyURL(String taobaoNotifyURL) {
        this.taobaoNotifyURL = taobaoNotifyURL;
    }

     public String getAlipayKJPayMethod() {
        return alipayKJPayMethod;
    }

    public void setAlipayKJPayMethod(String alipayKJPayMethod) {
        this.alipayKJPayMethod = alipayKJPayMethod;
    }
}
