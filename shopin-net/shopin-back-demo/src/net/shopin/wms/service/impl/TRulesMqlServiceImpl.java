/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.service.implRuleChannelServiceImpl.java
 * @Create By shiying
 * @Create In 2013-6-19 上午9:51:00
 * TODO
 */
package net.shopin.wms.service.impl;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.shopin.wms.domain.entity.TRuleDetailMql;
import net.shopin.wms.domain.entity.TRuleNewChannelMql;
import net.shopin.wms.domain.entity.TRuleNewMql;
import net.shopin.wms.persistence.TRuleDetailMqlMapper;
import net.shopin.wms.persistence.TRuleNewChannelMqlMapper;
import net.shopin.wms.persistence.TRuleNewMqlMapper;
import net.shopin.wms.service.ITRuelsMqlService;
import net.shopin.wms.util.ChannelsMqlVO;
import net.shopin.wms.util.DetailsMqlVO;
import net.shopin.wms.util.RulesMqlVO;

/**
 * @Class Name RuleChannelServiceImpl
 * @Author shiying
 * @Create In 2013-6-19
 */
@Service(value="rulesMqlService")
public class TRulesMqlServiceImpl implements ITRuelsMqlService{
	
	@Autowired
	TRuleNewChannelMqlMapper truleNewChannelMapper;
	@Autowired
	TRuleNewMqlMapper truleNewMapper;
	@Autowired
	TRuleDetailMqlMapper truleDetailMapper;
	
	
	public List<ChannelsMqlVO> findRules() throws SQLException {
		
		List<ChannelsMqlVO> channelsVO = new ArrayList<ChannelsMqlVO>();
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		   List<ChannelsMqlVO> channelList = truleNewChannelMapper.findChannels();
		   if(channelList!=null&&!"".equals(channelList)){
			   for(int i=0;i<channelList.size();i++){
				   ChannelsMqlVO trvo = new ChannelsMqlVO();
				   trvo=channelList.get(i);
				   List<TRuleNewChannelMql> ruleSidList =  truleNewChannelMapper.findRuleSid(Integer.valueOf(trvo.getChannelSid()+""));
				   List<RulesMqlVO> RulesMqlVO = new ArrayList<RulesMqlVO>();
				   
				    if(ruleSidList!=null&&!"".equals(ruleSidList)){
				    	for(int j=0;j<ruleSidList.size();j++){
				    		TRuleNewChannelMql channel = new TRuleNewChannelMql();
				    		channel=ruleSidList.get(j);
				    	if(channel.getRuleSid()!=null&&!"".equals(channel.getRuleSid())){
				    			TRuleNewMql ruleList = truleNewMapper.selectByPrimaryKey(Integer.valueOf(channel.getRuleSid()));
				    			RulesMqlVO rules = new RulesMqlVO();
				    		if(ruleList!=null&&!"".equals(ruleList)){
				    			if(ruleList.getActiveBeginTime()!=null&&!"".equals(ruleList.getActiveBeginTime())){
				    				
				    				rules.setActiveBeginTime(fm.format(ruleList.getActiveBeginTime())+"");
								}
				    			if(ruleList.getActiveEndTime()!=null&&!"".equals(ruleList.getActiveEndTime())){
				    				rules.setActiveEndTime(fm.format(ruleList.getActiveEndTime())+"");
								}
				    			if(ruleList.getCreateTime()!=null&&!"".equals(ruleList.getCreateTime())){
				    				rules.setCreateTime(fm.format(ruleList.getCreateTime())+"");
								}
				    			if(ruleList.getCreateUser()!=null&&!"".equals(ruleList.getCreateUser())){
				    				rules.setCreateUser(ruleList.getCreateUser());
								}
				    			if(ruleList.getRuleName()!=null&&!"".equals(ruleList.getRuleName())){
				    				rules.setRuleName(ruleList.getRuleName());
								}
				    			if(ruleList.getSid()!=null&&!"".equals(ruleList.getSid())){
				    				rules.setSid(ruleList.getSid()+"");
								}
				    			if(ruleList.getUpdateTime()!=null&&!"".equals(ruleList.getUpdateTime())){
				    				rules.setUpdateTime(fm.format(ruleList.getUpdateTime())+"");
								}
				    			if(ruleList.getFlag()!=null&&!"".equals(ruleList.getFlag())){
				    				rules.setFlag(ruleList.getFlag()+"");
								}
				    			if(ruleList.getUpdateUser()!=null&&!"".equals(ruleList.getFlag())){
				    				rules.setUpdateUser(ruleList.getUpdateUser()+"");
								}
				    		}
						    	List <DetailsMqlVO> detailvo =getDetailMap(Integer.valueOf(channel.getRuleSid()+""));
						    	 if(detailvo!=null)
								 { 
						    		 rules.setDetails(detailvo);
									 }	
						    	RulesMqlVO.add(rules);
							}
				    	
				    	
				    	}
				    }
				   
				    trvo.setRules(RulesMqlVO);
				   channelsVO.add(trvo);
			   }
			 
			   return channelsVO;
		   }
		return null;
		
	}

	private List<DetailsMqlVO> getDetailMap(Integer ruleSid) {
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		List<DetailsMqlVO> list = new ArrayList<DetailsMqlVO>();
		List<TRuleDetailMql> list1 = truleDetailMapper.findObjByRuleSid(ruleSid);
		if(list1!=null&&list1.size()>0){
			for(int i=0;i<list1.size();i++){
				DetailsMqlVO vo = new DetailsMqlVO();
				TRuleDetailMql truleDetailVO=list1.get(i);
				if(truleDetailVO.getBrandName()!=null&&!"".equals(truleDetailVO.getBrandName())){
					vo.setBrandName(truleDetailVO.getBrandName());
				}
				if(truleDetailVO.getBrandSid()!=null&&!"".equals(truleDetailVO.getBrandSid())){
					vo.setBrandSid(truleDetailVO.getBrandSid()+"");
				}
				if(truleDetailVO.getProductClassName()!=null&&!"".equals(truleDetailVO.getProductClassName())){
					vo.setProductClassName(truleDetailVO.getProductClassName());
				}
				if(truleDetailVO.getProductClassSid()!=null&&!"".equals(truleDetailVO.getProductClassSid())){
					vo.setProductClassSid(truleDetailVO.getProductClassSid()+"");
				}
				if(truleDetailVO.getRuleSid()!=null&&!"".equals(truleDetailVO.getRuleSid())){
					vo.setRuleSid(truleDetailVO.getRuleSid()+"");
				}
				if(truleDetailVO.getSid()!=null&&!"".equals(truleDetailVO.getSid())){
					vo.setSid(truleDetailVO.getSid()+"");
				}
				
				if(truleDetailVO.getOffMax()!=null&&!"".equals(truleDetailVO.getOffMax())){
					vo.setOffMax(truleDetailVO.getOffMax()+"");
				}
				if(truleDetailVO.getOffMin()!=null&&!"".equals(truleDetailVO.getOffMin())){
					vo.setOffMin(truleDetailVO.getOffMin()+"");
				}
				if(truleDetailVO.getPriceMax()!=null&&!"".equals(truleDetailVO.getPriceMax())){
					vo.setPriceMax(truleDetailVO.getPriceMax()+"");
				}
				if(truleDetailVO.getPriceMin()!=null&&!"".equals(truleDetailVO.getPriceMin())){
					vo.setPriceMin(truleDetailVO.getPriceMin()+"");
				}
				if(truleDetailVO.getPriceUpdateTime()!=null&&!"".equals(truleDetailVO.getPriceUpdateTime())){
					vo.setPriceUpdateTime(fm.format(truleDetailVO.getPriceUpdateTime())+"");
				}
				if(truleDetailVO.getSaleCode()!=null&&!"".equals(truleDetailVO.getSaleCode())){
					vo.setSaleCode(truleDetailVO.getSaleCode());
				}
				if(truleDetailVO.getSaleSum()!=null&&!"".equals(truleDetailVO.getSaleSum())){
					vo.setSaleSum(truleDetailVO.getSaleSum()+"");
				}
				if(truleDetailVO.getShopName()!=null&&!"".equals(truleDetailVO.getShopName())){
					vo.setShopName(truleDetailVO.getShopName());
				}
				if(truleDetailVO.getShopSid()!=null&&!"".equals(truleDetailVO.getShopSid())){
					vo.setShopSid(truleDetailVO.getShopSid()+"");
				}
				if(truleDetailVO.getStockMax()!=null&&!"".equals(truleDetailVO.getStockMax())){
					vo.setStockMax(truleDetailVO.getStockMax()+"");
				}
				if(truleDetailVO.getStockMin()!=null&&!"".equals(truleDetailVO.getStockMin())){
					vo.setStockMin(truleDetailVO.getStockMin()+"");
				}
				list.add(vo);
				
			}
			return list;
		}
	return null;
		
	}



	
}
