/**
 * @Probject Name: spring
 * @Path: net.shopin.domain.Customer.java
 * @Create By kongm
 * @Create In 2013-11-28 下午4:06:19
 * TODO
 */
package net.shopin.domain;

/**
 * @Class Name Customer
 * @Author kongm
 * @Create In 2013-11-28
 */
public class Customer {
	
	private String name;
	private String streetAddress;
	private String city;
	private String postalCode;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStreetAddress() {
		return streetAddress;
	}
	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	
	@Override
	public String toString() {
		return String.format(
				"Customer [name=%s, streetAddress=%s, city=%s, postalCode=%s]",
				name, streetAddress, city, postalCode);
	}
	
	
	

}
