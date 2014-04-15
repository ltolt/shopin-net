/**
 * @Probject Name: business
 * @Path: net.shopin.service.ChannelServiceImpl.java
 * @Create By jingpeng
 * @Create In 2013-7-11 上午10:58:30
 * TODO
 */
package net.shopin.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import net.shopin.api.IChannelService;
import net.shopin.entity.ChannelAd;
import net.shopin.entity.SecondaryChannel;
import net.shopin.entity.ShopChannels;
import net.shopin.util.HttpUtil;
import net.shopin.view.AdvertisementVO;
import net.shopin.view.BrandVO;
import net.shopin.view.ChannelVO;
import net.shopin.view.ProductCateVO;
import net.shopin.view.SecondaryChannelVO;

import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.shopin.modules.interceptor.MethodCache;
import com.shopin.modules.orm.hibernate.SimpleHibernateDao;
import com.shopin.modules.utils.DozerMapper;

/**
 * @Class Name ChannelServiceImpl
 * @Author jingpeng
 * @Create In 2013-7-11
 */


@Component("channelService")
@Scope("prototype")
@Transactional(readOnly=true)
public class ChannelServiceImpl implements IChannelService {

	private SimpleHibernateDao<SecondaryChannel, Integer> subChannelDao;
	private SimpleHibernateDao<ShopChannels, Integer> channelDao;
	private SimpleHibernateDao<ChannelAd, Integer> adDao;
	
	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.channelDao = new SimpleHibernateDao<ShopChannels, Integer>(sessionFactory, ShopChannels.class);
		this.subChannelDao = new SimpleHibernateDao<SecondaryChannel, Integer>(sessionFactory, SecondaryChannel.class);
		this.adDao = new SimpleHibernateDao<ChannelAd, Integer>(sessionFactory, ChannelAd.class);
	}
	
    @MethodCache(expire=3600)
    @Transactional(readOnly=true)
	public List<ChannelVO> findAllChannels() {
	    List<ShopChannels> channels = this.channelDao.createCriteria(new Criterion[0]).
	    		add(Restrictions.eq("show", Integer.valueOf(1))).addOrder(Order.asc("seq")).list();
	
	    if ((channels == null) || (channels.isEmpty())) {
	      return new ArrayList();
	    }
	    List listVo = new ArrayList();
	    for (ShopChannels channel : channels) {
	      ChannelVO vo = new ChannelVO();
	      DozerMapper.getInstance().map(channel, vo);
	      vo.setChannelUrl(channel.getChannel_url());
	      listVo.add(vo);
	    }
	    return listVo;
	}

    @MethodCache(expire=3600)
    @Transactional(readOnly=true)
	public ChannelVO getChannelByName(String name) {
    	if ((name == null) || ("".equals(name.trim()))) {
    	      throw new IllegalArgumentException(new StringBuilder().append("name=").append(name).toString());
	    }
	    ShopChannels channel = (ShopChannels)this.channelDao.createCriteria(new Criterion[0]).add(Restrictions.eq("name", name)).uniqueResult();

	    if (channel == null) {
	      return new ChannelVO();
	    }
	    ChannelVO vo = new ChannelVO();
	    DozerMapper.getInstance().map(channel, vo);
	    return vo;
	}

    @MethodCache(expire=3600)
    @Transactional(readOnly=true)
	public List<SecondaryChannelVO> findSubChannelsInChannel(String channelId) {
    	if ((channelId == null) || ("".equals(channelId.trim()))) {
	      throw new IllegalArgumentException(new StringBuilder().append("channelId=").append(channelId).toString());
	    }
	    List<SecondaryChannel> subChannels = this.subChannelDao.createCriteria(new Criterion[0]).add(Restrictions.eq("shopChannelSid", Integer.valueOf(channelId))).addOrder(Order.asc("seq")).list();

	    if ((subChannels == null) || (subChannels.isEmpty())) {
	      return new ArrayList();
	    }
	    List listVo = new ArrayList();
	    for (SecondaryChannel channel : subChannels) {
	      SecondaryChannelVO vo = new SecondaryChannelVO();
	      DozerMapper.getInstance().map(channel, vo);
	      listVo.add(vo);
	    }
	    return listVo;
	}

    @MethodCache(expire=3600)
    @Transactional(readOnly=true)
	public List<AdvertisementVO> findAdsInChannel(String channelId) {
    	 if ((channelId == null) || ("".equals(channelId.trim()))) {
	      throw new IllegalArgumentException(new StringBuilder().append("channelId=").append(channelId).toString());
	    }
	    List<ChannelAd> ads = this.adDao.createCriteria(new Criterion[0]).add(Restrictions.eq("shopChannelSid", Integer.valueOf(channelId))).list();

	    if ((ads == null) || (ads.isEmpty())) {
	      return new ArrayList<AdvertisementVO>();
	    }
	    List<AdvertisementVO> listVo = new ArrayList<AdvertisementVO>();
	    for (ChannelAd ad : ads) {
	      AdvertisementVO vo = new AdvertisementVO();
	      DozerMapper.getInstance().map(ad, vo);
	      listVo.add(vo);
	    }
	    return listVo;
	}
}
