package net.shopin.wms.domain.entity;

public class Navigation {
    private Long sid;

    private Long navSid;

    private String name;

    private String link;

    private String icon;

    private Integer seq;

    private Integer flag;

    private Integer navLevel;

    private Integer isShow;
    
    private String classSid;
    
    private String linkBrand;
    
    private Integer channelSid;

	public Integer getChannelSid() {
		return channelSid;
	}

	public void setChannelSid(Integer channelSid) {
		this.channelSid = channelSid;
	}

	public String getClassSid() {
		return classSid;
	}

	public void setClassSid(String classSid) {
		this.classSid = classSid;
	}

	
	public String getLinkBrand() {
		return linkBrand;
	}

	public void setLinkBrand(String linkBrand) {
		this.linkBrand = linkBrand;
	}

	public Long getSid() {
        return sid;
    }

    public void setSid(Long sid) {
        this.sid = sid;
    }

    public Long getNavSid() {
        return navSid;
    }

    public void setNavSid(Long navSid) {
        this.navSid = navSid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link == null ? null : link.trim();
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

    public Integer getSeq() {
        return seq;
    }

    public void setSeq(Integer seq) {
        this.seq = seq;
    }

    public Integer getFlag() {
        return flag;
    }

    public void setFlag(Integer flag) {
        this.flag = flag;
    }

    public Integer getNavLevel() {
        return navLevel;
    }

    public void setNavLevel(Integer navLevel) {
        this.navLevel = navLevel;
    }

    public Integer getIsShow() {
        return isShow;
    }

    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }
}