/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.mapperPageLayoutMapper.java
 * @Create By shiying
 * @Create In 2013-5-9 下午5:05:27
 * TODO
 */
package net.shopin.back.mapper;

import java.util.List;

import net.shopin.back.entity.cond.PageLayoutCond;
import net.shopin.back.entity.po.PageLayout;
import net.shopin.back.entity.vo.PageLayoutVO;
import com.framework.IAbstractDAO;
import com.framework.persistence.ShoppinMapper;
/**
 * desc 页面展示表  mapper接口
 * @Class Name PageLayoutMapper
 * @Author shiying
 * @Create In 2013-5-9
 */
@ShoppinMapper
public interface PageLayoutMapper extends IAbstractDAO<PageLayoutCond,PageLayout,PageLayoutVO>{

	
	List  queryPageLayoutByChannel(Integer channelSid);
	
	List  queryChildPageLayout(Long pageLayoutSid);
	
	PageLayoutVO selectQueryBySid(Long pageLayoutSid);
	
	
}
