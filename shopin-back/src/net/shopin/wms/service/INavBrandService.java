/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.INavBrandService.java
 * @Create By wangdg
 * @Create In 2013-7-22 上午11:32:13
 * TODO
 */
package net.shopin.wms.service;

import java.util.List;

import net.shopin.wms.domain.entity.NavBrand;

/**
 * @Class Name INavBrandService
 * @Author wangdg
 * @Create In 2013-7-22
 */
public interface INavBrandService {

	int deleteByPrimaryKey(Long sid);

    int insert(NavBrand record);

    int insertSelective(NavBrand record);

    NavBrand selectByPrimaryKey(Long sid);

    int updateByPrimaryKeySelective(NavBrand record);

    int updateByPrimaryKey(NavBrand record);
    
    List selectNavBrandByNavSid(NavBrand record);
    
    int countNavBrandRecord(NavBrand record);
    
    
}
