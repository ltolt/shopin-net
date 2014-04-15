/**
 * @Probject Name: web
 * @Path:  net.shopin.web.payController.TenPayWeChatController.java
 * @Create By kongm
 * @Create In 2013-12-27 下午4:29:25
 * TODO
 */
package net.shopin.web.payController;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.shopin.view.OrderVO;
import net.shopin.view.WebProductVO;
import net.shopin.web.conf.BankConf;
import net.shopin.web.tenpay.MD5Util;
import net.shopin.web.tenpay.PayRequestHandler;
import net.shopin.web.tenpay.PayResponseHandler;
import net.shopin.web.tenpay.RequestHandler;
import net.shopin.web.util.OrderPaymentUtil;
import net.shopin.web.util.OrderUtil;
import net.shopin.web.util.PreUtil;
import net.shopin.web.util.SystemConstants;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 说明: 财付通微信支付
 * 
 * @Class Name TenPayWeChatController
 * @Author kongm
 * @Create In 2013-12-27
 */
@Controller
public class TenPayWeChatController {

	@Autowired
	BankConf bankConf;

	/**
	 * 说明: 财付通微信扫码支付跳转controller
	 * 
	 * @Methods Name toTenpayWX
	 * @Create In 2014-1-2 By kongm
	 * @param m
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 *             String
	 */
	@RequestMapping(value = "/toTenpayWX", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String toTenpayWX(Model m, HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {

		OrderVO ordersVO = OrderUtil.getOrderByNO(
				request.getParameter("orderNo"), false);
		// 校验订单状态,是否已经付款,缺少
		if (!"1".equals(ordersVO.getOrderStatus())) {
			return "redirect:" + SystemConstants.SSO_URL
					+ "/myshopin/vieworders.html?orderNo="
					+ ordersVO.getOrderNo() + "&status=view";
		}

		// 创建PayRequestHandler实例
		PayRequestHandler reqHandler = new PayRequestHandler(request, response);
		// 微信支付的网关
		reqHandler.setGateUrl(bankConf.getWxGateWay());
		// 设置密钥
		reqHandler.setKey(bankConf.getTenpayWXKey());
		// 初始化
		// reqHandler.init();
		// 总金额
		double totalfee = ordersVO.getNeedSaleMoneySum().doubleValue() * 100;
		reqHandler.setParameter("partner", "1217016901");
		reqHandler.setParameter("return_url",
				bankConf.getTenpayWXVerifyURL()); // 支付通知url
		reqHandler.setParameter("notify_url",
				bankConf.getTenpayWXNotifyURL());
		reqHandler.setParameter("out_trade_no", ordersVO.getOrderNo());
		reqHandler.setParameter("body", ordersVO.getOrderNo()); // 商品名称
		reqHandler.setParameter("total_fee", (int) Math.ceil(totalfee) + ""); // 商品金额,以分为单位
		reqHandler.setParameter("fee_type", "1");
		// 微信支付传参
		reqHandler.setParameter("bank_type", "WX");
		// reqHandler.setParameter("spbill_create_ip", request.getRemoteAddr());
		reqHandler.setParameter("spbill_create_ip", "172.16.100.198");

		// 获取微信网关跳转链接
		String requestUrl = reqHandler.getWXRequestURL();
		System.out.println(requestUrl);
		return "redirect:" + requestUrl;

	}

	/**
	 * 说明: 财富通扫码支付同步return_url
	 * 
	 * @Methods Name tenpayWXVerify
	 * @Create In 2014-1-2 By kongm
	 * @param m
	 * @param request
	 * @param response
	 * @return String
	 */
	@RequestMapping(value = "/tenpayWXVerify", method = { RequestMethod.GET,
			RequestMethod.POST })
	public String tenpayWXVerify(Model m, HttpServletRequest request,
			HttpServletResponse response) {
		String returnPage = "";
		// 创建PayResponseHandler实例
		PayResponseHandler resHandler = new PayResponseHandler(request,
				response);
		resHandler.setKey(bankConf.getTenpayWXKey());
		// 判断签名
		if (resHandler.isTenpayWXSign()) {
			// 交易单号
			String transaction_id = resHandler.getParameter("transaction_id");
			// 金额金额,以分为单位
			String total_fee = resHandler.getParameter("total_fee");
			total_fee = Integer.parseInt(total_fee) / 100 + "";
			// String total_fee = "500";
			String orderNO = resHandler.getParameter("out_trade_no");
			// String orderNO = "20100324000020";
			String tradeNo = resHandler.getParameter("transaction_id");
			// 支付结果
			String trade_state = resHandler.getParameter("trade_state");

			if ("0".equals(trade_state)) {

				OrderPaymentUtil.orderPayment(orderNO, total_fee, tradeNo, "0");
				// modify by guanshiqiang for orderService项目迁移 at 2013-04-25
				// begin
				// OrderVO orderVO = orderService.getOrderByNO(orderNO);
				OrderVO orderVO = OrderUtil.getOrderByNO(orderNO, true);
				// modify by guanshiqiang for orderService项目迁移 at 2013-04-25 end
				// 获取商品推荐列表
				List<WebProductVO> webProductVOList = OrderUtil.getTJProducts();
				m.addAttribute("webProductVOList", webProductVOList);
				m.addAttribute("order", orderVO);
				returnPage = "pay/paySucess";
				returnPage = PreUtil.getReturnPage(
						m,
						request,
						orderVO,
						returnPage,
						(orderVO.getBookFlag() != null && orderVO.getBookFlag()
								.trim().length() > 0) ? Integer.valueOf(orderVO
								.getBookFlag()) : -1);

				// 调用doShow, 打印meta值跟js代码,告诉财付通处理成功,并在用户浏览器显示$show页面.
				// resHandler.doShow("http://localhost:8080/tenpay/show.jsp");
			} else {
				// 当做不成功处理
				System.out.println("支付失败");
				returnPage = "pay/payFail";
			}
		} else {
			System.out.println("认证签名失败");
			returnPage = "pay/payFail";
			// String debugInfo = resHandler.getDebugInfo();
			// System.out.println("debugInfo:" + debugInfo);
		}
		return returnPage;
	}

	
	/**
	 * 说明: 财付通微信扫码支付异步通知接口
	 * @Methods Name tenpayWXNotify
	 * @Create In 2014-1-2 By kongm
	 * @param m
	 * @param request
	 * @param response void
	 */
	@RequestMapping(value = "/tenpayWXNotify", method = { RequestMethod.GET,
			RequestMethod.POST })
	public  void tenpayWXNotify(Model m, HttpServletRequest request,
			HttpServletResponse response) {
		PayResponseHandler resHandler = new PayResponseHandler(request,
				response);
		resHandler.setKey(bankConf.getTenpayWXKey());
		// 判断签名
		if (resHandler.isTenpayWXSign()) {
			//获取订单号
			String orderNO = resHandler.getParameter("out_trade_no");
			OrderVO ordersVO = OrderUtil.getOrderByNO(
					orderNO, false);
			int status = Integer.parseInt(ordersVO.getOrderStatus());
			if(status > 1){
				try {
					System.out.println("rewrite success to wx " + new Date().toString());
					response.getWriter().write("success");
					response.getWriter().flush();
				} catch (IOException e) {
					e.printStackTrace();
				}
				return;
			}else if(status == 1){
				
				// 交易单号
				String transaction_id = resHandler.getParameter("transaction_id");
				// 金额金额,以分为单位
				String total_fee = resHandler.getParameter("total_fee");
				total_fee = Integer.parseInt(total_fee) / 100 + "";
				// String total_fee = "500";
				// String orderNO = "20100324000020";
				String tradeNo = resHandler.getParameter("transaction_id");
				// 支付结果
				String trade_state = resHandler.getParameter("trade_state");
				if ("0".equals(trade_state)) {

					OrderPaymentUtil.orderPayment(orderNO, total_fee, tradeNo, "0");
					// modify by guanshiqiang for orderService项目迁移 at 2013-04-25
					// begin
					// OrderVO orderVO = orderService.getOrderByNO(orderNO);
					// modify by guanshiqiang for orderService项目迁移 at 2013-04-25 end

					// 调用doShow, 打印meta值跟js代码,告诉财付通处理成功,并在用户浏览器显示$show页面.
					// resHandler.doShow("http://localhost:8080/tenpay/show.jsp");
				} else {
					// 当做不成功处理
					System.out.println("支付失败");
				}
			}

			
		}
		
	}
	
	
	/**
	 * 说明: integration test
	 * 
	 * @Methods Name main
	 * @Create In 2014-1-2 By kongm
	 * @param args
	 *            void
	 */
	public static void main(String[] args) {
		RequestHandler handler = new RequestHandler();
		handler.setGateUrl("https://gw.tenpay.com/gateway/pay.htm");
		handler.setKey("21a41e9fd5ff3d8e3835a95b3fe7bf3f");
		handler.setParameter("partner", "1217016901");
		handler.setParameter("return_url",
				"http://www.shopin.net/tenpayWXVerify.html"); // 支付通知url
		handler.setParameter("notify_url",
				"http://www.shopin.net/tenpayWXNotify.html");
		handler.setParameter("out_trade_no", "20140102462056");
		handler.setParameter("body", "20140102462056"); // 商品名称
		handler.setParameter("total_fee", 1 + ""); // 商品金额,以分为单位
		handler.setParameter("fee_type", "1");
		handler.setParameter("bank_type", "WX");
		handler.setParameter("spbill_create_ip", "172.16.100.198");
		String url = handler.getWXRequestURL();
		System.out.println(url);
		// --------------return_url 加密测试
		String queryString = "bank_billno=201401021230817&bank_type=CMB_FP&discount=0&fee_type=1&input_charset=GBK&notify_id=xFhWUPdQ7Bm3EFsTav5XDCvhrSfeiibOwAHgEQD8xE6YUTf__xinl6Z4oP3nFQwn5Z__kadPMAxweqbMLMHZ0JwiPo3ZZA0t&out_trade_no=20140102462056&partner=1217016901&product_fee=1&sign_type=MD5&time_end=20140102155311&total_fee=1&trade_mode=1&trade_state=0"
				+ "&transaction_id=1217016901201401020434033927&transport_fee=0&key=21a41e9fd5ff3d8e3835a95b3fe7bf3f";
		String sign = MD5Util.MD5Encode(queryString, "GBK").toUpperCase();
		System.out.println(sign);

	}

}
