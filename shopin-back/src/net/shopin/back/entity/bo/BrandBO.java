/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.entity.boBrandBO.java
 * @Create By wangdg
 * @Create In 2013-5-13 上午10:12:18
 * TODO
 */
package net.shopin.back.entity.bo;

import java.lang.reflect.InvocationTargetException;

import net.shopin.back.entity.cond.BrandCond;
import net.shopin.back.entity.cond.ProConSearchCond;
import net.shopin.back.entity.po.Brand;
import net.shopin.back.entity.po.ProConSearch;

import org.apache.commons.beanutils.BeanUtils;

/**
 * @Class Name BrandBO
 * @Author wangdg
 * @Create In 2013-5-13
 */
public class BrandBO {
	
	public static void Con2Po(BrandCond cond,Brand brand){
		try {
			BeanUtils.copyProperties(brand, cond);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
	public static void Po2Con(Brand brand,BrandCond cond){
		try {
			BeanUtils.copyProperties(cond, brand);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}
}
