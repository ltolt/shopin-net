/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.boTRuleNewBO.java
 * @Create By Administrator
 * @Create In 2013-5-27 下午6:57:53
 * TODO
 */
package net.shopin.back.entity.bo;

import java.lang.reflect.InvocationTargetException;
import org.apache.commons.beanutils.BeanUtils;
import net.shopin.back.entity.cond.TRuleNewCond;
import net.shopin.back.entity.po.TRuleNew;



/**
 * @Class Name TRuleNewBO
 * @Author shiying
 * @Create In 2013-5-27
 */
public class TRuleNewBO {
	public static void Con2Po(TRuleNewCond cond,TRuleNew truleNew){
		try {
			BeanUtils.copyProperties(truleNew, cond);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	public static void Po2Con(TRuleNew truleNew,TRuleNewCond cond){
		try {
			BeanUtils.copyProperties(cond, truleNew);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
}
