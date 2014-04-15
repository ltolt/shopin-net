/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.mapperProBestDetailMapperTest.java
 * @Create By shiying
 * @Create In 2013-5-13 上午11:43:40
 * TODO
 */
package net.shopin.back.mapper;

import java.sql.SQLException;
import java.util.List;

import net.shopin.back.entity.cond.ProBestDetailCond;
import net.shopin.back.entity.po.ProBestDetail;
import net.shopin.back.entity.vo.ProBestDetailVO;

import org.junit.Before;
import org.junit.Test;
import org.springframework.util.Assert;

import com.framework.testCase.AbstractTest;

/**
 * @Class Name ProBestDetailMapperTest
 * @Author shiying
 * @Create In 2013-5-13
 */
public class ProBestDetailMapperTest extends AbstractTest {

	ProBestDetailMapper proBestDetailMapper;

	@Before
	public void setUp() throws Exception {
		super.setUp();
		this.proBestDetailMapper = context.getBean(ProBestDetailMapper.class);
		Assert.notNull(proBestDetailMapper, "mapper can not be null");
	}
	//@Test
	public void testQuery(){
		List list = this.proBestDetailMapper.queryProductsByPsid(10833l);
		System.out.println(list);
	}
	
	
	//@Test
	public void test3(){
		Integer i =  this.proBestDetailMapper.queryMaxOrderNum(35134l);
		System.out.println(i);
	}
	
	
	
	//@Test
	public void test4(){
		List list =  this.proBestDetailMapper.queryProductsByPsid(Long.valueOf(14412));
	}

	//@Test
	public void test1() {

		List list = this.proBestDetailMapper.queryProductsByPsid(Long
				.valueOf(10436));

		System.out.println(list);
		System.out.println(list.size());
	}

@Test
	public void test2() {
		ProBestDetailCond cond = new ProBestDetailCond();
		cond.setPageLayoutSid(14407);
		cond.setProductListSid(1724121);
		ProBestDetailVO vo = this.proBestDetailMapper.queryOrderNumber(cond);
		System.out.println(vo);
	}

	// @Test
	public void testFindObjBySid() {
		Assert.notNull(this.proBestDetailMapper);
		try {
			ProBestDetailVO vo = this.proBestDetailMapper.findObjBySid(34430L);
			System.out.println(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// @Test
	public void testQueryObjsList() {
		Assert.notNull(this.proBestDetailMapper);
		try {
			ProBestDetailCond cond = new ProBestDetailCond();
			Integer num = proBestDetailMapper.queryObjsCount(cond);
			cond.setPageLayoutSid(10749);
			// cond.setProductListSid(85395);
			// cond.setOrderNumber(34430);
			cond.setTotalRecordsBuild(num);
			List list = this.proBestDetailMapper.queryObjsList(cond);
			System.out.println(list.toString());
			System.out.println("num=" + num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// @Test
	public void queryObjsCount() {
		Assert.notNull(this.proBestDetailMapper);
		try {

			ProBestDetailCond cond = new ProBestDetailCond();
			cond.setPageLayoutSid(10749);
			cond.setProductListSid(85395);
			cond.setOrderNumber(34430);

			Integer num = proBestDetailMapper.queryObjsCount(cond);

			System.out.println("num=" + num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// @Test
	public void testInsert() {
		ProBestDetailCond cond = new ProBestDetailCond();
		ProBestDetail record = new ProBestDetail();
		record.setPageLayoutSid(123123);
		record.setProductListSid(312312);
		record.setOrderNumber(21312);
		cond.setProBestDetail(record);

		try {
			this.proBestDetailMapper.insert(cond.getProBestDetail());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// @Test
	public void testUpdate() {
		ProBestDetailCond cond = new ProBestDetailCond();
		ProBestDetail record = new ProBestDetail();
		// record.setPageLayoutSid(121212);
		record.setProductListSid(22222);
		record.setOrderNumber(6);
		record.setSid(707732L);
		cond.setProBestDetail(record);
		try {
			this.proBestDetailMapper.update(cond.getProBestDetail());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// @Test
	public void testDelete() {
		try {
			this.proBestDetailMapper.delete(707732L);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// @Test
	public void testDeleteProductList() {

		ProBestDetail proBestDetail = new ProBestDetail();

		proBestDetail.setProductListSid(1392232);
		proBestDetail.setPageLayoutSid(10953);
		this.proBestDetailMapper.deleteByProductListSid(proBestDetail);

	}

}
