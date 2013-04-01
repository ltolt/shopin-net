/**
 * 说 明     : 查询条件接口
 * author: 陆湘星
 * data  : 2011-5-18
 * email : xiangxingchina@163.com
 **/
package base.framework.util;

import base.framework.domain.PageDomain;


public  class  AbstractCondtion extends PageDomain{
//	private Integer sid;
	private String startDate;	  //开始日期
	private String endDate;		  //截止日期

	//protected String status;//状态 1：公开 2：私人
	
	private String sids;//多ID,用于多数据删除
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
//	public String getStatus() {
//		return status;
//	}
//	public void setStatus(String status) {
//		this.status = status;
//	}
	
//	public Integer getSid() {
//		return sid;
//	}
//	public void setSid(Integer sid) {
//		this.sid = sid;
//	}
	
	public String getSids() {
		return sids;
	}
	public void setSids(String sids) {
		this.sids = sids;
	}
	@Override
	public String toString() {
		return "[ optUid=" + optUid + ", ipAddress=" + ipAddress + "]\r\n"
		+ "[ start="+this.getStart()+", limit="+this.getLimit()+"]\r\n" 
		+ "["+ BeanUtil.Obj2UrlParams(this)+"]";
	}
}
