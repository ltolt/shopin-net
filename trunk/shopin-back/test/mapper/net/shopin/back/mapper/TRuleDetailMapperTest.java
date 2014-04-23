/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.mapperTRuleDetailMapperTest.java
 * @Create By shiying
 * @Create In 2013-6-24 下午3:26:37
 * TODO
 */
package net.shopin.back.mapper;

import java.sql.SQLException;
import java.util.List;

import net.shopin.back.entity.cond.TRuleDetailCond;
import net.shopin.back.entity.po.TRuleDetail;
import net.shopin.back.entity.vo.TRuleDetailVO;
import net.shopin.back.mapper.TRuleDetailMapper;

import org.junit.Before;
import org.junit.Test;
import org.springframework.util.Assert;

import com.framework.testCase.AbstractTest;

/**
 * @Class Name TRuleDetailMapperTest
 * @Author shiying
 * @Create In 2013-6-24
 */
public class TRuleDetailMapperTest extends AbstractTest{
	
	TRuleDetailMapper truleDetailMapper;
	
	@Before
	public void setUp() throws Exception {
		super.setUp();
		this.truleDetailMapper = context.getBean(TRuleDetailMapper.class);
		Assert.notNull(truleDetailMapper, "mapper can not be null");
	}
	
	//@Test
	public void testFindObjBySid() {
		try {
			TRuleDetailVO vo = truleDetailMapper.findObjBySid(46L);
			System.out.print(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//@Test
	public void testFindObjByRuleSid() throws SQLException {
		List<TRuleDetailVO> vo = truleDetailMapper.findObjByRuleSid(89);
		System.out.print(vo.toString());
	}
	//@Test
	public void testQueryObjsList() {
		Assert.notNull(this.truleDetailMapper);
		TRuleDetailCond cond = new TRuleDetailCond();
		cond.setSid(2500L);
		cond.setStartRecords(0);
		cond.setEndRecords(10);
		try {
			List list = this.truleDetailMapper.queryObjsList(cond);
			System.out.print(list.size());
			System.out.print(list.toString());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	//@Test
	public void testQueryObjsCount() {
		TRuleDetailCond cond = new TRuleDetailCond();
		cond.setSid(2500L);
		

		try {
			Integer num = truleDetailMapper.queryObjsCount(cond);
			System.out.println("num - " + num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
  @Test
	public void testInsert() {
		TRuleDetailCond cond = new TRuleDetailCond();
		TRuleDetail truleDetail = new TRuleDetail();
	
		truleDetail.setBrandName("耐克王子");
		truleDetail.setBrandSid(107L);
		truleDetail.setRuleSid(86L);
		truleDetail.setOffMax(0.1);
		cond.setTruleDetail(truleDetail);
		try {
			truleDetailMapper.insert(cond.getTruleDetail());
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// @Test
	public void testUpdate() {
		TRuleDetailCond cond = new TRuleDetailCond();
		TRuleDetail truleDetail = new TRuleDetail();
		truleDetail.setSid(141L);
		truleDetail.setRuleSid(89L);
		cond.setTruleDetail(truleDetail);
		try {
			truleDetailMapper.update(cond.getTruleDetail());
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// @Test
		public void testDelete() {
			try {
				truleDetailMapper.delete(1L);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

}
