/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.serviceIPageLayoutMqlService.java
 * @Create By jingpeng
 * @Create In 2013-8-29 下午6:41:53
 * TODO
 */
package net.shopin.wms.service;

import java.util.List;

import net.shopin.wms.domain.entity.PageLayoutMql;

/**
 * @Class Name IPageLayoutMqlService
 * @Author jingpeng
 * @Create In 2013-8-29
 */
public interface IPageLayoutMqlService {
	int deleteByPrimaryKey(Integer sid);

    int insert(PageLayoutMql record);

    int insertSelective(PageLayoutMql record);

    PageLayoutMql selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(PageLayoutMql record);

    int updateByPrimaryKey(PageLayoutMql record);
    
    int queryMaxSid();
    
    int queryObjsCount(PageLayoutMql record);
    
    List queryBySelective(Integer channelSid);
    
    List  queryChildPageLayout(Long pageLayoutSid);
    
    List queryByChannel(Integer channelSid);
}
