package net.shopin.web.conf;

/**
 * Created by IntelliJ IDEA.
 * User: wentao
 * Date: 2009-2-6
 * Time: 13:42:43
 */
public class YeePayConf {
    private String keyValue;               // 商家密钥
    private String nodeAuthorizationURL;      // 交易请求地址
    private String p0Cmd;       // 在线支付请求，固定值 ”Buy”
    private String p1MerId;         // 商户编号
    private String p4Cur;           // 交易币种
    private String p8Url;          // 商户接收支付成功数据的地址
    private String p9SAF;         // 需要填写送货信息 0：不需要  1:需要
    private String pdFrpId;     // 支付通道编码

    public String getKeyValue() {
        return keyValue;
    }

    public void setKeyValue(String keyValue) {
        this.keyValue = keyValue;
    }

    public String getNodeAuthorizationURL() {
        return nodeAuthorizationURL;
    }

    public void setNodeAuthorizationURL(String nodeAuthorizationURL) {
        this.nodeAuthorizationURL = nodeAuthorizationURL;
    }

    public String getP0Cmd() {
        return p0Cmd;
    }

    public void setP0Cmd(String p0Cmd) {
        this.p0Cmd = p0Cmd;
    }

    public String getP1MerId() {
        return p1MerId;
    }

    public void setP1MerId(String p1MerId) {
        this.p1MerId = p1MerId;
    }

    public String getP4Cur() {
        return p4Cur;
    }

    public void setP4Cur(String p4Cur) {
        this.p4Cur = p4Cur;
    }

    public String getP8Url() {
        return p8Url;
    }

    public void setP8Url(String p8Url) {
        this.p8Url = p8Url;
    }

    public String getP9SAF() {
        return p9SAF;
    }

    public void setP9SAF(String p9SAF) {
        this.p9SAF = p9SAF;
    }

    public String getPdFrpId() {
        return pdFrpId;
    }

    public void setPdFrpId(String pdFrpId) {
        this.pdFrpId = pdFrpId;
    }
}
