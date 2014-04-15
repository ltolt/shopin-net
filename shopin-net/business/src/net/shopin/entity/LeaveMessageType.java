package net.shopin.entity;

import java.util.Collection;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;





/**
 * 
 * @Description： 留言类型类 此类用来维护留言类型， 属于数据字典的作用。 只有在留言类型需要改变的时候才需要去操作此类
 * @ClassName:LeaveMessageType
 * @author： huyy
 * @date: 2013-7-10
 */
@Entity
@Table(name = "LEAVEMSGTYPE")
public class LeaveMessageType {

	// Fields

	private Integer tid;
	private Integer pid;
	private String catename;
	private String viewcontent;
	private Integer contenttype;
	private Integer typeOrder;
	private Integer orderNoNeed;//是否需要输入订单号 ，1 需要。 0 不需要。默认是1
	private Integer targetType;//1是新页面，0是本页面
	private LeaveMessageType parentType;
	private Collection<LeaveMessageType> leaveMessageTypes;
	private Collection<LeaveMessage> leaveMessages;
	
	@Column(name = "TID")
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public Integer getTid() {
		return tid;
	}

	public void setTid(Integer tid) {
		this.tid = tid;
	}

	@Column(name = "PID", insertable = false, updatable = false)
	@Basic
	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	@Column(name = "CATENAME")
	@Basic
	public String getCatename() {
		return catename;
	}

	public void setCatename(String catename) {
		this.catename = catename;
	}

	@Column(name = "viewcontent")
	@Basic
	public String getViewcontent() {
		return viewcontent;
	}

	public void setViewcontent(String viewcontent) {
		this.viewcontent = viewcontent;
	}

	@Column(name = "CONTENTTYPE")
	@Basic
	public Integer getContenttype() {
		return contenttype;
	}

	public void setContenttype(Integer contenttype) {
		this.contenttype = contenttype;
	}

	@Column(name = "TYPEORDER")
	@Basic
	public Integer getTypeOrder() {
		return typeOrder;
	}

	public void setTypeOrder(Integer typeOrder) {
		this.typeOrder = typeOrder;
	}

	@Column(name = "ORDERNONEED")
	@Basic
	public Integer getOrderNoNeed() {
		return orderNoNeed;
	}

	public void setOrderNoNeed(Integer orderNoNeed) {
		this.orderNoNeed = orderNoNeed;
	}

	@Column(name = "TARGETTYPE")
	@Basic
	public Integer getTargetType() {
		return targetType;
	}

	public void setTargetType(Integer targetType) {
		this.targetType = targetType;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="PID", referencedColumnName = "TID")
	public LeaveMessageType getParentType() {
		return parentType;
	}

	public void setParentType(LeaveMessageType parentType) {
		this.parentType = parentType;
	}

	@OneToMany(mappedBy = "parentType")
	public Collection<LeaveMessageType> getLeaveMessageTypes() {
		return leaveMessageTypes;
	}

	public void setLeaveMessageTypes(Collection<LeaveMessageType> leaveMessageTypes) {
		this.leaveMessageTypes = leaveMessageTypes;
	}

	@OneToMany(mappedBy = "leaveMessageType")
	public Collection<LeaveMessage> getLeaveMessages() {
		return leaveMessages;
	}

	public void setLeaveMessages(Collection<LeaveMessage> leaveMessages) {
		this.leaveMessages = leaveMessages;
	}
}