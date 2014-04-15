/**
 * @Probject Name: business
 * @Path: net.shopin.service.PromotionServiceImpl.java
 * @Create By jiangzhenxue
 * @Create In 2013-7-11 上午10:51:02
 * TODO
 */
package net.shopin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.shopin.api.IPageFieldService;
import net.shopin.api.IPromotionService;
import net.shopin.entity.Promotions;
import net.shopin.exception.TemplateException;
import net.shopin.view.PageColumnVO;
import net.shopin.view.PromotionVO;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.shopin.modules.interceptor.MethodCache;
import com.shopin.modules.interceptor.ObjectCache;
import com.shopin.modules.orm.hibernate.SimpleHibernateDao;
import com.shopin.modules.utils.DozerMapper;

/**
 * @author jiangzhenxue
 * 
 */
@Component("promotionService")
@Scope("prototype")
@Transactional(readOnly = true)
@ObjectCache(expire = 600)
public class PromotionServiceImpl implements IPromotionService {

	private SimpleHibernateDao<Promotions, Integer> promotionDao;

	@Autowired
	private IPageFieldService pageFieldService;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.promotionDao = new SimpleHibernateDao<Promotions, Integer>(
				sessionFactory, Promotions.class);
	}

	/**
	 * 说明： 根据频道id获取该频道下的正在进行的活动列表
	 */
	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<PromotionVO> findPromotion(String channelId) {
		if ((channelId == null) || ("".equals(channelId.trim()))) {
			throw new IllegalArgumentException("channelId=" + channelId);
		}
		List<Promotions> promotions = this.promotionDao
				.createCriteria(new Criterion[0])
				.add(Restrictions.eq("promotionStatus", Integer.valueOf(1)))
				// .add(Restrictions.eq("promotionTypeSid", Integer.valueOf(5)))
				.add(Restrictions.le("promotionBeginTime", new Date()))
				.add(Restrictions.ge("promotionEndTime", new Date()))
				.addOrder(Order.asc("seq")).createCriteria("shopChannels")
				.add(Restrictions.eq("sid", Integer.valueOf(channelId))).list();

		if ((promotions == null) || (promotions.isEmpty())) {
			return new ArrayList<PromotionVO>();
		}
		List<PromotionVO> listVo = new ArrayList<PromotionVO>();
		for (Promotions promotion : promotions) {
			PromotionVO vo = new PromotionVO();
			DozerMapper.getInstance().map(promotion, vo);
			listVo.add(vo);
		}
		return listVo;
	}

	/**
	 * 说明： 根据频道id获取该频道下即将进行的闪购活动列表
	 */
	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<PromotionVO> findPromotionOnTheWay(String channelId) {
		if (channelId == null || "".equals(channelId.trim())) {
			throw new IllegalArgumentException("channelId=" + channelId);
		}
		List<Promotions> promotions = promotionDao.createCriteria()
				.add(Restrictions.eq("promotionTypeSid", Integer.valueOf(5)))
				.add(Restrictions.ge("promotionBeginTime", new Date()))
				.addOrder(Order.asc("promotionBeginTime"))
				.createCriteria("shopChannels")
				.add(Restrictions.eq("sid", Integer.valueOf(channelId)))
				.setMaxResults(15).list();
		if (promotions == null || promotions.isEmpty()) {
			return new ArrayList<PromotionVO>();
		}
		List<PromotionVO> listVO = new ArrayList<PromotionVO>();
		for (Promotions promotion : promotions) {
			PromotionVO vo = new PromotionVO();
			DozerMapper.getInstance().map(promotion, vo);
			listVO.add(vo);
		}
		return listVO;
	}

	/**
	 * 说明： 根据频道id获取该频道下正在疯抢的闪购活动
	 */
	@SuppressWarnings("unchecked")
	@Transactional(readOnly = true)
	public List<PromotionVO> findPromotionFengQiang(String channelId) {
		if ((channelId == null) || ("".equals(channelId.trim()))) {
			throw new IllegalArgumentException("channelId=" + channelId);
		}
		List<Promotions> promotions = this.promotionDao
				.createCriteria(new Criterion[0])
				.add(Restrictions.eq("promotionStatus", Integer.valueOf(1)))
				.add(Restrictions.eq("promotionTypeSid", Integer.valueOf(5)))
				.add(Restrictions.le(
						"promotionEndTime",
						new Date(new Date().getTime() + 1000 * 60 * 60 * 24 * 3)))
				.add(Restrictions.ge("promotionEndTime", new Date()))
				.addOrder(Order.asc("seq")).createCriteria("shopChannels")
				.add(Restrictions.eq("sid", Integer.valueOf(channelId))).list();

		if ((promotions == null) || (promotions.isEmpty())) {
			return new ArrayList<PromotionVO>();
		}
		List<PromotionVO> listVo = new ArrayList<PromotionVO>();
		for (Promotions promotion : promotions) {
			PromotionVO vo = new PromotionVO();
			DozerMapper.getInstance().map(promotion, vo);
			listVo.add(vo);
		}
		return listVo;
	}

	/**
	 * 说明： 根据活动id 获取该活动信息
	 */
	@Transactional(readOnly = true)
	public PromotionVO getPromotionVO(String promotionId) {

		if (promotionId == null || "".equals(promotionId)) {
			throw new IllegalArgumentException(new StringBuilder()
					.append("promotionId=").append(promotionId).toString());
		}

		Promotions promotion = (Promotions) this.promotionDao
				.createCriteria(new Criterion[0])
				.add(Restrictions.eq("sid", Integer.valueOf(promotionId)))
				.uniqueResult();
		PromotionVO promotionVo = new PromotionVO();
		if (promotion != null) {
			DozerMapper.getInstance().map(promotion, promotionVo);
			return promotionVo;
		}

		return promotionVo;
	}

	/**
	 * 说明： 根据活动id 获取该活动 栏目数下栏目模版列表
	 */
	@Transactional(readOnly = true)
	public List<PageColumnVO> getPromotion(String promotionId) {
		if (promotionId == null || "".equals(promotionId)) {
			throw new IllegalArgumentException(new StringBuilder()
					.append("promotionId=").append(promotionId).toString());
		}
		List<PageColumnVO> pageColumnVos = new ArrayList<PageColumnVO>();
		try {
			pageColumnVos = this.pageFieldService
					.findColumnsByPromotion(promotionId);
		} catch (TemplateException e) {
			e.printStackTrace();
		}
		return pageColumnVos;
	}

	/**
	 * 说明: 获取正在进行的闪购活动
	 */
	@SuppressWarnings("unchecked")
	@MethodCache(expire = 1800)
	@Transactional
	public List<PromotionVO> findVipPromotions() {
		List<Promotions> promotions = this.promotionDao
				.createCriteria(new Criterion[0])
				.add(Restrictions.eq("promotionStatus", Integer.valueOf(1)))
				.add(Restrictions.eq("promotionTypeSid", Integer.valueOf(5)))
				.add(Restrictions.le("promotionBeginTime", new Date()))
				.add(Restrictions.ge(
						"promotionEndTime",
						new Date(new Date().getTime() + 1000 * 60 * 60 * 24 * 1)))
				.addOrder(Order.desc("promotionBeginTime"))
				.addOrder(Order.asc("seq")).list();

		if (promotions == null || promotions.isEmpty()) {
			return new ArrayList<PromotionVO>();
		}
		List<PromotionVO> listVO = new ArrayList<PromotionVO>();
		for (Promotions promotion : promotions) {
			PromotionVO vo = new PromotionVO();
			DozerMapper.getInstance().map(promotion, vo);
			listVO.add(vo);
		}
		return listVO;
	}

	/**
	 * 说明: 获取最后疯抢的闪购活动
	 */
	@SuppressWarnings("unchecked")
	@MethodCache(expire = 1800)
	@Transactional
	public List<PromotionVO> findLastVipPromotions() {
		List<Promotions> promotions = this.promotionDao
				.createCriteria(new Criterion[0])
				.add(Restrictions.eq("promotionStatus", Integer.valueOf(1)))
				.add(Restrictions.eq("promotionTypeSid", Integer.valueOf(5)))
				.add(Restrictions.le(
						"promotionEndTime",
						new Date(new Date().getTime() + 1000 * 60 * 60 * 24 * 1)))
				.add(Restrictions.ge("promotionEndTime", new Date()))
				.addOrder(Order.asc("seq"))
				.addOrder(Order.asc("promotionEndTime"))
				.list();

		if ((promotions == null) || (promotions.isEmpty())) {
			return new ArrayList<PromotionVO>();
		}
		List<PromotionVO> listVo = new ArrayList<PromotionVO>();
		for (Promotions promotion : promotions) {
			PromotionVO vo = new PromotionVO();
			DozerMapper.getInstance().map(promotion, vo);
			listVo.add(vo);
		}
		return listVo;
	}

	/**
	 * 说明: 获取即将推出的闪购活动
	 */
	@SuppressWarnings("unchecked")
	@MethodCache(expire = 1800)
	@Transactional
	public List<PromotionVO> findFutureVipPromotions() {
		List<Promotions> promotions = promotionDao.createCriteria()
				.add(Restrictions.eq("promotionStatus", Integer.valueOf(1)))
				.add(Restrictions.eq("promotionTypeSid", Integer.valueOf(5)))
				.add(Restrictions.ge("promotionBeginTime", new Date()))
				.addOrder(Order.asc("promotionBeginTime")).setMaxResults(15)
				.list();
		if (promotions == null || promotions.isEmpty()) {
			return new ArrayList<PromotionVO>();
		}
		List<PromotionVO> listVO = new ArrayList<PromotionVO>();
		for (Promotions promotion : promotions) {
			PromotionVO vo = new PromotionVO();
			DozerMapper.getInstance().map(promotion, vo);
			listVO.add(vo);
		}
		return listVO;
	}

}
