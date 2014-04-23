/**
 * @Probject Name: shopin-back-demo
 * @Path: test.com.demo.controllerProConSearchControllerTest.java
 * @Create By kongm
 * @Create In 2013-5-10 下午2:32:10
 * TODO
 */
package test.com.demo.controller;

import org.junit.Test;

import com.framework.testCase.TestUtil;

/**
 * @Class Name ProConSearchControllerTest
 * @Author kongm
 * @Create In 2013-5-10
 */
public class ProConSearchControllerTest {
	
	String url =  "http://localhost:8080/mw/pcs/";
	
	@Test
	public void testSearch(){
		
		
	}
	
	
	//@Test
	public void testFind(){
		url += "25181";
		TestUtil.doGetTest(url, "");
	}
	
	//@Test
	public void testQuery(){
		url += "query";
		TestUtil.doPostTest(url, "offMin=0.2&startRecords=1&endRecords=10");
	}
	
	//@Test
	public void testInsert(){
		url += "insert";
		TestUtil.doPostTest(url, "proConSearchJson={\"proSku\":\"testskusku\"}");
	}
	
	//@Test
	public void testUpdate(){
		url += "update";
		TestUtil.doPostTest(url, "proConSearchJson={\"sid\":\"25227\", \"proSku\":\"testskusku\"}");
	}
	
	
	//@Test
	public void testDelete(){
		url += "delete/25227";
		TestUtil.doPostTest(url, "");
	}
	
	
	
	
	
	

}
