/**
 * @Probject Name: backendWeb_mysql
 * @Path: net.shopin.dao.BrandTest.java
 * @Create By kongm
 * @Create In 2013-6-6 下午4:49:55
 * TODO
 */
package net.shopin.dao;

import java.util.List;

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

import net.shopin.base.BaseTestContext;
import net.shopin.entity.Brand;

/**
 *  品牌类（brand表）测试类
 * @Class Name BrandTest
 * @Author huyy
 * @Create In 2013-7-12
 */
public class BrandTest extends BaseTestContext {

	private SimpleHibernateDao<Brand, Integer> brandDao;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		brandDao = new SimpleHibernateDao<Brand, Integer>(sessionFactory,
				Brand.class);
	}

	
	// @Test
	// @Transactional
	// @Rollback(false)
	public void testInsert() {
		Assert.notNull(this.brandDao);
		Brand record = new Brand();
		record.setBrandName("adidas");
		record.setBrandNameSecond("adi");
		record.setBrandActiveBit(1);
		record.setBlacklistBit(1);
		record.setSpell("adidas");
		this.brandDao.save(record);
	}

	
	// @Test
	// @Transactional
	// @Rollback(false)
	public void testUpdate() {
		Brand record = this.brandDao.findByUnique("sid", 15);
		Assert.notNull(record, "must not be null");
		record.setSpell("adidas变啦");
		this.brandDao.save(record);
	}

	
	// @Test
	// @Transactional
	// @Rollback(false)
	public void testSelect() {
		List brandList = this.brandDao.createCriteria()
				.add(Restrictions.like("brandName", "n", MatchMode.ANYWHERE))
				.addOrder(Order.asc("sid")).list();
		System.out.println(brandList);

	}

	
	// @Test
	// @Transactional
	// @Rollback(false)
	public void testDelete() {
		Brand record = this.brandDao.findByUnique("sid", 15);
		Assert.notNull(record, "must not be null");
		this.brandDao.delete(record);
	}

}
