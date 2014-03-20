package net.shopin.product.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.shopin.product.domin.entity.SsdBrandDisplay;
import net.shopin.service.ISsdBrandDisplayService;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class SsdBrandDisplayController extends HttpServlet{
	@Autowired
	private ISsdBrandDisplayService brandDisplayService;
	
	public static final String filePlace="E:\\auto\\";
	public static final String brandPictPlace="/brand/";
	
	@RequestMapping(value = "/brandDisplay/init", method = RequestMethod.GET)
	public String init(Model m, HttpServletRequest request,
			HttpServletResponse response){
		return "/product/brand_display";
	}
	/**
	 * display（网站品牌）列表接口.
	 * @author sun
	 * @param model
	 * @param request
	 * @param response
	 * @param page
	 * @param rows
	 * @param brandName
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/brandDisplay/list", method = {RequestMethod.POST,RequestMethod.GET})
	public String getBrandList(Model model,HttpServletRequest request,HttpServletResponse response,
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
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
		return gson.toJson(map);
	}
	
	/**
	 * display删除接口.
	 * @author sun
	 * @param model
	 * @param request
	 * @param response
	 * @param sid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/brandDisplay/delete", method = {RequestMethod.POST,RequestMethod.GET})
	public String delete(Model model,HttpServletRequest request,HttpServletResponse response,String sid){
		String result = "";
		try{
			if(sid!=null&&!"".equals(sid)){
				int a = this.brandDisplayService.deleteByPrimaryKey(Long.parseLong(sid));
				if(a!=0){
					result = JSONObject.fromObject("{success:true}").toString();
				}else{
					result = JSONObject.fromObject("{success:false}").toString();
				}
			}else{
				result = JSONObject.fromObject("{success:false}").toString();
			}
			
		}catch(Exception e){
			result = JSONObject.fromObject("{success:false}").toString();
			e.printStackTrace();
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/brandDisplay/initupdate", method = {RequestMethod.POST,RequestMethod.GET})
	public String getInit(Model model,HttpServletRequest request,HttpServletResponse response,String sid){
		SsdBrandDisplay brandDisplay = this.brandDisplayService.getByPrimaryKey(Long.parseLong(sid));
		Gson gson=new Gson();
		return gson.toJson(brandDisplay);
	}
	
	/**
	 * 网站品牌增加接口.
	 * @author sun
	 * @param model
	 * @param request
	 * @param response
	 * @param sid
	 * @param brandName
	 * @param brandNameSpell
	 * @param brandNameAlias
	 * @param brandNameEn
	 * @param brandDesc
	 * @param brandPict
	 * @param brandCreateCountry
	 * @param brandSpecialty
	 * @param brandSuitability
	 * @param isFactoryStore
	 * @param factoryBigPic
	 * @param factorySmallPic
	 * @param activityBigPic
	 * @param activitySmallPic
	 * @param factoryStoreOrder
	 * @param parentFactoryStoreId
	 * @param logoPic
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/brandDisplay/save", method = {RequestMethod.POST,RequestMethod.GET})
	public String save(Model model,HttpServletRequest request,HttpServletResponse response,String sid,
			String brandName,String brandNameSpell,String brandNameAlias,String brandNameEn,String brandDesc,
			String brandPict,String brandCreateCountry,String brandSpecialty,String brandSuitability,
			String isFactoryStore,String factoryBigPic,String factorySmallPic,String activityBigPic,
			String activitySmallPic,String factoryStoreOrder,String parentFactoryStoreId,String logoPic,
			String brandCreateTime,String aweSome){
		String result = "";
		
		try{
			SsdBrandDisplay brandDisplay = new SsdBrandDisplay();
			if(brandName!=null&&!"".equals(brandName)){
				brandDisplay.setBrandName(brandName);
			}else{
				brandDisplay.setBrandName(null);
			}
			if(brandNameSpell!=null&&!"".equals(brandNameSpell)){
				brandDisplay.setBrandNameSpell(brandNameSpell);
			}else{
				brandDisplay.setBrandNameSpell(null);
			}
			if(brandNameAlias!=null&&!"".equals(brandNameAlias)){
				brandDisplay.setBrandNameAlias(brandNameAlias);
			}else{
				brandDisplay.setBrandNameAlias(null);
			}
			if(brandNameEn!=null&&!"".equals(brandNameEn)){
				brandDisplay.setBrandNameEn(brandNameEn);
			}else{
				brandDisplay.setBrandNameEn(null);
			}
			if(brandDesc!=null&&!"".equals(brandDesc)){
				brandDisplay.setBrandDesc(brandDesc);
			}else{
				brandDisplay.setBrandDesc(null);
			}
			if(brandPict!=null&&!"".equals(brandPict)){
				brandDisplay.setBrandPict(brandPict);
			}else{
				brandDisplay.setBrandPict(null);
			}
			if(brandCreateCountry!=null&&!"".equals(brandCreateCountry)){
				brandDisplay.setBrandCreateCountry(brandCreateCountry);
			}else{
				brandDisplay.setBrandCreateCountry(null);
			}
			if(brandSpecialty!=null&&!"".equals(brandSpecialty)){
				brandDisplay.setBrandSpecialty(brandSpecialty);
			}else{
				brandDisplay.setBrandSpecialty(null);
			}
			if(brandSuitability!=null&&!"".equals(brandSuitability)){
				brandDisplay.setBrandSuitability(brandSuitability);
			}else{
				brandDisplay.setBrandSuitability(null);
			}
			if(isFactoryStore!=null&&!"".equals(isFactoryStore)){
				brandDisplay.setIsFactoryStore(Long.parseLong(isFactoryStore));
			}else{
				brandDisplay.setIsFactoryStore(0L);
			}
			if(factoryBigPic!=null&&!"".equals(factoryBigPic)){
				brandDisplay.setFactoryBigPic(factoryBigPic);
			}else{
				brandDisplay.setFactoryBigPic(null);
			}
			if(factorySmallPic!=null&&!"".equals(factorySmallPic)){
				brandDisplay.setFactorySmallPic(factorySmallPic);
			}else{
				brandDisplay.setFactorySmallPic(null);
			}
			if(activityBigPic!=null&&!"".equals(activityBigPic)){
				brandDisplay.setActivityBigPic(activityBigPic);
			}else{
				brandDisplay.setActivityBigPic(null);
			}
			if(activitySmallPic!=null&&!"".equals(activitySmallPic)){
				brandDisplay.setActivitySmallPic(activitySmallPic);
			}else{
				brandDisplay.setActivitySmallPic(null);
			}
			if(factoryStoreOrder!=null&&!"".equals(factoryStoreOrder)){
				brandDisplay.setFactoryStoreOrder(Long.parseLong(factoryStoreOrder));
			}else{
				brandDisplay.setFactoryStoreOrder(0L);
			}
			if(parentFactoryStoreId!=null&&!"".equals(parentFactoryStoreId)){
				brandDisplay.setParentFactoryStoreId(Long.parseLong(parentFactoryStoreId));
			}else{
				brandDisplay.setParentFactoryStoreId(0L);
			}
			if(logoPic!=null&&!"".equals(logoPic)){
				brandDisplay.setLogoPic(logoPic);
			}else{
				brandDisplay.setLogoPic(null);
			}
			if(brandCreateTime!=null&&!"".equals(brandCreateTime)){
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date date = format.parse(brandCreateTime);
				brandDisplay.setBrandCreateTime(date);
			}else{
				brandDisplay.setBrandCreateTime(new Date());
			}
			if(aweSome!=null&!"".equals(aweSome)){
				brandDisplay.setAweSome(Long.valueOf(aweSome));
			}
			if(sid==null||"".equals(sid)){
				int a = this.brandDisplayService.insertSelective(brandDisplay);
				if(a!=0){
					result = JSONObject.fromObject("{success:true}").toString();
				}else{
					result = JSONObject.fromObject("{success:false}").toString();
				}
			}else{
				brandDisplay.setSid(Long.parseLong(sid));
				int a = this.brandDisplayService.updateSelective(brandDisplay);
				if(a!=0){
					result = JSONObject.fromObject("{success:true}").toString();
				}else{
					result = JSONObject.fromObject("{success:false}").toString();
				}
			}
			
		}catch(Exception e){
			result = JSONObject.fromObject("{success:false}").toString();
			e.printStackTrace();
		}
		
		
		
		return result;
	}
	
	/**
	 * 图片上传接口.
	 * @author sun
	 * @param model
	 * @param request
	 * @param response
	 * @param sid
	 * @param pictPath
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/brandDisplay/savePict", method = {RequestMethod.POST,RequestMethod.GET})
	public String savePict(Model model,HttpServletRequest request,HttpServletResponse response,
			String sid) {
		//String result="";
		 
		Gson gson = new Gson();
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload sfu = new ServletFileUpload(factory);
		try {
			List<FileItem> items = sfu.parseRequest(request);
			for (int i = 0; i < items.size(); i++) {
				FileItem curr = items.get(i);
				if (curr.isFormField()) {

				} else {
					String fileName = curr.getName();
					long a =System.currentTimeMillis();
//					String pictName =String.valueOf(a);
					fileName = sid.trim()+"_2.jpg";
					File file = new File(filePlace + fileName);
					curr.write(file);
					
					String brandPict =brandPictPlace+fileName;
//					SsdBrandDisplay brandDisplay = new SsdBrandDisplay();
//					brandDisplay.setSid(Long.valueOf(sid));
//					brandDisplay.setBrandPict(brandPict);
//					int count = this.brandDisplayService.updateSelectiveBySid(brandDisplay);
//					if(count!=0){
//						result = JSONObject.fromObject("{success:true}").toString();
//					}else{
//						result = JSONObject.fromObject("{success:false}").toString();
//					}
					map.put("success", "true");
					map.put("brandPict", brandPict);
				}
			}
			//result = JSONObject.fromObject("{success:false}").toString();	
		} catch (Exception e) {
			map.put("success", "false");
			e.printStackTrace();
		}
		
		return gson.toJson(map);
	}
	
}
