/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.serviceITRuleNewChannelChannelService.java
 * @Create By shiying
 * @Create In 2013-5-28 下午2:19:58
 * TODO
 */
package net.shopin.back.service;

import java.util.List;

import net.shopin.back.entity.cond.TRuleNewChannelCond;
import net.shopin.back.entity.po.TRuleNewChannel;
import net.shopin.back.entity.vo.TRuleNewChannelVO;

import com.framework.IAbstractService;

/**
 * @Class Name ITRuleNewChannelChannelService
 * @Author shiying
 * @Create In 2013-5-28
 */
public interface ITRuleNewChannelService extends IAbstractService<TRuleNewChannelCond,TRuleNewChannel,TRuleNewChannelVO> {

	Integer queryMaxOrderNum();
	List<TRuleNewChannelVO> findObjByRuleSid(Integer ruleSid);
	List<TRuleNewChannelVO> findChannels();
	List<TRuleNewChannelVO> findRuleSid(Integer channelSid);
	public void deleteByRuleSid(Integer ruleSid);
}
