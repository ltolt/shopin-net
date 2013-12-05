/**
 * @Probject Name: spring
 * @Path: net.shopin.persistence.domain.fixture.JPAAssertions.java
 * @Create By kongm
 * @Create In 2013-12-5 上午10:46:40
 * TODO
 */
package net.shopin.persistence.domain.fixture;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.persistence.EntityManager;

import junit.framework.TestCase;

import org.hibernate.Session;
import org.hibernate.internal.SessionImpl;
import org.hibernate.jdbc.Work;

/**
 * @Class Name JPAAssertions
 * @Author kongm
 * @Create In 2013-12-5
 */
public class JPAAssertions {
	
	static class ResultCollector{
		public boolean found = false;
	}
	
	
	public static void assertTableHasColumn(EntityManager manager,final String tableName, final String columnName){
		SessionImpl session = (SessionImpl) manager.unwrap(Session.class);
		final ResultCollector rc = new ResultCollector();
		session.doWork(new Work() {
			
			@Override
			public void execute(Connection connection) throws SQLException {
				ResultSet columns = connection.getMetaData().getColumns(null, null, tableName.toUpperCase(),null);
				while(columns.next()){
					if(columns.getString(4).toUpperCase().equals(columnName.toUpperCase())){
						rc.found = true;
					}
				}
			}
		});
		if(!rc.found){
			TestCase.fail("Column [" + columnName + "] not found on table " + tableName);
		}
	}
	
	public static void assertTableExists(EntityManager manager,final String name){
		SessionImpl session = (SessionImpl) manager.unwrap(Session.class);
		final ResultCollector rc = new ResultCollector();
		session.doWork(new Work() {
			
			@Override
			public void execute(Connection c) throws SQLException {
				ResultSet tables = c.getMetaData().getTables(null, null, "%", null);
				while(tables.next()){
					if(tables.getString(3).toUpperCase().equals(name.toUpperCase())){
						rc.found = true;
					}
				}
			}
		});
		if(!rc.found){
			TestCase.fail("Table not found in the schema " + name);
		}
	}
	
}
