/**
 * 说明:
 *     三版网站购物车控制器
 * @Probject Name: web
 * @Path: net.shopin.web.controller.CartController.java
 * @Create By kongm
 * @Create In 2013-8-19 上午10:14:46
 * TODO
 */
package net.shopin.web.controller;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import net.shopin.api.ICartService;
import net.shopin.api.ISecurityService;
import net.shopin.constants.PageViewConstants.PageViewCode;
import net.shopin.view.AjaxMessageVO;
import net.shopin.view.CartItem;
import net.shopin.view.MemberVO;
import net.shopin.web.util.WebUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * @Class Name CartController
 * @Author kongm
 * @Create In 2013-8-19
 */
@Controller
@Scope("prototype")
public class CartController {

	@Autowired
	private ICartService cartService;
	@Autowired
	private ISecurityService securityService;

	/**
	 * 说明: 添加商品到购物车
	 * 
	 * @Methods Name addProductToCart
	 * @Create In 2013-8-19 By kongm
	 * @param m
	 * @param cartId
	 * @param uid
	 * @param proDetailSID
	 * @param promotionPrice
	 * @param proQuantity
	 *            void
	 */
	@RequestMapping(value = { "/cart/add" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.GET,
			org.springframework.web.bind.annotation.RequestMethod.POST })
	public void addProductToCart(Model m,
			@CookieValue(value = "shopin_sid", required = false) String cartId,
			@CookieValue(value = "userTicket", required = false) String uid,
			String proDetailSID, String promotionPrice, String proQuantity,
			String cartType, String picUrl, String stock, String name, String shopPrice, 
			String brandSid, String brandName) {
		String price = "";
		if(shopPrice != null && !"".equals(shopPrice)) {
			price = shopPrice;
		} else {
			price = promotionPrice;
		}
		if (cartType.equals("0")) {
			// 普通购物车
			if (!WebUtil.validateStr(cartId)) {
				m.addAttribute("result", new AjaxMessageVO("0",
						PageViewCode.SESSION_INVALID.getMemo()));
			}
			if ((!WebUtil.validateStr(proDetailSID))
					|| (!WebUtil.validateStr(promotionPrice))
					|| (!WebUtil.validateStr(proQuantity))) {
				m.addAttribute("result", new AjaxMessageVO("0",
						PageViewCode.CART_ADD_FAILURE.getMemo()));
			}
			CartItem item = this.cartService.getCartItem(cartId, proDetailSID);
			if (item == null) {
				item = this.cartService.getCartItemByDetail(proDetailSID,
						price);
				if (item.getSid() == null) {
					m.addAttribute("result", new AjaxMessageVO("0",
							PageViewCode.CART_ADD_FAILURE.getMemo()));
				}
			}

			item.setQty(Integer.valueOf(item.getQty().intValue()
					+ Integer.parseInt(proQuantity)));
			item.setProPicture(picUrl);
			item.setStoreCount(stock);
			item.setName(name);
			item.setPromotionPrice(promotionPrice);
			item.setBrandSid(brandSid);
			item.setBrandName(brandName);
			item.setShopPrice(shopPrice);
			this.cartService.addCartItem(cartId, item);
			m.addAttribute("result", new AjaxMessageVO("1",
					PageViewCode.CART_ADD_SUCCESS.getMemo()));
			m.addAttribute("amout", this.cartService.getCartAmount(cartId, uid));
			m.addAttribute("quantity",
					this.cartService.getCartItemQty(cartId, uid));
		} else if (cartType.equals("1")) {
			// 闪购购物车
			if (!WebUtil.validateStr(uid)) {
				m.addAttribute("result", new AjaxMessageVO("0",
						PageViewCode.SESSION_INVALID.getMemo()));
			}
			if ((!WebUtil.validateStr(proDetailSID))
					|| (!WebUtil.validateStr(promotionPrice))
					|| (!WebUtil.validateStr(proQuantity))) {
				m.addAttribute("result", new AjaxMessageVO("0",
						PageViewCode.CART_ADD_FAILURE.getMemo()));
			}
			CartItem item = this.cartService.getVipCartItem(uid, proDetailSID);
			if (item == null) {
				item = this.cartService.getCartItemByDetail(proDetailSID,
						price);
				if (item.getSid() == null) {
					m.addAttribute("result", new AjaxMessageVO("0",
							PageViewCode.CART_ADD_FAILURE.getMemo()));
				} else {
					//获取销售编码
					String saleCodeSid = WebUtil.getSaleCodeSid(item.getSid()).toString();
					item.setSaleCodeSid(saleCodeSid);
				}
			}

			item.setQty(Integer.valueOf(item.getQty().intValue()
					+ Integer.parseInt(proQuantity)));
			item.setProPicture(picUrl);
			item.setStoreCount(stock);
			item.setName(name);
			item.setPromotionPrice(promotionPrice);
			item.setBrandSid(brandSid);
			item.setBrandName(brandName);
			item.setShopPrice(shopPrice);
//			this.cartService.addVipCartPro(uid, item);

			// 修改闪购商品库存
			MemberVO memberVo = securityService.getLoginUserId(uid);

			String result = WebUtil.updateFlashSale(memberVo.getMembersSid(), item, item.getQty());
			if("true".equals(result)) {
				this.cartService.addVipCartPro(uid, item);
				m.addAttribute("result", new AjaxMessageVO("1",
						PageViewCode.CART_ADD_SUCCESS.getMemo()));
			} else {
				m.addAttribute("result", new AjaxMessageVO("0",
						PageViewCode.CART_UPDATE_FAILURE.getMemo()));
			}

//			m.addAttribute("result", new AjaxMessageVO("1",
//					PageViewCode.CART_ADD_SUCCESS.getMemo()));
			m.addAttribute("amout", this.cartService.getCartAmount(cartId, uid));
			m.addAttribute("quantity",
					this.cartService.getCartItemQty(cartId, uid));

		}
	}

	/**
	 * 说明: 购物车展示页面
	 * 
	 * @Methods Name cartPage
	 * @Create In 2013-8-19 By kongm
	 * @param m
	 * @param cartId
	 * @param uid
	 * @return String
	 */
	@RequestMapping(value = { "/cart/show" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.GET,
			org.springframework.web.bind.annotation.RequestMethod.POST })
	public String cartPage(Model m,
			@CookieValue(value = "shopin_sid", required = false) String cartId,
			@CookieValue(value = "userTicket", required = false) String uid) {
		if (!WebUtil.validateStr(cartId)) {
			return "redirect:/cart/show.html";
		}
		double money = 0.0D;
		int total = 0;
		money = this.cartService.getCartAmount(cartId, uid);
		total = this.cartService.getCartItemQty(cartId, uid);

		Map<String, List<CartItem>> map = this.cartService.getCartItemsMap(
				cartId, uid);
		// 普通购物车单品条目

		m.addAttribute("cartlist", map.get("0"));
		// 闪购购物车单品条目

		if (uid != null && !"".equals(uid)) {
			long vipCartRemainTime = this.cartService.getVipCartReaminTime(uid);
			m.addAttribute("remainTime", vipCartRemainTime);
		}
		// 闪购购物车剩余时间

		m.addAttribute("cartVIPlist", map.get("1"));
		m.addAttribute("amount", new DecimalFormat("0.00").format(money));
		m.addAttribute("total", String.valueOf(total));

		return "cart/cart";

	}

	/**
	 * 说明： 更新购物车单品数量
	 * 
	 * @Methods Name updateQty
	 * @Create In 2013-8-21 By wandg
	 * @param m
	 * @param cartId
	 * @param uid
	 * @param proDetailSID
	 * @param price
	 * @param qty
	 * @param cartType
	 * @return String
	 */
	@RequestMapping(value = { "/cart/updateqty" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.GET,
			org.springframework.web.bind.annotation.RequestMethod.POST })
	public String updateQty(Model m,
			@CookieValue(value = "shopin_sid", required = false) String cartId,
			@CookieValue(value = "userTicket", required = false) String uid,
			String proDetailSID, String price, String qty, String cartType) {
		long store = 0;
		if (!WebUtil.validateStr(cartId)) {
			m.addAttribute("result", new AjaxMessageVO("0",
					PageViewCode.SESSION_INVALID.getMemo()));
			return null;
		}
//		m.addAttribute("shopcount", this.cartService.getProCount(proDetailSID));
		if ((!WebUtil.validateStr(proDetailSID))
				|| (!WebUtil.validateStr(price)) || (!WebUtil.validateStr(qty))) {
			m.addAttribute("result", new AjaxMessageVO("0",
					PageViewCode.CART_UPDATE_FAILURE.getMemo()));
			return null;
		}
		
		if (cartType.equals("0")) {
			CartItem itemOldPt = this.cartService.getCartItem(cartId,
					proDetailSID);
			store = Integer.parseInt(itemOldPt.getStoreCount());
			if (store < Integer.parseInt(qty)) {
				m.addAttribute("storeqty", String.valueOf(store));
				m.addAttribute("result", new AjaxMessageVO("0",
						PageViewCode.CART_UPDATE_STORE.getMemo() + store
								+ PageViewCode.CART_UPDATE_STORE2.getMemo() + store
								+ PageViewCode.CART_UPDATE_STORE3.getMemo()));

				return null;
			}
			// 修改普通购物车条目
			this.cartService.updateCartProQty(cartId, proDetailSID,
					Integer.valueOf(qty), 0);
			m.addAttribute("result", new AjaxMessageVO("1",
					PageViewCode.CART_UPDATE_SUCSESS.getMemo()));
		} else if (cartType.equals("1")) {
			// 修改闪购购物车条目

			// 获取修改前的闪购商品条目
			CartItem itemOld = this.cartService.getVipCartItem(uid,
					proDetailSID);
			
			int oldQty = itemOld.getQty();
			store = Integer.parseInt(itemOld.getStoreCount());
			int quantity = Integer.parseInt(qty);
			if (store < quantity) {
				m.addAttribute("storeqty", String.valueOf(store));
				m.addAttribute("result", new AjaxMessageVO("0",
						PageViewCode.CART_UPDATE_STORE.getMemo() + store
								+ PageViewCode.CART_UPDATE_STORE2.getMemo() + store
								+ PageViewCode.CART_UPDATE_STORE3.getMemo()));

				return null;
			}
			// 如果增加购买的闪购商品，修改闪购商品库存
			if (Integer.parseInt(qty) > oldQty) {
				MemberVO memberVo = securityService.getLoginUserId(uid);
				CartItem item = this.cartService.getVipCartItem(uid,
						proDetailSID);
				String result = WebUtil.updateFlashSale(memberVo.getMembersSid(), item, Integer.parseInt(qty));
				if("true".equals(result)) {
					this.cartService.updateCartProQty(uid, proDetailSID,
							Integer.valueOf(qty), 1);
					m.addAttribute("result", new AjaxMessageVO("1",
							PageViewCode.CART_UPDATE_SUCSESS.getMemo()));
				} else {
					m.addAttribute("result", new AjaxMessageVO("0",
							PageViewCode.CART_UPDATE_FAILURE.getMemo()));
				}
			} else {
				this.cartService.updateCartProQty(uid, proDetailSID,
						Integer.valueOf(qty), 1);
				m.addAttribute("result", new AjaxMessageVO("1",
						PageViewCode.CART_UPDATE_SUCSESS.getMemo()));
			}
		}

		return null;
	}

	/**
	 * 说明： 删除购物车某一单品条目
	 * 
	 * @Methods Name removeProduct
	 * @Create In 2013-8-21 By wandg
	 * @param m
	 * @param cartId
	 * @param proDetailSID
	 * @return String
	 */
	@RequestMapping(value = { "/cart/remove" }, method = {
			org.springframework.web.bind.annotation.RequestMethod.GET,
			org.springframework.web.bind.annotation.RequestMethod.POST })
	public String removeProduct(Model m,
			@CookieValue(value = "shopin_sid", required = false) String cartId,
			@CookieValue(value = "userTicket", required = false) String uid,
			String proDetailSID, String cartType) {
		if (!WebUtil.validateStr(cartId)) {
			m.addAttribute("result", new AjaxMessageVO("0",
					PageViewCode.SESSION_INVALID.getMemo()));
			return null;
		}
		if (!WebUtil.validateStr(proDetailSID)) {
			m.addAttribute("result", new AjaxMessageVO("0",
					PageViewCode.CART_REMOVE_FAILURE.getMemo()));
			return null;
		}
		if (cartType.equals("0")) {
			this.cartService.delCartPro(cartId, proDetailSID, 0);
		} else if (cartType.equals("1")) {
			this.cartService.delCartPro(uid, proDetailSID, 1);
		}
		m.addAttribute("result", new AjaxMessageVO("1",
				PageViewCode.CART_REMOVE_SUCCESS.getMemo()));
		return null;
	}

	/**
	 * 说明： 判断闪购购物车中是否存在proDetailSid的商品
	 * 
	 * @Methods Name ifExistsInFlashCart
	 * @Create In 2013-9-10 By jingpeng
	 * @param m
	 * @param uid
	 * @param proDetailSid
	 *            void
	 */
	@RequestMapping(value = { "/cart/proDetailExistInFlashCart" }, method = {
			RequestMethod.GET, RequestMethod.POST })
	public void ifExistsInFlashCart(Model m,
			@CookieValue(value = "userTicket", required = false) String uid,
			String proDetailSid) {
		String flag = "false";
		CartItem vipItem = this.cartService.getVipCartItem(uid, proDetailSid);
		if (vipItem != null && vipItem.getQty() != null && vipItem.getQty() > 0) {
			flag = "true";
		}
		m.addAttribute("ifExist", flag);
	}
}
