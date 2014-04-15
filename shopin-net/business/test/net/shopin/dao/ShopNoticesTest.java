package net.shopin.dao;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.junit.Test;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import net.shopin.base.BaseTestContext;
import net.shopin.entity.NoticeType;
import net.shopin.entity.PageLayout;
import net.shopin.entity.PageTemplate;
import net.shopin.entity.PromotionType;
import net.shopin.entity.Promotions;
import net.shopin.entity.ShopNotices;

/**
 * shop_notices表测试类
 * @Class Name ShopNoticesTest
 * @Author huyy
 * @Create In 2013-7-12
 */
public class ShopNoticesTest extends BaseTestContext {

	private SimpleHibernateDao<ShopNotices, Integer> shopNoticesDao;
	private SimpleHibernateDao<NoticeType, Integer> noticesTypeDao;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		shopNoticesDao = new SimpleHibernateDao<ShopNotices, Integer>(
				sessionFactory, ShopNotices.class);
		noticesTypeDao = new SimpleHibernateDao<NoticeType, Integer>(
				sessionFactory, NoticeType.class);

	}

	
//	 @Test
//	 @Transactional
//	 @Rollback(false)
	public void testInsert() {
		// 查找相关表
		NoticeType noticeType = this.noticesTypeDao.findByUnique("sid", 3);
		Assert.notNull(this.shopNoticesDao);
		ShopNotices shopNotices = new ShopNotices();
		shopNotices.setTitle("秋高气爽");
		shopNotices.setSeq("2");
		shopNotices.setNoticeType(noticeType);
		shopNotices.setContent("各种打折");
		shopNotices.setLink("www.shopin.net");
	    shopNotices.setNoticesTime(new Date());
		this.shopNoticesDao.save(shopNotices);
	}

	
	// @Test
	// @Transactional
	// @Rollback(false)
	public void testUpdate() {
		ShopNotices shopNotices = this.shopNoticesDao.findByUnique("sid", 2);
		shopNotices.setContent("赶快");
		this.shopNoticesDao.save(shopNotices);
	}

	
	// @Test
	// @Transactional
	// @Rollback(false)
	public void testSelect() {
		// 关联查询
		String hql = "from ShopNotices p, NoticeType n where n.sid = p.noticeTypeSid and p.sid = ?";
		List list = this.shopNoticesDao.find(hql, 2);
		Assert.notEmpty(list, "list must not be null");
		for (Object obj : list) {
			Object[] os = (Object[]) obj;
			for (int i = 0; i < os.length; i++) {
				Object o = os[i];
				switch (i) {
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

	
	// @Test
	// @Transactional
	// @Rollback(false)
	public void testDelete() {
		ShopNotices shopNotices = this.shopNoticesDao.findByUnique("sid", 2);
		Assert.notNull(shopNotices, "must not be null");
		this.shopNoticesDao.delete(shopNotices);
	}
}
