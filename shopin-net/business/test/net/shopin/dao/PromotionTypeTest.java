/**
 * @Probject Name: business
 * @Path: net.shopin.dao.PromotionTypeTest.java
 * @Create By jingpeng
 * @Create In 2013-7-9 上午10:51:40
 * TODO
 */
package net.shopin.dao;

import java.util.List;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.PromotionType;

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
 * @Class Name PromotionTypeTest
 * @Author jingpeng
 * @Create In 2013-7-9
 */
public class PromotionTypeTest extends BaseTestContext{
	private SimpleHibernateDao<PromotionType, Integer> promotionTypeDao;
	
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
    	promotionTypeDao = new SimpleHibernateDao<PromotionType, Integer>(sessionFactory, PromotionType.class);
    }
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testInsert(){
		Assert.notNull(this.promotionTypeDao);
		PromotionType record = new PromotionType();
		record.setPromotionTypeMemo("测试模版2备注");
		record.setPromotionTypeName("测试模版2");
		this.promotionTypeDao.save(record);
	}

//	@Test
//	@Transactional
//	@Rollback(false)
	public void testUpdate(){
		PromotionType promotions=  this.promotionTypeDao.findByUnique("sid", 3);
		Assert.notNull(promotions, "must not be null");
		promotions.setPromotionTypeName("更改测试模版1备注");
		promotions.setPromotionTypeName("更改测试模版1");
		this.promotionTypeDao.save(promotions);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testSelect(){
		List brandList =  this.promotionTypeDao.createCriteria().add(Restrictions.like("promotionTypeName","uuu",MatchMode.ANYWHERE))
							.addOrder(Order.asc("sid")).list();
	    for (int i = 0; i < brandList.size(); i++) {
			System.out.println(((PromotionType)brandList.get(i)).getPromotionTypeMemo());
		}
		System.out.println(brandList);
		
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testDelete(){
		PromotionType record = 	this.promotionTypeDao.findByUnique("sid", 4);
		Assert.notNull(record,"must not be null");
		this.promotionTypeDao.delete(record);
	}
}
