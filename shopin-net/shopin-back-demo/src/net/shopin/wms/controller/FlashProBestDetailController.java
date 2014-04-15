/**
 * @Probject Name: shopin-back-demo
 * @Path: net.shopin.wms.controllerFlashProBestDetailController.java
 * @Create By shiying
 * @Create In 2013-9-3 上午10:47:39
 * TODO
 */
package net.shopin.wms.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.shopin.wms.domain.entity.ProBestDetailMql;
import net.shopin.wms.service.IProBestDetailMqlService;
import net.shopin.wms.util.HttpUtil;
import net.shopin.wms.util.ResultUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.constants.SystemConfig;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * @Class Name FlashProBestDetailController
 * @Author shiying
 * @Create In 2013-9-3
 */
@Controller
@RequestMapping("/flashProBestDetail")
public class FlashProBestDetailController {
	@Autowired
	private IProBestDetailMqlService proBestDetailMqlService;

	@ResponseBody
	@RequestMapping(value = { "/products" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String queryProducts(Model m, HttpServletRequest request,
			HttpServletResponse response, String pageLayoutSid) {
		String resultJson = "";
		List<Integer> proLists = new ArrayList();
		List<ProBestDetailMql> proList = this.proBestDetailMqlService
				.queryProList(Integer.valueOf(pageLayoutSid));

		StringBuffer param = new StringBuffer();
		Map resultMap = new HashMap();
		for (int i = 0; i < proList.size(); i++) {
			proLists.add(proList.get(i).getProductListSid());

		}
		for (Integer productListSid : proLists) {
			if (proList != null) {
				param.append(productListSid + ",");
			}
		}
		if (proList.size() > 0) {
			// 去除最后的逗号
			param = param.deleteCharAt(param.length() - 1);
			resultMap.put("param", param.toString());
			try {
				resultJson = HttpUtil.HttpPost(SystemConfig.SSD_SYSTEM_URL,
						"bw/getByProductSids.html", resultMap);
				JSONObject obj = JSONObject.fromObject(resultJson);
				if(obj!=null&&!obj.isEmpty()){
					JSONArray ary1 = obj.getJSONArray("result");
					JSONArray ary2 = obj.getJSONArray("not exists");

					JSONArray result = new JSONArray();
					for (int i = 0; i < ary1.size(); i++) {
						JSONObject t = ary1.getJSONObject(i);
						result.add(t);
					}
					for (int i = 0; i < ary2.size(); i++) {
						JSONObject t = ary2.getJSONObject(i);
						result.add(t);
					}

					obj.put("result", result);
					Gson gson = new GsonBuilder().create();
					resultJson = gson.toJson(obj);
				}else{
					return resultJson;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		return resultJson;
	}

	public static void main(String[] args) {
		Map resultMap = new HashMap();
		resultMap.put("param", "201");
		try {
			String resultJson = HttpUtil.HttpPost(SystemConfig.SSD_SYSTEM_URL,"bw/getByProductSids.html", resultMap);
			System.out.println(resultJson);
			JSONObject obj = JSONObject.fromObject(resultJson);
			JSONArray ary1 = obj.getJSONArray("result");
			JSONArray ary2 = obj.getJSONArray("not exists");
			
			JSONArray result = new JSONArray();
			for (int i = 0; i < ary1.size(); i++) {
				JSONObject t = ary1.getJSONObject(i);
				result.add(t);
			}
			for (int i = 0; i < ary2.size(); i++) {
				JSONObject t = ary2.getJSONObject(i);
				result.add(t);
			}

			obj.put("result", result);
			Gson gson = new GsonBuilder().create();
			resultJson = gson.toJson(obj);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/{sid}", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String find(@PathVariable String sid, Model m,
			HttpServletRequest request, HttpServletResponse response) {
		String json = "";
		Assert.notNull(this.proBestDetailMqlService);
		try {
			ProBestDetailMql vo = this.proBestDetailMqlService
					.selectByPrimaryKey(Integer.valueOf(sid));
			json = ResultUtil.createSuccessResult(vo);
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		} finally {
			return json;
		}
	}

	@ResponseBody
	@RequestMapping(value = { "/updateProducts" }, method = {
			RequestMethod.GET, RequestMethod.POST })
	public void updateProducts(String productsListSid, String orderNum,
			String pageLayoutSid, Model m, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {
		// System.out.println("productsListSid---------------"+productsListSid);
		// System.out.println("orderNum---------------"+orderNum);
		// System.out.println("pageLayoutSid--------------"+pageLayoutSid);
		ProBestDetailMql cond = new ProBestDetailMql();

		cond.setOrderNumber(Integer.valueOf(orderNum));
		cond.setPageLayoutSid(Integer.valueOf(pageLayoutSid));
		cond.setProductListSid(Integer.valueOf(productsListSid));
		ProBestDetailMql vo = proBestDetailMqlService.queryOrderNumber(cond);

		ProBestDetailMql pro = new ProBestDetailMql();
		pro.setSid(Integer.valueOf(vo.getSid()));
		pro.setPageLayoutSid(Integer.valueOf(pageLayoutSid));
		pro.setProductListSid(Integer.valueOf(productsListSid));
		pro.setOrderNumber(Integer.valueOf(orderNum) - 1);
		ProBestDetailMql cond2 = new ProBestDetailMql();
		this.proBestDetailMqlService.updateByPrimaryKeySelective(cond2);

	}

	@ResponseBody
	@RequestMapping(value = { "/deleteproducts" }, method = {
			RequestMethod.GET, RequestMethod.POST })
	public String deleteProduct(Model m, HttpServletRequest request,
			HttpServletResponse response, String productsListSid,
			String pageLayoutSid) {
		String json = "";
		ProBestDetailMql proBestDetailMql = new ProBestDetailMql();
		proBestDetailMql.setPageLayoutSid(Integer.valueOf(pageLayoutSid));
		proBestDetailMql.setProductListSid(Integer.valueOf(productsListSid));
		try {
			this.proBestDetailMqlService
					.deleteByProductListSid(proBestDetailMql);
			json = ResultUtil.createSuccessResult();
		} catch (Exception e) {
			json = ResultUtil.createFailureResult(e);
		}

		return json;

	}

	@ResponseBody
	@RequestMapping(value = { "/drag" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public void updatejson1(Model m, HttpServletRequest request,
			HttpServletResponse response) throws SQLException {

		String pageLayoutSid = request.getParameter("pageLayoutSid");
		// 拖拽前的productListSid
		String selectRowPid = request.getParameter("selectRowPid");
		// 拖拽后的productListSid
		String toRowPid = request.getParameter("toRowPid");

		// 获取拖拽前的顺序号
		ProBestDetailMql selectRow = new ProBestDetailMql();
		selectRow.setPageLayoutSid(Integer.valueOf(pageLayoutSid));
		selectRow.setProductListSid(Integer.valueOf(selectRowPid));
		ProBestDetailMql selectedVo = this.proBestDetailMqlService
				.queryOrderNumber(selectRow);
		Integer selectRowOrderNumber = selectedVo.getOrderNumber();
		// 获取拖拽后的顺序号
		ProBestDetailMql toRow = new ProBestDetailMql();
		toRow.setPageLayoutSid(Integer.valueOf(pageLayoutSid));
		toRow.setProductListSid(Integer.valueOf(toRowPid));
		ProBestDetailMql toVo = this.proBestDetailMqlService
				.queryOrderNumber(toRow);
		Integer toRowOrderNumber = toVo.getOrderNumber();
		// 交换顺序号
		selectRow.setSid(selectedVo.getSid());
		selectRow.setOrderNumber(toRowOrderNumber);
		toRow.setSid(toVo.getSid());
		toRow.setOrderNumber(selectRowOrderNumber);
		// 更新数据库
		this.proBestDetailMqlService.updateByPrimaryKeySelective(selectRow);
		this.proBestDetailMqlService.updateByPrimaryKeySelective(toRow);

	}

}
