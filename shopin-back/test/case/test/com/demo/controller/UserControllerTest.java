package test.com.demo.controller;

import static org.junit.Assert.fail;

import org.junit.Test;

import com.framework.testCase.TestUtil;

 /**
 * desc   : 用户表 Controller 测试类
 * author : luxiangxing
 * data   : 2013-04-18
 * email  : xiangxingchina@163.com
 **/
public class UserControllerTest {
	String url = "http://localhost:8080/sys-oracle-demo/user/";

	@Test
	public void testFind() {
		url +="2";
		TestUtil.doGetTest(url,"" );
	}

//	@Test
	public void testQuery() {
		url +="query";
		TestUtil.doPostTest(url,"sid=1&userName=test&password=test&remark=test" );
	}

//	@Test
	public void testInsert() {
		url +="insert";
		TestUtil.doPostTest(url,"userJson={\"sid\":\"1\",\"userName\":\"test\",\"password\":\"test\",\"remark\":\"test\"}" );
	}

//	@Test
	public void testUpdate() {
		url +="update";
		TestUtil.doPostTest(url,"userJson={\"sid\":\"1\",\"userName\":\"test\",\"password\":\"test\",\"remark\":\"test\"}" );
	}

//	@Test
	public void testDelete() {
		url +="delete/1";
		TestUtil.doPostTest(url,"" );
	}

}
