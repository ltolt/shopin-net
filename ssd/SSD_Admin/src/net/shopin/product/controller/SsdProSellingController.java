package net.shopin.product.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.product.domin.entity.SsdProduct;
import net.shopin.service.ISsdProductService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.shopin.core.framework.base.vo.AjaxMessageVO;

@Controller
public class SsdProSellingController {

	@Autowired
	private ISsdProductService ssdProductService;

	@RequestMapping(value = "/proselling/init", method = RequestMethod.GET)
	public String init(Model m, HttpServletRequest request,
			HttpServletResponse response) {
		return "/product/proselling";
	}

	@ResponseBody
	@RequestMapping(value = "/proselling/list", method = { RequestMethod.POST,
			RequestMethod.GET })
	public String list(Model model, HttpServletRequest request,
			HttpServletResponse response, String productSku, String brandSid) {
		Map<String, Object> map = new LinkedHashMap<String, Object>();
		List<AjaxMessageVO> list = new ArrayList<AjaxMessageVO>();
		
		int total = 0;
		try {
			if (productSku == null || "".equals(productSku) || brandSid == null || "".equals(brandSid)) {
				map.put("rows", list);
				map.put("total", total);
			} else {
				SsdProduct sp = new SsdProduct();
					sp.setProductSku(productSku);
					sp.setBrandSid(Long.valueOf(brandSid));
				SsdProduct pro = this.ssdProductService.selectProduct(sp);
				if (pro != null) {
					SsdProduct 	sdp = this.ssdProductService.selectProNetbit(pro.getSid());
					if (sdp == null) {
						AjaxMessageVO result = new AjaxMessageVO();
						result.setStatus("failure");
						result.setMessage("商品不是网销状态");
						list.add(result);
						map.put("rows", list);
						total= total + 1;
						map.put("total", total);
					}
					sdp = this.ssdProductService.selectProSum(pro.getSid());
					if (sdp == null) {
						AjaxMessageVO result = new AjaxMessageVO();
						result.setStatus("failure");
						result.setMessage("商品无库存");
						list.add(result);
						map.put("rows", list);
						total= total + 1;
						map.put("total", total);
					}
					sdp = this.ssdProductService.selectProPrice(pro.getSid());
					if (sdp != null) {
						AjaxMessageVO result = new AjaxMessageVO();
						result.setStatus("failure");
						result.setMessage("商品原价为空");
						list.add(result);
						map.put("rows", list);
						total= total + 1;
						map.put("total", total);
					}
					sdp = this.ssdProductService.selectProPicture(pro.getSid());
					if (sdp == null) {
						AjaxMessageVO result = new AjaxMessageVO();
						result.setStatus("failure");
						result.setMessage("商品无图片");
						list.add(result);
						map.put("rows", list);
						total= total + 1;
						map.put("total", total);
					}
					sdp = this.ssdProductService.selectProCategory(pro.getSid());
					if (sdp == null) {
						AjaxMessageVO result = new AjaxMessageVO();
						result.setStatus("failure");
						result.setMessage("商品无品类");
						list.add(result);
						map.put("rows", list);
						total= total + 1;
						map.put("total", total);
					}
					sdp = this.ssdProductService.selectProDisplay(pro.getSid());
					if (sdp == null) {
						AjaxMessageVO result = new AjaxMessageVO();
						result.setStatus("failure");
						result.setMessage("商品无网站品牌");
						list.add(result);
						map.put("rows", list);
						total= total + 1;
						map.put("total", total);
					}
				} else {
					AjaxMessageVO result = new AjaxMessageVO();
					result.setStatus("failure");
					result.setMessage("无此商品");
					list.add(result);
					map.put("rows", list);
					total= total + 1;
					map.put("total", total);
				}
			}
		} catch (Exception e) {
			AjaxMessageVO result = new AjaxMessageVO();
			result.setStatus("failure");
			result.setMessage("查询失败");
			list.add(result);
			map.put("rows", list);
			map.put("total", total);
			e.printStackTrace();
		}
		Gson gson = new Gson();
		return gson.toJson(map);
	}
}
