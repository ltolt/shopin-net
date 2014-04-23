package net.shopin.wms.persistence;

import java.util.List;

import com.framework.persistence.ShoppinMysqlMapper;

import net.shopin.wms.domain.entity.Roles;

@ShoppinMysqlMapper
public interface RolesMapper {
    int deleteByPrimaryKey(Long sid);

    int insert(Roles record);

    int insertSelective(Roles record);

    Roles selectByPrimaryKey(Long sid);

    int updateByPrimaryKeySelective(Roles record);

    int updateByPrimaryKey(Roles record);
    
    List selectList(Roles record);
    
    List selectAllRoles();
    
    Long queryMaxRoleSid();
    
//    List selectPage(Roles record);
    
//    int selectPageTotal(Roles record);
    
}