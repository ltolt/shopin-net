package net.shopin.product.controller;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.baseinfo.domain.entity.SsdStockTypeDict;
import net.shopin.service.ISsdStockTypeDictService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.shopin.core.framework.base.vo.AjaxMessageVO;

@Controller
public class StockTypeController {
	@Autowired
	private ISsdStockTypeDictService stockTypeService;
	
	
	@RequestMapping(value = "/stockType/init", method = RequestMethod.GET)
	public String init(Model m, HttpServletRequest request,
			HttpServletResponse response){
		
		return "/product/stockType";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/stockType/list", method = {RequestMethod.POST,RequestMethod.GET})
	public String getList(Model model,HttpServletRequest request,HttpServletResponse response,
			String page,String rows,String stockName){
		Map<String,Object> map = new LinkedHashMap<String,Object>();
		try{
			SsdStockTypeDict record = new SsdStockTypeDict();
			if(!(stockName==null||"".equals(stockName))){
				record.setStockName(stockName.trim());
			}
			if(page==null||"".equals(page)){
				page="1";
			}
			if(rows==null||"".equals(rows)){
				rows="10";
			}
			record.setStart((Integer.valueOf(page)-1)*Integer.valueOf(rows));
			record.setPageSize(Integer.valueOf(rows));
			int total = this.stockTypeService.getPageCount(record);
			List<SsdStockTypeDict> list = this.stockTypeService.getListPage(record);
			if(list!=null){
				map.put("success", "true");
				map.put("rows", list);
				map.put("total", total);
			}else{
				map.put("success", "false");
			}
		}catch(Exception e){
			map.put("success", "false");
			e.printStackTrace();
		}
		Gson gson = new Gson();
		return gson.toJson(map);
	}
	
	@ResponseBody
	@RequestMapping(value = "/stockType/save", method = {RequestMethod.POST,RequestMethod.GET})
	public String save(Model model,HttpServletRequest request,HttpServletResponse response,
			String sid,String sid1,String stockName){
		int flag;
		AjaxMessageVO result=new AjaxMessageVO();
		try{
			SsdStockTypeDict record = new SsdStockTypeDict();
			if(!(sid1==null||"".equals(sid1))){
				record.setSid(Long.valueOf(sid1));
			}
			if(!(stockName==null||"".equals(stockName))){
				record.setStockName(stockName);
			}
			SsdStockTypeDict stock = null;
			if(sid!=null&&!"".equals(sid)){
				stock = this.stockTypeService.selectByPrimaryKey(Long.valueOf(sid));

			}
			if(stock!=null){
				flag=this.stockTypeService.deleteByPrimaryKey(Long.valueOf(sid));
			}
				flag=this.stockTypeService.insert(record);
			
			if(flag==1){
				result.setStatus("success");
				result.setMessage("操作成功");
			}else{
				result.setStatus("failure");
				result.setMessage("操作失败");
			}
		}catch(Exception e){
			result.setStatus("failure");
			result.setMessage("操作失败");
			e.printStackTrace();
		}
		Gson gson=new Gson();
		return gson.toJson(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/stockType/delete", method = {RequestMethod.POST,RequestMethod.GET})
	public String delRow(Model model,HttpServletRequest request,HttpServletResponse response,String sid){
		AjaxMessageVO result=new AjaxMessageVO();
		int flag= this.stockTypeService.deleteByPrimaryKey(Long.valueOf(sid));
		if(flag==1){
			result.setStatus("success");
			result.setMessage("删除成功");
		}else{
			result.setStatus("failure");
			result.setMessage("删除失败");
		}
		Gson gson=new Gson();
		return gson.toJson(result);
	}
}
