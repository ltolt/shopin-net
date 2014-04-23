package net.shopin.wms.persistence;


import java.util.List;

import net.shopin.wms.domain.entity.RoleChannel;

import com.framework.persistence.ShoppinMysqlMapper;

@ShoppinMysqlMapper
public interface RoleChannelMapper {
	/**
	 * 删除roles和channel的对应关系
	 */
	int deleteByParamter(RoleChannel record);
	
	void deleteByRoleSid(Long sid);
	
    int insert(RoleChannel record);

    int insertSelective(RoleChannel record);
    
    List selectList(RoleChannel record);
    
    List selectAllRoleChannel();
}