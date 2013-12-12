/**
 * @Probject Name: web-spring
 * @Path: net.shopin.web.domain.CustomerInfo.java
 * @Create By kongm
 * @Create In 2013-12-11 下午4:49:51
 * TODO
 */
package net.shopin.web.domain;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * @Class Name CustomerInfo
 * @Author kongm
 * @Create In 2013-12-11
 */
public class CustomerInfo implements Serializable {
	
	@NotNull
	@NotEmpty
	private String name;
	
	@NotNull
	@NotEmpty
	private String address1;
	
	@NotNull
	@NotEmpty
	private String postcode;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	
	
	
}
