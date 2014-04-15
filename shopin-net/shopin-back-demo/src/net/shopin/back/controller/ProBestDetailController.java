/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.back.controllerProBestDetailController.java
 * @Create By shiying
 * @Create In 2013-5-13 下午3:45:52
 * TODO
 */
package net.shopin.back.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.shopin.back.entity.cond.ProBestDetailCond;
import net.shopin.back.entity.po.ProBestDetail;
import net.shopin.back.entity.vo.ProBestDetailVO;
import net.shopin.back.mapper.ProBestDetailMapper;
import net.shopin.back.service.IProBestDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.constants.InfoConstants.CodeInfo;
import com.framework.AbstractController;
import com.framework.page.Paginator;
import com.framework.returnObj.Infos;

/**
 * @Class Name ProBestDetailController
 * @Author shiying
 * @Create In 2013-5-13
 */
@Controller
@RequestMapping(value = "/proBestDetail")
public class ProBestDetailController extends AbstractController{
	
	@Autowired
	private IProBestDetailService proBestDetailService;
	
	ProBestDetailMapper proBestDetailMapper;
	
	@ResponseBody
	@RequestMapping(value = {"/products"},method = {RequestMethod.GET,RequestMethod.POST})
	public String queryProducts(Model m , HttpServletRequest request,HttpServletResponse response,String pageLayoutSid){
		Infos infos = init(request, "sid=" + pageLayoutSid);
		Paginator page = new Paginator();
		List proResultList =  this.proBestDetailService.queryProductsByPsid(Long.valueOf(pageLayoutSid));
		String json = JSONArray.fromObject(proResultList).toString();
		page.setList(proResultList);
		setReturnObj(infos, page);
		System.out.println("json======="+json);
		return returnResultJson(infos);
	}
	
	@ResponseBody
	@RequestMapping(value = {"/deleteproducts"},method = {RequestMethod.GET,RequestMethod.POST})
	public String deleteProduct(Model m , HttpServletRequest request,HttpServletResponse response,String productsListSid,String pageLayoutSid){
	
		Infos infos = init(request, "sid=" + productsListSid);
		System.out.println("productsListSid==="+productsListSid);
		System.out.println("pageLayoutSid====="+pageLayoutSid);
		ProBestDetail proBestDetail = new ProBestDetail();
		proBestDetail.setPageLayoutSid(Integer.valueOf(pageLayoutSid));
		proBestDetail.setProductListSid(Integer.valueOf(productsListSid));
		try {
			this.proBestDetailService.deleteByProductListSid(proBestDetail);
			setReturnObj(infos, true);
		}finally{
			return returnResultJson(infos);
		}
		
		
			
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "/{sid}",method = {RequestMethod.GET,RequestMethod.POST})
	public String find(@PathVariable Long sid,Model m,HttpServletRequest request,HttpServletResponse response){
		Infos infos = init(request, "sid=" + sid);
		Assert.notNull(this.proBestDetailService);
		try {
			ProBestDetailVO vo =  this.proBestDetailService.findObjBySid(infos, sid);
			setReturnObj(infos, vo);
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误, e);
		}finally{
			return returnResultJson(infos);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = {"/query"},method = {RequestMethod.GET,RequestMethod.POST})
	public String query(@ModelAttribute("proBestDetailCond") ProBestDetailCond cond , Model m ,HttpServletRequest request,HttpServletResponse response){
		Infos infos = init(request, cond);
		Paginator page = null;
		try {
			page = this.proBestDetailService.queryObjs(infos, cond);
			setReturnObj(infos, page);
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误, e);
		}finally{
			return  returnResultJson(infos);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = {"/insert"},method = {RequestMethod.GET,RequestMethod.POST})
	public String insert(@ModelAttribute("proBestDetailCond")ProBestDetailCond cond , Model m ,HttpServletRequest request,HttpServletResponse response){
		Infos infos = init(request, cond);
		try {
			this.proBestDetailService.insert(infos, cond);
			setReturnObj(infos, true);
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误, e);
		}finally{
			return returnResultJson(infos);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = {"/updateProducts"},method = {RequestMethod.GET,RequestMethod.POST})
	public void updateProducts(String productsListSid,String orderNum,String pageLayoutSid, Model m ,HttpServletRequest request,HttpServletResponse response) throws SQLException{
	//	System.out.println("productsListSid---------------"+productsListSid);
	//	System.out.println("orderNum---------------"+orderNum);
	//	System.out.println("pageLayoutSid--------------"+pageLayoutSid);
		ProBestDetailCond cond = new ProBestDetailCond();
		Infos infos = init(request, cond);
		
		cond.setOrderNumber(Integer.valueOf(orderNum));
		cond.setPageLayoutSid(Integer.valueOf(pageLayoutSid));
		cond.setProductListSid(Integer.valueOf(productsListSid));
		ProBestDetailVO vo =proBestDetailService.queryOrderNumber(cond);
		
		ProBestDetail pro = new ProBestDetail();
		pro.setSid(Long.valueOf(vo.getSid()));
		pro.setPageLayoutSid(Integer.valueOf(pageLayoutSid));
		pro.setProductListSid(Integer.valueOf(productsListSid));
		pro.setOrderNumber(Integer.valueOf(orderNum)-1);
		ProBestDetailCond cond2 = new ProBestDetailCond();
		cond2.setProBestDetail(pro);
		this.proBestDetailService.update(infos, cond2);
		
	}
	
	@ResponseBody
	@RequestMapping(value = {"/update"},method = {RequestMethod.GET,RequestMethod.POST})
	public String update(@ModelAttribute("pcsCond")ProBestDetailCond cond , Model m ,HttpServletRequest request,HttpServletResponse response){
		Infos infos = init(request, cond);
		try {
			this.proBestDetailService.update(infos, cond);
			setReturnObj(infos, true);
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误, e);
		}finally{
			return returnResultJson(infos);
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value = { "/drag" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public void updatejson(Model m, HttpServletRequest request,	HttpServletResponse response) throws SQLException {
		String toRow = request.getParameter("toRow");
		String selectedRows = request.getParameter("selectedRows");
		String pageLayoutSid = request.getParameter("pageLayoutSid");
		String selectRowOrderNumber = request.getParameter("selectRowOrderNumber");
//	               拖拽前的productListSid	
		String selectRowPid = request.getParameter("selectRowPid");
//		拖拽后的productListSid
		String toRowPid = request.getParameter("toRowPid");
		String toRowOrderNumber = request.getParameter("toRowOrderNumber");
		
		ProBestDetailCond cond = new ProBestDetailCond();
		Infos infos = init(request, cond);
		cond.setPageLayoutSid(Integer.valueOf(pageLayoutSid));
		cond.setProductListSid(Integer.valueOf(selectRowPid));
		cond.setOrderNumber(Integer.valueOf(selectRowOrderNumber));
		ProBestDetailVO selectedVo = this.proBestDetailService.queryOrderNumber(cond);
//		拖拽前的Sid
		Integer preDragSid = selectedVo.getSid();
//		Integer preDragOrderNumber = selectedVo.getOrderNumber();
		
		ProBestDetailCond cond2 = new ProBestDetailCond();
		Infos infos2 = init(request, cond2);
		cond2.setPageLayoutSid(Integer.valueOf(pageLayoutSid));
		cond2.setProductListSid(Integer.valueOf(toRowPid));
		cond2.setOrderNumber(Integer.valueOf(toRowOrderNumber));
		ProBestDetailVO toVo = this.proBestDetailService.queryOrderNumber(cond2);

//		拖拽后的Sid
		Integer dragSid = toVo.getSid();
//		Integer dragOrderNumber = toVo.getOrderNumber();
//		拖拽前的数据更新			
		ProBestDetailCond cond1 = new ProBestDetailCond();
		ProBestDetail pro1 = new ProBestDetail();
		pro1.setSid(Long.valueOf(preDragSid));
		pro1.setPageLayoutSid(Integer.valueOf(pageLayoutSid));
		pro1.setProductListSid(Integer.valueOf(selectRowPid));
		pro1.setOrderNumber(Integer.valueOf(toRowOrderNumber));
		cond1.setProBestDetail(pro1);
		
//		拖拽后的数据更新		
		ProBestDetailCond cond22 = new ProBestDetailCond();
		ProBestDetail pro2 = new ProBestDetail();
		pro2.setSid(Long.valueOf(dragSid));
		pro2.setPageLayoutSid(Integer.valueOf(pageLayoutSid));
		pro2.setProductListSid(Integer.valueOf(toRowPid));
		pro2.setOrderNumber(Integer.valueOf(selectRowOrderNumber));
		cond22.setProBestDetail(pro2);
		
		this.proBestDetailService.update(infos, cond1);
		this.proBestDetailService.update(infos2, cond22);
		
		
	}
	
	
	@ResponseBody
	@RequestMapping(value = {"/delete/{sid}"},method = {RequestMethod.GET,RequestMethod.POST})
	public String delete(@PathVariable("sid")Long sid, Model m ,HttpServletRequest request,HttpServletResponse response){
		Infos infos = init(request, "sid=" + sid);
		try {
			this.proBestDetailService.delete(infos, sid);
			setReturnObj(infos, true);
		} catch (SQLException e) {
			infos.printLogExceptionLog(CodeInfo.SQL连接错误, e);
		}finally{
			return returnResultJson(infos);
		}
	}

}
