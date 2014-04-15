package net.shopin.wms.service;

import java.util.List;

import net.shopin.wms.domain.entity.Roles;

public interface IRolesService {
	
	int deleteByPrimaryKey(Long sid);

    int insert(Roles record);

    int insertSelective(Roles record);

    Roles selectByPrimaryKey(Long sid);

    int updateByPrimaryKeySelective(Roles record);

    int updateByPrimaryKey(Roles record);
    
    List selectAllRoles();
    
    List selectList(Roles record);
    
    Long queryMaxRoleSid();
    
//    List selectPage(Roles record);
    
//    int selectPageTotal(Roles record);
	
	
	
	
	

}
