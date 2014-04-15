/**
 * @Probject Name: business
 * @Path: net.shopin.service.LeaveMessageServiceImpl.java
 * @Create By kongm
 * @Create In 2013-10-10 上午10:53:13
 * TODO
 */
package net.shopin.service;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.shopin.api.ILeaveMessageService;
import net.shopin.entity.LeaveMessage;
import net.shopin.entity.LeaveMessageType;
import net.shopin.view.LeaveMessageTypeVO;
import net.shopin.view.LeaveMessageVO;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.shopin.modules.orm.Page;
import com.shopin.modules.orm.hibernate.SimpleHibernateDao;
import com.shopin.modules.utils.DozerMapper;
import com.shopin.modules.web.view.PageVO;

/**
 * @Class Name LeaveMessageServiceImpl
 * @Author kongm
 * @Create In 2013-10-10
 */
@Component("leaveMessageService")
@Transactional()
@Scope("prototype")
public class LeaveMessageServiceImpl implements ILeaveMessageService {

	private SimpleHibernateDao<LeaveMessage, Integer> leaveMsgDao;
	private SimpleHibernateDao<LeaveMessageType, Integer> messageTypeDao;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		leaveMsgDao = new SimpleHibernateDao<LeaveMessage, Integer>(
				sessionFactory, LeaveMessage.class);
		messageTypeDao = new SimpleHibernateDao<LeaveMessageType, Integer>(
				sessionFactory, LeaveMessageType.class);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * net.shopin.api.ILeaveMessageService#saveLeaveMessage(net.shopin.view.
	 * LeaveMessageVO)
	 */
	@Override
	public void saveLeaveMessage(LeaveMessageVO leaveMessageVO) {

		Assert.notNull(leaveMessageVO, "要保存的对象为空！");
		Assert.isNull(leaveMessageVO.getMsgId(), "新增的对象不能为空！");
		LeaveMessage leaveMessage = new LeaveMessage();
		DozerMapper.getInstance().map(leaveMessageVO, leaveMessage);
		leaveMessage.setLeaveMsgTime(new Timestamp(new Date().getTime()));
		LeaveMessageType leaveMsgType = this.messageTypeDao.findByUnique("tid",
				Integer.valueOf(leaveMessageVO.getLeaveMessageType().getTid()));
		leaveMessage.setLeaveMessageType(leaveMsgType);
		leaveMessage.setReplayStatu(Integer.valueOf(0));
		leaveMessage.setCommonVisible(Integer.valueOf(0));
		leaveMessage.setReplayContent("尚未回复，请耐心等待！");
		Criteria criteria = this.leaveMsgDao
				.createCriteria(new Criterion[0])
				.setProjection(Projections.rowCount())
				.add(Restrictions.and(
						Restrictions.eq("userEmail",
								leaveMessageVO.getUserEmail()),
						Restrictions.eq("blankList", Integer.valueOf(1))));

		Long counts = (Long) criteria.uniqueResult();
		if (counts.longValue() < 1L)
			leaveMessage.setBlankList(Integer.valueOf(0));
		else {
			leaveMessage.setBlankList(Integer.valueOf(1));
		}
		this.leaveMsgDao.save(leaveMessage);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * net.shopin.api.ILeaveMessageService#findLeaveMessage(com.shopin.modules
	 * .web.view.PageVO, net.shopin.view.LeaveMessageVO)
	 */
	@Override
	public PageVO<LeaveMessageVO> findLeaveMessage(
			PageVO<LeaveMessageVO> pageVO, LeaveMessageVO leaveMessageVO)
			throws ParseException {
		Criteria criteria = this.leaveMsgDao.createCriteria(new Criterion[0]);

		if (null != leaveMessageVO) {
			if ((leaveMessageVO.getUserEmail() != null)
					&& (!"".equals(leaveMessageVO.getUserEmail().trim()))) {
				criteria.add(Restrictions.eq("userEmail", leaveMessageVO
						.getUserEmail().trim()));
			}

			if ((leaveMessageVO.getCommonVisible() != null)
					&& (!"".equals(leaveMessageVO.getCommonVisible()))) {
				criteria.add(Restrictions.eq("commonVisible", Integer
						.valueOf(Integer.parseInt(leaveMessageVO
								.getCommonVisible()))));
			}

			if ((leaveMessageVO.getMsgContent() != null)
					&& (!"".equals(leaveMessageVO.getMsgContent()))) {
				criteria.add(Restrictions.or(Restrictions.like("msgContent",
						leaveMessageVO.getMsgContent().trim(),
						MatchMode.ANYWHERE), Restrictions.like("replayContent",
						leaveMessageVO.getReplayContent().trim(),
						MatchMode.ANYWHERE)));
			}
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			if ((leaveMessageVO.getStartTime() != null)
					&& (!"".equals(leaveMessageVO.getStartTime()))) {
				Date start = format.parse(leaveMessageVO.getStartTime());
				if ((leaveMessageVO.getEndTime() != null)
						&& (!"".equals(leaveMessageVO.getEndTime()))) {
					Date end = format.parse(leaveMessageVO.getEndTime());
					criteria.add(Restrictions.between("leaveMsgTime", start,
							end));
				} else {
					criteria.add(Restrictions.between("leaveMsgTime",
							leaveMessageVO.getStartTime(), new Date()));
				}
			}
			if ((leaveMessageVO.getOrderKey() != null)
					&& (!"".equals(leaveMessageVO.getOrderKey().trim()))) {
				if ("desc".equals(leaveMessageVO.getOrderKey().trim()))
					criteria.addOrder(Order.desc("leaveMsgTime"));
				else if ("asc".equals(leaveMessageVO.getOrderKey().trim())) {
					criteria.addOrder(Order.asc("leaveMsgTime"));
				}
			} else {
				criteria.addOrder(Order.asc("leaveMsgTime"));
			}

		}

		return findLeaveMessage(pageVO, criteria);
	}

	private PageVO<LeaveMessageVO> findLeaveMessage(
			PageVO<LeaveMessageVO> pageVo, Criteria criteria) {
		if ((pageVo == null) || (criteria == null)) {
			throw new IllegalArgumentException("pageVo=" + pageVo
					+ ", criteria=" + criteria);
		}

		Page page = new Page();
		DozerMapper.getInstance().map(pageVo, page);
		page = this.leaveMsgDao.find(page, criteria);
		List<LeaveMessage> messages = page.getResult();
		if ((messages == null) || (messages.isEmpty())) {
			return new PageVO();
		}
		DozerMapper.getInstance().map(page, pageVo);

		List leaveMessageVOs = new ArrayList();
		for (LeaveMessage msg : messages) {
			LeaveMessageVO msgVO = new LeaveMessageVO();
			DozerMapper.getInstance().map(msg, msgVO);
			leaveMessageVOs.add(msgVO);
		}
		pageVo.setList(leaveMessageVOs);

		return pageVo;
	}

	@Transactional(readOnly = true)
	public List<LeaveMessageTypeVO> getAllFirstLevelCate() {
		Criteria criteria = this.messageTypeDao
				.createCriteria(new Criterion[0]);
		criteria.add(Restrictions.isNull("parentType.tid"));
		criteria.addOrder(Order.asc("typeOrder"));
		List<LeaveMessageType> parentTypes = criteria.list();
		List leaveMessageTypeVOs = new ArrayList();
		for (LeaveMessageType msgType : parentTypes) {
			LeaveMessageTypeVO messageVO = new LeaveMessageTypeVO();
			DozerMapper.getInstance().map(msgType, messageVO);
			leaveMessageTypeVOs.add(messageVO);
		}
		return leaveMessageTypeVOs;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * net.shopin.api.ILeaveMessageService#getSubMessageTypeByPid(java.lang.
	 * String)
	 */
	@Override
	public List<LeaveMessageTypeVO> getSubMessageTypeByPid(String pid) {
		if ((null == pid) || ("".equals(pid.trim()))) {
			throw new IllegalArgumentException("上级类型的pid不能为空！");
		}

		Criteria criteria = this.messageTypeDao
				.createCriteria(new Criterion[0]);
		criteria.add(Restrictions.eq("parentType.tid",
				Integer.valueOf(Integer.parseInt(pid))));
		criteria.addOrder(Order.asc("typeOrder"));
		List<LeaveMessageType> subMsgTypes = criteria.list();
		List leaveMessageTypeVOs = new ArrayList();
		for (LeaveMessageType msgType : subMsgTypes) {
			LeaveMessageTypeVO messageVO = new LeaveMessageTypeVO();
			DozerMapper.getInstance().map(msgType, messageVO);
			leaveMessageTypeVOs.add(messageVO);
		}
		return leaveMessageTypeVOs;
	}

}
