package net.shopin.wms.domain.entity;

public class RoleResource {
    private Long rolesSid;

    private Long resourcesSid;

    public Long getRolesSid() {
        return rolesSid;
    }

    public void setRolesSid(Long rolesSid) {
        this.rolesSid = rolesSid;
    }

    public Long getResourcesSid() {
        return resourcesSid;
    }

    public void setResourcesSid(Long resourcesSid) {
        this.resourcesSid = resourcesSid;
    }

	@Override
	public String toString() {
		return "RoleResource [rolesSid=" + rolesSid + ", resourcesSid="
				+ resourcesSid + "]";
	}
    
    
}