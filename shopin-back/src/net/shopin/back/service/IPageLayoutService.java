/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.serviceSYPageLayoutService.java
 * @Create By Administrator
 * @Create In 2013-5-10 下午2:28:24
 * TODO
 */
package net.shopin.back.service;

import java.sql.SQLException;
import java.util.List;

import com.framework.IAbstractService;
import net.shopin.back.entity.cond.PageLayoutCond;
import net.shopin.back.entity.po.PageLayout;
import net.shopin.back.entity.vo.PageLayoutVO;

import com.framework.page.Paginator;
import com.framework.persistence.ShoppinMapper;
import com.framework.returnObj.Infos;

/**
 * @Class Name IPageLayoutService
 * @Author shiying
 * @Create In 2013-5-10
 */
public interface IPageLayoutService extends IAbstractService<PageLayoutCond,PageLayout,PageLayoutVO>{
		
	Paginator queryPageLayoutByChannel(Infos infos, PageLayoutCond cond) throws SQLException;
	
	List  queryChildPageLayout(Long pageLayoutSid);
	
	int QueryObjsCount(PageLayoutCond cond)throws SQLException;
	
	PageLayoutVO selectQueryBySid(Long sid);
}
