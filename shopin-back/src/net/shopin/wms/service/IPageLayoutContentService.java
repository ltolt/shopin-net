/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.serviceIPageLayoutContentService.java
 * @Create By jingpeng
 * @Create In 2013-8-29 下午6:41:17
 * TODO
 */
package net.shopin.wms.service;

import net.shopin.wms.domain.entity.PageLayoutContent;

/**
 * @Class Name IPageLayoutContentService
 * @Author jingpeng
 * @Create In 2013-8-29
 */
public interface IPageLayoutContentService {
	int deleteByPrimaryKey(Integer sid);

    int insert(PageLayoutContent record);

    int insertSelective(PageLayoutContent record);

    PageLayoutContent selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(PageLayoutContent record);

    int updateByPrimaryKey(PageLayoutContent record);
}
