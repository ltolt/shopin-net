package net.shopin.view;

import java.io.Serializable;
import java.util.List;

/**
 * 商品颜色尺码 view
 * 
 * @author k
 * 
 */
public class ProColorDetailVO implements Serializable {
	private String colorSid;
	private String proColor;
	private String proColorDesc;
	private List<ProStanVO> proStans;

	public String getColorSid() {
		return colorSid;
	}

	public void setColorSid(String colorSid) {
		this.colorSid = colorSid;
	}

	public String getProColor() {
		return proColor;
	}

	public void setProColor(String proColor) {
		this.proColor = proColor;
	}

	public String getProColorDesc() {
		return proColorDesc;
	}

	public void setProColorDesc(String proColorDesc) {
		this.proColorDesc = proColorDesc;
	}

	public List<ProStanVO> getProStans() {
		return proStans;
	}

	public void setProStans(List<ProStanVO> proStans) {
		this.proStans = proStans;
	}

	@Override
	public String toString() {
		return "ProColorDetailVO [colorSid=" + colorSid + ", proColor="
				+ proColor + ", proColorDesc=" + proColorDesc + ", proStans="
				+ proStans + "]";
	}

}
