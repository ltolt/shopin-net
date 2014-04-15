package net.shopin.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

import net.shopin.base.BaseTestContext;
import net.shopin.entity.PageLayout;
import net.shopin.entity.ShopChannels;
/**
 * 
 * @Class Name ShopChannelDao
 * @Author jiangzhenxue
 * @Create In 2013-6-13
 */
public class ShopChannelsTest extends BaseTestContext {
 private SimpleHibernateDao<ShopChannels, Integer> shopChannelsDao;
	 
//	 private SimpleHibernateDao<Brand, Integer> brandDao;
//	 
//	 private SimpleHibernateDao<RankType, Integer> rankTypeDao;
	 private SimpleHibernateDao<PageLayout, Integer> pageLayoutDao;
	 
	 @Autowired
	 public void setSessionFactory(SessionFactory sessionFactory) {
//		    rankTypeDao = new SimpleHibernateDao<RankType, Integer>(sessionFactory, RankType.class);
	        shopChannelsDao = new SimpleHibernateDao<ShopChannels, Integer>(sessionFactory, ShopChannels.class);
//	        brandDao = new SimpleHibernateDao<Brand, Integer>(sessionFactory, Brand.class);
	        pageLayoutDao = new SimpleHibernateDao<PageLayout, Integer>(sessionFactory, PageLayout.class);
	 }


//	@Test
//	@Transactional
//	@Rollback(false)
	public void testInsert(){
		//查询相关主表 :排行分类表
//		RankType rankType = this.rankTypeDao.findByUnique("sid", 2l);
//		Assert.notNull(rankType,"ranktype must not be null");
//		//相关主表: 品牌
//		Brand brand = this.brandDao.findByUnique("sid",3);
//		Assert.notNull(brand,"brand must not be null");
		ShopChannels shopChannels = new ShopChannels();
		shopChannels.setPageLayoutSid(99);
		shopChannels.setPageTemplateSid(88);
		shopChannels.setFlag(1);
		PageLayout pageLayout = pageLayoutDao.findByUnique("sid", 1);
		shopChannels.setPageLayout(pageLayout);
		shopChannels.setDisplayName("bb");
		System.out.println("nnnnnnnnnn");
		this.shopChannelsDao.save(shopChannels);
		System.out.println("nnnnn");
	}
	 
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testUpdate(){
		ShopChannels shopChannels = this.shopChannelsDao.findByUnique("sid", 139);
		System.out.println(shopChannels.getDisplayName());
		PageLayout pageLayout = pageLayoutDao.findByUnique("sid", 1);
		shopChannels.setPageLayout(pageLayout);
		Assert.notNull(shopChannels,"brandRank must not be null");
//		RankType rankType = this.rankTypeDao.findByUnique("sid",3l);
		shopChannels.setDisplayName("bbbbbbbbbbb");
		this.shopChannelsDao.save(shopChannels);
	}

	
//	@Test
//	@Transactional
//	@Rollback(false)
	public void testSelect(){
		//多表关联的查询  使用hql查询关联表
		//String hql = "from ShopChannels where sid=?";
		List list = this.shopChannelsDao.findBy("displayName", "bbbbbbbbbbb");
		for (int i = 0; i < list.size(); i++) {
			ShopChannels shopChannels=(ShopChannels) list.get(i);
			System.out.println(shopChannels.getDisplayName());
		}
		
	}
	@Test
	@Transactional
	@Rollback(false)
	public void testDelete(){
		ShopChannels shopChannels = this.shopChannelsDao.findByUnique("sid",139);
		Assert.notNull(shopChannels,"shopChannels must not be null");
		this.shopChannelsDao.delete(shopChannels);
	}
	

	
	
	
	
	
}
