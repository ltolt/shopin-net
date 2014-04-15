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
import net.shopin.entity.Promotions;
import net.shopin.entity.SecondaryChannel;
import net.shopin.entity.ShopChannels;
/**
 * 
 * @Class Name SecondaryChannelTest
 * @Author jiangzhenxue
 * @Create In 2013-6-13
 */
public class SecondaryChannelTest extends BaseTestContext {
	
    private SimpleHibernateDao<ShopChannels, Integer>  channelDao;
	 
	private SimpleHibernateDao<SecondaryChannel, Integer> secondaryChannelDao;
	
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
    	secondaryChannelDao = new SimpleHibernateDao<SecondaryChannel, Integer>(sessionFactory, SecondaryChannel.class);
    	channelDao = new SimpleHibernateDao<ShopChannels, Integer>(sessionFactory, ShopChannels.class);
    }
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testInsert(){
		Assert.notNull(this.secondaryChannelDao);
		SecondaryChannel secondaryChannel = new SecondaryChannel();
		secondaryChannel.setLink("abc");
		secondaryChannel.setName("zhangdan23");
		secondaryChannel.setSeq(12);
		ShopChannels channel = this.channelDao.findByUnique("sid", 2);
		secondaryChannel.setShopChannels(channel);
		this.secondaryChannelDao.save(secondaryChannel);
	}

//	@Test
//	@Transactional
//	@Rollback(false)
//	public void testUpdate(){
//		SecondaryChannel secondaryChannel=  this.secondaryChannelDao.findByUnique("sid", 4);
//		ShopChannels shopChannels = this.channelDao.findByUnique("sid", 5);
//		secondaryChannel.setLink("mn");
//		secondaryChannel.setShopChannels(shopChannels);
//		this.secondaryChannelDao.save(secondaryChannel);
//	}
	
	@Test
	@Transactional
	@Rollback(false)
	public void testSelect(){
		List brandList =  this.secondaryChannelDao.createCriteria().add(Restrictions.like("name","zhangdan23",MatchMode.ANYWHERE))
							.addOrder(Order.asc("sid")).list();
	    for (int i = 0; i < brandList.size(); i++) {
			System.out.println(((SecondaryChannel)brandList.get(i)).getName());
		}
		System.out.println(brandList);
		
	}
	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testDelete(){
		SecondaryChannel record = 	this.secondaryChannelDao.findByUnique("sid", 3);
		Assert.notNull(record,"must not be null");
		this.secondaryChannelDao.delete(record);
	}
}
