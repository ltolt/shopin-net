/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.controllerFlashPageLayoutController.java
 * @Create By shiying
 * @Create In 2013-9-2 下午4:44:24
 * TODO
 */
package net.shopin.wms.controller;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
import net.shopin.wms.domain.entity.Channel;
import net.shopin.wms.domain.entity.PageLayoutMql;
import net.shopin.wms.service.IChannelService;
import net.shopin.wms.service.IPageLayoutMqlService;
import net.shopin.wms.util.PageLayoutMqlKey;
import net.shopin.wms.util.PageLayoutMqlUtil;
import net.shopin.wms.util.ResultUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.constants.InfoConstants.CodeInfo;
import com.framework.page.Paginator;
import com.framework.returnObj.Infos;

/**
 * @Class Name FlashPageLayoutController
 * @Author shiying
 * @Create In 2013-9-2
 */

@Controller
@RequestMapping("/flashPageLayout")
public class FlashPageLayoutController {

	@Autowired
	private IPageLayoutMqlService pageLayoutMqlService;

	@Autowired
	IChannelService channelService;

	@ResponseBody
	@RequestMapping(value = { "/tree" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String pageLayoutTree(Model m, HttpServletRequest request,
			HttpServletResponse response, String node) throws SQLException {
		String pageLayoutSid = request.getParameter("pageLayoutSid");
		Assert.notNull(pageLayoutSid);
		JSONObject obj = new JSONObject();
		List list;
		// PageLayoutMql vo2;
		if (node == null || "".equals(node) || node.indexOf("node") > 0) {
			list = this.pageLayoutMqlService.queryChildPageLayout(Long
					.valueOf(pageLayoutSid));
			// vo2 =
			// this.pageLayoutMqlService.selectByPrimaryKey(Integer.valueOf(pageLayoutSid));
		} else {
			list = this.pageLayoutMqlService.queryChildPageLayout(Long
					.valueOf(node));
			// vo2 =
			// this.pageLayoutMqlService.selectByPrimaryKey(Integer.valueOf(node));
		}

		// if(vo2.getPageLayoutSid()!=null){
		// obj.put("parentLinktype", vo2.getProLinkType());
		// }

		JSONArray json = new JSONArray();
		// JSONObject obj = null;
		Integer isleaf = null;

		if (list != null && !list.isEmpty()) {
			for (Iterator iter = list.iterator(); iter.hasNext();) {
				PageLayoutMql vo = (PageLayoutMql) iter.next();
				String startTime = "";
				String endTime = "";
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				if (vo.getStartTime() != null && !"".equals(vo.getStartTime())) {
					startTime = df.format(vo.getStartTime());
				}
				if (vo.getEndTime() != null && !"".equals(vo.getEndTime())) {
					endTime = df.format(vo.getEndTime());
				}
				obj.put("id", vo.getSid());
				obj.put("text", vo.getTitle());
				obj.put("proLinktype", vo.getProLinkType());
				obj.put("titleLink", vo.getTitleLink());
				obj.put("pageLayoutTemplateSid", vo.getPageLayoutTemplateSid());
				obj.put("startTime", startTime);
				obj.put("endTime", endTime);

				PageLayoutMql cond = new PageLayoutMql();
				cond.setPageLayoutSid(vo.getSid());
				isleaf = this.pageLayoutMqlService.queryObjsCount(cond);

				if (isleaf == 0) {
					obj.put("leaf", true);
				} else {
					obj.put("leaf", false);
				}
				json.add(obj);
			}

		}
		return json.toString();
	}

	@ResponseBody
	@RequestMapping(value = "/insertFlashPageLayout", method = RequestMethod.POST)
	public String insertPageLayout(PageLayoutMqlKey key, Model mode,
			HttpServletRequest request, HttpServletResponse response) {

		String json = "";
		try {

			PageLayoutMql pageLayout = PageLayoutMqlUtil
					.pageLayoutMqlResult(key);
			this.pageLayoutMqlService.insert(pageLayout);
			json = ResultUtil.createSuccessResult();

		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/updateFlashPageLayout", method = RequestMethod.POST)
	public String updateFlashPageLayout(PageLayoutMqlKey key, Model mode,
			HttpServletRequest request, HttpServletResponse response) {

		String json = "";
		try {

			PageLayoutMql pageLayout = PageLayoutMqlUtil
					.pageLayoutMqlResult(key);
			this.pageLayoutMqlService.updateByPrimaryKeySelective(pageLayout);

		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		} finally {
			json = ResultUtil.createSuccessResult();
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/delete/{sid}", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String delete(@PathVariable Integer sid, Model mode,
			HttpServletRequest request, HttpServletResponse response) {
		String json = "";
		try {
			this.pageLayoutMqlService.deleteByPrimaryKey(sid);
			json = ResultUtil.createSuccessResult();
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/selectQueryBySid", method = RequestMethod.POST)
	public String selectQueryBySid(String sid, Model mode,
			HttpServletRequest request, HttpServletResponse response) {
		String json = "";
		try {
			PageLayoutMql list = this.pageLayoutMqlService
					.selectByPrimaryKey(Integer.valueOf(sid));
			json = ResultUtil.createSuccessResult(list);
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;

	}

	@ResponseBody
	@RequestMapping(value = "/queryPageLayout", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String queryPageLayout(Model m, HttpServletRequest request,
			HttpServletResponse response) {

		String json = "";
		String channelSid = request.getParameter("channelSid");

		PageLayoutMql pageLayoutMql = new PageLayoutMql();
		pageLayoutMql.setChannelSid(Integer.valueOf(channelSid));
		try {
			List list = this.pageLayoutMqlService.queryByChannel(Integer
					.valueOf(channelSid));
			json = ResultUtil.createSuccessResult(list);
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}

		return json;
	}

	@ResponseBody
	@RequestMapping(value = "/saveSelectPageLayout", method = {
			RequestMethod.GET, RequestMethod.POST })
	public String saveSelectPageLayout(Model m, HttpServletRequest request,
			HttpServletResponse response, String channelSid, String pageType,
			String sid) throws SQLException {
		String json = "";
		try {
			Channel channel = new Channel();
			channel.setSid(Integer.valueOf(channelSid));
			channel.setPageLayoutSid(Integer.valueOf(sid));
			this.channelService.updateByPrimaryKeySelective(channel);
			json = ResultUtil.createSuccessResult();
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}

}
