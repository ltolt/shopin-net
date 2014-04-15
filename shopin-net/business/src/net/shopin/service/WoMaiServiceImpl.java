/**
 * @Probject Name: business
 * @Path: net.shopin.service.WoMaiServiceImpl.java
 * @Create By jingpeng
 * @Create In 2014-1-12 上午10:42:56
 * TODO
 */
package net.shopin.service;

import net.shopin.api.IWoMaiService;
import net.shopin.entity.WoMai;
import net.shopin.view.WoMaiVO;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

/**
 * @Class Name WoMaiServiceImpl
 * @Author jingpeng
 * @Create In 2014-1-12
 */
@Component("womaiService")
@Scope("prototype")
@Transactional(readOnly = true)
public class WoMaiServiceImpl implements IWoMaiService {

	private SimpleHibernateDao<WoMai, Integer> woMaiDao;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.woMaiDao = new SimpleHibernateDao<WoMai, Integer>(
				sessionFactory, WoMai.class);
	}
	
	@Transactional
	public WoMaiVO getWoMaiByFlag() {
		Criteria criteria = this.woMaiDao.createCriteria(new Criterion[0]);
		WoMai womai = (WoMai) criteria.add(Restrictions.eq("flag", 0))
				.addOrder(Order.asc("sid")).setMaxResults(1).uniqueResult();
		WoMaiVO woMaiVO = new WoMaiVO();
		if(womai != null && womai.getSid() != null) {
			woMaiVO.setSid(womai.getSid());
			woMaiVO.setCardNo(womai.getCardNo());
			woMaiVO.setCardPassword(womai.getCardPassword());
			//将flag置为1
			womai.setFlag(1);
			this.woMaiDao.save(womai);
		}
		return woMaiVO;
	}

}
