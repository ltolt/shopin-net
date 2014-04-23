/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.mapperShopChannelsMapper.java
 * @Create By wangdg
 * @Create In 2013-5-9 下午4:51:46
 * TODO
 */
package net.shopin.back.mapper;

import java.util.List;

import net.shopin.back.entity.cond.ShopChannelsCond;
import net.shopin.back.entity.po.ShopChannels;
import net.shopin.back.entity.vo.ShopChannelsVO;

import com.framework.IAbstractDAO;
import com.framework.persistence.ShoppinMapper;

/**
 * @Class Name ShopChannelsMapper
 * @Author wangdg
 * @Create In 2013-5-9
 */
@ShoppinMapper
public interface ShopChannelsMapper extends IAbstractDAO<ShopChannelsCond, ShopChannels, ShopChannelsVO> {

	
	List  queryAllChannels();
	
	
}
