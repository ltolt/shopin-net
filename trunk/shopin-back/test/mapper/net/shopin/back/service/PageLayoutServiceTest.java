/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.servicePageLayoutTest.java
 * @Create By shiying
 * @Create In 2013-5-13 下午2:21:17
 * TODO
 */
package net.shopin.back.service;

import java.sql.SQLException;
import java.util.List;

import net.shopin.back.entity.cond.PageLayoutCond;
import net.shopin.back.entity.cond.ProConSearchCond;
import net.shopin.back.entity.po.PageLayout;
import net.shopin.back.entity.po.ProConSearch;
import net.shopin.back.entity.vo.PageLayoutVO;
import net.shopin.back.entity.vo.ProConSearchVO;
import net.shopin.back.service.impl.PageLayoutServiceImpl;
import net.shopin.back.service.impl.ProConSearchServiceImpl;

import org.junit.Before;
import org.junit.Test;
import org.springframework.util.Assert;

import com.framework.page.Paginator;
import com.framework.returnObj.Infos;
import com.framework.testCase.AbstractTest;
import com.utils.JsonUtil;

/**
 * @Class Name PageLayoutServiceTest
 * @Author shiying
 * @Create In 2013-5-13
 */
public class PageLayoutServiceTest extends AbstractTest{
	
	IPageLayoutService pageLayoutService;
	
	@Before
	public void setUp() throws Exception{
		super.setUp();
		this.pageLayoutService = context.getBean(PageLayoutServiceImpl.class);
		Assert.notNull(this.pageLayoutService);
	}
	//@Test
	public void test1() throws SQLException{
	/*	Infos infos = new Infos("", "", "", "");
		PageLayoutCond cond = new PageLayoutCond();
		cond.setChannelSid(1);
		Paginator page =  this.pageLayoutService.queryPageLayoutByChannel(infos, cond);
		System.out.println(page);
	*/	
		List  list = this.pageLayoutService.queryChildPageLayout(1l);
		System.out.println(list);
		
	}
	
	
	@Test
	public void testSelectQueryBySid() {
	
		PageLayoutVO  list = this.pageLayoutService.selectQueryBySid(35165L);
		System.out.println(list);
		
	}
	
	
	
	@Test
	public void testFindObjBySid() throws SQLException{
		System.out.println("test");
		Infos infos = new Infos("", "", "", "");
		PageLayoutVO vo = this.pageLayoutService.findObjBySid(infos,35165L);
		System.out.println(vo);
	}
	
	//@Test
	public void testQueryObjs() throws SQLException{
		Infos infos = new Infos("", "", "", "");
		PageLayoutCond cond = new PageLayoutCond();
		cond.setChannelSid(6567);
		cond.setSeq("苹果的");
		cond.setTitle("好吃");
		Paginator page =  this.pageLayoutService.queryObjs(infos, cond);
		System.out.println(page);
		String json = JsonUtil.Object2Json(page);
		System.out.println(json);
		
	}
	
	//@Test
	public void testInsert() throws SQLException{
		Infos infos = new Infos("", "", "", "");
		PageLayoutCond cond = new PageLayoutCond();
		PageLayout record = new PageLayout();
		record.setChannelSid(1213);
		record.setSeq("啦啦啦");
		record.setTitle("很值");
		cond.setPageLayout(record);
		this.pageLayoutService.insert(infos, cond);
	}
	
	
	
	
	//@Test
	public void testUpdate() throws SQLException{
		Infos infos = new Infos("", "", "", "");
		PageLayoutCond cond = new PageLayoutCond();
		PageLayout record = new PageLayout();
		record.setChannelSid(1213);
		record.setSeq("啦");
		record.setTitle("很值");
		record.setSid(47989L);
		cond.setPageLayout(record);
		this.pageLayoutService.update(infos, cond);
	}
	
	//@Test
	public void testDelete() throws SQLException{
		Infos infos = new Infos("", "", "", "");
		PageLayoutCond cond = new PageLayoutCond();
		PageLayout record = new PageLayout();
		record.setSid(47989L);
		cond.setPageLayout(record);
		this.pageLayoutService.delete(infos,47989L);
	}
	
	
	
	
	
	

}
