/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.impl.LeaveMessageTypeServiceImpl.java
 * @Create By wangdg
 * @Create In 2013-8-14 下午5:24:50
 * TODO
 */
package net.shopin.wms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import net.shopin.wms.domain.entity.LeaveMessageType;
import net.shopin.wms.persistence.LeaveMessageTypeMapper;
import net.shopin.wms.service.ILeaveMessageTypeService;

/**
 * @Class Name LeaveMessageTypeServiceImpl
 * @Author wangdg
 * @Create In 2013-8-14
 */

@Component("leaveMessageTypeService")
@Scope("prototype")
@Transactional
public class LeaveMessageTypeServiceImpl implements ILeaveMessageTypeService {

	@Autowired
	LeaveMessageTypeMapper leaveMessageTypeMapper;

	@Override
	public int deleteByPrimaryKey(Integer tid) {
		return this.leaveMessageTypeMapper.deleteByPrimaryKey(tid);
	}

	@Override
	public int insert(LeaveMessageType record) {
		return this.leaveMessageTypeMapper.insert(record);
	}

	@Override
	public int insertSelective(LeaveMessageType record) {
		return this.leaveMessageTypeMapper.insertSelective(record);
	}

	@Override
	public LeaveMessageType selectByPrimaryKey(Integer tid) {
		return this.leaveMessageTypeMapper.selectByPrimaryKey(tid);
	}

	@Override
	public int updateByPrimaryKeySelective(LeaveMessageType record) {
		return this.leaveMessageTypeMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(LeaveMessageType record) {
		return this.leaveMessageTypeMapper.updateByPrimaryKey(record);
	}

	@Override
	public List selectByPid(Integer pid) {
		return this.leaveMessageTypeMapper.selectByPid(pid);
	}

	@Override
	public List selectList(LeaveMessageType record) {
		return this.leaveMessageTypeMapper.selectList(record);
	}

}
