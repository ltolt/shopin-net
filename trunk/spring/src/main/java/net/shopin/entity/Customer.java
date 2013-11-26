/**
 * @Probject Name: spring
 * @Path: net.shopin.entity.Customer.java
 * @Create By kongm
 * @Create In 2013-11-26 上午11:11:41
 * TODO
 */
package net.shopin.entity;

/**
 * @Class Name Customer
 * @Author kongm
 * @Create In 2013-11-26
 */
public class Customer {
	
	private long id;
	private String firstName,lastName;
	
	 public Customer(long id, String firstName, String lastName) {
	        this.id = id;
	        this.firstName = firstName;
	        this.lastName = lastName;
	 }

	 
	 
	public long getId() {
		return id;
	}



	public void setId(long id) {
		this.id = id;
	}



	public String getFirstName() {
		return firstName;
	}



	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}



	public String getLastName() {
		return lastName;
	}



	public void setLastName(String lastName) {
		this.lastName = lastName;
	}



	@Override
	public String toString() {
		return String.format("Customer [id=%s, firstName=%s, lastName=%s]", id,
				firstName, lastName);
	}
	 
	 


}
