/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.INavPromotionService.java
 * @Create By wangdg
 * @Create In 2013-7-22 上午11:33:18
 * TODO
 */
package net.shopin.wms.service;

import java.util.List;

import net.shopin.wms.domain.entity.NavPromotion;

/**
 * @Class Name INavPromotionService
 * @Author wangdg
 * @Create In 2013-7-22
 */
public interface INavPromotionService {
	
	List<NavPromotion>  selectByNavSid(NavPromotion record);
	
	int insert(NavPromotion record);
	
	int countNavPromotionRecord(NavPromotion record);

	int insertSelective(NavPromotion record);
	
	int deleteByNavPro(NavPromotion record);
}
