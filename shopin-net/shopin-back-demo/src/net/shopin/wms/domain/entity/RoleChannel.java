package net.shopin.wms.domain.entity;

public class RoleChannel {
    private Long rolesSid;

    private Integer channelSid;

    public Long getRolesSid() {
        return rolesSid;
    }

    public void setRolesSid(Long rolesSid) {
        this.rolesSid = rolesSid;
    }

    public Integer getChannelSid() {
        return channelSid;
    }

    public void setChannelSid(Integer channelSid) {
        this.channelSid = channelSid;
    }
}