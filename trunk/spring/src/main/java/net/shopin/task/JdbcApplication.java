/**
 * @Probject Name: spring
 * @Path: net.shopin.task.JdbcApplication.java
 * @Create By kongm
 * @Create In 2013-11-26 上午11:27:17
 * TODO
 */
package net.shopin.task;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import net.shopin.entity.Customer;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.SimpleDriverDataSource;

/**
 * @Class Name JdbcApplication
 * @Author kongm
 * @Create In 2013-11-26
 */
public class JdbcApplication {

	/**
	 * @Methods Name main
	 * @Create In 2013-11-26 By kongm
	 * @param args void
	 */
	public static void main(String[] args) {
		//simple ds for test(not for production!)
		SimpleDriverDataSource dataSource = new SimpleDriverDataSource();
		dataSource.setDriverClass(org.h2.Driver.class);
		dataSource.setUsername("sa");
		dataSource.setUrl("jdbc:h2:mem");
		dataSource.setPassword("");
		JdbcTemplate jdbcTemplate = new JdbcTemplate(dataSource);
		System.out.println("creating tables");
		jdbcTemplate.execute("drop table customers if exists");
		jdbcTemplate.execute("create table customers(" +
                "id serial, first_name varchar(255), last_name varchar(255))");
		String[] names = "John Woo;Jeff Dean;Josh Bloch;Josh Long".split(";");
		for(String fullname : names){
			String[] name = fullname.split(" ");
			System.out.printf("Inserting customer record for %s %s \n",name[0],name[1]);
			jdbcTemplate.update("INSERT INTO customers(first_name,last_name) values(?,?)",name[0],name[1]);
		}
		System.out.println("Querying for customer records where first_name = 'Josh':");
		List<Customer> results = jdbcTemplate.query("select * from customers where first_name = ?", new Object[]{"Josh"},
				new RowMapper<Customer>(){
			
			public Customer mapRow(ResultSet rs, int rowNUm)
					throws SQLException {
				
				return new Customer(rs.getLong("id"), rs.getString("first_name"), rs.getString("last_name"));
			}
			
		}); 
		
		for(Customer customer : results){
			System.out.println(customer);
		}
		
	}

}
