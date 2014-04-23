/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.domain.viewNavPromotionKey.java
 * @Create By shiying
 * @Create In 2013-7-24 下午2:30:14
 * TODO
 */
package net.shopin.wms.domain.view;

/**
 * @Class Name NavPromotionKey
 * @Author shiying
 * @Create In 2013-7-24
 */
public class NavPromotionKey {
	String navSid;
	String promotionSid;
	public String getNavSid() {
		return navSid;
	}
	public void setNavSid(String navSid) {
		this.navSid = navSid;
	}
	public String getPromotionSid() {
		return promotionSid;
	}
	public void setPromotionSid(String promotionSid) {
		this.promotionSid = promotionSid;
	}
	@Override
	public String toString() {
		return "NavPromotionKey [navSid=" + navSid + ", promotionSid="
				+ promotionSid + "]";
	}
	
	

}
