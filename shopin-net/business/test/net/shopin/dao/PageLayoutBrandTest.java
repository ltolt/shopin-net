/**
 * @Probject Name: business
 * @Path: net.shopin.dao.PageLayoutBrandTest.java
 * @Create By wangdg
 * @Create In 2013-7-9 下午1:55:35
 * TODO
 */
package net.shopin.dao;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.PageLayout;
import net.shopin.entity.PageLayoutBrand;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

/**
 * @Class Name PageLayoutBrandTest
 * @Author wangdg
 * @Create In 2013-7-9
 */
public class PageLayoutBrandTest extends BaseTestContext{

	private SimpleHibernateDao<PageLayoutBrand, Integer> pageLayoutBrandDao;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory){ 
		pageLayoutBrandDao = new SimpleHibernateDao<PageLayoutBrand, Integer>(sessionFactory,PageLayoutBrand.class);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testQuery(){
		System.out.println(this.pageLayoutBrandDao.findByUnique("sid", 73));
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testInsert(){
		PageLayoutBrand pageLayoutBrand = new PageLayoutBrand();
		pageLayoutBrand.setBrandSid(22);
		PageLayout pageLayout =new PageLayout();
		pageLayout.setSid(2);
		pageLayoutBrand.setPageLayout(pageLayout);
		this.pageLayoutBrandDao.save(pageLayoutBrand);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testDelete(){
		this.pageLayoutBrandDao.delete(77);
	}
	
	
}
