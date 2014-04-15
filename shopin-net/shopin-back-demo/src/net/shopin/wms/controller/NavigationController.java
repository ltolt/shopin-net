/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.controller.NavigationController.java
 * @Create By wangdg
 * @Create In 2013-7-23 下午2:15:14
 * TODO
 */
package net.shopin.wms.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.back.util.HttpUtil;
import net.shopin.wms.domain.entity.NavBrand;
import net.shopin.wms.domain.entity.NavPromotion;
import net.shopin.wms.domain.entity.Navigation;
import net.shopin.wms.domain.entity.Promotions;
import net.shopin.wms.domain.view.NavBrandKey;
import net.shopin.wms.domain.view.NavPromotionKey;
import net.shopin.wms.service.INavBrandService;
import net.shopin.wms.service.INavPromotionService;
import net.shopin.wms.service.INavigationService;
import net.shopin.wms.service.IPromotionService;
import net.shopin.wms.util.ResultUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.constants.SystemConfig;

/**
 * @Class Name NavigationController
 * @Author wangdg
 * @Create In 2013-7-23
 */
@Controller
@RequestMapping(value = "/navigation")
public class NavigationController {

	@Autowired
	INavigationService navigationService;

	@Autowired
	INavBrandService navBrandService;

	@Autowired
	IPromotionService promotionService;

	@Autowired
	INavPromotionService navPromotionService;

	@ResponseBody
	@RequestMapping(value = "/selectList", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String findNavigations(String channelSid,HttpServletRequest request,
			HttpServletResponse response) {
		// String json = "";
		JSONObject obj = new JSONObject();
		JSONArray json = new JSONArray();

		Navigation navigation = new Navigation();
		navigation.setChannelSid(Integer.valueOf(channelSid));
		List list = navigationService.selectList(navigation);
		if (list != null && !list.isEmpty()) {
			for (Iterator iter = list.iterator(); iter.hasNext();) {
				Navigation nav = (Navigation) iter.next();
				obj.put("id", nav.getSid());
				obj.put("text", nav.getName());
				obj.put("icons", nav.getIcon());
				obj.put("linkBrand", nav.getLinkBrand());
				obj.put("leaf", true);
				json.add(obj);
			}
		}
		return json.toString();
	}

	@ResponseBody
	@RequestMapping(value = "/insertNav", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String saveNavigations(String name, String icon, String linkBrand,
			String classSid,String channelSid, HttpServletRequest request,
			HttpServletResponse response) {
		String json = "";
			try {
				Navigation navigation = new Navigation();
				if (icon != null && !"".equals(icon)) {
					navigation.setIcon(icon);
				}
				if (linkBrand != null && !"".equals(linkBrand)) {
					navigation.setLinkBrand(linkBrand);
				}
				if (name != null && !"".equals(name)) {
					navigation.setName(name);
				}
				if (classSid != null && !"".equals(classSid)) {
					navigation.setClassSid(classSid);
				}
				if (channelSid != null && !"".equals(channelSid)) {
					navigation.setChannelSid(Integer.valueOf(channelSid));
				}
				navigation.setFlag(1);
				navigation.setNavLevel(1);
				navigation.setIsShow(1);
				navigation.setSeq(1);
				this.navigationService.insertSelective(navigation);
				json = ResultUtil.createSuccessResult();
			} catch (Exception e) {
				json = ResultUtil.createFailureResult(e);
			}

		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/updateNav", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String updateNavigations(String sid, String icon, String linkBrand,
			HttpServletRequest request, HttpServletResponse response) {

		String json = "";
		if (sid != null && !"".equals(sid)) {
			try {
				Navigation navigation = new Navigation();
				navigation.setSid(Long.valueOf(sid));

				if (icon != null && !"".equals(icon)) {
					navigation.setIcon(icon);
				}
				if (linkBrand != null && !"".equals(linkBrand)) {
					navigation.setLinkBrand(linkBrand);
				}
				this.navigationService.updateByPrimaryKeySelective(navigation);
				json = ResultUtil.createSuccessResult();
			} catch (Exception e) {
				json = ResultUtil.createFailureResult(e);
			}
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/navigationTree", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String navigationTree(String node, HttpServletRequest request,
			HttpServletResponse response) {

		String json = "";
		JSONArray jsonArray = new JSONArray();
		if (node == null || "".equals(node.trim()))
			return "{'success':false}";
		try {
			Map paraMap = new HashMap();
			paraMap.put("node", node);
			String resultJson = HttpUtil.HttpPost(SystemConfig.SSD_SYSTEM_URL,
					"bw/queryCategroys.html", paraMap);
			JSONArray array = JSONArray.fromObject(resultJson);
			for (int i = 0; i < array.size(); i++) {
				JSONObject m = array.getJSONObject(i);
				m.put("leaf", true);
				jsonArray.add(m);
			}
		} catch (Exception e) {
			return "{'success':false}";
		}
		return jsonArray.toString();
	}

	@ResponseBody
	@RequestMapping(value = "/deleteNav", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String deleteNavigations(String sid, HttpServletRequest request,
			HttpServletResponse response) {
		String json = "";
		try {
			this.navigationService.deleteByPrimaryKey(Long.valueOf(sid));
			json = ResultUtil.createSuccessResult();
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/queryBrand", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String queryBrand(String brandName, HttpServletRequest request,
			HttpServletResponse response) {
		String json = "";
		try {
			Map paraMap = new HashMap();
			if (brandName != null && !"".equals(brandName)) {
				paraMap.put("brandName", brandName);
				json = HttpUtil.HttpPost(SystemConfig.SSD_SYSTEM_URL,
						"bw/getBrandByName.html", paraMap);

			} else {
				json = HttpUtil.HttpPost(SystemConfig.SSD_SYSTEM_URL,
						"bw/queryBrands.html", paraMap);
			}
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/queryPromotion", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String queryPromotion(String proNmae, HttpServletRequest request,
			HttpServletResponse response) {
		String json = "";
		try {
			Promotions pro = new Promotions();
			if (proNmae != null && !"".equals(proNmae)) {
				pro.setPromotionTitle(proNmae);
				List record = this.promotionService.selectByTitle(pro);
				json = ResultUtil.createSuccessResult(record);
			} else {
				List record = this.promotionService.selectAllPromotions();
				json = ResultUtil.createSuccessResult(record);
			}

		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/queryNavBrand", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String queryNavBrand(String navSid, HttpServletRequest request,
			HttpServletResponse response) {
		String json = "";
		try {
			NavBrand nav = new NavBrand();
			if (navSid != null && !"".equals(navSid)) {
				nav.setNavSid(Long.valueOf(navSid));
				List record = this.navBrandService.selectNavBrandByNavSid(nav);
				json = ResultUtil.createSuccessResult(record);
			} else {
				json = ResultUtil.createSuccessResult();
			}

		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/queryNavPromotion", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String queryNavPromotion(String navSid, HttpServletRequest request,
			HttpServletResponse response) {
		String json = "";
		try {
			NavPromotion navpro = new NavPromotion();
			List<Promotions> promotions = new ArrayList();
			if (navSid != null && !"".equals(navSid)) {
				navpro.setNavSid(Long.valueOf(navSid));
				List<NavPromotion> record = this.navPromotionService
						.selectByNavSid(navpro);
				for (int i = 0; i < record.size(); i++) {

					Integer promotionSid = record.get(i).getPromotionSid();
					Promotions promotion = this.promotionService
							.selectByPrimaryKey(promotionSid);
					promotions.add(promotion);
				}

				json = ResultUtil.createSuccessResult(promotions);
			} else {
				json = ResultUtil.createSuccessResult();
			}

		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/saveNavBrand", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String saveNavBrand(NavBrandKey navBrandKey,
			HttpServletRequest request, HttpServletResponse response) {
		String json = "";
		try {
			NavBrand navBrand = new NavBrand();
			if (navBrandKey.getBrandSid() != null
					&& !"".equals(navBrandKey.getBrandSid())) {
				navBrand.setBrandSid(Long.valueOf(navBrandKey.getBrandSid()));
			}
			if (navBrandKey.getNavSid() != null
					&& !"".equals(navBrandKey.getNavSid())) {
				navBrand.setNavSid(Long.valueOf(navBrandKey.getNavSid()));
			}
			if (navBrandKey.getBrandName() != null
					&& !"".equals(navBrandKey.getBrandName())) {
				navBrand.setBrandName(navBrandKey.getBrandName());
			}
			if (navBrandKey.getBrandPic() != null
					&& !"".equals(navBrandKey.getBrandPic())) {
				navBrand.setBrandPic(navBrandKey.getBrandPic());
			}
			if (navBrandKey.getBrandLink() != null
					&& !"".equals(navBrandKey.getBrandLink())) {
				navBrand.setBrandLink(navBrandKey.getBrandLink());
			}
			Integer number = this.navBrandService.countNavBrandRecord(navBrand);
			if (number < 1) {
				this.navBrandService.insertSelective(navBrand);
			}
			json = ResultUtil.createSuccessResult();
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/saveNavPromotion", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String saveNavPromotion(NavPromotionKey navPromotionKey,
			HttpServletRequest request, HttpServletResponse response) {
		String json = "";
		try {
			NavPromotion navPromotion = new NavPromotion();

			if (navPromotionKey.getNavSid() != null
					&& !"".equals(navPromotionKey.getNavSid())) {
				navPromotion
						.setNavSid(Long.valueOf(navPromotionKey.getNavSid()));
			}
			if (navPromotionKey.getPromotionSid() != null
					&& !"".equals(navPromotionKey.getPromotionSid())) {
				navPromotion.setPromotionSid(Integer.valueOf(navPromotionKey
						.getPromotionSid()));
			}
			Integer number = this.navPromotionService
					.countNavPromotionRecord(navPromotion);
			if (number < 1) {
				this.navPromotionService.insertSelective(navPromotion);
			}

			json = ResultUtil.createSuccessResult();
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteNavBrand", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String deleteNavBrand(String sid, HttpServletRequest request,
			HttpServletResponse response) {
		String json = "";
		try {

			if (sid != null && !"".equals(sid)) {
				this.navBrandService.deleteByPrimaryKey(Long.valueOf(sid));
				json = ResultUtil.createSuccessResult();
			}
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/deleteNavPromotion", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String deleteNavPromotion(String promotionSid, String navSid,
			HttpServletRequest request, HttpServletResponse response) {
		String json = "";
		try {
			NavPromotion navpro = new NavPromotion();
			if (promotionSid != null && !"".equals(promotionSid)) {
				navpro.setPromotionSid(Integer.valueOf(promotionSid));
			}
			if (navSid != null && !"".equals(navSid)) {
				navpro.setNavSid(Long.valueOf(navSid));
			}
			this.navPromotionService.deleteByNavPro(navpro);
			json = ResultUtil.createSuccessResult();
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/updatebrandlink", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String updatebrandlink(String brandLink, String sid,
			HttpServletRequest request, HttpServletResponse response) {
		String json = "";
		try {
			NavBrand navBrand = new NavBrand();
			if (brandLink != null && !"".equals(brandLink)) {
				navBrand.setBrandLink(brandLink);
			}
			if (sid != null && !"".equals(sid)) {
				navBrand.setSid(Long.valueOf(sid));
			}
			this.navBrandService.updateByPrimaryKeySelective(navBrand);
			json = ResultUtil.createSuccessResult();
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}

}
