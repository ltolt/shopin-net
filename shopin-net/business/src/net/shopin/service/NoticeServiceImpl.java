/**
 * @Probject Name: business
 * @Path: net.shopin.service.NoticeServiceImpl.java
 * @Create By jiangzhenxue
 * @Create In 2013-7-11 下午1:59:20
 * TODO
 */
package net.shopin.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.shopin.modules.interceptor.ObjectCache;
import com.shopin.modules.orm.Page;
import com.shopin.modules.orm.hibernate.SimpleHibernateDao;
import com.shopin.modules.utils.DozerMapper;
import com.shopin.modules.web.view.PageVO;

import net.shopin.api.INoticeService;
import net.shopin.entity.ShopNotices;
import net.shopin.view.NoticeVO;

/**
 * @author jiangzhenxue
 * 
 */
@Component("noticeService")
@Scope("prototype")
@Transactional(readOnly = true)
@ObjectCache(expire = 3600)
public class NoticeServiceImpl implements INoticeService {

	/*
	 * (non-Javadoc)
	 * 
	 * @see net.shopin.api.INoticeService#findNoticesByCate(java.lang.String)
	 */
	private SimpleHibernateDao<ShopNotices, Integer> noticeDao;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.noticeDao = new SimpleHibernateDao<ShopNotices, Integer>(sessionFactory,
				ShopNotices.class);
	}
	
	public List<NoticeVO> findNoticesByCate(String cateId) {
		if ((cateId == null) || ("".equals(cateId.trim()))) {
			throw new IllegalArgumentException("cateId=" + cateId);
		}
		List<ShopNotices> notices = this.noticeDao
				.createCriteria(new Criterion[0])
				.add(Restrictions.eq("noticeTypeSid", Integer.valueOf(cateId)))
				.add(Restrictions.eq("status", Integer.valueOf(1)))
				.addOrder(Order.asc("seq")).setMaxResults(10).list();

		if ((notices == null) || (notices.isEmpty())) {
			return new ArrayList();
		}
		List<NoticeVO> listVo = new ArrayList();
		for (ShopNotices notice : notices) {
			NoticeVO vo = new NoticeVO();
			DozerMapper.getInstance().map(notice, vo);
			listVo.add(vo);
		}
		return listVo;
	}
	
	/**
	 * 说明:
	 *     根据公告id获取公告信息
	 */
	public NoticeVO getNoticeById(String noticeId) {
		if(noticeId == null || "".equals(noticeId.trim())){
			throw new IllegalArgumentException("noticeId = ".concat(noticeId));
		}
		ShopNotices notice = (ShopNotices) noticeDao.createCriteria()
				.add(Restrictions.eq("sid", Integer.valueOf(noticeId)))
				.uniqueResult();
		if(notice == null)return new NoticeVO();
		NoticeVO noticeVo = new NoticeVO();
		DozerMapper.getInstance().map(notice, noticeVo);
		return noticeVo;
	}
	/**
	 * 说明:获取一页公告
	 */
	public PageVO<NoticeVO> getNoticePage(PageVO<NoticeVO> pageVo, String cateId) {
		Criteria criteria = noticeDao.createCriteria()
				.add(Restrictions.eq("noticeTypeSid", Integer.valueOf(cateId)))
				.add(Restrictions.eq("status", 1))//生效的公告
				.addOrder(Order.asc("seq"));
		Page<ShopNotices> page = new Page<ShopNotices>();
		DozerMapper.getInstance().map(pageVo, page);
		//分页
		page = noticeDao.find(page, criteria);
		//转换po为vo
		List<ShopNotices> poList = page.getResult();
		if(poList == null || poList.isEmpty())
			return new PageVO<NoticeVO>();
		DozerMapper.getInstance().map(page, pageVo);
		List<NoticeVO> listVo = new ArrayList<NoticeVO>();
		for(ShopNotices po : poList){
			NoticeVO vo = new NoticeVO();
			DozerMapper.getInstance().map(po, vo);
			listVo.add(vo);
		}
		pageVo.setList(listVo);
		return pageVo;
	}
}
