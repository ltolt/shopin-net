/**
 * @Probject Name: backendWeb_mysql
 * @Path: net.shopin.dao.PaymentTypeTest.java
 * @Create By jingpeng
 * @Create In 2013-6-13 下午7:02:54
 * TODO
 */
package net.shopin.dao;

import java.util.List;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.PaymentType;
import net.shopin.entity.PaymentTypeClass;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

/**
 *  payment_type表测试类
 * @Class Name PaymentTypeTest
 * @Author huyy
 * @Create In 2013-7-12
 */
public class PaymentTypeTest extends BaseTestContext{
	
	private SimpleHibernateDao<PaymentType, Integer> paymentTypeDao;
	
	private SimpleHibernateDao<PaymentTypeClass, Integer> paymentTypeClassDao;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory){
		paymentTypeDao = new SimpleHibernateDao<PaymentType, Integer>(sessionFactory, PaymentType.class);
		paymentTypeClassDao = new SimpleHibernateDao<PaymentTypeClass, Integer>(sessionFactory, PaymentTypeClass.class);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testInsert(){
		Assert.notNull(paymentTypeDao);
		//相关主表查询：
		PaymentTypeClass paymentTypeClass = this.paymentTypeClassDao.findByUnique("sid", 1);
		PaymentType paymentType = new PaymentType();
		paymentType.setShow(3);
		paymentType.setMemo("添加条件要完整");
		paymentType.setName("上品折扣");
		paymentType.setUrl("www.shopin.net");
		paymentType.setPaymentTypeClass(paymentTypeClass);
		this.paymentTypeDao.save(paymentType);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testUpdate(){
		//相关主表查询
		PaymentTypeClass paymentTypeClass = this.paymentTypeClassDao.findByUnique("sid", 2);
		Assert.notNull(paymentTypeClass, "must not be null");
		PaymentType paymentType = this.paymentTypeDao.findByUnique("sid", 7);
		Assert.notNull(paymentType, "must not be null");
		paymentType.setShow(2);
		paymentType.setMemo("你是谁，世界从哪里来");
		paymentType.setPaymentTypeClass(paymentTypeClass);
		this.paymentTypeDao.save(paymentType);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testSelect(){
		String hql = "from PaymentType type, PaymentTypeClass typeClass where type.paymentTypeClassSid = typeClass.sid and typeClass.sid = ?";
		List list = this.paymentTypeDao.find(hql, 2);
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
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testDelete(){
		PaymentType paymentType = this.paymentTypeDao.findByUnique("sid", 7);
		Assert.notNull(paymentType, "must not be null");
		this.paymentTypeDao.delete(paymentType);
	}
}
