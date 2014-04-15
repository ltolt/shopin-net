package net.shopin.dao;

import java.util.List;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.LeaveMessageType;
import net.shopin.view.LeaveMessageTypeVO;

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
import com.shopin.modules.utils.DozerMapper;

/**
 * 
 * @Description： 留言类型测试类
 * @ClassName:LeaveMessageTypeTest
 * @author： huyy
 * @date: 2013-7-10
 */
public class LeaveMessageTypeTest extends BaseTestContext {
	private SimpleHibernateDao<LeaveMessageType, Integer> leaveMsgTypeDao;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		leaveMsgTypeDao = new SimpleHibernateDao<LeaveMessageType, Integer>(
				sessionFactory, LeaveMessageType.class);
	}

	/**
	 * 测试留言类型添加功能
	 */
//	 @Test
//	 @Transactional
//	 @Rollback(false)
	public void testInsert() {
		Assert.notNull(this.leaveMsgTypeDao);
		LeaveMessageType parent = this.leaveMsgTypeDao.findByUnique("tid", 6);
		LeaveMessageType leaveMsgType = new LeaveMessageType();
		leaveMsgType.setCatename("catename");
		leaveMsgType.setContenttype(1);
		leaveMsgType.setViewcontent("viewcontent");
		leaveMsgType.setParentType(parent);
		this.leaveMsgTypeDao.save(leaveMsgType);
	}

	/**
	 * 测试留言类型修改功能
	 */
//	 @Test
//	 @Transactional
//	 @Rollback(false)
	public void testUpdate() {
		LeaveMessageType leaveMsgType = this.leaveMsgTypeDao.findByUnique(
				"tid", 2);
		Assert.notNull(leaveMsgType,"must not be null");
		leaveMsgType.setCatename("为什么");
		leaveMsgType.setOrderNoNeed(2);
		this.leaveMsgTypeDao.save(leaveMsgType);
	}

	/**
	 * 测试留言类型查询功能
	 */
	@Test
	@Transactional
	@Rollback(false)
	public void testSelect() {
		List<LeaveMessageType> leaveMsgTypeList = this.leaveMsgTypeDao.createCriteria()
				.add(Restrictions.like("catename", "购物流程", MatchMode.ANYWHERE))
				.addOrder(Order.desc("catename")).list();
//				.list();
//		List<LeaveMessageType> leaveMsgTypeList = this.leaveMsgTypeDao.findBy("catename", "购物流程");
		for(LeaveMessageType l : leaveMsgTypeList) {
			LeaveMessageTypeVO vo = new LeaveMessageTypeVO();
			DozerMapper.getInstance().map(l, vo);
			LeaveMessageTypeVO parent = vo.getParentType();
			System.out.println(vo.getCatename()+
					vo.getContenttype()+
					vo.getOrderNoNeed()+
					vo.getTargetType()+
					vo.getTypeOrder()+
					vo.getViewcontent()+ vo.getParentType().getCatename());
		}
		System.out.println(leaveMsgTypeList);
	}
	
	/**
	 * 测试留言类型删除功能
	 */
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testDelete(){
		LeaveMessageType leaveMsgType=this.leaveMsgTypeDao.findByUnique("tid", 1);
		Assert.notNull(leaveMsgType,"must not be null");
		this.leaveMsgTypeDao.delete(leaveMsgType);
	}
}
