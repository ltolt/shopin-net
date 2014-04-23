/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.serviceProBestDetailServiceTest.java
 * @Create By shiying
 * @Create In 2013-5-13 下午4:17:32
 * TODO
 */
package net.shopin.back.service;

import java.sql.SQLException;
import java.util.List;

import net.shopin.back.entity.cond.ProBestDetailCond;
import net.shopin.back.entity.cond.ProBestDetailCond;
import net.shopin.back.entity.po.ProBestDetail;
import net.shopin.back.entity.vo.ProBestDetailVO;
import net.shopin.back.mapper.ProBestDetailMapper;
import net.shopin.back.service.impl.ProBestDetailServiceImpl;

import org.junit.Before;
import org.junit.Test;
import org.springframework.util.Assert;

import com.framework.page.Paginator;
import com.framework.returnObj.Infos;
import com.framework.testCase.AbstractTest;
import com.utils.JsonUtil;

/**
 * @Class Name ProBestDetailServiceTest
 * @Author shiying
 * @Create In 2013-5-13
 */
public class ProBestDetailServiceTest extends AbstractTest {

	IProBestDetailService proBestDetailService;

	@Before
	public void setUp() throws Exception {
		super.setUp();
		this.proBestDetailService = context.getBean(ProBestDetailServiceImpl.class);
		Assert.notNull(this.proBestDetailService);
	}

	// @Test
	public void test2() {
		List list = this.proBestDetailService.queryProductsByPsid(Long.valueOf(14412));
		System.out.println(list);
	}

	//@Test
	public void test3() {
		ProBestDetailCond cond = new ProBestDetailCond();
		cond.setPageLayoutSid(28712);
		cond.setProductListSid(1146483);
		ProBestDetailVO vo = this.proBestDetailService.queryOrderNumber(cond);
		System.out.println(vo);
	}

	// @Test
	public void testFindObjBySid() throws SQLException {
		System.out.println("test");
		Infos infos = new Infos("", "", "", "");
		ProBestDetailVO vo = this.proBestDetailService.findObjBySid(infos,707721L);
		System.out.println(vo);
	}

	// @Test
	public void testQueryObjs() throws SQLException {
		Infos infos = new Infos("", "", "", "");
		ProBestDetailCond cond = new ProBestDetailCond();
		cond.setPageLayoutSid(47982);
		Paginator page = this.proBestDetailService.queryObjs(infos, cond);
		System.out.println(page);
		String json = JsonUtil.Object2Json(page);
		System.out.println(json);

	}

	// @Test
	public void testInsert() throws SQLException {
		Infos infos = new Infos("", "", "", "");
		ProBestDetailCond cond = new ProBestDetailCond();
		ProBestDetail record = new ProBestDetail();
		record.setPageLayoutSid(3333);
		record.setProductListSid(2222);
		record.setOrderNumber(1111);
		cond.setProBestDetail(record);
		this.proBestDetailService.insert(infos, cond);
	}

	// @Test
	public void testUpdate() throws SQLException {
		Infos infos = new Infos("", "", "", "");
		ProBestDetailCond cond = new ProBestDetailCond();
		ProBestDetail record = new ProBestDetail();
		record.setPageLayoutSid(111111);
		record.setProductListSid(111111111);
		record.setOrderNumber(1111111);
		record.setSid(707751L);
		cond.setProBestDetail(record);
		this.proBestDetailService.update(infos, cond);
	}

	// @Test
	public void testDelete() throws SQLException {
		Infos infos = new Infos("", "", "", "");
		ProBestDetailCond cond = new ProBestDetailCond();
		ProBestDetail record = new ProBestDetail();
		record.setSid(707751L);
		cond.setProBestDetail(record);
		this.proBestDetailService.delete(infos, 707751L);
	}

	// @Test
	public void testDeleteByProductListSid() throws SQLException {

		ProBestDetail proBestDetail = new ProBestDetail();
		proBestDetail.setProductListSid(1392232);
		proBestDetail.setPageLayoutSid(10953);
		this.proBestDetailService.deleteByProductListSid(proBestDetail);
	}
	
	//@Test
		public void testInsertBatch() throws SQLException {
             String pageLayoutSid = "10243";
             String[] productSidsArray={"1234","2071972"};
			this.proBestDetailService.insertBatch(pageLayoutSid, productSidsArray);
		}


}
