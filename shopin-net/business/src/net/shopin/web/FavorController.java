/**
 * 
 */
package net.shopin.web;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;
import net.shopin.api.IFavorService;
import net.shopin.api.IProductService;
import net.shopin.api.ISecurityService;
import net.shopin.view.AjaxMessageVO;
import net.shopin.view.FavoriteProductVO;
import net.shopin.view.SsdProductVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shopin.modules.web.view.PageVO;

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
	private IFavorService favorService;

	/**
	 * 根据会员id获取用户收藏商品
	 * @param request
	 * @return
	 */
	@RequestMapping(value = { "/favorite/getfavoriteProducts" }, method = { RequestMethod.GET,
			RequestMethod.POST })
	public String getFavoriteProducts(HttpServletRequest request){
		String pageNo = request.getParameter("pageNo");
		String memberSid = request.getParameter("memberSid");
		PageVO<FavoriteProductVO> fPageVO = favorService.getFavoriteProducts(
				Integer.valueOf(pageNo), memberSid);
		JSONObject jsonObject = JSONObject.fromObject(fPageVO);	
		String str=jsonObject.toString();
		return str;
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
