/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.controllerFlashPageLayoutController.java
 * @Create By shiying
 * @Create In 2013-9-2 下午4:44:24
 * TODO
 */
package net.shopin.wms.controller;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.back.entity.cond.PageLayoutCond;
import net.shopin.back.entity.po.PageLayout;
import net.shopin.back.entity.vo.PageLayoutVO;
import net.shopin.back.service.IPageLayoutService;
import net.shopin.wms.domain.entity.PageLayoutMql;
import net.shopin.wms.service.IPageLayoutMqlService;
import net.shopin.wms.service.IPageLayoutTemplateMqlService;
import net.shopin.wms.util.ResultUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.constants.InfoConstants.CodeInfo;
import com.framework.returnObj.Infos;

/**
 * @Class Name FlashPageLayoutController
 * @Author shiying
 * @Create In 2013-9-2
 */

@Controller  
@RequestMapping("/flashPageLayoutTemplate")
public class FlashPageLayoutTemplateController {
	
	@Autowired 
	private IPageLayoutTemplateMqlService pageLayoutTemplateMqlService;
	
	
	
	@ResponseBody
	@RequestMapping(value = "/queryAllTemplates", method = RequestMethod.POST)  
	public String queryAllTemplates(Model mode,HttpServletRequest request, HttpServletResponse response)  {
		
		String json="";
		try {
			
				
			List list = this.pageLayoutTemplateMqlService.queryAllTemplates();
			json = ResultUtil.createSuccessResult(list);
				
			
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}
		return json;
	}

}
