/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.controllerShopChannelsController.java
 * @Create By wangdg
 * @Create In 2013-5-9 下午7:48:42
 * TODO
 */
package net.shopin.back.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.back.entity.cond.ShopChannelsCond;
import net.shopin.back.entity.vo.ShopChannelsVO;
import net.shopin.back.service.IShopChannelsService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
 * @Class Name ShopChannelsController
 * @Author wangdg
 * @Create In 2013-5-9
 */
@Controller
@RequestMapping("/shopChannels")
public class ShopChannelsController extends AbstractController {

	@Autowired
	private IShopChannelsService shopChannelsService;

	/**
	 * 
	 * @Methods Name find
	 * @Create In 2013-5-10 By wangdg
	 * @param sid
	 * @param mode
	 * @param request
	 * @param response
	 * @return String
	 */
	@EValidator(value = "sid,主键,validate-required validate-length-max-32;")
	@ResponseBody
	@RequestMapping(value = "/{sid}", method = RequestMethod.GET)
	public String find(@PathVariable Long sid, Model mode,HttpServletRequest request, HttpServletResponse response) {

		Infos infos = init(request, "sid=" + sid);
		try {
			if (doValidate(infos)) {
				this.shopChannelsService.findObjBySid(infos, sid);
			}
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误, e);
		} finally {
			return returnResultJson(infos);
		}
	}

	/**
	 * 
	 * @Methods Name query
	 * @Create In 2013-5-10 By wangdg
	 * @param cond
	 * @param mode
	 * @param request
	 * @param response
	 * @return String
	 */

	@ResponseBody
	@RequestMapping(value = "/query", method = RequestMethod.POST)
	public String query(@ModelAttribute("shopChannelsCond") ShopChannelsCond cond,Model mode, HttpServletRequest request, HttpServletResponse response) {
		Infos infos = init(request, cond);
		// 验证
		Paginator page = null;
		try {
			page = (Paginator) shopChannelsService.queryObjs(infos, cond);
			setReturnObj(infos, page);
		} catch (Exception e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误, e);
		} finally {
			return returnResultJson(infos);
		}
	}

	/**
	 * 
	 * @Methods Name insert
	 * @Create In 2013-5-10 By wangdg
	 * @param cond
	 * @param mode
	 * @param request
	 * @param response
	 * @return String
	 */

	@ResponseBody
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(@ModelAttribute("shopChannelsCond") ShopChannelsCond cond,Model mode, HttpServletRequest request, HttpServletResponse response) {
		Infos infos = init(request, cond);
		try {
			if (doValidate(infos)) {
				shopChannelsService.insert(infos, cond);
				setReturnObj(infos, true);
			}
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误, e);
		} finally {
			return returnResultJson(infos);
		}
	}

	/**
	 * 
	 * @Methods Name update
	 * @Create In 2013-5-10 By wangdg
	 * @param cond
	 * @param mode
	 * @param request
	 * @param response
	 * @return String
	 */

	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(@ModelAttribute("shopChannelsCond") ShopChannelsCond cond,Model mode, HttpServletRequest request, HttpServletResponse response) {
		Infos infos = init(request, cond);
		try {
			if (doValidate(infos)) {
				shopChannelsService.update(infos, cond);
				setReturnObj(infos, true);
			}
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误, e);
		} finally {
			return returnResultJson(infos);
		}
	}

	/**
	 * 
	 * @Methods Name delete
	 * @Create In 2013-5-10 By wangdg
	 * @param sid
	 * @param mode
	 * @param request
	 * @param response
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = "/delete/{sid}", method = RequestMethod.POST)
	public String delete(@PathVariable Long sid, Model mode,HttpServletRequest request, HttpServletResponse response) {
		Infos infos = init(request, "sid=" + sid);
		try {
			shopChannelsService.delete(infos, sid);
			setReturnObj(infos, true);
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误, e);
		} finally {
			return returnResultJson(infos);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/channeltree", method = {RequestMethod.POST,RequestMethod.GET})
	public String querychanneltree(Model mode, HttpServletRequest request, HttpServletResponse response) {
		List<ShopChannelsVO> list = this.shopChannelsService.queryAllChannels();
		
		System.out.println("list==="+list.toString());
//		
//		String chaTree = "";
//		JSONArray jsons = new JSONArray();
//		
//		for(ShopChannelsVO scvo:list){
//			JSONObject json = new JSONObject();
//			
//			json.put("id", scvo.getSid());
//			json.put("text",scvo.getDisplayName());
//			json.put("leaf", true);
//			jsons.add(json);
//			System.out.println("json:"+json);
//		}
//		
//		chaTree = jsons.toString();
//		System.out.println("chaTree======"+chaTree);
//		
//		try {
//			response.setCharacterEncoding("UTF-8");
//			response.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = response.getWriter();
//			out.print(chaTree);
//			out.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		JSONArray json = new JSONArray();
		JSONObject object;
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				ShopChannelsVO shopCha = (ShopChannelsVO) list.get(i);
				object = new JSONObject();
				object.put("pageName", shopCha.getName());
				object.put("id", shopCha.getSid());
				object.put("text", shopCha.getDisplayName());
                object.put("leaf", true);
				json.add(object);
			}
		}
		return json.toString();
	}
	/**
	 * 用于搜索管理
	 * @Methods Name channellist
	 * @Create In 2013-8-30 By cheqb
	 * @param mode
	 * @param request
	 * @param response
	 * @return String
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/channellist", method = {RequestMethod.POST,RequestMethod.GET})
	public String channellist(Model mode, HttpServletRequest request, HttpServletResponse response) {
		List<ShopChannelsVO> vos = this.shopChannelsService.queryAllChannels();
		JSONObject res = new JSONObject();
		JSONObject data = new JSONObject();
		JSONArray list = new JSONArray();
		JSONObject object;
		if (vos != null && vos.size() > 0) {
			for (int i = 0; i < vos.size(); i++) {
				ShopChannelsVO shopCha = (ShopChannelsVO) vos.get(i);
				object = new JSONObject();
				object.put("sid", shopCha.getSid());
				object.put("cName", shopCha.getDisplayName());
				list.add(object);
			}
		}
		data.put("list", list);
		data.put("totalRecords", list.size());
		res.put("data", data);
		return res.toString();
	}
	

}
