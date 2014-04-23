package net.shopin.wms.domain.entity;

public class LeaveMessageType {
    private Integer tid;

    private Integer pid;

    private String catename;

    private String viewcontent;

    private Integer contenttype;

    private Integer typeorder;

    private Integer ordernoneed;

    private Integer targettype;

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getCatename() {
        return catename;
    }

    public void setCatename(String catename) {
        this.catename = catename == null ? null : catename.trim();
    }

    public String getViewcontent() {
        return viewcontent;
    }

    public void setViewcontent(String viewcontent) {
        this.viewcontent = viewcontent == null ? null : viewcontent.trim();
    }

    public Integer getContenttype() {
        return contenttype;
    }

    public void setContenttype(Integer contenttype) {
        this.contenttype = contenttype;
    }

    public Integer getTypeorder() {
        return typeorder;
    }

    public void setTypeorder(Integer typeorder) {
        this.typeorder = typeorder;
    }

    public Integer getOrdernoneed() {
        return ordernoneed;
    }

    public void setOrdernoneed(Integer ordernoneed) {
        this.ordernoneed = ordernoneed;
    }

    public Integer getTargettype() {
        return targettype;
    }

    public void setTargettype(Integer targettype) {
        this.targettype = targettype;
    }

	@Override
	public String toString() {
		return "LeaveMessageType [tid=" + tid + ", pid=" + pid + ", catename="
				+ catename + ", viewcontent=" + viewcontent + ", contenttype="
				+ contenttype + ", typeorder=" + typeorder + ", ordernoneed="
				+ ordernoneed + ", targettype=" + targettype + "]";
	}
}