package TestCase.ldap;

import org.springframework.ldap.samples.article.dao.PersonDao;
import org.springframework.ldap.samples.article.domain.Person;
import org.springframework.test.AbstractDependencyInjectionSpringContextTests;

/**
 * abstract base class for PersonDao integration tests.
 * @author k
 *
 */
@SuppressWarnings("deprecation")
public class AbstractPersonDaoIntegrationTest
   extends AbstractDependencyInjectionSpringContextTests
{
	
	protected Person person;
	
	protected PersonDao personDao;

	@Override
	protected String[] getConfigLocations() {
		return new String[]{"applicationContext_ldap.xml"};
	}

	@Override
	protected void onSetUp() throws Exception {
		super.onSetUp();
		person = new Person();
		person.setCountry("china");
		person.setCompany("shopin");
	 person.setFullName("Some Person");
      person.setLastName("Person");
      person
         .setDescription("Sweden, Company1, Some Person");
      person.setPhone("+46 555-123456");
		
	}
	
	@Override
	protected void onTearDown() throws Exception {
	      super.onTearDown();
	      person = null;
	      personDao = null;
	   }
	
	public void testCreate(){
		personDao.create(person);
		
	}
	
	
	
	
	
	

}
