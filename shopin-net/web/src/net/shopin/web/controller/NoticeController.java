/**
 * @Probject Name: web
 * @Path: net.shopin.web.controller.NoticeController.java
 * @Create By kongm
 * @Create In 2013-10-10 下午5:34:56
 * TODO
 */
package net.shopin.web.controller;

import javax.servlet.http.HttpServletRequest;

import net.shopin.api.INoticeService;
import net.shopin.view.NoticeVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shopin.modules.utils.PageHelper;
import com.shopin.modules.web.view.PageVO;

/**
 * @Class Name NoticeController
 * @Author kongm
 * @Create In 2013-10-10
 */
@Controller
@Scope("prototype")
public class NoticeController {

	@Autowired
	private INoticeService  noticeService;

	/**
	 * 说明:
	 *      通知页面
	 * @Methods Name noticePage
	 * @Create In 2013-10-10 By kongm
	 * @param id
	 * @param m
	 * @return String
	 */
	@RequestMapping(value = "/notice/{id}", method = RequestMethod.GET)
	public String noticePage(@PathVariable("id") String id, Model m){
		m.addAttribute("notice",noticeService.getNoticeById(id));
		return "activity/notice";
	}
	/**
	 * 说明:
	 *     公告分页查询
	 * @Methods Name notices
	 * @Create In 2013-10-14 By kongm
	 * @param type
	 * @param m
	 * @param request
	 * @return String
	 */
	@RequestMapping(value = "/notices/{type}", method = RequestMethod.GET)
	public String notices(@PathVariable("type")String type,Model m,HttpServletRequest request){
		PageVO<NoticeVO> pageVo = new PageVO<NoticeVO>();
		pageVo.setPageSize(20);
		pageVo = this.noticeService.getNoticePage(pageVo, type);
		m.addAttribute("notices", pageVo.getList());
		PageHelper pageHelper = new PageHelper(request, "page.ftl", "/notices/" + type);
		m.addAttribute("page", pageHelper.getPageBreakStr(pageVo));
		m.addAttribute("type", type);
		return "activity/notices";
	}
	/**
	 * 说明:
	 *     网站公告分页查询
	 * @Methods Name noticePage
	 * @Create In 2013-10-14 By kongm
	 * @param type
	 * @param pageNo
	 * @param m
	 * @param request
	 * @return String
	 */
	@RequestMapping(value = "/notices/{type}/{page}", method = RequestMethod.GET)
	public String noticePage(@PathVariable("type") String type,@PathVariable("page") int pageNo, Model m,HttpServletRequest request){
		PageVO<NoticeVO> pageVo = new PageVO<NoticeVO>();
		pageVo.setPageSize(20);
		pageVo.setPageNo(pageNo);
		pageVo = this.noticeService.getNoticePage(pageVo, type);
		m.addAttribute("notices", pageVo.getList());
		PageHelper pageHelper = new PageHelper(request, "page.ftl", "/notices/" + type);
		m.addAttribute("page", pageHelper.getPageBreakStr(pageVo));
		m.addAttribute("type", type);
		return "activity/notices";
	}
}
