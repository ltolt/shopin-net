/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.serviceINavigationService.java
 * @Create By wangdg
 * @Create In 2013-7-22 上午11:24:18
 * TODO
 */
package net.shopin.wms.service;

import java.util.List;

import net.shopin.wms.domain.entity.Navigation;

/**
 * @Class Name INavigationService
 * @Author wangdg
 * @Create In 2013-7-22
 */
public interface INavigationService {

	int deleteByPrimaryKey(Long sid);

	int insert(Navigation record);

	int insertSelective(Navigation record);

	Navigation selectByPrimaryKey(Long sid);

	int updateByPrimaryKeySelective(Navigation record);

	int updateByPrimaryKey(Navigation record);

	List selectList(Navigation record);

	int selectCountBycalssSid(String classSid);
}
