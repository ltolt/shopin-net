/**
 * @Probject Name: business
 * @Path: net.shopin.service.NavigationServiceImpl.java
 * @Create By jiangzhenxue
 * @Create In 2013-7-22 下午4:00:21
 * TODO
 */
package net.shopin.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.shopin.modules.interceptor.MethodCache;
import com.shopin.modules.interceptor.ObjectCache;
import com.shopin.modules.orm.hibernate.SimpleHibernateDao;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.api.INavigationService;
import net.shopin.entity.Brand;
import net.shopin.entity.NavBrand;
import net.shopin.entity.Navigation;
import net.shopin.entity.Promotions;
import net.shopin.util.Constants;
import net.shopin.util.HttpUtil;
import net.shopin.util.JsonUtil;
import net.shopin.view.BrandVO;
import net.shopin.view.NavigationVO;
import net.shopin.view.PromotionVO;

/**
 * @author jiangzhenxue
 * 
 */
@Component("navigationService")
@Scope("prototype")
@Transactional(readOnly = true)
@ObjectCache(expire = 3600*24)
public class NavigationServiceImpl implements INavigationService {

	private SimpleHibernateDao<Navigation, Integer> navigationDao;
	private SimpleHibernateDao<NavBrand, Integer> navBrandDao;
	private SimpleHibernateDao<Promotions, Integer> promotionsDao;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.navigationDao = new SimpleHibernateDao<Navigation, Integer>(
				sessionFactory, Navigation.class);
		this.navBrandDao = new SimpleHibernateDao<NavBrand, Integer>(
				sessionFactory, NavBrand.class);
		this.promotionsDao = new SimpleHibernateDao<Promotions, Integer>(
				sessionFactory, Promotions.class);
	}

	@MethodCache(expire = 24*3600)
	@Transactional
	public List<NavigationVO> getAllNavigations() {

		List<NavigationVO> list = new ArrayList<NavigationVO>();
		List<NavigationVO> navContentVOs = new ArrayList<NavigationVO>();
		List<Navigation> listOne = this.navigationDao.find(
				"from Navigation ng where ng.navLevel=? and ng.show=1", 1);

		list = JsonUtil.getSubList(listOne);
		for (int j = 0; j < list.size(); j++) {
			NavigationVO navigationVO2 = list.get(j);
			List<BrandVO> brandList = this.getBrandList(navigationVO2.getSid());
			List<PromotionVO> promotionsList = this
					.getPromotionsList(navigationVO2.getSid());
			navigationVO2.setPromotions(promotionsList);
			navigationVO2.setBrandList(brandList);
			navContentVOs.add(navigationVO2);
		}
		return navContentVOs;
	}

	public List<BrandVO> getBrandList(Integer sid) {
		List<BrandVO> list = new ArrayList<BrandVO>();
		List<NavBrand> navBrandList = this.navBrandDao.findBy("navSid",
				Long.parseLong(sid + ""));
		for (NavBrand navBrand : navBrandList) {
			BrandVO brandVO = new BrandVO();
			brandVO.setSid(navBrand.getBrandSid() + "");
			brandVO.setBrandName(navBrand.getBrandName());
			if (navBrand.getBrandLink() != null) {
				brandVO.setPictureUrl(navBrand.getBrandLink());
			}
			if (navBrand.getBrandPic() != null) {
				brandVO.setBrandpic2(navBrand.getBrandPic());
			}

			list.add(brandVO);
		}
		return list;
	}

	public List<PromotionVO> getPromotionsList(Integer sid) {
		List<PromotionVO> promotionsList = new ArrayList<PromotionVO>();
		List<Navigation> navBrandList = this.navigationDao.findBy("sid",
				Long.parseLong(sid + ""));
		for (Navigation navigation : navBrandList) {

			List<Promotions> list2 = (List) navigation.getPromotions();
			for (Promotions promotions : list2) {
				PromotionVO promotionVO = new PromotionVO();
				promotionVO.setSid(promotions.getSid() + "");
				promotionVO.setPromotionSpict(promotions.getPromotionSpict());
				promotionVO.setPromotionTitle(promotions.getPromotionTitle());
				promotionVO.setPromotionLink(promotions.getPromotionLink());
				promotionsList.add(promotionVO);
			}
		}
		return promotionsList;
	}

	/**
	 * 说明：
	 * 		根据频道sid获取导航列表
	 * create by jingpeng at 2013-10-08
	 * 
	 */
	public List<NavigationVO> getNavigationsByChannel(Integer sid) {
		List<NavigationVO> list = new ArrayList<NavigationVO>();
		List<NavigationVO> navContentVOs = new ArrayList<NavigationVO>();
		List<Navigation> listOne = this.navigationDao.find(
				"from Navigation ng where ng.navLevel=? and ng.channelSid=? and ng.show=1", 1, sid);

		list = JsonUtil.getSubList(listOne);
		for (int j = 0; j < list.size(); j++) {
			NavigationVO navigationVO2 = list.get(j);
			List<BrandVO> brandList = this.getBrandList(navigationVO2.getSid());
			List<PromotionVO> promotionsList = this
					.getPromotionsList(navigationVO2.getSid());
			navigationVO2.setPromotions(promotionsList);
			navigationVO2.setBrandList(brandList);
			navContentVOs.add(navigationVO2);
		}
		return navContentVOs;
	}
}
