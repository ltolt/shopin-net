package net.shopin.wms.domain.view;

import java.util.Date;
/**
 * 
 * @Class Name DictItem
 * @Author chenqb
 * @Create In 2013-8-1
 */
public class DictItem {
	
	private Long sid;
	
	private Integer dictTypeCode;
	
	private Integer dictItemCode;
	
	private String dictItemName;
	
	private Integer showSeq;
	
	private String memo;
	
	private Integer activeFlag;
	
	private Date createdTime;
	
	private Date updatedTime;

	public Long getSid() {
		return sid;
	}

	public void setSid(Long sid) {
		this.sid = sid;
	}

	public Integer getDictTypeCode() {
		return dictTypeCode;
	}

	public void setDictTypeCode(Integer dictTypeCode) {
		this.dictTypeCode = dictTypeCode;
	}

	public Integer getDictItemCode() {
		return dictItemCode;
	}

	public void setDictItemCode(Integer dictItemCode) {
		this.dictItemCode = dictItemCode;
	}

	public String getDictItemName() {
		return dictItemName;
	}

	public void setDictItemName(String dictItemName) {
		this.dictItemName = dictItemName;
	}

	public Integer getShowSeq() {
		return showSeq;
	}

	public void setShowSeq(Integer showSeq) {
		this.showSeq = showSeq;
	}

	
	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Integer getActiveFlag() {
		return activeFlag;
	}

	public void setActiveFlag(Integer activeFlag) {
		this.activeFlag = activeFlag;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public Date getUpdatedTime() {
		return updatedTime;
	}

	public void setUpdatedTime(Date updatedTime) {
		this.updatedTime = updatedTime;
	}
	
	
}
