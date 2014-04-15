/**
 * 说明:
 *     三版网站登录注册功能控制器
 * @Probject Name: web
 * @Path: net.shopin.web.controller.LoginController.java
 * @Create By kongm
 * @Create In 2013-8-12 上午10:22:54
 * TODO
 */
package net.shopin.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import net.shopin.api.ICartService;
import net.shopin.api.ISecurityService;
import net.shopin.view.Cart;
import net.shopin.view.CartItem;
import net.shopin.view.MemberVO;
import net.shopin.web.util.HttpClientUtilSSO;
import net.shopin.web.util.JsonUtilSSO;
import net.shopin.web.util.LoadProperties;
import net.shopin.web.util.MD5Utils;
import net.shopin.web.util.SystemConstants;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @Class Name LoginController
 * @Author kongm
 * @Create In 2013-8-12
 */
@Controller
@Scope("prototype")
public class LoginController {
	@Autowired
	ISecurityService securityService;
	@Autowired
	private ICartService cartService;

	/**
	 * 说明: 登录跳转链接
	 * 
	 * @Methods Name getLogin
	 * @Create In 2013-8-12 By huyy
	 * @param m
	 * @param request
	 * @return String
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLogin(Model m, HttpServletRequest request) {
		String forward = request.getParameter("forward");
		String return_url = SystemConstants.SSO_LOGIN_RETURN_URL;
		String login_url = SystemConstants.SSO_LOGIN_URL;
		String domain_name = SystemConstants.DOMAIN_NAME;

		if ((forward == null) || ("".equals(forward))) {
			forward = "index.html";
			return_url = return_url + "index.html";
		} else {
			forward = forward.replace("/", "-");
			return_url = return_url + forward;
		}
		String sign = HttpClientUtilSSO.getSign(return_url);
		return "redirect:" + login_url + "?domainName=" + domain_name
				+ "&return_url=" + return_url + "&sign=" + sign;

	}

	/**
	 * 说明： 单点回调登录接口
	 * 
	 * @Methods Name loginSSO
	 * @Create In 2013-8-14 By huyy
	 * @param forward
	 * @param m
	 * @param request
	 * @param response
	 * @return String
	 */
	@RequestMapping(value = "/ddLogReturn/{forward}", method = RequestMethod.GET)
	public String loginSSO(@PathVariable("forward") String forward, Model m,
			HttpServletRequest request, HttpServletResponse response) {

		String registFrom = request.getParameter("registFrom");
		String flag=request.getParameter("flag");
		MemberVO memberVO = null;
        String domain=request.getParameter("domainName");
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("ticket", request.getParameter("clientTicket"));
		String browser = MD5Utils.getMD5String(request.getHeader("user-agent"));
		paramMap.put("browser", browser.substring(0, 5));

		String result = HttpClientUtilSSO.SSOUrlContent(
				SystemConstants.SSO_GETMEMBER_BYTICKET_URL, paramMap);

		// JSONObject regJson = JSONObject.fromObject(result);
		// String resultRes = regJson.getString("result");
		memberVO = JsonUtilSSO.json2Member(result);

		if (memberVO != null) {
			memberVO.setMembersSid(memberVO.getSid());
			String uid = UUID.randomUUID().toString();
			securityService.addLoginUser(uid, memberVO);
			Cookie cookie = new Cookie("userTicket", uid);
			cookie.setPath("/");
			cookie.setDomain("shopin.net");
			response.addCookie(cookie);

			// 快速购买开始
			if (registFrom != null && "shopin-sso-fast".equals(registFrom)) {
				return handleQuickBuy(request);
			}
			// 快速登陆结束

			// 联盟登陆开始
			// 支付宝登陆回调
			if (registFrom != null & "shopin-sso-alipay".equals(registFrom)) {
				handleAli(request, response);
				String aliforward = request.getParameter("alipay_target_url");
				if (aliforward != null && !"".equals(aliforward.trim())) {
					return "redirect:" + aliforward;
				}

			}
			// QQ登陆回调
			if (registFrom != null & "shopin-sso-qq".equals(registFrom)) {
				handleQQ(request, response);
			}
			// 139登陆回调
			if (registFrom != null & "shopin-sso-139".equals(registFrom)) {
				try {
					handle139(request, response, memberVO.getMemName());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			// 联盟登陆结束

		}
		if (flag != null && !flag.equals("") && flag.equals("1")) {
			return "redirect:" + SystemConstants.SSO_MYSHOPIN_URL;
		} else {
			if (forward.equals("index")) {
				return "redirect:" + "/index.html";
			} else {
				forward = forward.replace("-", "/") + ".html";
				return "redirect:" + forward;
			}
		}
	}

	/**
	 * 快速购买
	 * 
	 * @Methods Name handleQuickBuy
	 * @Create In 2013-8-13 By huyy
	 * @param request
	 * @return String
	 */
	public String handleQuickBuy(HttpServletRequest request) {
		String shopinId = getShopinId(request, "shopin_sid");
		// this.cartService.saveQuickBuy(shopinId);
		Cart cart = this.cartService.getCart(shopinId);
		if (!validateProduct(cart.getItemList())) {
			return "redirect:" + "/index.html";
		} else {
			return "redirect:" + "/order/confirm.html";
		}
	}

	/**
	 * 说明： 获取COOKIE中的值
	 * 
	 * @Methods Name getShopinId
	 * @Create In 2013-8-14 By huyy
	 * @param request
	 * @param name
	 * @return String
	 */
	public String getShopinId(HttpServletRequest request, String name) {
		String key = "";
		Cookie[] cookies = request.getCookies();
		for (int i = 0; i < cookies.length; i++) {
			String cookieKey = cookies[i].getName();
			if (cookieKey.equals(name)) {
				key = cookies[i].getValue();
				break;
			}
		}
		return key;
	}

	private boolean validateProduct(List<CartItem> list) {
		return !list.isEmpty();
	}

	/**
	 * 说明 支付宝回调方法的参数存入COOKIE
	 * 
	 * @Methods Name handleAli
	 * @Create In 2013-8-13 By huyy
	 * @param request
	 * @param response
	 *            void
	 */
	public void handleAli(HttpServletRequest request,
			HttpServletResponse response) {
		String DOMAIN = LoadProperties.readValue("DOMAIN");
		String token = request.getParameter("token");

		Cookie cookie1 = new Cookie("aliToken", token);
		cookie1.setPath("/");
		cookie1.setDomain(DOMAIN);
		response.addCookie(cookie1);

		Cookie cookie2 = new Cookie("alipayLog", "alipay");
		cookie2.setPath("/");
		cookie2.setDomain(DOMAIN);
		// cookie2.setMaxAge(600);
		response.addCookie(cookie2);

	}

	/**
	 * 说明 QQ回调方法的参数存入COOKIE
	 * 
	 * @Methods Name handleQQ
	 * @Create In 2013-8-13 By huyy
	 * @param request
	 * @param response
	 *            void
	 */
	public void handleQQ(HttpServletRequest request,
			HttpServletResponse response) {
		String DOMAIN = LoadProperties.readValue("DOMAIN");
		String openid = request.getParameter("openid");

		Cookie cookie1 = new Cookie("openid", openid);
		cookie1.setPath("/");
		cookie1.setDomain(DOMAIN);
		response.addCookie(cookie1);

		Cookie cookie2 = new Cookie("qqlog", openid);
		cookie2.setPath("/");
		cookie2.setDomain(DOMAIN);
		// cookie2.setMaxAge(600);
		response.addCookie(cookie2);
	}

	/**
	 * 说明 139回调方法的参数存入COOKIE
	 * 
	 * @Methods Name handle139
	 * @Create In 2013-8-13 By huyy
	 * @param request
	 * @param response
	 * @param memName
	 *            void
	 */
	public void handle139(HttpServletRequest request,
			HttpServletResponse response, String memName) {
		String DOMAIN = LoadProperties.readValue("DOMAIN");

		Cookie cookie1 = new Cookie("loginsource", "139login");
		cookie1.setPath("/");
		cookie1.setDomain(DOMAIN);
		response.addCookie(cookie1);

		Cookie cookie2 = new Cookie("username", memName);
		cookie2.setPath("/");
		cookie2.setDomain(DOMAIN);
		// cookie2.setMaxAge(600);
		response.addCookie(cookie2);
	}

	/**
	 * 说明： 跳转到注册页
	 * 
	 * @Methods Name goRegister
	 * @Create In 2013-8-12 By jiangzx
	 * @param m
	 * @param request
	 * @return String
	 */
	@RequestMapping({ "/goRegister" })
	public String goRegister(Model m, HttpServletRequest request) {
		String forward = request.getParameter("forward");
		String regist_from = request.getParameter("regist_from");
		String return_url = SystemConstants.SSO_LOGIN_RETURN_URL;
		if ((forward == null) || ("".equals(forward))) {
			return_url = return_url + "index.html";
		} else {
			forward = forward.replace("/", "-");
			return_url = return_url + forward;
		}

		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("domainName", SystemConstants.DOMAIN_NAME);
		paramMap.put("return_url", return_url);

		if (regist_from != null && !"".equals(regist_from.trim())) {
			paramMap.put("regist_from", regist_from);

		}
		String sign = HttpClientUtilSSO.getSign(paramMap);

		return "redirect:"
				+ SystemConstants.SSO_REGISTER_URL
				+ "?domainName="
				+ SystemConstants.DOMAIN_NAME
				+ "&return_url="
				+ return_url
				+ "&sign="
				+ sign
				+ "&regist_from="
				+ (regist_from == null || "".equals(regist_from.trim()) ? ""
						: regist_from);

	}

	/**
	 * 说明： 用户退出（注销）
	 * 
	 * 
	 * @Methods Name getLogin
	 * @Create In 2013-8-12 By huyy
	 * @param userTicket
	 * @param response
	 * @param m
	 * @return String
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String getLogin(
			@CookieValue(value = "userTicket", required = false, defaultValue = "") String userTicket,
			HttpServletResponse response, Model m) {
		String return_url = "";
		String sign = "";
		if (userTicket != null) {
			return_url = SystemConstants.SSO_LOGINOUT_RETURN_URL + ".html";
			sign = HttpClientUtilSSO.getSign(return_url);
			this.securityService.userLogout(userTicket);
		}
		String sid = UUID.randomUUID().toString();
		Cookie cookie = new Cookie("shopin_sid", sid);
		cookie.setMaxAge(-1);
		cookie.setPath("/");
		cookie.setDomain("shopin.net");
		response.addCookie(cookie);

		return "redirect:" + SystemConstants.SSO_LOGINOUT_URL + "?domainName="
				+ SystemConstants.DOMAIN_NAME + "&return_url=" + return_url
				+ "&sign=" + sign;
	}

	/**
	 * 说明： 单点回调注销接口
	 * 
	 * @Methods Name ddLoginout
	 * @Create In 2013-8-12 By huyy
	 * @param request
	 * @param response
	 * @param m
	 * @return String
	 */
	@RequestMapping(value = "/ddLogout", method = RequestMethod.GET)
	public String ddLoginout(HttpServletRequest request,
			HttpServletResponse response, Model m) {

		String userTicket = this.getTicket(request.getCookies());
		this.securityService.userLogout(userTicket);
		String sid = UUID.randomUUID().toString();
		Cookie cookie = new Cookie("shopin_sid", sid);
		cookie.setMaxAge(-1);
		cookie.setPath("/");
		cookie.setDomain("shopin.net");
		response.addCookie(cookie);
		return "redirect:/index.html";

	}

	/**
	 * 说明： 从COOKIE中 获取TICKET
	 * 
	 * @Methods Name getTicket
	 * @Create In 2013-8-14 By huyy
	 * @param cookies
	 * @return String
	 */
	private String getTicket(Cookie[] cookies) {
		String ticket = "";
		if (cookies == null) {
			return ticket;
		}
		for (int i = 0; i < cookies.length; i++) {
			String cookieKey = cookies[i].getName();
			if ("userTicket".equals(cookieKey)) {
				ticket = cookies[i].getValue();
				break;
			}
		}

		return ticket;
	}

}
