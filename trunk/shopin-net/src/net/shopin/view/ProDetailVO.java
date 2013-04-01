package net.shopin.view;

import java.io.Serializable;

/**
 * 商品明细view
 * @author k
 *
 */
public class ProDetailVO implements Serializable
{
	    private String sid;       //商品明细sid
	    private String proSku;
	    private String proDesc;
	    private String productName;
	    private String proBrand;
	    public String getSid() {
			return sid;
		}
		public void setSid(String sid) {
			this.sid = sid;
		}
		public String getProSku() {
			return proSku;
		}
		public void setProSku(String proSku) {
			this.proSku = proSku;
		}
		public String getProDesc() {
			return proDesc;
		}
		public void setProDesc(String proDesc) {
			this.proDesc = proDesc;
		}
		public String getProductName() {
			return productName;
		}
		public void setProductName(String productName) {
			this.productName = productName;
		}
		public String getProBrand() {
			return proBrand;
		}
		public void setProBrand(String proBrand) {
			this.proBrand = proBrand;
		}
		public String getProStan() {
			return proStan;
		}
		public void setProStan(String proStan) {
			this.proStan = proStan;
		}
		public String getProColor() {
			return proColor;
		}
		public void setProColor(String proColor) {
			this.proColor = proColor;
		}
		private String proStan; //尺码
	    private String proColor; //色码
	    
	    
		@Override
		public String toString() {
			return "ProDetailVO [sid=" + sid + ", proSku=" + proSku
					+ ", proDesc=" + proDesc + ", productName=" + productName
					+ ", proBrand=" + proBrand + ", proStan=" + proStan
					+ ", proColor=" + proColor + "]";
		}
	
	
	
	
	
	

}
