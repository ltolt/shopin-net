/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.controllerLeaveMessageController.java
 * @Create By jingpeng
 * @Create In 2013-8-15 上午9:42:16
 * TODO
 */
package net.shopin.wms.controller;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.wms.domain.entity.LeaveMessage;
import net.shopin.wms.domain.view.LeaveMessageKey;
import net.shopin.wms.domain.view.LeaveMessageVO;
import net.shopin.wms.service.ILeaveMessageService;
import net.shopin.wms.util.LeaveMessageUtil;
import net.shopin.wms.util.PageModel;
import net.shopin.wms.util.ResultUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @Class Name LeaveMessageController
 * @Author jingpeng
 * @Create In 2013-8-15
 */
@Controller
@RequestMapping(value = "/leaveMessage")
public class LeaveMessageController {
	@Autowired
	ILeaveMessageService leaveMessageService;

	/**
	 * 说明： 留言是否显示到公共留言板
	 * 
	 * @Create In 2013-8-15 By jingpeng
	 * @param msgId
	 * @param commonVisible
	 *            是否显示到公共留言板1：显示，0：不显示
	 * @param request
	 * @param response
	 * @return String
	 */
	@ResponseBody
	@RequestMapping(value = "/updateCommonVisible", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String updateCommonVisible(String msgId, String commonVisible,
			HttpServletRequest request, HttpServletResponse response) {
		String json = "";
		String success = "false";
		String memo = "";
		try {
			LeaveMessage leaveMessage = this.leaveMessageService
					.selectByPrimaryKey(Integer.parseInt(msgId));
			if (leaveMessage != null) {
				if (!("1").equals(commonVisible)
						&& !("0").equals(commonVisible)) {
					memo = "commoVisible只能为0或1";
				} else {
					leaveMessage.setCommonvisible(Integer
							.parseInt(commonVisible));
					this.leaveMessageService.updateByPrimaryKey(leaveMessage);
					if (("1".equals(commonVisible))) {
						memo = "显示留言到公共留言板成功";
					} else {
						memo = "取消公共留言板显示成功";
					}
					success = "success";
				}
			} else {
				memo = "msgId为" + msgId + "的留言不存在";
			}
			json = ResultUtil.createCommonVisibleResult(success, memo);
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/selectByParams", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String selectLeaveMessageByParms(LeaveMessageKey key,
			HttpServletRequest request, HttpServletResponse response)
			throws ParseException {
		String json = "";
		try {
			LeaveMessageVO vo = LeaveMessageUtil.resultMessage(key);
			List list = this.leaveMessageService.selectByParms(vo);
			Integer total = this.leaveMessageService.selectPageCount(vo);
			PageModel page = new PageModel();
			page.setTotal(total);
			page.setStart(vo.getStart());
			page.setPageNo(vo.getPageNo());
			page.setResult(list);
			json = ResultUtil.createSuccessResultPage(page);
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}
}
