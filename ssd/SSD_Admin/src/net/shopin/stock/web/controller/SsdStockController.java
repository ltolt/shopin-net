package net.shopin.stock.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.shopin.baseinfo.domain.entity.SsdShopInfo;
import net.shopin.baseinfo.domain.entity.SsdSupplyInfo;
import net.shopin.product.domin.entity.SsdBrand;
import net.shopin.service.ISsdBrandService;
import net.shopin.service.ISsdShopInfoService;
import net.shopin.service.ISsdSupplyInfoService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SsdStockController {
	
	@Autowired
	private ISsdSupplyInfoService ssdSupplyInfoService;
	
	@Autowired
	private ISsdShopInfoService ssdShopInfoService;
	
	@Autowired
	private ISsdBrandService SsdBrandService;
	
	@ResponseBody
	@RequestMapping(value = "/ssd/supplylist", method = RequestMethod.POST)
	public String supplyList(Model m, HttpServletRequest request,
			HttpServletResponse response) {
		
		SsdSupplyInfo ssi = new SsdSupplyInfo();
		List<SsdSupplyInfo> list = this.ssdSupplyInfoService.selectList(ssi);
		JSONArray array = JSONArray.fromObject(list);
		
		return array.toString();
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/ssd/shoplist", method = RequestMethod.POST)
	public String channelList(Model m, HttpServletRequest request,
			HttpServletResponse response) {
		
		SsdShopInfo ssi = new SsdShopInfo();
		List<SsdShopInfo> list = this.ssdShopInfoService.selectList(ssi);
        JSONArray array = JSONArray.fromObject(list);
        return array.toString();
	}
	
	@ResponseBody
	@RequestMapping(value = "/ssd/brandlist", method = RequestMethod.POST)
	public  String brandList(Model m, HttpServletRequest request,
			HttpServletResponse response){
		SsdBrand brand = new SsdBrand();
		List<SsdBrand> list = this.SsdBrandService.selectList(brand);
		   JSONArray array = JSONArray.fromObject(list);
	        return array.toString();
	}
	
	
}
