/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.boProBestDetailBO.java
 * @Create By shiying
 * @Create In 2013-5-13 上午10:16:57
 * TODO
 */
package net.shopin.back.entity.bo;

import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;

import net.shopin.back.entity.cond.ProBestDetailCond;
import net.shopin.back.entity.po.ProBestDetail;

/**
 * @Class Name ProBestDetailBO
 * @Author shiying
 * @Create In 2013-5-13
 */
public class ProBestDetailBO {
	public static void Con2Po(ProBestDetailCond cond,ProBestDetail proBestDetail){
		try {
			BeanUtils.copyProperties(proBestDetail, cond);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	
	public static void Po2Con(ProBestDetail proBestDetail,ProBestDetailCond cond){
		try {
			BeanUtils.copyProperties(cond,proBestDetail);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}

}
