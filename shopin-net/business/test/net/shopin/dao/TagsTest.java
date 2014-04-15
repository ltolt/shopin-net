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
import net.shopin.entity.Tags;

/**
 * 标签（tags表）测试类
 * @Class Name TagsTest
 * @Author huyy
 * @Create In 2013-7-12
 */
public class TagsTest extends BaseTestContext {
	private SimpleHibernateDao<Tags, Integer> tagsDao;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		tagsDao = new SimpleHibernateDao<Tags, Integer>(sessionFactory,
				Tags.class);
	}

	
	// @Test
	// @Transactional
	// @Rollback(false)
	public void testInsert() {
		Assert.notNull(this.tagsDao);
		Tags tags = new Tags();
		tags.setName("从左到右");
		tags.setNum(6);
		this.tagsDao.save(tags);
	}

	
	// @Test
	// @Transactional
	// @Rollback(false)
	public void testUpdate() {
		Tags tags = this.tagsDao.findByUnique("sid", 1);
		Assert.notNull(tags, "must not be null");
		tags.setName("开始活动");
		this.tagsDao.save(tags);
	}

	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testSelect() {
		List tagsList = this.tagsDao.createCriteria()
				.add(Restrictions.like("name", "活动", MatchMode.ANYWHERE))
				.addOrder(Order.desc("sid")).list();
		System.out.println(tagsList);
	}
	
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testDelete(){
		Tags tags=this.tagsDao.findByUnique("sid", 1);
		Assert.notNull(tags);
		this.tagsDao.delete(tags);
	}
}
