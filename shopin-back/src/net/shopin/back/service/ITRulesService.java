/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.serviceIRuleChannelService.java
 * @Create By shiying
 * @Create In 2013-6-19 上午9:48:23
 * TODO
 */
package net.shopin.back.service;

import java.sql.SQLException;
import java.util.List;


import net.shopin.back.view.ChannelsVO;
import net.shopin.back.view.RulesVO;
import net.shopin.back.view.TRuleNewKey;

/**
 * @Class Name IRuleChannelService
 * @Author shiying
 * @Create In 2013-6-19
 */
public interface ITRulesService  {
	
//	List<RulesVO> queryRulesInfo(String sid);
//	List<RulesVO> queryAllRulesInfo();
	List<ChannelsVO> findRules() throws SQLException;

}
