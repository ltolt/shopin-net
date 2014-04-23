package net.shopin.web.conf;

import java.io.Serializable;

/**
 * Created by IntelliJ IDEA.
 * User: wentao
 * Date: 2009-3-3
 * Time: 11:19:10
 */
public class BankpayVO implements Serializable {
    private String v_mid;
    private String v_oid;
    private String v_rcvname = "上品优价";
    private String v_rcvaddr = "中关村中芯大厦";
    private String v_rcvtel = "13800138000";
    private String v_rcvpost = "100080";
    private String v_amount;
    private String v_ymd;
    private String v_orderstatus;
    private String v_ordername;
    private String v_moneytype;
    private String v_url;
    private String v_md5info;
    private String v_pmode;

    public String getV_mid() {
        return v_mid;
    }

    public void setV_mid(String v_mid) {
        this.v_mid = v_mid;
    }

    public String getV_oid() {
        return v_oid;
    }

    public void setV_oid(String v_oid) {
        this.v_oid = v_oid;
    }

    public String getV_rcvname() {
        return v_rcvname==null?"上品优价":v_rcvname;
    }

    public void setV_rcvname(String v_rcvname) {
        this.v_rcvname = v_rcvname;
    }

    public String getV_rcvaddr() {
        return v_rcvaddr==null?"中关村中芯大厦":v_rcvaddr;
    }

    public void setV_rcvaddr(String v_rcvaddr) {
        this.v_rcvaddr = v_rcvaddr;
    }

    public String getV_rcvtel() {
        return v_rcvtel==null?"13800138000":v_rcvtel;
    }

    public void setV_rcvtel(String v_rcvtel) {
        this.v_rcvtel = v_rcvtel;
    }

    public String getV_rcvpost() {
        return v_rcvpost==null?"100080":v_rcvpost;
    }

    public void setV_rcvpost(String v_rcvpost) {
        this.v_rcvpost = v_rcvpost;
    }

    public String getV_amount() {
        return v_amount;
    }

    public void setV_amount(String v_amount) {
        this.v_amount = v_amount;
    }

    public String getV_ymd() {
        return v_ymd;
    }

    public void setV_ymd(String v_ymd) {
        this.v_ymd = v_ymd;
    }

    public String getV_orderstatus() {
        return v_orderstatus;
    }

    public void setV_orderstatus(String v_orderstatus) {
        this.v_orderstatus = v_orderstatus;
    }

    public String getV_ordername() {
        return v_ordername;
    }

    public void setV_ordername(String v_ordername) {
        this.v_ordername = v_ordername;
    }

    public String getV_moneytype() {
        return v_moneytype;
    }

    public void setV_moneytype(String v_moneytype) {
        this.v_moneytype = v_moneytype;
    }

    public String getV_url() {
        return v_url;
    }

    public void setV_url(String v_url) {
        this.v_url = v_url;
    }

    public String getV_md5info() {
        return v_md5info;
    }

    public void setV_md5info(String v_md5info) {
        this.v_md5info = v_md5info;
    }

    public String getV_pmode() {
        return v_pmode;
    }

    public void setV_pmode(String v_pmode) {
        this.v_pmode = v_pmode;
    }

    @Override
    public String toString() {
        return "BankpayVO{" +
                "v_mid='" + v_mid + '\'' +
                ", v_oid='" + v_oid + '\'' +
                ", v_rcvname='" + v_rcvname + '\'' +
                ", v_rcvaddr='" + v_rcvaddr + '\'' +
                ", v_rcvtel='" + v_rcvtel + '\'' +
                ", v_rcvpost='" + v_rcvpost + '\'' +
                ", v_amount='" + v_amount + '\'' +
                ", v_ymd='" + v_ymd + '\'' +
                ", v_orderstatus='" + v_orderstatus + '\'' +
                ", v_ordername='" + v_ordername + '\'' +
                ", v_moneytype='" + v_moneytype + '\'' +
                ", v_url='" + v_url + '\'' +
                ", v_md5info='" + v_md5info + '\'' +
                ", v_pmode='" + v_pmode + '\'' +
                '}';
    }
}
