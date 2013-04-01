/**
 * 说 明  :
 * author: 陆湘星
 * data  : 2012-1-3
 * email : xiangxingchina@163.com
 **/
package base.framework.domain;

public class BaseDomain {
	//--以下为必填信息
	public String optUid;
	public String ipAddress; //WEB客户端 IP地址
	
	public String getOptUid() {
		return optUid;
	}
	public void setOptUid(String optUid) {
		this.optUid = optUid;
	}
	public String getIpAddress() {
		return ipAddress;
	}
	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}
	
}
