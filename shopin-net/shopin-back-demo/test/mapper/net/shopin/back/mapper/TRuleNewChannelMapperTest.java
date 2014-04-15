/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.mapperTRuleNewChannelMapperTest.java
 * @Create By shiying
 * @Create In 2013-5-28 下午1:56:56
 * TODO
 */
package net.shopin.back.mapper;

import java.sql.SQLException;
import java.util.List;

import net.shopin.back.entity.cond.TRuleNewChannelCond;
import net.shopin.back.entity.po.TRuleNewChannel;
import net.shopin.back.entity.vo.TRuleNewChannelVO;

import org.junit.Before;
import org.junit.Test;
import org.springframework.util.Assert;

import com.framework.testCase.AbstractTest;

/**
 * @Class Name TRuleNewChannelMapperTest
 * @Author shiying
 * @Create In 2013-5-28
 */
public class TRuleNewChannelMapperTest extends AbstractTest {
	
	TRuleNewChannelMapper truleNewChannelMapper;
	
	@Before
	public void setUp() throws Exception {
		super.setUp();
		this.truleNewChannelMapper = context.getBean(TRuleNewChannelMapper.class);
		Assert.notNull(truleNewChannelMapper, "mapper can not be null");
	}
	
//	@Test
			public void testFindObjBySid() {
				try {
					TRuleNewChannelVO vo = truleNewChannelMapper.findObjBySid(46L);
					System.out.print(vo);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			//@Test
			public void testFindObjByRuleSid() throws SQLException {
				List<TRuleNewChannelVO> vo = truleNewChannelMapper.findObjByRuleSid(47);
				System.out.print(vo);
			}
			
//			@Test
			public void findChannels() throws SQLException {
				List<TRuleNewChannelVO> list = truleNewChannelMapper.findChannels();
				System.out.println(list);
				for(int i =0;i<list.size();i++){
					TRuleNewChannelVO vo = new TRuleNewChannelVO();
					vo=list.get(i);
					vo.setChannelSid(list.get(i).getChannelSid());
					vo.setChannelName(list.get(i).getChannelName());
					System.out.print(vo.getChannelName());
					System.out.print(vo.getChannelSid());
				}
				
			}
			
			@Test
			public void findRuleSid() throws SQLException {
				List<TRuleNewChannelVO> vo = truleNewChannelMapper.findRuleSid(1);
				System.out.print(vo);
			}
			//@Test
			public void testQueryObjsList() {
				Assert.notNull(this.truleNewChannelMapper);
				TRuleNewChannelCond cond = new TRuleNewChannelCond();
				cond.setSid(2500L);
				cond.setStartRecords(0);
				cond.setEndRecords(10);
				try {
					List list = this.truleNewChannelMapper.queryObjsList(cond);
					System.out.print(list.size());
					System.out.print(list.toString());
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			//@Test
			public void testQueryObjsCount() {
				TRuleNewChannelCond cond = new TRuleNewChannelCond();
				cond.setSid(2500L);
				

				try {
					Integer num = truleNewChannelMapper.queryObjsCount(cond);
					System.out.println("num - " + num);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		@Test
			public void testInsert() {
				TRuleNewChannelCond cond = new TRuleNewChannelCond();
				TRuleNewChannel truleNewChannel = new TRuleNewChannel();
			
				truleNewChannel.setChannelName("天猫");
				truleNewChannel.setChannelSid(2L);
				truleNewChannel.setRuleSid(99L);
				truleNewChannel.setSeq(1);
	            
				cond.setTruleNewChannel(truleNewChannel);
				try {
					truleNewChannelMapper.insert(cond.getTruleNewChannel());
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			// @Test
			public void testUpdate() {
				TRuleNewChannelCond cond = new TRuleNewChannelCond();
				TRuleNewChannel truleNewChannel = new TRuleNewChannel();
				truleNewChannel.setSid(111L);
				truleNewChannel.setChannelName("当当");
				cond.setTruleNewChannel(truleNewChannel);
				try {
					truleNewChannelMapper.update(cond.getTruleNewChannel());
					System.out.print(truleNewChannel.getRuleSid());
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			 //@Test
				public void testDelete() {
					try {
						truleNewChannelMapper.delete(2500L);
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}

}
