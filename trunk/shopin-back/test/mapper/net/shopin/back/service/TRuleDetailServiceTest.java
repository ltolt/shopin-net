/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.serviceTRuleDetailServiceTest.java
 * @Create By Administrator
 * @Create In 2013-6-24 下午4:06:15
 * TODO
 */
package net.shopin.back.service;

import java.sql.SQLException;

import net.shopin.back.entity.cond.TRuleDetailCond;
import net.shopin.back.entity.po.TRuleDetail;
import net.shopin.back.entity.vo.TRuleDetailVO;

import org.junit.Before;
import org.junit.Test;
import org.springframework.util.Assert;

import com.framework.page.Paginator;
import com.framework.returnObj.Infos;
import com.framework.testCase.AbstractTest;

/**
 * @Class Name TRuleDetailServiceTest
 * @Author Administrator
 * @Create In 2013-6-24
 */
public class TRuleDetailServiceTest  extends AbstractTest{
	ITRuleDetailService truleDetailService;
	TRuleDetailCond cond;
	Infos infos;
	@Before
	public void setUp() throws Exception {
		super.setUp();
		this.truleDetailService = context.getBean(ITRuleDetailService.class);
	}
	
	//@Test
			public void testFindObjBySid() {
				Assert.notNull(this.truleDetailService);

				try {
					TRuleDetailVO vo = truleDetailService.findObjBySid(infos, 111L);
					System.out.println(vo);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
	//@Test
			public void testQueryObjsList() throws SQLException {

				cond = new TRuleDetailCond();
				Paginator page = null;
				page = truleDetailService.queryObjs(infos, cond);
				System.out.println(page);
			}
			
	//@Test
			public void testInsert() throws SQLException {
				cond = new TRuleDetailCond();
				TRuleDetail table = new TRuleDetail();

			
				
				table.setRuleSid(86l);
				table.setBrandName("NIKE");
				table.setProductClassName("上衣");
				
				

				cond.setTruleDetail(table);
				truleDetailService.insert(infos, cond);
				System.out.println(cond.getTruleDetail().getSid());
			}
			
	//@Test
			public void testUpdate() throws SQLException {

				cond = new TRuleDetailCond();
				TRuleDetail table = new TRuleDetail();

				table.setSid(142L);
				
				table.setRuleSid(11111L);
				
				
				

				cond.setTruleDetail(table);
				truleDetailService.update(infos, cond);
				System.out.print(cond.getTruleDetail().getRuleSid());

			}

	@Test
			public void testDelete() throws SQLException {

				truleDetailService.delete(infos, 113L);
			}

}
