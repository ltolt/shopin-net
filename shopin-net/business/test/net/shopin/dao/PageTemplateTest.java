/**
 * @Probject Name: business
 * @Path: net.shopin.dao.PageTemplateTest.java
 * @Create By jingpeng
 * @Create In 2013-7-9 上午10:52:04
 * TODO
 */
package net.shopin.dao;

import java.util.List;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.PageTemplate;
import net.shopin.entity.Promotions;
import net.shopin.entity.ShopChannels;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

/**
 * @Class Name PageTemplateTest
 * @Author jingpeng
 * @Create In 2013-7-9
 */
public class PageTemplateTest extends BaseTestContext {

private SimpleHibernateDao<PageTemplate, Integer> pageTemplateDao;
	
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
    	pageTemplateDao = new SimpleHibernateDao<PageTemplate, Integer>(sessionFactory, PageTemplate.class);
    }
	
	@Test
	@Transactional
	@Rollback(false)
	public void testInsert(){
		PageTemplate pageTemplate = new PageTemplate();
		pageTemplate.setName("店庆");
		pageTemplate.setPage("3");
		pageTemplate.setType(3);
		this.pageTemplateDao.save(pageTemplate);
	}

//	@Test
//	@Transactional
//	@Rollback(false)
	public void testUpdate(){
		PageTemplate pageTemplate  =  this.pageTemplateDao.findByUnique("sid", 4);
		
		pageTemplate.setName("更改测试");
		pageTemplate.setPage("6");
		pageTemplate.setType(4);
		this.pageTemplateDao.save(pageTemplate);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testSelect(){
		List brandList =  this.pageTemplateDao.findBy("page", "3");
							
	    for (int i = 0; i < brandList.size(); i++) {
			System.out.println(((PageTemplate)brandList.get(i)).getName());
		}
		System.out.println(brandList);
		
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testDelete(){
		PageTemplate pageTemplate = 	this.pageTemplateDao.findByUnique("sid", 3);
		Assert.notNull(pageTemplate);
		this.pageTemplateDao.delete(pageTemplate);
	}
}

