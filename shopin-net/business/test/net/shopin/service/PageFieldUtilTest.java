/**
 * @Probject Name: business
 * @Path: net.shopin.service.PageFieldUtilTest.java
 * @Create By wangdg
 * @Create In 2013-7-11 下午3:33:22
 * TODO
 */
package net.shopin.service;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.PageLayout;
import net.shopin.entity.PageLayoutBrand;
import net.shopin.entity.PageLayoutContent;
import net.shopin.entity.PageLayoutTemplate;
import net.shopin.view.PageFieldVO;

import org.hibernate.SessionFactory;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;
import com.shopin.modules.utils.DozerMapper;

/**
 * @Class Name PageFieldUtilTest
 * @Author wangdg
 * @Create In 2013-7-11
 */
public class PageFieldUtilTest {

	private static AbstractApplicationContext context;
	private PageFieldUtil pageFieldUtil;

	@Before
	public void setUp() throws Exception {
		context = new ClassPathXmlApplicationContext("spring.xml");
		pageFieldUtil = (PageFieldUtil) context.getBean("pageFieldUtil");

	}

	@Test
	public void testBuildNodeVO() {
		PageLayout pageLayout = new PageLayout();
		pageLayout.setSid(70059);
		pageLayout.setPageLayoutSid(70013);
		PageLayoutTemplate pageLayoutTemplate = new PageLayoutTemplate();
		pageLayoutTemplate.setSid(101);
		pageLayoutTemplate.setName("cs");
		pageLayoutTemplate.setMinProQuantity(2);
		pageLayout.setPageLayoutTemplate(pageLayoutTemplate);
		System.out.println(this.pageFieldUtil.buildNodeVO(pageLayout));
	}

	@Test
	public void testBuildNodeVOBySid() {
		PageLayout pageLayout = new PageLayout();
		pageLayout.setSid(70059);
		pageLayout.setPageLayoutSid(70013);
		PageLayoutTemplate pageLayoutTemplate = new PageLayoutTemplate();
		pageLayoutTemplate.setSid(101);
		pageLayoutTemplate.setName("cs");
		pageLayoutTemplate.setMinProQuantity(2);
		pageLayout.setPageLayoutTemplate(pageLayoutTemplate);
		pageLayout.setPageLayoutTemplateSid(101);
		System.out.println(this.pageFieldUtil.buildNodeVOBySid(pageLayout, 1));
	}
}
