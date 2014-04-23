/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.serviceITRuleNewService.java
 * @Create By shiying
 * @Create In 2013-5-28 上午11:14:00
 * TODO
 */
package net.shopin.back.service;

import java.text.ParseException;
import java.util.List;

import net.shopin.back.entity.cond.ProBestDetailCond;
import net.shopin.back.entity.cond.TRuleNewCond;
import net.shopin.back.entity.po.TRuleNew;
import net.shopin.back.entity.po.TRuleNewChannel;
import net.shopin.back.entity.vo.ProBestDetailVO;
import net.shopin.back.entity.vo.TRuleNewVO;
import net.shopin.back.view.TRuleNewKey;

import com.framework.IAbstractService;
import com.framework.page.Paginator;
import com.framework.returnObj.Infos;

/**
 * @Class Name ITRuleNewService
 * @Author shiying
 * @Create In 2013-5-28
 */
public interface ITRuleNewService extends IAbstractService<TRuleNewCond,TRuleNew,TRuleNewVO>{
	List<TRuleNewVO> findAllRules();
	Integer queryMaxSidNum();
	void insertRule(TRuleNewKey truleNewKey) throws ParseException;
	void updateRule(TRuleNewKey truleNewKey) throws ParseException;
}
