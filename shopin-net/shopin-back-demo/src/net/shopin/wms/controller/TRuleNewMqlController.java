/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.controllerTRuleNewMqlController.java
 * @Create By shiying
 * @Create In 2013-9-18 上午10:01:23
 * TODO
 */
package net.shopin.wms.controller;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.back.entity.vo.TRuleDetailVO;
import net.shopin.back.util.HttpUtil;
import net.shopin.back.view.RuleChannelDetailVO;
import net.shopin.wms.domain.entity.TRuleDetailMql;
import net.shopin.wms.domain.entity.TRuleNewChannelMql;
import net.shopin.wms.domain.entity.TRuleNewMql;
import net.shopin.wms.service.ITRuleDetailMqlService;
import net.shopin.wms.service.ITRuleNewChannelMqlService;
import net.shopin.wms.service.ITRuleNewMqlService;
import net.shopin.wms.util.ResultUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.constants.SystemConfig;

/**
 * @Class Name TRuleNewMqlController
 * @Author shiying
 * @Create In 2013-9-18
 */
@Controller
@RequestMapping(value = "/ruleMql")
public class TRuleNewMqlController {
	
	@Autowired
	private ITRuleNewMqlService truleNewMqlService;
	@Autowired
	private ITRuleNewChannelMqlService truleNewChannelMqlService;
	@Autowired
	private ITRuleDetailMqlService truleDetailMqlService;
	@ResponseBody
	@RequestMapping(value = { "/rule" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String queryRule(Model m, HttpServletRequest request,
			HttpServletResponse response) {
		String json="";
		try {
			List<TRuleNewMql> ruleResultList = this.truleNewMqlService
					.findAllRules();
			System.out.println("listfewda=" + ruleResultList);
			json = ResultUtil.createSuccessResult(ruleResultList);
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}
	
	@ResponseBody
	@RequestMapping(value = { "/initupdate" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String initUpdate(Model m, HttpServletRequest request,
			HttpServletResponse response, String sid) {
		String json="";
		Integer ruleSid = Integer.valueOf(sid);
		System.out.println("sid=" + sid);
		try {
				TRuleNewMql vo = truleNewMqlService.selectByPrimaryKey(ruleSid);
				json = ResultUtil.createSuccessResult(vo);
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		System.out.println("json"+json);
			return json;
	}
	
	@ResponseBody
	@RequestMapping(value = { "/deleterules" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String deleteProduct(Model m, HttpServletRequest request,
			HttpServletResponse response, String ruleSid) {
            String json="";
		try {
			this.truleNewMqlService.deleteByPrimaryKey(Integer.valueOf(ruleSid));
			this.truleNewChannelMqlService.deleteByPrimaryKey(Integer
					.valueOf(ruleSid));
			this.truleDetailMqlService.deleteByPrimaryKey(Integer.valueOf(ruleSid));
			json = ResultUtil.createSuccessResult();
		} catch(Exception e)  {
			json = ResultUtil.createFailureResult(e);
		}
        return json;
	}
	
	@ResponseBody
	@RequestMapping(value = { "/findDetails" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String findDetails(Model m, HttpServletRequest request,
			HttpServletResponse response, String sid) throws SQLException {
		Integer ruleSid = Integer.valueOf(sid);
		System.out.println("ruelSid=" + sid);
		String json="";
		try {
			
				List<TRuleDetailMql> vo = truleDetailMqlService.findDetails(ruleSid);
				json = ResultUtil.createSuccessResult(vo);
			
		}catch(Exception e){
			json = ResultUtil.createFailureResult(e);
		}
		
		finally {

			return json;
		}
	}

	@ResponseBody
	@RequestMapping(value = { "/channel" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getChannel(Model m, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
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
	@RequestMapping(value = { "/brand" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getBrand(Model m, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
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
	@Transactional
	@ResponseBody
	@RequestMapping(value = { "/saveRule" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String savePhotoRule(@ModelAttribute RuleChannelDetailVO key,
			String size, Model m, HttpServletRequest request,
			HttpServletResponse response) throws SQLException, ParseException {

		String json = "";
		if (key != null && !"".equals(key)) {

			this.saveTRuleNew(key);
			this.saveTRuleNewChannel(key);
			this.savetRuleDetail(key, size);
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
		if (key != null && !"".equals(key)) {

			this.updateTRuleNew(key);
			// this.saveTRuleNewChannel(key, request, response);
			this.updateTRuleDetail(key, size);
			json = "{'success':true}";

		} else {
			json = "{'success':false}";
		}
		return json;
	}

	
	public void saveTRuleNew(RuleChannelDetailVO key)
			throws ParseException, SQLException {
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		TRuleNewMql tRuleNewMql = new TRuleNewMql();

		if (key.getActiveBeginTime() != null
				&& !"".equals(key.getActiveBeginTime())) {
			tRuleNewMql.setActiveBeginTime(date.parse(key.getActiveBeginTime()));
		}
		if (key.getActiveEndTime() != null
				&& !"".equals(key.getActiveEndTime())) {
			tRuleNewMql.setActiveEndTime(date.parse(key.getActiveEndTime()));
		}
		if (key.getCreateTime() != null && !"".equals(key.getCreateTime())) {
			tRuleNewMql.setCreateTime(date.parse(key.getCreateTime()));
		}
		if (key.getCreateUser() != null && !"".equals(key.getCreateUser())) {
			tRuleNewMql.setCreateUser(key.getCreateUser());
		}
		if (key.getRuleName() != null && !"".equals(key.getRuleName())) {
			tRuleNewMql.setRuleName(key.getRuleName());
		}

		tRuleNewMql.setFlag(1);
		this.truleNewMqlService.insertSelective(tRuleNewMql);
	}
	
	public void saveTRuleNewChannel(RuleChannelDetailVO key)
			throws SQLException {
		TRuleNewChannelMql ChannelMql = new TRuleNewChannelMql();

		String[] channelName = key.getChannelName().split(",");
		String[] channelSid = key.getChannelSid().split(",");
		Integer ruleSid = this.truleNewMqlService.queryMaxSidNum();

		for (int i = 0; i < channelName.length; i++) {
			ChannelMql.setChannelName(channelName[i]);
			ChannelMql.setChannelSid(Integer.valueOf(channelSid[i]));
			ChannelMql.setRuleSid(Integer.valueOf(ruleSid));

			this.truleNewChannelMqlService.insertSelective(ChannelMql);
		}

	}
	
	public void savetRuleDetail(RuleChannelDetailVO key, String size)
			throws SQLException, ParseException {
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

		TRuleDetailMql tDetailMql = new TRuleDetailMql();
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
		Integer ruleSid = this.truleNewMqlService.queryMaxSidNum();
		for (int i = 0; i < detailSize; i++) {

			tDetailMql.setRuleSid(Integer.valueOf(ruleSid));

			if (brandName.length > i) {
				if (brandName[i] != null && !"".equals(brandName[i]))
					tDetailMql.setBrandName(brandName[i]);
			}
			if (brandSid.length > i) {
				System.out.println(brandSid.length);
				if (brandSid[i] != null && !"".equals(brandSid[i])) {
					tDetailMql.setBrandSid(Integer.valueOf(brandSid[i]));
				}
			}
			if (priceMin.length > i) {
				System.out.println(priceMin.length);
				if (priceMin[i] != null && !"".equals(priceMin[i])) {
					System.out.println(priceMin[i]);
					tDetailMql.setPriceMin(Long.valueOf(priceMin[i]));
				}
			}
			if (offMin.length > i) {
				if (offMin[i] != null && !"".equals(offMin[i]))
					tDetailMql.setOffMin(Double.valueOf(offMin[i]));
			}
			if (offMax.length > i) {
				if (offMax[i] != null && !"".equals(offMax[i]))
					tDetailMql.setOffMax(Double.valueOf(offMax[i]));
			}
			if (priceMax.length > i) {
				if (priceMax[i] != null && !"".equals(priceMax[i]))
					tDetailMql.setPriceMax(Long.valueOf(priceMax[i]));
			}
			if (stockMin.length > i) {
				if (stockMin[i] != null && !"".equals(stockMin[i]))
					tDetailMql.setStockMin(Integer.valueOf(stockMin[i]));
			}
			if (stockMax.length > i) {
				if (stockMax[i] != null && !"".equals(stockMax[i]))
					tDetailMql.setStockMax(Integer.valueOf(stockMax[i]));
			}
			if (productClassSid.length > i) {
				if (productClassSid[i] != null
						&& !"".equals(productClassSid[i])) {
					tDetailMql.setProductClassSid(Integer.valueOf(productClassSid[i]));
				}
			}
			if (productClassName.length > i) {
				if (productClassName[i] != null
						&& !"".equals(productClassName[i]))
					tDetailMql.setProductClassName(productClassName[i]);
			}
			if (shopName.length > i) {
				if (shopName[i] != null && !"".equals(shopName[i]))
					tDetailMql.setShopName(shopName[i]);
			}
			if (shopSid.length > i) {
				if (shopSid[i] != null && !"".equals(shopSid[i]))
					tDetailMql.setShopSid(Integer.valueOf(shopSid[i]));
			}
			if (saleSum.length > i) {
				if (saleSum[i] != null && !"".equals(saleSum[i]))
					tDetailMql.setSaleSum(Integer.valueOf(saleSum[i]));
			}
			if (priceUpdateTime.length > i) {
				if (priceUpdateTime[i] != null
						&& !"".equals(priceUpdateTime[i]))
					tDetailMql.setPriceUpdateTime(date.parse(priceUpdateTime[i]));
			}
			if (saleCode.length > i) {
				if (saleCode[i] != null && !"".equals(saleCode[i]))
					tDetailMql.setSaleCode(saleCode[i]);
			}
			this.truleDetailMqlService.insert(tDetailMql);
		}
	}
	
	public void updateTRuleNew(RuleChannelDetailVO key)
			throws ParseException, SQLException {
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		TRuleNewMql tRuleNewMql = new TRuleNewMql();

		if (key.getActiveBeginTime() != null
				&& !"".equals(key.getActiveBeginTime())) {
			tRuleNewMql.setActiveBeginTime(date.parse(key.getActiveBeginTime()));
		}
		if (key.getActiveEndTime() != null
				&& !"".equals(key.getActiveEndTime())) {
			tRuleNewMql.setActiveEndTime(date.parse(key.getActiveEndTime()));
		}
		if (key.getUpdateTime() != null && !"".equals(key.getUpdateTime())) {
			tRuleNewMql.setUpdateTime(date.parse(key.getUpdateTime()));
		}
		if (key.getUpdateUser() != null && !"".equals(key.getUpdateUser())) {
			tRuleNewMql.setUpdateUser(key.getUpdateUser());
		}
		if (key.getRuleName() != null && !"".equals(key.getRuleName())) {
			tRuleNewMql.setRuleName(key.getRuleName());
		}
		if (key.getSid() != null && !"".equals(key.getSid())) {
			tRuleNewMql.setSid(Integer.valueOf(key.getSid()));
		}

		tRuleNewMql.setFlag(1);
		this.truleNewMqlService.updateByPrimaryKeySelective(tRuleNewMql);
	}
	
	public void updateTRuleDetail(RuleChannelDetailVO key, String size)
			throws SQLException, ParseException {
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
			TRuleDetailMql tDetailMql = new TRuleDetailMql();
			if (detailSid.length > i) {
				if (detailSid[i] != null && !"".equals(detailSid[i]))
					tDetailMql.setSid(Integer.valueOf(detailSid[i]));
			}
			tDetailMql.setRuleSid(Integer.valueOf(ruleSid));

			if (brandName.length > i) {
				if (brandName[i] != null && !"".equals(brandName[i]))
					tDetailMql.setBrandName(brandName[i]);
			}
			if (brandSid.length > i) {
				if (brandSid[i] != null && !"".equals(brandSid[i])) {
					tDetailMql.setBrandSid(Integer.valueOf(brandSid[i]));
				}
			}
			if (offMin.length > i) {
				if (offMin[i] != null && !"".equals(offMin[i]))
					tDetailMql.setOffMin(Double.valueOf(offMin[i]));
			}
			if (offMax.length > i) {
				if (offMax[i] != null && !"".equals(offMax[i]))
					tDetailMql.setOffMax(Double.valueOf(offMax[i]));
			}
			if (priceMin.length > i) {
				if (priceMin[i] != null && !"".equals(priceMin[i]))
					tDetailMql.setPriceMin(Long.valueOf(priceMin[i]));
			}
			if (priceMax.length > i) {
				if (priceMax[i] != null && !"".equals(priceMax[i]))
					tDetailMql.setPriceMax(Long.valueOf(priceMax[i]));
			}
			if (stockMin.length > i) {
				if (stockMin[i] != null && !"".equals(stockMin[i]))
					tDetailMql.setStockMin(Integer.valueOf(stockMin[i]));
			}
			if (stockMax.length > i) {
				if (stockMax[i] != null && !"".equals(stockMax[i]))
					tDetailMql.setStockMax(Integer.valueOf(stockMax[i]));
			}
			if (productClassSid.length > i) {
				if (productClassSid[i] != null
						&& !"".equals(productClassSid[i])) {
					tDetailMql.setProductClassSid(Integer.valueOf(productClassSid[i]));
				}
			}
			if (productClassName.length > i) {
				if (productClassName[i] != null
						&& !"".equals(productClassName[i]))
					tDetailMql.setProductClassName(productClassName[i]);
			}
			if (shopName.length > i) {
				if (shopName[i] != null && !"".equals(shopName[i])) {
					tDetailMql.setShopName(shopName[i]);
				}
			}
			if (shopSid.length > i) {
				if (shopSid[i] != null && !"".equals(shopSid[i]))
					tDetailMql.setShopSid(Integer.valueOf(shopSid[i]));
			}
			if (saleSum.length > i) {
				if (saleSum[i] != null && !"".equals(saleSum[i]))
					tDetailMql.setSaleSum(Integer.valueOf(saleSum[i]));
			}
			if (priceUpdateTime.length > i) {
				if (priceUpdateTime[i] != null
						&& !"".equals(priceUpdateTime[i]))
					tDetailMql.setPriceUpdateTime(date.parse(priceUpdateTime[i]));
			}
			if (saleCode.length > i) {
				if (saleCode[i] != null && !"".equals(saleCode[i]))
					tDetailMql.setSaleCode(saleCode[i]);
			}

			this.truleDetailMqlService.updateByPrimaryKeySelective(tDetailMql);
		}
	}
}
