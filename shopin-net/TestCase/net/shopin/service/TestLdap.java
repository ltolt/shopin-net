package net.shopin.service;

import javax.naming.Name;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ldap.core.DirContextAdapter;
import org.springframework.ldap.core.DistinguishedName;
import org.springframework.ldap.core.LdapTemplate;
import org.springframework.ldap.samples.article.dao.PersonDao;
import org.springframework.ldap.samples.article.domain.Person;
import org.springframework.util.Assert;

public class TestLdap extends BaseServiceTest{
	
	protected static Log log = LogFactory.getLog("service");
	
	@Autowired
	protected PersonDao personDao;
	
	protected Person person;

	@Autowired
	protected LdapTemplate ldapTemplate;
	
	//@Test
	public void test(){
		Assert.notNull(this.ldapTemplate);
		Object obj = ldapTemplate.lookup("ou=People,dc=maxcrc,dc=com");
		System.out.println(obj);
	}
	
	
	/**
	 * 
	 */
	@Test
	public void testLdif(){
		DistinguishedName dn = new DistinguishedName();
//		dn.add("dc","com");
//		dn.add("dc","maxcrc");
		//dn.add("cn","Manager");
		dn.add("ou","mem");
		dn.add("uid","kongm");
		//log.info(dn.toString());
		System.out.println(dn.toString());
		DirContextAdapter context = new DirContextAdapter(dn);
		context.setAttributeValues("objectClass",new String[]{"person","organizationalPerson","inetOrgPerson"});
		context.setAttributeValue("ou","mem");
		context.setAttributeValue("cn", "kongm");
		context.setAttributeValue("sn","kongm");
		context.setAttributeValue("uid", "kongm");
		context.setAttributeValue("description", "everyone in organisation");
		ldapTemplate.bind(dn, context, null);
	}
	
	
	
	
	//@Test
	public void testOU(){
		DistinguishedName dn = new DistinguishedName();
		dn.add("dc","com");
		dn.add("dc","maxcrc");
		dn.add("ou","people");
		dn.add("cn","kong");
		DirContextAdapter context = new DirContextAdapter(dn);
		context.setAttributeValues("objectclass", new String[] { "top"});
		context.setAttributeValue("cn", "kk");
		//context.setAttributeValue("sn", person.getLastName());
		context.setAttributeValue("description", "fsfsaf");
		//context.setAttributeValue("telephoneNumber", person.getPhone());
		
		ldapTemplate.bind(dn, context, null);
	}
	
	
	//@Test
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
