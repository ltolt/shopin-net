package net.shopin.web.conf;

/**
 * Created by IntelliJ IDEA.
 * User: wentao
 * Date: 2009-2-6
 * Time: 13:42:43
 */
public class IcbcConf {

    private String icbcPublicFile;
    private String icbcPrivateKey;
    private String icbcBankFile;
    private String icbcVerifyURL;//工行回调url
    private String keyPassword;//工行商户商城私钥密码
    private String merID = "0200EC23489707";//工行商户代码
    private String merAcct = "0200004519000100173";//工行商户账号
    private String interfaceName;
    private String interfaceVersion;
    private String installmentTimes; //分期付款期数
    private String creditType; //支持订单支付的银行卡种类
    private String notifyType; //通知类型
    private String resultType; //结果发送类型
    private String merReference; //商户reference
    private String merCustomIp; //客户端IP
    private String curType; //支付币种
    private String verifyJoinFlag; //支付币种
    private String language; //支付币种

    public String getVerifyJoinFlag() {
        return verifyJoinFlag;
    }

    public void setVerifyJoinFlag(String verifyJoinFlag) {
        this.verifyJoinFlag = verifyJoinFlag;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public String getCurType() {
        return curType;
    }

    public void setCurType(String curType) {
        this.curType = curType;
    }

    public String getMerCustomIp() {
        return merCustomIp;
    }

    public void setMerCustomIp(String merCustomIp) {
        this.merCustomIp = merCustomIp;
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

    public String getKeyPassword() {
        return keyPassword;
    }

    public void setKeyPassword(String keyPassword) {
        this.keyPassword = keyPassword;
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

    public String getInterfaceName() {
        return interfaceName;
    }

    public void setInterfaceName(String interfaceName) {
        this.interfaceName = interfaceName;
    }

    public String getInterfaceVersion() {
        return interfaceVersion;
    }

    public void setInterfaceVersion(String interfaceVersion) {
        this.interfaceVersion = interfaceVersion;
    }

    public String getInstallmentTimes() {
        return installmentTimes;
    }

    public void setInstallmentTimes(String installmentTimes) {
        this.installmentTimes = installmentTimes;
    }

    public String getCreditType() {
        return creditType;
    }

    public void setCreditType(String creditType) {
        this.creditType = creditType;
    }

    public String getNotifyType() {
        return notifyType;
    }

    public void setNotifyType(String notifyType) {
        this.notifyType = notifyType;
    }

    public String getResultType() {
        return resultType;
    }

    public void setResultType(String resultType) {
        this.resultType = resultType;
    }

    public String getMerReference() {
        return merReference;
    }

    public void setMerReference(String merReference) {
        this.merReference = merReference;
    }
}
