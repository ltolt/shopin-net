/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.serviceTRuleDetailMqlService.java
 * @Create By shiying
 * @Create In 2013-9-22 上午11:22:56
 * TODO
 */
package net.shopin.wms.service;

import java.util.List;

import net.shopin.back.entity.vo.TRuleDetailVO;
import net.shopin.wms.domain.entity.TRuleDetailMql;

/**
 * @Class Name TRuleDetailMqlService
 * @Author shiying
 * @Create In 2013-9-22
 */
public interface ITRuleDetailMqlService {
	
	List<TRuleDetailMql> findDetails(Integer ruleSid);
	
	int deleteByPrimaryKey(Integer sid);

    int insert(TRuleDetailMql record);

    int insertSelective(TRuleDetailMql record);

    TRuleDetailMql selectByPrimaryKey(Integer sid);

    int updateByPrimaryKeySelective(TRuleDetailMql record);

    int updateByPrimaryKey(TRuleDetailMql record);

}
