package net.shopin.dao;
/**
 * 
 */
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
import net.shopin.entity.ChannelAd;
import net.shopin.entity.SecondaryChannel;
import net.shopin.entity.ShopChannels;

public class ChannelAdTest extends BaseTestContext {
private SimpleHibernateDao<ChannelAd, Integer> channelAdDao;
private SimpleHibernateDao<ShopChannels, Integer> shopChannelDao;	
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
    	channelAdDao = new SimpleHibernateDao<ChannelAd, Integer>(sessionFactory, ChannelAd.class);
    	shopChannelDao = new SimpleHibernateDao<ShopChannels, Integer>(sessionFactory, ShopChannels.class);
    }
	
//	@Test
//	@Transactional
//	@Rollback(false)
//	public void testInsert(){
//		Assert.notNull(this.channelAdDao);
//		ChannelAd channelAd = new ChannelAd();
//		ShopChannels shopChannels = this.shopChannelDao.findByUnique("sid", 2);
//		channelAd.setShopChannels(shopChannels);
//		channelAd.setLink("15811111111");
//		channelAd.setMemo("这个不错");
//		channelAd.setPositioname("福建");
//		channelAd.setPic("abc");
//		channelAd.setPositiotag("aiya");
//		this.channelAdDao.save(channelAd);
//	}

//	@Test
//	@Transactional
//	@Rollback(false)
	public void testUpdate(){
		ChannelAd channelAd=  this.channelAdDao.findByUnique("sid", 3);
		ShopChannels shopChannels = this.shopChannelDao.findByUnique("sid", 5);
		channelAd.setShopChannels(shopChannels);
		channelAd.setLink("mn");
		channelAd.setPositioname("山东");
		this.channelAdDao.save(channelAd);
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testSelect(){
		List brandList =  this.channelAdDao.createCriteria().add(Restrictions.like("link","15811111111",MatchMode.ANYWHERE))
							.addOrder(Order.asc("sid")).list();
	    for (int i = 0; i < brandList.size(); i++) {
			System.out.println(((ChannelAd)brandList.get(i)).getPositioname());
		}
		System.out.println(brandList);
		
	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testDelete(){
		ChannelAd channelAd = 	this.channelAdDao.findByUnique("sid", 3);
		Assert.notNull(channelAd,"must not be null");
		this.channelAdDao.delete(channelAd);
	}
}
