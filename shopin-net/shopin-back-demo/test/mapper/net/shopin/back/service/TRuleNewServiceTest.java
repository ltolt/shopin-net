/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.serviceTRuleNewServiceTest.java
 * @Create By Administrator
 * @Create In 2013-5-28 上午11:20:56
 * TODO
 */
package net.shopin.back.service;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.back.entity.cond.BrandCond;
import net.shopin.back.entity.cond.TRuleNewCond;
import net.shopin.back.entity.po.Brand;
import net.shopin.back.entity.po.TRuleNew;
import net.shopin.back.entity.vo.BrandVO;
import net.shopin.back.entity.vo.TRuleNewVO;
import net.shopin.back.mapper.TRuleNewMapper;

import org.junit.Before;
import org.junit.Test;
import org.springframework.util.Assert;

import com.framework.page.Paginator;
import com.framework.returnObj.Infos;
import com.framework.testCase.AbstractTest;

/**
 * @Class Name TRuleNewServiceTest
 * @Author Administrator
 * @Create In 2013-5-28
 */
public class TRuleNewServiceTest extends AbstractTest{
	ITRuleNewService truleNewService;
	TRuleNewMapper tRuleNewMapper;
	TRuleNewCond cond;
	Infos infos;
	@Before
	public void setUp() throws Exception {
		super.setUp();
		this.truleNewService = context.getBean(ITRuleNewService.class);
	}
	
	//@Test
		public void testFindObjBySid() {
			Assert.notNull(this.truleNewService);

			try {
				TRuleNewVO vo = truleNewService.findObjBySid(infos, 86L);
				System.out.println(vo);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//@Test
		public void testQueryObjsList() throws SQLException {

			cond = new TRuleNewCond();
			Paginator page = null;
			page = truleNewService.queryObjs(infos, cond);
			System.out.println(page);
		}
		@Test
		public void testInsert() throws SQLException {
			Infos infos = new Infos("", "", "", "");
			cond = new TRuleNewCond();
			TRuleNew table = new TRuleNew();

			
			//table.setActiveBeginTime(Date.valueOf("2011-03-23"));
		///	table.setActiveEndTime(Date.valueOf("2011-03-25"));
			table.setRuleName("插入序列22");
			table.setFlag(1);
			

			cond.setTruleNew(table);
			truleNewService.insert(infos, cond);
			
		}
		
		//@Test
		public void testUpdate() throws SQLException {

			cond = new TRuleNewCond();
			TRuleNew table = new TRuleNew();

			table.setSid(84L);
			table.setActiveBeginTime(Date.valueOf("2003-03-23"));
			table.setActiveEndTime(Date.valueOf("2003-03-25"));
			table.setRuleName("shaisai");
			

			cond.setTruleNew(table);
			truleNewService.update(infos, cond);
			System.out.print(cond.getTruleNew().getRuleName());

		}

		//@Test
		public void testDelete() throws SQLException {

			truleNewService.delete(infos, 84L);
		}
		
		//@Test
				public void testFindRule() throws SQLException {

			
			
					List lit = truleNewService.findAllRules();
					System.out.println(lit.getClass().getName());
					System.out.println(lit.size());
					System.out.println("list==="+lit.toString());
					for (Object object : lit) {
						JSONObject obj  = JSONObject.fromObject(object);
						System.out.println(obj.toString());
					}
					String json = JSONArray.fromObject(lit).toString();
					System.out.println("json==="+json);
				}
}
