package net.shopin.dao;

import java.util.List;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.NoticeType;
import net.shopin.entity.PaymentType;
import net.shopin.entity.PaymentTypeClass;
import net.shopin.entity.PromotionType;
import net.shopin.entity.ShopNotices;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.junit.Test;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import com.shopin.modules.orm.hibernate.SimpleHibernateDao;
/**
 * 
 * @Class Name NoticeTypeTest
 * @Author huyy
 * @Create In 2013-7-12
 */
public class NoticeTypeTest extends BaseTestContext{
private SimpleHibernateDao<NoticeType, Integer> noticeTypeDao;
	
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory){
		noticeTypeDao = new SimpleHibernateDao<NoticeType, Integer>(sessionFactory, NoticeType.class);
		
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testInsert(){
		Assert.notNull(noticeTypeDao);

		NoticeType noticeType = new NoticeType();
		noticeType.setName("限时大减价");
		noticeType.setMemo("快点");
		
		this.noticeTypeDao.save(noticeType);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testUpdate(){

		NoticeType noticeType = this.noticeTypeDao.findByUnique("sid", 4);
		Assert.notNull(noticeType, "must not be null");
		noticeType.setName("抢光了");
		noticeType.setMemo("活动结束");
		this.noticeTypeDao.save(noticeType);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testSelect(){
		List noticeList =  this.noticeTypeDao.createCriteria().add(Restrictions.like("memo","结束",MatchMode.ANYWHERE))
							.addOrder(Order.asc("sid")).list();
	    for (int i = 0; i < noticeList.size(); i++) {
			System.out.println(((NoticeType)noticeList.get(i)).getMemo());
		}
		System.out.println(noticeList);
		
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testDelete(){
		NoticeType noticeType = this.noticeTypeDao.findByUnique("sid", 4);
		Assert.notNull(noticeType, "must not be null");
		this.noticeTypeDao.delete(noticeType);
	}
}
