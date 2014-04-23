/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.serviceIShopChannelsService.java
 * @Create By wangdg
 * @Create In 2013-5-9 下午7:30:53
 * TODO
 */
package net.shopin.back.service;

import java.util.List;

import net.shopin.back.entity.cond.ShopChannelsCond;
import net.shopin.back.entity.po.ShopChannels;
import net.shopin.back.entity.vo.ShopChannelsVO;

import com.framework.IAbstractService;

/**
 * @Class Name IShopChannelsService
 * @Author wangdg
 * @Create In 2013-5-9
 */
public interface IShopChannelsService extends IAbstractService<ShopChannelsCond, ShopChannels, ShopChannelsVO> {

	public List  queryAllChannels();
}
