/**
 * @Probject Name: business
 * @Path: net.shopin.dao.PromotionsTest.java
 * @Create By jingpeng
 * @Create In 2013-7-9 上午10:50:50
 * TODO
 */
package net.shopin.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.PageLayout;
import net.shopin.entity.PageTemplate;
import net.shopin.entity.PromotionType;
import net.shopin.entity.Promotions;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

/**
 * @Class Name PromotionsTest
 * @Author jingpeng
 * @Create In 2013-7-9
 */
public class PromotionsTest extends BaseTestContext{
	
	  private SimpleHibernateDao<Promotions, Integer> promotionsDao;
	  private SimpleHibernateDao<PromotionType, Integer> promotionTypeDao;
	  private SimpleHibernateDao<PageLayout, Integer> pageLayoutDao;
	  private SimpleHibernateDao<PageTemplate, Integer> pageTemplateDao;
		
	    @Autowired
	    public void setSessionFactory(SessionFactory sessionFactory) {
	    	promotionsDao = new SimpleHibernateDao<Promotions, Integer>(sessionFactory, Promotions.class);
	    	promotionTypeDao = new SimpleHibernateDao<PromotionType, Integer>(sessionFactory, PromotionType.class);
	    	pageLayoutDao = new SimpleHibernateDao<PageLayout, Integer>(sessionFactory, PageLayout.class);
	    	pageTemplateDao = new SimpleHibernateDao<PageTemplate, Integer>(sessionFactory, PageTemplate.class);
	    }
		
//		@Test
//		@Transactional
//		@Rollback(false)
		public void testInsert(){
			//查找相关表
			PageLayout pageLayout = pageLayoutDao.findByUnique("sid", 2);
			PageTemplate pageTemplate = this.pageTemplateDao.findByUnique("sid", 8);
			PromotionType promotionType = this.promotionTypeDao.findByUnique("sid", 3);
			Assert.notNull(this.promotionsDao);
			Promotions promotions = new Promotions();
			promotions.setPromotionType(promotionType);
			promotions.setPageLayout(pageLayout);
			promotions.setPageTemplate(pageTemplate);
			promotions.setPromotionBpict("weishenm");
			promotions.setPromotionStatus(1);
			promotions.setSeq("不相等");
			promotions.setPromotionTitle("十周年店庆");
			promotions.setPromotionLink("www.翻墙.com");
			promotions.setPromotionSpict("D:");
			promotions.setPromotionBpict("E:");
			Timestamp current = new Timestamp(((new Date()).getTime()));  
			promotions.setPromotionBeginTime(current);
			promotions.setPromotionEndTime(current);
			this.promotionsDao.save(promotions);
		}

//		@Test
//		@Transactional
//		@Rollback(false)
//		public void testUpdate(){
//			Promotions promotions=  this.promotionsDao.findByUnique("sid", 5);
//			PageLayout pageLayout = pageLayoutDao.findByUnique("sid", 1);
//			promotions.setPageLayout(pageLayout);
//			this.promotionsDao.save(promotions);
//		}
		
		@Test
		@Transactional
		@Rollback(false)
		public void testSelect(){
			//关联查询
			String hql = "from Promotions p, PageTemplate pt where p.pageTemplateSid = pt.sid and pt.sid = ?";
			List list = this.promotionsDao.find(hql, 8);
			Assert.notEmpty(list,"list must not be null");
			for(Object obj : list){
				Object[] os = (Object[]) obj;
				for(int i=0;i<os.length;i++){
					Object o = os[i];
					switch(i){
						case 0:
							System.out.println(o);
							break;
						case 1:
							System.out.println(o);
							break;
					}
				}
			}
			System.out.println(list);
			
		}
		
//		@Test
//		@Transactional
//		@Rollback(false)
		public void testDelete(){
			Promotions promotions = 	this.promotionsDao.findByUnique("sid", 35);
			Assert.notNull(promotions,"must not be null");
			this.promotionsDao.delete(promotions);
		}
}
