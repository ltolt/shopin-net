/**
 * 说 明  :
 * author: 陆湘星
 * data  : 2012-1-3
 * email : xiangxingchina@163.com
 **/
package base.framework.domain;

import java.io.Serializable;



public class PageDomain extends BaseDomain implements Serializable {
	private static final long serialVersionUID = -1970099017324708241L;
	protected Integer start = 0;
	protected Integer limit = Constants.PAGE_SIZE;
	
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getLimit() {
		return limit;
	}
	public void setLimit(Integer limit) {
		this.limit = limit;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
