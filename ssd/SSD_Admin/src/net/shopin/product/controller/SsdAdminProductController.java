package net.shopin.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.shopin.category.domain.entity.SsdCategory;
import net.shopin.category.domain.entity.SsdProductCategory;
import net.shopin.product.domin.entity.SsdBrandDisplay;
import net.shopin.product.domin.entity.SsdBrandRelation;
import net.shopin.product.domin.entity.SsdProduct;
import net.shopin.product.domin.vo.SsdBrandRelationVO;
import net.shopin.service.ISsdBrandDisplayService;
import net.shopin.service.ISsdBrandRelationService;
import net.shopin.service.ISsdCategoryService;
import net.shopin.service.ISsdProductCategoryService;
import net.shopin.service.ISsdProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.shopin.core.framework.base.vo.AjaxMessageVO;

@Controller
public class SsdAdminProductController {
	
	@Autowired
	private ISsdProductService ssdProductServiceImpl;
	
	@Autowired
	private ISsdBrandDisplayService brandDisplayService;
	
	@Autowired
	private ISsdBrandRelationService brandRelationService;
	
	@Autowired
	private ISsdCategoryService categoryService;
	
	@Autowired
	private ISsdProductCategoryService productCategoryService;
	
	@RequestMapping(value = "/ssdAdmin/init", method = RequestMethod.GET)
	public String init(Model m, HttpServletRequest request,
			HttpServletResponse response){
		return "/product/ssdProduct";
	}
	
	/**
	 * 商品(ssd_product)商品列表接口.
	 * @author sun
	 * @param model
	 * @param request
	 * @param response
	 * @param page
	 * @param rows
	 * @param productSku
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/ssdAdmin/list", method = {RequestMethod.POST,RequestMethod.GET})
	public String list(Model model,HttpServletRequest request,HttpServletResponse response,
			String page,String rows,String productSku){
		
		SsdProduct ssd= new SsdProduct();
		if (!(productSku == null || "".equals(productSku))) {
			ssd.setProductSku(productSku);
		}
		ssd.setStart((Integer.valueOf(page)-1)*Integer.valueOf(rows));
		ssd.setPageSize(Integer.valueOf(rows));
		int total = this.ssdProductServiceImpl.getTotalCount(ssd);
		
		List<SsdProduct> lists = this.ssdProductServiceImpl.selectPage(ssd);
		Map<String, Object> jsonMap = new HashMap<String, Object>();  
        jsonMap.put("total", total);
        jsonMap.put("rows", lists);
        String result = JSONObject.fromObject(jsonMap).toString();
        return result;
	}
	
	
	
	/**
	 * 商品品类维护界面品类树展开接口
	 * @author xuxingfu
	 * @param model
	 * @param request
	 * @param response
	 * @param pid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/hide/edit", method = {RequestMethod.POST,RequestMethod.GET})
	public String hide(Model model,HttpServletRequest request,HttpServletResponse response,
			String pid){
		SsdProductCategory spc = new SsdProductCategory();
		spc.setProductSid(Long.valueOf(pid));
		List<SsdProductCategory> spcs = this.productCategoryService.selectList(spc);
		List<Long> cateId = new ArrayList<Long>();
		for (SsdProductCategory s : spcs) {
			SsdCategory sc = this.categoryService.getByCategorySidAndChannelSid(s.getCategorySid(), s.getChannelSid());
			cateId.add(sc.getSid());
		}
		JSONObject json = new JSONObject();
		json.put("categorySid", cateId);
		String result = json.toString();
		return result;
	}
	
	/**
	 * product_category relation 增加接口.
	 * @author xuxingfu 
	 * @param model
	 * @param request
	 * @param response
	 * @param productSid
	 * @param channelSid
	 * @param categorySid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/pro_cate/save", method = {RequestMethod.POST,RequestMethod.GET})
	public String save(Model model,HttpServletRequest request,HttpServletResponse response,
			String productSid,String categorySid){
		SsdProductCategory spc = new SsdProductCategory();
		spc.setProductSid(Long.valueOf(productSid));
		this.productCategoryService.deleteByRecord(spc);
		boolean flag = true;
		if (!(categorySid == null || "".equals(categorySid))) {
			String[] cids = categorySid.split(",");
			for (String cid : cids) {
				if (!(cid == null || "".equals(cid))) {
					SsdCategory sc = this.categoryService.get(Long.valueOf(cid));
					SsdProductCategory sp = new SsdProductCategory();
					sp.setProductSid(Long.valueOf(productSid));
					sp.setCategorySid(sc.getCategorySid());
					sp.setChannelSid(sc.getChannelSid());
					if (sc.getIsParent() == 0) {
						int num = this.productCategoryService.insert(sp);
						flag = flag && num==1;
					}
				}
			}
		}
		AjaxMessageVO result=new AjaxMessageVO();
		if (flag) {
			result.setStatus("success");
			result.setMessage("操作成功");
		} else {
			result.setStatus("failure");
			result.setMessage("操作失败");
		}
		Gson gson=new Gson();
		return gson.toJson(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/pro_cate/edit", method = {RequestMethod.POST,RequestMethod.GET})
	public String cancel(Model model,HttpServletRequest request,HttpServletResponse response,
			String id,String channelSid){
		String cid = this.categoryService.getCateString(Long.valueOf(id));
		JSONObject json = new JSONObject();
		json.put("cid", cid);
		String result = json.toString();
		return result;
	}
	
	@RequestMapping(value = "/brandRelation/init", method = RequestMethod.GET)
	public String getBrand(Model m, HttpServletRequest request,HttpServletResponse response){
		
		return "/product/brand";
	}
	
	/**
	 * 品牌维护界面 原品牌列表接口
	 * @author sun
	 * @param model
	 * @param request
	 * @param response
	 * @param channelSid
	 * @param page
	 * @param rows
	 * @param brandName
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/brandRelation/list", method = {RequestMethod.POST,RequestMethod.GET})
	public String getBrandRelation(Model model,HttpServletRequest request,HttpServletResponse response,
			String page,String rows,String brandName){ 
		
		Map<String,Object> map = new LinkedHashMap<String,Object>();
		try{
			//SsdBrand  brand = new SsdBrand();
			SsdBrandRelationVO brandVO = new SsdBrandRelationVO();
			if (!(brandName == null || "".equals(brandName))) {
				brandVO.setBrandName(brandName);
			}
//			if(!(channelSid==null||"".equals(channelSid))){
//				brandVO.setChannelSid(Long.valueOf(channelSid));
//			}
//			String f = LoadProperties.readValue("channel.ERP");
//			brandVO.setChannelSid(Long.valueOf(f));
			brandVO.setStart((Integer.valueOf(page)-1)*Integer.valueOf(rows));
			brandVO.setPageSize(Integer.valueOf(rows));
			
			int total = this.brandRelationService.getTotal(brandVO);
			 List<SsdBrandRelationVO> list = this.brandRelationService.getByRootSid(brandVO);
			
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
	
	/**
	 * 品牌维护界面目标品牌列表接口
	 * @author sun
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/brandRelation/brandRoot", method = {RequestMethod.POST,RequestMethod.GET})
	public String getbrandRoot(Model model,HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> map = new LinkedHashMap<String,Object>();
		try{

			SsdBrandDisplay brandDisplay = new SsdBrandDisplay();
			List<SsdBrandDisplay> list = this.brandDisplayService.getListSelective(brandDisplay);
			if(list!=null){
				map.put("success", "true");
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
	/**
	 * 品牌维护界面增加接口.
	 * @author sun
	 * @param model
	 * @param request
	 * @param response
	 * @param sid1
	 * @param sid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/brandRelation/update", method = {RequestMethod.POST,RequestMethod.GET})
	public String saveBrand(Model model,HttpServletRequest request,HttpServletResponse response,String sid1,String sid){
		String result="";
		SsdBrandRelation brandRelation = new SsdBrandRelation();
		brandRelation.setBrandSid(Long.parseLong(sid1));
		brandRelation.setBrandRootSid(Long.parseLong(sid));
		
		
		int a = this.brandRelationService.saveOrUpdateRelation(brandRelation);
		if(a==0){
			result = JSONObject.fromObject("{success:flase}").toString();
		}else {
			result = JSONObject.fromObject("{success:true}").toString();
		}
		
		return result;
	}
	
	/**
	 * 品牌维护界面 删除接口.
	 * @author sun
	 * @param model
	 * @param request
	 * @param response
	 * @param sid
	 * @param brandSid
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/brandRelation/delete", method = {RequestMethod.POST,RequestMethod.GET})
	public String removeBrandRoot(Model model,HttpServletRequest request,HttpServletResponse response,String sid,String brandSid){
		String result="";

		SsdBrandRelation brandRelation = new SsdBrandRelation();
		brandRelation.setSid(Long.parseLong(sid));
		brandRelation.setBrandRootSid(new Long(0));
		int a = this.brandRelationService.updateSelective(brandRelation);
		if(a==0){
			result = JSONObject.fromObject("{success:flase}").toString();
		}else {
			result = JSONObject.fromObject("{success:true}").toString();
		}
		
		return result;
	}
}
