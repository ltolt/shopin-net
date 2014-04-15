/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.mapperTRuleNewChannleMapper.java
 * @Create By Administrator
 * @Create In 2013-5-28 下午1:28:57
 * TODO
 */
package net.shopin.back.mapper;

import java.util.List;

import net.shopin.back.entity.cond.TRuleNewChannelCond;
import net.shopin.back.entity.po.TRuleNewChannel;
import net.shopin.back.entity.vo.TRuleNewChannelVO;
import com.framework.IAbstractDAO;
import com.framework.persistence.ShoppinMapper;

/**
 * @Class Name TRuleNewChannleMapper
 * @Author Administrator
 * @Create In 2013-5-28
 */
@ShoppinMapper
public interface TRuleNewChannelMapper extends IAbstractDAO<TRuleNewChannelCond, TRuleNewChannel, TRuleNewChannelVO>{

	Integer queryMaxOrderNum();
	List<TRuleNewChannelVO> findObjByRuleSid(Integer ruleSid);
	List<TRuleNewChannelVO> findChannels();
	List<TRuleNewChannelVO> findRuleSid(Integer channelSid);
	public void deleteByRuleSid(Integer ruleSid);
}
