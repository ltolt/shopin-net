/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.boShopChannelsBO.java
 * @Create By wangdg
 * @Create In 2013-5-9 下午4:33:56
 * TODO
 */
package net.shopin.back.entity.bo;

import java.lang.reflect.InvocationTargetException;

import net.shopin.back.entity.cond.ShopChannelsCond;
import net.shopin.back.entity.po.ShopChannels;

import org.apache.commons.beanutils.BeanUtils;

import com.demo.entity.cond.UserCond;
import com.demo.entity.po.User;

/**
 * @Class Name ShopChannelsBO
 * @Author wangdg
 * @Create In 2013-5-9
 */
public class ShopChannelsBO {
	
	public static void Con2Po(ShopChannelsCond cond,ShopChannels shopChannels){
		try {
			BeanUtils.copyProperties(shopChannels, cond);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	
	public static void Po2Con(ShopChannels shopChannels,ShopChannelsCond cond){
		try {
			BeanUtils.copyProperties(cond,shopChannels);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
}
