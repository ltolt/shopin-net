/**
 * @Probject Name: business
 * @Path: net.shopin.serviceTemplateServiceTest.java
 * @Create By shiying
 * @Create In 2013-7-16 下午2:26:53
 * TODO
 */
package net.shopin.service;

import java.util.HashMap;
import java.util.Map;

import net.shopin.api.ITemplateService;
import net.shopin.view.PageFieldVO;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * @Class Name TemplateServiceTest
 * @Author shiying
 * @Create In 2013-7-16
 */
public class TemplateServiceTest {
	private static AbstractApplicationContext context;
	private ITemplateService templateService;

	@Before
	public void setUp() throws Exception {
		context = new ClassPathXmlApplicationContext("spring.xml");
		templateService = (ITemplateService) context.getBean("templateService");
	}

	@Test
	public void testgetTemplate() {
		String name = "频道-有滚动图片栏目";
		PageFieldVO fieldVo = new PageFieldVO();
		fieldVo.setSid("70061");
		fieldVo.setPageLayoutSid("70015");
		fieldVo.setProLinkType("1");
		Map root = new HashMap();
		root.put("root", fieldVo);
		root.put("images", "http://images.shopin.net/images");
		root.put("ctx", "/");
		String templateinfos = templateService.getTemplate(name, root);
		System.out.println(templateinfos);
	}
}
