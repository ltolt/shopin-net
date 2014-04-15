package net.shopin.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.LeaveMessage;
import net.shopin.entity.LeaveMessageType;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

/**
 * 
 * @Description： 留言测试类
 * @ClassName:LeaveMessageTest
 * @author： huyy
 * @date: 2013-7-10
 */
public class LeaveMessageTest extends BaseTestContext{
	private SimpleHibernateDao<LeaveMessage, Integer> leaveMsgDao;
	private SimpleHibernateDao<LeaveMessageType, Integer> leaveMsgTypeDao;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.leaveMsgDao = new SimpleHibernateDao<LeaveMessage, Integer>(
				sessionFactory, LeaveMessage.class);
		this.leaveMsgTypeDao = new SimpleHibernateDao<LeaveMessageType, Integer>(
				sessionFactory, LeaveMessageType.class);
	}
	
	/**
	 * 测试留言添加功能
	 */
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testInsert(){
		
		LeaveMessageType leaveMsgType = this.leaveMsgTypeDao.findByUnique(
				"tid", 6);
		Assert.notNull(this.leaveMsgDao);
		LeaveMessage leaveMsg=new LeaveMessage();
		leaveMsg.setLeaveMessageType(leaveMsgType);
		leaveMsg.setMsgContent("速速归来");
		leaveMsg.setReplayContent("等下归来");
		Timestamp time=new Timestamp((new Date().getTime()));
		leaveMsg.setLeaveMsgTime(time);
		leaveMsg.setReplayTime(time);
		leaveMsg.setReplayer("阿南");
		leaveMsg.setReplayStatu(1);
		leaveMsg.setCommonVisible(1);
		leaveMsg.setDisableReson("无原因");
		leaveMsg.setNeedReplay(1);
		leaveMsg.setUserEmail("1122345@qq.com");
		leaveMsg.setBlankList(0);
		leaveMsg.setUserName("rt");
		leaveMsg.setTel("124678567890");
		leaveMsg.setOrderId("yu785t5643");
		leaveMsg.setUserProvince("北京市");
		this.leaveMsgDao.save(leaveMsg);
	}
	
	/**
	 * 测试留言修改功能
	 */
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testUpdate(){
		LeaveMessage leaveMsg=this.leaveMsgDao.findByUnique("msgId",1);
		Assert.notNull(leaveMsg);
		leaveMsg.setMsgContent("鸡飞狗跳容貌变化kg头发人民币快乐");
		this.leaveMsgDao.save(leaveMsg);
	}
	
	/**
	 * 测试留言查询功能
	 */
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testSelect(){
		//关联查询
		String hql = "from LeaveMessage lm, LeaveMessageType lmt where lm.leaveMessageType.tid = lmt.tid and lm.msgId = ?";
		List list = this.leaveMsgDao.find(hql, 2);
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
	@Test
	public void testLazySelect() {
		List<LeaveMessage> ls = this.leaveMsgDao.createCriteria().list();
		for(LeaveMessage l: ls) {
			System.out.println(l.getLeaveMessageType().getCatename());
		}
	}
	/**
	 * 测试留言删除功能
	 */
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testDelete(){
		LeaveMessage leaveMsg=this.leaveMsgDao.findByUnique("msgId",1);
		Assert.notNull(leaveMsg);
		this.leaveMsgDao.delete(leaveMsg);
	}
}
