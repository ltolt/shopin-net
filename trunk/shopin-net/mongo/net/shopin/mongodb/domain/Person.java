package net.shopin.mongodb.domain;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Person {

	@Id
	private String id;
	
	private String name;
	
	private int age;
	
	private List<Account> accounts = new ArrayList<Account>();

	public Person() {
	}
	
	
	

	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}




	public Person(String id, String name, int age, List<Account> accounts) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.accounts = accounts;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public List<Account> getAccounts() {
		return accounts;
	}

	public void setAccounts(List<Account> accounts) {
		this.accounts = accounts;
	}

	@Override
	public String toString() {
		return "Person [id=" + id + ", name=" + name + ", age=" + age
				+ ", accounts=" + accounts + "]";
	}
	

	
	
	
	
	
}
