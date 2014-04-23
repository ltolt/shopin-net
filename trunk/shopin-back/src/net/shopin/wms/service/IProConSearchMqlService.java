/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.IProConSearchMqlService.java
 * @Create By wangdg
 * @Create In 2013-9-16 下午2:06:15
 * TODO
 */
package net.shopin.wms.service;

import net.shopin.back.view.ProductKey;
import net.shopin.wms.domain.entity.ProConSearchMql;

/**
 * @Class Name IProConSearchMqlService
 * @Author wangdg
 * @Create In 2013-9-16
 */
public interface IProConSearchMqlService {

	int deleteByPrimaryKey(Integer sid);

	int insert(ProConSearchMql record);

	int insertSelective(ProConSearchMql record);

	ProConSearchMql selectByPrimaryKey(Integer sid);

	int updateByPrimaryKeySelective(ProConSearchMql record);

	int updateByPrimaryKey(ProConSearchMql record);

	void updateProConSearch(ProductKey productKey);
}
