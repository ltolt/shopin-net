package net.shopin.wms.persistence;

import java.util.List;

import net.shopin.wms.domain.entity.Channel;

import com.framework.persistence.ShoppinMysqlMapper;

@ShoppinMysqlMapper
public interface ChannelMapper {
    int deleteByPrimaryKey(Integer sid);

    int insert(Channel record);

    int insertSelective(Channel record);

    Channel selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(Channel record);

    int updateByPrimaryKey(Channel record);
    
    List selectAllChannels();
    
    List selectChannelsBySid(List<Long> sids);
    
    List selectOthers(List<Long> sids);
    
    int queryObjsCount(Channel record);
}