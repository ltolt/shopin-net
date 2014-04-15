package net.shopin.wms.domain.view;

import net.shopin.wms.util.PageModel;

public class NavSortItemVO extends PageModel {
	private Integer sid;// 主键SID

	private Integer navSortSid;// 所属模板id

	private String className;// 显示名称

	private String url;// 关联链接

	private Integer orderBy;// 显示排序

	private Integer isTop;// 是否推荐（1为推荐）

	private Integer parentId;// 父类id（父子关联表，改字段为空时，则为根节点）

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public Integer getNavSortSid() {
		return navSortSid;
	}

	public void setNavSortSid(Integer navSortSid) {
		this.navSortSid = navSortSid;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(Integer orderBy) {
		this.orderBy = orderBy;
	}

	public Integer getIsTop() {
		return isTop;
	}

	public void setIsTop(Integer isTop) {
		this.isTop = isTop;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	
	
	 @Override
		public String toString() {
			return "NavSortItemVO [sid=" + sid + ", navSortSid="
					+ navSortSid + ", className=" + className + ", url="
					+ url + ", orderBy=" + orderBy + ", isTop="
					+ isTop + ", parentId=" + parentId + "]";
		}
	
}
