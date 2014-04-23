/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.serviceIShopChannelService.java
 * @Create By wangdg
 * @Create In 2013-7-5 下午3:51:24
 * TODO
 */
package net.shopin.wms.service;

import java.util.List;

import net.shopin.wms.domain.entity.Channel;


/**
 * @Class Name IShopChannelService
 * @Author wangdg
 * @Create In 2013-7-5
 */
public interface IChannelService {

	int deleteByPrimaryKey(Integer sid);

    int insert(Channel record);

    int insertSelective(Channel record);

    Channel selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(Channel record);

    int updateByPrimaryKey(Channel record);
    
    List selectAllChannles();
    
    List selectChannelsBySid(List<Long> sids);
    
    List selectOthers(List<Long> sids);
}
