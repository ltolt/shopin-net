package net.shopin.wms.domain.view;

import java.util.Date;
/**
 * 
 * @Class Name DictType
 * @Author chenqb
 * @Create In 2013-7-31
 */

public class DictType {
	  private Long sid;

	    private Integer dictTypeCode;

	    private String dictTypeName;
	    
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

		public String getDictTypeName() {
			return dictTypeName;
		}

		public void setDictTypeName(String dictTypeName) {
			this.dictTypeName = dictTypeName;
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
