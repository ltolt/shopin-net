package net.shopin.wms.persistence;

import java.util.List;

import net.shopin.back.entity.vo.TRuleNewChannelVO;
import net.shopin.wms.domain.entity.TRuleNewChannelMql;
import net.shopin.wms.util.ChannelsMqlVO;

public interface TRuleNewChannelMqlMapper {
    int deleteByPrimaryKey(Integer sid);

    int insert(TRuleNewChannelMql record);

    int insertSelective(TRuleNewChannelMql record);

    TRuleNewChannelMql selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(TRuleNewChannelMql record);

    int updateByPrimaryKey(TRuleNewChannelMql record);
    
    List<ChannelsMqlVO> findChannels();
    
    List<TRuleNewChannelMql> findRuleSid(Integer channelSid);
}