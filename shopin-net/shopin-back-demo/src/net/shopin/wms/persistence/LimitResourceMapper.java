package net.shopin.wms.persistence;

import java.util.List;

import com.framework.persistence.ShoppinMysqlMapper;

import net.shopin.wms.domain.entity.LimitResource;

/**
 * 资源信息dao
 * @Class Name LimitResourceMapper
 * @Author chenqb
 * @Create In 2013-8-7
 */
@ShoppinMysqlMapper
public interface LimitResourceMapper {
	
	/**
	 * 得到所有资源
	 * @Methods Name getAllLimitResource
	 * @Create In 2013-8-8 By chenqb
	 * @return List<LimitResource>
	 */
	public List<LimitResource> getAllLimitResource();
	/**
	 * 根据条件进行查询资源
	 * @Methods Name getLimitResourceByparam
	 * @Create In 2013-8-8 By chenqb
	 * @return List<LimitResource>
	 */
	public List<LimitResource> getLimitResourceByparam(LimitResource resource);
	/**
	 * 保存资源
	 * @Methods Name insert
	 * @Create In 2013-8-8 By chenqb
	 * @param resource
	 * @return Integer
	 */
	public Integer insert(LimitResource resource);
	/**
	 * 修改资源
	 * @Methods Name update
	 * @Create In 2013-8-8 By chenqb
	 * @param resource
	 * @return Integer
	 */
	public Integer update(LimitResource resource);
	/**
	 * 删除资源
	 * @Methods Name delete
	 * @Create In 2013-8-8 By Administrator
	 * @param resource
	 * @return Integer
	 */
	public Integer delete(LimitResource resource);

}
