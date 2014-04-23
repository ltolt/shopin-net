/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.boTRuleNewChannelBO.java
 * @Create By Administrator
 * @Create In 2013-5-28 下午1:26:28
 * TODO
 */
package net.shopin.back.entity.bo;

import java.lang.reflect.InvocationTargetException;

import net.shopin.back.entity.cond.TRuleNewChannelCond;
import net.shopin.back.entity.cond.TRuleNewCond;
import net.shopin.back.entity.po.TRuleNew;
import net.shopin.back.entity.po.TRuleNewChannel;

import org.apache.commons.beanutils.BeanUtils;

/**
 * @Class Name TRuleNewChannelBO
 * @Author Administrator
 * @Create In 2013-5-28
 */
public class TRuleNewChannelBO {
	
	public static void Con2Po(TRuleNewChannelCond cond,TRuleNewChannel truleNewChannel){
		try {
			BeanUtils.copyProperties(truleNewChannel, cond);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	public static void Po2Con(TRuleNewChannel truleNewChannel,TRuleNewChannelCond cond){
		try {
			BeanUtils.copyProperties(cond, truleNewChannel);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}

}
