package base.framework.orm.hibernate;

import java.util.Date;

import javax.persistence.Column;

/**
 * 含审计信息的Entity基类
 * @author Lucas Kong
 *
 */
public class AuditableEntity extends IdEntity{
	//创建时间
	protected Date createTime;
	//创建操作员的登录名
	protected String createBy;
	//最好修改时间
	protected Date lastModifyTime;
	//最后修改操作员的登录名
	protected String lastModifuBy;
	
	//本属性只在save时有效 update时无效
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
	//本属性只在update时有效 save无效
	@Column(name = "LAST_MODIFY_TIME",insertable = false)
	public Date getLastModifyTime() {
		return lastModifyTime;
	}
	public void setLastModifyTime(Date lastModifyTime) {
		this.lastModifyTime = lastModifyTime;
	}
	@Column(name = "LAST_MODIFY_BY",insertable = false)
	public String getLastModifuBy() {
		return lastModifuBy;
	}
	public void setLastModifuBy(String lastModifuBy) {
		this.lastModifuBy = lastModifuBy;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
