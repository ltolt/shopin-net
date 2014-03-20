package net.shopin.product.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.category.domain.entity.SsdCategory;
import net.shopin.product.domin.entity.SsdBrandCategory;
import net.shopin.product.domin.entity.SsdBrandDisplay;
import net.shopin.product.domin.vo.SsdBrandCategoryVO;
import net.shopin.service.ISsdBrandCategoryService;
import net.shopin.service.ISsdBrandDisplayService;
import net.shopin.service.ISsdCategoryService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.shopin.core.util.LoadProperties;

@Controller
public class SsdAdminBrandCategoryController {
	@Autowired
	private  ISsdBrandCategoryService brandCategoryService;
	
	@Autowired
	private ISsdCategoryService categoryService;
	
	@Autowired
	private ISsdBrandDisplayService brandDisplayService;

	@RequestMapping(value = "/brandCategory/init", method = RequestMethod.GET)
	public String init(Model m, HttpServletRequest request,
			HttpServletResponse response){
		return "/product/brandCategory";
	}
	
	@ResponseBody
	@RequestMapping(value = "/brandCategory/list", method = {RequestMethod.POST,RequestMethod.GET})
	public String getRelation(Model m, HttpServletRequest request,HttpServletResponse response,String brandSid,String channelSid,String page,String rows){
		Map<String,Object> map = new LinkedHashMap<String,Object>();
		try{
			SsdBrandCategory brandCate = new SsdBrandCategory();
			if(brandSid!=null&&!"".equals(brandSid)){
				brandCate.setBrandSid(Long.parseLong(brandSid));
			}
			if(channelSid!=null&&!"".equals(channelSid)){
				String f = LoadProperties.readValue("channel.ERP");
				brandCate.setChannelSid(Long.parseLong(f));
			}
			int total=this.brandCategoryService.getPageTotal(brandCate);
			brandCate.setStart((Integer.valueOf(page)-1)*Integer.valueOf(rows));
			brandCate.setPageSize(Integer.valueOf(rows));
			List<SsdBrandCategoryVO>list = this.brandCategoryService.selectPage(brandCate);
			if(list!=null){
				map.put("success", "true");
				map.put("total", total);
				map.put("rows", list);
				
			}else{
				map.put("success", "false");
			}
		
		}catch(Exception e){
			map.put("success", "false");
			e.printStackTrace();
		}
		
		Gson gson=new Gson();
		return gson.toJson(map);
	}
	
	@ResponseBody
	@RequestMapping(value = "/brandCategory/delete", method = {RequestMethod.POST,RequestMethod.GET})
	public String getBrandCate(Model model,HttpServletRequest request,HttpServletResponse response,String brandSid,String channelSid){
		String result="";
		SsdBrandCategory brandCate = new SsdBrandCategory();
		
		if(brandSid!=null&&!"".equals(brandSid)){
			brandCate.setBrandSid(Long.parseLong(brandSid));
			
		}
		if(channelSid!=null&&!"".equals(channelSid)){
			brandCate.setChannelSid(Long.parseLong(channelSid));
			
		}
		int a =this.brandCategoryService.deleteSelective(brandCate);
		if(a==0){
			result = JSONObject.fromObject("{success:false}").toString();
		}else{
			 result=JSONObject.fromObject("{success:true}").toString();
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/brandCategory/save", method = {RequestMethod.POST,RequestMethod.GET})
	public String getSave(Model model,HttpServletRequest request,HttpServletResponse response,
			String channelSid,String brandSid,String nodeIds){
		String result="";
		try{
			long brandId=Long.parseLong(brandSid);
			long chanSid=Long.parseLong(channelSid);
			SsdBrandCategory brand = new SsdBrandCategory();
			brand.setBrandSid(brandId);
			brand.setChannelSid(chanSid);
			if(nodeIds!=null&&!"".equals(nodeIds)){
				String[] cateSids =nodeIds.split(",");
				
			   this.brandCategoryService.deleteSelective(brand);
			  
				for(int i=0;i<cateSids.length;i++){
					
					brand.setCategorySid(Long.parseLong(cateSids[i]));
					
					int get =this.brandCategoryService.insertSelect(brand);
					if(get==0){
						result = JSONObject.fromObject("{success:false}").toString();
						return result;
					}else{
						result=JSONObject.fromObject("{success:true}").toString();
					}
				 
				}

			}else{
				this.brandCategoryService.deleteSelective(brand);
				result = JSONObject.fromObject("{success:false}").toString();

			}
			
		}catch(Exception e){
			result = JSONObject.fromObject("{success:false}").toString();
			e.printStackTrace();
		}

		
		return result;
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/brandCategory/edit", method = {RequestMethod.POST,RequestMethod.GET})
	public String edit(Model model,HttpServletRequest request,HttpServletResponse response,
			String channelSid,String brandSid){
		SsdBrandCategory brandCate = new SsdBrandCategory();
		brandCate.setBrandSid(Long.parseLong(brandSid));
		brandCate.setChannelSid(Long.parseLong(channelSid));
		List<SsdBrandCategory> list = this.brandCategoryService.selectSelective(brandCate);
		StringBuffer sb = new StringBuffer();
		for(SsdBrandCategory cate:list){
			String casid = cate.getCategorySid().toString();
			
			sb.append(casid+",");

		}
		
		String cid =sb.toString();
		JSONObject json = new JSONObject();
		json.put("cid", cid);
		List<JSONObject> lists = new ArrayList<JSONObject>();
		lists.add(json);
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", 1);
        jsonMap.put("rows", lists);
        String result = JSONObject.fromObject(jsonMap).toString();
        
        
        
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/brandCategory/liste", method = {RequestMethod.POST,RequestMethod.GET})
	public String getList(Model m, HttpServletRequest request,
			HttpServletResponse response,String brandSid,String id,String channelSid){
			
		SsdBrandCategory brandCate = new SsdBrandCategory();
		brandCate.setBrandSid(Long.parseLong(brandSid));
		
		//brandCate.setChannelSid(Long.parseLong(channelSid));
		String f = LoadProperties.readValue("channel.ERP");
		brandCate.setChannelSid(Long.parseLong(f));
		List<SsdBrandCategory> list = this.brandCategoryService.selectSelective(brandCate);
		StringBuffer sb = new StringBuffer();
		for(SsdBrandCategory cate:list){
			String casid = cate.getCategorySid().toString();
			
			sb.append(casid+",");

		}
		String str =sb.toString();
		String[] pids = (str+",2,").split(",");
		if (id == null || "".equals(id)) {
			id = 0+"";
		}
		JSONArray jsons = new JSONArray();
		List<SsdCategory> liste = this.categoryService.getByParentSid(Long.valueOf(id));

		for (SsdCategory cat : liste) {
			JSONObject json = new JSONObject();
			json.put("id", cat.getSid());
			json.put("text", cat.getName());
			boolean isHave = false;
			for (String pid : pids) {
				if (cat.getSid().toString().equals(pid)) {
					isHave = true;
					break;
				}
			}
			if (cat.getIsParent() == 1) {
				json.put("state", "closed");
			} else {
				json.put("state", "open");
			}
			if (isHave) {
				json.put("checked", true);
			} else {
				json.put("checked", false);
			}
			jsons.add(json);
		}
		
		return jsons.toString();
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/brandCategory/brandList", method = {RequestMethod.POST,RequestMethod.GET})
	public String getBrandCategoryRelation(Model model,HttpServletRequest request,HttpServletResponse response,
			String page,String rows,String brandName){
		Map<String,Object> map = new LinkedHashMap<String,Object>();
		try{
			SsdBrandDisplay brandDisplay = new SsdBrandDisplay();
			if(!(brandName == null || "".equals(brandName))){
				brandDisplay.setBrandName(brandName);
			}
			brandDisplay.setStart((Integer.valueOf(page)-1)*Integer.valueOf(rows));
			brandDisplay.setPageSize(Integer.valueOf(rows));
			int total= this.brandDisplayService.getPageTotal(brandDisplay);
			List<SsdBrandDisplay> list = this.brandDisplayService.getPageSelect(brandDisplay);
			if(list!=null){
				map.put("success", "true");
				map.put("total", total);
				map.put("rows", list);
			}else{
				map.put("success", "false");
			}
		}catch(Exception e){
			map.put("success", "false");
			e.printStackTrace();
		}
		
		Gson gson=new Gson();
		return gson.toJson(map);
	}
}
