package net.shopin.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ldap.samples.article.dao.PersonDao;
import org.springframework.ldap.samples.article.domain.Person;
import org.springframework.util.Assert;

public class TestLdap extends BaseServiceTest{
	
	
	@Autowired
	protected PersonDao personDao;
	
	protected Person person;
	
	@Test
	public void testCreate(){
		Assert.notNull(this.personDao);
		person = new Person();
		person.setCountry("china");
		person.setCompany("shopin");
	    person.setFullName("kong");
        person.setLastName("kk");
        person
         .setDescription("Sweden, Company1, Some Person");
        person.setPhone("+46 555-123456");
		this.personDao.create(person);
        
	}
	
	
	
	
	
	

}
