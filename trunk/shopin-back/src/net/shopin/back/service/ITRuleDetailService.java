/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.serviceITRuleDetailService.java
 * @Create By Administrator
 * @Create In 2013-6-24 下午4:07:59
 * TODO
 */
package net.shopin.back.service;

import java.util.List;

import net.shopin.back.entity.cond.TRuleDetailCond;
import net.shopin.back.entity.po.TRuleDetail;
import net.shopin.back.entity.vo.TRuleDetailVO;

import com.framework.IAbstractService;

/**
 * @Class Name ITRuleDetailService
 * @Author Administrator
 * @Create In 2013-6-24
 */
public interface ITRuleDetailService extends IAbstractService<TRuleDetailCond,TRuleDetail,TRuleDetailVO> {

	
	List<TRuleDetailVO> findDetails(Integer ruleSid);
	public void deleteByRuleSid(Integer ruleSid);


}
