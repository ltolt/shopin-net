/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.serviceIProConSearchService.java
 * @Create By kongm
 * @Create In 2013-5-10 下午1:36:11
 * TODO
 */
package net.shopin.back.service;

import net.shopin.back.entity.cond.ProConSearchCond;
import net.shopin.back.entity.po.ProConSearch;
import net.shopin.back.entity.vo.ProConSearchVO;
import net.shopin.back.view.ProductKey;

import com.framework.IAbstractService;

/**
 * @Class Name IProConSearchService
 * @Author kongm
 * @Create In 2013-5-10
 */
public interface IProConSearchService extends IAbstractService<ProConSearchCond, ProConSearch, ProConSearchVO>{

	void updateProConSearch(ProductKey productKey);
}
