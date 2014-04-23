package net.shopin.wms.persistence;

import java.util.List;

import com.framework.persistence.ShoppinMysqlMapper;

import net.shopin.wms.domain.entity.LeaveMessageType;

@ShoppinMysqlMapper
public interface LeaveMessageTypeMapper {
    int deleteByPrimaryKey(Integer tid);

    int insert(LeaveMessageType record);

    int insertSelective(LeaveMessageType record);

    LeaveMessageType selectByPrimaryKey(Integer tid);

    int updateByPrimaryKeySelective(LeaveMessageType record);

    int updateByPrimaryKey(LeaveMessageType record);
    
    List selectByPid(Integer pid);
    
    List selectList(LeaveMessageType record);

}