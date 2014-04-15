/**
 * 
 */
package net.shopin.web.controller;

import javax.servlet.http.HttpServletRequest;

import net.shopin.api.IFavorService;
import net.shopin.api.IProductService;
import net.shopin.api.ISecurityService;
import net.shopin.view.AjaxMessageVO;
import net.shopin.view.SsdProductVO;
import net.shopin.web.util.SystemConstants;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;


/**
 * @author jiangzx
 * 
 */
@Controller
@Scope("prototype")
public class FavorController {
	@Autowired
	private ISecurityService securityService;
	@Autowired
	private IProductService productService;
	@Autowired
	private IFavorService favorService;

	/**
	 * 添加商品到收藏夹
	 * 
	 * @roseuid 4B515CFC01A5
	 */
	@RequestMapping(value = { "/favorite/add" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public ModelAndView addProduct(Model m,
			@CookieValue(value = "userTicket", required = false) String uid,
			HttpServletRequest req, String productSID) {
		if (!validateUid(uid)) {
			m.addAttribute("result",
					new AjaxMessageVO("2", SystemConstants.SSO_URL));
		}else{
		uid = securityService.getLoginUserId(uid).getMembersSid();
		SsdProductVO product = productService.getProduct(productSID);
		String proPic=req.getParameter("proPic");
		product.setProPictureUrl(proPic);
		favorService.addProduct(uid, product);
		m.addAttribute("result",
				new AjaxMessageVO("1", "成功添加商品:" + product.getProductName()
						+ "到收藏夹"));
		}
		return null;
	}

	private boolean validateRequired(String str) {
		if (str == null || "".equals(str)) {
			return false;
		}
		return true;
	}

	// 校验登录的id
	private boolean validateUid(String uid) {
		if (!validateRequired(uid) || !securityService.isUserLogin(uid)) {
			return false;
		}
		return true;
	}
}
