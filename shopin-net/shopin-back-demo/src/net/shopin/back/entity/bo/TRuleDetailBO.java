/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.boTRuleDetailBO.java
 * @Create By shiying
 * @Create In 2013-6-24 下午1:59:55
 * TODO
 */
package net.shopin.back.entity.bo;

import java.lang.reflect.InvocationTargetException;

import net.shopin.back.entity.cond.TRuleDetailCond;
import net.shopin.back.entity.po.TRuleDetail;

import org.apache.commons.beanutils.BeanUtils;

/**
 * @Class Name TRuleDetailBO
 * @Author shiying
 * @Create In 2013-6-24
 */
public class TRuleDetailBO {
	

	
	public static void Con2Po(TRuleDetailCond cond,TRuleDetail truleDetail){
		try {
			BeanUtils.copyProperties(truleDetail, cond);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	public static void Po2Con(TRuleDetail truleDetail,TRuleDetailCond cond){
		try {
			BeanUtils.copyProperties(cond, truleDetail);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}

}
