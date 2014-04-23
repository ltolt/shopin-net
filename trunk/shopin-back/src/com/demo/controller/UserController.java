package com.demo.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.constants.InfoConstants.CodeInfo;
import com.demo.entity.cond.UserCond;
import com.demo.entity.vo.UserVO;
import com.demo.service.IUserService;
import com.framework.AbstractController;
import com.framework.page.Paginator;
import com.framework.returnObj.Infos;
import com.framework.validation.EValidator;

/**
 * desc   : 用户表 Controller
 * author : luxiangxing
 * data   : 2013-04-12
 * email  : xiangxingchina@163.com
 **/
@Controller  
@RequestMapping("/user") 
public class UserController extends AbstractController{
		@Autowired 
		private IUserService userService;
	

		
		@EValidator(value="sid,主键,validate-required validate-length-max-32;")
		@ResponseBody
		@RequestMapping(value = "/{sid}", method = RequestMethod.GET)  
		public String find(@PathVariable Long sid,Model mode,HttpServletRequest request, HttpServletResponse response)  {
			Infos infos = init(request, "sid="+sid);
			try {
				if(doValidate(infos)){
					UserVO vo = userService.findObjBySid(infos, sid);
					setReturnObj(infos, vo);
				}
			} catch (SQLException e) {
				infos.printLogExceptionLog(CodeInfo.SQL连接错误,  e);
			}finally{
				return returnResultJson(infos);
			}
		}
		
		
		@ResponseBody
		@RequestMapping(value = "/query", method = RequestMethod.POST)  
		public String query(@ModelAttribute("userCond") UserCond cond,Model mode,HttpServletRequest request, HttpServletResponse response)  {
			Infos infos = init(request, cond);
			//验证
			Paginator page = null;
			try {
				page = (Paginator) userService.queryObjs(infos, cond);
				setReturnObj(infos, page);
			} catch (Exception e) {
				infos.printLogExceptionLog(CodeInfo.SQL连接错误,  e);
			}finally{
				return returnResultJson(infos);
			}
		}
		

		@ResponseBody
		@RequestMapping(value = "/insert", method = RequestMethod.POST)  
		public String insert(@ModelAttribute("userCond") UserCond cond,Model mode,HttpServletRequest request, HttpServletResponse response)  {
			Infos infos = init(request, cond);
			try {
				if(doValidate(infos)){
					userService.insert(infos, cond);
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
		public String update(@ModelAttribute("userCond") UserCond cond,Model mode,HttpServletRequest request, HttpServletResponse response)  {
			Infos infos = init(request, cond);
			try {
				if(doValidate(infos)){
					userService.update(infos, cond);
					setReturnObj(infos, true);
				}
			} catch (SQLException e) {
				infos.printLogExceptionLog(CodeInfo.SQL连接错误,  e);
			}finally{
				return returnResultJson(infos);
			}
		}
		
		@ResponseBody
		@RequestMapping(value = "/delete/{sid}", method = RequestMethod.POST)  
		public String delete(@PathVariable Long sid,Model mode,HttpServletRequest request, HttpServletResponse response)  {
			Infos infos = init(request, "sid="+sid);
			try {
					userService.delete(infos, sid);
					setReturnObj(infos, true);
			} catch (SQLException e) {
				infos.printLogExceptionLog(CodeInfo.SQL连接错误,  e);
			}finally{
				return returnResultJson(infos);
			}
		}
		
		
	 
	 
}
