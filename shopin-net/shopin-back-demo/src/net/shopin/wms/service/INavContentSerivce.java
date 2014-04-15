/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.INavContentSerivce.java
 * @Create By wangdg
 * @Create In 2013-7-22 上午11:33:43
 * TODO
 */
package net.shopin.wms.service;

import net.shopin.wms.domain.entity.NavContent;

/**
 * @Class Name INavContentSerivce
 * @Author wangdg
 * @Create In 2013-7-22
 */
public interface INavContentSerivce {

	 int deleteByPrimaryKey(Long sid);

	    int insert(NavContent record);

	    int insertSelective(NavContent record);

	    NavContent selectByPrimaryKey(Long sid);

	    int updateByPrimaryKeySelective(NavContent record);

	    int updateByPrimaryKey(NavContent record);
}
