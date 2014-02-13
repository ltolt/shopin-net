/**
 * @Probject Name: ESI
 * @Path: net.shopin.esi.controllerSiteController.java
 * @Create By kongm
 * @Create In 2014-2-12 上午10:59:26
 * TODO
 */
package net.shopin.esi.controller;


import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.api.IChannelService;
import net.shopin.api.INavigationService;
import net.shopin.esi.util.FreeMarkerUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * @Class Name SiteController
 * @Author kongm
 * @Create In 2014-2-12
 */
@Controller
public class SiteController {
	
	@Autowired
	private IChannelService channelService;
	
	@Autowired
	private INavigationService navigationService;
	
	@RequestMapping(value = "/doit",method = RequestMethod.GET)
	public void doit(HttpServletRequest request,HttpServletResponse response) throws IOException, FileNotFoundException, ServletException{
//		//html生成后存放的路径
//		String dirPath = request.getSession().getServletContext().getRealPath("/pages");
//		File path = new File(dirPath);
//		//生成的文件的名字
//		String indexFileName = "index.html";
//		
//		String[] indexfileList = path.list(new DirectoryFilter(indexFileName));
//		
//		if(true){
//			Writer out = new OutputStreamWriter(new FileOutputStream(dirPath + "/" + indexFileName),"UTF-8");
//			//生成html
//			ProcessClient.processBody(out);
//			request.getRequestDispatcher("/pages/index.html").forward(request, response);
//		}else{
//			request.getRequestDispatcher("/pages/" + indexfileList[0]).forward(request, response);
//		}
//		
	}
	
	
	@RequestMapping(value = "/index",method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request,HttpServletResponse response){
		ModelAndView mv = new ModelAndView();
		//html生成后存放的路径
		String dirPath = request.getSession().getServletContext().getRealPath("/WEB-INF/pages");
		List channels = channelService.findAllChannels();
		List navigations =  navigationService.getAllNavigations();
		Map root = new HashMap();
		root.put("channels", channels);
		try {
			Writer out = new OutputStreamWriter(new FileOutputStream(dirPath + "\\" + "header.html"),"UTF-8");
			FreeMarkerUtil.processTemplate("header.ftl", root, out);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("header");
//		mv.setViewName("hello");
//		mv.addObject("user","ESI");
//		String requestUri = new UrlPathHelper().getLookupPathForRequest(request);
//		mv.addObject("appurl", requestUri);
		mv.addObject("channels",channels);
		return mv;
	}

	

}
