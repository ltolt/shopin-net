/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.PageTemplatetest.java
 * @Create By wangdg
 * @Create In 2013-9-2 上午11:31:45
 * TODO
 */
package net.shopin.wms.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import net.shopin.wms.base.BaseTestContext;
import net.shopin.wms.domain.entity.PageTemplate;

/**
 * @Class Name PageTemplatetest
 * @Author wangdg
 * @Create In 2013-9-2
 */
public class PageTemplatetest extends BaseTestContext {
	
	@Autowired
	IPageTemplateService pageTemplateService;
	
	@Test
	public void testQueryBySelective(){
		PageTemplate pageTemplate = new PageTemplate();
		pageTemplate.setType(2);
		System.out.println(this.pageTemplateService.queryBySelective(pageTemplate));
	}

}
