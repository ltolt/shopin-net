/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.IRoleResource.java
 * @Create By wangdg
 * @Create In 2013-7-8 下午2:17:24
 * TODO
 */
package net.shopin.wms.service;

import java.util.List;

import net.shopin.wms.domain.entity.RoleResource;
import net.shopin.wms.domain.view.RoleResourceVO;

/**
 * @Class Name IRoleResource
 * @Author wangdg
 * @Create In 2013-7-8
 */
public interface IRoleResourceService{

	int insert(RoleResource record);

    int insertSelective(RoleResource record);
    
    List selectByRoleSid(Long sid);
    
    void deleteByRoleSid(Long sid);
}
