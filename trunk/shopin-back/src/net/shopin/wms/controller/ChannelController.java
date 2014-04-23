/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.controller.ChannelController.java
 * @Create By wangdg
 * @Create In 2013-7-12 下午12:26:15
 * TODO
 */
package net.shopin.wms.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.wms.domain.entity.Channel;
import net.shopin.wms.service.IChannelService;
import net.shopin.wms.util.ResultUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.constants.InfoConstants.CodeInfo;
import com.framework.returnObj.Infos;
import com.framework.validation.EValidator;

/**
 * @Class Name ChannelController
 * @Author wangdg
 * @Create In 2013-7-12
 */
@Controller
@RequestMapping(value = "/channel")
public class ChannelController {

	@Autowired
	IChannelService channelService;
	
	@ResponseBody
	@RequestMapping(value = "/selectAllChannels", method = {RequestMethod.GET, RequestMethod.POST})
	public String selectAllChannels(HttpServletRequest request, HttpServletResponse response){
		String json = "";
		try {
			List list = this.channelService.selectAllChannles();
			json = ResultUtil.createSuccessResult(list);
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}
	
	@ResponseBody
	@RequestMapping(value = "/channeltree", method = {RequestMethod.POST,RequestMethod.GET})
	public String querychanneltree(Model mode, HttpServletRequest request, HttpServletResponse response) {
		
		List list = this.channelService.selectAllChannles();
		
		JSONArray json = new JSONArray();
		JSONObject object;
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				Channel channel = (Channel) list.get(i);
				object = new JSONObject();
				object.put("pageName", channel.getName());
				object.put("id", channel.getSid());
				object.put("text", channel.getDisplayName());
                object.put("leaf", true);
				json.add(object);
			}
		}
		return json.toString();
	}
	
	@EValidator(value = "sid,主键,validate-required validate-length-max-32;")
	@ResponseBody
	@RequestMapping(value = "/{sid}", method = RequestMethod.GET)
	public String find(@PathVariable Integer sid, Model mode,HttpServletRequest request, HttpServletResponse response) {
		String json = "";
		try {
				this.channelService.selectByPrimaryKey(sid);
				json = ResultUtil.createSuccessResult();
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json; 
	}
}
