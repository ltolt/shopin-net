package net.shopin.stock.web.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.baseinfo.domain.entity.SsdStockTypeDict;
import net.shopin.service.ISsdStockService;
import net.shopin.service.ISsdStockTypeDictService;
import net.shopin.stock.domain.entity.SsdStock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class StockSearchController {
	
	@Autowired
	private ISsdStockService ssdStockService;
	@Autowired
	private ISsdStockTypeDictService stockTypeService;
	
	@RequestMapping(value="/stockSearch/init",method=RequestMethod.GET)
	public String init(Model m, HttpServletRequest request,
			HttpServletResponse response){
		return "/stock/stockSearch";
	}
	
	@ResponseBody
	@RequestMapping(value="/stockSearch/list",method={RequestMethod.POST,RequestMethod.GET})
	public String getStockList(Model model,HttpServletRequest request,HttpServletResponse response,
			String page,String rows,String supplySid,String shopSid,String stockTypeSid,String productDetailSid ){
		
		Map<String,Object> map = new LinkedHashMap<String,Object>();
		SsdStock record= new SsdStock();
		try{
			if(!(supplySid==null||"".equals(supplySid))){
				record.setSupplySid(Long.valueOf(supplySid.trim()));
			}
			if(!(shopSid==null||"".equals(shopSid))){
				record.setShopSid(Long.valueOf(shopSid.trim()));
			}
			if(!(stockTypeSid==null||"".equals(stockTypeSid))){
				record.setStockTypeSid(Long.valueOf(stockTypeSid.trim()));
			}
			if(!(productDetailSid==null||"".equals(productDetailSid))){
				record.setProductDetailSid(Long.valueOf(productDetailSid.trim()));
			}
			
			if(page==null||"".equals(page)){
				page="1";
			}
			if(rows==null||"".equals(rows)){
				rows="10";
			}
			record.setStart((Integer.valueOf(page)-1)*Integer.valueOf(rows));
			record.setPageSize(Integer.valueOf(rows));
			int total = this.ssdStockService.listPageCount(record);
			List<SsdStock> list = this.ssdStockService.selectListPage(record);
			if(list!=null){
				map.put("success", "true");
				map.put("rows", list);
				map.put("total", total);
			}else{
				map.put("success", "Query result is null");
			}
			
		}catch(Exception e){
			map.put("success", "false");
			e.printStackTrace();
		}
		
		Gson gson = new Gson();
		return gson.toJson(map);
	}
	
	@ResponseBody
	@RequestMapping(value={"/stockSearch/stockType"},method={RequestMethod.GET,RequestMethod.POST})
	public String getStockType(Model model,HttpServletRequest request,HttpServletResponse response){
			SsdStockTypeDict record = new SsdStockTypeDict();
		  List<SsdStockTypeDict> list = this.stockTypeService.getListSelective(record);
		  Gson json = new Gson();
		  return json.toJson(list);
	}


}
