package net.shopin.web.conf;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by IntelliJ IDEA.
 * User: LQW
 * Date: 2010-2-6
 * Time: 13:42:43
 */
public class IcbcVO {
    String interfaceName = "ICBC_PERBANK_B2C";
    String interfaceVersion = "1.0.0.3";

    //以下是Custom Information
    String verifyJoinFlag = "0";
    String language = "ZH_CN";

    String curType = "001";//人民币

    //交易数据
    String tranData = "";
    //订单签名数据
    String merSignMsg = "";
    //商城证书公钥
    String merCert = "";

    public String getCurType() {
        return curType;
    }

    public void setCurType(String curType) {
        this.curType = curType;
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

    public String getTranData() {
        return tranData;
    }

    public void setTranData(String tranData) {
        this.tranData = tranData;
    }

    public String getMerSignMsg() {
        return merSignMsg;
    }

    public void setMerSignMsg(String merSignMsg) {
        this.merSignMsg = merSignMsg;
    }

    public String getMerCert() {
        return merCert;
    }

    public void setMerCert(String merCert) {
        this.merCert = merCert;
    }

    @Override
    public String toString() {
        return "IcbcVO{" +
                "interfaceName='" + interfaceName + '\'' +
                ", interfaceVersion='" + interfaceVersion + '\'' +
                ", verifyJoinFlag='" + verifyJoinFlag + '\'' +
                ", language='" + language + '\'' +
                ", tranData='" + tranData + '\'' +
                ", merSignMsg='" + merSignMsg + '\'' +
                ", merCert='" + merCert + '\'' +
                '}';
    }
}