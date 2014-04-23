package net.shopin.wms.persistence;

import java.util.List;

import net.shopin.back.entity.vo.TRuleDetailVO;
import net.shopin.wms.domain.entity.TRuleDetailMql;
import net.shopin.wms.util.DetailsMqlVO;

public interface TRuleDetailMqlMapper {
    int deleteByPrimaryKey(Integer sid);

    int insert(TRuleDetailMql record);

    int insertSelective(TRuleDetailMql record);

    TRuleDetailMql selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(TRuleDetailMql record);

    int updateByPrimaryKey(TRuleDetailMql record);
    
    List<TRuleDetailMql> findObjByRuleSid(Integer ruleSid);
}