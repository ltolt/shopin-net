/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.controllerTRuleNewController.java
 * @Create By shiying
 * @Create In 2013-5-28 下午4:26:30
 * TODO
 */
package net.shopin.back.controller;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.back.entity.cond.TRuleDetailCond;
import net.shopin.back.entity.cond.TRuleNewChannelCond;
import net.shopin.back.entity.cond.TRuleNewCond;
import net.shopin.back.entity.po.ProBestDetail;
import net.shopin.back.entity.po.TRuleDetail;
import net.shopin.back.entity.po.TRuleNew;
import net.shopin.back.entity.po.TRuleNewChannel;
import net.shopin.back.entity.vo.PageLayoutVO;
import net.shopin.back.entity.vo.TRuleDetailVO;
import net.shopin.back.entity.vo.TRuleNewChannelVO;
import net.shopin.back.entity.vo.TRuleNewVO;
import net.shopin.back.service.ITRuleDetailService;
import net.shopin.back.service.ITRuleNewChannelService;
import net.shopin.back.service.ITRuleNewService;
import net.shopin.back.util.HttpUtil;
import net.shopin.back.view.RuleChannelDetailVO;
import net.shopin.back.view.TRuleNewKey;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.constants.SystemConfig;
import com.constants.InfoConstants.CodeInfo;
import com.framework.AbstractController;
import com.framework.page.Paginator;
import com.framework.returnObj.Infos;

/**
 * @Class Name TRuleNewController
 * @Author shiying
 * @Create In 2013-5-28
 */
@Controller
@RequestMapping(value = "/truleNew")
public class TRuleNewController extends AbstractController {

	@Autowired
	private ITRuleNewService truleNewService;

	@Autowired
	private ITRuleNewChannelService truleNewChannelService;

	@Autowired
	private ITRuleDetailService tRuleDetailService;

	@Autowired
	private ITRuleDetailService truleDetailService;

	@ResponseBody
	@RequestMapping(value = { "/rule" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String queryRule(Model m, HttpServletRequest request,
			HttpServletResponse response) {
		Infos infos = init(request, "");
		Paginator page = new Paginator();
		List<TRuleNewVO> ruleResultList = this.truleNewService.findAllRules();
		System.out.println("listfewda=" + ruleResultList);
		String json = JSONArray.fromObject(ruleResultList).toString();
		System.out.println("list=" + ruleResultList);
		page.setList(ruleResultList);
		System.out.println("list=" + ruleResultList);
		setReturnObj(infos, page);
		System.out.println("json=======++" + json);
		return returnResultJson(infos);
	}

	@ResponseBody
	@RequestMapping(value = { "/save" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String saveRule(@ModelAttribute TRuleNewKey truleNewKey, Model m,
			HttpServletRequest request, HttpServletResponse response,
			String productClassSid, String o, String channelSid,
			String channelName) throws SQLException, ParseException {
		Infos infos = init(request, "");
		System.out.println("truleNew===" + truleNewKey);

		TRuleNew truleNew = new TRuleNew();
		if (truleNewKey.getRuleName() != null
				&& !"".equals(truleNewKey.getRuleName())) {
			truleNew.setRuleName(truleNewKey.getRuleName());
		}
		if (truleNewKey.getActiveBeginTime() != null
				&& !"".equals(truleNewKey.getActiveBeginTime())) {
			SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			truleNew.setActiveBeginTime(sim.parse(truleNewKey
					.getActiveBeginTime()));
		}
		if (truleNewKey.getActiveEndTime() != null
				&& !"".equals(truleNewKey.getActiveEndTime())) {
			SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			truleNew.setActiveEndTime(sim.parse(truleNewKey.getActiveEndTime()));
		}
		if (truleNewKey.getCreateUser() != null
				&& !"".equals(truleNewKey.getCreateUser())) {
			truleNew.setCreateUser(truleNewKey.getCreateUser());
		}
		if (truleNewKey.getCreateTime() != null
				&& !"".equals(truleNewKey.getCreateTime())) {
			SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			truleNew.setCreateTime(sim.parse(truleNewKey.getCreateTime()));
		}
		if (truleNewKey.getUpdateUser() != null
				&& !"".equals(truleNewKey.getUpdateUser())) {
			truleNew.setUpdateUser(truleNewKey.getUpdateUser());
		}
		if (truleNewKey.getUpdateTime() != null
				&& !"".equals(truleNewKey.getUpdateTime())) {
			SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			truleNew.setUpdateTime(sim.parse(truleNewKey.getUpdateTime()));
		}

		TRuleNewCond cond = new TRuleNewCond();
		cond.setTruleNew(truleNew);

		TRuleNewChannel truleNewChannel = new TRuleNewChannel();
		TRuleNewChannelCond channelcond = new TRuleNewChannelCond();
		if (channelSid != null && !"".equals(channelSid)) {
			truleNewChannel.setChannelSid(Long.valueOf(channelSid));
		}
		if (channelName != null
				&& "[object HTMLInputElement]".equals(channelName)) {
			truleNewChannel.setChannelName("");
		} else if (channelName != null && !"".equals(channelName)) {
			truleNewChannel.setChannelName(channelName);
		}

		String json = "";
		try {
			this.truleNewService.insert(infos, cond);
			Integer rulesid = this.truleNewService.queryMaxSidNum();

			System.out.println("rulesid====" + rulesid);
			if (rulesid != null && !"".equals(rulesid)) {
				truleNewChannel.setRuleSid(Long.valueOf(rulesid));
			}

			Integer order = this.truleNewChannelService.queryMaxOrderNum();
			System.out.println("order====" + order);
			order = (order == null) ? 0 : order;
			truleNewChannel.setSeq(++order);
			System.out.println("truleNewChannel====" + truleNewChannel);
			channelcond.setTruleNewChannel(truleNewChannel);
			this.truleNewChannelService.insert(infos, channelcond);
			json = "{'success':true}";
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误, e);
			json = "{'success':'false'}";
		} finally {
			return json;
		}
	}

	@ResponseBody
	@RequestMapping(value = { "/brand" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getBrand(Model m, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		Infos infos = init(request, "");
		String json = "";
		try {
			json = HttpUtil.HttpPost(SystemConfig.SSD_SYSTEM_URL,
					"photo/brandList.html", null);
		} catch (SQLException e) {
			json = "{'success':false}";
		} finally {
			return json;
		}
	}

	@ResponseBody
	@RequestMapping(value = { "/channel" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getChannel(Model m, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		Infos infos = init(request, "");
		String json = "";
		try {
			json = HttpUtil.HttpPost(SystemConfig.SSD_SYSTEM_URL,
					"bw/queryChannelInfo.html", null);
		} catch (SQLException e) {
			json = "{'success':false}";
		} finally {
			return json;
		}
	}

	@ResponseBody
	@RequestMapping(value = { "/shop" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getShop(Model m, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		Infos infos = init(request, "");
		String json = "";
		try {
			json = HttpUtil.HttpPost(SystemConfig.SSD_SYSTEM_URL,
					"photo/queryShopInfo.html", null);
		} catch (SQLException e) {
			json = "{'success':false}";
		} finally {
			return json;
		}
	}

	@ResponseBody
	@RequestMapping(value = { "/initupdate" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String initUpdate(Model m, HttpServletRequest request,
			HttpServletResponse response, String sid) {
		Infos infos = init(request, "sid=" + sid);
		Long ruleSid = Long.valueOf(sid);
		System.out.println("sid=" + sid);
		try {
			if (doValidate(infos)) {
				TRuleNewVO vo = truleNewService.findObjBySid(infos, ruleSid);
				setReturnObj(infos, vo);
			}
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误, e);
		} finally {

			return returnResultJson(infos);
		}
	}

	/**
	 * 
	 * @Methods Name savePhotoRule
	 * @Create In 2013-7-3 By wangdg
	 * @param key
	 * @param m
	 * @param request
	 * @param response
	 * @return
	 * @throws SQLException
	 * @throws ParseException
	 *             String
	 */
	@Transactional
	@ResponseBody
	@RequestMapping(value = { "/saveRule" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String savePhotoRule(@ModelAttribute RuleChannelDetailVO key,
			String size, Model m, HttpServletRequest request,
			HttpServletResponse response) throws SQLException, ParseException {

		String json = "";
		Infos infos = init(request, "");
		if (key != null && !"".equals(key)) {

			this.saveTRuleNew(key, request, response);
			this.saveTRuleNewChannel(key, request, response);
			this.savetRuleDetail(key, size, request, response);
			json = "{'success':true}";

		} else {
			json = "{'success':false}";
		}
		return json;
	}

	@Transactional
	@ResponseBody
	@RequestMapping(value = { "/updateRule" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String updatePhotoRule(@ModelAttribute RuleChannelDetailVO key,
			String size, Model m, HttpServletRequest request,
			HttpServletResponse response) throws SQLException, ParseException {

		String json = "";
		Infos infos = init(request, "");
		if (key != null && !"".equals(key)) {

			this.updateTRuleNew(key, request, response);
			// this.saveTRuleNewChannel(key, request, response);
			this.updateTRuleDetail(key, size, request, response);
			json = "{'success':true}";

		} else {
			json = "{'success':false}";
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = { "/deleterules" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String deleteProduct(Model m, HttpServletRequest request,
			HttpServletResponse response, String ruleSid) {

		Infos infos = init(request, "sid=" + ruleSid);

		try {
			this.tRuleDetailService.deleteByRuleSid(Integer.valueOf(ruleSid));
			this.truleNewChannelService.deleteByRuleSid(Integer
					.valueOf(ruleSid));
			this.truleNewService.delete(infos, Long.valueOf(ruleSid));
			setReturnObj(infos, true);
		} finally {
			return returnResultJson(infos);
		}

	}

	@ResponseBody
	@RequestMapping(value = { "/findDetails" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String findDetails(Model m, HttpServletRequest request,
			HttpServletResponse response, String sid) throws SQLException {
		Infos infos = init(request, "ruleSid=" + sid);
		Integer ruleSid = Integer.valueOf(sid);
		System.out.println("ruelSid=" + sid);
		try {
			if (doValidate(infos)) {
				List<TRuleDetailVO> vo = truleDetailService
						.findDetails(ruleSid);
				setReturnObj(infos, vo);
			}
		} finally {

			return returnResultJson(infos);
		}
	}

	/**
	 * 
	 * @Methods Name saveTRuleNew
	 * @Create In 2013-7-3 By wangdg
	 * @param key
	 * @param request
	 * @param response
	 * @throws ParseException
	 * @throws SQLException
	 *             void
	 */
	public void saveTRuleNew(RuleChannelDetailVO key,
			HttpServletRequest request, HttpServletResponse response)
			throws ParseException, SQLException {
		Infos infos = init(request, "");
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		TRuleNew tRuleNew = new TRuleNew();
		TRuleNewCond cond = new TRuleNewCond();

		if (key.getActiveBeginTime() != null
				&& !"".equals(key.getActiveBeginTime())) {
			tRuleNew.setActiveBeginTime(date.parse(key.getActiveBeginTime()));
		}
		if (key.getActiveEndTime() != null
				&& !"".equals(key.getActiveEndTime())) {
			tRuleNew.setActiveEndTime(date.parse(key.getActiveEndTime()));
		}
		if (key.getCreateTime() != null && !"".equals(key.getCreateTime())) {
			tRuleNew.setCreateTime(date.parse(key.getCreateTime()));
		}
		if (key.getCreateUser() != null && !"".equals(key.getCreateUser())) {
			tRuleNew.setCreateUser(key.getCreateUser());
		}
		if (key.getRuleName() != null && !"".equals(key.getRuleName())) {
			tRuleNew.setRuleName(key.getRuleName());
		}

		tRuleNew.setFlag(1);
		cond.setTruleNew(tRuleNew);
		this.truleNewService.insert(infos, cond);
	}

	/**
	 * 
	 * @Methods Name saveTRuleNewChannel
	 * @Create In 2013-7-3 By wangdg
	 * @param key
	 * @param request
	 * @param response
	 * @throws SQLException
	 *             void
	 */
	public void saveTRuleNewChannel(RuleChannelDetailVO key,
			HttpServletRequest request, HttpServletResponse response)
			throws SQLException {
		Infos infos = init(request, "");
		TRuleNewChannel tChannel = new TRuleNewChannel();
		TRuleNewChannelCond cond = new TRuleNewChannelCond();

		String[] channelName = key.getChannelName().split(",");
		String[] channelSid = key.getChannelSid().split(",");
		Integer ruleSid = this.truleNewService.queryMaxSidNum();

		for (int i = 0; i < channelName.length; i++) {
			tChannel.setChannelName(channelName[i]);
			tChannel.setChannelSid(Long.valueOf(channelSid[i]));
			tChannel.setRuleSid(Long.valueOf(ruleSid));

			cond.setTruleNewChannel(tChannel);
			this.truleNewChannelService.insert(infos, cond);

		}

	}

	/**
	 * 
	 * @Methods Name savetRuleDetail
	 * @Create In 2013-7-3 By wangdg
	 * @param key
	 * @param request
	 * @param response
	 * @throws SQLException
	 *             void
	 * @throws ParseException
	 */
	public void savetRuleDetail(RuleChannelDetailVO key, String size,
			HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ParseException {
		Infos infos = init(request, "");
		String[] brandName = null;
		String[] brandSid = null;
		String[] offMin = null;
		String[] offMax = null;
		String[] priceMax = null;
		String[] priceMin = null;
		String[] stockMin = null;
		String[] stockMax = null;
		String[] productClassSid = null;
		String[] productClassName = null;
		String[] shopName = null;
		String[] shopSid = null;
		String[] saleCode = null;
		String[] saleSum = null;
		String[] priceUpdateTime = null;

		TRuleDetail tDetail = new TRuleDetail();
		TRuleDetailCond cond = new TRuleDetailCond();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

		String getBrandName = key.getBrandName().substring(0,
				key.getBrandName().length() - 1);
		brandName = getBrandName.split("-");

		String getBrandSid = key.getBrandSid().substring(0,
				key.getBrandSid().length() - 1);
		brandSid = getBrandSid.split("-");

		String getShopName = key.getShopName().substring(0,
				key.getShopName().length() - 1);
		shopName = getShopName.split("-");

		String getShopSid = key.getShopSid().substring(0,
				key.getShopSid().length() - 1);
		shopSid = getShopSid.split("-");

		String getOffMin = key.getOffMin().substring(0,
				key.getOffMin().length() - 1);
		offMin = getOffMin.split("-");

		String getOffMax = key.getOffMax().substring(0,
				key.getOffMax().length() - 1);
		offMax = getOffMax.split("-");

		String getPriceMin = key.getPriceMin().substring(0,
				key.getPriceMin().length() - 1);
		priceMin = getPriceMin.split("-");

		String getPriceMax = key.getPriceMax().substring(0,
				key.getPriceMax().length() - 1);
		priceMax = getPriceMax.split("-");

		String getStockMin = key.getStockMin().substring(0,
				key.getStockMin().length() - 1);
		stockMin = getStockMin.split("-");

		String getProductClassSid = key.getProductClassSid().substring(0,
				key.getProductClassSid().length() - 1);
		productClassSid = getProductClassSid.split("-");

		String getStockMax = key.getStockMax().substring(0,
				key.getStockMax().length() - 1);
		stockMax = getStockMax.split("-");

		String getProductClassName = key.getProductClassName().substring(0,
				key.getProductClassName().length() - 1);
		productClassName = getProductClassName.split("-");

		String getPriceUpdateTime = key.getPriceUpdateTime().substring(0,
				key.getPriceUpdateTime().length() - 1);
		priceUpdateTime = getPriceUpdateTime.split(",");

		String getSaleSum = key.getSaleSum().substring(0,
				key.getSaleSum().length() - 1);
		saleSum = getSaleSum.split("-");

		String getSaleCode = key.getSaleCode().substring(0,
				key.getSaleCode().length() - 1);
		saleCode = getSaleCode.split("-");
		Integer detailSize = Integer.valueOf(size);
		Integer ruleSid = this.truleNewService.queryMaxSidNum();
		for (int i = 0; i < detailSize; i++) {

			tDetail.setRuleSid(Long.valueOf(ruleSid));

			if (brandName.length > i) {
				if (brandName[i] != null && !"".equals(brandName[i]))
					tDetail.setBrandName(brandName[i]);
			}
			if (brandSid.length > i) {
				System.out.println(brandSid.length);
				if (brandSid[i] != null && !"".equals(brandSid[i])) {
					tDetail.setBrandSid(Long.valueOf(brandSid[i]));
				}
			}
			if (priceMin.length > i) {
				System.out.println(priceMin.length);
				if (priceMin[i] != null && !"".equals(priceMin[i])) {
					System.out.println(priceMin[i]);
					tDetail.setPriceMin(Integer.valueOf(priceMin[i]));
				}
			}
			if (offMin.length > i) {
				if (offMin[i] != null && !"".equals(offMin[i]))
					tDetail.setOffMin(Double.valueOf(offMin[i]));
			}
			if (offMax.length > i) {
				if (offMax[i] != null && !"".equals(offMax[i]))
					tDetail.setOffMax(Double.valueOf(offMax[i]));
			}
			if (priceMax.length > i) {
				if (priceMax[i] != null && !"".equals(priceMax[i]))
					tDetail.setPriceMax(Integer.valueOf(priceMax[i]));
			}
			if (stockMin.length > i) {
				if (stockMin[i] != null && !"".equals(stockMin[i]))
					tDetail.setStockMin(Integer.valueOf(stockMin[i]));
			}
			if (stockMax.length > i) {
				if (stockMax[i] != null && !"".equals(stockMax[i]))
					tDetail.setStockMax(Integer.valueOf(stockMax[i]));
			}
			if (productClassSid.length > i) {
				if (productClassSid[i] != null
						&& !"".equals(productClassSid[i])) {
					tDetail.setProductClassSid(Long.valueOf(productClassSid[i]));
				}
			}
			if (productClassName.length > i) {
				if (productClassName[i] != null
						&& !"".equals(productClassName[i]))
					tDetail.setProductClassName(productClassName[i]);
			}
			if (shopName.length > i) {
				if (shopName[i] != null && !"".equals(shopName[i]))
					tDetail.setShopName(shopName[i]);
			}
			if (shopSid.length > i) {
				if (shopSid[i] != null && !"".equals(shopSid[i]))
					tDetail.setShopSid(Long.valueOf(shopSid[i]));
			}
			if (saleSum.length > i) {
				if (saleSum[i] != null && !"".equals(saleSum[i]))
					tDetail.setSaleSum(Long.valueOf(saleSum[i]));
			}
			if (priceUpdateTime.length > i) {
				if (priceUpdateTime[i] != null
						&& !"".equals(priceUpdateTime[i]))
					tDetail.setPriceUpdateTime(date.parse(priceUpdateTime[i]));
			}
			if (saleCode.length > i) {
				if (saleCode[i] != null && !"".equals(saleCode[i]))
					tDetail.setSaleCode(saleCode[i]);
			}
			cond.setTruleDetail(tDetail);
			this.tRuleDetailService.insert(infos, cond);
		}
	}

	public void updateTRuleNew(RuleChannelDetailVO key,
			HttpServletRequest request, HttpServletResponse response)
			throws ParseException, SQLException {
		Infos infos = init(request, "");
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		TRuleNew tRuleNew = new TRuleNew();
		TRuleNewCond cond = new TRuleNewCond();

		if (key.getActiveBeginTime() != null
				&& !"".equals(key.getActiveBeginTime())) {
			tRuleNew.setActiveBeginTime(date.parse(key.getActiveBeginTime()));
		}
		if (key.getActiveEndTime() != null
				&& !"".equals(key.getActiveEndTime())) {
			tRuleNew.setActiveEndTime(date.parse(key.getActiveEndTime()));
		}
		if (key.getUpdateTime() != null && !"".equals(key.getUpdateTime())) {
			tRuleNew.setUpdateTime(date.parse(key.getUpdateTime()));
		}
		if (key.getUpdateUser() != null && !"".equals(key.getUpdateUser())) {
			tRuleNew.setUpdateUser(key.getUpdateUser());
		}
		if (key.getRuleName() != null && !"".equals(key.getRuleName())) {
			tRuleNew.setRuleName(key.getRuleName());
		}
		if (key.getSid() != null && !"".equals(key.getSid())) {
			tRuleNew.setSid(Long.valueOf(key.getSid()));
		}

		tRuleNew.setFlag(1);
		cond.setTruleNew(tRuleNew);
		this.truleNewService.update(infos, cond);
	}

	/**
	 * 
	 * @Methods Name saveTRuleNewChannel
	 * @Create In 2013-7-3 By wangdg
	 * @param key
	 * @param request
	 * @param response
	 * @throws SQLException
	 *             void
	 */
	public void updateTRuleNewChannel(RuleChannelDetailVO key,
			HttpServletRequest request, HttpServletResponse response)
			throws SQLException {
		Infos infos = init(request, "");
		TRuleNewChannel tChannel = new TRuleNewChannel();
		TRuleNewChannelCond cond = new TRuleNewChannelCond();

		String[] channelName = key.getChannelName().split(",");
		String[] channelSid = key.getChannelSid().split(",");

		for (int i = 0; i < channelName.length; i++) {
			if (channelName[i] != null && !"".equals(channelName[i])) {
				tChannel.setChannelName(channelName[i]);
			}
			if (channelSid[i] != null && !"".equals(channelSid[i])) {
				tChannel.setChannelSid(Long.valueOf(channelSid[i]));
			}

			if (key.getSid() != null && !"".equals(key.getSid())) {
				tChannel.setRuleSid(Long.valueOf(key.getSid()));
			}

			cond.setTruleNewChannel(tChannel);
			this.truleNewChannelService.update(infos, cond);

		}

	}

	/**
	 * 
	 * @Methods Name savetRuleDetail
	 * @Create In 2013-7-3 By wangdg
	 * @param key
	 * @param request
	 * @param response
	 * @throws SQLException
	 *             void
	 * @throws ParseException
	 */
	public void updateTRuleDetail(RuleChannelDetailVO key, String size,
			HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ParseException {
		Infos infos = init(request, "");
		String[] brandName = null;
		String[] brandSid = null;
		String[] detailSid = null;
		String[] offMin = null;
		String[] offMax = null;
		String[] priceMax = null;
		String[] priceMin = null;
		String[] stockMin = null;
		String[] stockMax = null;
		String[] productClassSid = null;
		String[] productClassName = null;
		String[] shopName = null;
		String[] shopSid = null;
		String[] saleCode = null;
		String[] saleSum = null;
		String[] priceUpdateTime = null;

		//TRuleDetail tDetail = new TRuleDetail();
		TRuleDetailCond cond = new TRuleDetailCond();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

		String getBrandName = key.getBrandName().substring(0,
				key.getBrandName().length() - 1);
		brandName = getBrandName.split("-");

		String getBrandSid = key.getBrandSid().substring(0,
				key.getBrandSid().length() - 1);
		brandSid = getBrandSid.split("-");

		String getShopName = key.getShopName().substring(0,
				key.getShopName().length() - 1);
		shopName = getShopName.split("-");

		String getShopSid = key.getShopSid().substring(0,
				key.getShopSid().length() - 1);
		shopSid = getShopSid.split("-");

		String getOffMin = key.getOffMin().substring(0,
				key.getOffMin().length() - 1);
		offMin = getOffMin.split("-");

		String getOffMax = key.getOffMax().substring(0,
				key.getOffMax().length() - 1);
		offMax = getOffMax.split("-");

		String getPriceMin = key.getPriceMin().substring(0,
				key.getPriceMin().length() - 1);
		priceMin = getPriceMin.split("-");

		String getPriceMax = key.getPriceMax().substring(0,
				key.getPriceMax().length() - 1);
		priceMax = getPriceMax.split("-");

		String getStockMin = key.getStockMin().substring(0,
				key.getStockMin().length() - 1);
		stockMin = getStockMin.split("-");

		String getProductClassSid = key.getProductClassSid().substring(0,
				key.getProductClassSid().length() - 1);
		productClassSid = getProductClassSid.split("-");

		String getStockMax = key.getStockMax().substring(0,
				key.getStockMax().length() - 1);
		stockMax = getStockMax.split("-");

		String getProductClassName = key.getProductClassName().substring(0,
				key.getProductClassName().length() - 1);
		productClassName = getProductClassName.split("-");

		String getPriceUpdateTime = key.getPriceUpdateTime().substring(0,
				key.getPriceUpdateTime().length() - 1);
		priceUpdateTime = getPriceUpdateTime.split(",");

		String getSaleSum = key.getSaleSum().substring(0,
				key.getSaleSum().length() - 1);
		saleSum = getSaleSum.split("-");

		String getSaleCode = key.getSaleCode().substring(0,
				key.getSaleCode().length() - 1);
		saleCode = getSaleCode.split("-");

		String getDetailSid = key.getDetailSid().substring(0,
				key.getDetailSid().length() - 1);
		detailSid = getDetailSid.split("-");

		String ruleSid = key.getSid();

		Integer detaiSize = Integer.valueOf(size);
		for (int i = 0; i < detaiSize; i++) {
			TRuleDetail tDetail = new TRuleDetail();
			if (detailSid.length > i) {
				if (detailSid[i] != null && !"".equals(detailSid[i]))
					tDetail.setSid(Long.valueOf(detailSid[i]));
			}
			tDetail.setRuleSid(Long.valueOf(ruleSid));

			if (brandName.length > i) {
				if (brandName[i] != null && !"".equals(brandName[i]))
					tDetail.setBrandName(brandName[i]);
			}
			if (brandSid.length > i) {
				if (brandSid[i] != null && !"".equals(brandSid[i])) {
					tDetail.setBrandSid(Long.valueOf(brandSid[i]));
				}
			}
			if (offMin.length > i) {
				if (offMin[i] != null && !"".equals(offMin[i]))
					tDetail.setOffMin(Double.valueOf(offMin[i]));
			}
			if (offMax.length > i) {
				if (offMax[i] != null && !"".equals(offMax[i]))
					tDetail.setOffMax(Double.valueOf(offMax[i]));
			}
			if (priceMin.length > i) {
				if (priceMin[i] != null && !"".equals(priceMin[i]))
					tDetail.setPriceMin(Integer.valueOf(priceMin[i]));
			}
			if (priceMax.length > i) {
				if (priceMax[i] != null && !"".equals(priceMax[i]))
					tDetail.setPriceMax(Integer.valueOf(priceMax[i]));
			}
			if (stockMin.length > i) {
				if (stockMin[i] != null && !"".equals(stockMin[i]))
					tDetail.setStockMin(Integer.valueOf(stockMin[i]));
			}
			if (stockMax.length > i) {
				if (stockMax[i] != null && !"".equals(stockMax[i]))
					tDetail.setStockMax(Integer.valueOf(stockMax[i]));
			}
			if (productClassSid.length > i) {
				if (productClassSid[i] != null
						&& !"".equals(productClassSid[i])) {
					tDetail.setProductClassSid(Long.valueOf(productClassSid[i]));
				}
			}
			if (productClassName.length > i) {
				if (productClassName[i] != null
						&& !"".equals(productClassName[i]))
					tDetail.setProductClassName(productClassName[i]);
			}
			if (shopName.length > i) {
				if (shopName[i] != null && !"".equals(shopName[i])) {
					tDetail.setShopName(shopName[i]);
				}
			}
			if (shopSid.length > i) {
				if (shopSid[i] != null && !"".equals(shopSid[i]))
					tDetail.setShopSid(Long.valueOf(shopSid[i]));
			}
			if (saleSum.length > i) {
				if (saleSum[i] != null && !"".equals(saleSum[i]))
					tDetail.setSaleSum(Long.valueOf(saleSum[i]));
			}
			if (priceUpdateTime.length > i) {
				if (priceUpdateTime[i] != null
						&& !"".equals(priceUpdateTime[i]))
					tDetail.setPriceUpdateTime(date.parse(priceUpdateTime[i]));
			}
			if (saleCode.length > i) {
				if (saleCode[i] != null && !"".equals(saleCode[i]))
					tDetail.setSaleCode(saleCode[i]);
			}

			cond.setTruleDetail(tDetail);
			this.tRuleDetailService.update(infos, cond);
		}
	}

}
