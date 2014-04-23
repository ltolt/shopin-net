package net.shopin.wms.persistence;

import java.util.List;

import com.framework.persistence.ShoppinMysqlMapper;

import net.shopin.wms.domain.entity.Resources;

@ShoppinMysqlMapper
public interface ResourcesMapper {
    int deleteByPrimaryKey(Long sid);

    int insert(Resources record);

    int insertSelective(Resources record);

    Resources selectByPrimaryKey(Long sid);

    int updateByPrimaryKeySelective(Resources record);

    int updateByPrimaryKey(Resources record);
    
    List selectAllResources();
    

    List selectResourceByName(Resources record);
    
    List selectList(Resources record);
    
    List selectOthersByPrimaryKey(List<Long> sids);
    

//  List selectPage(Roles record);
  
//  int selectPageTotal(Roles record);
    
}