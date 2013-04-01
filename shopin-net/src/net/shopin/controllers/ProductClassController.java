package net.shopin.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.service.IProductClassService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


/**
 * 网站商品品类管理
 * @author k
 *
 */
@Controller
public class ProductClassController {

	@Autowired
	private IProductClassService productClassService;
	
	
	@RequestMapping(value = {"/catemanage"},method = {RequestMethod.GET,RequestMethod.POST})
	public String welcome(Model m ,HttpServletRequest request,HttpServletResponse response){
		
		return "/manage/catemanage";
	}
	
	@ResponseBody
	@RequestMapping(value = {"/catetreeload"},method = {RequestMethod.GET,RequestMethod.POST})
	public void cateTreeJson(Model m,HttpServletRequest request,HttpServletResponse response,String node ){
		Assert.notNull(request.getParameter("node"));
		Assert.notNull(this.productClassService,"productClassService can not be null");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/json;charset=UTF-8");
		PrintWriter out = null;
		try {
			
			 String json = this.productClassService.getChildProductClassJson(Integer.valueOf(node==null?"1":node));
			 out = response.getWriter();
			 out.write(json);
//			 out.write("[{text:'男装',id:'22',leaf:'false'},{text:'女装',id:'23',leaf:true}]");
			 out.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		return  "[{text:'男装',id:'22',leaf:'false'}]";
	}
	
	
	
	
	

	
	
	
}


