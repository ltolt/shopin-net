/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.IPromotionService.java
 * @Create By wangdg
 * @Create In 2013-7-22 上午11:31:09
 * TODO
 */
package net.shopin.wms.service;

import java.util.List;

import net.shopin.wms.domain.entity.Promotions;
import net.shopin.wms.domain.view.PromotionsVO;

/**
 * @Class Name IPromotionService
 * @Author wangdg
 * @Create In 2013-7-22
 */
public interface IPromotionService {

	int deleteByPrimaryKey(Integer sid);

	int insert(Promotions record);

	int insertSelective(Promotions record);

	Promotions selectByPrimaryKey(Integer sid);

	int updateByPrimaryKeySelective(Promotions record);

	int updateByPrimaryKey(Promotions record);
	
	 List selectAllPromotions();
	    
	 List selectByTitle(Promotions record);
	 
	 int queryMaxSid();
	 
	 List<Promotions> selectByPrams(PromotionsVO record);
	 
	 Integer selectCountByParms(PromotionsVO record);
}
