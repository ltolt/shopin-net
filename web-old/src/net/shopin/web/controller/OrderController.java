package net.shopin.web.controller;

import com.shopin.modules.security.interceptor.MethodSecurity;

import java.text.DecimalFormat;
import java.util.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.shopin.modules.utils.SendMessage;
import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.shopin.api.*;
import net.shopin.exception.OrderFailedException;
import net.shopin.view.*;
import net.shopin.web.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {

     private final static String  REMOTE_ORDEROMS_URL = LoadProperties.readValue("remote_orderOMS_url");

	@Autowired
	private ICartService cartService;

	@Autowired
	private IProductListService productListService;

	@Autowired
	private IMemberService memberService;

	@Autowired
	private ISecurityService securityService;

	@Autowired
	private IFreightService freightService;

	@Autowired
	private IOrderService orderService;

	@Autowired
	private IMemberAccountService memberAccountService;

   
	private double getProductAmount(List<CartItem> list) {
		double money = 0.0D;
		for (CartItem item : list) {
			money += Double.parseDouble(item.getPromotionPrice())
					* item.getQty().intValue();
		}

		return money;
	}

	private double getOrderAmount(OrderVO ordervo) {
		double money = 0.0D;
		for (OrderDetailVO detailvo : ordervo.getOrderDetails()) {
			money += Double.parseDouble(detailvo.getSalePrice())
					* Integer.parseInt(detailvo.getSaleSum());
		}
		double freight = ordervo.getSendCost() == null ? 0.0D : Double
				.parseDouble(ordervo.getSendCost());
		money += freight;
		return money;
	}

	private void prepareData(Model m, Cart cart, String uid) {
		double money = 0.0D;
		int total = 0;
		for (CartItem item : cart.getItemList()) {
			money += Double.parseDouble(item.getPromotionPrice())
					* item.getQty().intValue();

			total += item.getQty().intValue();
			item.setShopCount("" + this.cartService.getProCount(item.getSid()));
			item.setStoreCount(""
					+ this.productListService.getProDetailQuantity(item
							.getSid(), item.getPromotionPrice()));
		}

		ExpressTypeVO typevo = this.freightService.getCollectType();
		//生成OrderVO
        OrderVO order = cart.getOrderVO();
		List expressTypes = this.freightService.getAllExpressType();
		List paymentTypes = this.cartService.getAllPaymentType();
      
		List provinces = this.freightService.getProvinces();
		List list = cart.getItemList();
		List addresslist = uid == null ? new ArrayList() : this.memberService
				.getAdressList(uid);

		String formAddress = "";
		String availExpressTypes = "";
		if ((order.getReceptAddress() != null)
				&& (order.getInceptProvince() != null)
				&& (order.getInceptCity() != null)) {
			formAddress = order.getReceptAddress().replaceAll(
					order.getInceptProvince(), "");
			formAddress = formAddress.replaceAll(order.getInceptCity(), "");
		}
		List<ExpressTypeVO> availtypes = expressTypes;
		boolean existCollect = false;
		if (order.getInceptCitySid() != null) {
			availtypes = this.freightService.getExpressTypeByCity(Integer
					.valueOf(Integer.parseInt(order.getInceptCitySid())));
		}

		for (ExpressTypeVO availetype : availtypes) {
			availExpressTypes = availExpressTypes + availetype.getSid() + ",";
			if ("货到付款".equals(availetype.getExpressName())) {
				existCollect = true;
			}
		}
		if (availExpressTypes.indexOf(",") != -1) {
			availExpressTypes = availExpressTypes.substring(0,
					availExpressTypes.length() - 1);
		}

		if ((order.getInvoiceBit() == null)
				|| ("".equals(order.getInvoiceBit()))) {
			order.setInvoiceBit("0");
		}

		m.addAttribute("isLogin", Boolean.valueOf(uid != null));
		m.addAttribute("uid", uid);

		m.addAttribute("provincelist", provinces);

		m.addAttribute("addresslist", addresslist);
		m.addAttribute("formAddress", formAddress);

		m.addAttribute("order", order);

		m.addAttribute("cartlist", list);
		double sendCost = order.getSendCost() == null ? 0.0D : Double
				.parseDouble(order.getSendCost());
		String orderamount = new DecimalFormat("0.00").format(money + sendCost);

		m.addAttribute("amount", new DecimalFormat("0.00").format(money));

		m.addAttribute("total", String.valueOf(total));

		m.addAttribute("orderamount", orderamount);

		m.addAttribute("sendcost", new DecimalFormat("0.00").format(sendCost));

		m.addAttribute("expresslist", expressTypes);
		m.addAttribute("avail_express_types", availExpressTypes);

		m.addAttribute("paymentlist", paymentTypes);
		m.addAttribute("existCollect", Boolean.valueOf(existCollect));
		m.addAttribute("paytype", typevo);

		m.addAttribute("validate_address", Boolean.valueOf(order
				.getReceptName() != null));
		m.addAttribute("validate_invoice", Boolean.valueOf(order
				.getInvoiceBit() != null));
		m.addAttribute("validate_sendtype", Boolean
				.valueOf(order.getSendType() != null));
		m.addAttribute("validate_paytype", Boolean.valueOf(order
				.getPaymentModeSid() != null));
		m
				.addAttribute("validate_productlist", Boolean.valueOf(!list
						.isEmpty()));
	}

	@MethodSecurity
	@RequestMapping(value = { "/order/confirm" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
	public String confirmOrder(Model m,
			@CookieValue(value = "shopin_sid", required = false)
			String cartId, @CookieValue(value = "referer", required = false)
			String referer,
			@CookieValue(value = "userTicket", required = false)
			String uid, @CookieValue(value = "cid", required = false)
			String cid, HttpServletRequest req) {
		if (!validateCartId(cartId)) {
			return "redirect:/order/confirm.html";
		}
		if ((uid != null) && (this.securityService.isUserLogin(uid)))
			uid = this.securityService.getLoginUserId(uid).getMembersSid();
		else {
			uid = null;
		}
		Cart cart = this.cartService.getCart(cartId);

		if (cart.getItemList().isEmpty()) {
			return "redirect:/index.html";
		}
		m.addAttribute("referer", referer);
		m.addAttribute("cid", cid);
		prepareData(m, cart, uid);
		return "buying/orderconfirm";
	}

	@RequestMapping(value = { "/order/selectAddress" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	public String selectAddress(Model m,
			@CookieValue(value = "userTicket", required = false)
			String uid, @CookieValue(value = "shopin_sid", required = false)
			String cartId, HttpServletRequest req, String addressSID) {
		if (!validateCartId(cartId)) {
			m.addAttribute("result", new AjaxMessageVO("0",
					"很抱歉，当前会话已经失效，请刷新页面"));
			return null;
		}
		if (!validateUid(uid)) {
			m.addAttribute("result", new AjaxMessageVO("0",
					"很抱歉，当前会话已经失效,请刷新页面"));
			return null;
		}
		uid = this.securityService.getLoginUserId(uid).getMembersSid();
		MemberAddressVO address = this.memberService.getAddress(addressSID);
		if (!uid.equals(address.getMembersSid())) {
			m.addAttribute("result", new AjaxMessageVO("0", "很抱歉，您选择的地址不存在"));
			return null;
		}

		List<ExpressTypeVO> expressTypes = this.freightService
				.getExpressTypeByCity(new Integer(address.getDeliCitySid()));

		List typeids = new ArrayList();
		boolean existCollect = false;
		for (ExpressTypeVO type : expressTypes) {
			typeids.add(type.getSid());
			if ("货到付款".equals(type.getExpressName())) {
				existCollect = true;
			}
		}
		this.cartService.saveCartAddress(cartId, address);
		m.addAttribute("typeids", typeids);
		m.addAttribute("existcollect", existCollect ? "1" : "0");
		m.addAttribute("result", new AjaxMessageVO("1", "选择地址信息成功"));
		return null;
	}

	private String getFullAddress(MemberAddressVO addressVO) {
		String fullAddress = "";
		fullAddress = fullAddress + addressVO.getAddress();
		String cityName = addressVO.getCityName() == null ? "" : addressVO
				.getCityName();
		String provinceName = addressVO.getProvinceName() == null ? ""
				: addressVO.getProvinceName();
		if (fullAddress.indexOf(cityName) < 0) {
			fullAddress = cityName + fullAddress;
		}
		if ((!provinceName.equals(cityName))
				&& (fullAddress.indexOf(provinceName) < 0)) {
			fullAddress = provinceName + fullAddress;
		}
		return fullAddress;
	}

	@RequestMapping(value = { "/order/newAddress" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	public String selectNewAddress(Model m,
			@CookieValue(value = "userTicket", required = false)
			String uid, @CookieValue(value = "shopin_sid", required = false)
			String cartId, HttpServletRequest req, MemberAddressVO address,
			String flag) {
		if (!validateCartId(cartId)) {
			m.addAttribute("result", new AjaxMessageVO("0",
					"很抱歉，当前会话已经失效，请刷新页面"));
			return null;
		}
		if ("1".equals(flag)) {
			if (!validateUid(uid)) {
				m.addAttribute("result", new AjaxMessageVO("0",
						"您还没有登录,不能将地址添加到地址簿"));
				return null;
			}

			uid = this.securityService.getLoginUserId(uid).getMembersSid();
			int count = this.memberService.getAddressCount(uid);
			if (count > CodeUtil.getMemberAddressLimit()) {
				m.addAttribute("result", new AjaxMessageVO("0",
						"您的地址簿已达最大数量限制,不能添加新地址"));
				return null;
			}
			address.setMembersSid(uid);
			this.memberService.saveAddress(address);
		}

		address.setFullAddress(getFullAddress(address));
		this.cartService.saveCartAddress(cartId, address);
		List<ExpressTypeVO> expressTypes = this.freightService
				.getExpressTypeByCity(new Integer(address.getDeliCitySid()));

		List typeids = new ArrayList();
		boolean existCollect = false;
		for (ExpressTypeVO type : expressTypes) {
			typeids.add(type.getSid());
			if ("货到付款".equals(type.getExpressName())) {
				existCollect = true;
			}
		}
		m.addAttribute("typeids", typeids);
		m.addAttribute("existcollect", existCollect ? "1" : "0");
		m.addAttribute("result", new AjaxMessageVO("1", "填写地址信息成功"));
		return null;
	}

	@RequestMapping(value = { "/order/invoice" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	public String editInvoice(Model m,
			@CookieValue(value = "shopin_sid", required = false)
			String cartId, OrderVO order) {
		if (!validateCartId(cartId)) {
			m.addAttribute("result", new AjaxMessageVO("0",
					"很抱歉，当前会话已经失效，请刷新页面"));
			return null;
		}
		this.cartService.saveCartInvoice(cartId, order);
		m.addAttribute("result", new AjaxMessageVO("1", "填写发票信息成功"));
		return null;
	}

	@RequestMapping(value = { "/order/paytype" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	public String editPayType(Model m,
			@CookieValue(value = "shopin_sid", required = false)
			String cartId, @CookieValue(value = "userTicket", required = false)
			String uid, OrderVO order) {
       
		if (!validateCartId(cartId)) {
			m.addAttribute("result", new AjaxMessageVO("0",
					"很抱歉，当前会话已经失效，请刷新页面"));
			return null;
		}
		OrderVO old = this.cartService.getCartOrder(cartId);
		String cityId = old.getInceptCitySid();
		if (!validateRequired(cityId)) {
			m.addAttribute("result", new AjaxMessageVO("0", "请先填写收货人信息"));
			return null;
		}

		if ((!validateRequired(order.getPaymentModeSid()))
				|| (!validateRequired(order.getPaymentModeName()))) {
			m.addAttribute("result", new AjaxMessageVO("0", "请选择支付方式"));
			return null;
		}
		String freight = "";
		if ("货到付款".equals(order.getPaymentModeName())) {
			ExpressTypeVO typevo = this.freightService.getCollectType();
			if (typevo.getSid() == null) {
				m.addAttribute("result", new AjaxMessageVO("0",
						"选择支付方式失败，很抱歉，暂不支持" + old.getInceptCity() + "货到付款"));

				return null;
			}
			freight = this.freightService.getFreight(cityId, typevo.getSid());
			if (!validateRequired(freight)) {
				m.addAttribute("result", new AjaxMessageVO("0",
						"选择支付方式失败，很抱歉，暂不支持" + old.getInceptCity() + "货到付款"));

				return null;
			}
			order.setSendCost(freight);
			order.setSendType(typevo.getSid());
			order.setSendTypeName("由上品选择合适的配送方式");
		}
		if ("会员账户".equals(order.getPaymentModeName())) {
			if (!validateUid(uid)) {
				m.addAttribute("result", new AjaxMessageVO("0",
						"您还没有登录，不能使用账户余额支付，请选择其他支付方式"));
				return null;
			}
			String memSid = this.securityService.getLoginUserId(uid)
					.getMembersSid();
			MemberAccountVO account = this.memberAccountService
					.getAccount(memSid);
			String balance = account.getBalance();
			List list = this.cartService.getCartProList(cartId);
			double orderAmount = getProductAmount(list);
			if ((!ValidateUtil.validateRequired(balance))
					|| (Double.parseDouble(balance) < orderAmount)) {
				m.addAttribute("result", new AjaxMessageVO("0",
						"您的账户余额不足，不能使用账户余额支付，请选择其他支付方式"));
				return null;
			}
		}
        
		this.cartService.saveCartPayType(cartId, order);
		m.addAttribute("result", new AjaxMessageVO("1", "填写支付方式成功"));
		m.addAttribute("freight", freight);
		return null;
	}

	@RequestMapping(value = { "/order/sendtype" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	public String editSendType(Model m,
			@CookieValue(value = "shopin_sid", required = false)
			String cartId, OrderVO order) {
		if (!validateCartId(cartId)) {
			m.addAttribute("result", new AjaxMessageVO("0",
					"很抱歉，当前会话已经失效，请刷新页面"));
			return null;
		}
		OrderVO old = this.cartService.getCartOrder(cartId);
		String cityId = old.getInceptCitySid();
		String paytype = old.getPaymentModeSid();
		String paytypename = old.getPaymentModeName();
		if (!validateRequired(cityId)) {
			m.addAttribute("result", new AjaxMessageVO("0", "请先填写收货人信息"));
			return null;
		}
		if (!validateRequired(paytype)) {
			m.addAttribute("result", new AjaxMessageVO("0", "请先选择支付方式"));
			return null;
		}
		if ("货到付款".equals(paytypename)) {
			ExpressTypeVO typevo = this.freightService.getCollectType();
			order.setSendType(typevo.getSid());
		}
		if ((!validateRequired(order.getSendType()))
				|| (!validateRequired(order.getSendTypeName()))) {
			m.addAttribute("result", new AjaxMessageVO("0", "请选择配送方式"));
			return null;
		}
		String freight = this.freightService.getFreight(cityId, order
				.getSendType());
		if (!validateRequired(freight)) {
			m.addAttribute("result", new AjaxMessageVO("0", "选择配送方式失败，很抱歉，暂不支持"
					+ old.getInceptCity() + "的" + order.getSendTypeName()));

			return null;
		}
		order.setSendCost(freight);
		this.cartService.saveCartSendType(cartId, order);
		m.addAttribute("result", new AjaxMessageVO("1", "填写配送方式成功"));
		m.addAttribute("freight", freight);
		return null;
	}

	private List<OrderDetailVO> convertToOrderDetail(List<CartItem> list) {
		List newList = new ArrayList();
		for (CartItem item : list) {
			OrderDetailVO detail = new OrderDetailVO();
			detail.setProDetailSid(item.getSid());
			detail.setSalePrice(item.getPromotionPrice());
			detail.setPromotionPrice(item.getPromotionPrice());
			detail.setSaleSum("" + item.getQty());
			detail.setPositionId(item.getPositionId());
			detail.setChannelId(item.getChannelId());
			newList.add(detail);
		}
		return newList;
	}

	@RequestMapping(value = { "/order/commit" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	public String commitOrder(Model m,
			@CookieValue(value = "userTicket", required = false)
			String uid, @CookieValue(value = "shopin_sid", required = false)
			String cartId, @CookieValue(value = "cid", required = false)
			String cid, @CookieValue(value = "LTYPE", required = false)
			String ltype, @CookieValue(value = "LTYPES", required = false)
			String ltypes, @CookieValue(value = "LTINFO", required = false)
			String ltinfo, HttpServletRequest req) {
       
		if (!validateRequired(cartId)) {
			m.addAttribute("result", new AjaxMessageVO("01",
					"很抱歉，当前会话已经失效，请刷新页面"));
			return null;
		}
		Cart cart = this.cartService.getCart(cartId);
		OrderVO order = cart.getOrderVO();
		order.setExternalLinks(cid);
		order.setOrderSourceSid("0");
		order.setLtinfo(ltinfo);
		order.setLtype(ltype);
		order.setOrderSource(ltypes);
		if ("会员账户".equals(order.getPaymentModeName())) {
			if (!validateUid(uid)) {
				m.addAttribute("result", new AjaxMessageVO("0",
						"您还没有登录，不能使用账户余额支付，请选择其他支付方式"));
				return null;
			}
			String memSid = this.securityService.getLoginUserId(uid)
					.getMembersSid();
			MemberAccountVO account = this.memberAccountService
					.getAccount(memSid);
			String balance = account.getBalance();
			List list = this.cartService.getCartProList(cartId);
			double orderAmount = getProductAmount(list);
			if ((!ValidateUtil.validateRequired(balance))
					|| (Double.parseDouble(balance) < orderAmount)) {
				m.addAttribute("result", new AjaxMessageVO("0",
						"您的账户余额不足，不能使用账户余额支付，请选择其他支付方式"));
				return null;
			}
		}

		if (!validateUid(uid)) {
			m.addAttribute("result", new AjaxMessageVO("01",
					"您还没有登录，请先登录<br/>如果您不是会员，也可以使用快速购买"));
			return null;
		}
		String membersSID = this.securityService.getLoginUserId(uid)
				.getMembersSid();

		order.setMembersSid(membersSID);

		order.setOrderDetails(convertToOrderDetail(cart.getItemList()));

		String sendCost = order.getSendCost();
		if (sendCost.indexOf(".") != -1) {
			sendCost = sendCost.substring(0, sendCost.indexOf("."));
		}
		order.setSendCost(sendCost);

		if ("货到付款".equals(order.getPaymentModeName())) {
			ExpressTypeVO typevo = this.freightService.getCollectType();
			order.setSendType(typevo.getSid());
			order.setSendTypeName("货到付款");
		}


             try {

            Map paramMap = new HashMap();
            paramMap.put("orderjson", DataUtil.converOrderVOToJson(order));
            String newOrderJson = HttpUtil.HttpPost(REMOTE_ORDEROMS_URL, "orderService/createOrder", paramMap);
            JSONObject jsonOrder = JSONObject.fromObject(newOrderJson);
            String successflag = (String) jsonOrder.get("success");
             this.cartService.delCart(cartId);
            if("true".equals(successflag)){
                String orderId = jsonOrder.getString("orderNo");
                m.addAttribute("result", new AjaxMessageVO("1", "确认订单成功"));
                m.addAttribute("orderId", orderId);
                // start add by tongjp 保存订单
			    // sendMessageByOrderVO(ordervo,"sendStoreMessage","reduction_net_from","1");
			    sendMessageByOrderVO(order, SendMessage.STORE_METHOD,
					SendMessage.REDUCTION_NET_FROM, "1");
			// end add by tongjp
			return null;
            }else{
             m.addAttribute("result",new AjaxMessageVO("0","库存不足"));
               return  null;
            }
		} catch (OrderFailedException e) {
			e.printStackTrace();
			m.addAttribute("result", new AjaxMessageVO("0", e.getMessage()));
		}catch (Exception e){
                 e.printStackTrace();
                 m.addAttribute("result",new AjaxMessageVO("0","系统错误请稍后重试"));
             }
		return null;
	}

	@RequestMapping(value = { "/order/quickbuy" }, method = { org.springframework.web.bind.annotation.RequestMethod.POST })
	public String quickBuy(Model m,
			@CookieValue(value = "userTicket", required = false)
			String uid, @CookieValue(value = "shopin_sid", required = false)
			String cartId, String email, HttpServletRequest req) {
		if (!validateCartId(cartId)) {
			m.addAttribute("result", new AjaxMessageVO("0",
					"很抱歉，当前会话已经失效，请刷新页面"));
			return null;
		}
		if (validateUid(uid)) {
			m.addAttribute("result", new AjaxMessageVO("10",
					"您已经登录，不需要申请快速购买<br/>即将转至订单确认页面，请再次确认订单"));
			return null;
		}
		if (!ValidateUtil.validateEmail(email)) {
			m.addAttribute("result", new AjaxMessageVO("0", "邮箱填写不正确"));
			return null;
		}
		boolean flag = this.memberService.validateEmail(email).booleanValue();
		if (!flag) {
			m.addAttribute("result", new AjaxMessageVO("0", "邮箱已经存在,请换一个"));
			return null;
		}
		MemberVO memberVO = new MemberVO();
		memberVO.setMemEmail(email);
		int len = email.indexOf("@");
		String memName = email.substring(0, len);
		memberVO.setMemPwd(memName);
		this.memberService.register(memberVO);
		memberVO = this.memberService.validate(memberVO.getMemEmail(), memberVO
				.getMemPwd());
		if (memberVO != null) {
			String uid2 = UUID.randomUUID().toString();
			this.securityService.addLoginUser(uid2, memberVO);
			MemberVO cachevo = this.securityService.getLoginUserId(uid2);
			m.addAttribute("userTicket", uid2);
			this.cartService.saveQuickBuy(cartId);
			Cart cart = this.cartService.getCart(cartId);
			if (!validateProduct(cart.getItemList())) {
				m.addAttribute("result", new AjaxMessageVO("01",
						"申请快速购买成功，您目前还没有购买商品，请尽快选购商品"));
				return null;
			}
			m.addAttribute("result", new AjaxMessageVO("1",
					"申请快速购买成功，即将转至订单确认页面，请再次确认订单"));
		} else {
			m.addAttribute("result", new AjaxMessageVO("0", "申请快速购买失败，请重试"));
		}
		return null;
	}

	private void prepareOrderPayData(Model m, String uid, OrderVO order) {
		order.setPaymentModeName(this.cartService.getPaymentType(
				order.getPaymentModeSid()).getName());
		String sendTypeName = this.freightService.getExpressType(
				new Integer(order.getSendType())).getExpressName();

		if ("货到付款".equals(sendTypeName)) {
			sendTypeName = "由上品根据订单的收货地址选择合适的快递方式";
		}
		order.setSendTypeName(sendTypeName);
		order.setOrderStatusName(OldCodeUtil.getOrderStatusName(order));
		order.setOrderClientStatus(OldCodeUtil.getOrderClientStatus(order));
		String sendCost = ValidateUtil.validateMoney(order.getSendCost()) ? order
				.getSendCost()
				: "0.00";
		String money = ValidateUtil.validateMoney(order.getSaleMoneySum()) ? order
				.getSaleMoneySum()
				: "0.00";
		String total = new DecimalFormat("0.00").format(Double
				.parseDouble(sendCost)
				+ Double.parseDouble(money));
		order.setSaleTotalSum("" + total);
		int qty = 0;
		for (OrderDetailVO detail : order.getOrderDetails()) {
			qty += Integer.parseInt(detail.getSaleSum());
		}
		order.setSaleTotalQty("" + qty);

		m.addAttribute("order", order);

		if ("会员账户".equals(order.getPaymentModeName())) {
			MemberAccountVO account = this.memberAccountService.getAccount(uid);
			if (account != null)
				m.addAttribute("account", account.getBalance());
		}
	}

	@RequestMapping(value = { "/orderpay/{orderId}" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
	public String orderPay(Model m,
			@CookieValue(value = "userTicket", required = false)
			String uid, @PathVariable("orderId")
			String orderId, HttpServletRequest req) {
		if (!validateUid(uid)) {
			return "redirect:/index.html";
		}
		if (!validateRequired(orderId)) {
			return "redirect:/index.html";
		}
		uid = this.securityService.getLoginUserId(uid).getMembersSid();

        //此处orderId实际上是orderNo
        OrderVO order = this.orderService.getOrderByNO(orderId);
        order=this.orderService.getOrder(order.getOrderId());
		if (!uid.equals(order.getMembersSid())) {
			return "redirect:/myshopin/orders/1.html";
		}
		if (!"1".equals(order.getOrderStatus())) {
			return "redirect:/myshopin/orders/" + order.getOrderId() + ".html";
		}
		m.addAttribute("offPriceRecord", this.orderService
				.getOffPriceRecord(order.getOrderId()));
		prepareOrderPayData(m, uid, order);
//        }

		return "buying/ordersuccess";
	}

	@RequestMapping(value = { "/order/pay/{orderId}" }, method = { org.springframework.web.bind.annotation.RequestMethod.GET })
	public String payOrder(Model m,
			@CookieValue(value = "userTicket", required = false)
			String uid, @PathVariable("orderId")
			String orderId, HttpServletRequest req) {
		if (!validateUid(uid)) {
			return "redirect:/index.html";
		}
		if (!validateRequired(orderId)) {
			return "redirect:/index.html";
		}
		uid = this.securityService.getLoginUserId(uid).getMembersSid();
		OrderVO order = this.orderService.getOrder(orderId);
		if (!uid.equals(order.getMembersSid())) {
			return "redirect:/myshopin/orders/1.html";
		}
		if (!"1".equals(order.getOrderStatus())) {
			return "redirect:/myshopin/orders/" + order.getOrderId() + ".html";
		}
		m.addAttribute("offPriceRecord", this.orderService
				.getOffPriceRecord(order.getOrderId()));
		prepareOrderPayData(m, uid, order);
		return "buying/orderpay";
	}

	private boolean validateRequired(String str) {
		return (str != null) && (!"".equals(str));
	}

	private boolean validateCartId(String cartId) {
		return validateRequired(cartId);
	}

	private boolean validateUid(String uid) {
		return (validateRequired(uid))
				&& (this.securityService.isUserLogin(uid));
	}

	private boolean validateProductDetailId(String productDetailId) {
		return validateRequired(productDetailId);
	}

	private boolean validateMoney(String price) {
		String pattern = "\\d+(\\.\\d{1,2})?";

		return (price != null) && (price.matches(pattern));
	}

	private boolean validateQty(String qty) {
		String pattern = "[1-9]{1}[0-9]*";

		return (qty != null) && (qty.matches(pattern));
	}

	private boolean validatePostCode(String postCode) {
		if (!validateRequired(postCode)) {
			return false;
		}

		return postCode.matches("\\d{6}");
	}

	private boolean validateTel(String tel) {
		if (!validateRequired(tel)) {
			return false;
		}

		return (tel.matches("13[0-9]{1}\\d{8}"))
				|| (tel.matches("\\d{3}-?\\d{8}"))
				|| (tel.matches("\\d{4}-?\\d{7}"));
	}

	private boolean validateAddress(MemberAddressVO address) {
		String addr = address.getAddress();
		String citySid = address.getDeliCitySid();
		String cityName = address.getCityName();
		String provinceSid = address.getDeliProvinceSid();
		String memberSid = address.getMembersSid();
		String mobileTel = address.getMobileTel();
		String name = address.getName();
		String postcode = address.getPostcode();
		String provinceName = address.getProvinceName();
		String tel = address.getTel();
		if ((addr == null) || (!addr.matches("\\s+"))) {
			return false;
		}
		if ((citySid == null) || ("".equals(citySid))) {
			return false;
		}
		if ((provinceSid == null) || ("".equals(provinceSid))) {
			return false;
		}
		if ((name == null) || (!name.matches("\\s+"))) {
			return false;
		}
		if (!validatePostCode(postcode)) {
			return false;
		}

		return validateTel(tel);
	}

	private boolean validateSourceOneStore(Cart cart) {
		return true;
	}

	private boolean validateAddress(OrderVO order) {
		String receptName = order.getReceptName();
		String receptAddress = order.getReceptAddress();
		String receptPhone = order.getReceptPhone();
		String inceptPostCode = order.getInceptPostcode();
		String inceptProvinceSid = order.getInceptProvinceSid();
		String inceptProvince = order.getInceptProvince();
		String inceptCitySid = order.getInceptCitySid();
		String inceptCity = order.getInceptCity();
		if (!validateRequired(receptName)) {
			return false;
		}
		if (!validateRequired(receptAddress)) {
			return false;
		}
		if (!validateTel(receptPhone)) {
			return false;
		}
		if (!validateRequired(receptAddress)) {
			return false;
		}
		if (!validateRequired(receptAddress)) {
			return false;
		}
		if (!validateRequired(receptAddress)) {
			return false;
		}
		if (!validateRequired(receptAddress)) {
			return false;
		}

		return validateRequired(receptAddress);
	}

	private boolean validateInvoice(OrderVO order) {
		String invoiceBit = order.getInvoiceBit();
		String invoiceName = order.getInvoiceName();
		String invoiceDesc = order.getInvoiceDesc();
		if ((!validateRequired(invoiceBit))
				|| (!invoiceBit.matches("[0-1]{1}"))) {
			return false;
		}

		return (!"1".equals(invoiceBit))
				|| ((validateRequired(invoiceName)) && (validateRequired(invoiceDesc)));
	}

	private boolean validateSendType(OrderVO order) {
		String sendType = order.getSendType();
		String sendTypeName = order.getSendTypeName();
		if (!validateRequired(sendType)) {
			return false;
		}

		return validateRequired(sendTypeName);
	}

	private boolean validatePayType(OrderVO order) {
		String paymentModeSid = order.getPaymentModeSid();
		String paymentModeName = order.getPaymentModeName();
		if (!validateRequired(paymentModeSid)) {
			return false;
		}

		return validateRequired(paymentModeName);
	}

	private boolean validateFreight(OrderVO order) {
		String freightInCart = order.getSendCost();
		if (!validateMoney(freightInCart)) {
			return false;
		}
		String citySid = order.getInceptCitySid();
		String sendType = order.getSendType();
		String freight = this.freightService.getFreight(citySid, sendType);
		if (!validateRequired(freight)) {
			return false;
		}

		return freightInCart.equals(freight);
	}

	private boolean validateOrder(OrderVO order) {
		if (!validateAddress(order)) {
			return false;
		}

		if (!validateInvoice(order)) {
			return false;
		}

		if (!validateSendType(order)) {
			return false;
		}

		if (!validatePayType(order)) {
			return false;
		}

		return validateFreight(order);
	}

	private boolean validateProduct(List<CartItem> list) {
		return !list.isEmpty();
	}

	private boolean validateOrder(Cart cart) {
		if (!validateOrder(cart.getOrderVO())) {
			return false;
		}
        
		return validateProduct(cart.getItemList());
	}

	public void sendMessageByOrderVO(OrderVO ordervo, String metnod,
			String messageSource, String sourceNum) {
		// start tongjp 增加发送消息
		String pdSids = "";
		List<OrderDetailVO> detaillist = ordervo.getOrderDetails();
		if (detaillist != null && detaillist.size() > 0) {
			for (OrderDetailVO orderDetailVO : detaillist) {
				pdSids += orderDetailVO.getProDetailSid() + ":0;";
			}
			pdSids = pdSids.substring(0, pdSids.length() - 1);
			// String method,String messageSource,String uuid,String
			// messageType,String pdSid,String pdSids,String storeNum,String
			// sourceNum,String ip
			SendMessage.toSendByPost(metnod, messageSource, SendMessage
					.getUUID(), SendMessage.STOREPROCEDURE_TYPE, "", pdSids,
					"", sourceNum, SendMessage.BACK_SERVER);
		}
		// end tongjp
	}
}