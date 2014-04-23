/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.impl.ChannelServiceImpl.java
 * @Create By wangdg
 * @Create In 2013-7-5 下午7:46:45
 * TODO
 */
package net.shopin.wms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import net.shopin.wms.domain.entity.Channel;
import net.shopin.wms.persistence.ChannelMapper;
import net.shopin.wms.service.IChannelService;

/**
 * @Class Name ChannelServiceImpl
 * @Author wangdg
 * @Create In 2013-7-5
 */
@Component("channelService")
@Scope("prototype")
@Transactional
public class ChannelServiceImpl implements IChannelService {

	@Autowired
	ChannelMapper channelMapper;
	@Override
	public int deleteByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.channelMapper.deleteByPrimaryKey(sid);
	}

	@Override
	public int insert(Channel record) {
		// TODO Auto-generated method stub
		return this.channelMapper.insert(record);
	}

	public int insertSelective(Channel record) {
		// TODO Auto-generated method stub
		return this.channelMapper.insertSelective(record);
	}

	@Override
	public Channel selectByPrimaryKey(Integer sid) {
		// TODO Auto-generated method stub
		return this.channelMapper.selectByPrimaryKey(sid);
	}

	@Override
	public int updateByPrimaryKeySelective(Channel record) {
		// TODO Auto-generated method stub
		return this.channelMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Channel record) {
		// TODO Auto-generated method stub
		return this.channelMapper.updateByPrimaryKey(record);
	}

	@Override
	public List selectAllChannles() {
		// TODO Auto-generated method stub
		return this.channelMapper.selectAllChannels();
	}

	@Override
	public List selectChannelsBySid(List<Long> sids) {
		return this.channelMapper.selectChannelsBySid(sids);
	}

	@Override
	public List selectOthers(List<Long> sids) {
		return this.channelMapper.selectOthers(sids);
	}

	
}
