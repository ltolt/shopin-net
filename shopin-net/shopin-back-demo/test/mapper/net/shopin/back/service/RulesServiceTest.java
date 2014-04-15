/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.serviceRuleChannelServiceTest.java
 * @Create By shiying
 * @Create In 2013-6-19 下午12:39:26
 * TODO
 */
package net.shopin.back.service;

import java.sql.SQLException;
import java.util.List;

import net.sf.json.JSONArray;
import net.shopin.back.view.ChannelsVO;
import net.shopin.wms.service.ITRuelsMqlService;
import net.shopin.wms.util.ChannelsMqlVO;

import org.junit.Before;
import org.junit.Test;

import com.framework.testCase.AbstractTest;

/**
 * @Class Name RuleChannelServiceTest
 * @Author shiying
 * @Create In 2013-6-19
 */
public class RulesServiceTest  extends AbstractTest{
	
	ITRulesService rulesService;
	ITRuelsMqlService rulesMqlService;
	@Before
	public void setUp() throws Exception {
		super.setUp();
		this.rulesService = context.getBean(ITRulesService.class);
		this.rulesMqlService=context.getBean(ITRuelsMqlService.class);
	}
	//@Test
//	public void testQueryObjsList() throws SQLException {
//		String sid = "";
//		
//		List<RulesVO> vo = this.rulesService.queryRulesInfo(sid);
//		JSONArray.fromObject(vo);
//		
//		System.out.println(JSONArray.fromObject(vo));
//	}
//	
	@Test
	public void testfindRules() throws SQLException {
		String sid = "";
		
		List<ChannelsVO> vo = this.rulesService.findRules();
		JSONArray.fromObject(vo);
		
		System.out.println(JSONArray.fromObject(vo));
	}
	/*@Test
	public void testfindChannelRules() throws SQLException {
		List<ChannelsMqlVO> vo = this.rulesMqlService.findRules();
		
		
		System.out.println(JSONArray.fromObject(vo));
	}*/
	
}
