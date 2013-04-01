package net.shopin.view;

import java.io.Serializable;

/**
 * 商品尺码view
 * 
 * @author k
 * 
 */
public class ProStanVO implements Serializable {
	private String proDetailSid;// 明细Sid
	private String proStanSid;// 尺码id
	private String proStanName; // 名称

	public String getProDetailSid() {
		return proDetailSid;
	}

	public void setProDetailSid(String proDetailSid) {
		this.proDetailSid = proDetailSid;
	}

	public String getProStanSid() {
		return proStanSid;
	}

	public void setProStanSid(String proStanSid) {
		this.proStanSid = proStanSid;
	}

	public String getProStanName() {
		return proStanName;
	}

	public void setProStanName(String proStanName) {
		this.proStanName = proStanName;
	}

	@Override
	public String toString() {
		return "ProStanVO [proDetailSid=" + proDetailSid + ", proStanSid="
				+ proStanSid + ", proStanName=" + proStanName + "]";
	}

}
