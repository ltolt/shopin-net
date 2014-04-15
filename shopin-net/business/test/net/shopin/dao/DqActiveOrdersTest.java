/**
 * @Probject Name: business
 * @Path: net.shopin.dao.DqActiveOrdersTest.java
 * @Create By jingpeng
 * @Create In 2013-7-9 下午5:30:46
 * TODO
 */
package net.shopin.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.DqActiveOrders;
import net.shopin.entity.Members;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

/**
 * @Class Name DqActiveOrdersTest
 * @Author jingpeng
 * @Create In 2013-7-9
 */
public class DqActiveOrdersTest extends BaseTestContext{
	
	private SimpleHibernateDao<DqActiveOrders, Integer> dqActiveOrdersDao;
	private SimpleHibernateDao<Members, Integer> membersDao;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		dqActiveOrdersDao = new SimpleHibernateDao<DqActiveOrders, Integer>(sessionFactory, DqActiveOrders.class);
		membersDao = new SimpleHibernateDao<Members, Integer>(sessionFactory, Members.class);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testInsert() {
		//相关表查询
		Members member = this.membersDao.findByUnique("sid", 1);
		Assert.notNull(member);
		DqActiveOrders order = new DqActiveOrders();
		//flag长度为2
		order.setFlag("fl");
		order.setMembers(member);
		order.setNum(33);
		order.setOrderNo("234234435");
		order.setSaleTime(new Timestamp((new Date()).getTime()));
		order.setXpNum(11);
		order.setYyNum(22);
		
		this.dqActiveOrdersDao.save(order);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testUpdate() {
		//相关表查询
		Members member = this.membersDao.findByUnique("sid", 2);
		Assert.notNull(member);
		DqActiveOrders order = this.dqActiveOrdersDao.findByUnique("sid", 1);
		//flag长度为2
		order.setFlag("ag");
		order.setMembers(member);
		order.setNum(11);
		order.setOrderNo("675424546");
		order.setSaleTime(new Timestamp((new Date()).getTime()));
		order.setXpNum(22);
		order.setYyNum(33);
		
		this.dqActiveOrdersDao.save(order);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testSelect() {
		String hql = "from DqActiveOrders order, Members m where order.membersSid = m.sid and m.sid = ?";
		List list = this.dqActiveOrdersDao.find(hql, 2);
		Assert.notNull(list);
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
	public void testDelete() {
		DqActiveOrders order = this.dqActiveOrdersDao.findByUnique("sid", 3);
		Assert.notNull(order);
		this.dqActiveOrdersDao.delete(order);
	}
}
