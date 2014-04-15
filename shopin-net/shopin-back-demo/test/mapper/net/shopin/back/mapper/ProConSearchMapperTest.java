/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.mapperProConSearchMapperTest.java
 * @Create By kongm
 * @Create In 2013-5-9 下午4:53:38
 * TODO
 */
package net.shopin.back.mapper;

import java.sql.SQLException;
import java.util.List;

import net.shopin.back.entity.cond.ProConSearchCond;
import net.shopin.back.entity.po.ProConSearch;
import net.shopin.back.entity.vo.ProConSearchVO;

import org.junit.Before;
import org.junit.Test;
import org.springframework.util.Assert;

import com.framework.testCase.AbstractTest;

/**
 * @Class Name ProConSearchMapperTest
 * @Author kongm
 * @Create In 2013-5-9
 */
public class ProConSearchMapperTest extends AbstractTest{
	
	ProConSearchMapper proConSearchMapper;
	
	@Before
	public void setUp() throws Exception{
		super.setUp();
		this.proConSearchMapper = context.getBean(ProConSearchMapper.class);
		Assert.notNull(proConSearchMapper,"mapper can not be null");
	}
	
	//@Test
	public void testFindObjBySid(){
		Assert.notNull(this.proConSearchMapper);
		try {
			ProConSearchVO vo =  this.proConSearchMapper.findObjBySid(14999L);
			System.out.println(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//@Test
	public void testQueryObjsList(){
		Assert.notNull(this.proConSearchMapper);
		ProConSearchCond cond = new ProConSearchCond();
		cond.setOffMin(0.2);
		cond.setStartRecords(0);
		cond.setEndRecords(10);
		try {
			List list = this.proConSearchMapper.queryObjsList(cond);
			System.out.println(list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	//@Test
	public void testQueryObjsCount(){
		ProConSearchCond cond = new ProConSearchCond();
		cond.setOffMin(0.2);
		try {
			Integer i =  this.proConSearchMapper.queryObjsCount(cond);
			System.out.println(i);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	@Test
	public void testInsert(){
		ProConSearchCond cond = new ProConSearchCond();
		ProConSearch record = new ProConSearch();
		record.setProSku("111");
		//record.setSid(25099L);
		cond.setProConSearch(record);
		try {
			this.proConSearchMapper.insert(cond.getProConSearch());
			System.out.print(cond.getSid());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//@Test
	public void testUpdate(){
		ProConSearchCond cond = new ProConSearchCond();
		ProConSearch record = new ProConSearch();
		record.setProSku("test");
		record.setProEndTime(new java.util.Date());
		record.setSid(25219L);
		cond.setProConSearch(record);
		try {
			this.proConSearchMapper.update(cond.getProConSearch());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	@Test
	public void testDelete(){
		try {
			this.proConSearchMapper.delete(25218L);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	

}
