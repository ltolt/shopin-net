
package net.shopin.back.mapper;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import net.shopin.back.entity.cond.PageLayoutCond;
import net.shopin.back.entity.po.PageLayout;
import net.shopin.back.entity.vo.PageLayoutVO;
import org.junit.Before;
import org.junit.Test;
import org.springframework.util.Assert;

import com.framework.testCase.AbstractTest;

/**
 * desc 页面展示表mapper测试类
 * @Class Name PageLayoutMapperTest
 * @Author shiying
 * @Create In 2013-5-9
 */
public class PageLayoutMapperTest extends AbstractTest{
	
	PageLayoutMapper pageLayoutMapper;
	
	@Before
	public void setUp() throws Exception{
		super.setUp();
		this.pageLayoutMapper = context.getBean(PageLayoutMapper.class);
	}
	@Test
	public void test1(){
		//List list = this.pageLayoutMapper.queryPageLayoutByChannel(1);
		List  list = this.pageLayoutMapper.queryChildPageLayout(1l);
		System.out.println(list);
	}
	
	@Test
	public void testSelectQueryBySid(){
		//List list = this.pageLayoutMapper.queryPageLayoutByChannel(1);
		PageLayoutVO  list = this.pageLayoutMapper.selectQueryBySid(42475L);
		System.out.println(list);
	}
	
	@Test
	public void testFindObjBySid(){
		Assert.notNull(this.pageLayoutMapper);
		try {
			PageLayoutVO vo =  this.pageLayoutMapper.findObjBySid(35165L);
			System.out.println(vo);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//@Test
	public void queryObjsList(){
		Assert.notNull(this.pageLayoutMapper);
		try {
			
			PageLayoutCond plcond =new PageLayoutCond();
			Integer num = pageLayoutMapper.queryObjsCount(plcond);
			//plcond.setPagelayoutSid(Integer.valueOf(11834));
			plcond.setSeq("5");
			plcond.setTitle("手袋");
			plcond.setTotalRecordsBuild(num);
	             
			List<PageLayoutVO> vo =  this.pageLayoutMapper.queryObjsList(plcond);
			System.out.println("vo="+vo.toString());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//@Test
	public void queryObjsCount(){
		Assert.notNull(this.pageLayoutMapper);
		try {
			
			PageLayoutCond plcond =new PageLayoutCond();
			//plcond.setPagelayoutSid(Integer.valueOf(11834));
			plcond.setSeq("5");
			plcond.setTitle("手袋");
			
			Integer num = pageLayoutMapper.queryObjsCount(plcond);
	             
			
			System.out.println("num="+num);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//@Test
	public void testInsert() {
		PageLayoutCond cond = new PageLayoutCond();
		PageLayout pl = new PageLayout();
		//pl.setSid(1012L);
		//pl.setPagelayoutSid(Integer.valueOf(2135));
		pl.setProLinkType(Integer.valueOf(1));
		pl.setChannelSid(Integer.valueOf(6567));
		//pl.setendTime(Date.valueOf("2013-11-21"));
		pl.setNodeLevel(Integer.valueOf(0));
		pl.setPageLayoutTemplateSid(Integer.valueOf(15211));
		pl.setPageType(Integer.valueOf(2));
		pl.setSeq("苹果的");
		//.setstartTime(Date.valueOf("2013-11-20"));
		pl.setTitle("好吃");
		//pl.setTitleLink("是吗");
		
        System.out.println("pl=="+pl.toString());
		//添加具体测试代码
		cond.setPageLayout(pl);
		try {
			pageLayoutMapper.insert(cond.getPageLayout());
			System.out.println("new sid = "+ cond.getPageLayout().getSid());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//@Test
	public void testUpdate() {
		PageLayoutCond cond = new PageLayoutCond();
		PageLayout pl = new PageLayout();
		pl.setSid(1011L);
		pl.setPageLayoutSid(Integer.valueOf(2222));
		pl.setProLinkType(Integer.valueOf(1));
		pl.setChannelSid(Integer.valueOf(1212));
		pl.setendTime(Date.valueOf("2013-11-21"));
		pl.setNodeLevel(Integer.valueOf(0));
		pl.setPageLayoutTemplateSid(Integer.valueOf(1111));
		pl.setPageType(Integer.valueOf(2));
		pl.setSeq("诺基亚的");
		pl.setstartTime(Date.valueOf("2013-11-20"));
		pl.setTitle("大屏手机");
		pl.setTitleLink("好不好");
		
        System.out.println("pl=="+pl.toString());
		//添加具体测试代码
		cond.setPageLayout(pl);
		try {
			pageLayoutMapper.update(cond.getPageLayout());
			//System.out.println("new sid = "+ cond.getPageLayout().getSid());
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//@Test
	public void testDelete() {
		try {
			pageLayoutMapper.delete(1011L);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	

}
