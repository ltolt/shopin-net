/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.mapperPageLayoutMqlMapperTest.java
 * @Create By jingpeng
 * @Create In 2013-8-29 下午5:14:07
 * TODO
 */
package net.shopin.wms.mapper;

import java.sql.Timestamp;
import java.util.Date;

import net.shopin.wms.domain.entity.PageLayoutMql;
import net.shopin.wms.persistence.PageLayoutMqlMapper;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.framework.testCase.AbstractTest;

/**
 * @Class Name PageLayoutMqlMapperTest
 * @Author jingpeng
 * @Create In 2013-8-29
 */
public class PageLayoutMqlMapperTest extends AbstractTest{
	@Autowired
	private PageLayoutMqlMapper pageLayoutMqlMapper;
	
	@Before
	public void set() throws Exception {
		super.setUp();
		this.pageLayoutMqlMapper = context.getBean(PageLayoutMqlMapper.class);
	}
	
	@Test
	public void testInsert() {
		PageLayoutMql pageLayout = new PageLayoutMql();
		pageLayout.setStartTime(new Timestamp(new Date().getTime()));
		pageLayout.setEndTime(new Timestamp(new Date().getTime()));
		
		this.pageLayoutMqlMapper.insert(pageLayout);
	}
}
