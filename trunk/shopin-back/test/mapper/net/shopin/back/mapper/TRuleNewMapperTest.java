/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.mapperTRuleNewMapperTest.java
 * @Create By Administrator
 * @Create In 2013-5-27 下午7:57:32
 * TODO
 */
package net.shopin.back.mapper;



import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import net.shopin.back.entity.cond.TRuleNewCond;
import net.shopin.back.entity.po.TRuleNew;
import net.shopin.back.entity.vo.TRuleNewVO;

import org.junit.Before;
import org.junit.Test;
import org.springframework.util.Assert;

import com.framework.testCase.AbstractTest;

/**
 * @Class Name TRuleNewMapperTest
 * @Author shiying
 * @Create In 2013-5-27
 */
public class TRuleNewMapperTest extends AbstractTest{
	TRuleNewMapper truleNewMapper;
	@Before
	public void setUp() throws Exception {
		super.setUp();
		this.truleNewMapper = context.getBean(TRuleNewMapper.class);
		Assert.notNull(truleNewMapper, "mapper can not be null");
	}
	
	
    // @Test
		public void testFindObjBySid() {
			try {
				TRuleNewVO vo = truleNewMapper.findObjBySid(86L);
				System.out.print(vo);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
     
     @Test
		public void testfindAllRules() throws SQLException {
			List<TRuleNewVO> vo = truleNewMapper.findAllRules();
			System.out.print(vo);
		}
	//	@Test
		public void testQueryObjsList() {
			Assert.notNull(this.truleNewMapper);
			TRuleNewCond cond = new TRuleNewCond();
			cond.setSid(86L);
			cond.setStartRecords(0);
			cond.setEndRecords(10);
			try {
				List list = this.truleNewMapper.queryObjsList(cond);
				System.out.print(list.size());
				System.out.print(list.toString());
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	//	@Test
		public void testQueryObjsCount() {
			TRuleNewCond cond = new TRuleNewCond();
			cond.setSid(145L);
			

			try {
				Integer num = truleNewMapper.queryObjsCount(cond);
				System.out.println("num - " + num);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	@Test
		public void testInsert() {
			TRuleNewCond cond = new TRuleNewCond();
			TRuleNew truleNew = new TRuleNew();
			
			truleNew.setActiveEndTime(Date.valueOf("2012-03-03"));
			truleNew.setRuleName("新规则");
			truleNew.setActiveBeginTime(Date.valueOf("2012-02-03"));
			truleNew.setCreateTime(Date.valueOf("2012-02-03"));
			truleNew.setFlag(1);
//			truleNew.setCreateUser("shiying");
//			truleNew.setUpdateTime(Date.valueOf("2012-02-03"));
//			truleNew.setUpdateUser("shiying");
            
			cond.setTruleNew(truleNew);
			try {
				truleNewMapper.insert(cond.getTruleNew());
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		// @Test
		public void testUpdate() {
			TRuleNewCond cond = new TRuleNewCond();
			TRuleNew truleNew = new TRuleNew();
			truleNew.setSid(84L);
			truleNew.setRuleName("哈哈哈");
			truleNew.setActiveBeginTime(Date.valueOf("2001-09-09"));
			
			
			cond.setTruleNew(truleNew);
			try {
				truleNewMapper.update(cond.getTruleNew());
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		// @Test
			public void testDelete() {
				try {
					truleNewMapper.delete(85L);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			@Test
			public void test2() {
				
				List list = this.truleNewMapper.findAllRules();
				System.out.println(list.toString());
			}
}
