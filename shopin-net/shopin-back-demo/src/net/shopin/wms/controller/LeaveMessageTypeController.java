/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.controller.LeaveMessageTypeController.java
 * @Create By wangdg
 * @Create In 2013-8-14 下午6:54:18
 * TODO
 */
package net.shopin.wms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.wms.domain.entity.LeaveMessageType;
import net.shopin.wms.service.ILeaveMessageTypeService;
import net.shopin.wms.util.ResultUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Class Name LeaveMessageTypeController
 * @Author wangdg
 * @Create In 2013-8-14
 */
@Controller
@RequestMapping(value = "/leaveMessageType")
public class LeaveMessageTypeController {

	@Autowired
	ILeaveMessageTypeService leaveMessageTypeService;

	@ResponseBody
	@RequestMapping(value = "/selectByPid", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String selectByPid(String pid, HttpServletRequest request,
			HttpServletResponse response) {

		String json = "";
		List list = null;
		try {
			if (pid != null && !"".equals(pid)) {
				list = this.leaveMessageTypeService.selectByPid(Integer
						.valueOf(pid));
			} else {
				LeaveMessageType leaveMessageType = new LeaveMessageType();
				list = this.leaveMessageTypeService
						.selectList(leaveMessageType);
			}
			json = ResultUtil.createSuccessResultJson(list);
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}

}
