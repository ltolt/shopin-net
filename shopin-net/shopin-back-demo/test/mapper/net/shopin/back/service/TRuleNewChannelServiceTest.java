/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.serviceTRuleNewChannelServiceTest.java
 * @Create By Administrator
 * @Create In 2013-5-28 下午2:27:08
 * TODO
 */
package net.shopin.back.service;

import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.back.entity.cond.TRuleNewChannelCond;
import net.shopin.back.entity.cond.TRuleNewCond;
import net.shopin.back.entity.po.TRuleNew;
import net.shopin.back.entity.po.TRuleNewChannel;
import net.shopin.back.entity.vo.TRuleNewChannelVO;
import net.shopin.back.entity.vo.TRuleNewVO;
import net.shopin.back.service.ITRuleNewChannelService;

import org.junit.Before;
import org.junit.Test;
import org.springframework.util.Assert;

import com.framework.page.Paginator;
import com.framework.returnObj.Infos;
import com.framework.testCase.AbstractTest;

/**
 * @Class Name TRuleNewChannelServiceTest
 * @Author Administrator
 * @Create In 2013-5-28
 */
public class TRuleNewChannelServiceTest  extends AbstractTest{
	ITRuleNewChannelService truleNewChannelService;
	TRuleNewChannelCond cond;
	Infos infos;
	@Before
	public void setUp() throws Exception {
		super.setUp();
		this.truleNewChannelService = context.getBean(ITRuleNewChannelService.class);
	}
	
	@Test
			public void testFindObjBySid() {
				Assert.notNull(this.truleNewChannelService);

				try {
					TRuleNewChannelVO vo = truleNewChannelService.findObjBySid(infos, 98L);
					System.out.println(vo);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
	//@Test
			public void testQueryObjsList() throws SQLException {

				cond = new TRuleNewChannelCond();
				Paginator page = null;
				page = truleNewChannelService.queryObjs(infos, cond);
				System.out.println(page);
			}
			
	//@Test
			public void testInsert() throws SQLException {
				cond = new TRuleNewChannelCond();
				TRuleNewChannel table = new TRuleNewChannel();

			
				table.setChannelName("哈哈哈哈");
			table.setChannelSid(12l);
				table.setRuleSid(86l);
				table.setSeq(12);
				

				cond.setTruleNewChannel(table);
				truleNewChannelService.insert(infos, cond);
				System.out.println(cond.getTruleNewChannel().getSid());
			}
			
	//@Test
			public void testUpdate() throws SQLException {

				cond = new TRuleNewChannelCond();
				TRuleNewChannel table = new TRuleNewChannel();

				table.setSid(113L);
				table.setChannelName("户外");
				table.setRuleSid(11111L);
				table.setChannelSid(21212l);
				
				

				cond.setTruleNewChannel(table);
				truleNewChannelService.update(infos, cond);
				System.out.print(cond.getTruleNewChannel().getRuleSid());

			}

	//@Test
			public void testDelete() throws SQLException {

				truleNewChannelService.delete(infos, 113L);
			}
			
		//@Test
			public void testfindChannels() throws SQLException {
				List<TRuleNewChannelVO> list = new ArrayList<TRuleNewChannelVO>();
				list = truleNewChannelService.findChannels();
				System.out.println(list);
		
			}
			
		//	@Test
			public void testfindRuleSid() throws SQLException {
				List<TRuleNewChannelVO> list = new ArrayList<TRuleNewChannelVO>();
				list = truleNewChannelService.findRuleSid(1);
				System.out.println(list);
		
			}

		//	@Test
			public void testfindObjByRuleSid() throws SQLException {
				List<TRuleNewChannelVO> list = new ArrayList<TRuleNewChannelVO>();
				list = truleNewChannelService.findObjByRuleSid(88);
				System.out.println(list);
		
			}
}
