package net.shopin.stock.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.service.ISsdPriceService;
import net.shopin.stock.domain.entity.SsdPrice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class SsdPriceAdminController {

	@Autowired
	private ISsdPriceService ssdPriceService;
	
	@RequestMapping(value = "/price/init", method = RequestMethod.GET)
	public String init(Model m, HttpServletRequest request,
			HttpServletResponse response){
		return "/stock/price_view";
	}
	
	@ResponseBody
	@RequestMapping(value = "/price/list", method = RequestMethod.POST)
	public String channelList(Model m, HttpServletRequest request,String supplySid,String shopSid,
			HttpServletResponse response,String page,String rows,String productDetailSid) {
		
		SsdPrice record= new SsdPrice();
		if (!("".equals(supplySid) || supplySid == null)) {
			record.setSupplySid(Long.valueOf(supplySid));
		}
		if (!("".equals(shopSid) || shopSid == null)) {
			record.setShopSid(Long.valueOf(shopSid));
		}
		if (!("".equals(productDetailSid) || productDetailSid == null)) {
			record.setProductDetailSid(Long.valueOf(productDetailSid));
		}
		if(page==null||"".equals(page)){
			page="1";
		}
		if(rows==null||"".equals(rows)){
			rows="10";
		}
		record.setStart((Integer.valueOf(page)-1)*Integer.valueOf(rows));
		record.setPageSize(Integer.valueOf(rows));
		int total = this.ssdPriceService.selectPageTotal(record);
		
		List<SsdPrice> lists = this.ssdPriceService.selectPage(record);
		Map<String, Object> jsonMap = new HashMap<String, Object>();  
        jsonMap.put("total", total);
        jsonMap.put("rows", lists);
        Gson gson=new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
        return gson.toJson(jsonMap);
	}
}
