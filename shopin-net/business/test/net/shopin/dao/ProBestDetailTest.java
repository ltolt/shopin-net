/**
 * @Probject Name: business
 * @Path: net.shopin.dao.ProBestDetailTest.java
 * @Create By wangdg
 * @Create In 2013-7-9 下午3:03:30
 * TODO
 */
package net.shopin.dao;

import org.hibernate.SessionFactory;
import org.jgroups.tests.Probe;
import org.junit.Test;
import org.mvel2.util.ThisLiteral;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.PageLayout;
import net.shopin.entity.ProBestDetail;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

/**
 * @Class Name ProBestDetailTest
 * @Author wangdg
 * @Create In 2013-7-9
 */
public class ProBestDetailTest extends BaseTestContext{
	private SimpleHibernateDao<ProBestDetail, Integer> proBestDetailDao;
	
	@Autowired
	public void setSessionfactory(SessionFactory sessionFactory){
		proBestDetailDao = new SimpleHibernateDao<ProBestDetail, Integer>(sessionFactory,ProBestDetail.class);
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testInsert(){
		ProBestDetail proBestDetail = new ProBestDetail();
		proBestDetail.setOrderNumber(2);
		proBestDetail.setProductListSid(22);
		PageLayout pageLayout = new PageLayout();
		pageLayout.setSid(69992);
		proBestDetail.setPageLayout(pageLayout);
		this.proBestDetailDao.save(proBestDetail);
		System.out.println(proBestDetail.getSid());
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testUpdate(){
		ProBestDetail proBestDetail = new ProBestDetail();
		proBestDetail.setSid(70);
		proBestDetail.setOrderNumber(4);
		proBestDetail.setProductListSid(2233);
		PageLayout pageLayout = new PageLayout();
		pageLayout.setSid(69992);
		proBestDetail.setPageLayout(pageLayout);
		this.proBestDetailDao.save(proBestDetail);
		System.out.println(proBestDetail.getOrderNumber());
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testQuery(){
		System.out.println(this.proBestDetailDao.findByUnique("sid", 70));
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testDelete(){
		this.proBestDetailDao.delete(70);
	}
	
}
