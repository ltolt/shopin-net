/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.controllerPageLayoutController.java
 * @Create By shiying
 * @Create In 2013-5-10 下午2:49:28
 * TODO
 */
package net.shopin.back.controller;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.back.entity.cond.PageLayoutCond;
import net.shopin.back.entity.cond.ShopChannelsCond;
import net.shopin.back.entity.po.PageLayout;
import net.shopin.back.entity.po.ShopChannels;
import net.shopin.back.entity.vo.PageLayoutVO;
import net.shopin.back.service.IPageLayoutService;
import net.shopin.back.service.IShopChannelsService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.constants.InfoConstants.CodeInfo;
import com.framework.AbstractController;
import com.framework.page.Paginator;
import com.framework.returnObj.Infos;
import com.framework.validation.EValidator;

/**
 * desc  :页面展示表 Controller
 * @Class Name PageLayoutController
 * @Author shiying
 * @Create In 2013-5-10
 */

@Controller  
@RequestMapping("/pageLayout")
public class PageLayoutController extends AbstractController{
	
	@Autowired 
	private IPageLayoutService pageLayoutService;
	
	@Autowired
	private IShopChannelsService shopChannelsService;
	
	@EValidator(value="sid,主键,validate-required validate-length-max-32;")
	@ResponseBody
	@RequestMapping(value = "/{sid}", method = RequestMethod.GET)  
	public String find(@PathVariable Long sid,Model mode,HttpServletRequest request, HttpServletResponse response)  {
		Infos infos = init(request, "sid="+sid);
		
		System.out.println("sid="+sid);
		try {
			if(doValidate(infos)){
				PageLayoutVO vo = pageLayoutService.findObjBySid(infos, sid);
				setReturnObj(infos, vo);
			}
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误,  e);
		}finally{
			return returnResultJson(infos);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = {"/query"},method = {RequestMethod.GET,RequestMethod.POST})
	public String query(@ModelAttribute("pageLayoutCond") PageLayoutCond cond , Model m ,HttpServletRequest request,HttpServletResponse response){
		Infos infos = init(request, cond);
		Paginator page = null;
		try {
			page = this.pageLayoutService.queryObjs(infos, cond);
			setReturnObj(infos, page);
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误, e);
		}finally{
			return  returnResultJson(infos);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/insert", method = RequestMethod.POST)  
	public String insert(@ModelAttribute("pageLayoutCond") PageLayoutCond cond,Model mode,HttpServletRequest request, HttpServletResponse response)  {
		Infos infos = init(request, cond);
		try {
			if(doValidate(infos)){
				pageLayoutService.insert(infos, cond);
				setReturnObj(infos, true);
			}
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误,  e);
		}finally{
			return returnResultJson(infos);
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/selectQueryBySid", method = RequestMethod.POST)  
	public String selectQueryBySid( String sid,Model mode,HttpServletRequest request, HttpServletResponse response)  {
		System.out.println("sid=======+++++++"+sid);
		Infos infos = init(request, "sid=" + sid);
		Paginator page = new Paginator();
		PageLayoutVO list =  this.pageLayoutService.selectQueryBySid(Long.valueOf(sid));
		System.out.println("list=======+++++++"+list);
		String json = JSONArray.fromObject(list).toString();
		//page.setList(list);
		setReturnObj(infos, page);
		System.out.println("json=======+++++++"+json);
		return returnResultJson(infos);
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertPageLayout", method = RequestMethod.POST)  
	public String insertPageLayout(String pageLayoutSid,String title,String titleLink,Model mode,HttpServletRequest request, HttpServletResponse response)  {
		PageLayoutCond cond = new PageLayoutCond();
		Infos infos = init(request, cond);
		try {
			if(doValidate(infos)){
				
				PageLayout pageLayout = new PageLayout();
				pageLayout.setPageLayoutSid(Integer.valueOf(pageLayoutSid));
				pageLayout.setTitle(title);
				pageLayout.setTitleLink(titleLink);
				cond.setPageLayout(pageLayout);
				pageLayoutService.insert(infos, cond);
				setReturnObj(infos, true);
			}
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误,  e);
		}finally{
			return returnResultJson(infos);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)  
	public String update(@ModelAttribute("pageLayoutCond") PageLayoutCond cond,Model mode,HttpServletRequest request, HttpServletResponse response)  {
		Infos infos = init(request, cond);
		try {
			if(doValidate(infos)){
				pageLayoutService.update(infos, cond);
				setReturnObj(infos, true);
			}
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误,  e);
		}finally{
			return returnResultJson(infos);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete/{sid}", method={RequestMethod.GET,RequestMethod.POST})  
	public String delete(@PathVariable Long sid,Model mode,HttpServletRequest request, HttpServletResponse response)  {
		Infos infos = init(request, "sid="+sid);
		System.out.println("sid="+sid);
		try {
			pageLayoutService.delete(infos, sid);
				setReturnObj(infos, true);
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误,  e);
		}finally{
			return returnResultJson(infos);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/queryPageLayout",method = {RequestMethod.GET,RequestMethod.POST})
	public String queryPageLayout(Model m,HttpServletRequest request,HttpServletResponse response){
		Infos infos  =  init(request, "");
		Paginator page = null;
		String channelSid = request.getParameter("channelSid");
		PageLayoutCond cond = new PageLayoutCond();
		cond.setChannelSid(Integer.valueOf(channelSid));
		try {
		    page =  this.pageLayoutService.queryPageLayoutByChannel(infos, cond);
			setReturnObj(infos, page);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			return returnResultJson(infos);
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "/saveSelectPageLayout",method = {RequestMethod.GET,RequestMethod.POST})
	public String saveSelectPageLayout(Model m,HttpServletRequest request,HttpServletResponse response,String channelSid,String pageType,String sid) throws SQLException{
		ShopChannelsCond cond = new ShopChannelsCond();
		Infos infos  =  init(request, "");
		
		ShopChannels sChannels = new ShopChannels();
		sChannels.setSid(Long.valueOf(channelSid));
		sChannels.setPageLayoutSid(Integer.valueOf(sid));
		cond.setShopChannels(sChannels);
		this.shopChannelsService.update(infos, cond);
		
		setReturnObj(infos, true);
		return returnResultJson(infos);
	}
	
	@ResponseBody
	@RequestMapping(value = {"/tree"},method = {RequestMethod.GET,RequestMethod.POST})
	public String pageLayoutTree(Model m,HttpServletRequest request,HttpServletResponse response,String node) throws SQLException{
		String pageLayoutSid = request.getParameter("pageLayoutSid");
		Assert.notNull(pageLayoutSid);
		//Assert.notNull(nodeSid);
		Infos infos  =  init(request, "");
		JSONObject obj =new JSONObject();
		List  list;
		PageLayoutVO vo2;
		if(node == null || "".equals(node) || node.indexOf("node") > 0){
			list =  this.pageLayoutService.queryChildPageLayout(Long.valueOf(pageLayoutSid));
			vo2 = this.pageLayoutService.findObjBySid(infos, Long.valueOf(pageLayoutSid));
		}else{
			list = this.pageLayoutService.queryChildPageLayout(Long.valueOf(node));
			vo2 = this.pageLayoutService.findObjBySid(infos, Long.valueOf(node));
		}
		
		if(vo2.getpageLayoutSid()!=null){
			   obj.put("parentLinktype", vo2.getproLinkType());
			}
	   
		JSONArray json = new JSONArray();
		//JSONObject obj = null;
		Integer isleaf=null;
		
		if(list != null && !list.isEmpty()){
			for(Iterator iter = list.iterator();iter.hasNext();){
				PageLayoutVO vo = (PageLayoutVO) iter.next();
			//	obj = new JSONObject();
				obj.put("id", vo.getSid());
				obj.put("text", vo.getTitle());
				obj.put("proLinktype", vo.getproLinkType());
				 
				PageLayoutCond cond =new PageLayoutCond();
				cond.setpageLayoutSid(vo.getSid());
				isleaf = pageLayoutService.QueryObjsCount(cond);
				
				if(isleaf==0){
					obj.put("leaf",true);
				}else{
					obj.put("leaf",false);
				}
				json.add(obj);
			}
			
		}
	//	System.out.println("vo2=========="+vo2.getproLinkType());
	//	System.out.println("json-----------"+json);
		return json.toString();
	}
	

}
