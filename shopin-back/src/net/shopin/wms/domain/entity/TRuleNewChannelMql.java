package net.shopin.wms.domain.entity;

public class TRuleNewChannelMql {
    private Integer sid;

    private Integer ruleSid;

    private Integer seq;

    private String channelName;

    private Integer channelSid;

    public Integer getSid() {
        return sid;
    }

    public void setSid(Integer sid) {
        this.sid = sid;
    }

    public Integer getRuleSid() {
        return ruleSid;
    }

    public void setRuleSid(Integer ruleSid) {
        this.ruleSid = ruleSid;
    }

    public Integer getSeq() {
        return seq;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
    }

    public String getChannelName() {
        return channelName;
    }

    public void setChannelName(String channelName) {
        this.channelName = channelName == null ? null : channelName.trim();
    }

    public Integer getChannelSid() {
        return channelSid;
    }

    public void setChannelSid(Integer channelSid) {
        this.channelSid = channelSid;
    }
}