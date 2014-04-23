package net.shopin.wms.persistence;

import java.util.List;

import net.shopin.wms.domain.entity.RoleResource;
import net.shopin.wms.domain.view.RoleResourceVO;

import com.framework.persistence.ShoppinMysqlMapper;

@ShoppinMysqlMapper
public interface RoleResourceMapper {
    int insert(RoleResource record);

    int insertSelective(RoleResource record);
    
    List selectByRoleSid(Long sid);
    
    List selectResourceSidByRoleSid(Long sid);
    
    void deleteByRoleSid(Long sid);
    
}