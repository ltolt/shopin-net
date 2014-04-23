/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.service.ILeaveMessageTypeService.java
 * @Create By wangdg
 * @Create In 2013-8-14 下午5:10:32
 * TODO
 */
package net.shopin.wms.service;

import java.util.List;

import net.shopin.wms.domain.entity.LeaveMessageType;

/**
 * @Class Name ILeaveMessageTypeService
 * @Author wangdg
 * @Create In 2013-8-14
 */
public interface ILeaveMessageTypeService {

	int deleteByPrimaryKey(Integer tid);

	int insert(LeaveMessageType record);

	int insertSelective(LeaveMessageType record);

	LeaveMessageType selectByPrimaryKey(Integer tid);

	int updateByPrimaryKeySelective(LeaveMessageType record);

	int updateByPrimaryKey(LeaveMessageType record);
	
	/**
	 * 说明：
	 * 		根据父类pid获取子留言类型列表
	 * @Methods Name selectByPid
	 * @Create In 2013-8-15 By wangdg
	 * @param pid
	 * @return List
	 */
	List selectByPid(Integer pid);
	
	/**
	 * 说明：
	 * 		根据条件查找留言类型列表，若为空则返回全部列表
	 * @Methods Name selectList
	 * @Create In 2013-8-15 By wangdg
	 * @param record
	 * @return List
	 */
	List selectList(LeaveMessageType record);
}
