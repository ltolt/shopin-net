/**
 * @Probject Name: backendWeb_mysql
 * @Path: net.shopin.dao.PaymentTypeClassTest.java
 * @Create By jingpeng
 * @Create In 2013-6-13 下午4:10:22
 * TODO
 */
package net.shopin.dao;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.PaymentTypeClass;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

/**
 * 支付方式类（payment_type_class表）测试类
 * @Class Name PaymentTypeClassTest
 * @Author huyy
 * @Create In 2013-7-12
 */
public class PaymentTypeClassTest extends BaseTestContext {

	private SimpleHibernateDao<PaymentTypeClass, Integer> paymentTypeClassDao;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		paymentTypeClassDao = new SimpleHibernateDao<PaymentTypeClass, Integer>(
				sessionFactory, PaymentTypeClass.class);
	}

	
	// @Test
	// @Transactional
	// @Rollback(false)
	public void testInsert() {
		Assert.notNull(this.paymentTypeClassDao);
		PaymentTypeClass paymentTypeClass = new PaymentTypeClass();
		paymentTypeClass.setName("上品");
		paymentTypeClass.setSeq(234);
		paymentTypeClass.setShow(2);
		this.paymentTypeClassDao.save(paymentTypeClass);
	}

	
	// @Test
	// @Transactional
	// @Rollback(false)
	public void testUpdate() {
		PaymentTypeClass paymentTypeClass = this.paymentTypeClassDao
				.findByUnique("sid", 3);
		Assert.notNull(paymentTypeClass, "must not be null");
		paymentTypeClass.setShow(2);
		paymentTypeClass.setName("上品折扣");
		paymentTypeClass.setSeq(222);
		this.paymentTypeClassDao.save(paymentTypeClass);
	}

	
	// @Test
	// @Transactional
	// @Rollback(false)
	public void testSelect() {
		PaymentTypeClass paymentTypeClass = this.paymentTypeClassDao
				.findByUnique("sid", 3);
		Assert.notNull(paymentTypeClass);
		System.out.println(paymentTypeClass);
	}

	
	// @Test
	// @Transactional
	// @Rollback(false)
	public void testDelete() {
		PaymentTypeClass paymentTypeClass = this.paymentTypeClassDao
				.findByUnique("sid", 3);
		Assert.notNull(paymentTypeClass, "must not be null");
		this.paymentTypeClassDao.delete(paymentTypeClass);
	}
}
