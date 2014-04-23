package net.shopin.wms.persistence;

import java.util.List;

import com.framework.persistence.ShoppinMysqlMapper;

import net.shopin.wms.domain.entity.LimitRoleResources;


/**
 * 角色资源映射dao
 * @Class Name LimitRoleResourcesMapper
 * @Author chenqb
 * @Create In 2013-8-7
 */
@ShoppinMysqlMapper
public interface LimitRoleResourcesMapper {
	/**
	 * 得到所有角色资源映射
	 * @Methods Name getAllLimitRoleResources
	 * @Create In 2013-8-8 By chenqb
	 * @return List<LimitRoleResources>
	 */
	public List<LimitRoleResources> getAllLimitRoleResources();
	/**
	 * 根据条件进行查询映射关系
	 * @Methods Name getLimitRoleResourcesByParam
	 * @Create In 2013-8-8 By chenqb
	 * @return List<LimitRoleResources>
	 */
	public List<LimitRoleResources> getLimitRoleResourcesByParam(LimitRoleResources roleRsource);
	/**
	 * 保存映射关系
	 * @Methods Name insert
	 * @Create In 2013-8-8 By chenqb
	 * @param roleResources
	 * @return Integer
	 */
	public Integer insert(LimitRoleResources roleResources);
	/**
	 * 修改映射关系
	 * @Methods Name update
	 * @Create In 2013-8-8 By Administrator
	 * @param roleResources
	 * @return Integer
	 */
	public Integer update(LimitRoleResources roleResources);
	/**
	 * 删除映射关系
	 * @Methods Name delete
	 * @Create In 2013-8-8 By Administrator
	 * @param roleResources
	 * @return Integer
	 */
	public Integer delete(LimitRoleResources roleResources);
}
