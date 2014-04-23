/**
 * 
 */
package net.shopin.wms.persistence;

import java.util.List;

import com.framework.persistence.ShoppinMysqlMapper;

import net.shopin.wms.domain.entity.LimitRole;


/**
 * 角色DAO
 * @Class Name LimitRoleMapper
 * @Author chenqb
 * @Create In 2013-8-7
 */
@ShoppinMysqlMapper
public interface LimitRoleMapper {
	/**
	 * 得到所有的角色
	 * @Methods Name getAllLimitRole
	 * @Create In 2013-8-8 By Administrator
	 * @return List<LimitRole>
	 */
	public List getAllLimitRole();
	/**
	 * 根据条件进行查询
	 * @Methods Name getLimitRoleByParam
	 * @Create In 2013-8-8 By Administrator
	 * @param role
	 * @return List<LimitRole>
	 */
	public List getLimitRoleByParam(LimitRole role);
	/**
	 * 保存角色
	 * @Methods Name insert
	 * @Create In 2013-8-8 By Administrator
	 * @param role
	 * @return Integer
	 */
	public Integer insert(LimitRole role); 
	/**
	 * 修改角色
	 * @Methods Name update
	 * @Create In 2013-8-8 By Administrator
	 * @param role
	 * @return Integer
	 */
	public Integer update(LimitRole role);
	/**
	 * 删除角色
	 * @Methods Name delete
	 * @Create In 2013-8-8 By Administrator
	 * @param role
	 * @return Integer
	 */
	public Integer delete(LimitRole role);
	
}
