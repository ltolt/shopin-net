/**
 * 说明:
 *     三版网站订单控制器
 * @Probject Name: web
 * @Path: net.shopin.web.controller.OrderController.java
 * @Create By kongm
 * @Create In 2013-8-19 下午1:35:28
 * TODO
 */
package net.shopin.web.controller;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONException;
import net.sf.json.JSONObject;
import net.shopin.api.ICartService;
import net.shopin.api.IPaymentService;
import net.shopin.api.ISecurityService;
import net.shopin.exception.OrderFailedException;
import net.shopin.view.AjaxMessageVO;
import net.shopin.view.Cart;
import net.shopin.view.CartItem;
import net.shopin.view.MemberAddressVO;
import net.shopin.view.MemberVO;
import net.shopin.view.OrderDetailVO;
import net.shopin.view.OrderVO;
import net.shopin.view.TicketVO;
import net.shopin.view.WebProductVO;
import net.shopin.web.conf.yeePayConf.DigestUtil;
import net.shopin.web.util.DataUtil;
import net.shopin.web.util.HttpClientUtil;
import net.shopin.web.util.HttpClientUtilLogistics;
import net.shopin.web.util.HttpClientUtilSSO;
import net.shopin.web.util.HttpUtil;
import net.shopin.web.util.JsonUtilSSO;
import net.shopin.web.util.LoadProperties;
import net.shopin.web.util.LoadPropertiesSSO;
import net.shopin.web.util.OldCodeUtil;
import net.shopin.web.util.OrderUtil;
import net.shopin.web.util.SystemConstants;
import net.shopin.web.util.WebUtil;
import net.shopin.web.vo.PayTypeVO;
import net.shopin.web.vo.PaymentTypeDetail;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shopin.core.util.DataConvertUtil;
import common.Logger;
import edu.emory.mathcs.backport.java.util.Collections;


/**
 * @Class Name OrderController
 * @Author kongm
 * @Create In 2013-8-19
 */
@Controller
@Scope("prototype")
public class OrderController {
	@Autowired
	private ICartService cartService;
	@Autowired
	private ISecurityService securityService;
	@Autowired
	private IPaymentService paymentService;

	private final static  String SSO_GET_MEMBER_ADDRLIST_URL = LoadPropertiesSSO.readValue("SSO_GET_MEMBER_ADDRLIST_URL");
	private final static  String SSO_GET_PROVINCES_URL1 = LoadPropertiesSSO.readValue("SSO_GET_PROVINCES_URL1");
	private final static  String SSO_GET_CITIES_URL = LoadPropertiesSSO.readValue("SSO_GET_CITIES_URL");
	private final static  String SSO_DEL_ADDRESS_URL1 = LoadPropertiesSSO.readValue("SSO_DEL_ADDRESS_URL1");
	private final static  String SSO_SAVE_ADDRESS_URL1 = LoadPropertiesSSO.readValue("SSO_SAVE_ADDRESS_URL1");
	private final static String REMOTE_ORDEROMS_URL = LoadProperties.readValue("REMOTE_ORDEROMS_URL");
	private final static String REMOTE_TICKET_URL = LoadProperties.readValue("remote_ticket_url");
	private static final String LOGISTICS_GET_SENTTYPE_URL = LoadProperties.readValue("logistics_get_senttype_url");
	private static final String ORDER_PAYMENT_URL = LoadProperties.readValue("order_payment_url");
	public static final String SSD_system = LoadProperties.readValue("SSD_system");
	private final Logger log = Logger.getLogger(this.getClass());
	
	/**
	 * 说明：组织订单页面的展示数据
	 * 
	 * @Methods Name orderConfirm
	 * @Create In 2013-9-1 Byzhaosh
	 * @param cart
	 * @param uid
	 * @param memberId
	 * @param m
	 * @return 
	 */
	private void prepareData(Model m, Cart cart, String uid, String memberId) {
		OrderVO order = this.cartService.getCart(cart.getCartId()).getOrderVO();
		Map<String, String> sendTypeMap = HttpClientUtilLogistics.getSentType(order);
		//调用物流查询的配送方式中包含货到付款
		if (sendTypeMap != null && sendTypeMap.containsKey("4")) {
			order.setCodFlag(true);
		}else{
			order.setCodFlag(false);
		}
		
		//获取会员地址薄
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("memberSid", memberId);
		paramMap.put("domainName", "www.shopin.net");
		String res = HttpClientUtilSSO.SSOUrlContent(SSO_GET_MEMBER_ADDRLIST_URL, paramMap);
		JSONObject addrJson = JSONObject.fromObject(res);
		//获取地址
		if (addrJson != null && !"-1".equals(addrJson.getString("result"))) {
			JSONArray addresslist = addrJson.getJSONArray("list");
			List listAddress = new ArrayList();
			this.log.info("调用sso查询会员地址薄接口返回结果：" + addresslist);
			//收货人地址最多显示六个，超过六个使用新地址按钮不显示
			if(addresslist.size()>6){
				listAddress.add(addresslist.get(addresslist.size()-1));
				listAddress.add(addresslist.get(addresslist.size()-2));
				listAddress.add(addresslist.get(addresslist.size()-3));
				listAddress.add(addresslist.get(addresslist.size()-4));
				listAddress.add(addresslist.get(addresslist.size()-5));
				listAddress.add(addresslist.get(addresslist.size()-6));
				m.addAttribute("addresslist",listAddress);
			}else{
				m.addAttribute("addresslist",addresslist);
			}
			m.addAttribute("addresslistsize",addresslist.size());
			m.addAttribute("addressFlag",addresslist.size()==0?"0":"1");
		}
		
		//获取收货人信息
		OrderVO ov = this.cartService.getCartOrder(cart.getCartId());
		if (StringUtils.isBlank(ov.getReceptName())) {
			List<MemberAddressVO> addressVOList = JsonUtilSSO.json2MemberAddresses(res);
			if (addressVOList != null && addressVOList.size()>0) {
				MemberAddressVO addressvo = addressVOList.get(0);
				this.cartService.saveCartAddress(cart.getCartId(), addressvo);
				
			}
		}
		
		//保存支付方式及配送方式
		ov = this.cartService.getCartOrder(cart.getCartId());
		if (StringUtils.isBlank(ov.getPaymentModeSid())) {
			OrderVO ordervo = new OrderVO();
			ordervo.setPaymentModeSid("1");
			ordervo.setSendType("1");
			ordervo.setPaymentModeName("在线支付");
			if (sendTypeMap != null) {
				ordervo.setSendTypeName(sendTypeMap.get(ordervo.getSendType()));
			}
			ordervo.setMemo("工作日、双休日与假日均可送货");
			//根据配送地址和配送方式调用物流接口获取邮费
			BigDecimal sendCostbd = HttpClientUtilLogistics.getSendCost(ov.getInceptCitySid(), ordervo.getSendType());
			String sendCost = null;
			if (sendCostbd != null) {
				sendCost = String.valueOf(sendCostbd);
				ordervo.setSendCost(sendCost);
				m.addAttribute("sendCost", new DecimalFormat("0.00").format(sendCostbd));
			}
			this.cartService.saveCartSendType(cart.getCartId(), ordervo);
		}
		
		//获取所有省份
		String provinces = "";
		try {
			provinces = HttpClientUtil.GetUrlContent(SSO_GET_PROVINCES_URL1, "UTF8");
			JSONObject provincesJson = JSONObject.fromObject(provinces);
			JSONArray provincelist = provincesJson.getJSONArray("data");
			m.addAttribute("provincelist",provincelist);
		} catch (JSONException je){
			this.log.error("调用sso获取省份返回结果不是json串,返回结果：" + provinces);
		}catch (Exception e) {
			this.log.error("调用sso获取省份返回错误！");
		}
		
		//获取配送方式,如果包含货到付款，则移掉(不用在页面显示)
		if (sendTypeMap != null && sendTypeMap.containsKey("4")) {
			sendTypeMap.remove("4");
		}
		m.addAttribute("sentTypeMap", sendTypeMap);
		
		ov = this.cartService.getCartOrder(cart.getCartId());
		m.addAttribute("order", ov);
		
		// 购物车中购买商品明细及数量、总金额
		List<CartItem> itemList = cart.getItemList();
		JSONObject cartJson = JSONObject.fromObject(cart);
		JSONArray cartItem =cartJson.getJSONArray("itemList");
		int saleTotalCount = 0;
		double saleTotalMoney = 0.0D;
		for(int i = 0;i<cartItem.size();i++){
			JSONObject saleProduct = cartItem.getJSONObject(i);
			int qty = saleProduct.getInt("qty");
			double promotionPrice = saleProduct.getDouble("promotionPrice");
			saleTotalCount = saleTotalCount + qty;
			saleTotalMoney = saleTotalMoney + promotionPrice*qty;
		}
		m.addAttribute("totalCount",saleTotalCount);
		m.addAttribute("totalMoney",new DecimalFormat("0.00").format(saleTotalMoney));
		m.addAttribute("cartItem", cartItem);		
		double sendCostMoney = order.getSendCost() == null ? 0.0D : Double.parseDouble(order.getSendCost());
		String orderamount = new DecimalFormat("0.00").format(saleTotalMoney + sendCostMoney);
		m.addAttribute("orderamount",orderamount);
		
		//判断各个区域是否有值
		m.addAttribute("validate_address", Boolean.valueOf(order.getReceptName() != null));
		m.addAttribute("validate_invoice", Boolean.valueOf(order.getInvoiceBit() != null));
		m.addAttribute("validate_send_pay_type", Boolean.valueOf(order.getSendType() != null));
		m.addAttribute("validate_productlist", Boolean.valueOf(!itemList.isEmpty()));

	}
	/**
	 * 说明 ：购物车结算跳转
	 * @param m
	 * @param cmbFlag
	 * @param cartId
	 * @param referer	域名
	 * @param uid
	 * @param cid
	 * @param req
	 * @param cartitems 购物车中选中商品的明细Sid
	 * @return
	 */


	@RequestMapping(value={"/order/confirm"}, method={RequestMethod.GET})
	public String confirmOrder(Model m, @CookieValue(value="cmbFlag", required=false) String cmbFlag, @CookieValue(value="shopin_sid", required=false) String cartId, @CookieValue(value="referer", required=false) String referer, @CookieValue(value="userTicket", required=false) String uid, @CookieValue(value="cid", required=false) String cid, HttpServletRequest req, @CookieValue(value="cart_item_details", required=false) String cartitems) {
		// 防止cookie拿不到，直接从request中传过来
		String itemdetails = req.getParameter("itemdetails");
		//处理异常状况
		if ((itemdetails == null) || ("".equals(itemdetails))) {
			return "redirect:/cart/show.html";
		}
		if (!WebUtil.validateStr(cartId)) {
			return "redirect:/order/confirm.html";
		}
		String memberId = null;
		if ((uid != null) && (this.securityService.isUserLogin(uid)))
		//memberId = this.securityService.getLoginUserId(uid).getMembersSid();
			memberId = this.securityService.getLoginUserId(uid).getSid();
		else {
			memberId = null;
			return "redirect:/login.html?forward=/order/confirm.html";
		}
		//Cart cart3 = this.cartService.getCart(cartId);
		//获取要结算的商品信息
		Cart cart = getsaleCart(cartId, uid, itemdetails);
		log.info("Cart = " + cart);
		if(cart == null) return "redirect:/cart/show.html";
		cart.setCartId(cartId);
		cart.getOrderVO().setMembersSid(memberId);
		if (cart.getItemList() == null || cart.getItemList().isEmpty()) {
			return "redirect:/index.html";
		}
		m.addAttribute("referer", referer);
		m.addAttribute("cid", cid);
		m.addAttribute("memberId",memberId);
		m.addAttribute("itemdetails",itemdetails);
		// 准备各项数据
		prepareData(m, cart, uid, memberId);
		return "cart/orderconfirm";
	}
	/**
	 * 说明： 根据省Sid获取省下的所有城市
	 * @param m
	 * @param req
	 * @return	map 
	 */
	@RequestMapping(value={"/order/getCities"}, method={RequestMethod.GET})
	public Map<String,Object> getCitiesByProvinceSid(Model m,HttpServletRequest req) {
		String provinceSid = req.getParameter("provinceSid");
		Map<String,Object> map = new HashMap<String,Object>();
		String url = SSO_GET_CITIES_URL+"?provinceSid="+provinceSid;
		String cities = HttpClientUtil.GetUrlContent(url, "UTF8");
		JSONObject citiesJson = JSONObject.fromObject(cities);
		this.log.info("调用sso查询城市接口返回结果：" + citiesJson);
		if(citiesJson.get("success").equals("true")){
			JSONArray citylist = citiesJson.getJSONArray("data");
			map.put("citylist",citylist);
			map.put("success", true);
		}else{
			map.put("success",false);
		}
		return map;
	}
	/**
	 * 说明： 保存新建和编辑的地址
	 * @param m
	 * @param req
	 * @param uid
	 * @return
	 */
	@RequestMapping(value={"/order/newAddress"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	public Map<String,Object> newAddress(Model m,HttpServletRequest req, @CookieValue(value="userTicket", required=false) String uid) {
		String name = req.getParameter("receptName");
		String province = req.getParameter("provinceName");
		String city = req.getParameter("cityName");
		String address = req.getParameter("address");
		String provinceSid = req.getParameter("provinceSid");
		String citySid = req.getParameter("citySid");
		String mobile = req.getParameter("phone");
		String mailCode = req.getParameter("mailCode");
		String sid = req.getParameter("sid");
		String memberId = null;
		if ((uid != null) && (this.securityService.isUserLogin(uid)))
			//memberId = this.securityService.getLoginUserId(uid).getMembersSid();
			memberId = this.securityService.getLoginUserId(uid).getSid();
		else {
			memberId = null;
		}
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("recipientName", name);
		paramMap.put("province", province);
		paramMap.put("provinceSid",provinceSid);
		paramMap.put("city", city);
		paramMap.put("citySid", citySid);
		paramMap.put("address", address);
		paramMap.put("mobile", mobile);
		paramMap.put("mailCode", mailCode);
		paramMap.put("memberSid", memberId);
		paramMap.put("sid", sid);
		paramMap.put("domainName", "www.shopin.net");
		Map<String,Object> map = new HashMap<String,Object>();
		String url = SSO_SAVE_ADDRESS_URL1;
		String res = HttpClientUtilSSO.SSOUrlContent(url, paramMap);
		JSONObject resJson = JSONObject.fromObject(res);
		this.log.info("调用sso新建或编辑会员地址接口返回结果：" + resJson);
		JSONObject addressJson = resJson.getJSONObject("address");
		m.addAttribute("addressFlag","1");
		sid = addressJson.getString("sid");
		map.put("sid",sid);
		if(resJson.get("result").equals("1")){
			map.put("success", true);
		}else{
			map.put("success",false);
		}
		return map;
	}
	/**
	 * 说明： 删除地址
	 * @param m
	 * @param req
	 * @param uid
	 * @return
	 */
	@RequestMapping(value={"/order/delAddress"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
	public Map<String,Object> delAddress(Model m,HttpServletRequest req, @CookieValue(value="userTicket", required=false) String uid) {
		String sid = req.getParameter("sid");
		String memberId = null;
		if ((uid != null) && (this.securityService.isUserLogin(uid)))
			//memberId = this.securityService.getLoginUserId(uid).getMembersSid();
			memberId = this.securityService.getLoginUserId(uid).getSid();
		else {
			memberId = null;
		}
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("sid", sid);
		paramMap.put("memberSid", memberId);
		paramMap.put("domainName", "www.shopin.net");
		Map<String,Object> map = new HashMap<String,Object>();
		String url = SSO_DEL_ADDRESS_URL1;
		String res = HttpClientUtilSSO.SSOUrlContent(url, paramMap);
		JSONObject resJson = JSONObject.fromObject(res);
		this.log.info("调用sso删除会员地址接口返回结果：" + resJson);
		if(resJson.get("result").equals("1")){
			map.put("success", true);
		}else{
			map.put("success",false);
		}
		return map;
	}
	/**
	 * 说明:保存支付方式和发送方式
	 * 
	 * @param m
	 * @param cartId
	 * @param order
	 * @return
	 */
	@RequestMapping(value="/order/savePayAndSendType", method={RequestMethod.POST,RequestMethod.GET})
	public String savePayAndSendType(Model m, @CookieValue(value="shopin_sid", required=false) String cartId, OrderVO order){

		if (!validateCartId(cartId)) {
			m.addAttribute("result", new AjaxMessageVO("0", "很抱歉，当前会话已经失效，请刷新页面"));
			return null;
		}

		Cart cart = this.cartService.getCart(cartId);
		OrderVO old = cart.getOrderVO();
		String cityId = old.getInceptCitySid();
	    if (!validateRequired(cityId)) {
	    	m.addAttribute("result", new AjaxMessageVO("0", "请先填写收货人信息"));
	    	return null;
	    }
	    
	    //货到付款
	  /*  if ("4".equals(order.getPaymentModeSid())) {
	    	m.addAttribute("result", new AjaxMessageVO("0", "选择支付方式失败，很抱歉，暂不支持" + old.getInceptCity() + "货到付款"));
	    	return null;
	    }*/
	    String sendTypeName = "";
	    if ("4".equals(order.getPaymentModeSid())) {
			sendTypeName = "由上品选择合适的配送方式";
		}else{
			Map<String, String> sentTypeMap = HttpClientUtilLogistics.getSentType(old);
			sendTypeName = sentTypeMap.get(order.getSendType());
		}
	    order.setSendTypeName(sendTypeName);
	    
	    BigDecimal sendCost = HttpClientUtilLogistics.getSendCost(cityId, order.getSendType());
	    if (sendCost != null) {
	    	order.setSendCost(sendCost.toString());
	    	m.addAttribute("sendCost", sendCost);
		}else{
			m.addAttribute("result", new AjaxMessageVO("0", "获取运费信息失败"));
			return null;
		}
	    //更新ordervo到购物车
	    this.cartService.saveCartSendType(cartId, order);
		m.addAttribute("result", new AjaxMessageVO("1", "填写支付和配送方式成功"));
		
		return null;
	}
	/**
	 * 说明： 保存选用的地址到cart
	 * @param m
	 * @param order
	 * @param cartId
	 * @return
	 */
	@RequestMapping(value={"/order/selectAddress"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	public String selectAddress(Model m, OrderVO order,@CookieValue(value="shopin_sid", required=false) String cartId){
		
		m.addAttribute("addressSid",order);
		MemberAddressVO address = new MemberAddressVO();
		address.setName(order.getReceptName());
		address.setAddress(order.getReceptAddress());
		address.setCityName(order.getInceptCity());
		address.setProvinceName(order.getInceptProvince());
		address.setPostcode(order.getInceptPostcode());
		address.setDeliCitySid(order.getInceptCitySid());
		address.setDeliProvinceSid(order.getInceptProvinceSid());
		address.setTel(order.getReceptPhone());
		address.setMobileTel(order.getReceptPhone());
		address.setFullAddress(order.getInceptProvince()+order.getInceptCity()+order.getReceptAddress());
		this.cartService.saveCartAddress(cartId, address);
		log.info("选择配送地址:"+order.getInceptProvince() + order.getInceptCity());
		//注意：参数inceptProvinceSid是传入到CARRIER_NAME里的
		String str="{\"SID\":\"\",\"CARRIER_NAME\":\""+order.getInceptProvinceSid()+"\",\"CANAL\":\"WEB\"}";
		String s = HttpUtil.HttpPostForLogistics(LOGISTICS_GET_SENTTYPE_URL, "GetDispatchInfoByDsid", str);
		log.info("修改配送地址后，获取的配送方式：" + s);
		if(StringUtils.isNotBlank(s) && s.contains("货到付款")){
			order.setCodFlag(true);
		}else{
			order.setCodFlag(false);
		}
		m.addAttribute("result", new AjaxMessageVO("1", "选择地址成功"));
		
		
		return null;
	}
	/**
	 * 说明：保存发票信息
	 * @param m
	 * @param order
	 * @param cartId
	 * @return
	 */
	@RequestMapping(value={"/order/saveInvoice"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	public String saveInvoice(Model m, OrderVO order,@CookieValue(value="shopin_sid", required=false) String cartId){
		m.addAttribute("order",order);
		this.cartService.saveCartInvoice(cartId, order);
		m.addAttribute("result", new AjaxMessageVO("1", "保存发票信息成功"));
		return null;
	}
	/**
	 * 说明: 删除购物车的的商品
	 * @param m
	 * @param uid
	 * @param cartId
	 * @param productDetailSid
	 * @return
	 */
	@RequestMapping(value={"/order/delProduct"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	public String delProduct(Model m,@CookieValue(value="userTicket", required=false) String uid, @CookieValue(value="shopin_sid", required=false) String cartId,String productDetailSid, @CookieValue(value="cart_item_details", required=false) String cartitems){
		this.cartService.delCartPro(cartId, productDetailSid, 0);
		this.cartService.delCartPro(uid, productDetailSid, 1);
		Cart cart = getsaleCart(cartId, uid, cartitems);
		if(cart == null){
			m.addAttribute("validate_productlist", false);
		}else{
			List<CartItem> itemList = cart.getItemList();
			m.addAttribute("validate_productlist", Boolean.valueOf(!itemList.isEmpty()));
		}
		m.addAttribute("result", new AjaxMessageVO("1", "删除商品成功"));
		return null;
	}
	/**
	 * 说明: 提交订单
	 * @param m
	 * @param uid
	 * @param cartId
	 * @param cid
	 * @param ltype
	 * @param ltypes
	 * @param ltinfo
	 * @param req
	 * @param cartitems
	 * @param pre_order_id
	 * @param sn
	 * @return
	 */
	@RequestMapping(value={"/order/commit"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
	public String commitOrder(Model m, @CookieValue(value="userTicket", required=false) String uid, @CookieValue(value="shopin_sid", required=false) String cartId, @CookieValue(value="cid", required=false) String cid, @CookieValue(value="LTYPE", required=false) String ltype, @CookieValue(value="LTYPES", required=false) String ltypes, @CookieValue(value="LTINFO", required=false) String ltinfo, HttpServletRequest req, @CookieValue(value="cart_item_details", required=false) String cartitems, @CookieValue(value="pre_order_id", required=false) String pre_order_id, String sn){
		// 防止cookie拿不到，直接从request中传过来
		String itemdetails = req.getParameter("itemdetails");
		if (!WebUtil.validateStr(cartId)) {
			m.addAttribute("result", new AjaxMessageVO("0", "很抱歉，当前会话已经失效，请刷新页面"));
			return null;
		}
		if(itemdetails.isEmpty()){
			m.addAttribute("result", new AjaxMessageVO("0", "购物车中已没有商品。"));
			return null;
		}
		Cart cart = getsaleCart(cartId,uid,itemdetails);
		if(cart == null){
			return "index.html";
		}
        
		OrderVO order = cart.getOrderVO();
		order.setExternalLinks(cid);
		order.setOrderSourceSid("0");
		order.setLtinfo(ltinfo);
		order.setLtype(ltype);
		order.setOrderSource(ltypes);
		MemberVO mvo = this.securityService.getLoginUserId(uid);
		//String membersSID = mvo.getMembersSid();
		String membersSID = mvo.getSid();
		String memberEmailName = mvo.getMemEmail();
		order.setMembersSid(membersSID);
		order.setOrderDetails(convertToOrderDetail(cart.getItemList()));
		String sendCost = order.getSendCost();
		if(StringUtils.isBlank(order.getReceptPhone())){
			m.addAttribute("result", new AjaxMessageVO("11", "提示：收货人信息中联系电话没有填写，请您填写完整！"));
			return null;
		}
		if (sendCost!= null && sendCost.indexOf(".") != -1) {
			
			sendCost = sendCost.substring(0, sendCost.indexOf("."));
		}
		order.setSendCost(sendCost);
		if ((sn != null) && (!"".equals(sn))) {
			order.setSn(sn);
			order.setBookFlag("3");
		}
		try{
			order.setFromWebVersion("1");
			log.info("网站传到oms系统的json串：" + DataUtil.converOrderVOToJson(order,memberEmailName));
			long start = System.currentTimeMillis();
			String newOrderJson = HttpUtil.HttpPostForLogistics(REMOTE_ORDEROMS_URL, "order/saveOrder", DataUtil.converOrderVOToJson(order,memberEmailName));
			long end = System.currentTimeMillis();
			log.info("oms 系统处理网站请求时间：" + (end - start)/1000 + " s ");
			log.info("提交订单结果："+newOrderJson);
			if (StringUtils.isNotBlank(newOrderJson)) {
				JSONObject jsonOrder = JSONObject.fromObject(newOrderJson);
				String successflag = (String)jsonOrder.get("success");
				if ("true".equals(successflag)){
					for (CartItem item : cart.getItemList()) {
						this.cartService.delCartPro(cartId, item.getSid(),0);
						this.cartService.delCartPro(uid, item.getSid(), 1);
					}
					JSONObject returnOrder = jsonOrder.getJSONObject("obj");
					String orderNo = returnOrder.getString("orderNo");
					m.addAttribute("result", new AjaxMessageVO("1", "保存订单成功"));
					m.addAttribute("orderNo", orderNo);
				}else{
					String memo = jsonOrder.getString("memo");
					m.addAttribute("result", new AjaxMessageVO("0",memo));
					try{
						JSONObject memoJson = JSONObject.fromObject(memo);
						if(memoJson.getString("proDetailSidList")!=null){
							JSONArray proDetailSidAry = memoJson.getJSONArray("proDetailSidList");
							JSONObject proDetail = proDetailSidAry.getJSONObject(0);
							String proDetailSid = proDetail.getString("proDetailSid");
							m.addAttribute("proDetailSid",proDetailSid);
							m.addAttribute("result", new AjaxMessageVO("0",memoJson.getString("message")));
						}else{
							m.addAttribute("result", new AjaxMessageVO("0",memo));
						}
					}catch(JSONException e){
						log.info("订单返回信息memo不可解析");
					}
				}
			}else{
				m.addAttribute("result", new AjaxMessageVO("0", "订单保存失败"));
			}
		}catch(OrderFailedException e){
			e.printStackTrace();
			m.addAttribute("result", new AjaxMessageVO("0", "订单保存失败"));
		}catch(Exception e){
			e.printStackTrace();
			m.addAttribute("result", new AjaxMessageVO("0", "系统错误,请稍后重试"));
		}
		return null;
	}
	/**
	 * 说明 :支付页面跳转
	 * @param m
	 * @param uid
	 * @param orderNo
	 * @param req
	 * @return
	 */
	@RequestMapping(value={"/orderPay/{orderNo}"}, method={RequestMethod.GET, RequestMethod.POST})
	public String orderPay(Model m, @CookieValue(value="userTicket", required=false) String uid,@CookieValue(value="shopin_sid", required=false) String cartId, @CookieValue(value="cart_item_details", required=false) String cartitems, @PathVariable("orderNo") String orderNo,HttpServletRequest req){
		if (!validateRequired(orderNo)) {
			return "redirect:/index.html";
		}
		String paramJson = "{'fromSystem':'web','orderNo':'"+orderNo+"'}";
		String orderJsonStr = HttpUtil.HttpPostForLogistics(REMOTE_ORDEROMS_URL, "order/getOrderByOrderNo", paramJson);
		log.info(orderJsonStr);
		JSONObject orderJson = JSONObject.fromObject(orderJsonStr);
		if(orderJson.getBoolean("success")){
			OrderVO order = (OrderVO)JSONObject.toBean((JSONObject)orderJson.get("obj"), OrderVO.class);
			JSONObject orderObj = orderJson.getJSONObject("obj");
			order.setPaymentModeSid(orderObj.getString("paymentTypeSid"));
			order.setSaleTotalSum(orderObj.getString("needSaleMoneySum"));
			order.setSendTypeName(orderObj.getString("sendTypeDesc"));
			order.setPaymentModeName(orderObj.getString("paymentTypeDesc"));
			String orderDetailJsonStr = HttpUtil.HttpPostForLogistics(REMOTE_ORDEROMS_URL, "orderDetail/selectOrderDetailListByOrderSid", paramJson);
			JSONObject orderDetailJson = JSONObject.fromObject(orderDetailJsonStr);
			log.info(orderDetailJson);
			if(orderDetailJson.getBoolean("success")){
				String detailList = orderDetailJson.getString("list");
				JSONArray detailJary = JSONArray.fromObject(detailList);
				for(int i = 0;i < detailJary.size();i++){
					JSONObject detailJson = detailJary.getJSONObject(i);
					OrderDetailVO detail = (OrderDetailVO)JSONObject.toBean(detailJson,OrderDetailVO.class);
					detail.setProName(detailJson.getString("productName"));
					order.getOrderDetails().add(detail);
				}
			}else{
				log.info("通过订单号查询订单明细失败！");
			}
			getPaymentType(m);
			log.info(order);
			
			prepareOrderPayData(m, uid, order);
		}else{
			log.info("通过订单号查询订单失败！");
		}
		
		
		return "buying/payment";
	}
	/**
	 * 调用支付接口获取支付方式，动态展示到支付页面上
	 * @param m
	 */
	public void getPaymentType(Model m){
		try{
			
			String paymentJsonStr = HttpUtil.HttpPostForLogistics(ORDER_PAYMENT_URL, "getPaymentTypeInfo.json", "");
			JSONObject paymentJson = JSONObject.fromObject(paymentJsonStr);
			log.info("调用支付接口返回结果为："+paymentJson);
			List<PayTypeVO> paymentTypeResult = new ArrayList<PayTypeVO>();
			if(paymentJson.getBoolean("success")){
				String paymentList = paymentJson.getString("paymentType");
				JSONArray paymentJary = JSONArray.fromObject(paymentList);
				for(int i=0;i<paymentJary.size();i++){
					PayTypeVO payTypeVO = new PayTypeVO();
					JSONObject bankJson = paymentJary.getJSONObject(i);
					payTypeVO.setSid(Long.parseLong(bankJson.getString("item")));
					payTypeVO.setName(bankJson.getString("itemDesc"));
					List<PaymentTypeDetail> paymentTypeList =new ArrayList<PaymentTypeDetail>();
					String bankList = bankJson.getString("payTypeList");
					JSONArray bankJary = JSONArray.fromObject(bankList);
					for(int j=0;j<bankJary.size();j++){
						JSONObject paymentBank = bankJary.getJSONObject(j);
						PaymentTypeDetail pdetail = new PaymentTypeDetail();
						pdetail.setSid(Long.parseLong(paymentBank.getString("payType")));
						pdetail.setFlag(paymentBank.getString("flag"));
						pdetail.setName(paymentBank.getString("flagDesc"));
						pdetail.setOrder(Integer.parseInt(paymentBank.getString("rowNumber")));
						paymentTypeList.add(pdetail);
						
					}
					payTypeVO.setPaymentTypeList(paymentTypeList);
					paymentTypeResult.add(payTypeVO);
				}
				//得到支付方式按顺序排序
				Collections.sort(paymentTypeResult, new  Comparator<PayTypeVO>(){
					public int compare(PayTypeVO p1, PayTypeVO p2) {
						return (int) (p1.getSid()-p2.getSid());
					}
				});
				m.addAttribute("paymentTypeResult", paymentTypeResult);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	/**
	 * 正常下单流程使用购物券时的验证
	 * @param m
	 * @param cartId
	 * @param uid
	 * @param order
	 * @param request
	 */
	@RequestMapping(value = "/order/verifyTicket",method = {RequestMethod.GET,RequestMethod.POST})
	public void verifyTicket(Model m, @CookieValue(value="shopin_sid", required=false) String cartId, @CookieValue(value="userTicket", required=false) String uid, OrderVO order, HttpServletRequest request){
		if (!validateCartId(cartId)) {
			m.addAttribute("result", new AjaxMessageVO("0", "很抱歉，当前会话已经失效，请刷新页面"));
			return;
		}

		log.info("=============== /order/verifyTicket === 开始校验优惠券 " );
		OrderVO old = this.cartService.getCartOrder(cartId);
		String cityId = old.getInceptCitySid();
		String payType = old.getPaymentModeSid();
		if (!validateRequired(cityId)) {
			m.addAttribute("result", new AjaxMessageVO("0", "请先填写收货人信息"));
			return;
		}
		if (!validateRequired(payType)) {
			m.addAttribute("result", new AjaxMessageVO("0", "请先选择支付方式"));
			return;
		}
		Map<String, String> paraMap = new HashMap<String, String>();
		paraMap.put("sn",order.getSn());
		paraMap.put("orderMoney", request.getParameter("orderMoney"));
		String isSnValidateJson = HttpUtil.HttpPost(REMOTE_TICKET_URL,"validateTicket.html",paraMap);
		log.info(REMOTE_TICKET_URL + "/validateTicket.html --> 返回的结果：isSnValidateJson = " + isSnValidateJson );
          
	if (StringUtils.isNotBlank(isSnValidateJson)) {
			JSONObject isSnValidate = JSONObject.fromObject(isSnValidateJson);
			String successflag = (String) isSnValidate.get("success");
			if(successflag!=null&&"true".equals(successflag)){
				String ticketDetailJson = HttpUtil.HttpPost(REMOTE_TICKET_URL,"getTicket.html",paraMap);
				JSONObject ticketDetail = JSONObject.fromObject(ticketDetailJson);
				String successflag2 = ticketDetail.getString("success");
				if(successflag2!=null&&"true".equals(successflag2)){
					TicketVO ticketVO = (TicketVO) JSONObject.toBean(ticketDetail.getJSONObject("ticket"), TicketVO.class);
					log.info("根据sn[" + order.getSn() + "]查询的ticket：" + ticketVO);
					String testPayJson = HttpUtil.HttpPostForLogistics(REMOTE_ORDEROMS_URL, "order/modifyBookFlag",
							"{'fromSystem':'web','orderNo':'" + request.getParameter("orderNo") + "','sn':'" + order.getSn() + "','usePrice':'" + ticketVO.getValue() + "'}");
					m.addAttribute("result",new AjaxMessageVO("1","购物券验证成功"));
					m.addAttribute("ticketValue",ticketVO.getValue());
					log.info("调用order/modifyBookFlag 返回结果：" + testPayJson);
					return;
				}else {
					m.addAttribute("result",new AjaxMessageVO("0","购物券验证失败"));
					return;
				}
			}else {
				m.addAttribute("result",new AjaxMessageVO("0","购物券验证失败"));
				return;
			}
		}else{
			m.addAttribute("result",new AjaxMessageVO("0","购物券验证失败"));
			return;
		}
	}
	
	private void prepareOrderPayData(Model m, String uid, OrderVO order) {
	    if ("4".equals(order.getPaymentModeSid())) {
	    	order.setPaymentModeName("货到付款");
			order.setSendTypeName("由上品选择合适的配送方式");
			order.setSendType("4");
		}else{
			order.setPaymentModeName("在线支付");
		}
	    order.setOrderStatusName(OldCodeUtil.getOrderStatusName(order));
	    order.setOrderClientStatus(OldCodeUtil.getOrderClientStatus(order));

	    List<OrderDetailVO> orderDetails = order.getOrderDetails();
		int saleSum = 0;
		for (OrderDetailVO orderDetailVO : orderDetails) {
			saleSum += Integer.parseInt(orderDetailVO.getSaleSum());
		}
	    order.setSaleTotalQty(saleSum+"");
	    // 支付方式
//	    List<PaymentTypeVO> paymentTypeList = paymentService.getAllPaymentTypes();
//	    m.addAttribute("paymentTypeList", paymentTypeList);
	    m.addAttribute("order", order);
	}
	
		
	/**
	 * 说明： 获取购物车中的顾客提交的商品
	 * @param cartId
	 * @param uid
	 * @param cartitems 顾客提交商品明细的Sid组合，例 ：23442|2352
	 * @return
	 */
	public Cart getsaleCart(String cartId,String uid,String cartitems){
		Map<String,List<CartItem>> map =this.cartService.getCartItemsMap(cartId, uid);
		List<CartItem> ptCart = map.get("0");//普通商品
		List<CartItem> sgCart = map.get("1");//闪购商品
		List<CartItem> cartItemList = new ArrayList<CartItem>();
		if (ptCart != null && !ptCart.isEmpty()) {
			cartItemList.addAll(ptCart);
		}
		if (sgCart != null && !sgCart.isEmpty()) {
			cartItemList.addAll(sgCart);
		}
		
		this.log.info("购物车中商品:"+map);
		Cart cart = this.cartService.getCart(cartId);
		if(cart == null){
			return null;
		}
		cart.setItemList(cartItemList);
		if (cart.getItemList() == null) {
			return null;
		}
		String[] str = cartitems.split("_");
		if ((str != null) && (str[0] != "")) {
			List<CartItem> newList = new ArrayList<CartItem>();
			List<CartItem> list = cart.getItemList();
			for (int i = 0; i < str.length; i++) {
				for (CartItem item : list) {
					if (item.getSid().equals(str[i])) {
						newList.add(item);
					}
				}
			}
			cart.setItemList(newList);
		}
		return cart;
	}
	 /**
	  * 说明：获取购物车中的商品明细列表
	  * @param list
	  * @return	
	  */
	private List<OrderDetailVO> convertToOrderDetail(List<CartItem> list) {
		List<OrderDetailVO> newList = new ArrayList<OrderDetailVO>();
		for (CartItem item : list) {
			OrderDetailVO detail = new OrderDetailVO();
			detail.setProDetailSid(item.getSid());
			detail.setProSku(item.getProSku());
			detail.setProName(item.getName());
			detail.setProSid(item.getProductSid());
			detail.setOriginalPrice(item.getOriginalPrice());
			detail.setCurrentPrice(item.getOriginalPrice());
			detail.setSalePrice(item.getPromotionPrice());
			detail.setProColor(item.getColor());
			detail.setProSize(item.getSize());
			detail.setSalePrice(item.getPromotionPrice());
			detail.setPromotionPrice(item.getPromotionPrice());
			detail.setSaleSum(item.getQty()+"");
			detail.setPositionId(item.getPositionId());
			detail.setProColorName(item.getColor());
			detail.setProPicture(item.getProPicture());
			detail.setChannelId(item.getChannelId());
			detail.setShopPrice(item.getShopPrice());
			log.info("从购物车中获取传递进来shopPrice值为："+item.getShopPrice());
			if ("10".equals(item.getActivityFlg())) {
				//闪购商品
				detail.setQuickBuyBit("1"); 
			}else{
				detail.setQuickBuyBit("0");
			}
			newList.add(detail);
		}
		return newList;
	}
	/**
	 * 说明： 
	 * @param cartId
	 * @return
	 */
	private boolean validateCartId(String cartId) {
		return validateRequired(cartId);
	}

	private boolean validateRequired(String str) {
		return (str != null) && (!"".equals(str));
	}
	
	
	/**
	 * 货到付款的订单在支付方式页面填写优惠券后跳转到成功页面
	 * @return
	 */
	@RequestMapping(value={"/order/toSuccess"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
	public String toSuccess(Model m, @CookieValue(value="userTicket", required=false) String uid, @CookieValue(value="shopin_sid", required=false) String cartId, @CookieValue(value="cart_item_details", required=false) String cartitems, @RequestParam("orderNo") String orderNo){
		Map parmMap = new HashMap();
		parmMap.put("size", 4);
		String proDetailJsonStr = HttpUtil.HttpPost(SystemConstants.SSD_system, "/web/randomProducts.html", parmMap);
		JSONObject proDetailJson = JSONObject.fromObject( "{'prodetaillist':"+proDetailJsonStr+"}");
		log.info("调用web/randomProducts.html查询商品推荐信息返回参数结果为proDetailJsonStr"+proDetailJsonStr);
		 JSONArray array = proDetailJson.getJSONArray("prodetaillist");
		 List WebProductVOList = new ArrayList();
	        for (int i = 0; i < array.size(); i++) {
	        	WebProductVO wdv = new WebProductVO();
	          JSONObject jb = array.getJSONObject(i);
	          wdv.setId(jb.getString("id"));
	          wdv.setProductImages(jb.getString("productImages"));
	          wdv.setProCurPrice(jb.getString("proCurPrice"));
	          wdv.setProductName(jb.getString("productName"));
	          wdv.setOffValue(Double.parseDouble(jb.getString("offValue")));
	          WebProductVOList.add(wdv);
	        }
	        m.addAttribute("webProductVOList", WebProductVOList);
	        OrderVO  ordervo =  OrderUtil.getOrderByNO(orderNo, true);
	        log.info("选择支付成功后，根据订单号查询到的订单：" + ordervo);
	        m.addAttribute("order", ordervo);
		return "pay/paySucess";
	}

	@RequestMapping(value={"/order/toPay"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
	public String toPay(Model m,
			@RequestParam("orderNo") String orderNo,
			@RequestParam("payment") Integer payment,
			@RequestParam("defaultBank") String defaultBank,
			HttpServletRequest req) {
		
		OrderVO orderVo = OrderUtil.getOrderByNO(orderNo, false);
	    this.log.info("根据订单号查询订单返回结果为：" + orderVo);
	    if ((orderVo != null) && ("1".equals(orderVo.getOrderStatus())))
	    {
	      defaultBank = ("undefined".equals(defaultBank)) ? "" : defaultBank;
	      String jsonStr = HttpUtil.HttpPostForLogistics(REMOTE_ORDEROMS_URL, "order/modifyPaymentType", 
	        "{'fromSystem':'WEB','orderNo':'" + orderNo + "','paymentTypeSid':'" + payment + "','defaultBank':'" + defaultBank + "'}");
	      JSONObject localJSONObject = JSONObject.fromObject(jsonStr);
	     String privateKey=LoadProperties.readValue("privateKey");
	      String sign=DigestUtil.hmacSign(orderNo, privateKey);
	      return "redirect:"+ORDER_PAYMENT_URL+"/pay.html?orderNo="+ orderNo+"&payTypeSid="+payment.intValue()+"&sign="+sign;
	    }else{
	    	return "pay/payFail";
	    }
	   /* switch (payment.intValue()) {
			case 3:
				// 支付宝
				return "redirect:/toAlipay.html?orderNo=" + orderNo;
			case 7:
				// 工行网银
				return "redirect:/toIcbcBank.html?time=1015&orderNo=" + orderNo;
			case 10:
				// 财付通
				return "redirect:/toTenpay.html?time=1015&orderNo=" + orderNo;
			case 11:
				// 支付宝工行
				return "redirect:/toIcbcBank.html?time=1015&orderNo=" + orderNo;
			case 13:
				// 招行网银
				return "redirect:/toCmbPay.html?orderNo=" + orderNo;
			case 14:
				// 银联支付
				return "redirect:/toChinaPayEasement.html?orderNo=" + orderNo;
			case 15:
				// 易宝支付
				return "redirect:/toYeePay.html?orderNo=" + orderNo;
			case 17:
				// 支付宝信用卡快捷支付
				return "redirect:/toAlipaykj.html?orderNo=" + orderNo;
			case 18:
				// 找人代付
				return "redirect:/toAlipaykj.html?orderNo=" + orderNo;
			case 19:
				// 支付宝借记卡快捷支付
				return "redirect:/toAlipaykj.html?orderNo=" + orderNo;
				// 手机支付宝支付
			case 20:
			case 21:
			case 22:
			case 23:
			case 24:
				return "redirect:/toCMPay.html?sid=" + orderNo;
			case 26:
				return "redirect:/toAlipaykj.html?orderNo=" + orderNo + "&type=26";
			case 27:
				return "redirect:/toTenpayWX.html?time=1015&orderNo=" + orderNo;
			default:
				return "pay/payFail";
			}*/
	}
	/**
	 * 模拟支付成功
	 * @return
	 */
	@RequestMapping(value={"/order/testPayOrder"}, method={org.springframework.web.bind.annotation.RequestMethod.GET})
	public String testPayOrder(Model m, @CookieValue(value="userTicket", required=false) String uid, @CookieValue(value="shopin_sid", required=false) String cartId, @CookieValue(value="cart_item_details", required=false) String cartitems, @RequestParam("orderNo") String orderNo){
		
		String orderJsonStr = HttpUtil.HttpPostForLogistics(REMOTE_ORDEROMS_URL, "order/getOrderByOrderNo",
				"{'fromSystem':'WEB','orderNo':'" + orderNo + "'}");
		String testPayJson = HttpUtil.HttpPostForLogistics(REMOTE_ORDEROMS_URL, "pay/payOrder",
				"{'fromSystem':'WEB','orderNo':'" + orderNo + "','tradeNo':'2323','totalFee':'50','discount':'0'}");
		log.info("支付返回信息："+testPayJson);
		JSONObject orderJson = JSONObject.fromObject(orderJsonStr);
		JSONObject orderObj = null;
		if (orderJson.getBoolean("success")) {
			orderObj = orderJson.getJSONObject("obj");
			OrderVO ordervo = DataConvertUtil.convertJsonToBean(OrderVO.class, orderObj+"", new HashMap());
		    
			ordervo.setPaymentModeName(orderObj.getString("paymentTypeDesc"));
			ordervo.setSendTypeName(orderObj.getString("sendTypeDesc"));
			ordervo.setSaleTotalSum(orderObj.getString("needSaleMoneySum"));
			m.addAttribute("order", ordervo);
		}
		return "pay/paySucess";
	}
}
