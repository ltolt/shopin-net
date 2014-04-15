/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.serviceIPromotionTypeService.java
 * @Create By jingpeng
 * @Create In 2013-8-29 下午6:45:41
 * TODO
 */
package net.shopin.wms.service;

import java.util.List;

import net.shopin.wms.domain.entity.PromotionType;

/**
 * @Class Name IPromotionTypeService
 * @Author jingpeng
 * @Create In 2013-8-29
 */
public interface IPromotionTypeService {
	int deleteByPrimaryKey(Integer sid);

    int insert(PromotionType record);

    int insertSelective(PromotionType record);

    PromotionType selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(PromotionType record);

    int updateByPrimaryKey(PromotionType record);
    
    List queryBySelective(PromotionType record);
}
