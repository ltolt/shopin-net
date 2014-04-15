package com.shopin.modules.orm.hibernate;

import java.util.Date;
import javax.persistence.Column;


/**
 * Created by IntelliJ IDEA.
 * User: yanwt
 * Date: 2009-7-30
 * Time: 11:31:18
 * 含审计信息的Entity基类.
 *
 */
public class AuditableEntity extends IdEntity {
	protected Date createTime; //创建时间
	protected String createBy; //创建操作员的登录名
	protected Date lastModifyTime; //最后修改时间
	protected String lastModifyBy; //最后修改操作员的登录名

	//本属性只在save时有效,update时无效.
	@Column(name = "CREATE_TIME",updatable = false)
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Column(name = "CREATE_BY",updatable = false)
	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	//本属性只在update时有效,save时无效.
	@Column(name = "LAST_MODIFY_TIME",insertable = false)
	public Date getLastModifyTime() {
		return lastModifyTime;
	}

	public void setLastModifyTime(Date lastModifyTime) {
		this.lastModifyTime = lastModifyTime;
	}

	@Column(name = "LAST_MODIFY_BY",insertable = false)
	public String getLastModifyBy() {
		return lastModifyBy;
	}

	public void setLastModifyBy(String lastModifyBy) {
		this.lastModifyBy = lastModifyBy;
	}
}
