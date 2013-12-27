/**
 * @Probject Name: Algorithm
 * @Path: net.shopin.common.OracleJdbcTest.java
 * @Create By kongm
 * @Create In 2013-12-26 下午9:52:08
 * TODO
 */
package net.shopin.common;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/**
 * @Class Name OracleJdbcTest
 * @Author kongm
 * @Create In 2013-12-26
 */
public class OracleJdbcTest {
	
	String driverClass = "oracle.jdbc.driver.OracleDriver";
	
	Connection con;
	
	public void init() throws ClassNotFoundException, SQLException, FileNotFoundException, IOException  
    {  
        Properties props = new Properties();  
//        props.load(fs);  
//        String url = props.getProperty("db.url");
        String url = "172.16.100.27";
//        String userName = props.getProperty("db.user");
        String userName = "spwg_0408";
//        String password = props.getProperty("db.password");
        String password = "spwg_0408";
        Class.forName(driverClass);  
  
        con=DriverManager.getConnection(url, userName, password);  
    }

	
	public void fetch() throws SQLException, IOException  
    {  
        PreparedStatement ps = con.prepareStatement("select SYSDATE from dual");  
        ResultSet rs = ps.executeQuery();  
  
        while (rs.next())  
        {  
            // do the thing you do  
        }  
        rs.close();  
        ps.close();  
    } 
	
	
	/**
	 * @Methods Name main
	 * @Create In 2013-12-26 By kongm
	 * @param args void
	 * @throws IOException 
	 * @throws SQLException 
	 * @throws ClassNotFoundException 
	 * @throws FileNotFoundException 
	 */
	public static void main(String[] args) throws FileNotFoundException, ClassNotFoundException, SQLException, IOException {
		OracleJdbcTest test = new OracleJdbcTest();
		test.init();
		test.fetch();
	}

}
