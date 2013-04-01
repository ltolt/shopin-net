package net.shopin.mongodb;

import java.util.List;

import net.shopin.mongodb.domain.Account;
import net.shopin.mongodb.domain.Person;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.stereotype.Repository;

/**
 * @author Administrator
 *
 */
@Repository
public class HelloMongo {

	@Autowired
	private MongoOperations mongoOperations;
	
	
	public void run(){
		if(mongoOperations.collectionExists(Person.class)){
			mongoOperations.dropCollection(Person.class);
		}
		
		mongoOperations.createCollection(Person.class);
		Person p = new Person("kongming",22);
		Account a = new Account("1234-59873-893-1",Account.Type.Saving,123.45D);
		p.getAccounts().add(a);
		
		mongoOperations.insert(p);
		
		List<Person> results = mongoOperations.findAll(Person.class);
		System.out.println("Results : " + results);
		
	}
	
	
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
