/**
 * 说明: 
 *     网站常用信息Controller
 * @Probject Name: web
 * @Path: net.shopin.web.controller.CommonInfoController.java
 * @Create By kongm
 * @Create In 2013-8-12 下午4:14:53
 * TODO
 */
package net.shopin.web.controller;

import java.util.List;

import net.shopin.api.ICartService;
import net.shopin.api.ISecurityService;
import net.shopin.view.CartItem;
import net.shopin.view.OrderVO;
import net.shopin.web.util.OrderUtil;
import net.shopin.web.util.ValidateUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Class Name CommonInfoController
 * @Author kongm
 * @Create In 2013-8-12
 */
@Controller
@Scope("prototype")
public class CommonInfoController {

	@Autowired
	private ICartService cartService;
	@Autowired
	private ISecurityService securityService;

	/**
	 * 
	 * @Methods Name showHeadInfo
	 * @Create In 2013-8-14 By jiangzhenxue
	 * @param m
	 * @param cartId
	 *            购物车ID
	 * @param uid
	 * @return 成功 {"isLogin":"1","username":"张三","orderqty":"0","proqty":"0"}
	 */
	@RequestMapping(value = { "/headerinfo" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.GET,
			org.springframework.web.bind.annotation.RequestMethod.POST })
	public String showHeadInfo(Model m,
			@CookieValue(value = "shopin_sid", required = false) String cartId,
			@CookieValue(value = "userTicket", required = false) String uid) {

		String isLogin = "0";
		String username = "";
		int proqty = 0;
		long orderqty = 0L;
		if (ValidateUtil.validateCartId(cartId)) {
			// 得到购物车中的数量
			proqty = this.cartService.getCartItemQty(cartId,uid);
		}
		if (validateUid(uid)) {
			// 如果是登陆状态 isLogin为1 否则为0
			isLogin = "1";
			username = this.securityService.getLoginUserId(uid).getMemName();
			String memSid = this.securityService.getLoginUserId(uid)
					.getMembersSid();
//			OrderVO ordervo = new OrderVO();
//			ordervo.setMembersSid(memSid);
//			// modify by guanshiqiang for orderService项目迁移 at 2013-04-25 begin
			// orderqty = this.orderService.getOrderCount(memSid);
//			orderqty = OrderUtil.getOrderCount(memSid);
			// modify by guanshiqiang for orderService项目迁移 at 2013-04-25 end
		}
		m.addAttribute("isLogin", "" + isLogin);
		m.addAttribute("username", "" + username);
		m.addAttribute("proqty", "" + proqty);
//		m.addAttribute("orderqty", "" + orderqty);
		return null;
	}
	
	
	
	
	
	
	
	
	
	
	

	private boolean validateUid(String uid) {
		return (validateRequired(uid))
				&& (this.securityService.isUserLogin(uid));
	}

	private boolean validateRequired(String str) {
		return (str != null) && (!"".equals(str));
	}

}
